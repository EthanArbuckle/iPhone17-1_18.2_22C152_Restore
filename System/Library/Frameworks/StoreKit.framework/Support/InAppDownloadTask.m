@interface InAppDownloadTask
- (InAppDownloadStatus)status;
- (InAppDownloadTask)initWithDownloadID:(id)a3 info:(id)a4 bundleID:(id)a5 containerID:(id)a6;
- (NSNumber)downloadID;
- (NSString)bundleID;
- (NSString)logKey;
- (id)_bomInstallFromPath:(id)a3 withError:(id *)a4;
- (id)statusBlock;
- (void)_bomInstall;
- (void)_downloadedBytes:(int64_t)a3 expectedBytes:(int64_t)a4;
- (void)_finalizeTaskWithError:(id)a3;
- (void)_install;
- (void)_sendDownloadStatus;
- (void)_updateDownloadStatus:(id)a3;
- (void)cancel;
- (void)main;
- (void)pause;
- (void)setBundleID:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation InAppDownloadTask

- (InAppDownloadTask)initWithDownloadID:(id)a3 info:(id)a4 bundleID:(id)a5 containerID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)InAppDownloadTask;
  v13 = [(Task *)&v19 init];
  if (v13)
  {
    if ([v11 count])
    {
      uint64_t v14 = +[NSUUID lib_shortLogKey];
      v15 = *(void **)(v13 + 138);
      *(void *)(v13 + 138) = v14;

      objc_storeStrong((id *)(v13 + 162), a5);
      objc_storeStrong((id *)(v13 + 50), a4);
      objc_storeStrong((id *)(v13 + 130), a3);
      v16 = [[InAppDownloadStatus alloc] initWithDownloadID:*(void *)(v13 + 130)];
      v17 = *(void **)(v13 + 154);
      *(void *)(v13 + 154) = v16;
    }
    else
    {
      v17 = v13;
      v13 = 0;
    }
  }
  return (InAppDownloadTask *)v13;
}

- (void)main
{
  v3 = [(InAppDownloadTask *)self logKey];
  v4 = objc_msgSend(*(id *)((char *)&self->_assetPromise + 2), "tcr_urlForKey:", @"URL");
  if (!v4)
  {
    ASDErrorWithDescription();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_1003A07F8 != -1) {
      dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
    }
    if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
      sub_1002CAC58();
    }
    goto LABEL_19;
  }
  v5 = objc_msgSend(*(id *)((char *)&self->_assetPromise + 2), "tcr_numberForKey:", @"file-size");
  id v6 = [v5 unsignedLongLongValue];

  v7 = NSOpenStepRootDirectory();
  unsigned __int8 v8 = +[DiskSpaceManager ensureAvailableDiskSpace:v6 atPath:v7];

  if ((v8 & 1) == 0)
  {
    ASDErrorWithDescription();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_1003A07F8 != -1) {
      dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
    }
    if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
      sub_1002CAC58();
    }
LABEL_19:
    [(InAppDownloadTask *)self _finalizeTaskWithError:v12];
    goto LABEL_37;
  }
  v9 = [[InAppDownloadTimeEstimator alloc] initWithMaxValue:v6];
  id v10 = *(InAppDownloadStatus **)((char *)&self->_pendingDownloadStatus + 2);
  *(InAppDownloadStatus **)((char *)&self->_pendingDownloadStatus + 2) = (InAppDownloadStatus *)v9;

  id v11 = objc_msgSend(*(id *)((char *)&self->_assetPromise + 2), "tcr_arrayForKey:", @"sinfs");
  v47 = [v11 firstObject];

  v46 = objc_msgSend(v47, "tcr_dataForKey:", @"dpInfo");
  id v55 = 0;
  v49 = [[DecryptDataConsumer alloc] initWithDPInfo:v46 error:&v55];
  id v12 = v55;
  if (v49)
  {
    v48 = objc_msgSend(*(id *)((char *)&self->_assetPromise + 2), "tcr_dictionaryForKey:", @"chunks");
    v44 = objc_msgSend(v48, "tcr_arrayForKey:", @"hashes");
    v43 = objc_msgSend(v48, "tcr_arrayForKey:", @"clearHashes");
    v13 = objc_msgSend(v48, "tcr_numberForKey:", @"chunkSize");
    id v14 = [v13 unsignedIntValue];

    if (v44 && v43)
    {
      v45 = objc_alloc_init(ChunkedDigest);
      [(ChunkedDigest *)v45 setChunkDigests:v44];
      [(ChunkedDigest *)v45 setChunkSize:v14];
      [(ChunkedDigest *)v45 setChunkType:0];
      [(DecryptDataConsumer *)v49 setDigest:v45];
      v39 = [v4 lastPathComponent];
      v40 = +[NSFileManager defaultManager];
      v15 = objc_msgSend(v40, "sk_downloadURL");
      v16 = [(InAppDownloadTask *)self downloadID];
      v17 = [v16 stringValue];
      v18 = [v15 URLByAppendingPathComponent:v17 isDirectory:1];

      objc_super v19 = [v18 path];
      id v20 = objc_msgSend(v40, "lib_ensureDirectoryExistsAtPath:", v19);

      v38 = [v18 URLByAppendingPathComponent:v39 isDirectory:0];

      v21 = [v38 path];
      v22 = *(NSDictionary **)((char *)&self->_downloadInfo + 2);
      *(NSDictionary **)((char *)&self->_downloadInfo + 2) = v21;

      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      v23 = off_100399E08;
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(AssetRequest **)((char *)&self->_downloadInfo + 2);
        *(_DWORD *)buf = 138543618;
        v57 = v3;
        __int16 v58 = 2114;
        v59 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Downloading payload to: %{public}@", buf, 0x16u);
      }
      v42 = objc_alloc_init(ChunkedDigest);
      [(ChunkedDigest *)v42 setChunkDigests:v43];
      [(ChunkedDigest *)v42 setChunkSize:v14];
      [(ChunkedDigest *)v42 setChunkType:0];
      v41 = [[FileWriteStreamAdapter alloc] initWithDownloadPath:*(NSDictionary **)((char *)&self->_downloadInfo + 2)];
      [(FileWriteStreamAdapter *)v41 setLogKey:v3];
      [(FileWriteStreamAdapter *)v41 setDigest:v42];
      [(DecryptDataConsumer *)v49 setStreamAdapter:v41];
      v25 = objc_alloc_init(AssetRequestProperties);
      [(AssetRequestProperties *)v25 setDataConsumer:v49];
      [(AssetRequestProperties *)v25 setLogKey:v3];
      v26 = [(InAppDownloadTask *)self bundleID];
      [(AssetRequestProperties *)v25 setNetworkBudgetingIdentifier:v26];

      [(AssetRequestProperties *)v25 setTaskPriority:&off_100373C80];
      [(AssetRequestProperties *)v25 setQosClass:25];
      [(AssetRequestProperties *)v25 setRequestReason:5];
      v27 = [[AssetRequest alloc] initWithURL:v4 properties:v25];
      [(AssetRequest *)v27 setCachePolicy:1];
      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      v28 = off_100399E08;
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v57 = v3;
        __int16 v58 = 2114;
        v59 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Downloading asset for request: %{public}@", buf, 0x16u);
      }
      v29 = self;
      objc_sync_enter(v29);
      v30 = +[AssetSession defaultSession];
      uint64_t v31 = [v30 assetPromiseWithRequest:v27];
      v32 = *(void **)(&v29->super._finished + 1);
      *(void *)(&v29->super._finished + 1) = v31;

      objc_sync_exit(v29);
      uint64_t v33 = +[NSTimer timerWithTimeInterval:v29 target:"_sendDownloadStatus" selector:0 userInfo:1 repeats:1.0];
      v34 = *(NSString **)((char *)&v29->_installPath + 2);
      *(NSString **)((char *)&v29->_installPath + 2) = (NSString *)v33;

      v35 = +[NSRunLoop mainRunLoop];
      [v35 addTimer:*(NSString **)((char *)&v29->_installPath + 2) forMode:NSRunLoopCommonModes];

      objc_initWeak((id *)buf, v29);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10009BDEC;
      v53[3] = &unk_10035A8A0;
      objc_copyWeak(&v54, (id *)buf);
      [*(id *)(&v29->super._finished + 1) setProgress:v53];
      v36 = *(void **)(&v29->super._finished + 1);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10009BE44;
      v50[3] = &unk_10035A8C8;
      objc_copyWeak(&v52, (id *)buf);
      id v51 = v3;
      [v36 addFinishBlock:v50];

      objc_destroyWeak(&v52);
      objc_destroyWeak(&v54);
      objc_destroyWeak((id *)buf);

      uint64_t v37 = (uint64_t)v12;
    }
    else
    {
      v45 = +[NSString stringWithFormat:@"No hashes in download info"];
      uint64_t v37 = ASDErrorWithDescription();

      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
        sub_1002CAC58();
      }
      [(InAppDownloadTask *)self _finalizeTaskWithError:v37];
    }

    id v12 = (id)v37;
  }
  else
  {
    if (qword_1003A07F8 != -1) {
      dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
    }
    if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
      sub_1002CACC0();
    }
    [(InAppDownloadTask *)self _finalizeTaskWithError:v12];
  }

LABEL_37:
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(InAppDownloadTask *)v2 status];
  if ([v3 state] == (id)1)
  {
  }
  else
  {
    v4 = [(InAppDownloadTask *)v2 status];
    id v5 = [v4 state];

    if (v5 != (id)2) {
      goto LABEL_12;
    }
  }
  if (*(void *)(&v2->super._finished + 1))
  {
    if (!BYTE2(v2->_timeEstimator))
    {
      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      id v6 = off_100399E08;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(InAppDownloadTask *)v2 logKey];
        *(_DWORD *)buf = 138543362;
        id v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling download", buf, 0xCu);
      }
    }
    v8.receiver = v2;
    v8.super_class = (Class)InAppDownloadTask;
    [(InAppDownloadTask *)&v8 cancel];
    [*(id *)(&v2->super._finished + 1) cancel];
  }
LABEL_12:
  objc_sync_exit(v2);
}

- (void)pause
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(InAppDownloadTask *)v2 status];
  id v4 = [v3 state];

  if (v4 == (id)1)
  {
    if (qword_1003A07F8 != -1) {
      dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
    }
    id v5 = off_100399E08;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(InAppDownloadTask *)v2 logKey];
      int v7 = 138543362;
      objc_super v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pausing download", (uint8_t *)&v7, 0xCu);
    }
    BYTE2(v2->_timeEstimator) = 1;
  }
  objc_sync_exit(v2);

  [(InAppDownloadTask *)v2 cancel];
}

- (void)_downloadedBytes:(int64_t)a3 expectedBytes:(int64_t)a4
{
  double v5 = (double)a4;
  if ((double)a4 < 1.0) {
    double v5 = 1.0;
  }
  double v6 = (double)a3 / v5 * 0.8;
  [*(id *)((char *)&self->_pendingDownloadStatus + 2) setCurrentValue:a3];
  int v7 = [InAppDownloadStatus alloc];
  objc_super v8 = [(InAppDownloadTask *)self downloadID];
  v9 = [(InAppDownloadStatus *)v7 initWithDownloadID:v8];

  [(InAppDownloadStatus *)v9 setState:1];
  [(InAppDownloadStatus *)v9 setProgress:v6];
  [*(id *)((char *)&self->_pendingDownloadStatus + 2) estimatedTimeRemaining];
  -[InAppDownloadStatus setTimeRemaining:](v9, "setTimeRemaining:");
  [(InAppDownloadTask *)self _updateDownloadStatus:v9];
}

- (void)_finalizeTaskWithError:(id)a3
{
  id v4 = a3;
  if (qword_1003A07F8 != -1) {
    dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
  }
  double v5 = off_100399E08;
  if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    int v7 = [(InAppDownloadTask *)self logKey];
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finalizing download task", buf, 0xCu);
  }
  [*(id *)((char *)&self->_installPath + 2) invalidate];
  if (BYTE2(self->_timeEstimator)) {
    goto LABEL_15;
  }
  if (*(NSDictionary **)((char *)&self->_downloadInfo + 2))
  {
    objc_super v8 = +[NSFileManager defaultManager];
    unsigned int v9 = [v8 fileExistsAtPath:*(NSDictionary **)((char *)&self->_downloadInfo + 2)];

    if (v9)
    {
      id v10 = +[NSFileManager defaultManager];
      uint64_t v11 = *(uint64_t *)((char *)&self->_downloadInfo + 2);
      id v16 = 0;
      [v10 removeItemAtPath:v11 error:&v16];
      id v12 = v16;

      if (v12)
      {
        if (qword_1003A07F8 != -1) {
          dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
        }
        if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
          sub_1002CAEA0();
        }
      }
    }
  }
  if (BYTE2(self->_timeEstimator))
  {
LABEL_15:
    v13 = [(InAppDownloadTask *)self status];
    [(InAppDownloadStatus *)v13 setState:2];
  }
  else
  {
    id v14 = [InAppDownloadStatus alloc];
    v15 = [(InAppDownloadTask *)self downloadID];
    v13 = [(InAppDownloadStatus *)v14 initWithDownloadID:v15];

    [(InAppDownloadStatus *)v13 setProgress:1.0];
    [(InAppDownloadStatus *)v13 setTimeRemaining:0.0];
    if (v4)
    {
      [(InAppDownloadStatus *)v13 setState:4];
      [(InAppDownloadStatus *)v13 setError:v4];
    }
    else
    {
      [(InAppDownloadStatus *)v13 setState:3];
      [(InAppDownloadStatus *)v13 setInstallPath:*(NSString **)((char *)&self->_downloadPath + 2)];
    }
  }
  [(InAppDownloadTask *)self _updateDownloadStatus:v13];
  [(InAppDownloadTask *)self _sendDownloadStatus];
  [(InAppDownloadTask *)self setStatusBlock:0];
  if (v4) {
    [(AsyncTask *)self completeWithError:v4];
  }
  else {
    [(AsyncTask *)self completeWithSuccess];
  }
}

- (void)_install
{
}

- (void)_sendDownloadStatus
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (*(NSTimer **)((char *)&obj->_statusTimer + 2))
  {
    v3 = [(InAppDownloadTask *)obj statusBlock];

    v2 = obj;
    if (v3)
    {
      id v4 = [(InAppDownloadTask *)obj statusBlock];
      v4[2](v4, *(NSTimer **)((char *)&obj->_statusTimer + 2));

      v2 = obj;
    }
  }
  double v5 = *(NSTimer **)((char *)&v2->_statusTimer + 2);
  *(NSTimer **)((char *)&v2->_statusTimer + 2) = 0;

  objc_sync_exit(obj);
}

- (void)_updateDownloadStatus:(id)a3
{
  id v4 = (NSTimer *)a3;
  obj = self;
  objc_sync_enter(obj);
  [(InAppDownloadTask *)obj setStatus:v4];
  double v5 = *(NSTimer **)((char *)&obj->_statusTimer + 2);
  *(NSTimer **)((char *)&obj->_statusTimer + 2) = v4;

  objc_sync_exit(obj);
}

- (void)_bomInstall
{
  v2 = self;
  objc_sync_enter(v2);
  *(void *)(&v2->_paused + 2) = BOMCopierNew();
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  objc_sync_exit(v2);

  if (!*(void *)(&v2->_paused + 2)) {
    goto LABEL_23;
  }
  id v3 = [*(id *)((char *)&v2->_downloadInfo + 2) fileSystemRepresentation];
  id v4 = [*(id *)((char *)&v2->_downloadInfo + 2) stringByDeletingPathExtension];
  id v5 = [v4 fileSystemRepresentation];
  double v6 = (unint64_t *)((char *)&v2->_copier + 2);
  BOMCopierCountFilesInArchive();
  unint64_t v7 = *(unint64_t *)((char *)&v2->_copier + 2);
  if (v7 <= 1) {
    unint64_t v7 = 1;
  }
  *double v6 = v7;
  if (qword_1003A07F8 != -1) {
    dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
  }
  objc_super v8 = off_100399E08;
  if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = v8;
    id v10 = [(InAppDownloadTask *)v2 logKey];
    unint64_t v11 = *v6;
    *(_DWORD *)buf = 138544130;
    v23 = v10;
    __int16 v24 = 2048;
    unint64_t v25 = v11;
    __int16 v26 = 2082;
    id v27 = v3;
    __int16 v28 = 2082;
    id v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extracting %lld bytes in archive %{public}s to %{public}s", buf, 0x2Au);
  }
  CFStringRef v20 = @"extractPKZip";
  v21 = &__kCFBooleanTrue;
  id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  int v13 = BOMCopierCopyWithOptions();
  if (v13)
  {
    if (qword_1003A07F8 != -1) {
      dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
    }
    id v14 = off_100399E08;
    if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
      sub_1002CAFFC(v14, v2, v13);
    }
    ASDErrorWithTitleAndMessage();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
    id v16 = [(InAppDownloadTask *)v2 _bomInstallFromPath:v4 withError:&v19];
    id v15 = v19;
    if (v15)
    {
      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      v17 = off_100399E08;
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
        sub_1002CAF38(v17, v2, (uint64_t)v15);
      }
    }
    else
    {
      objc_storeStrong((id *)((char *)&v2->_downloadPath + 2), v16);
    }
  }
  v18 = v2;
  objc_sync_enter(v18);
  BOMCopierFree();
  *(void *)(&v2->_paused + 2) = 0;
  objc_sync_exit(v18);

  if (v15)
  {
    [(InAppDownloadTask *)v18 _finalizeTaskWithError:v15];
  }
  else
  {
LABEL_23:
    [(InAppDownloadTask *)v2 _finalizeTaskWithError:0];
  }
}

- (id)_bomInstallFromPath:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)LSApplicationRecord);
  objc_super v8 = [(InAppDownloadTask *)self bundleID];
  id v40 = 0;
  id v9 = [v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v40];
  id v10 = v40;

  if (v9)
  {
    v35 = a4;
    id v11 = objc_alloc((Class)NSMutableArray);
    id v12 = [v9 dataContainerURL];
    int v13 = [v12 path];
    id v14 = objc_msgSend(v11, "initWithObjects:", v13, 0);

    [v14 addObjectsFromArray:&off_100373CB0];
    v34 = v14;
    id v15 = +[NSString pathWithComponents:v14];
    id v16 = [(InAppDownloadTask *)self bundleID];
    v17 = +[NSString stringWithFormat:@"%@-%@", v16, *(unint64_t *)((char *)&self->_totalInstalledSize + 2)];
    id v18 = [v17 hash];

    id v19 = +[NSNumber numberWithUnsignedInteger:v18];
    uint64_t v20 = [v19 stringValue];

    uint64_t v33 = (void *)v20;
    v21 = [v15 stringByAppendingPathComponent:v20];
    v22 = +[NSFileManager defaultManager];
    id v39 = 0;
    [v22 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v23 = v39;
    if (v23)
    {
      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
        sub_1002CB1F0();
      }
    }
    if ([v22 fileExistsAtPath:v21])
    {
      id v38 = 0;
      [v22 removeItemAtPath:v6 error:&v38];
      id v24 = v38;
      if (v24)
      {
        if (qword_1003A07F8 != -1) {
          dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
        }
        if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
          sub_1002CB0C0();
        }
      }
    }
    if (qword_1003A07F8 != -1) {
      dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
    }
    unint64_t v25 = off_100399E08;
    if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = v25;
      id v27 = [(InAppDownloadTask *)self logKey];
      *(_DWORD *)buf = 138543874;
      v42 = v27;
      __int16 v43 = 2114;
      id v44 = v6;
      __int16 v45 = 2114;
      v46 = v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Moving downloaded asset from %{public}@ to %{public}@", buf, 0x20u);
    }
    id v37 = v10;
    [v22 moveItemAtPath:v6 toPath:v21 error:&v37];
    id v28 = v37;

    if (v28)
    {
      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
        sub_1002CB158();
      }
    }

    a4 = v35;
  }
  else
  {
    v21 = 0;
    id v28 = v10;
  }
  id v29 = +[NSFileManager defaultManager];
  if ([v29 fileExistsAtPath:v6])
  {
    id v36 = 0;
    [v29 removeItemAtPath:v6 error:&v36];
    id v30 = v36;
    if (v30)
    {
      if (qword_1003A07F8 != -1) {
        dispatch_once(&qword_1003A07F8, &stru_10035A8E8);
      }
      if (os_log_type_enabled((os_log_t)off_100399E08, OS_LOG_TYPE_ERROR)) {
        sub_1002CB0C0();
      }
    }
  }
  if (a4) {
    *a4 = v28;
  }
  id v31 = v21;

  return v31;
}

- (NSNumber)downloadID
{
  return *(NSNumber **)((char *)&self->_totalInstalledSize + 2);
}

- (void)setDownloadID:(id)a3
{
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_downloadID + 2);
}

- (void)setLogKey:(id)a3
{
}

- (id)statusBlock
{
  return *(NSString **)((char *)&self->_logKey + 2);
}

- (void)setStatusBlock:(id)a3
{
}

- (InAppDownloadStatus)status
{
  return *(InAppDownloadStatus **)((char *)&self->_statusBlock + 2);
}

- (void)setStatus:(id)a3
{
}

- (NSString)bundleID
{
  return *(NSString **)((char *)&self->_status + 2);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_status + 2), 0);
  objc_storeStrong((id *)((char *)&self->_statusBlock + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);
  objc_storeStrong((id *)((char *)&self->_downloadID + 2), 0);
  objc_storeStrong((id *)((char *)&self->_totalInstalledSize + 2), 0);
  objc_storeStrong((id *)((char *)&self->_pendingDownloadStatus + 2), 0);
  objc_storeStrong((id *)((char *)&self->_statusTimer + 2), 0);
  objc_storeStrong((id *)((char *)&self->_installPath + 2), 0);
  objc_storeStrong((id *)((char *)&self->_downloadPath + 2), 0);
  objc_storeStrong((id *)((char *)&self->_downloadInfo + 2), 0);
  objc_storeStrong((id *)((char *)&self->_assetPromise + 2), 0);

  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end