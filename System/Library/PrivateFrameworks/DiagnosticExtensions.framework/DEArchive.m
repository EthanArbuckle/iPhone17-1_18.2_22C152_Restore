@interface DEArchive
- (BOOL)addFile:(id)a3 withPathName:(id)a4;
- (BOOL)addFile:(id)a3 withPathName:(id)a4 progressHandler:(id)a5;
- (DEArchive)initWithURL:(id)a3;
- (NSURL)sourceDir;
- (NSURL)tarGzUrl;
- (archive)archiverForUrl:(id)a3;
- (void)closeArchive;
- (void)dealloc;
- (void)setSourceDir:(id)a3;
- (void)setTarGzUrl:(id)a3;
@end

@implementation DEArchive

- (DEArchive)initWithURL:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DEArchive;
  v6 = [(DEArchive *)&v14 init];
  if (v6)
  {
    char v13 = 0;
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v5 path];
    [v7 fileExistsAtPath:v8 isDirectory:&v13];

    if (v13) {
      +[DEUtils tarGzForDirectoryUrl:v5];
    }
    else {
    uint64_t v9 = [v5 URLByAppendingPathExtension:@"tar.gz"];
    }
    tarGzUrl = v6->_tarGzUrl;
    v6->_tarGzUrl = (NSURL *)v9;

    objc_storeStrong((id *)&v6->_sourceDir, a3);
    v6->_hasClosedArchive = 0;
    if (!v6->_tarGzUrl)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v6->_archive = -[DEArchive archiverForUrl:](v6, "archiverForUrl:");
  }
  v11 = v6;
LABEL_9:

  return v11;
}

- (BOOL)addFile:(id)a3 withPathName:(id)a4
{
  return [(DEArchive *)self addFile:a3 withPathName:a4 progressHandler:0];
}

- (BOOL)addFile:(id)a3 withPathName:(id)a4 progressHandler:(id)a5
{
  uint64_t v5 = MEMORY[0x1F4188790](self, a2, a3, a4, a5);
  v7 = v6;
  uint64_t v9 = v8;
  v10 = (void *)v5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = v11;
  id v13 = v9;
  objc_super v14 = v7;
  if (!v10[1])
  {
    v18 = +[DELogging fwHandle];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v22 = "archive is nil";
LABEL_15:
    _os_log_impl(&dword_1A7E51000, v18, OS_LOG_TYPE_INFO, v22, buf, 2u);
    goto LABEL_16;
  }
  if (!v10[3])
  {
    v18 = +[DELogging fwHandle];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v22 = "tar.gz for archive is nil";
    goto LABEL_15;
  }
  if (v10[4])
  {
    id v42 = 0;
    uint64_t v15 = *MEMORY[0x1E4F1C628];
    id v41 = 0;
    [v12 getResourceValue:&v42 forKey:v15 error:&v41];
    id v16 = v42;
    v17 = v41;
    if (v17)
    {
      v18 = v17;
      v19 = +[DELogging fwHandle];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_8:

LABEL_22:
        BOOL v23 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v20 = [v18 description];
      *(_DWORD *)buf = 138412546;
      id v44 = v20;
      __int16 v45 = 2112;
      id v46 = v12;
      v21 = "Error [%@] getting NSURLIsDirectoryKey for url [%@]";
LABEL_7:
      _os_log_impl(&dword_1A7E51000, v19, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      goto LABEL_8;
    }
    if ([v16 BOOLValue])
    {
      v24 = +[DELogging fwHandle];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        v18 = 0;
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      id v44 = v12;
      v25 = "Archiver received a directory [%@]";
LABEL_20:
      _os_log_impl(&dword_1A7E51000, v24, OS_LOG_TYPE_INFO, v25, buf, 0xCu);
      goto LABEL_21;
    }
    id v40 = 0;
    char v27 = [v12 checkResourceIsReachableAndReturnError:&v40];
    v28 = v40;
    if (v28)
    {
      v18 = v28;
      v19 = +[DELogging fwHandle];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      v20 = [v18 description];
      *(_DWORD *)buf = 138412546;
      id v44 = v20;
      __int16 v45 = 2112;
      id v46 = v12;
      v21 = "Error [%@] getting checkResourceIsReachableAndReturnError for url [%@]";
      goto LABEL_7;
    }
    if ((v27 & 1) == 0)
    {
      v24 = +[DELogging fwHandle];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138412290;
      id v44 = v12;
      v25 = "Error, [%@] is not reachable";
      goto LABEL_20;
    }
    memset(&v39, 0, sizeof(v39));
    id v29 = [v12 path];
    stat((const char *)[v29 UTF8String], &v39);
    if (archive_entry_new())
    {
      archive_entry_copy_stat();
      id v30 = v13;
      [v30 UTF8String];
      archive_entry_set_pathname();
      if (archive_write_header())
      {
        archive_errno();
        v31 = +[DELogging fwHandle];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[DEArchive addFile:withPathName:progressHandler:](v30);
        }
      }
      else
      {
        int v33 = open((const char *)[v29 UTF8String], 0);
        if (v33 != -1)
        {
          int v34 = v33;
          if (v14) {
            v14[2](v14, 0);
          }
          ssize_t v35 = read(v34, buf, 0x2000uLL);
          if (v35 >= 1)
          {
            ssize_t v36 = v35;
            uint64_t v37 = 0;
            do
            {
              archive_write_data();
              v37 += v36;
              if (v14) {
                v14[2](v14, v37);
              }
              ssize_t v36 = read(v34, buf, 0x2000uLL);
            }
            while (v36 > 0);
          }
          archive_entry_free();
          close(v34);
          BOOL v23 = 1;
          goto LABEL_41;
        }
        v38 = +[DELogging fwHandle];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[DEArchive addFile:withPathName:progressHandler:](v30);
        }
      }
      archive_entry_free();
    }
    else
    {
      v32 = +[DELogging fwHandle];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[DEArchive addFile:withPathName:progressHandler:](v32);
      }
    }
    BOOL v23 = 0;
LABEL_41:

    v18 = 0;
    goto LABEL_23;
  }
  v18 = +[DELogging fwHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v22 = "sourceDir is nil";
    goto LABEL_15;
  }
LABEL_16:
  BOOL v23 = 0;
LABEL_24:

  return v23;
}

- (void)closeArchive
{
  self->_hasClosedArchive = 1;
  if (self->_archive)
  {
    archive_write_close();
    archive = self->_archive;
    MEMORY[0x1F417E208](archive);
  }
}

- (void)dealloc
{
  if (!self->_hasClosedArchive) {
    [(DEArchive *)self closeArchive];
  }
  v3.receiver = self;
  v3.super_class = (Class)DEArchive;
  [(DEArchive *)&v3 dealloc];
}

- (archive)archiverForUrl:(id)a3
{
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    uint64_t v5 = +[DELogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[DEArchive archiverForUrl:](v4);
    }

    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = 0;
    [v6 removeItemAtURL:v4 error:&v14];
    id v7 = v14;

    if (v7)
    {
      v8 = +[DELogging fwHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[DEArchive archiverForUrl:](v7);
      }
    }
  }
  uint64_t v9 = (archive *)archive_write_new();
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  id v10 = [v4 path];
  [v10 UTF8String];
  int v11 = archive_write_open_filename();

  if (v11)
  {
    id v12 = +[DELogging fwHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DEArchive archiverForUrl:]();
    }

    uint64_t v9 = 0;
  }
  else
  {
    self->_hasClosedArchive = 0;
  }

  return v9;
}

- (NSURL)tarGzUrl
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTarGzUrl:(id)a3
{
}

- (NSURL)sourceDir
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceDir:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDir, 0);
  objc_storeStrong((id *)&self->_tarGzUrl, 0);
}

- (void)addFile:(os_log_t)log withPathName:progressHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "archive_entry_new() failed", v1, 2u);
}

- (void)addFile:(void *)a1 withPathName:progressHandler:.cold.2(void *a1)
{
  [a1 UTF8String];
  __error();
  OUTLINED_FUNCTION_1_0(&dword_1A7E51000, v1, v2, "Error opening file: %s  error: %{errno}d", v3, v4, v5, v6, 2u);
}

- (void)addFile:(void *)a1 withPathName:progressHandler:.cold.3(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7E51000, v1, v2, "Failed to write header for file for file: %s error: %{errno}d", v3, v4, v5, v6, v7);
}

- (void)archiverForUrl:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  int v3 = v0;
  _os_log_error_impl(&dword_1A7E51000, v1, OS_LOG_TYPE_ERROR, "Error creating archive at path %{public}@ %d", v2, 0x12u);
}

- (void)archiverForUrl:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "Failed to delete existing tarGz with error: [%{public}@]", v4, v5, v6, v7, 2u);
}

- (void)archiverForUrl:(void *)a1 .cold.3(void *a1)
{
  os_log_t v1 = [a1 path];
  OUTLINED_FUNCTION_2(&dword_1A7E51000, v2, v3, "[%@] tar.gz already exists, will delete original and create new one", v4, v5, v6, v7, 2u);
}

@end