@interface HLPStringCacheController
+ (id)sharedInstance;
- (BOOL)isURLValid:(id)a3;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)newDataCache;
- (void)commonInit;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
@end

@implementation HLPStringCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_2 != -1) {
    dispatch_once(&sharedInstance_predicate_2, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_gHLPStringCacheController;
  return v2;
}

uint64_t __42__HLPStringCacheController_sharedInstance__block_invoke()
{
  sharedInstance_gHLPStringCacheController = [(HLPDataCacheController *)[HLPStringCacheController alloc] initWithIdentifier:@"HLPStringCacheIdentifier" directoryName:@"com.apple.helpkit.String" maxCacheSize:0x100000 URLSessionDataType:3];
  return MEMORY[0x270F9A758]();
}

- (void)commonInit
{
  v4.receiver = self;
  v4.super_class = (Class)HLPStringCacheController;
  [(HLPDataCacheController *)&v4 commonInit];
  LODWORD(v3) = *MEMORY[0x263F085C0];
  [(HLPDataCacheController *)self setDefaultPriority:v3];
}

- (id)newDataCache
{
  v2 = objc_alloc_init(HLPDataCache);
  [(HLPDataCache *)v2 setCacheType:1];
  [(HLPDataCache *)v2 setMaxAge:84600];
  return v2;
}

- (id)formattedDataWithFileURL:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF8F8];
  v5 = [a3 path];
  v6 = [v4 dataWithContentsOfFile:v5];

  v7 = [(HLPStringCacheController *)self formattedDataWithData:v6];

  return v7;
}

- (id)formattedDataWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_super v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    if (v4) {
      goto LABEL_7;
    }
    v5 = HLPLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[HLPStringCacheController formattedDataWithData:]((uint64_t)v3, v5);
    }
  }
  objc_super v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)isURLValid:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HLPStringCacheController *)self isURLValid:v6])
  {
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__HLPStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_264579540;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

void __71__HLPStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v3 = [a1[4] path];
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  v5 = [a1[5] formattedDataWithData:v4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HLPStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_2645795D8;
  id v6 = a1[6];
  id v11 = v4;
  id v12 = v6;
  id v10 = v5;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__HLPStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)formattedDataWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_220BD8000, a2, OS_LOG_TYPE_DEBUG, "Invalid string data %@", (uint8_t *)&v2, 0xCu);
}

@end