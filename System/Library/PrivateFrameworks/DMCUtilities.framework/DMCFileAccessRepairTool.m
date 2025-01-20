@interface DMCFileAccessRepairTool
- (BOOL)changePermissions:(unsigned __int16)a3 ofFileAtPath:(id)a4;
- (BOOL)fileManagerThinksFileNeedsRepairAtPath:(id)a3;
- (BOOL)fileNeedsRepairAtPath:(id)a3;
- (BOOL)posixThinksFileNeedsRepairAtPath:(id)a3;
- (BOOL)repairFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 toFileAtPath:(id)a4;
- (NSFileManager)fileManager;
- (id)contentsOfFileAtPath:(id)a3;
- (id)createFileManager;
- (id)createRepairToolErrorWithCode:(int64_t)a3;
- (int)accessAtPath:(const char *)a3 mode:(int)a4 error:(int *)a5;
- (void)setFileManager:(id)a3;
@end

@implementation DMCFileAccessRepairTool

- (BOOL)fileNeedsRepairAtPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DMCFileAccessRepairTool *)self fileManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    int v7 = [(DMCFileAccessRepairTool *)self fileManagerThinksFileNeedsRepairAtPath:v4];
    int v8 = [(DMCFileAccessRepairTool *)self posixThinksFileNeedsRepairAtPath:v4];
    if (v7 != v8)
    {
      v9 = DMCLogObjects()[3];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = DMCStringForBool(v7);
        v12 = DMCStringForBool(v8);
        int v15 = 138543874;
        v16 = v11;
        __int16 v17 = 2114;
        v18 = v12;
        __int16 v19 = 2114;
        id v20 = v4;
        _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_INFO, "File Manager (%{public}@) and POSIX (%{public}@) disagree on whether a file (%{public}@) needs repair.", (uint8_t *)&v15, 0x20u);
      }
    }
    char v13 = v7 | v8;
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)fileManagerThinksFileNeedsRepairAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(DMCFileAccessRepairTool *)self fileManager];
  char v6 = [v5 isReadableFileAtPath:v4];

  return v6 ^ 1;
}

- (NSFileManager)fileManager
{
  fileManager = self->_fileManager;
  if (!fileManager)
  {
    id v4 = [(DMCFileAccessRepairTool *)self createFileManager];
    v5 = self->_fileManager;
    self->_fileManager = v4;

    fileManager = self->_fileManager;
  }
  return fileManager;
}

- (BOOL)posixThinksFileNeedsRepairAtPath:(id)a3
{
  int v5 = 0;
  return -[DMCFileAccessRepairTool accessAtPath:mode:error:](self, "accessAtPath:mode:error:", [a3 fileSystemRepresentation], 4, &v5) < 0&& v5 == 13;
}

- (BOOL)repairFileAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(DMCFileAccessRepairTool *)self changePermissions:420 ofFileAtPath:v6])
  {
    int v7 = [(DMCFileAccessRepairTool *)self contentsOfFileAtPath:v6];
    if (v7)
    {
      BOOL v8 = [(DMCFileAccessRepairTool *)self writeData:v7 toFileAtPath:v6];
      BOOL v9 = v8;
      if (!a4 || v8) {
        goto LABEL_13;
      }
      uint64_t v10 = 3;
    }
    else
    {
      if (!a4)
      {
        BOOL v9 = 0;
        goto LABEL_13;
      }
      uint64_t v10 = 2;
    }
    [(DMCFileAccessRepairTool *)self createRepairToolErrorWithCode:v10];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  if (a4)
  {
    [(DMCFileAccessRepairTool *)self createRepairToolErrorWithCode:1];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_14:

  return v9;
}

- (id)createRepairToolErrorWithCode:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"MCFileAccessRepairToolErrorDomain" code:a3 userInfo:0];
}

- (id)createFileManager
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  return v2;
}

- (int)accessAtPath:(const char *)a3 mode:(int)a4 error:(int *)a5
{
  *__error() = 0;
  int v8 = access(a3, a4);
  if (v8 < 0) {
    *a5 = *__error();
  }
  return v8;
}

- (BOOL)changePermissions:(unsigned __int16)a3 ofFileAtPath:(id)a4
{
  return chmod((const char *)[a4 fileSystemRepresentation], a3) == 0;
}

- (id)contentsOfFileAtPath:(id)a3
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
}

- (BOOL)writeData:(id)a3 toFileAtPath:(id)a4
{
  return [a3 DMCAtomicWriteToPath:a4 error:0];
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end