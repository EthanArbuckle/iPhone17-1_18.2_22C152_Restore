@interface CKVDonateTaskFactory
- (BOOL)useSimulatedProviderBridge;
- (CKVDonateTaskFactory)init;
- (CKVDonateTaskFactory)initWithDirectory:(id)a3 timeout:(double)a4;
- (id)allInstalledAppBundleIdentifiers;
- (id)derivativeTaskForId:(unsigned __int16)a3 usingLocalization:(id)a4 modifiedItemIds:(id)a5;
- (id)taskForId:(unsigned __int16)a3 usingLocalization:(id)a4;
- (id)verificationTaskForId:(unsigned __int16)a3;
- (void)setUseSimulatedProviderBridge:(BOOL)a3;
- (void)setupBridgeListenersWithHandler:(id)a3;
@end

@implementation CKVDonateTaskFactory

- (id)taskForId:(unsigned __int16)a3 usingLocalization:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(CKVDonateTaskFactory *)self useSimulatedProviderBridge])
  {
    v7 = [CKVDonateTask alloc];
    donatorProvider = self->_donatorProvider;
    v9 = [[CKVSimulatedMultiDatasetBridge alloc] initWithTask:v4];
    v10 = [(CKVDonateTask *)v7 initWithDonatorProvider:donatorProvider multiDatasetBridge:v9 timeout:self->_timeout];
LABEL_3:
  }
  else
  {
    v10 = 0;
    switch((int)v4)
    {
      case 0:
        goto LABEL_7;
      case 1:
        v11 = [CKVDonateTask alloc];
        v12 = self->_donatorProvider;
        v13 = [(KMProviderBridgeFactory *)self->_factory intentVocabularyMultiDatasetBridge];
        uint64_t v14 = [(CKVDonateTask *)v11 initWithDonatorProvider:v12 multiDatasetBridge:v13 timeout:self->_timeout];
        goto LABEL_21;
      case 2:
        v16 = [CKVDonateTask alloc];
        v17 = self->_donatorProvider;
        v13 = [(KMProviderBridgeFactory *)self->_factory bridgeForOriginAppId:*MEMORY[0x1E4F71F68]];
        uint64_t v14 = [(CKVDonateTask *)v16 initWithDonatorProvider:v17 deltaDatasetBridge:v13 timeout:self->_timeout];
        goto LABEL_21;
      case 3:
        v9 = [v6 siriLanguageCode];
        v18 = [CKVDonateTask alloc];
        v19 = self->_donatorProvider;
        factory = self->_factory;
        v21 = (void *)MEMORY[0x1E4F71F50];
        goto LABEL_14;
      case 4:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (void *)MEMORY[0x1E4F71F80];
        goto LABEL_20;
      case 5:
        v9 = [v6 siriLanguageCode];
        v18 = [CKVDonateTask alloc];
        v19 = self->_donatorProvider;
        factory = self->_factory;
        v21 = (void *)MEMORY[0x1E4F71F88];
LABEL_14:
        v26 = [(KMProviderBridgeFactory *)factory bridgeForOriginAppId:*v21 languageCode:v9];
        v10 = [(CKVDonateTask *)v18 initWithDonatorProvider:v19 fullDatasetBridge:v26 timeout:self->_timeout];

        goto LABEL_3;
      case 6:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (void *)MEMORY[0x1E4F71F70];
        goto LABEL_20;
      case 7:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (void *)MEMORY[0x1E4F71FB0];
        goto LABEL_20;
      case 8:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (void *)MEMORY[0x1E4F71F58];
        goto LABEL_20;
      case 9:
        break;
      case 10:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (void *)MEMORY[0x1E4F71F78];
        goto LABEL_20;
      case 11:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (void *)MEMORY[0x1E4F71F60];
LABEL_20:
        v13 = [(KMProviderBridgeFactory *)v24 bridgeForOriginAppId:*v25];
        uint64_t v14 = [(CKVDonateTask *)v22 initWithDonatorProvider:v23 fullDatasetBridge:v13 timeout:self->_timeout];
LABEL_21:
        v10 = (CKVDonateTask *)v14;

        break;
      default:
        if ((v4 - 101) < 4)
        {
LABEL_7:
          v15 = (void *)CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
          {
            v28 = NSNumber;
            v29 = v15;
            v30 = [v28 numberWithUnsignedShort:v4];
            int v31 = 136315394;
            v32 = "-[CKVDonateTaskFactory taskForId:usingLocalization:]";
            __int16 v33 = 2112;
            v34 = v30;
            _os_log_error_impl(&dword_1A77B3000, v29, OS_LOG_TYPE_ERROR, "%s Failed to find donation task for: %@", (uint8_t *)&v31, 0x16u);
          }
          v10 = 0;
        }
        break;
    }
  }

  return v10;
}

- (BOOL)useSimulatedProviderBridge
{
  return self->_useSimulatedProviderBridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_donatorProvider, 0);
}

- (void)setUseSimulatedProviderBridge:(BOOL)a3
{
  self->_useSimulatedProviderBridge = a3;
}

- (id)allInstalledAppBundleIdentifiers
{
  return (id)[(KMProviderBridgeFactory *)self->_factory allInstalledAppBundleIdentifiers];
}

- (void)setupBridgeListenersWithHandler:(id)a3
{
}

- (id)verificationTaskForId:(unsigned __int16)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    uint64_t v4 = [CKVDonateTask alloc];
    donatorProvider = self->_donatorProvider;
    id v6 = [(KMProviderBridgeFactory *)self->_factory bridgeForOriginAppId:*MEMORY[0x1E4F71F68]];
    v7 = [(CKVDonateTask *)v4 initWithDonatorProvider:donatorProvider fullDatasetBridge:v6 timeout:self->_timeout];
  }
  else
  {
    uint64_t v8 = a3;
    v9 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v11 = NSNumber;
      v12 = v9;
      v13 = [v11 numberWithUnsignedShort:v8];
      int v14 = 136315394;
      v15 = "-[CKVDonateTaskFactory verificationTaskForId:]";
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, "%s taskId: %@ is not a supported verification task", (uint8_t *)&v14, 0x16u);
    }
    v7 = 0;
  }
  return v7;
}

- (id)derivativeTaskForId:(unsigned __int16)a3 usingLocalization:(id)a4 modifiedItemIds:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v6 == 9)
  {
    v10 = [v8 siriLanguageCode];
    v11 = [CKVDonateTask alloc];
    donatorProvider = self->_donatorProvider;
    v13 = [(KMProviderBridgeFactory *)self->_factory globalTermMultiDatasetBridgeWithModifiedOriginAppIds:v9 languageCode:v10];
    int v14 = [(CKVDonateTask *)v11 initWithDonatorProvider:donatorProvider multiDatasetBridge:v13 timeout:self->_timeout];
  }
  else
  {
    v15 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v17 = NSNumber;
      uint64_t v18 = v15;
      v19 = [v17 numberWithUnsignedShort:v6];
      int v20 = 136315394;
      v21 = "-[CKVDonateTaskFactory derivativeTaskForId:usingLocalization:modifiedItemIds:]";
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_1A77B3000, v18, OS_LOG_TYPE_ERROR, "%s taskId: %@ is not a supported derivative task", (uint8_t *)&v20, 0x16u);
    }
    int v14 = 0;
  }

  return v14;
}

- (CKVDonateTaskFactory)initWithDirectory:(id)a3 timeout:(double)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKVDonateTaskFactory;
  v7 = [(CKVDonateTaskFactory *)&v17 init];
  if (!v7)
  {
LABEL_6:
    int v14 = v7;
    goto LABEL_10;
  }
  id v8 = objc_alloc_init(CKVDonatorFactory);
  donatorProvider = v7->_donatorProvider;
  v7->_donatorProvider = (CKVDonatorProvider *)v8;

  if (v7->_donatorProvider)
  {
    v7->_useSimulatedProviderBridge = 0;
    v7->_timeout = a4;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v10 = (void *)getKMProviderBridgeFactoryClass_softClass;
    uint64_t v21 = getKMProviderBridgeFactoryClass_softClass;
    if (!getKMProviderBridgeFactoryClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v23 = __getKMProviderBridgeFactoryClass_block_invoke;
      uint64_t v24 = &unk_1E5CF9F10;
      v25 = &v18;
      __getKMProviderBridgeFactoryClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v19[3];
    }
    v11 = v10;
    _Block_object_dispose(&v18, 8);
    uint64_t v12 = [[v11 alloc] initWithDirectory:v6];
    factory = v7->_factory;
    v7->_factory = (KMProviderBridgeFactory *)v12;

    goto LABEL_6;
  }
  v15 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CKVDonateTaskFactory initWithDirectory:timeout:]";
    _os_log_error_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_ERROR, "%s Invalid donate service provider", (uint8_t *)&buf, 0xCu);
  }
  int v14 = 0;
LABEL_10:

  return v14;
}

- (CKVDonateTaskFactory)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

@end