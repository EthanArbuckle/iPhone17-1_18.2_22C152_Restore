@interface CPLDiagnoseArchive
- (CPLDiagnoseArchive)initWithPath:(id)a3 shouldCompress:(BOOL)a4;
- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4;
- (int)addFileToArchive:(id)a3 withFileName:(id)a4;
- (void)closeArchive;
@end

@implementation CPLDiagnoseArchive

- (CPLDiagnoseArchive)initWithPath:(id)a3 shouldCompress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLDiagnoseArchive;
  v7 = [(CPLDiagnoseArchive *)&v12 init];
  if (v7)
  {
    v7->_archive = (archive *)archive_write_new();
    v7->_archiveFd = -1;
    if (v4) {
      archive_write_add_filter_gzip();
    }
    else {
      archive_write_add_filter_none();
    }
    archive_write_set_format_pax();
    id v8 = v6;
    int v9 = open_dprotected_np((const char *)[v8 UTF8String], 514, 3, 0, 416);
    if (v9 < 0) {
      int v9 = open_dprotected_np((const char *)[v8 UTF8String], 514, 2, 0, 416);
    }
    uint64_t v10 = archive_write_open_fd();
    if (v10)
    {
      NSLog(@"Error creating archive at path %@ %d", v8, v10);

      v7 = 0;
    }
    else
    {
      v7->_archiveFd = v9;
    }
  }

  return v7;
}

- (int)addFileToArchive:(id)a3 withFileName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(&v22, 0, sizeof(v22));
  id v7 = v5;
  id v8 = (const char *)[v7 UTF8String];
  if (!v8)
  {
    NSLog(@"No filename!");
LABEL_7:
    LODWORD(v11) = -1;
    goto LABEL_8;
  }
  int v9 = v8;
  stat(v8, &v22);
  if (!archive_entry_new())
  {
    NSLog(@"archive_entry_new() failed!");
    goto LABEL_7;
  }
  archive_entry_copy_stat();
  id v10 = v6;
  [v10 UTF8String];
  archive_entry_set_pathname();
  if (archive_write_header())
  {
    uint64_t v11 = archive_errno();
    id v12 = [v10 UTF8String];
    uint64_t v13 = archive_error_string();
    NSLog(@"failed to write header for file, %s, status, %d, reason: %s", v12, v11, v13);
    archive_entry_free();
    goto LABEL_8;
  }
  int v15 = open(v9, 0);
  if (v15 == -1)
  {
    v19 = __error();
    v20 = strerror(*v19);
    v21 = __error();
    NSLog(@"Error opening file %@:%s (%d)", v7, v20, *v21);
    archive_entry_free();
    goto LABEL_7;
  }
  int v16 = v15;
  ssize_t v17 = read(v15, v23, 0x2000uLL);
  if (v17 < 1)
  {
LABEL_14:
    LODWORD(v11) = 0;
  }
  else
  {
    uint64_t v11 = v17;
    while (1)
    {
      uint64_t v18 = archive_write_data();
      if (v18 != v11) {
        break;
      }
      uint64_t v11 = read(v16, v23, 0x2000uLL);
      if (v11 <= 0) {
        goto LABEL_14;
      }
    }
    NSLog(@"Error writing file %@: request to write %ld bytes but wrote %ld bytes", v7, v11, v18);
    LODWORD(v11) = archive_errno();
  }
  archive_entry_free();
  close(v16);
LABEL_8:

  return v11;
}

- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5 = a3;
  id v26 = a4;
  id v6 = +[NSFileManager defaultManager];
  id v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];

  if ([v7 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      v24 = v7;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          char v27 = 0;
          int v15 = [v5 stringByAppendingPathComponent:v13];
          int v16 = +[NSFileManager defaultManager];
          unsigned int v17 = [v16 fileExistsAtPath:v15 isDirectory:&v27];

          if (v17)
          {
            uint64_t v18 = [v13 lastPathComponent];
            v19 = [v26 stringByAppendingPathComponent:v18];

            unsigned int v20 = v27
                ? [(CPLDiagnoseArchive *)self addDirectoryToArchive:v15 withDirName:v19]: [(CPLDiagnoseArchive *)self addFileToArchive:v15 withFileName:v19];
            unsigned int v21 = v20;

            if (v21 == -30)
            {

              int v22 = -30;
              goto LABEL_17;
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      int v22 = 0;
LABEL_17:
      id v7 = v24;
    }
    else
    {
      int v22 = 0;
    }
  }
  else
  {
    int v22 = 0;
  }

  return v22;
}

- (void)closeArchive
{
  archive_write_free();
  int archiveFd = self->_archiveFd;
  if ((archiveFd & 0x80000000) == 0)
  {
    close(archiveFd);
  }
}

@end