@interface AXAuditImageDetectionManager
+ (id)sharedManager;
- (id)detectedTextResultsForImageData:(id)a3;
@end

@implementation AXAuditImageDetectionManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AXAuditImageDetectionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_instance;

  return v2;
}

uint64_t __45__AXAuditImageDetectionManager_sharedManager__block_invoke()
{
  sharedManager_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)detectedTextResultsForImageData:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = *MEMORY[0x263F005D0];
  v24[0] = *MEMORY[0x263F005B0];
  v24[1] = v5;
  v25[0] = *MEMORY[0x263F005B8];
  v25[1] = MEMORY[0x263EFFA88];
  v24[2] = *MEMORY[0x263F005D8];
  v25[2] = MEMORY[0x263EFFA80];
  v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  v6 = objc_msgSend(MEMORY[0x263F00630], "detectorOfType:context:options:", *MEMORY[0x263F005F0], 0);
  v18 = v3;
  v7 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v3];
  v8 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithImage:v7];
  v9 = [v6 featuresInImage:v8 options:MEMORY[0x263EFFA78]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v15 = objc_opt_new();
        [v15 setDetectionType:0];
        [v14 bounds];
        objc_msgSend(v15, "setDetectionRegion:");
        [v4 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v4;
}

@end