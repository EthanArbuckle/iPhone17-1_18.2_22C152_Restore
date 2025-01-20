@interface CLKRenderingContext
+ (id)sharedRenderingContext;
- (CLKDevice)device;
- (id)_init;
- (void)setDevice:(id)a3;
@end

@implementation CLKRenderingContext

- (CLKDevice)device
{
  device = self->_device;
  if (device)
  {
    v3 = device;
  }
  else
  {
    v3 = +[CLKDevice currentDevice];
  }

  return v3;
}

+ (id)sharedRenderingContext
{
  if (sharedRenderingContext_onceToken != -1) {
    dispatch_once(&sharedRenderingContext_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedRenderingContext_sharedRenderingContext;

  return v2;
}

uint64_t __45__CLKRenderingContext_sharedRenderingContext__block_invoke()
{
  sharedRenderingContext_sharedRenderingContext = [[CLKRenderingContext alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKRenderingContext;
  return [(CLKRenderingContext *)&v3 init];
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end