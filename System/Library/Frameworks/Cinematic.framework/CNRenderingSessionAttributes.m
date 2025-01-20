@interface CNRenderingSessionAttributes
+ (id)_PTGlobalRenderingMetadataFromItems:(id)a3;
+ (void)_loadPTGlobalRenderingMetadataFromAsset:(id)a3 completionHandler:(id)a4;
+ (void)loadFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler;
- (CNRenderingSessionAttributes)initWithPTGlobalRenderingMetadata:(id)a3;
- (NSInteger)renderingVersion;
- (PTGlobalRenderingMetadata)internalMetadata;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
@end

@implementation CNRenderingSessionAttributes

- (CNRenderingSessionAttributes)initWithPTGlobalRenderingMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNRenderingSessionAttributes;
  v6 = [(CNRenderingSessionAttributes *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalMetadata, a3);
  }

  return v7;
}

- (int64_t)majorVersion
{
  return [(PTGlobalRenderingMetadata *)self->_internalMetadata majorVersion];
}

- (int64_t)minorVersion
{
  return [(PTGlobalRenderingMetadata *)self->_internalMetadata minorVersion];
}

- (NSInteger)renderingVersion
{
  return [(PTGlobalRenderingMetadata *)self->_internalMetadata renderingVersion];
}

+ (void)loadFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  v6 = asset;
  id v7 = completionHandler;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke;
  v10[3] = &unk_26517A420;
  v11 = v6;
  id v12 = v7;
  id v8 = v7;
  objc_super v9 = v6;
  [a1 _loadPTGlobalRenderingMetadataFromAsset:v9 completionHandler:v10];
}

void __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _CNLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke_cold_1((uint64_t)v6, a1, v7);
    }

    _CNCinematicError(2, v6);
    id v8 = (CNRenderingSessionAttributes *)objc_claimAutoreleasedReturnValue();
    objc_super v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = [[CNRenderingSessionAttributes alloc] initWithPTGlobalRenderingMetadata:v5];
    objc_super v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

+ (void)_loadPTGlobalRenderingMetadataFromAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__CNRenderingSessionAttributes__loadPTGlobalRenderingMetadataFromAsset_completionHandler___block_invoke;
  v8[3] = &unk_26517A448;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a3 loadMetadataForFormat:0x26F895630 completionHandler:v8];
}

void __90__CNRenderingSessionAttributes__loadPTGlobalRenderingMetadataFromAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) _PTGlobalRenderingMetadataFromItems:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)_PTGlobalRenderingMetadataFromItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 key];
        int v10 = [v9 isEqualToString:0x26F895650];

        if (v10)
        {
          id v12 = [v8 value];
          uint64_t v14 = 0;
          v11 = [MEMORY[0x263F5F2C8] deserializeMetadataWithType:2 fromGlobalMetadata:v12 error:&v14];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (PTGlobalRenderingMetadata)internalMetadata
{
  return (PTGlobalRenderingMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

void __64__CNRenderingSessionAttributes_loadFromAsset_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_243267000, log, OS_LOG_TYPE_ERROR, "Error: (%@) Unable to load cinematic global rendering metadata from asset %@", (uint8_t *)&v4, 0x16u);
}

@end