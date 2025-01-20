@interface CSUAFAssetManager
+ (id)sharedInstance;
- (CSUAFAssetManager)init;
- (id)_initWithForceSetIsExclave:(BOOL)a3 exclaveManagerProxy:(id)a4;
- (void)_getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5;
- (void)_mapAssetToExclaveKitForAssetName:(id)a3 asset:(id)a4 completion:(id)a5;
- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5;
- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4;
@end

@implementation CSUAFAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveManagerProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_adBlockerAssetSet, 0);
  objc_storeStrong((id *)&self->_assetSet, 0);
}

- (void)_mapAssetToExclaveKitForAssetName:(id)a3 asset:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke;
  v34[3] = &unk_1E61FFB58;
  id v11 = v10;
  id v35 = v11;
  v12 = (void (**)(void, void))MEMORY[0x1BA9E7570](v34);
  if (v9)
  {
    if (self->_isExclaveHardware)
    {
      if (v8)
      {
        if (self->_adBlockerAssetSet
          || ![(__CFString *)v8 isEqualToString:@"com.apple.siri.sp.adblocker"])
        {
          if (self->_assetSet)
          {
            if ([v9 assetVariant] == 2)
            {
              v19 = [(UAFAssetSet *)self->_assetSet assetNamed:@"com.apple.siri.sp.invocation"];

              if (v19) {
                goto LABEL_33;
              }
              v20 = CSLogCategoryAsset;
              if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
                _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
              }
              v14 = (void *)MEMORY[0x1E4F28C58];
              v15 = &unk_1F13B80C8;
            }
            else
            {
              v23 = CSLogCategoryAsset;
              if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
                _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
              }
              v14 = (void *)MEMORY[0x1E4F28C58];
              v15 = &unk_1F13B80A0;
            }
          }
          else
          {
            v22 = CSLogCategoryAsset;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
              _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
            }
            v14 = (void *)MEMORY[0x1E4F28C58];
            v15 = &unk_1F13B8078;
          }
        }
        else
        {
          v13 = CSLogCategoryAsset;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
            _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Adblocker Secure Mobile Asset Loader Service", buf, 0xCu);
          }
          v14 = (void *)MEMORY[0x1E4F28C58];
          v15 = &unk_1F13B8050;
        }
      }
      else
      {
        v21 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
          _os_log_impl(&dword_1BA1A5000, v21, OS_LOG_TYPE_DEFAULT, "%s AssetName is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
        }
        v14 = (void *)MEMORY[0x1E4F28C58];
        v15 = &unk_1F13B8028;
      }
      uint64_t v17 = 2153;
    }
    else
    {
      v18 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
        _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s The hardware does not support secure exclave. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = &unk_1F13B8000;
      uint64_t v17 = 2155;
    }
  }
  else
  {
    v16 = CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
      _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    v15 = &unk_1F13B7FD8;
    uint64_t v17 = 2151;
  }
  v24 = [v14 errorWithDomain:@"com.apple.corespeech" code:v17 userInfo:v15];
  if (v24)
  {
    ((void (**)(void, CSExclaveAssetManagerProxy *))v12)[2](v12, v24);
    goto LABEL_39;
  }
LABEL_33:
  v25 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
    __int16 v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s Mapping asset %@ to ExclaveKit", buf, 0x16u);
  }
  v24 = self->_exclaveManagerProxy;
  if (!v24)
  {
    v24 = +[CSExclaveAssetManagerProxy sharedManager];
  }
  if (v8 == @"com.apple.siri.sp.invocation")
  {
    v26 = self->_assetSet;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_365;
    v28[3] = &unk_1E61FFBD0;
    v29 = v26;
    v30 = @"com.apple.siri.sp.invocation";
    v31 = self;
    v33 = v12;
    v24 = v24;
    v32 = v24;
    v27 = v26;
    [(CSExclaveAssetManagerProxy *)v24 stopSecureMobileAssetLoaderService:v28];
  }
LABEL_39:
}

uint64_t __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_365(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2;
  v6[3] = &unk_1E61FFBA8;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  id v10 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  [v3 mapAsset:v4 queue:0 completion:v6];
}

void __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]_block_invoke_2";
    __int16 v15 = 2112;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Mapping asset %@ to ExclaveKit completed with error %@", buf, 0x20u);
  }
  v6 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_366;
  v8[3] = &unk_1E61FFEA0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v6, v8);
}

void __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_366(uint64_t a1)
{
  if (*(__CFString **)(a1 + 32) == @"com.apple.siri.sp.invocation")
  {
    uint64_t v1 = *(void *)(a1 + 40);
    if (!v1)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2_367;
      v5[3] = &unk_1E61FFB80;
      id v4 = *(void **)(a1 + 48);
      id v6 = *(id *)(a1 + 56);
      [v4 startSecureMobileAssetLoaderService:0 completion:v5];

      return;
    }
    uint64_t v3 = *(void *)(a1 + 56);
    v2 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  }
  else
  {
    uint64_t v1 = *(void *)(a1 + 40);
    v2 = *(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 56) + 16);
    uint64_t v3 = *(void *)(a1 + 56);
  }
  v2(v3, v1);
}

uint64_t __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2_367(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CSUAFAssetManager_mapAssetToExclaveKit_completion___block_invoke;
  block[3] = &unk_1E61FFFB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __53__CSUAFAssetManager_mapAssetToExclaveKit_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[CSUAFAssetManager mapAssetToExclaveKit:completion:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = @"com.apple.siri.sp.invocation";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Mapping asset %@ to ExclaveKit", (uint8_t *)&v4, 0x16u);
  }
  return [*(id *)(a1 + 32) _mapAssetToExclaveKitForAssetName:@"com.apple.siri.sp.invocation" asset:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __67__CSUAFAssetManager__getInstalledAssetofType_forLocale_completion___block_invoke;
  v52[3] = &unk_1E61FFB30;
  id v10 = v9;
  id v53 = v10;
  id v11 = (void (**)(void, void, void))MEMORY[0x1BA9E7570](v52);
  if (a3 > 6 || ((1 << a3) & 0x51) == 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unsupported assetType: %lu", a3);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    v72 = @"reason";
    v73[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
    __int16 v17 = v19;
    uint64_t v18 = 2152;
    goto LABEL_8;
  }
  id v12 = +[CSFPreferences sharedPreferences];
  int v13 = [v12 bypassTrialAssets];

  if (v13)
  {
    v14 = [NSString stringWithFormat:@"UAF honoring Trial asset bypass is set"];
    __int16 v15 = (void *)MEMORY[0x1E4F28C58];
    v70 = @"reason";
    v71 = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    __int16 v17 = v15;
    uint64_t v18 = 1601;
LABEL_8:
    v20 = [v17 errorWithDomain:@"com.apple.corespeech" code:v18 userInfo:v16];

    ((void (**)(void, void, void *))v11)[2](v11, 0, v20);
    goto LABEL_30;
  }
  if (a3 == 4)
  {
    v14 = @"generic";
  }
  else
  {
    v14 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  }
  id v51 = v8;
  v21 = [MEMORY[0x1E4FB3598] sharedManager];
  v68 = @"attention.language";
  v69 = v14;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v23 = [v21 retrieveAssetSet:@"com.apple.siri.understanding" usages:v22];

  v24 = v23;
  v20 = v24;
  if (a3 == 4)
  {
    adBlockerAssetSet = self->_adBlockerAssetSet;
    self->_adBlockerAssetSet = v24;

    v26 = @"com.apple.siri.sp.adblocker";
  }
  else
  {
    assetSet = self->_assetSet;
    self->_assetSet = v24;

    if (a3) {
      v26 = @"com.apple.siri.sp.mitigation";
    }
    else {
      v26 = @"com.apple.siri.sp.invocation";
    }
  }
  v28 = [v20 assetNamed:v26];
  v29 = v28;
  if (!v28) {
    goto LABEL_24;
  }
  uint64_t v30 = [v28 metadata];
  if (!v30) {
    goto LABEL_24;
  }
  v31 = (void *)v30;
  v32 = [v29 metadata];
  v33 = [v32 objectForKeyedSubscript:@"locale"];

  if (v33)
  {
    v34 = [v29 metadata];
    id v35 = [v34 objectForKeyedSubscript:@"locale"];
    v36 = [v35 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    if ([(__CFString *)v14 isEqualToString:v36])
    {
      v37 = [v29 location];
      __int16 v38 = [v37 path];

      v39 = [v29 metadata];
      uint64_t v50 = [v39 objectForKeyedSubscript:@"version"];

      uint64_t v40 = (void *)v50;
      if (v38 && v50)
      {
        v41 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v55 = "-[CSUAFAssetManager _getInstalledAssetofType:forLocale:completion:]";
          __int16 v56 = 2048;
          unint64_t v57 = a3;
          __int16 v58 = 2112;
          id v59 = v51;
          __int16 v60 = 2112;
          uint64_t v61 = v50;
          _os_log_impl(&dword_1BA1A5000, v41, OS_LOG_TYPE_DEFAULT, "%s Got UAF Asset for assetType: %lu for locale: %@ version: %@", buf, 0x2Au);
        }
        v42 = +[CSAsset assetForAssetType:a3 resourcePath:v38 configVersion:v50 assetProvider:2 identity:0 assistantLanguageCode:0];
        ((void (**)(void, void *, void))v11)[2](v11, v42, 0);
      }
      else
      {
        v42 = [NSString stringWithFormat:@"UAF asset path || version missing: %@", v26];
        v47 = (void *)MEMORY[0x1E4F28C58];
        v62 = @"reason";
        v63 = v42;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        v49 = [v47 errorWithDomain:@"com.apple.corespeech" code:2151 userInfo:v48];

        ((void (**)(void, void, void *))v11)[2](v11, 0, v49);
        uint64_t v40 = (void *)v50;
      }

      id v8 = v51;
    }
    else
    {
      id v8 = v51;
      __int16 v38 = [NSString stringWithFormat:@"Mismatch between Current locale: %@ & UAFAsset locale: %@", v51, v36];
      v45 = (void *)MEMORY[0x1E4F28C58];
      v64 = @"reason";
      v65 = v38;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      uint64_t v40 = [v45 errorWithDomain:@"com.apple.corespeech" code:1601 userInfo:v46];

      ((void (**)(void, void, void *))v11)[2](v11, 0, v40);
    }
  }
  else
  {
LABEL_24:
    v36 = [NSString stringWithFormat:@"Unable to get UAF asset: %@", v26];
    v43 = (void *)MEMORY[0x1E4F28C58];
    v66 = @"reason";
    v67 = v36;
    v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    __int16 v38 = [v43 errorWithDomain:@"com.apple.corespeech" code:2151 userInfo:v44];

    ((void (**)(void, void, void *))v11)[2](v11, 0, v38);
    id v8 = v51;
  }

LABEL_30:
}

void __67__CSUAFAssetManager__getInstalledAssetofType_forLocale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      id v10 = [v6 localizedDescription];
      id v11 = [v6 userInfo];
      int v12 = 136315650;
      int v13 = "-[CSUAFAssetManager _getInstalledAssetofType:forLocale:completion:]_block_invoke";
      __int16 v14 = 2112;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s %@ - %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__CSUAFAssetManager_getInstalledAssetofType_forLocale_completion___block_invoke;
  v13[3] = &unk_1E61FFB08;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __66__CSUAFAssetManager_getInstalledAssetofType_forLocale_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getInstalledAssetofType:*(void *)(a1 + 56) forLocale:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (CSUAFAssetManager)init
{
  BOOL v3 = +[CSUtils isExclaveHardware];
  return (CSUAFAssetManager *)[(CSUAFAssetManager *)self _initWithForceSetIsExclave:v3 exclaveManagerProxy:0];
}

- (id)_initWithForceSetIsExclave:(BOOL)a3 exclaveManagerProxy:(id)a4
{
  id v7 = a4;
  if (+[CSUtils isDarwinOS])
  {
    id v8 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CSUAFAssetManager;
    id v9 = [(CSUAFAssetManager *)&v13 init];
    if (v9)
    {
      dispatch_queue_t v10 = dispatch_queue_create("CSUAFAssetManager queue", 0);
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v10;

      v9->_isExclaveHardware = a3;
      objc_storeStrong((id *)&v9->_exclaveManagerProxy, a4);
    }
    self = v9;
    id v8 = self;
  }

  return v8;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if ((+[CSUtils supportsUnderstandingOnDevice]
       || +[CSUtils supportsHybridUnderstandingOnDevice])
      && sharedInstance_onceToken_6292 != -1)
    {
      dispatch_once(&sharedInstance_onceToken_6292, &__block_literal_global_6293);
    }
    id v2 = (id)sharedInstance_sharedManager_6294;
  }
  return v2;
}

uint64_t __35__CSUAFAssetManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedManager_6294 = objc_alloc_init(CSUAFAssetManager);
  return MEMORY[0x1F41817F8]();
}

@end