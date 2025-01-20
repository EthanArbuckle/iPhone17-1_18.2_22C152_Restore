@interface ENSecureArchiveFileWrapper
- (BOOL)_writeObject:(id)a3 toFileDescriptor:(int)a4 error:(id *)a5;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readObject:(id *)a3 ofClass:(Class)a4 error:(id *)a5;
- (BOOL)readObject:(id *)a3 ofClasses:(id)a4 error:(id *)a5;
- (BOOL)saveObject:(id)a3 error:(id *)a4;
- (ENSecureArchiveFileWrapper)initWithPath:(id)a3;
- (NSString)path;
- (void)close;
@end

@implementation ENSecureArchiveFileWrapper

- (BOOL)openWithError:(id *)a3
{
  if ((self->_fileDescriptor & 0x80000000) == 0) {
    return 1;
  }
  int v6 = open_dprotected_np([(NSString *)self->_path fileSystemRepresentation], 514, 2, 0, 384);
  self->_fileDescriptor = v6;
  BOOL result = v6 >= 0;
  if (a3 && v6 < 0)
  {
    if (*__error())
    {
      int v7 = *__error();
      if (v7 == 1)
      {
        v8 = ENErrorF();
LABEL_10:
        id v9 = v8;
        BOOL result = 0;
        *a3 = v9;
        return result;
      }
    }
    else
    {
      int v7 = -6700;
    }
    v8 = [MEMORY[0x1E4F28C50] errorWithDomain:*MEMORY[0x1E4F28768] code:v7 userInfo:0];
    goto LABEL_10;
  }
  return result;
}

- (ENSecureArchiveFileWrapper)initWithPath:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v10 = [MEMORY[0x1E4F28B08] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ENSecureArchiveFileWrapper.m", 25, @"Invalid parameter not satisfying: %@", @"path.length > 0" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)ENSecureArchiveFileWrapper;
  int v6 = [(ENSecureArchiveFileWrapper *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    path = v6->_path;
    v6->_path = (NSString *)v7;

    v6->_fileDescriptor = -1;
  }

  return v6;
}

- (void)close
{
  int fileDescriptor = self->_fileDescriptor;
  if ((fileDescriptor & 0x80000000) == 0)
  {
    if (close(fileDescriptor)
      && gLogCategory_ENFileWrapper <= 90
      && (gLogCategory_ENFileWrapper != -1 || _LogCategory_Initialize()))
    {
      __error();
      LogPrintF_safe();
    }
    self->_int fileDescriptor = -1;
  }
}

- (BOOL)readObject:(id *)a3 ofClasses:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(ENSecureArchiveFileWrapper *)self openWithError:a5])
  {
    id v9 = (void *)MEMORY[0x1D9439DC0]();
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CA8]) initWithFileDescriptor:self->_fileDescriptor closeOnDealloc:0];
    id v23 = 0;
    char v11 = [v10 seekToOffset:0 error:&v23];
    id v12 = v23;
    if (v11)
    {
      id v22 = 0;
      v13 = [v10 readDataToEndOfFileAndReturnError:&v22];
      id v14 = v22;

      if (v13)
      {
        if ([v13 length])
        {
          id v21 = v14;
          v15 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClasses:v8 fromData:v13 error:&v21];
          id v16 = v21;

          int v17 = 0;
          id v14 = v16;
        }
        else
        {
          v15 = 0;
          int v17 = 1;
        }
      }
      else
      {
        v15 = 0;
        int v17 = 0;
      }

      if (v15)
      {
        id v19 = v15;
        *a3 = v19;
LABEL_15:
        BOOL v18 = 1;
        goto LABEL_18;
      }
      if (v17)
      {
        id v19 = 0;
        *a3 = 0;
        goto LABEL_15;
      }
      id v12 = v14;
      if (!a5)
      {
LABEL_17:
        id v19 = 0;
        BOOL v18 = 0;
        id v14 = v12;
        goto LABEL_18;
      }
    }
    else
    {

      if (!a5) {
        goto LABEL_17;
      }
    }
    id v14 = v12;
    id v19 = 0;
    BOOL v18 = 0;
    *a5 = v14;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v18 = 0;
LABEL_19:

  return v18;
}

- (BOOL)readObject:(id *)a3 ofClass:(Class)a4 error:(id *)a5
{
  id v8 = [MEMORY[0x1E4F1CAD8] setWithObject:a4];
  LOBYTE(a5) = [(ENSecureArchiveFileWrapper *)self readObject:a3 ofClasses:v8 error:a5];

  return (char)a5;
}

- (BOOL)saveObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(ENSecureArchiveFileWrapper *)self openWithError:a4];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D9439DC0]();
    uint64_t fileDescriptor = self->_fileDescriptor;
    id v13 = 0;
    BOOL v10 = [(ENSecureArchiveFileWrapper *)self _writeObject:v6 toFileDescriptor:fileDescriptor error:&v13];
    id v11 = v13;
    if (a4 && !v10) {
      *a4 = v11;
    }
  }
  return v7;
}

- (BOOL)_writeObject:(id)a3 toFileDescriptor:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F28DA8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1);
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CA8]) initWithFileDescriptor:v6 closeOnDealloc:0];
    if ([v8 seekToOffset:0 error:a5]
      && [v8 truncateAtOffset:0 error:a5])
    {
      char v9 = [v8 writeData:v7 error:a5];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end