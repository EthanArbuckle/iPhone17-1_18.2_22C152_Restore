@interface SharedDefaults
+ (NSString)measureUnits;
+ (id)defaults;
+ (id)getDefaultValues;
+ (int64_t)currentMeasureUnits;
+ (void)setupSpecifier:(id)a3;
- (SharedDefaults)init;
- (int64_t)cachedMeasureUnits;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCachedMeasureUnits:(int64_t)a3;
@end

@implementation SharedDefaults

- (SharedDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)SharedDefaults;
  v2 = [(SharedDefaults *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v4 = [(id)objc_opt_class() measureUnits];
    [v3 addObserver:v2 forKeyPath:v4 options:5 context:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [(id)objc_opt_class() measureUnits];
  [v3 removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)SharedDefaults;
  [(SharedDefaults *)&v5 dealloc];
}

+ (id)defaults
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SharedDefaults_defaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaults_onceToken[0] != -1) {
    dispatch_once(defaults_onceToken, block);
  }
  v2 = (void *)defaults_defaults;
  return v2;
}

uint64_t __26__SharedDefaults_defaults__block_invoke(uint64_t a1)
{
  defaults_defaults = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (NSString)measureUnits
{
  return (NSString *)@"kMeasureUnitsV1";
}

+ (id)getDefaultValues
{
  return (id)MEMORY[0x263EFFA78];
}

+ (void)setupSpecifier:(id)a3
{
  id v10 = a3;
  v4 = [v10 propertyForKey:*MEMORY[0x263F60070]];
  uint64_t v5 = [v10 propertyForKey:*MEMORY[0x263F60170]];
  objc_super v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && [v4 isEqualToString:@"com.apple.measure"])
  {
    v8 = [a1 getDefaultValues];
    v9 = [v8 objectForKeyedSubscript:v6];
    if (v9) {
      [v10 setProperty:v9 forKey:*MEMORY[0x263F60068]];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v8 = [(id)objc_opt_class() measureUnits];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v11 = [(id)objc_opt_class() measureUnits];
    id v13 = [v10 valueForKeyPath:v11];

    if (v13) {
      uint64_t SystemDefault = [v13 integerValue];
    }
    else {
      uint64_t SystemDefault = MeasureUnitsGetSystemDefault();
    }
    [(SharedDefaults *)self setCachedMeasureUnits:SystemDefault];
  }
}

+ (int64_t)currentMeasureUnits
{
  v2 = [a1 defaults];
  int64_t v3 = [v2 cachedMeasureUnits];

  return v3;
}

- (int64_t)cachedMeasureUnits
{
  return self->_cachedMeasureUnits;
}

- (void)setCachedMeasureUnits:(int64_t)a3
{
  self->_cachedMeasureUnits = a3;
}

@end