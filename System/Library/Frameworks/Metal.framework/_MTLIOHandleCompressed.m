@interface _MTLIOHandleCompressed
- (_MTLIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7;
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

@implementation _MTLIOHandleCompressed

- (_MTLIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7
{
  BOOL v7 = a7;
  v39[1] = *MEMORY[0x1E4F143B8];
  if (a6) {
    *a6 = 0;
  }
  v31.receiver = self;
  v31.super_class = (Class)_MTLIOHandleCompressed;
  v12 = [(_MTLObjectWithLabel *)&v31 init];
  if (v12)
  {
    v12->_device = (MTLDevice *)a3;
    int v13 = open(a4, 0);
    v12->_fd = v13;
    if ((v13 & 0x80000000) == 0)
    {
      if (fstat(v13, &v30) < 0)
      {
        if (!a6) {
          goto LABEL_22;
        }
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        uint64_t v37 = [NSString stringWithUTF8String:"Internal Error"];
        v26 = (void *)MEMORY[0x1E4F1C9E8];
        v27 = &v37;
        v28 = &v36;
      }
      else
      {
        if ((v30.st_mode & 0xF000) == 0x8000)
        {
          if (v7) {
            fcntl(v12->_fd, 48, 1);
          }
          v14 = MTLIOCreateDecompressionContext(v12->_fd, a5);
          v12->_handle = v14;
          if (v14)
          {
            if (MTLTraceEnabled())
            {
              kdebug_trace_string();
              if (MTLTraceEnabled())
              {
                [(_MTLIOHandleCompressed *)v12 globalTraceObjectID];
                [a3 registryID];
                kdebug_trace();
              }
            }
            return v12;
          }
          if (a6)
          {
            v15 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v16 = *__error();
            uint64_t v32 = *MEMORY[0x1E4F28568];
            v33 = @"Failed to create compression context because file was not compressed with MTLIOCompressionContext";
            v19 = (void *)MEMORY[0x1E4F1C9E8];
            v20 = &v33;
            v21 = &v32;
            goto LABEL_15;
          }
          goto LABEL_22;
        }
        if (!a6) {
          goto LABEL_22;
        }
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        uint64_t v35 = [NSString stringWithUTF8String:"Not a regular file"];
        v26 = (void *)MEMORY[0x1E4F1C9E8];
        v27 = &v35;
        v28 = &v34;
      }
      uint64_t v22 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
      v23 = v25;
      uint64_t v24 = 2;
      goto LABEL_21;
    }
    if (a6)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *__error();
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v17 = NSString;
      v18 = __error();
      v39[0] = objc_msgSend(v17, "stringWithFormat:", @"%s", strerror(*v18));
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = (__CFString **)v39;
      v21 = &v38;
LABEL_15:
      uint64_t v22 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
      v23 = v15;
      uint64_t v24 = v16;
LABEL_21:
      *a6 = (id)[v23 errorWithDomain:@"MTLIOError" code:v24 userInfo:v22];
    }
LABEL_22:

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  handle = self->_handle;
  if (handle) {
    MTLIODestroyDecompressionContext((uint64_t)handle);
  }

  v5.receiver = self;
  v5.super_class = (Class)_MTLIOHandleCompressed;
  [(_MTLObjectWithLabel *)&v5 dealloc];
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  size_t v12 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a4, a5);
  handle = self->_handle;

  return MTLIODecompressionContextRead((uint64_t)handle, (uint8_t *)a3, (uint8_t *)a6, v12, a4, a5, 1);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6
{
  size_t v11 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a3, a4);
  if (MTLIODecompressionContextRead((uint64_t)self->_handle, (uint8_t *)a5, (uint8_t *)a5 + a6 - v11, v11, a3, a4, 1) == a3) {
    return a5;
  }
  else {
    return 0;
  }
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8
{
  *a8 = 1;
  size_t v12 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a4, a5);
  off_t v13 = MTLIODecompressionContextOffset((uint64_t)self->_handle, a4, a5);
  int fd = self->_fd;

  return pread(fd, a6, v12, v13);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7
{
  *a7 = 1;
  size_t v12 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a3, a4);
  off_t v13 = MTLIODecompressionContextOffset((uint64_t)self->_handle, a3, a4);
  v14 = (char *)a5 + a6 - v12;
  if (pread(self->_fd, v14, v12, v13) >= v12) {
    return v14;
  }
  else {
    return 0;
  }
}

- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a3, a4);
}

- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4
{
  return MTLIODecompressionContextOffset((uint64_t)self->_handle, a3, a4);
}

- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  return MTLIODecompressionContextRead((uint64_t)self->_handle, (uint8_t *)a3, (uint8_t *)a6, a7, a4, a5, 0);
}

- (unint64_t)length
{
  uint64_t v2 = MTLIODecompressionContextSize((uint64_t)self->_handle);
  return v2 & ~(v2 >> 63);
}

@end