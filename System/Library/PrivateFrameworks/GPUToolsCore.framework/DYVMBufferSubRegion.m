@interface DYVMBufferSubRegion
- (DYVMBufferSubRegion)initWithDYVMBuffer:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (id)DYGPUToolsData;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation DYVMBufferSubRegion

- (DYVMBufferSubRegion)initWithDYVMBuffer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)DYVMBufferSubRegion;
  v7 = [(DYVMBufferSubRegion *)&v9 init];
  if (v7)
  {
    v7->_parent = (DYVMBuffer *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYVMBufferSubRegion;
  [(DYVMBufferSubRegion *)&v3 dealloc];
}

- (unint64_t)length
{
  return self->_range.length;
}

- (const)bytes
{
  result = [(DYVMBuffer *)self->_parent bytes];
  if (result) {
    return (char *)result + self->_range.location;
  }
  return result;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(DYVMBufferSubRegion *)self length]) {
    return 0;
  }
  v7 = -[DYVMBufferSubRegion initWithDYVMBuffer:range:]([DYVMBufferSubRegion alloc], "initWithDYVMBuffer:range:", self->_parent, self->_range.location + location, length);

  return v7;
}

- (id)DYGPUToolsData
{
  objc_super v3 = [(DYVMBufferSubRegion *)self bytes];
  if (v3)
  {
    v4 = v3;
    v5 = self;
    id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
    unint64_t v7 = [(DYVMBufferSubRegion *)self length];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__DYVMBufferSubRegion_DYGPUToolsData__block_invoke;
    v10[3] = &unk_265336F78;
    v10[4] = self;
    return (id)[v6 initWithBytesNoCopy:v4 length:v7 deallocator:v10];
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x263EFF8F8];
    return (id)[v9 data];
  }
}

void __37__DYVMBufferSubRegion_DYGPUToolsData__block_invoke(uint64_t a1)
{
}

@end