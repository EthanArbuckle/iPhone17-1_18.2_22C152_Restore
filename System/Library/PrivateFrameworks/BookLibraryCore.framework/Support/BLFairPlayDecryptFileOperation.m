@interface BLFairPlayDecryptFileOperation
- (BLBookInstallInfo)installInfo;
- (BLFairPlayDecryptFileOperation)initWithPath:(id)a3 dpInfo:(id)a4 installInfo:(id)a5;
- (BLFairplayDecryptSession)fairplayDecryptSession;
- (BLOperationProgress)progress;
- (BOOL)_decryptWithSession:(id)a3 error:(id *)a4;
- (BOOL)success;
- (NSData)dpInfo;
- (NSError)error;
- (NSString)path;
- (double)lastSnapshotTime;
- (void)_initializeProgressWithFileHandle:(id)a3;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)main;
- (void)setDpInfo:(id)a3;
- (void)setFairplayDecryptSession:(id)a3;
- (void)setInstallInfo:(id)a3;
- (void)setLastSnapshotTime:(double)a3;
- (void)setPath:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation BLFairPlayDecryptFileOperation

- (BLFairPlayDecryptFileOperation)initWithPath:(id)a3 dpInfo:(id)a4 installInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BLFairPlayDecryptFileOperation;
  v11 = [(BLFairPlayDecryptFileOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dpInfo, a4);
    v13 = (NSString *)[v8 copy];
    path = v12->_path;
    v12->_path = v13;

    objc_storeWeak((id *)&v12->_installInfo, v10);
  }

  return v12;
}

- (void)main
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000245F0;
  v26 = sub_100024600;
  v27 = [[BLFairplayDecryptSession alloc] initWithDPInfo:self->_dpInfo];
  dpInfo = self->_dpInfo;
  self->_dpInfo = 0;

  v4 = objc_alloc_init(BLOperationProgress);
  progress = self->_progress;
  self->_progress = v4;

  if (v23[5])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100024608;
    v21[3] = &unk_1001A1830;
    v21[4] = self;
    v21[5] = &v22;
    v6 = objc_retainBlock(v21);
    IOPMAssertionID AssertionID = 0;
    IOReturn v7 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", (CFStringRef)[(id)v23[5] identifier], 0, @"bookd FairPlay asset decryption", 0, 900.0, @"TimeoutActionRelease", &AssertionID);
    if (v7)
    {
      id v8 = BLBookInstallLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[Install-Decrypt-Op]: Power assertion failed with error: %d", buf, 8u);
      }

      sub_10004B6AC(21, 0, 0);
      id v9 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v9;

      self->_success = 0;
    }
    else
    {
      v14 = BLBookInstallLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(id)v23[5] identifier];
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[Install-Decrypt-Op]: Took power assertion: %@", buf, 0xCu);
      }
      ((void (*)(void *))v6[2])(v6);
      IOPMAssertionRelease(AssertionID);
      objc_super v16 = BLBookInstallLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = [(id)v23[5] identifier];
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[Install-Decrypt-Op]: Released power assertion: %@", buf, 0xCu);
      }
      v18 = +[NSUserDefaults standardUserDefaults];
      if ([v18 BOOLForKey:@"BKSimulateCrashAtInstallDuringDecrypt"])
      {
        v19 = BLBookInstallLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Simulating a crash during install decrypt", buf, 2u);
        }

        [v18 removeObjectForKey:@"BKSimulateCrashAtInstallDuringDecrypt"];
        [v18 synchronize];
        raise(11);
      }
    }
  }
  else
  {
    v11 = BLBookInstallLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[Install-Decrypt-Op]: Could not begin decrypt", buf, 2u);
    }

    sub_10004B6AC(15, 0, 0);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = self->_error;
    self->_error = v12;
  }
  _Block_object_dispose(&v22, 8);
}

- (BOOL)_decryptWithSession:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSFileHandle fileHandleForUpdatingAtPath:self->_path];
  if (v6)
  {
    [(BLFairPlayDecryptFileOperation *)self _initializeProgressWithFileHandle:v6];
    id v7 = 0;
    char v8 = 0;
    while ((v8 & 1) == 0 && !v7)
    {
      id v10 = [v6 readDataOfLength:0x8000];
      if ([v10 length])
      {
        id v17 = 0;
        v11 = [v5 decryptBytes:v10 error:&v17];
        id v12 = v17;
        if (v11)
        {
          objc_msgSend(v6, "seekToFileOffset:", (unsigned char *)objc_msgSend(v6, "offsetInFile") - (unsigned char *)objc_msgSend(v10, "length"));
          [v6 writeData:v11];
          -[BLFairPlayDecryptFileOperation _updateProgressWithByteCount:](self, "_updateProgressWithByteCount:", [v6 offsetInFile]);
          id v7 = 0;
        }
        else
        {
          v13 = BLBookInstallLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v19 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[Install-Decrypt-Op]: Decrypt failed  %@", buf, 0xCu);
          }

          id v7 = v12;
        }
      }
      else
      {
        id v7 = 0;
        char v8 = 1;
      }
    }
    [v6 synchronizeFile];
    [v6 closeFile];
    BOOL v14 = v8 & 1;
  }
  else
  {
    sub_10004B6AC(7, 0, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v14 = 0;
  }
  if (a4) {
    *a4 = v7;
  }

  return v14;
}

- (void)_initializeProgressWithFileHandle:(id)a3
{
  memset(&v4.st_size, 0, 48);
  if (fstat((int)objc_msgSend(a3, "fileDescriptor", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v4) != -1)
  {
    [(BLOperationProgress *)self->_progress setUnits:1];
    [(BLOperationProgress *)self->_progress setMaxValue:v4.st_size];
    [(BLOperationProgress *)self->_progress resetSnapshots];
    self->_lastSnapshotTime = -1.79769313e308;
    [(BLFairPlayDecryptFileOperation *)self _updateProgressWithByteCount:0];
  }
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  progress = self->_progress;
  int64_t v6 = [(BLOperationProgress *)progress maxValue];
  if (v6 >= a3) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = v6;
  }
  [(BLOperationProgress *)progress setCurrentValue:v7];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v9 = *(double *)&qword_1001C7640 + self->_lastSnapshotTime;
  if (v9 < Current)
  {
    [(BLOperationProgress *)self->_progress snapshot];
    id v11 = [(BLFairPlayDecryptFileOperation *)self installInfo];
    id v10 = [v11 progressDelegate];
    [v10 operation:self updatedProgress:self->_progress forInstall:v11];

    self->_lastSnapshotTime = Current;
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (BLFairplayDecryptSession)fairplayDecryptSession
{
  return self->_fairplayDecryptSession;
}

- (void)setFairplayDecryptSession:(id)a3
{
}

- (NSData)dpInfo
{
  return self->_dpInfo;
}

- (void)setDpInfo:(id)a3
{
}

- (double)lastSnapshotTime
{
  return self->_lastSnapshotTime;
}

- (void)setLastSnapshotTime:(double)a3
{
  self->_lastSnapshotTime = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (BLOperationProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (BLBookInstallInfo)installInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_installInfo);

  return (BLBookInstallInfo *)WeakRetained;
}

- (void)setInstallInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_installInfo);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dpInfo, 0);
  objc_storeStrong((id *)&self->_fairplayDecryptSession, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end