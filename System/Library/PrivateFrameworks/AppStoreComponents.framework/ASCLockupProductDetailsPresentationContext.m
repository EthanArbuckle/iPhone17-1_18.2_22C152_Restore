@interface ASCLockupProductDetailsPresentationContext
+ (ASCLockupProductDetailsPresentationContext)defaultPresentationContext;
- (ASCLockupProductDetailsPresentationContext)initWithPresentationStyle:(int64_t)a3;
- (int64_t)presentationStyle;
@end

@implementation ASCLockupProductDetailsPresentationContext

+ (ASCLockupProductDetailsPresentationContext)defaultPresentationContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ASCLockupProductDetailsPresentationContext_defaultPresentationContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPresentationContext_onceToken != -1) {
    dispatch_once(&defaultPresentationContext_onceToken, block);
  }
  v2 = (void *)defaultPresentationContext_context;

  return (ASCLockupProductDetailsPresentationContext *)v2;
}

uint64_t __72__ASCLockupProductDetailsPresentationContext_defaultPresentationContext__block_invoke(uint64_t a1)
{
  defaultPresentationContext_context = [objc_alloc(*(Class *)(a1 + 32)) initWithPresentationStyle:0];

  return MEMORY[0x1F41817F8]();
}

- (ASCLockupProductDetailsPresentationContext)initWithPresentationStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCLockupProductDetailsPresentationContext;
  result = [(ASCLockupProductDetailsPresentationContext *)&v5 init];
  if (result) {
    result->_presentationStyle = a3;
  }
  return result;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

@end