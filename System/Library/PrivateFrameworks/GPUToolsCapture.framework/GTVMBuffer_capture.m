@interface GTVMBuffer_capture
- (GTVMBuffer_capture)initWithCapacity:(unint64_t)a3;
- (GTVMBuffer_capture)initWithLength:(unint64_t)a3;
- (GTVMBuffer_capture)initWithVMBuffer:(VMBuffer *)a3;
- (VMBuffer)vmBuffer;
- (const)bytes;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation GTVMBuffer_capture

- (VMBuffer)vmBuffer
{
  return self->_vmBuffer;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(GTVMBuffer_capture *)self length]) {
    return 0;
  }
  v7 = -[GTVMBufferSubRegion_capture initWithGTVMBuffer:range:]([GTVMBufferSubRegion_capture alloc], "initWithGTVMBuffer:range:", self, location, length);

  return v7;
}

- (void)setLength:(unint64_t)a3
{
  vmBuffer = self->_vmBuffer;
  if (vmBuffer->var1 < a3)
  {
    GPUTools::VMBuffer::resize((GPUTools::VMBuffer *)vmBuffer, a3);
    vmBuffer = self->_vmBuffer;
  }
  unint64_t var5 = vmBuffer->var5;
  unint64_t v7 = var5 - 1;
  uint64_t v8 = var5 - 1 + vmBuffer->var0;
  uint64_t v9 = -(uint64_t)var5;
  unint64_t v10 = (v8 & v9) - vmBuffer->var0;
  vmBuffer->var3 = v10;
  vmBuffer->var4 = v10 + ((v7 + a3) & v9);
}

- (void)mutableBytes
{
  return (void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (const)bytes
{
  return (const void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (unint64_t)length
{
  return self->_vmBuffer->var4;
}

- (void)dealloc
{
  if (self->_vmBuffer)
  {
    GPUTools::VMBuffer::_dealloc(&self->_vmBuffer->var0);
    operator delete();
  }
  v2.receiver = self;
  v2.super_class = (Class)GTVMBuffer_capture;
  [(GTVMBuffer_capture *)&v2 dealloc];
}

- (GTVMBuffer_capture)initWithLength:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTVMBuffer_capture;
  if ([(GTVMBuffer_capture *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (GTVMBuffer_capture)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTVMBuffer_capture;
  if ([(GTVMBuffer_capture *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (GTVMBuffer_capture)initWithVMBuffer:(VMBuffer *)a3
{
  if (!a3) {
    __assert_rtn("-[GTVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer"");
  }
  v5.receiver = self;
  v5.super_class = (Class)GTVMBuffer_capture;
  result = [(GTVMBuffer_capture *)&v5 init];
  if (result) {
    result->_vmBuffer = a3;
  }
  return result;
}

@end