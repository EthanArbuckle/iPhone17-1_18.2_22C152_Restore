@interface GTVMBufferSubRegion_capture
- (GTVMBufferSubRegion_capture)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (id)GTGPUToolsData;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation GTVMBufferSubRegion_capture

- (id)GTGPUToolsData
{
  v3 = [(GTVMBufferSubRegion_capture *)self bytes];
  if (v3)
  {
    v4 = v3;
    v5 = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __37__GTVMBufferSubRegion_GTGPUToolsData__block_invoke;
    v7[3] = &unk_221488;
    v7[4] = self;
    return objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:deallocator:", v4, -[GTVMBufferSubRegion_capture length](self, "length"), v7);
  }
  else
  {
    return +[NSData data];
  }
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(GTVMBufferSubRegion_capture *)self length]) {
    return 0;
  }
  v7 = -[GTVMBufferSubRegion_capture initWithGTVMBuffer:range:]([GTVMBufferSubRegion_capture alloc], "initWithGTVMBuffer:range:", self->_parent, self->_range.location + location, length);

  return v7;
}

- (const)bytes
{
  result = [(GTVMBuffer_capture *)self->_parent bytes];
  if (result) {
    return (char *)result + self->_range.location;
  }
  return result;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GTVMBufferSubRegion_capture;
  [(GTVMBufferSubRegion_capture *)&v3 dealloc];
}

- (GTVMBufferSubRegion_capture)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)GTVMBufferSubRegion_capture;
  v7 = [(GTVMBufferSubRegion_capture *)&v9 init];
  if (v7)
  {
    v7->_parent = (GTVMBuffer_capture *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }
  return v7;
}

@end