@interface GTVMBuffer_tools_diagnostics
- (GTVMBuffer_tools_diagnostics)initWithCapacity:(unint64_t)a3;
- (GTVMBuffer_tools_diagnostics)initWithLength:(unint64_t)a3;
- (GTVMBuffer_tools_diagnostics)initWithVMBuffer:(VMBuffer *)a3;
- (VMBuffer)vmBuffer;
- (const)bytes;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation GTVMBuffer_tools_diagnostics

- (VMBuffer)vmBuffer
{
  return self->_vmBuffer;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(GTVMBuffer_tools_diagnostics *)self length]) {
    return 0;
  }
  v7 = -[GTVMBufferSubRegion_tools_diagnostics initWithGTVMBuffer:range:]([GTVMBufferSubRegion_tools_diagnostics alloc], "initWithGTVMBuffer:range:", self, location, length);

  return v7;
}

- (void)setLength:(unint64_t)a3
{
  vmBuffer = self->_vmBuffer;
  unint64_t var1 = vmBuffer->var1;
  if (var1 < a3)
  {
    vm_address_t var0 = vmBuffer->var0;
    uint64_t var2 = vmBuffer->var2;
    if (GPUTools::VMBuffer::_alloc((GPUTools::VMBuffer *)self->_vmBuffer, a3, var2))
    {
      if (var1 >= vmBuffer->var1) {
        vm_size_t v9 = vmBuffer->var1;
      }
      else {
        vm_size_t v9 = var1;
      }
      if (vm_copy(mach_task_self_, var0, v9, vmBuffer->var0)) {
        GPUTools::VMBuffer::_dealloc(&vmBuffer->var0);
      }
      else {
        vm_deallocate(mach_task_self_, var0, vm_page_size + var1 + var1 * var2);
      }
    }
    vmBuffer = self->_vmBuffer;
  }
  unint64_t var5 = vmBuffer->var5;
  unint64_t v11 = var5 - 1;
  uint64_t v12 = var5 - 1 + vmBuffer->var0;
  uint64_t v13 = -(uint64_t)var5;
  unint64_t v14 = (v12 & v13) - vmBuffer->var0;
  vmBuffer->var3 = v14;
  vmBuffer->var4 = v14 + ((v11 + a3) & v13);
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
  v2.super_class = (Class)GTVMBuffer_tools_diagnostics;
  [(GTVMBuffer_tools_diagnostics *)&v2 dealloc];
}

- (GTVMBuffer_tools_diagnostics)initWithLength:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTVMBuffer_tools_diagnostics;
  if ([(GTVMBuffer_tools_diagnostics *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (GTVMBuffer_tools_diagnostics)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTVMBuffer_tools_diagnostics;
  if ([(GTVMBuffer_tools_diagnostics *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (GTVMBuffer_tools_diagnostics)initWithVMBuffer:(VMBuffer *)a3
{
  if (!a3) {
    __assert_rtn("-[GTVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer"");
  }
  v5.receiver = self;
  v5.super_class = (Class)GTVMBuffer_tools_diagnostics;
  result = [(GTVMBuffer_tools_diagnostics *)&v5 init];
  if (result) {
    result->_vmBuffer = a3;
  }
  return result;
}

@end