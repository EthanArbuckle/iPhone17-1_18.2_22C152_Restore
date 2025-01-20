@interface ZipManager
- (BOOL)createZipArchiveForFileURL:(id)a3 to:(id)a4;
- (FileUtilities)fileUtilities;
- (id)createZipFor:(id)a3 at:(id)a4 withStaleFileThreshold:(int64_t)a5;
- (void)setFileUtilities:(id)a3;
@end

@implementation ZipManager

- (FileUtilities)fileUtilities
{
  fileUtilities = self->_fileUtilities;
  if (!fileUtilities)
  {
    v4 = objc_alloc_init(FileUtilities);
    v5 = self->_fileUtilities;
    self->_fileUtilities = v4;

    fileUtilities = self->_fileUtilities;
  }
  return fileUtilities;
}

- (id)createZipFor:(id)a3 at:(id)a4 withStaleFileThreshold:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[NSFileManager defaultManager];
  if ([v10 fileExistsAtPath:v8])
  {
    id v41 = 0;
    [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v41];
    id v11 = v41;
    if (v11)
    {
      id v12 = v11;
      if (qword_10000C6E0 != -1) {
        dispatch_once(&qword_10000C6E0, &stru_100008230);
      }
      v13 = *(id *)qword_10000C6E8;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [v12 localizedDescription];
        *(_DWORD *)buf = 136315906;
        v43 = "ZipManager.mm";
        __int16 v44 = 1024;
        int v45 = 57;
        __int16 v46 = 2114;
        id v47 = v9;
        __int16 v48 = 2114;
        id v49 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create target directory. { target=%{public}@, error=%{public}@ }", buf, 0x26u);
      }
      v15 = 0;
    }
    else
    {
      v13 = +[NSDate date];
      v17 = [(ZipManager *)self fileUtilities];
      v37 = [v17 getOldestFileTimestampAt:v8];

      v18 = +[NSCalendar currentCalendar];
      v38 = [v18 components:32 fromDate:v37 toDate:v13 options:0];

      if ((uint64_t)[v38 hour] + 1 < a5) {
        a5 = (int64_t)[v38 hour] + 1;
      }
      v19 = [(ZipManager *)self fileUtilities];
      v20 = [v8 lastPathComponent];
      v39 = [v19 createBinsFromStartDate:v13 threshold:a5 identifier:v20 targetFolderPath:v9];

      v21 = [(ZipManager *)self fileUtilities];
      id v22 = [v21 sortDirectory:v8 forBins:v39];

      if (qword_10000C6E0 != -1) {
        dispatch_once(&qword_10000C6E0, &stru_100008230);
      }
      v23 = *(id *)qword_10000C6E8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v43 = "ZipManager.mm";
        __int16 v44 = 1024;
        int v45 = 69;
        __int16 v46 = 2048;
        id v47 = v22;
        __int16 v48 = 2114;
        id v49 = v8;
        __int16 v50 = 2114;
        id v51 = v9;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Sorted and moved files. { numMoved=%ld, from=%{public}@, to=%{public}@ }", buf, 0x30u);
      }
      v24 = [v39 firstObject];
      v25 = [v24 folderPath];
      v26 = +[NSURL fileURLWithPath:v25];

      v27 = [v39 firstObject];
      v28 = [v27 folderPath];
      v29 = +[NSString stringWithFormat:@"%@.zip", v28];
      v30 = +[NSURL fileURLWithPath:v29];

      if ([(ZipManager *)self createZipArchiveForFileURL:v26 to:v30])
      {
        v31 = [v26 path];
        id v40 = 0;
        [v10 removeItemAtPath:v31 error:&v40];
        id v12 = v40;

        if (v12)
        {
          if (qword_10000C6E0 != -1) {
            dispatch_once(&qword_10000C6E0, &stru_100008230);
          }
          v32 = *(id *)qword_10000C6E8;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = [v26 path];
            v34 = [v12 localizedDescription];
            *(_DWORD *)buf = 136315906;
            v43 = "ZipManager.mm";
            __int16 v44 = 1024;
            int v45 = 81;
            __int16 v46 = 2114;
            id v47 = v33;
            __int16 v48 = 2114;
            id v49 = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to remove zipped folder. { folderPath=%{public}@, error=%{public}@ }", buf, 0x26u);
          }
        }
        v15 = [v30 path];
      }
      else
      {
        if (qword_10000C6E0 != -1) {
          dispatch_once(&qword_10000C6E0, &stru_100008230);
        }
        v35 = *(id *)qword_10000C6E8;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v43 = "ZipManager.mm";
          __int16 v44 = 1024;
          int v45 = 75;
          __int16 v46 = 2114;
          id v47 = v26;
          __int16 v48 = 2114;
          id v49 = v30;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create zip. { folderToZip=%{public}@, zipPath=%{public}@ }", buf, 0x26u);
        }
        id v12 = 0;
        v15 = 0;
      }
    }
  }
  else
  {
    if (qword_10000C6E0 != -1) {
      dispatch_once(&qword_10000C6E0, &stru_100008230);
    }
    v16 = *(id *)qword_10000C6E8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "ZipManager.mm";
      __int16 v44 = 1024;
      int v45 = 50;
      __int16 v46 = 2114;
      id v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%25s:%-5d Cannot create zip, directory is empty. { directory=%{public}@ }", buf, 0x1Cu);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)createZipArchiveForFileURL:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v23 = BOMCopierNew();
  if (v23)
  {
    id v7 = objc_alloc((Class)NSOutputStream);
    id v8 = objc_msgSend(v7, "initWithURL:append:", v6, 1, &v23, v23);
    [v8 open];
    v34[0] = @"createPKZip";
    v34[1] = @"outputStream";
    v35[0] = &__kCFBooleanTrue;
    v35[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    if (qword_10000C6E0 != -1) {
      dispatch_once(&qword_10000C6E0, &stru_100008230);
    }
    v10 = *(id *)qword_10000C6E8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v5 path];
      id v12 = [v6 path];
      *(_DWORD *)buf = 136315906;
      v25 = "ZipManager.mm";
      __int16 v26 = 1024;
      int v27 = 106;
      __int16 v28 = 2114;
      v29 = v11;
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Zipping file. { from=%{public}@, to=%{public}@ }", buf, 0x26u);
    }
    id v13 = [v5 path];
    [v13 fileSystemRepresentation];
    int v14 = BOMCopierCopyWithOptions();

    BOOL v15 = v14 == 0;
    if (v14)
    {
      if (qword_10000C6E0 != -1) {
        dispatch_once(&qword_10000C6E0, &stru_100008230);
      }
      v16 = *(id *)qword_10000C6E8;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v5 path];
        v18 = [v6 path];
        *(_DWORD *)buf = 136316162;
        v25 = "ZipManager.mm";
        __int16 v26 = 1024;
        int v27 = 109;
        __int16 v28 = 2114;
        v29 = v17;
        __int16 v30 = 2114;
        v31 = v18;
        __int16 v32 = 1024;
        int v33 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to copy and zip. { from=%{public}@, to=%{public}@, error=%d }", buf, 0x2Cu);
      }
    }

    BOMCopierFree();
  }
  else
  {
    if (qword_10000C6E0 != -1) {
      dispatch_once(&qword_10000C6E0, &stru_100008230);
    }
    v19 = *(id *)qword_10000C6E8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 136315650;
      v25 = "ZipManager.mm";
      __int16 v26 = 1024;
      int v27 = 91;
      __int16 v28 = 2082;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create copier. { error=%{public}s }", buf, 0x1Cu);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (void)setFileUtilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end