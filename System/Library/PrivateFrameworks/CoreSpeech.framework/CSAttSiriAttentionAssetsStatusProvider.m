@interface CSAttSiriAttentionAssetsStatusProvider
+ (id)sharedInstance;
- (CSAttSiriAttentionAssetsStatusProvider)init;
- (CSAttSiriAttentionAssetsStatusProvider)initWithMitigationAssetHandler:(id)a3;
- (CSAttSiriAttentionAssetsStatusProviderDelegate)delegate;
- (void)_updateWithAsset:(id)a3;
- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CSAttSiriAttentionAssetsStatusProvider

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriAttentionAssetsStatusProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriAttentionAssetsStatusProviderDelegate *)WeakRetained;
}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
}

- (void)_updateWithAsset:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [MEMORY[0x1E4F5D450] getSiriLanguageWithFallback:0];
      v10 = v9;
      if (!v9 || ![v9 length])
      {
        v11 = [MEMORY[0x1E4F4E538] sharedPreferences];
        uint64_t v12 = [v11 bestSupportedLanguageCodeForLanguageCode:0];

        v10 = (void *)v12;
      }
      if (a3 && v10)
      {
        v21 = v10;
        v22[0] = MEMORY[0x1E4F1CC38];
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionary];
      }
      v14 = (void *)v13;
      id v15 = objc_loadWeakRetained((id *)p_delegate);
      [v15 attentionAssetStatus:v14];

      v16 = *MEMORY[0x1E4F5D150];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D150], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        v18 = "-[CSAttSiriAttentionAssetsStatusProvider _updateWithAsset:]";
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Sent attention asset update status: %@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (CSAttSiriAttentionAssetsStatusProvider)init
{
  v3 = +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation];
  v4 = [(CSAttSiriAttentionAssetsStatusProvider *)self initWithMitigationAssetHandler:v3];

  return v4;
}

- (CSAttSiriAttentionAssetsStatusProvider)initWithMitigationAssetHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSAttSiriAttentionAssetsStatusProvider;
  v5 = [(CSAttSiriAttentionAssetsStatusProvider *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      [v4 registerObserver:v5];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__CSAttSiriAttentionAssetsStatusProvider_initWithMitigationAssetHandler___block_invoke;
      v8[3] = &unk_1E658D0A8;
      v9 = v5;
      [v4 getMitigationAssetWithEndpointId:0 completion:v8];
    }
    v6 = *MEMORY[0x1E4F5D150];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D150], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[CSAttSiriAttentionAssetsStatusProvider initWithMitigationAssetHandler:]";
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v5;
}

uint64_t __73__CSAttSiriAttentionAssetsStatusProvider_initWithMitigationAssetHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3) {
      return [*(id *)(result + 32) _updateWithAsset:a2];
    }
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_55 != -1) {
    dispatch_once(&sharedInstance_onceToken_55, &__block_literal_global_56);
  }
  v2 = (void *)sharedInstance_sharedPolicy;
  return v2;
}

void __56__CSAttSiriAttentionAssetsStatusProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CSAttSiriAttentionAssetsStatusProvider);
  v1 = (void *)sharedInstance_sharedPolicy;
  sharedInstance_sharedPolicy = (uint64_t)v0;
}

@end