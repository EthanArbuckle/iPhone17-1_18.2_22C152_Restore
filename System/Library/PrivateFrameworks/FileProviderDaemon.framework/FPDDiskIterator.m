@interface FPDDiskIterator
- (BOOL)done;
- (FPDDiskIterator)initWithURL:(id)a3 isDirectory:(BOOL)a4;
- (NSURL)rootURL;
- (id)error;
- (id)nextWithError:(id *)a3;
- (unint64_t)numFoldersPopped;
- (void)dealloc;
- (void)skipDescendants;
@end

@implementation FPDDiskIterator

- (FPDDiskIterator)initWithURL:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  v39[2] = *(char **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"FPDDiskIterator.m" lineNumber:44 description:@"FPDDiskIterator: trying to create iterator with nil url"];
  }
  v38.receiver = self;
  v38.super_class = (Class)FPDDiskIterator;
  v9 = [(FPDDiskIterator *)&v38 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootURL, a3);
    v10->_stopAccessingRoot = [(NSURL *)v10->_rootURL startAccessingSecurityScopedResource];
    if (!v4)
    {
      int v27 = 0;
      char v28 = 1;
LABEL_16:
      v10->_isFile = v28;
      v10->_state = v27;
      goto LABEL_17;
    }
    id v11 = [v8 path];
    int v12 = access((const char *)[v11 fileSystemRepresentation], 0);

    if (v12)
    {
      if (*__error() == 63 && fpfs_supports_long_paths())
      {
        v13 = [v8 path];
        v14 = [v13 stringByDeletingLastPathComponent];

        v15 = [v8 path];
        v16 = [v15 lastPathComponent];

        id v17 = v14;
        [v17 fileSystemRepresentation];
        int v18 = fpfs_open_longpath();
        if (v18 < 0) {
          goto LABEL_10;
        }
        int v19 = v18;
        id v36 = v16;
        v37 = v10;
        int v20 = fpfs_fchdir();
        int v21 = *__error();
        close(v19);
        *__error() = v21;

        if (v20 < 0)
        {
LABEL_10:
          uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
          error = v10->_error;
          v10->_error = (NSError *)v22;
        }
        v24 = [v8 path];
        uint64_t v25 = [v24 stringByDeletingLastPathComponent];
        basePath = v10->_basePath;
        v10->_basePath = (NSString *)v25;

        goto LABEL_15;
      }
    }
    else
    {
      id v29 = [v8 path];
      v39[0] = (char *)[v29 fileSystemRepresentation];
      v39[1] = 0;

      v30 = fts_open(v39, 16, 0);
      v10->_fts = ($A7B2908EF20320D5A8F1EED2AD731845 *)v30;
      if (v30)
      {
LABEL_15:
        char v28 = 0;
        int v27 = 1;
        goto LABEL_16;
      }
    }
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    v32 = v10->_error;
    v10->_error = (NSError *)v31;

    goto LABEL_15;
  }
LABEL_17:
  v33 = fp_current_or_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[FPDDiskIterator initWithURL:isDirectory:]((uint64_t)v10, v33);
  }

  return v10;
}

BOOL __43__FPDDiskIterator_initWithURL_isDirectory___block_invoke(uint64_t a1)
{
  v3[2] = *(char **)MEMORY[0x1E4F143B8];
  v3[0] = (char *)[*(id *)(a1 + 32) fileSystemRepresentation];
  v3[1] = 0;
  *(void *)(*(void *)(a1 + 40) + 64) = fts_open(v3, 16, 0);
  return *(void *)(*(void *)(a1 + 40) + 64) != 0;
}

- (id)nextWithError:(id *)a3
{
  self->_numFoldersPopped = 0;
  if (self->_isFile)
  {
    int state = self->_state;
    switch(state)
    {
      case 2:
LABEL_11:
        v6 = 0;
        goto LABEL_49;
      case 1:
        v6 = 0;
        self->_int state = 2;
        goto LABEL_49;
      case 0:
        self->_int state = 1;
        v6 = [MEMORY[0x1E4F25CB8] locatorForURL:self->_rootURL];
        goto LABEL_49;
    }
  }
  p_error = (uint64_t *)&self->_error;
  if (self->_error)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[FPDDiskIterator nextWithError:](p_error, v8);
    }

    if (a3)
    {
      id v9 = (id) *p_error;
      v6 = 0;
      *a3 = v9;
      goto LABEL_49;
    }
    goto LABEL_11;
  }
  v34 = &self->_error;
  v10 = 0;
  id v11 = &OBJC_IVAR___FPDConfigurationStore__pendingSetMaxItemCount;
  do
  {

    int v12 = fts_read((FTS *)self->_fts);
    uint64_t v13 = v11[412];
    *(Class *)((char *)&self->super.super.isa + v13) = (Class)v12;
    if (v12)
    {
      v10 = 0;
      int fts_info = v12->fts_info;
      switch(v12->fts_info)
      {
        case 1u:
        case 3u:
        case 8u:
        case 0xBu:
        case 0xCu:
        case 0xDu:
          self->_lastItemWasPackage = 0;
          if (!v12->fts_level)
          {
            v6 = [MEMORY[0x1E4F25CB8] locatorForURL:self->_rootURL];
            v10 = 0;
            goto LABEL_48;
          }
          basePath = self->_basePath;
          if (basePath)
          {
            v16 = [NSString stringWithUTF8String:v12->fts_path];
            id v17 = [(NSString *)basePath stringByAppendingPathComponent:v16];

            int v18 = (void *)MEMORY[0x1E4F1CB10];
            BOOL v19 = (*(unsigned __int16 **)((char *)&self->super.super.isa + v13))[44] == 1;
          }
          else
          {
            v23 = (void *)MEMORY[0x1E4F1CB10];
            id v17 = [NSString stringWithUTF8String:v12->fts_path];
            BOOL v19 = (*(unsigned __int16 **)((char *)&self->super.super.isa + v13))[44] == 1;
            int v18 = v23;
          }
          v10 = [v18 fileURLWithPath:v17 isDirectory:v19];

          if (objc_msgSend(v10, "fp_isPackage"))
          {
            id v24 = [v10 path];
            [v24 fileSystemRepresentation];
            fpfs_pkg_is_demoted_at();

            self->_lastItemWasPackage = 1;
            fts_set((FTS *)self->_fts, *(FTSENT **)((char *)&self->super.super.isa + v13), 4);
            p_error = (uint64_t *)v34;
          }
          id v11 = &OBJC_IVAR___FPDConfigurationStore__pendingSetMaxItemCount;
          break;
        case 2u:
          uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t fts_errno = 62;
          goto LABEL_26;
        case 4u:
        case 7u:
        case 0xAu:
          uint64_t fts_errno = v12->fts_errno;
          uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
          goto LABEL_26;
        case 6u:
          v10 = 0;
          if (!self->_lastItemWasPackage) {
            ++self->_numFoldersPopped;
          }
          break;
        default:
          continue;
      }
    }
    else
    {
      if (*__error())
      {
        int v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t fts_errno = *__error();
        uint64_t v22 = v20;
LABEL_26:
        uint64_t v25 = objc_msgSend(v22, "fp_errorWithPOSIXCode:", fts_errno);
        v26 = (void *)*p_error;
        uint64_t *p_error = v25;
      }
      fts_close((FTS *)self->_fts);
      v10 = 0;
      self->_fts = 0;
      self->_int state = 2;
    }
    uint64_t v27 = *(uint64_t *)((char *)&self->super.super.isa + v13);
    if (!v27) {
      break;
    }
    int fts_info = *(unsigned __int16 *)(v27 + 88);
  }
  while (fts_info == 6);
  if (*p_error)
  {
    char v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[FPDDiskIterator nextWithError:](p_error, v28);
    }

    if (a3)
    {
      id v29 = (id) *p_error;
      v6 = 0;
      *a3 = v29;
      goto LABEL_48;
    }
LABEL_43:
    v6 = 0;
  }
  else
  {
    if (!v10 && self->_state == 2)
    {
      v10 = 0;
      goto LABEL_43;
    }
    if (!v10)
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"FPDDiskIterator.m" lineNumber:182 description:@"FPDDiskIterator succeeds without providing an URL"];
    }
    objc_msgSend(v10, "fp_attachSecurityScopeFromURL:", self->_rootURL);
    v6 = [MEMORY[0x1E4F25CB8] locatorForURL:v10];
  }
LABEL_48:

LABEL_49:
  return v6;
}

- (void)skipDescendants
{
}

- (id)error
{
  return self->_error;
}

- (BOOL)done
{
  return self->_state == 2;
}

- (unint64_t)numFoldersPopped
{
  return self->_numFoldersPopped;
}

- (void)dealloc
{
  if (self->_stopAccessingRoot) {
    [(NSURL *)self->_rootURL stopAccessingSecurityScopedResource];
  }
  fts = self->_fts;
  if (fts)
  {
    fts_close((FTS *)fts);
    self->_fts = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FPDDiskIterator;
  [(FPDDiskIterator *)&v4 dealloc];
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (void)initWithURL:(uint64_t)a1 isDirectory:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 24);
  v3 = @"yes";
  uint64_t v4 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(a1 + 42)) {
    v3 = @"no";
  }
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  id v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDDiskIterator: creating iterator for url %@ isFile %@ error %@", (uint8_t *)&v5, 0x20u);
}

- (void)nextWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDDiskIterator: post-read error %@", (uint8_t *)&v3, 0xCu);
}

- (void)nextWithError:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDDiskIterator: pre-read error %@", (uint8_t *)&v3, 0xCu);
}

@end