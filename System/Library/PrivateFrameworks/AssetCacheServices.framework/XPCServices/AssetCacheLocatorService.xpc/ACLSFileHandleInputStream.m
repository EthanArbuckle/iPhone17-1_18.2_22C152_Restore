@interface ACLSFileHandleInputStream
- (ACLSFileHandleInputStream)initWithFileHandle:(id)a3 fileOffset:(int64_t)a4 length:(int64_t)a5;
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (NSFileHandle)fileHandle;
- (id)streamError;
- (int64_t)fileEndOffset;
- (int64_t)fileOffset;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)status;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setFileEndOffset:(int64_t)a3;
- (void)setFileHandle:(id)a3;
- (void)setFileOffset:(int64_t)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation ACLSFileHandleInputStream

- (ACLSFileHandleInputStream)initWithFileHandle:(id)a3 fileOffset:(int64_t)a4 length:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACLSFileHandleInputStream;
  v10 = [(ACLSFileHandleInputStream *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fileHandle, a3);
    v11->_fileOffset = a4;
    v11->_fileEndOffset = a5 + a4;
    v11->_status = 0;
  }

  return v11;
}

- (void)open
{
  self->_status = 2;
}

- (void)close
{
  self->_status = 6;
}

- (unint64_t)streamStatus
{
  if (self->_status == 6) {
    return 6;
  }
  if ([(ACLSFileHandleInputStream *)self hasBytesAvailable]) {
    return self->_status;
  }
  unint64_t result = 5;
  self->_status = 5;
  return result;
}

- (id)streamError
{
  return 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return 1;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  if (self->_fileEndOffset - self->_fileOffset >= a4) {
    size_t v5 = a4;
  }
  else {
    size_t v5 = self->_fileEndOffset - self->_fileOffset;
  }
  int64_t result = pread([(NSFileHandle *)self->_fileHandle fileDescriptor], a3, v5, self->_fileOffset);
  if (result >= 1) {
    self->_fileOffset += result;
  }
  return result;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return self->_fileOffset < self->_fileEndOffset;
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (int64_t)fileOffset
{
  return self->_fileOffset;
}

- (void)setFileOffset:(int64_t)a3
{
  self->_fileOffset = a3;
}

- (int64_t)fileEndOffset
{
  return self->_fileEndOffset;
}

- (void)setFileEndOffset:(int64_t)a3
{
  self->_fileEndOffset = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end