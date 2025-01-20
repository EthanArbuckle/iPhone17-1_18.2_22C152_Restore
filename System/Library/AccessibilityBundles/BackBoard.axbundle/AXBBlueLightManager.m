@interface AXBBlueLightManager
+ (id)sharedManager;
- (AXBBlueLightManager)init;
- (BOOL)adaptationEnabled;
- (BOOL)blueLightStatusEnabled;
- (BOOL)brightnessFiltersEnabled;
- (BOOL)supportsAdaptation;
- (BOOL)supportsBlueLightReduction;
- (void)dealloc;
- (void)disableBrightnessFilters;
- (void)restoreCachedBrightnessFilters;
@end

@implementation AXBBlueLightManager

- (AXBBlueLightManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXBBlueLightManager;
  v2 = [(AXBBlueLightManager *)&v12 init];
  if (v2)
  {
    v3 = (CBClient *)objc_alloc_init(MEMORY[0x263F34248]);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v3;

    v5 = [(CBClient *)v2->_brightnessClient blueLightClient];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__AXBBlueLightManager_init__block_invoke;
    v10[3] = &unk_26510B628;
    v6 = v2;
    v11 = v6;
    [v5 setStatusNotificationBlock:v10];

    uint64_t v7 = [(AXBBlueLightManager *)v6 supportsBlueLightReduction];
    v8 = [MEMORY[0x263F22938] sharedInstance];
    [v8 setSupportsAdvancedDisplayFilters:v7];
  }
  return v2;
}

void __27__AXBBlueLightManager_init__block_invoke(uint64_t a1, long long *a2)
{
  long long v2 = a2[1];
  long long v8 = *a2;
  long long v9 = v2;
  uint64_t v10 = *((void *)a2 + 4);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__AXBBlueLightManager_init__block_invoke_2;
  v3[3] = &unk_26510B600;
  id v4 = *(id *)(a1 + 32);
  long long v5 = v8;
  long long v6 = v9;
  uint64_t v7 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __27__AXBBlueLightManager_init__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 41);
  return result;
}

- (void)dealloc
{
  v3 = [(CBClient *)self->_brightnessClient blueLightClient];
  [v3 setStatusNotificationBlock:0];

  v4.receiver = self;
  v4.super_class = (Class)AXBBlueLightManager;
  [(AXBBlueLightManager *)&v4 dealloc];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_1);
  }
  long long v2 = (void *)sharedManager_manager;

  return v2;
}

uint64_t __36__AXBBlueLightManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(AXBBlueLightManager);

  return MEMORY[0x270F9A758]();
}

- (BOOL)supportsBlueLightReduction
{
  long long v2 = [(CBClient *)self->_brightnessClient blueLightClient];
  char v3 = [v2 supported];

  return v3;
}

- (void)disableBrightnessFilters
{
  if ([(AXBBlueLightManager *)self blueLightStatusEnabled])
  {
    char v3 = [(CBClient *)self->_brightnessClient blueLightClient];
    [v3 getBlueLightStatus:&v9];

    [NSNumber numberWithUnsignedInt:DWORD1(v9)];
    _AXSSetCacheForBrightnessFilter();
    objc_super v4 = [(CBClient *)self->_brightnessClient blueLightClient];
    [v4 setMode:0];

    long long v5 = [(CBClient *)self->_brightnessClient blueLightClient];
    [v5 setEnabled:0];
  }
  if ([(AXBBlueLightManager *)self adaptationEnabled])
  {
    long long v6 = NSNumber;
    uint64_t v7 = [(CBClient *)self->_brightnessClient adaptationClient];
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "getEnabled"));

    _AXSSetCacheForBrightnessFilter();
    long long v8 = [(CBClient *)self->_brightnessClient adaptationClient];
    [v8 setEnabled:0];
  }
}

- (BOOL)brightnessFiltersEnabled
{
  if ([(AXBBlueLightManager *)self blueLightStatusEnabled]) {
    return 1;
  }

  return [(AXBBlueLightManager *)self adaptationEnabled];
}

- (BOOL)blueLightStatusEnabled
{
  char v3 = [(CBClient *)self->_brightnessClient blueLightClient];
  int v4 = [v3 supported];

  BOOL result = 0;
  if (v4)
  {
    long long v5 = [(CBClient *)self->_brightnessClient blueLightClient];
    [v5 getBlueLightStatus:v7];

    if (self->_blueLightStatusEnabled | v7[1] || v8) {
      return 1;
    }
  }
  return result;
}

- (void)restoreCachedBrightnessFilters
{
  if (!_AXSScreenFilterApplied())
  {
    char v3 = [(CBClient *)self->_brightnessClient blueLightClient];
    int v4 = [v3 supported];

    if (v4)
    {
      if (![(AXBBlueLightManager *)self blueLightStatusEnabled])
      {
        long long v5 = (void *)_AXSCachedValueForBrightnessFilter();
        if (v5)
        {
          uint64_t v6 = [v5 intValue];
          uint64_t v7 = [(CBClient *)self->_brightnessClient blueLightClient];
          [v7 setMode:v6];
        }
      }
      _AXSSetCacheForBrightnessFilter();
    }
    int v8 = [(CBClient *)self->_brightnessClient adaptationClient];
    int v9 = [v8 supported];

    if (v9)
    {
      if (![(AXBBlueLightManager *)self adaptationEnabled])
      {
        uint64_t v10 = (void *)_AXSCachedValueForBrightnessFilter();
        if (v10)
        {
          uint64_t v11 = [v10 BOOLValue];
          objc_super v12 = [(CBClient *)self->_brightnessClient adaptationClient];
          [v12 setEnabled:v11];
        }
      }
      _AXSSetCacheForBrightnessFilter();
    }
  }
}

- (BOOL)adaptationEnabled
{
  char v3 = [(CBClient *)self->_brightnessClient adaptationClient];
  int v4 = [v3 supported];

  if (!v4) {
    return 0;
  }
  long long v5 = [(CBClient *)self->_brightnessClient adaptationClient];
  char v6 = [v5 getEnabled];

  return v6;
}

- (BOOL)supportsAdaptation
{
  long long v2 = [(CBClient *)self->_brightnessClient adaptationClient];
  char v3 = [v2 supported];

  return v3;
}

- (void).cxx_destruct
{
}

@end