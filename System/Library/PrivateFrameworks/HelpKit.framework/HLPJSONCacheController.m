@interface HLPJSONCacheController
+ (id)sharedInstance;
- (BOOL)isURLValid:(id)a3;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)newDataCache;
- (void)commonInit;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
@end

@implementation HLPJSONCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_4 != -1) {
    dispatch_once(&sharedInstance_predicate_4, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_gHLPJSONCacheController;
  return v2;
}

uint64_t __40__HLPJSONCacheController_sharedInstance__block_invoke()
{
  v0 = [(HLPDataCacheController *)[HLPJSONCacheController alloc] initWithIdentifier:@"HLPJSONCacheIdentifier" directoryName:@"com.apple.helpkit.JSON" maxCacheSize:0x100000 URLSessionDataType:1];
  v1 = (void *)sharedInstance_gHLPJSONCacheController;
  sharedInstance_gHLPJSONCacheController = (uint64_t)v0;

  v2 = (void *)sharedInstance_gHLPJSONCacheController;
  return [v2 setBackgroundOriginUpdate:1];
}

- (void)commonInit
{
  v4.receiver = self;
  v4.super_class = (Class)HLPJSONCacheController;
  [(HLPDataCacheController *)&v4 commonInit];
  LODWORD(v3) = *MEMORY[0x263F085C0];
  [(HLPDataCacheController *)self setDefaultPriority:v3];
}

- (id)newDataCache
{
  v2 = objc_alloc_init(HLPDataCache);
  [(HLPDataCache *)v2 setCacheType:0];
  [(HLPDataCache *)v2 setMaxAge:84600];
  return v2;
}

- (id)formattedDataWithFileURL:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF8F8];
  v5 = [a3 path];
  v6 = [v4 dataWithContentsOfFile:v5];

  v7 = [(HLPJSONCacheController *)self formattedDataWithData:v6];

  return v7;
}

- (id)formattedDataWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    objc_super v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:1 error:&v8];
    id v5 = v8;
    if (v5)
    {

      v6 = HLPLogForCategory(1uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[HLPJSONCacheController formattedDataWithData:]((uint64_t)v5, v6);
      }

      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (BOOL)isURLValid:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HLPJSONCacheController *)self isURLValid:v6])
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HLPJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_264579540;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

void __69__HLPJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v3 = [a1[4] path];
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  id v5 = [a1[5] formattedDataWithData:v4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HLPJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_2645795D8;
  id v6 = a1[6];
  id v11 = v4;
  id v12 = v6;
  id v10 = v5;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__HLPJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)formattedDataWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_220BD8000, a2, OS_LOG_TYPE_DEBUG, "Invalid json data %@", (uint8_t *)&v2, 0xCu);
}

@end