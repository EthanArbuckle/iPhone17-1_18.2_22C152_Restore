@interface FileUtilities
- (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5;
- (id)createBinsFromStartDate:(id)a3 threshold:(int64_t)a4 identifier:(id)a5 targetFolderPath:(id)a6;
- (id)generateTimeStamp;
- (id)getOldestFileTimestampAt:(id)a3;
- (int64_t)sortDirectory:(id)a3 forBins:(id)a4;
@end

@implementation FileUtilities

- (id)createBinsFromStartDate:(id)a3 threshold:(int64_t)a4 identifier:(id)a5 targetFolderPath:(id)a6
{
  id v23 = a3;
  id v22 = a5;
  id v21 = a6;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = [(FileUtilities *)self generateTimeStamp];
  if (a4 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      v13 = [v23 dateByAddingTimeInterval:(double)v12 * -3600.0];
      v14 = [v13 dateByAddingTimeInterval:-3600.0];
      v15 = +[NSNumber numberWithInteger:v12];
      v16 = [v15 stringValue];
      v17 = +[NSString stringWithFormat:@"coreaudio_%@_%@_%@", v22, v11, v16];
      v18 = [v21 stringByAppendingPathComponent:v17];

      v19 = [[Bin alloc] initWithFolderPath:v18 startDate:v14 endDate:v13];
      [v10 addObject:v19];

      ++v12;
    }
    while (a4 != v12);
  }

  return v10;
}

- (int64_t)sortDirectory:(id)a3 forBins:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  v44 = v6;
  +[NSFileManager defaultManager];
  v47 = id v61 = 0;
  v35 = [v47 subpathsOfDirectoryAtPath:v6 error:&v61];
  id v7 = v61;
  if (v7)
  {
    v8 = v7;
    if (qword_10000C6D0 != -1) {
      dispatch_once(&qword_10000C6D0, &stru_100008210);
    }
    log = *(id *)qword_10000C6D8;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v9 = [v8 localizedDescription];
      *(_DWORD *)buf = 136315906;
      v63 = "FileUtilities.mm";
      __int16 v64 = 1024;
      int v65 = 53;
      __int16 v66 = 2114;
      v67 = v35;
      __int16 v68 = 2114;
      v69 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get directory subpaths. { directory=%{public}@, error=%{public}@ }", buf, 0x26u);
    }
    goto LABEL_53;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  log = v35;
  id v10 = [log countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v10)
  {
    id v39 = v10;
    v8 = 0;
    int64_t v42 = 0;
    uint64_t v38 = *(void *)v58;
    while (1)
    {
      v41 = 0;
      do
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(log);
        }
        uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * (void)v41);
        v11 = objc_msgSend(v6, "stringByAppendingPathComponent:");
        char v56 = 0;
        unsigned __int8 v12 = [v47 fileExistsAtPath:v11 isDirectory:&v56];
        if (v56) {
          unsigned __int8 v13 = 0;
        }
        else {
          unsigned __int8 v13 = v12;
        }
        if ((v13 & 1) == 0) {
          goto LABEL_49;
        }
        id v55 = v8;
        v43 = v11;
        v40 = [v47 attributesOfItemAtPath:v11 error:&v55];
        id v14 = v55;

        if (!v14)
        {
          v15 = [v40 objectForKey:NSFileCreationDate];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id obj = v36;
          id v14 = 0;
          id v17 = [obj countByEnumeratingWithState:&v51 objects:v72 count:16];
          if (!v17) {
            goto LABEL_47;
          }
          uint64_t v18 = *(void *)v52;
          while (1)
          {
            v19 = 0;
            do
            {
              if (*(void *)v52 != v18) {
                objc_enumerationMutation(obj);
              }
              v20 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v19);
              id v21 = [v20 start];
              id v22 = [v20 end];
              unsigned __int8 v23 = [(FileUtilities *)self date:v15 isBetweenDate:v21 andDate:v22];

              if (v23)
              {
                v24 = [v20 folderPath];
                id v50 = v14;
                [v47 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v50];
                id v25 = v50;

                if (v25)
                {
                  if (qword_10000C6D0 != -1) {
                    dispatch_once(&qword_10000C6D0, &stru_100008210);
                  }
                  v26 = *(id *)qword_10000C6D8;
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    v27 = [v25 localizedDescription];
                    *(_DWORD *)buf = 136315906;
                    v63 = "FileUtilities.mm";
                    __int16 v64 = 1024;
                    int v65 = 80;
                    __int16 v66 = 2114;
                    v67 = v44;
                    __int16 v68 = 2114;
                    v69 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create directory. { directory=%{public}@, error=%{public}@ }", buf, 0x26u);
                  }
                  goto LABEL_44;
                }
                v28 = [v20 folderPath];
                v26 = [v28 stringByAppendingPathComponent:v45];

                v29 = [v26 stringByDeletingLastPathComponent];
                id v49 = 0;
                [v47 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v49];
                id v25 = v49;

                if (v25)
                {
                  if (qword_10000C6D0 != -1) {
                    dispatch_once(&qword_10000C6D0, &stru_100008210);
                  }
                  v30 = *(id *)qword_10000C6D8;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v31 = [v26 stringByDeletingLastPathComponent];
                    v32 = [v25 localizedDescription];
                    *(_DWORD *)buf = 136315906;
                    v63 = "FileUtilities.mm";
                    __int16 v64 = 1024;
                    int v65 = 87;
                    __int16 v66 = 2114;
                    v67 = v31;
                    __int16 v68 = 2114;
                    v69 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create directory. { directory=%{public}@, error=%{public}@ }", buf, 0x26u);
                  }
                  goto LABEL_36;
                }
                id v48 = 0;
                [v47 moveItemAtPath:v43 toPath:v26 error:&v48];
                id v25 = v48;
                if (v25)
                {
                  if (qword_10000C6D0 != -1) {
                    dispatch_once(&qword_10000C6D0, &stru_100008210);
                  }
                  v30 = *(id *)qword_10000C6D8;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v33 = [v25 localizedDescription];
                    *(_DWORD *)buf = 136316162;
                    v63 = "FileUtilities.mm";
                    __int16 v64 = 1024;
                    int v65 = 93;
                    __int16 v66 = 2114;
                    v67 = v43;
                    __int16 v68 = 2114;
                    v69 = v26;
                    __int16 v70 = 2114;
                    v71 = v33;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to move file. { from=%{public}@, to=%{public}@, error=%{public}@", buf, 0x30u);
                  }
LABEL_36:
                }
                else
                {
                  ++v42;
                }
LABEL_44:

                id v14 = v25;
              }
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [obj countByEnumeratingWithState:&v51 objects:v72 count:16];
            if (!v17)
            {
LABEL_47:

              goto LABEL_48;
            }
          }
        }
        if (qword_10000C6D0 != -1) {
          dispatch_once(&qword_10000C6D0, &stru_100008210);
        }
        v15 = *(id *)qword_10000C6D8;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = [v14 localizedDescription];
          *(_DWORD *)buf = 136315906;
          v63 = "FileUtilities.mm";
          __int16 v64 = 1024;
          int v65 = 68;
          __int16 v66 = 2114;
          v67 = v11;
          __int16 v68 = 2114;
          v69 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get file attributes. { filePath=%{public}@, error=%{public}@ }", buf, 0x26u);
        }
LABEL_48:

        v8 = v14;
        v11 = v43;
LABEL_49:

        v41 = (char *)v41 + 1;
        id v6 = v44;
      }
      while (v41 != v39);
      id v39 = [log countByEnumeratingWithState:&v57 objects:v73 count:16];
      if (!v39) {
        goto LABEL_54;
      }
    }
  }
  v8 = 0;
LABEL_53:
  int64_t v42 = 0;
LABEL_54:

  return v42;
}

- (id)getOldestFileTimestampAt:(id)a3
{
  id v21 = a3;
  v3 = +[NSFileManager defaultManager];
  id v28 = 0;
  uint64_t v18 = [v3 subpathsOfDirectoryAtPath:v21 error:&v28];
  id v4 = v28;
  if (v4)
  {
    v5 = v4;
    if (qword_10000C6D0 != -1) {
      dispatch_once(&qword_10000C6D0, &stru_100008210);
    }
    log = *(id *)qword_10000C6D8;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v5 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v30 = "FileUtilities.mm";
      __int16 v31 = 1024;
      int v32 = 111;
      __int16 v33 = 2114;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get file paths. { error=%{public}@ }", buf, 0x1Cu);
    }
    id v19 = 0;
  }
  else
  {
    id v19 = +[NSDate date];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    log = v18;
    v5 = 0;
    id v7 = [log countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(log);
          }
          id v10 = +[NSString stringWithFormat:@"%@/%@", v21, *(void *)(*((void *)&v24 + 1) + 8 * (void)v9)];
          char v23 = 0;
          unsigned int v11 = [v3 fileExistsAtPath:v10 isDirectory:&v23];
          if (v23) {
            unsigned int v12 = 0;
          }
          else {
            unsigned int v12 = v11;
          }
          if (v12 == 1)
          {
            id v22 = v5;
            unsigned __int8 v13 = [v3 attributesOfItemAtPath:v10 error:&v22];
            id v14 = v22;

            if (v14)
            {
              if (qword_10000C6D0 != -1) {
                dispatch_once(&qword_10000C6D0, &stru_100008210);
              }
              v15 = *(id *)qword_10000C6D8;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v16 = [v14 localizedDescription];
                *(_DWORD *)buf = 136315906;
                v30 = "FileUtilities.mm";
                __int16 v31 = 1024;
                int v32 = 125;
                __int16 v33 = 2114;
                v34 = v10;
                __int16 v35 = 2114;
                id v36 = v16;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to fetch file attributes. { filePath=%{public}@, error=%{public}@ }", buf, 0x26u);
              }
            }
            else
            {
              v15 = [v13 objectForKey:NSFileCreationDate];
              if ([v15 compare:v19] == (id)-1)
              {
                v15 = v15;

                id v19 = v15;
              }
            }

            v5 = v14;
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [log countByEnumeratingWithState:&v24 objects:v37 count:16];
      }
      while (v7);
    }
  }

  return v19;
}

- (id)generateTimeStamp
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"yyyyMMdd-HHmmss.SSS"];
  id v3 = objc_alloc_init((Class)NSDate);
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

- (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v7 compare:v8] != (id)-1 && objc_msgSend(v7, "compare:", v9) != (id)1;

  return v10;
}

@end