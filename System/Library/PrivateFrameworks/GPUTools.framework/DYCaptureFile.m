@interface DYCaptureFile
- (BOOL)acceptCaptureVisitor:(id)a3;
- (BOOL)alias;
- (BOOL)executable;
- (BOOL)getInfo:(id *)a3 error:(id *)a4;
- (DYCaptureArchive)archive;
- (DYCaptureFile)init;
- (NSString)name;
- (id)_initWithArchive:(id)a3 hashPosition:(unsigned int)a4 name:(id)a5;
- (id)copyData:(id *)a3;
- (id)copyMutableData:(id *)a3;
- (id)decodeArchivedObject;
- (id)decodeSerializedPropertyListWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)openFunctionStream:(id *)a3;
- (int)kind;
- (int64_t)dy_numericCompare:(id)a3;
- (void)_determineKind;
- (void)dealloc;
- (void)updateName:(id)a3;
@end

@implementation DYCaptureFile

- (DYCaptureFile)init
{
  return 0;
}

- (id)_initWithArchive:(id)a3 hashPosition:(unsigned int)a4 name:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)DYCaptureFile;
  v8 = [(DYCaptureFile *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_archive = (DYCaptureArchive *)a3;
    [a3 _fileObjectDidInitialize];
    v9->_file_pos = *(_DWORD *)([a3 _hashTable] + 12 * a4);
    v9->_alias = *(_DWORD *)([a3 _hashTable] + 12 * a4 + 8) != -1;
    v9->_name = (NSString *)[a5 copy];
  }
  return v9;
}

- (void)dealloc
{
  [(DYCaptureArchive *)self->_archive _fileObjectDidDeallocate];

  v3.receiver = self;
  v3.super_class = (Class)DYCaptureFile;
  [(DYCaptureFile *)&v3 dealloc];
}

- (int64_t)dy_numericCompare:(id)a3
{
  return [(NSString *)self->_name compare:*((void *)a3 + 2) options:64];
}

- (void)_determineKind
{
  if (objc_msgSend(+[DYCaptureArchive standardFunctionStreamFilenamePredicate](DYCaptureArchive, "standardFunctionStreamFilenamePredicate"), "evaluateWithObject:", self->_name))
  {
    int v3 = 1;
  }
  else if (objc_msgSend(+[DYCaptureArchive internalFilenamePredicate](DYCaptureArchive, "internalFilenamePredicate"), "evaluateWithObject:", self->_name))
  {
    int v3 = 2;
  }
  else
  {
    int v3 = 3;
  }
  self->_kind_cache = v3;
}

- (int)kind
{
  int result = self->_kind_cache;
  if (!result)
  {
    [(DYCaptureFile *)self _determineKind];
    return self->_kind_cache;
  }
  return result;
}

- (BOOL)executable
{
  int kind_cache = self->_kind_cache;
  if (!kind_cache)
  {
    [(DYCaptureFile *)self _determineKind];
    int kind_cache = self->_kind_cache;
  }
  return kind_cache == 1;
}

- (BOOL)getInfo:(id *)a3 error:(id *)a4
{
  return [(DYCaptureArchive *)self->_archive getInfo:a3 forFilePosition:self->_file_pos error:a4];
}

- (BOOL)acceptCaptureVisitor:(id)a3
{
  v5 = (void *)MEMORY[0x2533604C0](self, a2);
  int kind_cache = self->_kind_cache;
  if (!kind_cache)
  {
    [(DYCaptureFile *)self _determineKind];
    int kind_cache = self->_kind_cache;
  }
  if (kind_cache == 2)
  {
    [a3 visitInternalFile:self];
  }
  else if (kind_cache == 1)
  {
    [a3 visitFunctionStreamFile:self];
  }
  else
  {
    [a3 visitDataFile:self];
  }
  return 1;
}

- (id)copyMutableData:(id *)a3
{
  return [(DYCaptureArchive *)self->_archive copyDataForFilePosition:self->_file_pos error:a3];
}

- (id)copyData:(id *)a3
{
  uint64_t file_pos = self->_file_pos;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  BOOL v5 = [(DYCaptureArchive *)self->_archive requestDataForFilePosition:file_pos buffer:&v10 size:&v9 error:a3];
  id result = 0;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__DYCaptureFile_copyData___block_invoke;
    v8[3] = &unk_265333910;
    v8[4] = self;
    v8[5] = file_pos;
    return (id)[v7 initWithBytesNoCopy:v10 length:v9 deallocator:v8];
  }
  return result;
}

uint64_t __26__DYCaptureFile_copyData___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) releaseBytesForFilePosition:*(void *)(a1 + 40)];
}

- (id)openFunctionStream:(id *)a3
{
  id result = -[DYCaptureFile copyMutableData:](self, "copyMutableData:");
  if (result)
  {
    id v5 = result;
    v6 = [[DYDataFunctionStream alloc] initWithData:result error:a3];

    return v6;
  }
  return result;
}

- (void)updateName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
}

- (id)decodeArchivedObject
{
  id v2 = [(DYCaptureFile *)self copyMutableData:0];
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  uint64_t v6 = 0;
  v4 = objc_msgSend(MEMORY[0x263F3F9E0], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x263F3F9E0], "captureArchiveClassSet"), v2, &v6);

  return v4;
}

- (id)decodeSerializedPropertyListWithOptions:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(DYCaptureFile *)self copyMutableData:0];
  id v7 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:v6 options:a3 format:0 error:a4];

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p name=\"%@\">", objc_opt_class(), self, -[DYCaptureFile name](self, "name")];
}

- (DYCaptureArchive)archive
{
  return self->_archive;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)alias
{
  return self->_alias;
}

@end