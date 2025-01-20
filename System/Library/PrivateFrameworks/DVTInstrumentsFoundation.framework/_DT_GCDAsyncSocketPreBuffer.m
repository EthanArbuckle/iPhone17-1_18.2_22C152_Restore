@interface _DT_GCDAsyncSocketPreBuffer
- (_DT_GCDAsyncSocketPreBuffer)initWithCapacity:(unint64_t)a3;
- (char)readBuffer;
- (char)writeBuffer;
- (unint64_t)availableBytes;
- (unint64_t)availableSpace;
- (void)dealloc;
- (void)didRead:(unint64_t)a3;
- (void)didWrite:(unint64_t)a3;
- (void)ensureCapacityForWrite:(unint64_t)a3;
- (void)getReadBuffer:(char *)a3 availableBytes:(unint64_t *)a4;
- (void)getWriteBuffer:(char *)a3 availableSpace:(unint64_t *)a4;
- (void)reset;
@end

@implementation _DT_GCDAsyncSocketPreBuffer

- (_DT_GCDAsyncSocketPreBuffer)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_DT_GCDAsyncSocketPreBuffer;
  v4 = [(_DT_GCDAsyncSocketPreBuffer *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->preBufferSize = a3;
    v6 = (char *)malloc_type_malloc(a3, 0x625C031CuLL);
    v5->preBuffer = v6;
    v5->readPointer = v6;
    v5->writePointer = v6;
  }
  return v5;
}

- (void)dealloc
{
  preBuffer = self->preBuffer;
  if (preBuffer) {
    free(preBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)_DT_GCDAsyncSocketPreBuffer;
  [(_DT_GCDAsyncSocketPreBuffer *)&v4 dealloc];
}

- (void)ensureCapacityForWrite:(unint64_t)a3
{
  unint64_t v5 = [(_DT_GCDAsyncSocketPreBuffer *)self availableSpace];
  if (a3 > v5)
  {
    size_t v6 = self->preBufferSize + a3 - v5;
    v7 = (char *)malloc_type_realloc(self->preBuffer, v6, 0xCD1D3198uLL);
    preBuffer = self->preBuffer;
    writePointer = self->writePointer;
    v10 = (char *)(self->readPointer - preBuffer);
    self->preBuffer = v7;
    self->preBufferSize = v6;
    self->readPointer = &v10[(void)v7];
    self->writePointer = &v7[writePointer - preBuffer];
  }
}

- (unint64_t)availableBytes
{
  return self->writePointer - self->readPointer;
}

- (char)readBuffer
{
  return self->readPointer;
}

- (void)getReadBuffer:(char *)a3 availableBytes:(unint64_t *)a4
{
  if (a3) {
    *a3 = self->readPointer;
  }
  if (a4) {
    *a4 = [(_DT_GCDAsyncSocketPreBuffer *)self availableBytes];
  }
}

- (void)didRead:(unint64_t)a3
{
  writePointer = self->writePointer;
  objc_super v4 = &self->readPointer[a3];
  self->readPointer = v4;
  if (v4 == writePointer)
  {
    preBuffer = self->preBuffer;
    self->readPointer = preBuffer;
    self->writePointer = preBuffer;
  }
}

- (unint64_t)availableSpace
{
  return (unint64_t)&self->preBuffer[self->preBufferSize - (unint64_t)self->writePointer];
}

- (char)writeBuffer
{
  return self->writePointer;
}

- (void)getWriteBuffer:(char *)a3 availableSpace:(unint64_t *)a4
{
  if (a3) {
    *a3 = self->writePointer;
  }
  if (a4) {
    *a4 = [(_DT_GCDAsyncSocketPreBuffer *)self availableSpace];
  }
}

- (void)didWrite:(unint64_t)a3
{
  self->writePointer += a3;
}

- (void)reset
{
  preBuffer = self->preBuffer;
  self->readPointer = preBuffer;
  self->writePointer = preBuffer;
}

@end