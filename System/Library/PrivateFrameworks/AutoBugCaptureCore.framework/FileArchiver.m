@interface FileArchiver
+ (id)archiveWithPath:(id)a3;
+ (id)archiveWithPath:(id)a3 destinationDir:(id)a4 nameMatches:(id)a5 maxAge:(double)a6 allowDirectories:(BOOL)a7;
+ (id)archiveWithPaths:(id)a3 destinationDir:(id)a4 deleteSource:(BOOL)a5;
+ (id)matchFilesInDirectory:(id)a3 filenamePredicate:(id)a4 newerThan:(id)a5 allowDirectories:(BOOL)a6;
- (FileArchiver)initWithPath:(id)a3 shouldCompress:(BOOL)a4;
- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4;
- (int)addFileToArchive:(id)a3 withFileName:(id)a4;
- (int)closeArchive;
- (void)moveDirectoryToArchive:(id)a3 withDirName:(id)a4;
@end

@implementation FileArchiver

+ (id)matchFilesInDirectory:(id)a3 filenamePredicate:(id)a4 newerThan:(id)a5 allowDirectories:(BOOL)a6
{
  v62[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v47 = [MEMORY[0x263EFF980] array];
  v11 = [MEMORY[0x263F08850] defaultManager];
  v12 = [NSURL fileURLWithPath:v8 isDirectory:1];
  uint64_t v13 = *MEMORY[0x263EFF750];
  uint64_t v14 = *MEMORY[0x263EFF6A8];
  v62[0] = *MEMORY[0x263EFF750];
  v62[1] = v14;
  uint64_t v42 = v14;
  uint64_t v15 = *MEMORY[0x263EFF610];
  v62[2] = *MEMORY[0x263EFF610];
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:3];
  id v58 = 0;
  v17 = [v11 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:v16 options:0 error:&v58];
  id v18 = v58;

  v19 = v9;
  v20 = v17;
  if (!v18)
  {
    v39 = 0;
    v40 = v11;
    uint64_t v44 = v15;
    uint64_t v45 = v13;
    id v49 = v10;
    id v41 = v8;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v17;
    uint64_t v21 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    uint64_t v22 = v42;
    if (!v21) {
      goto LABEL_30;
    }
    uint64_t v23 = v21;
    uint64_t v50 = *(void *)v55;
    v48 = v19;
    while (1)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v55 != v50) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x21050CEB0]();
        id v53 = 0;
        uint64_t v27 = v22;
        int v28 = [v25 getResourceValue:&v53 forKey:v22 error:0];
        id v29 = v53;
        v30 = v29;
        if (v28 && [v29 BOOLValue] && !a6)
        {
          v31 = archiverLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v25;
            _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_DEBUG, "Not archiving %@ because it is a directory and not allowed", buf, 0xCu);
          }
          goto LABEL_27;
        }
        if (!v19)
        {
          v31 = 0;
LABEL_19:
          if (v49)
          {
            id v51 = 0;
            int v34 = [v25 getResourceValue:&v51 forKey:v44 error:0];
            id v35 = v51;
            v36 = v35;
            if (v34 && [v35 compare:v49] == -1)
            {
              v37 = archiverLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v25;
                _os_log_impl(&dword_209DBA000, v37, OS_LOG_TYPE_DEBUG, "Not archiving %@ because it didn't match fileCreationDate", buf, 0xCu);
              }
              goto LABEL_26;
            }
          }
          else
          {
            v36 = 0;
          }
          v37 = objc_msgSend(v25, "path", v39, v40, v41);
          [v47 addObject:v37];
LABEL_26:

          v19 = v48;
LABEL_27:
          uint64_t v22 = v27;
          goto LABEL_28;
        }
        id v52 = 0;
        int v32 = [v25 getResourceValue:&v52 forKey:v45 error:0];
        v31 = v52;
        if (!v32 || ([v19 evaluateWithObject:v31] & 1) != 0) {
          goto LABEL_19;
        }
        v33 = archiverLogHandle();
        uint64_t v22 = v27;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v25;
          _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, "Not archiving %@ because it didn't match name filter", buf, 0xCu);
        }

        v19 = v48;
LABEL_28:
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (!v23)
      {
LABEL_30:

        v11 = v40;
        id v8 = v41;
        id v10 = v49;
        id v18 = v39;
        break;
      }
    }
  }

  return v47;
}

+ (id)archiveWithPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = a3;
  if ([v3 length])
  {
    v4 = [v3 stringByAppendingString:@".tar.gz"];
    if (v4)
    {
      v5 = [[FileArchiver alloc] initWithPath:v4 shouldCompress:1];
      v6 = archiverLogHandle();
      v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412546;
          uint64_t v13 = v3;
          __int16 v14 = 2112;
          uint64_t v15 = v4;
          _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "archiving %@ into %@", (uint8_t *)&v12, 0x16u);
        }

        id v8 = [v3 lastPathComponent];
        [(FileArchiver *)v5 moveDirectoryToArchive:v3 withDirName:v8];

        if ([(FileArchiver *)v5 closeArchive])
        {
          id v9 = archiverLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            int v12 = 138412290;
            uint64_t v13 = v4;
            _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "closeArchive failed for %@", (uint8_t *)&v12, 0xCu);
          }
        }
        id v10 = v4;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        uint64_t v13 = v4;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "failed to create archive: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      archiverLogHandle();
      v5 = (FileArchiver *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        uint64_t v13 = v3;
        _os_log_impl(&dword_209DBA000, &v5->super, OS_LOG_TYPE_ERROR, "failed to create tarball path from: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    id v10 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v4 = archiverLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "no dir_path provided", (uint8_t *)&v12, 2u);
  }
  id v10 = 0;
LABEL_21:

  return v10;
}

+ (id)archiveWithPaths:(id)a3 destinationDir:(id)a4 deleteSource:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (![v8 length])
  {
    id v9 = archiverLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "destination path is invalid", buf, 2u);
    }
    v25 = 0;
    goto LABEL_51;
  }
  id v9 = [v8 stringByAppendingString:@".tar.gz"];
  uint64_t v42 = [[FileArchiver alloc] initWithPath:v9 shouldCompress:1];
  if (!v42)
  {
    id v10 = archiverLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)long long v54 = v9;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "failed to create archive: %@", buf, 0xCu);
    }
    v25 = 0;
    goto LABEL_50;
  }
  BOOL v38 = v5;
  v39 = v9;
  unsigned __int8 v52 = 0;
  id v10 = [MEMORY[0x263F08850] defaultManager];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v40 = v7;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (!v12) {
    goto LABEL_32;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v49;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v49 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if (![v10 fileExistsAtPath:v16 isDirectory:&v52])
      {
        v20 = archiverLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)long long v54 = v16;
          uint64_t v21 = v20;
          uint64_t v22 = "fileExistsAtPath says %@ doesn't exist!";
          uint32_t v23 = 12;
          goto LABEL_18;
        }
LABEL_19:

        continue;
      }
      int v17 = v52;
      id v18 = [v16 lastPathComponent];
      if (v17) {
        int v19 = [(FileArchiver *)v42 addDirectoryToArchive:v16 withDirName:v18];
      }
      else {
        int v19 = [(FileArchiver *)v42 addFileToArchive:v16 withFileName:v18];
      }
      int v24 = v19;

      if (v24)
      {
        if (v24 == -30)
        {
          v26 = archiverLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)long long v54 = v16;
            _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_ERROR, "ARCHIVE_FATAL for %@", buf, 0xCu);
          }

          goto LABEL_32;
        }
        v20 = archiverLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v24;
          *(_WORD *)&v54[4] = 2112;
          *(void *)&v54[6] = v16;
          uint64_t v21 = v20;
          uint64_t v22 = "Archive ERROR (%d) for %@";
          uint32_t v23 = 18;
LABEL_18:
          _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
        }
        goto LABEL_19;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_32:

  if ([(FileArchiver *)v42 closeArchive])
  {
    uint64_t v27 = archiverLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)long long v54 = v39;
      _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_ERROR, "closeArchive failed for %@", buf, 0xCu);
    }
  }
  id v7 = v40;
  if (v38)
  {
    id v41 = v8;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v28 = v11;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          id v43 = 0;
          char v34 = [v10 removeItemAtPath:v33 error:&v43];
          id v35 = v43;
          if ((v34 & 1) == 0)
          {
            v36 = archiverLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)long long v54 = v33;
              *(_WORD *)&v54[8] = 2112;
              *(void *)&v54[10] = v35;
              _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_ERROR, "Unable to delete: %@ (%@)", buf, 0x16u);
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v30);
    }

    id v7 = v40;
    id v8 = v41;
  }
  id v9 = v39;
  v25 = v39;
LABEL_50:

LABEL_51:

  return v25;
}

+ (id)archiveWithPath:(id)a3 destinationDir:(id)a4 nameMatches:(id)a5 maxAge:(double)a6 allowDirectories:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (![v11 length])
  {
    uint64_t v14 = archiverLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      uint64_t v15 = "source directory path is invalid";
      goto LABEL_11;
    }
LABEL_12:
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  if (![v12 length])
  {
    uint64_t v14 = archiverLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      uint64_t v15 = "destination directory path is invalid";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v13 && a6 == 0.0)
  {
    uint64_t v14 = archiverLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      uint64_t v15 = "no filename predicate nor file age filter";
LABEL_11:
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (a6 <= 0.0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a6];
  }
  id v18 = +[FileArchiver matchFilesInDirectory:v11 filenamePredicate:v13 newerThan:v14 allowDirectories:v7];
  int v19 = archiverLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEFAULT, "archiving filtered contents of %@ into %@.tar.gz", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v16 = +[FileArchiver archiveWithPaths:v18 destinationDir:v12 deleteSource:0];

LABEL_13:

  return v16;
}

- (FileArchiver)initWithPath:(id)a3 shouldCompress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FileArchiver;
  BOOL v7 = [(FileArchiver *)&v13 init];
  if (v7)
  {
    v7->_archive = (archive *)archive_write_new();
    if (v4) {
      archive_write_add_filter_gzip();
    }
    archive_write_set_format_pax();
    id v8 = v6;
    [v8 UTF8String];
    int v9 = archive_write_open_filename();
    if (v9)
    {
      int v10 = v9;
      id v11 = archiverLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v8;
        __int16 v16 = 1024;
        int v17 = v10;
        _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Error creating archive at path %@ %d", buf, 0x12u);
      }

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (int)addFileToArchive:(id)a3 withFileName:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v7, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0);
  if (!v8)
  {
    int v17 = archiverLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "No filename!";
LABEL_13:
      int v19 = v17;
      uint32_t v20 = 2;
LABEL_14:
      _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
LABEL_15:

LABEL_16:
    int v13 = -1;
    goto LABEL_17;
  }
  int v9 = (const char *)v8;
  if (!archive_entry_new())
  {
    int v17 = archiverLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "archive_entry_new() failed!";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  int v10 = open(v9, 0);
  if (v10 == -1)
  {
    int v17 = archiverLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v22 = *__error();
    *(_DWORD *)buf = 138412546;
    uint64_t v41 = (uint64_t)v7;
    __int16 v42 = 1024;
    int v43 = v22;
    uint64_t v18 = "Error opening file %@  %{errno}d";
    int v19 = v17;
    uint32_t v20 = 18;
    goto LABEL_14;
  }
  int v11 = v10;
  if (stat(v9, &v31) == -1)
  {
    id v23 = archiverLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = *__error();
      *(_DWORD *)buf = 136315394;
      uint64_t v41 = (uint64_t)v9;
      __int16 v42 = 1024;
      int v43 = v24;
      _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_ERROR, "stat() failed for %s: %{errno}d", buf, 0x12u);
    }

    close(v11);
    goto LABEL_16;
  }
  archive_entry_copy_stat();
  id v12 = v6;
  [v12 UTF8String];
  archive_entry_set_pathname();
  if (archive_write_header())
  {
    int v13 = archive_errno();
    uint64_t v14 = archiverLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v12 UTF8String];
      uint64_t v16 = archive_error_string();
      *(_DWORD *)buf = 136315650;
      uint64_t v41 = v15;
      __int16 v42 = 1024;
      int v43 = v13;
      __int16 v44 = 2080;
      uint64_t v45 = v16;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "failed to write header for file, %s, status, %d, reason: %s", buf, 0x1Cu);
    }
  }
  else
  {
    ssize_t v25 = read(v11, buf, 0x2000uLL);
    if (v25 < 1)
    {
LABEL_27:
      int v13 = 0;
    }
    else
    {
      ssize_t v26 = v25;
      while (1)
      {
        uint64_t v27 = archive_write_data();
        if (v27 != v26) {
          break;
        }
        ssize_t v26 = read(v11, buf, 0x2000uLL);
        if (v26 <= 0) {
          goto LABEL_27;
        }
      }
      uint64_t v28 = v27;
      uint64_t v29 = archiverLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = archive_error_string();
        *(_DWORD *)int v32 = 136315906;
        uint64_t v33 = v30;
        __int16 v34 = 2112;
        id v35 = v7;
        __int16 v36 = 2048;
        ssize_t v37 = v26;
        __int16 v38 = 2048;
        uint64_t v39 = v28;
        _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_ERROR, "Error (%s) writing file %@: request to write %ld bytes but wrote %ld bytes", v32, 0x2Au);
      }

      int v13 = archive_errno();
    }
  }
  archive_entry_free();
  close(v11);
LABEL_17:

  return v13;
}

- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v26 = a4;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];

  if ([v7 count])
  {
    char v31 = 0;
    uint64_t v8 = (void *)MEMORY[0x21050CEB0]();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v23 = v8;
      int v24 = v7;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v5, "stringByAppendingPathComponent:", v14, v23, v24);
          uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
          int v17 = [v16 fileExistsAtPath:v15 isDirectory:&v31];

          if (v17)
          {
            uint64_t v18 = [v14 lastPathComponent];
            int v19 = [v26 stringByAppendingPathComponent:v18];

            if (v31) {
              int v20 = [(FileArchiver *)self addDirectoryToArchive:v15 withDirName:v19];
            }
            else {
              int v20 = [(FileArchiver *)self addFileToArchive:v15 withFileName:v19];
            }
            if (v20 == -30)
            {

              int v21 = -30;
              goto LABEL_18;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      int v21 = 0;
LABEL_18:
      uint64_t v8 = v23;
      id v7 = v24;
    }
    else
    {
      int v21 = 0;
    }
  }
  else
  {
    int v21 = 0;
  }

  return v21;
}

- (void)moveDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 lastPathComponent];
  [(FileArchiver *)self addDirectoryToArchive:v5 withDirName:v6];

  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v13 = 0;
  [v7 removeItemAtPath:v5 error:&v13];
  id v8 = v13;

  if (v8)
  {
    id v9 = archiverLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v5 UTF8String];
      id v11 = [v8 description];
      uint64_t v12 = [v11 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      uint64_t v17 = v12;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Failed to clean up source dir: %s, error: %s", buf, 0x16u);
    }
  }
}

- (int)closeArchive
{
  int result = archive_write_free();
  self->_archive = 0;
  return result;
}

@end