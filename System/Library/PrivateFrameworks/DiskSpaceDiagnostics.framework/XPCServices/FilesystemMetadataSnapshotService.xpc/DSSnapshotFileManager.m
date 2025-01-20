@interface DSSnapshotFileManager
- (BOOL)__createReadmeFileWithError:(id *)a3;
- (BOOL)__createSharedDirectoriesMapFileWithError:(id *)a3;
- (BOOL)__createSharedLogFileWithError:(id *)a3;
- (BOOL)cleanupWithError:(id *)a3;
- (BOOL)createWorkingDirectoryAndSharedFilesWithError:(id *)a3;
- (BOOL)shouldHashVolumeListings;
- (BOOL)writeFileForMetadata:(id)a3 error:(id *)a4;
- (DSSnapshotRequest)_snapshotRequest;
- (NSPointerArray)__openFiles;
- (NSString)_workingDirectoryName;
- (NSString)_workingDirectoryPath;
- (__sFILE)createFileForWritingWithName:(id)a3 error:(id *)a4;
- (__sFILE)sharedDirectoriesMapFile;
- (__sFILE)sharedLogFile;
- (id)__workingDirectoryParentPath;
- (id)_archiveToDirectoryAtPath:(id)a3 error:(id *)a4;
- (id)archiveWithError:(id *)a3;
- (id)fileURLForFileNamed:(id)a3 error:(id *)a4;
- (id)initForSnapshotRequest:(id)a3;
- (void)__closeFiles;
- (void)__flushFiles;
- (void)dealloc;
@end

@implementation DSSnapshotFileManager

- (id)__workingDirectoryParentPath
{
  if (qword_10006A6D8 != -1) {
    dispatch_once(&qword_10006A6D8, &stru_100064720);
  }
  v2 = (void *)qword_10006A6D0;

  return v2;
}

- (BOOL)__createReadmeFileWithError:(id *)a3
{
  v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating readme file", buf, 2u);
  }

  if (a3) {
    *a3 = 0;
  }
  id v10 = 0;
  v6 = [(DSSnapshotFileManager *)self createFileForWritingWithName:@"README.txt" error:&v10];
  id v7 = v10;
  if (v6)
  {
    fputs("A filesystem metadata snapshot contains information necessary to investigate reports of issues with disk space.\n\nUse dsf(1) to inspect the contents:\n\n   xcrun -sdk iphoneos dsf -h\n\nSee man page for more:\n\n   man $(xcrun --show-sdk-platform-path -sdk iphoneos)/usr/local/share/man/man1/dsf.1\n", v6);
    if (a3) {
LABEL_7:
    }
      *a3 = v7;
  }
  else
  {
    v9 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003009C(v7);
    }

    if (a3) {
      goto LABEL_7;
    }
  }

  return v6 != 0;
}

- (BOOL)__createSharedDirectoriesMapFileWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  if (![(DSSnapshotFileManager *)self shouldHashVolumeListings])
  {
    v9 = 0;
    BOOL v10 = 1;
    if (!a3) {
      goto LABEL_14;
    }
LABEL_13:
    *a3 = v9;
    goto LABEL_14;
  }
  v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating shared directories map file", buf, 2u);
  }

  id v15 = 0;
  v6 = [(DSSnapshotFileManager *)self createFileForWritingWithName:@"directories.fsmap" error:&v15];
  id v7 = v15;
  self->_sharedDirectoriesMapFile = v6;
  v8 = [(DSSnapshotFileManager *)self sharedDirectoriesMapFile];
  v9 = 0;
  BOOL v10 = v8 != 0;
  if (!v8)
  {
    v11 = +[NSString stringWithFormat:@"Failed to create mapping file for directories (%@): %@", @"directories.fsmap", v7];
    v17[0] = NSUnderlyingErrorKey;
    v17[1] = NSLocalizedDescriptionKey;
    v18[0] = v7;
    v18[1] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v9 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65543 userInfo:v12];

    v13 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100030120(v7);
    }
  }
  if (a3) {
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (BOOL)__createSharedLogFileWithError:(id *)a3
{
  v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating log file", buf, 2u);
  }

  if (a3) {
    *a3 = 0;
  }
  id v11 = 0;
  v6 = [(DSSnapshotFileManager *)self createFileForWritingWithName:@"log.log" error:&v11];
  id v7 = v11;
  self->_sharedLogFile = v6;
  v8 = [(DSSnapshotFileManager *)self sharedLogFile];
  if (!v8)
  {
    self->_sharedLogFile = __stderrp;
    v9 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000301A4(v7);
    }
  }
  if (a3) {
    *a3 = v7;
  }

  return v8 != 0;
}

- (void)__flushFiles
{
  v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flushing files", v11, 2u);
  }

  v4 = [(DSSnapshotFileManager *)self __openFiles];
  [v4 compact];

  v5 = [(DSSnapshotFileManager *)self __openFiles];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(DSSnapshotFileManager *)self __openFiles];
      fflush((FILE *)[v8 pointerAtIndex:v7]);

      ++v7;
      v9 = [(DSSnapshotFileManager *)self __openFiles];
      id v10 = [v9 count];
    }
    while (v7 < (unint64_t)v10);
  }
}

- (void)__closeFiles
{
  v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing files", v12, 2u);
  }

  v4 = [(DSSnapshotFileManager *)self __openFiles];
  [v4 compact];

  v5 = [(DSSnapshotFileManager *)self __openFiles];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(DSSnapshotFileManager *)self __openFiles];
      [v8 replacePointerAtIndex:v7 withPointer:0];

      v9 = [(DSSnapshotFileManager *)self __openFiles];
      fclose((FILE *)[v9 pointerAtIndex:v7]);

      ++v7;
      id v10 = [(DSSnapshotFileManager *)self __openFiles];
      id v11 = [v10 count];
    }
    while (v7 < (unint64_t)v11);
  }
}

- (id)_archiveToDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(DSSnapshotFileManager *)self _workingDirectoryName];
    *(_DWORD *)buf = 138412290;
    id v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Archiving %@", buf, 0xCu);
  }
  if (a4) {
    *a4 = 0;
  }
  [(DSSnapshotFileManager *)self __flushFiles];
  id v10 = [(DSSnapshotFileManager *)self _workingDirectoryName];
  id v11 = [(DSSnapshotFileManager *)self __workingDirectoryParentPath];
  id v44 = 0;
  unsigned __int8 v12 = +[DSFilesystemMetadataSnapshotArchiver compressSnapshotWithName:v10 atPath:v11 withLogFile:[(DSSnapshotFileManager *)self sharedLogFile] archiveName:&v44];
  id v13 = v44;

  if (v12)
  {
    v14 = [(DSSnapshotFileManager *)self sharedLogFile];
    id v15 = [(DSSnapshotFileManager *)self _workingDirectoryName];
    v16 = (const char *)[v15 UTF8String];
    id v17 = v13;
    LODWORD(v14) = fprintf(v14, "Successfully compressed directory %s into archive %s\n", v16, (const char *)[v17 UTF8String]);

    if (v14 == -1)
    {
      __error();
      if ((byte_10006A6E1 & 1) == 0)
      {
        byte_10006A6E1 = 1;
        v18 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v19 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(DSSnapshotFileManager *)self _workingDirectoryName];
      id v21 = [v20 UTF8String];
      id v22 = [v17 UTF8String];
      *(_DWORD *)buf = 136315394;
      id v48 = v21;
      __int16 v49 = 2080;
      id v50 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Successfully compressed directory %s into archive %s", buf, 0x16u);
    }
    v23 = [(DSSnapshotFileManager *)self __workingDirectoryParentPath];
    id v24 = +[NSString stringWithFormat:@"%@/%@", v23, v17];

    v25 = +[NSString stringWithFormat:@"%@/%@", v6, v17];
    v26 = +[NSFileManager defaultManager];
    id v43 = 0;
    unsigned __int8 v27 = [v26 moveItemAtPath:v24 toPath:v25 error:&v43];
    id v28 = v43;

    if (v27)
    {
      v29 = v25;
      v30 = 0;
    }
    else
    {
      v36 = +[NSString stringWithFormat:@"Failed to move %@ to %@", v24, v25];
      v45[0] = NSUnderlyingErrorKey;
      v45[1] = NSLocalizedDescriptionKey;
      v46[0] = v28;
      v46[1] = v36;
      v37 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
      v30 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65543 userInfo:v37];

      if (a4) {
        *a4 = v30;
      }
      v38 = [(DSSnapshotFileManager *)self sharedLogFile];
      id v39 = v36;
      if (fprintf(v38, "%s\n", (const char *)[v39 UTF8String]) == -1)
      {
        __error();
        if ((byte_10006A6E2 & 1) == 0)
        {
          byte_10006A6E2 = 1;
          v40 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v41 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_100030228(v39);
      }

      v29 = 0;
    }
  }
  else
  {
    v31 = [(DSSnapshotFileManager *)self _workingDirectoryName];
    v32 = +[NSString stringWithFormat:@"Failed to compress directory %@", v31];

    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    v52 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    v30 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:131073 userInfo:v33];

    if (a4) {
      *a4 = v30;
    }
    v34 = [(DSSnapshotFileManager *)self sharedLogFile];
    id v24 = v32;
    if (fprintf(v34, "%s\n", (const char *)[v24 UTF8String]) == -1)
    {
      __error();
      if ((byte_10006A6E0 & 1) == 0)
      {
        byte_10006A6E0 = 1;
        v35 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v25 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100030228(v24);
    }
    v29 = 0;
  }

  return v29;
}

- (BOOL)createWorkingDirectoryAndSharedFilesWithError:(id *)a3
{
  v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting up files", buf, 2u);
  }

  if (a3) {
    *a3 = 0;
  }
  id v6 = objc_alloc_init((Class)NSDateFormatter);
  [v6 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  unint64_t v7 = [(DSSnapshotFileManager *)self _snapshotRequest];
  v8 = [v7 beginDate];
  v9 = [v6 stringFromDate:v8];

  id v10 = +[NSString stringWithFormat:@"%@-%@.%@", @"FilesystemMeta", v9, @"fsmeta"];
  workingDirectoryName = self->__workingDirectoryName;
  self->__workingDirectoryName = v10;

  unsigned __int8 v12 = [(DSSnapshotFileManager *)self __workingDirectoryParentPath];
  id v13 = [(DSSnapshotFileManager *)self _workingDirectoryName];
  v14 = +[NSString stringWithFormat:@"%@%@", v12, v13];
  workingDirectoryPath = self->__workingDirectoryPath;
  self->__workingDirectoryPath = v14;

  v16 = +[NSFileManager defaultManager];
  id v17 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
  id v38 = 0;
  unsigned __int8 v18 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v38];
  id v19 = v38;

  if (v18)
  {
    id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
      *(_DWORD *)buf = 138412290;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Created working directory at %@", buf, 0xCu);
    }
    id v37 = 0;
    unsigned __int8 v22 = [(DSSnapshotFileManager *)self __createSharedLogFileWithError:&v37];
    id v23 = v37;
    id v24 = v23;
    if (v22)
    {
      id v36 = v23;
      unsigned __int8 v25 = [(DSSnapshotFileManager *)self __createSharedDirectoriesMapFileWithError:&v36];
      id v26 = v36;

      if (v25)
      {
        [(DSSnapshotFileManager *)self __createReadmeFileWithError:0];
        BOOL v27 = 1;
LABEL_28:
        id v24 = v26;
        goto LABEL_29;
      }
      if (!a3)
      {
        BOOL v27 = 0;
        goto LABEL_28;
      }
      id v24 = v26;
      goto LABEL_26;
    }
    if (a3)
    {
LABEL_26:
      id v24 = v24;
      BOOL v27 = 0;
      *a3 = v24;
      goto LABEL_29;
    }
  }
  else
  {
    id v28 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
    v29 = +[NSString stringWithFormat:@"Failed to create directory %@: %@", v28, v19];

    v41[0] = NSUnderlyingErrorKey;
    v41[1] = NSLocalizedDescriptionKey;
    v42[0] = v19;
    v42[1] = v29;
    v30 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    id v24 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65543 userInfo:v30];

    if (a3) {
      *a3 = v24;
    }
    v31 = __stderrp;
    id v32 = v29;
    if (fprintf(v31, "%s\n", (const char *)[v32 UTF8String]) == -1)
    {
      __error();
      if ((byte_10006A6E3 & 1) == 0)
      {
        byte_10006A6E3 = 1;
        v33 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v34 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100030228(v32);
    }
  }
  BOOL v27 = 0;
LABEL_29:

  return v27;
}

- (__sFILE)createFileForWritingWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating file named %@", buf, 0xCu);
  }

  if (a4) {
    *a4 = 0;
  }
  v8 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
  id v9 = +[NSString stringWithFormat:@"%@/%@", v8, v6];
  id v10 = fopen((const char *)[v9 UTF8String], "w");

  if (v10)
  {
    id v11 = [(DSSnapshotFileManager *)self __openFiles];
    [v11 addPointer:v10];
  }
  else
  {
    int v12 = *__error();
    id v13 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
    v14 = +[NSString stringWithFormat:@"Failed to open output file at %@/%@: %s. Aborting.", v13, v6, strerror(v12)];

    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v12 userInfo:0];
    v22[0] = NSUnderlyingErrorKey;
    v22[1] = NSLocalizedDescriptionKey;
    v23[0] = v15;
    v23[1] = v14;
    v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v17 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65543 userInfo:v16];

    if (a4) {
      *a4 = v17;
    }
    unsigned __int8 v18 = [(DSSnapshotFileManager *)self sharedLogFile];
    id v11 = v14;
    if (fprintf(v18, "%s\n", (const char *)[v11 UTF8String]) == -1)
    {
      __error();
      if ((byte_10006A6E4 & 1) == 0)
      {
        byte_10006A6E4 = 1;
        id v19 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100030228(v11);
    }
  }
  return v10;
}

- (BOOL)writeFileForMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  unint64_t v7 = [(DSSnapshotFileManager *)self fileURLForFileNamed:@"metadata.plist" error:a4];
  id v18 = 0;
  unsigned int v8 = [v6 writeToURL:v7 error:&v18];
  id v9 = v18;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = [(DSSnapshotFileManager *)self sharedLogFile];
    id v12 = [v10 localizedDescription];
    id v13 = (const char *)[v12 UTF8String];
    id v14 = [v6 description];
    LODWORD(v11) = fprintf(v11, "Failed to save metadata to file, %s:\n%s\n", v13, (const char *)[v14 UTF8String]);

    if (v11 == -1)
    {
      __error();
      if ((byte_10006A6E5 & 1) == 0)
      {
        byte_10006A6E5 = 1;
        id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v16 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003030C(v10, v6);
    }

    if (a4) {
      *a4 = v10;
    }
  }

  return v8;
}

- (id)fileURLForFileNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    unsigned int v8 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
    id v9 = +[NSString stringWithFormat:@"%@/%@", v8, v7];
    id v10 = +[NSURL fileURLWithPath:v9 isDirectory:0];

    id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "File URL for file named %@: %@", buf, 0x16u);
    }
  }
  else
  {
    id v11 = +[NSString stringWithFormat:@"Invalid name for file URL: %@", 0];
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v20 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65543 userInfo:v12];

    if (a4) {
      *a4 = v13;
    }

    id v10 = 0;
  }

  return v10;
}

- (id)archiveWithError:(id *)a3
{
  return [(DSSnapshotFileManager *)self _archiveToDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter" error:a3];
}

- (BOOL)cleanupWithError:(id *)a3
{
  [(DSSnapshotFileManager *)self __closeFiles];
  v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting snapshot directory at %@", buf, 0xCu);
  }
  unint64_t v7 = +[NSFileManager defaultManager];
  unsigned int v8 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
  unsigned __int8 v9 = [v7 removeItemAtPath:v8 error:a3];

  if ((v9 & 1) == 0)
  {
    id v10 = __stderrp;
    id v11 = [(DSSnapshotFileManager *)self _workingDirectoryPath];
    id v12 = (const char *)[v11 UTF8String];
    id v13 = [*a3 localizedDescription];
    LODWORD(v10) = fprintf(v10, "Failed to delete directory %s: %s\n", v12, (const char *)[v13 UTF8String]);

    if (v10 == -1)
    {
      __error();
      if ((byte_10006A6E6 & 1) == 0)
      {
        byte_10006A6E6 = 1;
        id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000303C4(self, a3);
    }
  }
  return v9;
}

- (void)dealloc
{
  [(DSSnapshotFileManager *)self __closeFiles];
  v3.receiver = self;
  v3.super_class = (Class)DSSnapshotFileManager;
  [(DSSnapshotFileManager *)&v3 dealloc];
}

- (id)initForSnapshotRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)DSSnapshotFileManager;
    v5 = [(DSSnapshotFileManager *)&v14 init];
    id v6 = v5;
    if (v5)
    {
      id v7 = objc_storeWeak((id *)&v5->__snapshotRequest, v4);
      unsigned int v8 = [v4 options];
      unsigned __int8 v9 = [v8 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionShouldHashVolumeListings"];
      v6->_shouldHashVolumeListings = [v9 BOOLValue];

      id v10 = (NSPointerArray *)[objc_alloc((Class)NSPointerArray) initWithOptions:2];
      openFiles = v6->___openFiles;
      v6->___openFiles = v10;
    }
    self = v6;
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (__sFILE)sharedLogFile
{
  return self->_sharedLogFile;
}

- (__sFILE)sharedDirectoriesMapFile
{
  return self->_sharedDirectoriesMapFile;
}

- (BOOL)shouldHashVolumeListings
{
  return self->_shouldHashVolumeListings;
}

- (NSPointerArray)__openFiles
{
  return (NSPointerArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)_workingDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (DSSnapshotRequest)_snapshotRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__snapshotRequest);

  return (DSSnapshotRequest *)WeakRetained;
}

- (NSString)_workingDirectoryName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__workingDirectoryName, 0);
  objc_destroyWeak((id *)&self->__snapshotRequest);
  objc_storeStrong((id *)&self->__workingDirectoryPath, 0);

  objc_storeStrong((id *)&self->___openFiles, 0);
}

@end