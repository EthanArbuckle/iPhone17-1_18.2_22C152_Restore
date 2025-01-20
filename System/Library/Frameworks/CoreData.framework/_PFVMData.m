@interface _PFVMData
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFVMData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (_PFVMData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation _PFVMData

- (const)bytes
{
  return self->_payload;
}

- (unint64_t)length
{
  return self->_length;
}

- (_PFVMData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)_PFVMData;
  v7 = [(_PFVMData *)&v26 init];
  if (!v7) {
    return v7;
  }
  v8 = (const char *)[a3 fileSystemRepresentation];
  if (v8)
  {
    int v9 = open(v8, 0);
    if ((v9 & 0x80000000) == 0)
    {
      int v10 = v9;
      fcntl(v9, 48, 1);
      memset(&v25, 0, sizeof(v25));
      if (fstat(v10, &v25))
      {
        if (a5)
        {
          uint64_t v11 = *__error();
          uint64_t v12 = *MEMORY[0x1E4F28798];
          v33[0] = *MEMORY[0x1E4F28328];
          v33[1] = @"reason";
          v34[0] = a3;
          v34[1] = @"fstat failed";
          *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v12, v11, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
        }
        close(v10);
        goto LABEL_21;
      }
      off_t st_size = v25.st_size;
      v7->_length = v25.st_size;
      if (!st_size) {
        goto LABEL_18;
      }
      v16 = mmap(0, st_size, 3, 4098, 754974720, 0);
      v7->_payload = v16;
      if (v16)
      {
        if (read(v10, v16, v7->_length) == v7->_length) {
          goto LABEL_18;
        }
        uint64_t v17 = *__error();
        munmap(v7->_payload, v7->_length);
        v7->_payload = 0;
        if (!a5) {
          goto LABEL_18;
        }
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28798];
        v31[0] = *MEMORY[0x1E4F28328];
        v31[1] = @"reason";
        v32[0] = a3;
        v32[1] = @"read failed";
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        v21 = v32;
        v22 = v31;
      }
      else
      {
        v23 = __error();
        if (!a5)
        {
LABEL_18:
          close(v10);
          goto LABEL_19;
        }
        uint64_t v17 = *v23;
        v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28798];
        v29[0] = *MEMORY[0x1E4F28328];
        v29[1] = @"reason";
        v30[0] = a3;
        v30[1] = @"mmap failed";
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        v21 = v30;
        v22 = v29;
      }
      *a5 = (id)objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v17, objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 2));
      goto LABEL_18;
    }
    if (a5)
    {
      uint64_t v13 = *__error();
      uint64_t v14 = *MEMORY[0x1E4F28798];
      v27[0] = *MEMORY[0x1E4F28328];
      v27[1] = @"reason";
      v28[0] = a3;
      v28[1] = @"open failed";
      *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v14, v13, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    }
  }
LABEL_19:
  if (!v7->_payload && v7->_length)
  {
LABEL_21:

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  payload = self->_payload;
  if (payload) {
    munmap(payload, self->_length);
  }
  v4.receiver = self;
  v4.super_class = (Class)_PFVMData;
  [(_PFVMData *)&v4 dealloc];
}

- (_PFVMData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_PFVMData;
  v6 = [(_PFVMData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_length = a4;
    v8 = mmap(0, a4, 3, 4098, 754974720, 0);
    v7->_payload = v8;
    memcpy(v8, a3, a4);
  }
  return v7;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end