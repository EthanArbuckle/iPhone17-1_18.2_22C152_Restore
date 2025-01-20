@interface _MTLIOHandleRaw
- (_MTLIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6;
- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7;
- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7;
- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8;
- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4;
- (void)dealloc;
- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6;
- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7;
@end

@implementation _MTLIOHandleRaw

- (_MTLIOHandleRaw)initWithDevice:(id)a3 path:(const char *)a4 error:(id *)a5 uncached:(BOOL)a6
{
  BOOL v6 = a6;
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a5) {
    *a5 = 0;
  }
  v25.receiver = self;
  v25.super_class = (Class)_MTLIOHandleRaw;
  v10 = [(_MTLObjectWithLabel *)&v25 init];
  if (v10)
  {
    v10->_device = (MTLDevice *)a3;
    int v11 = open(a4, 0);
    v10->_fd = v11;
    if (v11 < 0)
    {
      if (a5)
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *__error();
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v14 = NSString;
        v15 = __error();
        v31[0] = objc_msgSend(v14, "stringWithFormat:", @"%s", strerror(*v15));
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        v17 = v12;
        uint64_t v18 = v13;
LABEL_19:
        *a5 = (id)[v17 errorWithDomain:@"MTLIOError" code:v18 userInfo:v16];
      }
    }
    else if (fstat(v11, &v24) < 0)
    {
      if (a5)
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28568];
        uint64_t v29 = [NSString stringWithUTF8String:"Internal Error"];
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        v21 = &v29;
        v22 = &v28;
LABEL_18:
        uint64_t v16 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
        v17 = v19;
        uint64_t v18 = 2;
        goto LABEL_19;
      }
    }
    else
    {
      if ((v24.st_mode & 0xF000) == 0x8000)
      {
        if (v6) {
          fcntl(v10->_fd, 48, 1);
        }
        if (MTLTraceEnabled())
        {
          kdebug_trace_string();
          if (MTLTraceEnabled())
          {
            [(_MTLIOHandleRaw *)v10 globalTraceObjectID];
            [a3 registryID];
            kdebug_trace();
          }
        }
        return v10;
      }
      if (a5)
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        uint64_t v27 = [NSString stringWithUTF8String:"Not a regular file"];
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        v21 = &v27;
        v22 = &v26;
        goto LABEL_18;
      }
    }

    return 0;
  }
  return v10;
}

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }

  v4.receiver = self;
  v4.super_class = (Class)_MTLIOHandleRaw;
  [(_MTLObjectWithLabel *)&v4 dealloc];
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  return pread(self->_fd, a3, a4, a5);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6
{
  if (pread(self->_fd, a5, a3, a4) >= a3) {
    return a5;
  }
  else {
    return 0;
  }
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8
{
  *a8 = 0;
  return pread(self->_fd, a3, a4, a5);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7
{
  *a7 = 0;
  if (pread(self->_fd, a5, a3, a4) >= a3) {
    return a5;
  }
  else {
    return 0;
  }
}

- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return 0;
}

- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4
{
}

- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
}

- (unint64_t)length
{
  off_t v2 = lseek(self->_fd, 0, 2);
  return v2 & ~(v2 >> 63);
}

@end