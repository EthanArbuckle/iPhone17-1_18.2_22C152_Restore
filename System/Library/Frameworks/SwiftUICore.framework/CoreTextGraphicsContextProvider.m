@interface CoreTextGraphicsContextProvider
+ (Class)colorClassForApplicationFrameworkContext:(int64_t)a3;
+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3;
+ (id)sharedProvider;
- (BOOL)isDrawingToScreen;
- (BOOL)isFlipped;
- (CGContext)CGContext;
- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3;
- (void)restoreGraphicsState;
- (void)saveGraphicsState;
@end

@implementation CoreTextGraphicsContextProvider

+ (id)sharedProvider
{
  if (sharedProvider_once != -1) {
    dispatch_once(&sharedProvider_once, &__block_literal_global_25);
  }
  return (id)sharedProvider_sharedPvdr;
}

uint64_t __49__CoreTextGraphicsContextProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedPvdr = objc_alloc_init(CoreTextGraphicsContextProvider);
  v0 = (void *)MEMORY[0x263F816A0];
  uint64_t v1 = objc_opt_class();

  return [v0 setTextGraphicsContextProviderClass:v1];
}

+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3
{
  return +[CoreTextGraphicsContextProvider sharedProvider];
}

+ (Class)colorClassForApplicationFrameworkContext:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)isFlipped
{
  return 1;
}

- (BOOL)isDrawingToScreen
{
  return 1;
}

- (CGContext)CGContext
{
  v2 = +[CoreGraphicsContext current];

  return [(CoreGraphicsContext *)v2 CGContext];
}

- (void)saveGraphicsState
{
  v2 = [+[CoreGraphicsContext current] CGContext];
  if (v2)
  {
    CGContextSaveGState(v2);
  }
}

- (void)restoreGraphicsState
{
  v2 = [+[CoreGraphicsContext current] CGContext];
  if (v2)
  {
    CGContextRestoreGState(v2);
  }
}

- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3
{
}

@end