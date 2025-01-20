@interface _NSJSONWriter
- (BOOL)appendString:(id)a3 range:(_NSRange)a4;
- (NSError)failure;
- (_NSJSONWriter)init;
- (id)dataWithRootObject:(id)a3 options:(unint64_t)a4;
- (int64_t)writeRootObject:(id)a3 toStream:(id)a4 options:(unint64_t)a5;
- (void)dealloc;
- (void)resizeTemporaryBuffer:(void *)result;
- (void)setFailure:(id)a3;
@end

@implementation _NSJSONWriter

- (_NSJSONWriter)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSJSONWriter;
  result = [(_NSJSONWriter *)&v3 init];
  if (result)
  {
    result->tempBuffer = 0;
    result->tempBufferLen = 0;
    result->totalDataWritten = 0;
  }
  return result;
}

- (id)dataWithRootObject:(id)a3 options:(unint64_t)a4
{
  self->dataBuffer = (char *)malloc_type_malloc(0x1000uLL, 0x46665749uLL);
  *(_OWORD *)&self->dataBufferLen = xmmword_182371D10;
  self->freeDataBuffer = 1;
  self->kind = 1;
  if (!_writeJSONValue(self, (__CFString *)a3, 0, a4)) {
    return 0;
  }
  self->freeDataBuffer = 0;
  v7 = (void *)MEMORY[0x1E4F1C9B8];
  dataBuffer = self->dataBuffer;
  unint64_t dataLen = self->dataLen;

  return (id)[v7 dataWithBytesNoCopy:dataBuffer length:dataLen freeWhenDone:1];
}

- (void)resizeTemporaryBuffer:(void *)result
{
  if (result)
  {
    v2 = result;
    unint64_t v3 = result[8];
    BOOL v4 = v3 >= a2;
    unint64_t v5 = v3 >> 13;
    if (!v4 && v5 == 0)
    {
      unint64_t v7 = 0x2000;
      if (a2 < 0x2000) {
        unint64_t v7 = a2;
      }
      if (v7 <= 0x100) {
        size_t v8 = 256;
      }
      else {
        size_t v8 = v7;
      }
      v9 = (void *)result[7];
      if (v9) {
        free(v9);
      }
      result = malloc_type_malloc(v8, 0x3FF0B290uLL);
      v2[7] = result;
      v2[8] = v8;
    }
  }
  return result;
}

- (int64_t)writeRootObject:(id)a3 toStream:(id)a4 options:(unint64_t)a5
{
  self->outputStream = (NSOutputStream *)a4;
  self->kind = 2;
  self->dataBuffer = (char *)malloc_type_malloc(0x100uLL, 0xDA139C64uLL);
  self->dataBufferLen = 256;
  self->freeDataBuffer = 1;
  if (_writeJSONValue(self, (__CFString *)a3, 0, a5)) {
    return self->totalDataWritten;
  }
  else {
    return -1;
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  tempBuffer = self->tempBuffer;
  if (tempBuffer) {
    free(tempBuffer);
  }
  dataBuffer = self->dataBuffer;
  if (dataBuffer && self->freeDataBuffer) {
    free(dataBuffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)_NSJSONWriter;
  [(_NSJSONWriter *)&v5 dealloc];
}

- (BOOL)appendString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[_NSJSONWriter resizeTemporaryBuffer:](self, a4.length);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  size_t __n = 0;
  objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", self->tempBuffer, self->tempBufferLen, &__n, 4, 0, location, length, &v14);
  int appended = _appendBytes(self->tempBuffer, __n, (uint64_t)self, v8);
  if (appended)
  {
    uint64_t v10 = v15;
    if (v15)
    {
      do
      {
        objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", self->tempBuffer, self->tempBufferLen, &__n, 4, 0, v14, v10, &v14);
        LOBYTE(appended) = _appendBytes(self->tempBuffer, __n, (uint64_t)self, v11);
        uint64_t v10 = v15;
      }
      while (v15 && (appended & 1) != 0);
    }
    else
    {
      LOBYTE(appended) = 1;
    }
  }
  return appended;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFailure:(id)a3
{
}

@end