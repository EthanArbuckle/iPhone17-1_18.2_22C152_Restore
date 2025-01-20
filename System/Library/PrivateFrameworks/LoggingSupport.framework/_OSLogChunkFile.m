@interface _OSLogChunkFile
- (_OSLogChunkFile)initWithFileDescriptor:(int)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation _OSLogChunkFile

- (void)dealloc
{
  ptr = (void *)self->super._ptr;
  if (ptr && munmap(ptr, self->super._sz) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v4.receiver = self;
  v4.super_class = (Class)_OSLogChunkFile;
  [(_OSLogChunkFile *)&v4 dealloc];
}

- (_OSLogChunkFile)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  v24[128] = *MEMORY[0x1E4F143B8];
  v24[0] = 0;
  uint64_t v7 = _os_trace_mmap();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = v24[0];
    if (fcntl(a3, 50, v24, 1024) == -1)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      }
      v14 = 0;
    }
    else
    {
      v10 = [NSString stringWithUTF8String:v24];
      v11 = [v10 pathComponents];
      unint64_t v12 = [v11 count];
      unint64_t v13 = v12 - 1;
      if (v12 > 1)
      {
        v16 = [v11 objectAtIndexedSubscript:v12 - 2];
        v17 = [v11 objectAtIndexedSubscript:v13];
        v18 = NSString;
        v23[0] = v16;
        v23[1] = v17;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        v14 = [v18 pathWithComponents:v19];
      }
      else if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"filePathAssemblerError" code:-1 userInfo:0];
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v14)
      {
        v22.receiver = self;
        v22.super_class = (Class)_OSLogChunkFile;
        v20 = [(_OSLogChunkStore *)&v22 initWithBytes:v8 size:v9];
        self = v20;
        if (v20)
        {
          [(_OSLogChunkStore *)v20 setFileName:v14];
          self = self;
          v15 = self;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    v15 = 0;
    goto LABEL_18;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  }
  v15 = 0;
LABEL_19:

  return v15;
}

@end