@interface EQKitEnvironment
+ (EQKitEnvironment)defaultEnvironment;
+ (NSData)defaultEnvironmentData;
+ (NSSet)legacySTIXFontNames;
+ (NSString)defaultMathFontName;
+ (id)createDefaultEnvironment;
+ (id)i_operatorDictionaryURL;
+ (id)propertyListWithData:(id)a3 error:(id *)a4;
- (BOOL)allowSingleLineHeight;
- (BOOL)fontsLoadedCorrectly;
- (BOOL)i_requiresLegacySTIXFonts;
- (BOOL)isKerningEnabled;
- (BOOL)needsToReloadFontsWhenAddingFontNamed:(id)a3;
- (BOOL)sourceAttribution;
- (EQKitEnvironment)initWithConfig:(id)a3;
- (EQKitEnvironment)initWithData:(id)a3;
- (NSData)data;
- (NSString)mathFontName;
- (__CTFont)defaultFontOfSize:(double)a3;
- (const)blahtexConfig;
- (const)fontManager;
- (const)kerningManager;
- (const)layoutConfig;
- (const)operatorDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)i_configCopy;
- (id)i_fontsDictionary;
- (id)i_mathFontName;
- (void)beginLayout;
- (void)dealloc;
- (void)endLayout;
- (void)reloadFonts;
- (void)setAllowSingleLineHeight:(BOOL)a3;
- (void)setKerningEnabled:(BOOL)a3;
- (void)setMathFontName:(id)a3;
- (void)setSourceAttribution:(BOOL)a3;
- (void)setUsesLegacySTIXFonts:(BOOL)a3;
@end

@implementation EQKitEnvironment

- (EQKitEnvironment)initWithConfig:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EQKitEnvironment;
  v6 = [(EQKitEnvironment *)&v18 init];
  v7 = v6;
  if (v6)
  {
    p_config = (id *)&v6->_config;
    objc_storeStrong((id *)&v6->_config, a3);
    v9 = +[EQKitEnvironment i_operatorDictionaryURL];
    v7->_operatorDictionary = EQKit::Config::Operator::Dictionary::dictionaryFromURL(v9, v10);

    uint64_t v11 = objc_opt_class();
    v12 = [*p_config objectForKeyedSubscript:@"version"];
    EQKitUtilDynamicCast(v11, (uint64_t)v12);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    EQKit::Environment::Version::Version((EQKit::Environment::Version *)&v17, v13);

    v14 = [(EQKitEnvironment *)v7 i_fontsDictionary];
    if (v17 <= 4)
    {
      v15 = +[EQKitEnvironment defaultMathFontName];
      [v14 setObject:v15 forKeyedSubscript:@"mathFontName"];

      [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"requiresLegacySTIXFonts"];
    }
    operator new();
  }

  return 0;
}

- (EQKitEnvironment)initWithData:(id)a3
{
  id v8 = 0;
  v4 = +[EQKitEnvironment propertyListWithData:a3 error:&v8];
  id v5 = v8;
  v6 = [(EQKitEnvironment *)self initWithConfig:v4];

  return v6;
}

- (void)dealloc
{
  operatorDictionary = (EQKit::Config::Operator::Dictionary *)self->_operatorDictionary;
  if (operatorDictionary)
  {
    EQKit::Config::Operator::Dictionary::~Dictionary(operatorDictionary);
    MEMORY[0x25A290040]();
  }
  fontManager = self->_fontManager;
  if (fontManager) {
    (*((void (**)(Manager *, SEL))fontManager->var0 + 1))(fontManager, a2);
  }
  kerningManager = (EQKit::Kerning::Manager *)self->_kerningManager;
  if (kerningManager)
  {
    EQKit::Kerning::Manager::~Manager(kerningManager);
    MEMORY[0x25A290040]();
  }
  layoutConfig = self->_layoutConfig;
  if (layoutConfig) {
    MEMORY[0x25A290040](layoutConfig, 0x1000C4000313F17);
  }
  blahtexConfig = self->_blahtexConfig;
  if (blahtexConfig)
  {
    std::__hash_table<wchar_t,std::hash<wchar_t>,std::equal_to<wchar_t>,std::allocator<wchar_t>>::~__hash_table((uint64_t)blahtexConfig + 40);
    uint64_t v8 = std::__hash_table<wchar_t,std::hash<wchar_t>,std::equal_to<wchar_t>,std::allocator<wchar_t>>::~__hash_table((uint64_t)blahtexConfig);
    MEMORY[0x25A290040](v8, 0x10A0C40864A76ABLL);
  }
  v9.receiver = self;
  v9.super_class = (Class)EQKitEnvironment;
  [(EQKitEnvironment *)&v9 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EQKitEnvironment alloc];
  id v5 = [(EQKitEnvironment *)self i_configCopy];
  v6 = [(EQKitEnvironment *)v4 initWithConfig:v5];

  return v6;
}

- (NSData)data
{
  config = self->_config;
  uint64_t v5 = 0;
  v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:config format:100 options:0 error:&v5];

  return (NSData *)v3;
}

+ (id)propertyListWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  uint64_t v6 = objc_opt_class();
  v7 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:1 format:&v10 error:a4];
  uint64_t v8 = EQKitUtilDynamicCast(v6, (uint64_t)v7);

  return v8;
}

+ (EQKitEnvironment)defaultEnvironment
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__EQKitEnvironment_defaultEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[EQKitEnvironment defaultEnvironment]::onceToken != -1) {
    dispatch_once(&+[EQKitEnvironment defaultEnvironment]::onceToken, block);
  }
  v2 = (void *)+[EQKitEnvironment defaultEnvironment]::sInstance;

  return (EQKitEnvironment *)v2;
}

uint64_t __38__EQKitEnvironment_defaultEnvironment__block_invoke(uint64_t a1)
{
  +[EQKitEnvironment defaultEnvironment]::sInstance = [*(id *)(a1 + 32) createDefaultEnvironment];

  return MEMORY[0x270F9A758]();
}

+ (id)createDefaultEnvironment
{
  v2 = [a1 defaultEnvironmentData];
  if (!v2
    || (uint64_t v6 = 0,
        +[EQKitEnvironment propertyListWithData:v2 error:&v6], (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v4 = [[EQKitEnvironment alloc] initWithConfig:v3];

  return v4;
}

+ (NSData)defaultEnvironmentData
{
  if (+[EQKitEnvironment defaultEnvironmentData]::onceToken != -1) {
    dispatch_once(&+[EQKitEnvironment defaultEnvironmentData]::onceToken, &__block_literal_global_1);
  }
  v2 = (void *)+[EQKitEnvironment defaultEnvironmentData]::sInstance;

  return (NSData *)v2;
}

void __42__EQKitEnvironment_defaultEnvironmentData__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = v0;
  if (v0)
  {
    v2 = [v0 pathForResource:@"EQKitDefaultEnvironment" ofType:@"plist"];
    if (v2)
    {
      v3 = [NSURL fileURLWithPath:v2];
      id v7 = 0;
      uint64_t v4 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v3 options:2 error:&v7];
      id v5 = v7;
      uint64_t v6 = (void *)+[EQKitEnvironment defaultEnvironmentData]::sInstance;
      +[EQKitEnvironment defaultEnvironmentData]::sInstance = v4;
    }
  }
}

- (void)setUsesLegacySTIXFonts:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EQKitEnvironment *)self i_requiresLegacySTIXFonts] != a3)
  {
    id v6 = [(EQKitEnvironment *)self i_fontsDictionary];
    id v5 = [NSNumber numberWithBool:v3];
    [v6 setObject:v5 forKeyedSubscript:@"requiresLegacySTIXFonts"];

    [(EQKitEnvironment *)self reloadFonts];
  }
}

- (void)setAllowSingleLineHeight:(BOOL)a3
{
  self->_layoutConfig->var2 = a3;
}

- (BOOL)allowSingleLineHeight
{
  return self->_layoutConfig->var2;
}

+ (NSSet)legacySTIXFontNames
{
  if (+[EQKitEnvironment legacySTIXFontNames]::onceToken != -1) {
    dispatch_once(&+[EQKitEnvironment legacySTIXFontNames]::onceToken, &__block_literal_global_31);
  }
  v2 = (void *)+[EQKitEnvironment legacySTIXFontNames]::sLegacySTIXFontNamesSet;

  return (NSSet *)v2;
}

uint64_t __39__EQKitEnvironment_legacySTIXFontNames__block_invoke()
{
  +[EQKitEnvironment legacySTIXFontNames]::sLegacySTIXFontNamesSet = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_270464700];

  return MEMORY[0x270F9A758]();
}

- (void)setMathFontName:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(EQKitEnvironment *)self mathFontName];
  char v5 = [v4 isEqualToString:v8];

  if ((v5 & 1) == 0)
  {
    id v6 = [(EQKitEnvironment *)self i_fontsDictionary];
    id v7 = (void *)[v8 copy];
    [v6 setObject:v7 forKeyedSubscript:@"mathFontName"];

    if (![(EQKitEnvironment *)self usesLegacySTIXFonts]) {
      [(EQKitEnvironment *)self reloadFonts];
    }
  }
}

- (NSString)mathFontName
{
  v2 = [(EQKitEnvironment *)self i_mathFontName];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[EQKitEnvironment defaultMathFontName];
  }
  char v5 = v4;

  return (NSString *)v5;
}

+ (NSString)defaultMathFontName
{
  return (NSString *)@"STIXTwoMath-Regular";
}

- (BOOL)needsToReloadFontsWhenAddingFontNamed:(id)a3
{
  id v4 = a3;
  if ([(EQKitEnvironment *)self usesLegacySTIXFonts])
  {
    char v5 = +[EQKitEnvironment legacySTIXFontNames];
    char v6 = [v5 containsObject:v4];
  }
  else
  {
    char v5 = [(EQKitEnvironment *)self mathFontName];
    char v6 = [v5 isEqualToString:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)reloadFonts
{
}

- (BOOL)fontsLoadedCorrectly
{
  v2 = *(uint64_t (**)(void))(*(void *)EQKit::Font::Manager::fontCollection((EQKit::Font::Manager *)self->_fontManager)
                           + 32);

  return v2();
}

- (__CTFont)defaultFontOfSize:(double)a3
{
  uint64_t v6 = 0;
  __int16 v7 = 1;
  char v8 = 0;
  int v9 = 3;
  double v10 = a3;
  int v11 = 0;
  id v12 = 0;
  uint64_t v3 = EQKit::Font::Manager::fontCollection((EQKit::Font::Manager *)self->_fontManager);
  id v4 = (__CTFont *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v3 + 72))(v3, &v6);

  return v4;
}

- (id)i_configCopy
{
  v2 = (void *)[(NSMutableDictionary *)self->_config mutableCopy];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"fonts"];
  id v4 = (void *)[v3 mutableCopy];
  [v2 setObject:v4 forKeyedSubscript:@"fonts"];

  return v2;
}

+ (id)i_operatorDictionaryURL
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 pathForResource:@"EQKitOperatorDictionary" ofType:@"plist"];
  id v4 = [NSURL fileURLWithPath:v3];

  return v4;
}

- (id)i_fontsDictionary
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(NSMutableDictionary *)self->_config objectForKeyedSubscript:@"fonts"];
  char v5 = EQKitUtilDynamicCast(v3, (uint64_t)v4);

  return v5;
}

- (id)i_mathFontName
{
  v2 = [(EQKitEnvironment *)self i_fontsDictionary];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 objectForKeyedSubscript:@"mathFontName"];
  char v5 = EQKitUtilDynamicCast(v3, (uint64_t)v4);

  return v5;
}

- (BOOL)i_requiresLegacySTIXFonts
{
  v2 = [(EQKitEnvironment *)self i_fontsDictionary];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 objectForKeyedSubscript:@"requiresLegacySTIXFonts"];
  char v5 = EQKitUtilDynamicCast(v3, (uint64_t)v4);

  if (v5) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)sourceAttribution
{
  return self->_sourceAttribution;
}

- (void)setSourceAttribution:(BOOL)a3
{
  self->_sourceAttribution = a3;
}

- (void).cxx_destruct
{
}

- (const)operatorDictionary
{
  return self->_operatorDictionary;
}

- (const)fontManager
{
  return self->_fontManager;
}

- (const)kerningManager
{
  return self->_kerningManager;
}

- (const)layoutConfig
{
  return self->_layoutConfig;
}

- (const)blahtexConfig
{
  return self->_blahtexConfig;
}

- (void)beginLayout
{
  EQKit::Font::Manager::beginLayout((uint64_t)self->_fontManager);
  kerningManager = self->_kerningManager;

  EQKit::Kerning::Manager::beginLayout((uint64_t)kerningManager);
}

- (void)endLayout
{
  EQKit::Kerning::Manager::endLayout((uint64_t ***)self->_kerningManager);
  fontManager = self->_fontManager;

  EQKit::Font::Manager::endLayout((EQKit::Font::Manager *)fontManager);
}

- (BOOL)isKerningEnabled
{
  return *((unsigned char *)self->_kerningManager + 16);
}

- (void)setKerningEnabled:(BOOL)a3
{
  *((unsigned char *)self->_kerningManager + 16) = a3;
}

@end