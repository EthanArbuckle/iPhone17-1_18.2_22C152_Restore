@interface INCExtensionManager
+ (id)sharedManager;
+ (void)initialize;
- (INCExtensionManager)init;
- (void)fetchExtensionForIntent:(id)a3 extensionInputItems:(id)a4 requiresTCC:(BOOL)a5 completion:(id)a6;
- (void)fetchExtensionForIntent:(id)a3 extensionInputItems:(id)a4 requiresTCC:(BOOL)a5 requiresTrustCheck:(BOOL)a6 completion:(id)a7;
@end

@implementation INCExtensionManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__INCExtensionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

- (void)fetchExtensionForIntent:(id)a3 extensionInputItems:(id)a4 requiresTCC:(BOOL)a5 completion:(id)a6
{
}

- (void).cxx_destruct
{
}

- (void)fetchExtensionForIntent:(id)a3 extensionInputItems:(id)a4 requiresTCC:(BOOL)a5 requiresTrustCheck:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = (os_log_t *)MEMORY[0x1E4F30240];
  v16 = (void *)*MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    uint64_t v18 = [v12 identifier];
    v19 = (void *)v18;
    v20 = @"NO";
    *(void *)&buf[4] = "-[INCExtensionManager fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:]";
    *(_DWORD *)buf = 136315650;
    if (v9) {
      v20 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v50 = v20;
    _os_log_impl(&dword_1BC57D000, v17, OS_LOG_TYPE_INFO, "%s Fetching extension for intent with indentifier: %@, requiresTCC: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke;
  v37[3] = &unk_1E62BB118;
  id v22 = v14;
  id v41 = v22;
  id v23 = v13;
  id v38 = v23;
  id v24 = v12;
  id v39 = v24;
  v40 = self;
  v25 = queue;
  v26 = v37;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke;
  v50 = (__CFString *)&unk_1E62BB140;
  v27 = v25;
  v51 = v27;
  id v52 = v26;
  v28 = (void (**)(void, void, void))MEMORY[0x1C1872DC0](buf);
  v29 = objc_msgSend(v24, "_intents_launchIdForCurrentPlatform");
  id v42 = 0;
  INExtractAppInfoFromSiriLaunchId();
  id v30 = v42;

  v31 = [v24 extensionBundleId];
  if (v31
    || ([v30 isEqualToString:*MEMORY[0x1E4F308E8]] & 1) != 0
    || [v30 isEqualToString:*MEMORY[0x1E4F308E0]])
  {

    goto LABEL_9;
  }
  v32 = INLocalAppBundleIdentifierForIntentBundleIdentifier();

  if (v32)
  {
LABEL_9:
    if (v9) {
      objc_msgSend(MEMORY[0x1E4F28C70], "_intents_matchSiriExtensionsForIntent:completion:", v24, v28);
    }
    else {
      objc_msgSend(MEMORY[0x1E4F28C70], "_intents_matchExtensionsForIntent:requireTrustCheck:completion:", v24, v8, v28);
    }
    goto LABEL_12;
  }
  os_log_t v33 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
  {
    v35 = v33;
    v36 = [v24 launchId];
    *(_DWORD *)v43 = 136315650;
    v44 = "_INCExtensionManagerFetchMatchingSiriExtensionForIntent";
    __int16 v45 = 2114;
    v46 = v36;
    __int16 v47 = 2114;
    id v48 = v30;
    _os_log_error_impl(&dword_1BC57D000, v35, OS_LOG_TYPE_ERROR, "%s No local app to handle intent with launchID=%{public}@, bundleID=%{public}@", v43, 0x20u);
  }
  v34 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300D0] code:2005 userInfo:0];
  ((void (**)(void, void, void *))v28)[2](v28, 0, v34);

LABEL_12:
}

void __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[INCExtensionManager fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s Found extension: %@. Starting extension connection...", buf, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke_12;
    v11[3] = &unk_1E62BB0F0;
    id v13 = *(id *)(a1 + 56);
    id v12 = v5;
    objc_msgSend(v12, "_intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:", v8, v9, v10, v11);
  }
}

uint64_t __109__INCExtensionManager_fetchExtensionForIntent_extensionInputItems_requiresTCC_requiresTrustCheck_completion___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, *(void *)(a1 + 32), a2);
  }
}

- (INCExtensionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)INCExtensionManager;
  v2 = [(INCExtensionManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("INCExtensionManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

uint64_t __36__INCExtensionManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end