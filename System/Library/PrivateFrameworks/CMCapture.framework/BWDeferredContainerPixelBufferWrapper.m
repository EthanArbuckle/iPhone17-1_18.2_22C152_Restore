@interface BWDeferredContainerPixelBufferWrapper
- (void)dealloc;
- (void)initWithPixelBuffer:(void *)a3 owner:;
@end

@implementation BWDeferredContainerPixelBufferWrapper

- (void)initWithPixelBuffer:(void *)a3 owner:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)BWDeferredContainerPixelBufferWrapper;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a3;
    objc_setAssociatedObject(a2, @"pixelBufferWrapper", v5, (void *)0x301);
  }
  return v5;
}

- (void)dealloc
{
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  [(BWDeferredContainerPixelBufferPoolWrapper *)self->_owner signal];

  if (*v3 == 1) {
    kdebug_trace();
  }
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredContainerPixelBufferWrapper;
  [(BWDeferredContainerPixelBufferWrapper *)&v4 dealloc];
}

@end