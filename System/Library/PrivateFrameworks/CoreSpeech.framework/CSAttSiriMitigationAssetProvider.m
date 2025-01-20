@interface CSAttSiriMitigationAssetProvider
+ (id)sharedHandler;
- (CSAttSiriMitigationAssetHandler)assetHandler;
- (CSAttSiriMitigationAssetProvider)init;
- (CSAttSiriMitigationAssetProvider)initWithAssetHanlder:(id)a3;
- (void)getAllowPhrasesListOverrideFileWithCompletion:(id)a3;
- (void)getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:(id)a3;
- (void)getNeuralCombinerConfigFileWithCompletion:(id)a3;
- (void)getUESConfigFileWithCompletion:(id)a3;
- (void)setAssetHandler:(id)a3;
- (void)shouldRunCAROverrideWithCompletion:(id)a3;
@end

@implementation CSAttSiriMitigationAssetProvider

- (void).cxx_destruct
{
}

- (void)setAssetHandler:(id)a3
{
}

- (CSAttSiriMitigationAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)shouldRunCAROverrideWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CSAttSiriMitigationAssetProvider_shouldRunCAROverrideWithCompletion___block_invoke;
  v7[3] = &unk_1E658B9C8;
  v9 = v10;
  id v6 = v4;
  id v8 = v6;
  [(CSAttSiriMitigationAssetHandler *)assetHandler getMitigationAssetWithEndpointId:0 completion:v7];

  _Block_object_dispose(v10, 8);
}

void __71__CSAttSiriMitigationAssetProvider_shouldRunCAROverrideWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && !v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 shouldRunCAROverrideForCategory:*MEMORY[0x1E4F5D4D0]];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
}

- (void)getUESConfigFileWithCompletion:(id)a3
{
  id v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CSAttSiriMitigationAssetProvider_getUESConfigFileWithCompletion___block_invoke;
  v7[3] = &unk_1E658D030;
  id v8 = v4;
  id v6 = v4;
  [(CSAttSiriMitigationAssetHandler *)assetHandler getMitigationAssetWithEndpointId:0 completion:v7];
}

void __67__CSAttSiriMitigationAssetProvider_getUESConfigFileWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = &stru_1F2396200;
  if (v8 && !v5)
  {
    id v6 = [v8 uesConfigFileForCategory:*MEMORY[0x1E4F5D4D0]];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6);
  }
}

- (void)getAllowPhrasesListOverrideFileWithCompletion:(id)a3
{
  id v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__CSAttSiriMitigationAssetProvider_getAllowPhrasesListOverrideFileWithCompletion___block_invoke;
  v7[3] = &unk_1E658D030;
  id v8 = v4;
  id v6 = v4;
  [(CSAttSiriMitigationAssetHandler *)assetHandler getMitigationAssetWithEndpointId:0 completion:v7];
}

void __82__CSAttSiriMitigationAssetProvider_getAllowPhrasesListOverrideFileWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = &stru_1F2396200;
  if (v8 && !v5)
  {
    id v6 = [v8 allowKeywordsFile];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6);
  }
}

- (void)getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:(id)a3
{
  id v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion___block_invoke;
  v7[3] = &unk_1E658D030;
  id v8 = v4;
  id v6 = v4;
  [(CSAttSiriMitigationAssetHandler *)assetHandler getMitigationAssetWithEndpointId:0 completion:v7];
}

void __91__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  id v8 = 0;
  v9 = &stru_1F2396200;
  v10 = 0;
  if (!v5 || v6) {
    goto LABEL_24;
  }
  v9 = [v5 mitigationConfigFileForCategory:*MEMORY[0x1E4F5D4D0]];
  char v11 = (os_log_t *)MEMORY[0x1E4F5D150];
  if (v9)
  {
    v12 = [MEMORY[0x1E4F5D370] decodeConfigFrom:v5];
    v13 = [v12 objectForKeyedSubscript:&unk_1F23C4C28];
    if (v13) {
      [MEMORY[0x1E4F5D378] getCachedIrFromMilFilePath:v13 modelTye:3 asset:v5];
    }
    else {
    v10 = [MEMORY[0x1E4F5D378] getCachedIrFromConfigPath:v9 modelTye:3 asset:v5];
    }

    if (!v10) {
      goto LABEL_13;
    }
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v16 = [v15 fileExistsAtPath:v10];

    if (v16)
    {
      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v18 = [v17 isReadableFileAtPath:v10];

      if (v18)
      {
LABEL_13:
        id v8 = 0;
        goto LABEL_22;
      }
      v23 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        int v28 = 136315394;
        v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
        __int16 v30 = 2112;
        v31 = v10;
        _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s GetNeuralCombinerConfigFileAndBnnsIrPathWithCompletion cannot read the bnnsIrFile: %@", (uint8_t *)&v28, 0x16u);
      }
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5D138];
      uint64_t v22 = 2420;
    }
    else
    {
      v19 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        int v28 = 136315394;
        v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
        __int16 v30 = 2112;
        v31 = v10;
        _os_log_error_impl(&dword_1C9338000, v19, OS_LOG_TYPE_ERROR, "%s GetNeuralCombinerConfigFileAndBnnsIrPathWithCompletion cannot find the bnnsIrFile: %@", (uint8_t *)&v28, 0x16u);
      }
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F5D138];
      uint64_t v22 = 2419;
    }
    id v8 = [v20 errorWithDomain:v21 code:v22 userInfo:0];
  }
  else
  {
    v14 = (void *)*MEMORY[0x1E4F5D150];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D150], OS_LOG_TYPE_ERROR))
    {
      v26 = v14;
      v27 = [v5 resourcePath];
      int v28 = 136315394;
      v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
      __int16 v30 = 2112;
      v31 = v27;
      _os_log_error_impl(&dword_1C9338000, v26, OS_LOG_TYPE_ERROR, "%s Get not fetch config file from asset: %@", (uint8_t *)&v28, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:2501 userInfo:0];
  }
  v10 = 0;
LABEL_22:
  v24 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315394;
    v29 = "-[CSAttSiriMitigationAssetProvider getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion:]_block_invoke";
    __int16 v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1C9338000, v24, OS_LOG_TYPE_DEFAULT, "%s getting irCachePath for getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion: %@", (uint8_t *)&v28, 0x16u);
  }
LABEL_24:
  uint64_t v25 = *(void *)(a1 + 32);
  if (v25) {
    (*(void (**)(uint64_t, __CFString *, void *, void *))(v25 + 16))(v25, v9, v10, v8);
  }
}

- (void)getNeuralCombinerConfigFileWithCompletion:(id)a3
{
  id v4 = a3;
  assetHandler = self->_assetHandler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileWithCompletion___block_invoke;
  v7[3] = &unk_1E658D030;
  id v8 = v4;
  id v6 = v4;
  [(CSAttSiriMitigationAssetHandler *)assetHandler getMitigationAssetWithEndpointId:0 completion:v7];
}

void __78__CSAttSiriMitigationAssetProvider_getNeuralCombinerConfigFileWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = &stru_1F2396200;
  if (v8 && !v5)
  {
    id v6 = [v8 mitigationConfigFileForCategory:*MEMORY[0x1E4F5D4D0]];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6);
  }
}

- (CSAttSiriMitigationAssetProvider)initWithAssetHanlder:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSAttSiriMitigationAssetProvider;
  id v6 = [(CSAttSiriMitigationAssetProvider *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    p_assetHandler = (void **)&v6->_assetHandler;
    objc_storeStrong((id *)&v6->_assetHandler, a3);
    if (!v7->_assetHandler)
    {
      uint64_t v9 = +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation];
      v10 = *p_assetHandler;
      *p_assetHandler = (void *)v9;
    }
  }

  return v7;
}

- (CSAttSiriMitigationAssetProvider)init
{
  return [(CSAttSiriMitigationAssetProvider *)self initWithAssetHanlder:0];
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken_19329 != -1) {
    dispatch_once(&sharedHandler_onceToken_19329, &__block_literal_global_19330);
  }
  v2 = (void *)sharedHandler_sharedHandler_19331;
  return v2;
}

void __49__CSAttSiriMitigationAssetProvider_sharedHandler__block_invoke()
{
  v0 = objc_alloc_init(CSAttSiriMitigationAssetProvider);
  v1 = (void *)sharedHandler_sharedHandler_19331;
  sharedHandler_sharedHandler_19331 = (uint64_t)v0;
}

@end