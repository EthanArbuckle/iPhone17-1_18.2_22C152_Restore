@interface CRKChunkedFile
+ (int64_t)preferredChunkSizeForFileDescriptor:(int)a3;
+ (void)assertFileDescriptorIsValid:(int)a3;
- (CRKChunkedFile)init;
- (CRKChunkedFile)initWithFileDescriptor:(int)a3;
- (int64_t)readNextChunkIntoBuffer:(id)a3 error:(id *)a4;
@end

@implementation CRKChunkedFile

+ (void)assertFileDescriptorIsValid:(int)a3
{
  if (a3 <= 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"CRKChunkedFile.m" lineNumber:25 description:@"Negative file descriptor"];
  }
}

+ (int64_t)preferredChunkSizeForFileDescriptor:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "assertFileDescriptorIsValid:");
  memset(&v7, 0, 512);
  memset(&v6, 0, sizeof(v6));
  if (fstatfs(a3, &v7) == -1)
  {
    if (fstat(a3, &v6) == -1) {
      return -1;
    }
    blksize_t st_blksize = v6.st_blksize;
  }
  else
  {
    blksize_t st_blksize = v7.f_iosize;
  }
  if (st_blksize > 0) {
    return st_blksize;
  }
  return -1;
}

- (CRKChunkedFile)init
{
  return [(CRKChunkedFile *)self initWithFileDescriptor:0];
}

- (CRKChunkedFile)initWithFileDescriptor:(int)a3
{
  [(id)objc_opt_class() assertFileDescriptorIsValid:*(void *)&a3];
  v6.receiver = self;
  v6.super_class = (Class)CRKChunkedFile;
  result = [(CRKChunkedFile *)&v6 init];
  if (result) {
    result->mFileDescriptor = a3;
  }
  return result;
}

- (int64_t)readNextChunkIntoBuffer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CRKChunkedFile.m", 66, @"Invalid parameter not satisfying: %@", @"buffer" object file lineNumber description];
  }
  unint64_t v8 = [v7 length];
  id v9 = v7;
  v10 = (char *)[v9 mutableBytes];
  unint64_t v11 = [v9 length];
  while (2)
  {
    if (v11)
    {
      if (v8 >= v11) {
        unint64_t v12 = v11;
      }
      else {
        unint64_t v12 = v8;
      }
      if (v12 >= 0x7FFFFFFF) {
        size_t v13 = 0x7FFFFFFFLL;
      }
      else {
        size_t v13 = v12;
      }
      while (1)
      {
        unint64_t v14 = read(self->mFileDescriptor, v10, v13);
        if ((v14 & 0x8000000000000000) == 0) {
          break;
        }
        if (*__error() != 4)
        {
          if (a4)
          {
            *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
          }
          int64_t v15 = -1;
          goto LABEL_20;
        }
      }
      if (v14)
      {
        v11 -= v14;
        v10 += v14;
        if (v14 >= v13) {
          continue;
        }
      }
    }
    break;
  }
  int64_t v15 = v8 - v11;
LABEL_20:

  return v15;
}

@end