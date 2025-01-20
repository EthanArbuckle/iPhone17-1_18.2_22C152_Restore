@interface BLStreamingZipDownloadDataConsumer
- (BLStreamingZipDownloadDataConsumer)initWithPath:(id)a3 options:(id)a4;
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (double)percentComplete;
- (id)_stringWithFileSystemRepresentation:(const char *)a3;
- (id)_stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4;
- (unint64_t)_diskUsageForPath:(id)a3;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)reset;
- (void)setExtractionProgress:(double)a3;
- (void)suspend;
- (void)truncate;
@end

@implementation BLStreamingZipDownloadDataConsumer

- (BLStreamingZipDownloadDataConsumer)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)BLStreamingZipDownloadDataConsumer;
  v8 = [(BLStreamingZipDownloadDataConsumer *)&v27 init];
  if (v8)
  {
    v9 = v8;
    id v10 = [v7 mutableCopy];
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:SZExtractorOptionsDenyInvalidSymlinks];
    id v11 = [objc_alloc((Class)SZExtractor) initWithPath:v6 options:v10];
    v12 = *(void **)(&v9->super._overrideProgress + 1);
    *(void *)(&v9->super._overrideProgress + 1) = v11;

    if (*(void *)(&v9->super._overrideProgress + 1))
    {
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      v14 = *(void **)(&v9->super._overrideProgress + 1);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000BE80;
      v23[3] = &unk_1001A1280;
      v15 = v9;
      v24 = v15;
      id v16 = v6;
      id v25 = v16;
      dispatch_semaphore_t v26 = v13;
      v17 = v13;
      [v14 prepareForExtraction:v23];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      [*(id *)(&v9->super._overrideProgress + 1) setExtractorDelegate:v15];
      id v18 = [v7 copy];
      v19 = *(void **)(&v15->_hasConsumedData + 1);
      *(void *)(&v15->_hasConsumedData + 1) = v18;

      v20 = (NSDictionary *)[v16 copy];
      v21 = *(NSDictionary **)((char *)&v15->_options + 1);
      *(NSDictionary **)((char *)&v15->_options + 1) = v20;

      v9 = (BLStreamingZipDownloadDataConsumer *)v17;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  dispatch_semaphore_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000C13C;
  v23 = sub_10000C14C;
  id v24 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v8 = *(void **)(&self->super._overrideProgress + 1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C154;
  v15[3] = &unk_1001A12A8;
  v17 = &v19;
  id v18 = &v25;
  v9 = v7;
  id v16 = v9;
  [v8 supplyBytes:v6 withCompletionBlock:v15];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = v26;
  if (BYTE1(self->_extractor)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = *((unsigned char *)v26 + 24) != 0;
  }
  BYTE1(self->_extractor) = v11;
  int v12 = *((unsigned __int8 *)v10 + 24);
  if (a4 && !*((unsigned char *)v10 + 24))
  {
    *a4 = (id) v20[5];
    int v12 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (unint64_t)diskUsage
{
  unint64_t result = [(BLStreamingZipDownloadDataConsumer *)self resumptionOffset];
  if (result)
  {
    uint64_t v4 = *(uint64_t *)((char *)&self->_options + 1);
    return [(BLStreamingZipDownloadDataConsumer *)self _diskUsageForPath:v4];
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10000C13C;
  uint64_t v19 = sub_10000C14C;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = *(void **)(&self->super._overrideProgress + 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C3B4;
  v11[3] = &unk_1001A12D0;
  BOOL v13 = &v15;
  v14 = &v21;
  dispatch_semaphore_t v7 = v5;
  int v12 = v7;
  [v6 finishStreamWithCompletionBlock:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = *((unsigned __int8 *)v22 + 24);
  if (a3 && !*((unsigned char *)v22 + 24))
  {
    *a3 = (id) v16[5];
    int v8 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

- (void)reset
{
  [(BLStreamingZipDownloadDataConsumer *)self suspend];
  id v3 = [objc_alloc((Class)SZExtractor) initWithPath:*(NSDictionary **)((char *)&self->_options + 1) options:*(void *)(&self->_hasConsumedData + 1)];
  uint64_t v4 = *(void **)(&self->super._overrideProgress + 1);
  *(void *)(&self->super._overrideProgress + 1) = v3;

  dispatch_semaphore_t v5 = *(void **)(&self->super._overrideProgress + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C544;
  v6[3] = &unk_1001A12F8;
  v6[4] = self;
  [v5 prepareForExtraction:v6];
}

- (void)suspend
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = *(void **)(&self->super._overrideProgress + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C700;
  v6[3] = &unk_1001A12F8;
  dispatch_semaphore_t v7 = v3;
  dispatch_semaphore_t v5 = v3;
  [v4 suspendStreamWithCompletionBlock:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)truncate
{
  [(BLStreamingZipDownloadDataConsumer *)self suspend];
  id v3 = objc_alloc_init((Class)NSFileManager);
  [v3 removeItemAtPath:*(NSDictionary **)((char *)&self->_options + 1) error:0];
  id v4 = [objc_alloc((Class)SZExtractor) initWithPath:*(NSDictionary **)((char *)&self->_options + 1) options:*(void *)(&self->_hasConsumedData + 1)];
  dispatch_semaphore_t v5 = *(void **)(&self->super._overrideProgress + 1);
  *(void *)(&self->super._overrideProgress + 1) = v4;

  id v6 = *(void **)(&self->super._overrideProgress + 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C7EC;
  v7[3] = &unk_1001A12F8;
  v7[4] = self;
  [v6 prepareForExtraction:v7];
}

- (void)setExtractionProgress:(double)a3
{
  *(double *)((char *)&self->_path + 1) = a3;
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v3 = a3;
  id v4 = BLServiceDownloadStreamingZipLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: extraction finished and file is at path: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (unint64_t)_diskUsageForPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet setWithCapacity:0];
  int v5 = +[NSMutableArray arrayWithCapacity:1];
  int v55 = 0;
  int v57 = 0;
  unint64_t v54 = 0xA200000900000005;
  uint64_t v56 = 0x500000002;
  id v6 = (int *)malloc_type_malloc(0x8000uLL, 0xD2C68078uLL);
  v47 = v3;
  if (v3)
  {
    [v5 addObject:v3];
  }
  else
  {
    dispatch_semaphore_t v7 = BLServiceDownloadStreamingZipLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: Can't calculate usage if no path given", buf, 2u);
    }
  }
  if ([v5 count])
  {
    unint64_t v53 = 0;
    v51 = v4;
    v48 = v6;
    while (1)
    {
      int v8 = [v5 objectAtIndex:0];
      [v5 removeObjectAtIndex:0];
      BOOL v9 = v8;
      int v10 = open((const char *)[v9 fileSystemRepresentation], 1048832);
      v52 = v9;
      if (v10 < 0)
      {
        v40 = BLServiceDownloadStreamingZipLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = __error();
          v42 = strerror(*v41);
          *(_DWORD *)buf = 138543618;
          v59 = v52;
          __int16 v60 = 2082;
          v61 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: Failed to open directory %{public}@: %{public}s", buf, 0x16u);
        }

        BOOL v9 = v52;
      }
      else
      {
        int v49 = v10;
        BOOL v11 = 0;
LABEL_10:
        id v6 = v48;
        while (1)
        {
          int v12 = getattrlistbulk(v49, &v54, v48, 0x8000uLL, 0);
          if (v12 == -1) {
            break;
          }
          int v13 = v12;
          if (!v12) {
            goto LABEL_64;
          }
          if (v12 >= 1)
          {
            while (1)
            {
              uint64_t v15 = *v6;
              unsigned int v14 = v6[1];
              unsigned int v16 = v6[4];
              if ((v14 & 0x20000000) != 0)
              {
                if (v6[6])
                {
                  char v24 = BLServiceDownloadStreamingZipLog();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v25 = __error();
                    dispatch_semaphore_t v26 = strerror(*v25);
                    *(_DWORD *)buf = 136446722;
                    v59 = v26;
                    __int16 v60 = 2048;
                    v61 = v11;
                    __int16 v62 = 2114;
                    v63 = v9;
                    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: Got error %{public}s while processing entry %llu in %{public}@", buf, 0x20u);
                  }

                  goto LABEL_56;
                }
                uint64_t v17 = v6 + 7;
                if ((v14 & 1) == 0)
                {
LABEL_16:
                  int v18 = 0;
                  uint64_t v19 = 0;
                  if ((v14 & 8) != 0) {
                    goto LABEL_17;
                  }
                  goto LABEL_25;
                }
              }
              else
              {
                uint64_t v17 = v6 + 6;
                if ((v14 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              int v18 = v17[1];
              uint64_t v19 = (char *)v17 + *v17;
              v17 += 2;
              if ((v14 & 8) != 0)
              {
LABEL_17:
                int v21 = *v17++;
                int v20 = v21;
                if ((v14 & 0x2000000) != 0) {
                  goto LABEL_18;
                }
                goto LABEL_26;
              }
LABEL_25:
              int v20 = 0;
              if ((v14 & 0x2000000) != 0)
              {
LABEL_18:
                uint64_t v23 = *(void *)v17;
                v17 += 2;
                uint64_t v22 = v23;
                goto LABEL_27;
              }
LABEL_26:
              uint64_t v22 = 0;
LABEL_27:
              if (v20 != 2)
              {
                if (v16)
                {
                  int v32 = *v17++;
                  int v30 = v32;
                  if ((v16 & 4) == 0) {
                    goto LABEL_37;
                  }
LABEL_35:
                  uint64_t v31 = *(void *)v17;
                }
                else
                {
                  int v30 = 0;
                  if ((v16 & 4) != 0) {
                    goto LABEL_35;
                  }
LABEL_37:
                  uint64_t v31 = 0;
                }
                if (v30 == 1)
                {
                  v53 += v31;
                }
                else
                {
                  v34 = +[NSNumber numberWithUnsignedLongLong:v22];
                  if ([v51 containsObject:v34])
                  {
                    v35 = BLServiceDownloadStreamingZipLog();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      v59 = v52;
                      __int16 v60 = 2082;
                      v61 = v19;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: Skipping hardlinked file at %{public}@/%{public}s", buf, 0x16u);
                    }
                  }
                  else
                  {
                    v53 += v31;
                    [v51 addObject:v34];
                  }

                  BOOL v9 = v52;
                }
                goto LABEL_56;
              }
              if ((v6[3] & 2) != 0 && !*v17)
              {
                v36 = BLServiceDownloadStreamingZipLog();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543618;
                  v59 = v9;
                  __int16 v60 = 2082;
                  v61 = v19;
                  v37 = v36;
                  v38 = "[Download-StreamingZip]: Skipping empty directory at %{public}@/%{public}s";
                  goto LABEL_54;
                }
              }
              else
              {
                if (v19)
                {
                  char v28 = [(BLStreamingZipDownloadDataConsumer *)self _stringWithFileSystemRepresentation:v19 length:(v18 - 1)];
                  v29 = [v9 stringByAppendingPathComponent:v28];

                  if (v29)
                  {
                    [v5 addObject:v29];
                  }
                  else
                  {
                    v39 = BLServiceDownloadStreamingZipLog();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136446466;
                      v59 = v19;
                      __int16 v60 = 2114;
                      v61 = v9;
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: Failed to create path to child directory by appending \"%{public}s\" to %{public}@", buf, 0x16u);
                    }
                  }
                  goto LABEL_56;
                }
                v36 = BLServiceDownloadStreamingZipLog();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134218242;
                  v59 = v11;
                  __int16 v60 = 2114;
                  v61 = v9;
                  v37 = v36;
                  v38 = "[Download-StreamingZip]: Failed to get name for directory item %llu in %{public}@; not counting its children";
LABEL_54:
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 0x16u);
                }
              }

LABEL_56:
              id v6 = (int *)((char *)v6 + v15);
              ++v11;
              if (!--v13) {
                goto LABEL_10;
              }
            }
          }
        }
        v43 = BLServiceDownloadStreamingZipLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = __error();
          v45 = strerror(*v44);
          *(_DWORD *)buf = 134218498;
          v59 = v11;
          __int16 v60 = 2114;
          v61 = v9;
          __int16 v62 = 2082;
          v63 = v45;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[Download-StreamingZip]: getattrlistbulk on entry %llu in %{public}@ returned error %{public}s", buf, 0x20u);
        }

LABEL_64:
        close(v49);
        id v4 = v51;
      }

      if (![v5 count]) {
        goto LABEL_68;
      }
    }
  }
  unint64_t v53 = 0;
LABEL_68:
  free(v6);

  return v53;
}

- (id)_stringWithFileSystemRepresentation:(const char *)a3
{
  size_t v5 = strlen(a3);

  return [(BLStreamingZipDownloadDataConsumer *)self _stringWithFileSystemRepresentation:a3 length:v5];
}

- (id)_stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4
{
  id v6 = +[NSFileManager defaultManager];
  dispatch_semaphore_t v7 = [v6 stringWithFileSystemRepresentation:a3 length:a4];

  return v7;
}

- (BOOL)hasConsumedData
{
  return BYTE1(self->_extractor);
}

- (double)percentComplete
{
  return *(double *)((char *)&self->_path + 1);
}

- (unint64_t)resumptionOffset
{
  return *(void *)((char *)&self->_percentComplete + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_options + 1), 0);
  objc_storeStrong((id *)(&self->_hasConsumedData + 1), 0);

  objc_storeStrong((id *)(&self->super._overrideProgress + 1), 0);
}

@end