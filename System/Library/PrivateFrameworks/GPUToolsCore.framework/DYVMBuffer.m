@interface DYVMBuffer
- (DYVMBuffer)initWithCapacity:(unint64_t)a3;
- (DYVMBuffer)initWithLength:(unint64_t)a3;
- (DYVMBuffer)initWithVMBuffer:(VMBuffer *)a3;
- (VMBuffer)vmBuffer;
- (const)bytes;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation DYVMBuffer

- (DYVMBuffer)initWithVMBuffer:(VMBuffer *)a3
{
  if (!a3) {
    __assert_rtn("-[DYVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer"");
  }
  v5.receiver = self;
  v5.super_class = (Class)DYVMBuffer;
  result = [(DYVMBuffer *)&v5 init];
  if (result) {
    result->_vmBuffer = a3;
  }
  return result;
}

- (DYVMBuffer)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DYVMBuffer;
  if ([(DYVMBuffer *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (DYVMBuffer)initWithLength:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DYVMBuffer;
  if ([(DYVMBuffer *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  vmBuffer = self->_vmBuffer;
  if (vmBuffer)
  {
    GPUTools::VMBuffer::~VMBuffer((GPUTools::VMBuffer *)vmBuffer);
    MEMORY[0x253360DD0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)DYVMBuffer;
  [(DYVMBuffer *)&v4 dealloc];
}

- (unint64_t)length
{
  return self->_vmBuffer->var4;
}

- (const)bytes
{
  return (const void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (void)mutableBytes
{
  return (void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
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

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(DYVMBuffer *)self length]) {
    return 0;
  }
  unint64_t v7 = -[DYVMBufferSubRegion initWithDYVMBuffer:range:]([DYVMBufferSubRegion alloc], "initWithDYVMBuffer:range:", self, location, length);

  return v7;
}

- (VMBuffer)vmBuffer
{
  return self->_vmBuffer;
}

@end