@interface OSLogEventBacktraceFrame
- (NSUUID)imageUUID;
- (OSLogEventBacktraceFrame)initWithUUIDBytes:(const char *)a3 andOffset:(unint64_t)a4;
- (const)imageUUIDBytes;
- (unint64_t)imageOffset;
- (void)dealloc;
@end

@implementation OSLogEventBacktraceFrame

- (unint64_t)imageOffset
{
  return self->_imageOffset;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OSLogEventBacktraceFrame;
  [(OSLogEventBacktraceFrame *)&v3 dealloc];
}

- (OSLogEventBacktraceFrame)initWithUUIDBytes:(const char *)a3 andOffset:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OSLogEventBacktraceFrame;
  result = [(OSLogEventBacktraceFrame *)&v7 init];
  if (result)
  {
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
    result->_imageOffset = a4;
  }
  return result;
}

- (NSUUID)imageUUID
{
  result = self->_imageUUID;
  if (!result)
  {
    result = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_uuid];
    self->_imageUUID = result;
  }
  return result;
}

- (const)imageUUIDBytes
{
  return (const char *)self->_uuid;
}

@end