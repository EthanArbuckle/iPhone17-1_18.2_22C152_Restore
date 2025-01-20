@interface CLKCurrentLocaleSentinel
+ (CLKCurrentLocaleSentinel)shared;
- (id)_init;
- (void)_handleLocaleChange;
@end

@implementation CLKCurrentLocaleSentinel

+ (CLKCurrentLocaleSentinel)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CLKCurrentLocaleSentinel_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)sharedCurrentLocaleSentinel;

  return (CLKCurrentLocaleSentinel *)v2;
}

uint64_t __34__CLKCurrentLocaleSentinel_shared__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = sharedCurrentLocaleSentinel;
  sharedCurrentLocaleSentinel = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentLocaleSentinel;
  uint64_t v2 = [(CLKCurrentLocaleSentinel *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleLocaleChange name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (void)_handleLocaleChange
{
  _CLKUpdateIsLayoutRTL();
  _CLKUpdateLanguageIsTallScript();
  _CLKUpdateNumberSystem();
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"CLKLocaleNumberSystemChangedNotification" object:0];
}

@end