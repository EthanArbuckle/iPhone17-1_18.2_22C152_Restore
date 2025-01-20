@interface CALNNullTravelEngine
+ (CALNNullTravelEngine)sharedInstance;
- (CALNTravelEngineDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CALNNullTravelEngine

+ (CALNNullTravelEngine)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CALNNullTravelEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_18 != -1) {
    dispatch_once(&sharedInstance_onceToken_18, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_15;
  return (CALNNullTravelEngine *)v2;
}

uint64_t __38__CALNNullTravelEngine_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_15 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CALNTravelEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNTravelEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end