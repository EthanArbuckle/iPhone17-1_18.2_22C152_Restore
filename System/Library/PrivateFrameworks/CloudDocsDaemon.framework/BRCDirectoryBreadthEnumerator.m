@interface BRCDirectoryBreadthEnumerator
- (BRCDirectoryBreadthEnumerator)initWithParentPath:(id)a3 error:(int *)a4;
- (id)nextObjectWithIsDir:(BOOL *)a3 error:(int *)a4;
- (void)dealloc;
@end

@implementation BRCDirectoryBreadthEnumerator

- (BRCDirectoryBreadthEnumerator)initWithParentPath:(id)a3 error:(int *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCDirectoryBreadthEnumerator;
  v8 = [(BRCDirectoryBreadthEnumerator *)&v24 init];
  if (!v8) {
    goto LABEL_7;
  }
  int v23 = 0;
  if (([v7 resolveAndKeepOpenMustExist:1 error:&v23] & 1) == 0)
  {
    int v12 = v23;
    if (a4) {
      *a4 = v23;
    }
    if (v12 == 45)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[BRCDirectoryBreadthEnumerator initWithParentPath:error:]((uint64_t)v13, v14);
      }
    }
    else
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v7;
        __int16 v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't open parent path for breadth enumeration %@%@", buf, 0x16u);
      }
    }

    goto LABEL_20;
  }
  if (([v7 isUnixDir] & 1) == 0)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryBreadthEnumerator initWithParentPath:error:]((uint64_t)v18, v19);
    }
  }
  if (([v7 isExecutable] & 1) == 0)
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] cannot read content of %@%@", buf, 0x16u);
    }

    [v7 close];
    if (a4) {
      *a4 = 8;
    }
    goto LABEL_20;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__BRCDirectoryBreadthEnumerator_initWithParentPath_error___block_invoke;
  v20[3] = &unk_1E6993E30;
  v9 = v8;
  v21 = v9;
  id v10 = v7;
  id v22 = v10;
  if (([v10 performOnOpenFileDescriptor:v20 error:a4] & 1) == 0)
  {
    [v10 close];

LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }

  objc_storeStrong(v9 + 2, a3);
LABEL_7:
  v11 = v8;
LABEL_21:

  return v11;
}

uint64_t __58__BRCDirectoryBreadthEnumerator_initWithParentPath_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v9 = BRCOpenAt(a2, ".", 33028, a4, a5, a6, a7, a8, v14);
  *(void *)(*(void *)(a1 + 32) + 8) = fdopendir(v9);
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    return 0;
  }
  v11 = brc_bread_crumbs();
  int v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't opendir parent path for breadth enumeration %@%@", (uint8_t *)&v14, 0x16u);
  }

  close(v9);
  return 9;
}

- (id)nextObjectWithIsDir:(BOOL *)a3 error:(int *)a4
{
  if (!self->_dir)
  {
    id v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCDirectoryBreadthEnumerator nextObjectWithIsDir:error:]((uint64_t)v10, v11);
    }

LABEL_12:
    int v9 = 0;
    goto LABEL_16;
  }
  *__error() = 0;
  id v7 = readdir((DIR *)self->_dir);
  if (!v7)
  {
LABEL_7:
    if (a4)
    {
      int v9 = 0;
      *a4 = *__error();
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  v8 = v7;
  while (!strcmp(v8->d_name, ".") || !strcmp(v8->d_name, ".."))
  {
    v8 = readdir((DIR *)self->_dir);
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (a3) {
    *a3 = v8->d_type == 4;
  }
  parentPath = self->_parentPath;
  uint64_t v13 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v8->d_name);
  int v9 = [(BRCRelativePath *)parentPath pathWithChildAtPath:v13];

LABEL_16:
  return v9;
}

- (void)dealloc
{
  dir = self->_dir;
  if (dir) {
    closedir((DIR *)dir);
  }
  [(BRCRelativePath *)self->_parentPath close];
  v4.receiver = self;
  v4.super_class = (Class)BRCDirectoryBreadthEnumerator;
  [(BRCDirectoryBreadthEnumerator *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

- (void)initWithParentPath:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: parentPath.isUnixDir%@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithParentPath:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring excluded item in package%@", (uint8_t *)&v2, 0xCu);
}

- (void)nextObjectWithIsDir:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no directory entry%@", (uint8_t *)&v2, 0xCu);
}

@end