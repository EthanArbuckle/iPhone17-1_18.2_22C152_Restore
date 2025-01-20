@interface ENArchive
- (BOOL)_checkEntryAndReturnError:(id *)a3;
- (BOOL)_openArchiveAndReturnError:(id *)a3;
- (BOOL)advanceEntryAndReturnError:(id *)a3;
- (BOOL)endOfArchive;
- (BOOL)readDataIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)resetAndReturnError:(id *)a3;
- (BOOL)resetToCurrentEntryAndReturnError:(id *)a3;
- (BOOL)skipBytes:(unint64_t)a3 error:(id *)a4;
- (ENArchive)initWithFD:(int)a3 error:(id *)a4;
- (ENArchive)initWithPath:(id)a3 error:(id *)a4;
- (NSString)entryPath;
- (int64_t)readDataIntoBuffer:(void *)a3 maxLength:(unint64_t)a4 error:(id *)a5;
- (unsigned)entryFileType;
- (void)_closeArchive;
- (void)close;
- (void)dealloc;
@end

@implementation ENArchive

- (ENArchive)initWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = realpath_DARWIN_EXTSN((const char *)[v6 fileSystemRepresentation], 0);
  if (v7)
  {
    v8 = v7;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __32__ENArchive_initWithPath_error___block_invoke;
    v13[3] = &__block_descriptor_40_e5_v8__0l;
    v13[4] = v7;
    v9 = (void (**)(void))MEMORY[0x2166BC8A0](v13);
    uint64_t v10 = open(v8, 0);
    if ((v10 & 0x80000000) != 0 && (!*__error() || *__error()))
    {
      if (a4)
      {
        ENErrorF(2);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      self = [(ENArchive *)self initWithFD:v10 error:a4];
      v11 = self;
    }
    v9[2](v9);
  }
  else if (a4)
  {
    ENErrorF(2);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __32__ENArchive_initWithPath_error___block_invoke(uint64_t a1)
{
}

- (ENArchive)initWithFD:(int)a3 error:(id *)a4
{
  v5 = self;
  if (a3 < 0)
  {
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v10.receiver = self;
  v10.super_class = (Class)ENArchive;
  v5 = [(ENArchive *)&v10 init];
  if (!v5)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v7 = fdopen(a3, "rb");
  if (!v7 && (!*__error() || *__error()))
  {
    if (!a4) {
      goto LABEL_11;
    }
LABEL_9:
    ENErrorF(2);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v5->_fileHandle = v7;
  if (![(ENArchive *)v5 _openArchiveAndReturnError:a4]) {
    goto LABEL_11;
  }
  v5 = v5;
  v8 = v5;
LABEL_12:

  return v8;
}

- (BOOL)_openArchiveAndReturnError:(id *)a3
{
  if (!self->_fileHandle)
  {
    if (a3)
    {
      uint64_t v9 = 16;
      goto LABEL_13;
    }
    return 0;
  }
  if (fseeko(self->_fileHandle, 0, 0) && (!*__error() || *__error()))
  {
    if (a3)
    {
      uint64_t v9 = 15;
LABEL_13:
      ENErrorF(v9);
      BOOL v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    return 0;
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v15 = archive_read_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__ENArchive__openArchiveAndReturnError___block_invoke;
  v11[3] = &unk_264244568;
  v11[4] = &v12;
  v5 = (void (**)(void))MEMORY[0x2166BC8A0](v11);
  if (!v13[3])
  {
    if (a3)
    {
      objc_super v10 = ENErrorF(12);
LABEL_23:
      BOOL v7 = 0;
      *a3 = v10;
      goto LABEL_9;
    }
    goto LABEL_24;
  }
  if (archive_read_support_format_zip())
  {
    if (a3) {
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  if (archive_read_open_FILE())
  {
    if (a3)
    {
LABEL_22:
      archive_error_string();
      objc_super v10 = ENErrorF(15);
      goto LABEL_23;
    }
LABEL_24:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  id v6 = v13;
  self->_archive = (archive *)v13[3];
  v6[3] = 0;
  BOOL v7 = 1;
LABEL_9:
  v5[2](v5);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __40__ENArchive__openArchiveAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result) {
    return MEMORY[0x270F97E60]();
  }
  return result;
}

- (void)dealloc
{
  [(ENArchive *)self close];
  if (self->_archive) {
    archive_read_free();
  }
  v3.receiver = self;
  v3.super_class = (Class)ENArchive;
  [(ENArchive *)&v3 dealloc];
}

- (NSString)entryPath
{
  if ([(ENArchive *)self _checkEntryAndReturnError:0])
  {
    v2 = (void *)archive_entry_pathname();
    if (v2) {
      v2 = (void *)[[NSString alloc] initWithUTF8String:v2];
    }
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (unsigned)entryFileType
{
  int v3 = [(ENArchive *)self _checkEntryAndReturnError:0];
  if (v3)
  {
    entry = self->_entry;
    LOWORD(v3) = MEMORY[0x270F97D40](entry);
  }
  return v3;
}

- (BOOL)advanceEntryAndReturnError:(id *)a3
{
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    if (archive_read_next_header() == 1) {
      self->_endOfArchive = 1;
    }
  }
  else if (a3)
  {
    ENErrorF(10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return fileHandle != 0;
}

- (void)close
{
  [(ENArchive *)self _closeArchive];
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    fclose(fileHandle);
    self->_fileHandle = 0;
  }
}

- (void)_closeArchive
{
  p_archive = &self->_archive;
  if (self->_archive)
  {
    archive_read_free();
    *p_archive = 0;
    p_archive[1] = 0;
  }
}

- (BOOL)_checkEntryAndReturnError:(id *)a3
{
  if (!self->_fileHandle)
  {
    if (!a3) {
      return 0;
    }
LABEL_10:
    ENErrorF(10);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v5;
    return result;
  }
  if (self->_endOfArchive)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_10;
  }
  if (self->_entry) {
    return 1;
  }
  if (a3) {
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)readDataIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = -[ENArchive readDataIntoBuffer:maxLength:error:](self, "readDataIntoBuffer:maxLength:error:", a3);
  if (v7 < 1) {
    return 0;
  }
  if (v7 == a4) {
    return 1;
  }
  if (!a5) {
    return 0;
  }
  ENErrorF(15);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a5 = v9;
  return result;
}

- (int64_t)readDataIntoBuffer:(void *)a3 maxLength:(unint64_t)a4 error:(id *)a5
{
  if (![(ENArchive *)self _checkEntryAndReturnError:a5]) {
    return 0;
  }
  int64_t data = archive_read_data();
  if (data < 0)
  {
    if (a5)
    {
      archive_error_string();
      ENErrorF(16);
      int64_t data = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return data;
    }
    return 0;
  }
  return data;
}

- (BOOL)resetAndReturnError:(id *)a3
{
  if (self->_fileHandle)
  {
    [(ENArchive *)self _closeArchive];
    return [(ENArchive *)self _openArchiveAndReturnError:a3];
  }
  else
  {
    if (a3)
    {
      ENErrorF(10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

- (BOOL)resetToCurrentEntryAndReturnError:(id *)a3
{
  if (!-[ENArchive _checkEntryAndReturnError:](self, "_checkEntryAndReturnError:")) {
    return 0;
  }
  id v5 = [(ENArchive *)self entryPath];
  if ([(ENArchive *)self resetAndReturnError:a3])
  {
    while (![(ENArchive *)self endOfArchive])
    {
      id v6 = [(ENArchive *)self entryPath];
      id v7 = v5;
      id v8 = v6;
      if (v7 == v8)
      {

LABEL_15:
        BOOL v11 = 1;
        goto LABEL_16;
      }
      id v9 = v8;
      if ((v5 == 0) != (v8 != 0))
      {
        char v10 = [v7 isEqual:v8];

        if (v10) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      if (![(ENArchive *)self advanceEntryAndReturnError:a3]) {
        goto LABEL_13;
      }
    }
    if (!a3) {
      goto LABEL_13;
    }
    ENErrorF(16);
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:
    BOOL v11 = 0;
  }
LABEL_16:

  return v11;
}

- (BOOL)skipBytes:(unint64_t)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (![(ENArchive *)self _checkEntryAndReturnError:a4]) {
    return 0;
  }
  bzero(v10, 0x400uLL);
  do
  {
    BOOL v7 = a3 == 0;
    if (!a3) {
      break;
    }
    unint64_t v8 = a3 >= 0x400 ? 1024 : a3;
    a3 -= v8;
  }
  while ([(ENArchive *)self readDataIntoBuffer:v10 length:v8 error:a4]);
  return v7;
}

- (BOOL)endOfArchive
{
  return self->_endOfArchive;
}

@end