@interface INUIImageServiceConnection
+ (id)sharedConnection;
- (void)loadUIImageForINImage:(id)a3 traitCollection:(id)a4 reply:(id)a5;
@end

@implementation INUIImageServiceConnection

- (void)loadUIImageForINImage:(id)a3 traitCollection:(id)a4 reply:(id)a5
{
  id v6 = a5;
  v7 = (void *)MEMORY[0x263F0FB98];
  id v8 = a3;
  v9 = [v7 sharedConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__INUIImageServiceConnection_loadUIImageForINImage_traitCollection_reply___block_invoke;
  v11[3] = &unk_263FD6968;
  id v12 = v6;
  id v10 = v6;
  [v9 loadImageDataAndSizeForImage:v8 reply:v11];
}

void __74__INUIImageServiceConnection_loadUIImageForINImage_traitCollection_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x263F1C6B0];
  id v6 = a3;
  v7 = [a2 _imageData];
  id v8 = [v5 imageWithData:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_251);
  }
  v2 = (void *)sharedConnection_sImageServiceConnection;

  return v2;
}

uint64_t __46__INUIImageServiceConnection_sharedConnection__block_invoke()
{
  sharedConnection_sImageServiceConnection = objc_alloc_init(INUIImageServiceConnection);

  return MEMORY[0x270F9A758]();
}

@end