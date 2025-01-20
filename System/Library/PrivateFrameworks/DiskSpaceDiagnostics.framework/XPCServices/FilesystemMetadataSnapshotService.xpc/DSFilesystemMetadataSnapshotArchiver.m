@interface DSFilesystemMetadataSnapshotArchiver
+ (BOOL)compressSnapshotWithName:(id)a3 atPath:(id)a4 withLogFile:(__sFILE *)a5 archiveName:(id *)a6;
@end

@implementation DSFilesystemMetadataSnapshotArchiver

+ (BOOL)compressSnapshotWithName:(id)a3 atPath:(id)a4 withLogFile:(__sFILE *)a5 archiveName:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];
  id v13 = v10;
  if (fprintf(a5, "Compressing %s at %s\n", v12, (const char *)[v13 UTF8String]) == -1)
  {
    __error();
    if ((byte_10006A710 & 1) == 0)
    {
      byte_10006A710 = 1;
      v14 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v15 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = [v11 UTF8String];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [v13 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Compressing %s at %s", buf, 0x16u);
  }

  id v16 = v13;
  chdir((const char *)[v16 UTF8String]);
  fflush(a5);
  *(void *)&long long v50 = 0;
  v17 = +[NSString stringWithFormat:@"%@.tgz", v11];
  v18 = v17;
  if (a6) {
    *a6 = v17;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  memset(buf, 0, sizeof(buf));
  id v19 = v18;
  *(void *)&buf[8] = [v19 UTF8String];
  id v20 = v11;
  id v21 = [v20 UTF8String];
  v22 = __stderrp;
  if (a5) {
    v22 = a5;
  }
  *(void *)&buf[16] = v21;
  *(void *)&buf[24] = v22;
  uint64_t v23 = shared_filesystem_metadata_snapshot_service_log_handle();
  v24 = (void *)v50;
  *(void *)&long long v50 = v23;

  archive_snapshot_directory((uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    if (fprintf(a5, "Failed to compress %s\n", *(const char **)&buf[16]) == -1)
    {
      __error();
      if ((byte_10006A711 & 1) == 0)
      {
        byte_10006A711 = 1;
        v25 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v26 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003064C((uint64_t *)&buf[16], v26);
    }

    v27 = +[NSFileManager defaultManager];
    v28 = +[NSString stringWithFormat:@"%@/%@", v16, v19];
    if ([v27 fileExistsAtPath:v28])
    {
      if (fprintf(a5, "Deleting failed compressed archive %s\n", *(const char **)&buf[8]) == -1)
      {
        __error();
        if ((byte_10006A712 & 1) == 0)
        {
          byte_10006A712 = 1;
          v29 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v30 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 136315138;
        uint64_t v46 = *(void *)&buf[8];
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Deleting failed compressed archive %s", v45, 0xCu);
      }

      id v44 = 0;
      unsigned __int8 v31 = [v27 removeItemAtPath:v28 error:&v44];
      id v32 = v44;
      v33 = v32;
      if ((v31 & 1) == 0)
      {
        v34 = *(const char **)&buf[8];
        id v35 = [v32 localizedDescription];
        BOOL v36 = fprintf(a5, "Failed to delete compressed archive %s: %s\n", v34, (const char *)[v35 UTF8String]) == -1;

        if (v36)
        {
          __error();
          if ((byte_10006A713 & 1) == 0)
          {
            byte_10006A713 = 1;
            v37 = shared_filesystem_metadata_snapshot_service_log_handle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
              sub_1000302A4();
            }
          }
        }
        v38 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = *(void *)&buf[8];
          id v42 = [v33 localizedDescription];
          id v43 = [v42 UTF8String];
          *(_DWORD *)v45 = 136315394;
          uint64_t v46 = v41;
          __int16 v47 = 2080;
          id v48 = v43;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to delete compressed archive %s: %s", v45, 0x16u);
        }
      }
    }
    BOOL v39 = *(_DWORD *)buf == 0;
  }
  else
  {
    BOOL v39 = 1;
  }

  return v39;
}

@end