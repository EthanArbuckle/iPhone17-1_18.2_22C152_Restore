@interface CoreGraphicsContext
+ (CoreGraphicsContext)current;
- (BOOL)__createsImages;
- (CGContext)CGContext;
- (CoreGraphicsContext)initWithCGContext:(CGContext *)a3;
- (void)pop;
- (void)push;
@end

@implementation CoreGraphicsContext

- (BOOL)__createsImages
{
  return 0;
}

- (void)push
{
  v2 = (void *)_current();
  *(void *)(v3 + 8) = *v2;
  void *v2 = v3;
  v4 = (void (*)(void, char *))_pushContextIMP;
  if (_pushContextIMP) {
    BOOL v5 = _popContextIMP == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v4(0, sel_pushContext_);
  }
}

- (void)pop
{
  v2 = (void *)_current();
  void *v2 = v3;
  v4 = (void (*)(void, char *))_popContextIMP;
  if (_pushContextIMP) {
    BOOL v5 = _popContextIMP == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v4(0, sel_popContext_);
  }
}

- (CoreGraphicsContext)initWithCGContext:(CGContext *)a3
{
  if (_once != -1) {
    dispatch_once(&_once, &__block_literal_global_5);
  }
  v6.receiver = self;
  v6.super_class = (Class)CoreGraphicsContext;
  result = [(CoreGraphicsContext *)&v6 init];
  if (result) {
    result->_ctx = a3;
  }
  return result;
}

- (CGContext)CGContext
{
  return self->_ctx;
}

+ (CoreGraphicsContext)current
{
  return *(CoreGraphicsContext **)_current();
}

id __41__CoreGraphicsContext_initWithCGContext___block_invoke()
{
  Class v0 = NSClassFromString(&cfstr_Uigraphicsrend.isa);
  if (v0)
  {
    Class v1 = v0;
    _pushContextIMP = (_UNKNOWN *)[(objc_class *)v0 instanceMethodForSelector:sel_pushContext_];
    id result = (id)[(objc_class *)v1 instanceMethodForSelector:sel_popContext_];
    _popContextIMP = result;
  }
  else
  {
    return +[CoreTextGraphicsContextProvider sharedProvider];
  }
  return result;
}

@end