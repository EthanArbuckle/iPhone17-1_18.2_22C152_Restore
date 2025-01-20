@interface ASTUploadClientFactory
+ (id)repairToolUploadClientWithASTSession:(id)a3 withUploadRequests:(id)a4 andDelegate:(id)a5;
+ (id)repairToolUploadClientWithUploadRequests:(id)a3 andDelegate:(id)a4;
+ (id)uploadClientWithASTSession:(id)a3 andFileMap:(id)a4 andUrlFactory:(id)a5 andDelegate:(id)a6;
@end

@implementation ASTUploadClientFactory

+ (id)uploadClientWithASTSession:(id)a3 andFileMap:(id)a4 andUrlFactory:(id)a5 andDelegate:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22 = v11;
  v13 = [[ASTConfigurableUploadClient alloc] initWithASTSession:v9 withURLSession:0 withURLRequestFactory:v11 withDelegate:v12];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    uint64_t v18 = MEMORY[0x263EFFA78];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(ASTConfigurableUploadClient *)v13 queueUploadWithSourceUrl:v20 andExtra:v18];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(ASTConfigurableUploadClient *)v13 queueUploadWithSourceData:v20 andExtra:v18];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (id)repairToolUploadClientWithASTSession:(id)a3 withUploadRequests:(id)a4 andDelegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[RepairToolURLFactory alloc] initWithRequestItems:v8];

  id v11 = [[ASTConfigurableUploadClient alloc] initWithASTSession:v9 withURLSession:0 withURLRequestFactory:v10 withDelegate:v7];

  return v11;
}

+ (id)repairToolUploadClientWithUploadRequests:(id)a3 andDelegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[RepairToolURLFactory alloc] initWithRequestItems:v6];

  id v8 = [[ASTConfigurableUploadClient alloc] initWithURLSession:0 withURLRequestFactory:v7 withDelegate:v5];

  return v8;
}

@end