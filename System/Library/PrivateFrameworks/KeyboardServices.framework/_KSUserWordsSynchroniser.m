@interface _KSUserWordsSynchroniser
+ (Class)infoClass;
+ (id)generateKeyWithSize:(unint64_t)a3;
+ (id)generateRecordNameForFilename:(id)a3 withKey:(id)a4;
+ (id)sharedAcrossLanguagesNegativeLearningValue;
+ (id)sharedAcrossLanguagesVulgarWordUsageValue;
+ (id)sharedInstance;
- (BOOL)checkErrors:(id)a3;
- (NSArray)requiredLanguages;
- (_KSUserWordsSynchroniser)init;
- (id)containerID;
- (id)filenameForLanguage:(id)a3;
- (id)generateRecordListForLanguages:(id)a3;
- (id)information;
- (id)initForTestingWithManager:(id)a3 enablePushing:(BOOL)a4;
- (id)recordIDForLanguage:(id)a3 withKey:(id)a4;
- (void)accountDidChange:(id)a3;
- (void)checkConfiguration;
- (void)checkForDownload:(id)a3 uploads:(id)a4 allLanguages:(id)a5;
- (void)checkProgress:(int)a3 withInfo:(id)a4;
- (void)dealloc;
- (void)deleteZoneWithCompletionHandler:(id)a3;
- (void)deltaDownloadForLanguages:(id)a3;
- (void)disable;
- (void)dumpAllRecordsWithCompletionHandler:(id)a3;
- (void)firstTimeDownloadWithKey:(id)a3;
- (void)generateKeyWithCompletionHandler:(id)a3;
- (void)identitiesDidChange:(id)a3;
- (void)information;
- (void)keyboardUsed;
- (void)loadKeyWithCompletion:(id)a3;
- (void)modifyInformationWithOperations:(id)a3;
- (void)overwriteFilesWithRecords:(id)a3 withCompletionHandler:(id)a4;
- (void)readFilesWithRecordIDs:(id)a3 forColumns:(id)a4 priority:(unint64_t)a5 withCompletionHandler:(id)a6;
- (void)saveKey:(id)a3 withCompletion:(id)a4;
@end

@implementation _KSUserWordsSynchroniser

+ (id)generateKeyWithSize:(unint64_t)a3
{
  v4 = malloc_type_malloc(a3, 0xF5D78EEBuLL);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], a3, v4))
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:a3];
  }
  free(v4);
  return v5;
}

+ (id)generateRecordNameForFilename:(id)a3 withKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 dataUsingEncoding:4];
  id v7 = v5;
  v8 = (const void *)[v7 bytes];
  size_t v9 = [v7 length];
  id v10 = v6;
  CCHmac(2u, v8, v9, (const void *)[v10 bytes], objc_msgSend(v10, "length"), macOut);
  uint64_t v11 = 0;
  v12 = v17;
  do
  {
    unint64_t v13 = macOut[v11];
    *(v12 - 1) = a0123456789abcd[v13 >> 4];
    unsigned char *v12 = a0123456789abcd[v13 & 0xF];
    v12 += 2;
    ++v11;
  }
  while (v11 != 32);
  v14 = (void *)[[NSString alloc] initWithBytes:&v16 length:64 encoding:4];

  return v14;
}

+ (id)sharedAcrossLanguagesNegativeLearningValue
{
  return @"SharedAcrossLanguagesNegativeLearning";
}

+ (id)sharedAcrossLanguagesVulgarWordUsageValue
{
  return @"SharedAcrossLanguagesVulgarWordUsage";
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42___KSUserWordsSynchroniser_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_synchroniser;
  return v2;
}

- (id)containerID
{
  return @"com.apple.textinput.KeyboardServices.Secure";
}

- (id)initForTestingWithManager:(id)a3 enablePushing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_KSUserWordsSynchroniser;
  id v7 = [(_KSUserWordsSynchroniser *)&v30 init];
  v8 = v7;
  if (v7)
  {
    languagesIfOffline = v7->_languagesIfOffline;
    v7->_languagesIfOffline = (NSArray *)MEMORY[0x263EFFA68];

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.keyboardServices.userWords.workQueue", v10);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v11;

    unint64_t v13 = [_KSControlFileController alloc];
    v14 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "infoClass"), "keyboardDirectory");
    uint64_t v15 = [(_KSControlFileController *)v13 initWithName:@"UserWords" inDirectory:v14];
    controlFile = v8->_controlFile;
    v8->_controlFile = (_KSControlFileController *)v15;

    if (v4)
    {
      v8->_taskRun = 1;
      v17 = v8->_workQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke;
      block[3] = &unk_2648906A8;
      v29 = v8;
      dispatch_async(v17, block);
    }
    if (v6)
    {
      v18 = (_KSCloudKitManager *)v6;
      cloudKitManager = v8->_cloudKitManager;
      v8->_cloudKitManager = v18;
    }
    else
    {
      v20 = [_KSUserWordsSynchroniserCloudKitManager alloc];
      v21 = [(_KSUserWordsSynchroniser *)v8 containerID];
      uint64_t v22 = [(_KSCloudKitManager *)v20 initWithContainer:v21 recordZoneName:@"UserWords"];
      v23 = v8->_cloudKitManager;
      v8->_cloudKitManager = (_KSCloudKitManager *)v22;

      v24 = [MEMORY[0x263F08A00] defaultCenter];
      [v24 addObserver:v8 selector:sel_accountDidChange_ name:@"KSCloudKitAccountDidChange" object:v8->_cloudKitManager];

      cloudKitManager = [MEMORY[0x263F08A00] defaultCenter];
      [cloudKitManager addObserver:v8 selector:sel_identitiesDidChange_ name:@"KSCloudKitIdentitiesDidChange" object:v8->_cloudKitManager];
    }

    v25 = objc_alloc_init(_KSRequestThrottle);
    identityThrottle = v8->_identityThrottle;
    v8->_identityThrottle = v25;

    [(_KSRequestThrottle *)v8->_identityThrottle setQueue:v8->_workQueue];
    [(_KSRequestThrottle *)v8->_identityThrottle setDebugIdentifier:@"identity change"];
  }

  return v8;
}

+ (Class)infoClass
{
  return (Class)objc_opt_class();
}

- (_KSUserWordsSynchroniser)init
{
  return (_KSUserWordsSynchroniser *)[(_KSUserWordsSynchroniser *)self initForTestingWithManager:0 enablePushing:1];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_KSUserWordsSynchroniser;
  [(_KSUserWordsSynchroniser *)&v4 dealloc];
}

- (void)disable
{
  [(_KSControlFileController *)self->_controlFile reset];
  if (self->_pushTask)
  {
    id v3 = +[_KSTaskScheduler sharedInstance];
    [v3 unregisterTask:self->_pushTask];
  }
}

- (id)information
{
  if ([(_KSControlFileController *)self->_controlFile checkIfExists])
  {
    id v3 = (void *)MEMORY[0x263F08928];
    objc_super v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
    dispatch_queue_t v11 = [(_KSControlFileController *)self->_controlFile contents];
    v12 = [v3 unarchivedObjectOfClasses:v10 fromData:v11 error:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
    }
    else
    {
      v14 = KSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_KSUserWordsSynchroniser information]();
      }

      [(_KSUserWordsSynchroniser *)self disable];
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (void)modifyInformationWithOperations:(id)a3
{
  objc_super v4 = (uint64_t (**)(id, BOOL, uint64_t))a3;
  uint64_t v5 = [(_KSUserWordsSynchroniser *)self information];
  id v11 = v5;
  if (v5)
  {
    uint64_t v6 = [v5 mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v7 = (void *)v6;
  int v8 = v4[2](v4, v11 != 0, v6);

  if (v8)
  {
    controlFile = self->_controlFile;
    id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    [(_KSControlFileController *)controlFile setContents:v10];
  }
}

- (NSArray)requiredLanguages
{
  id v3 = [(_KSUserWordsSynchroniser *)self information];
  languagesIfOffline = [v3 objectForKey:@"Languages"];
  uint64_t v5 = languagesIfOffline;
  if (!languagesIfOffline) {
    languagesIfOffline = self->_languagesIfOffline;
  }
  uint64_t v6 = languagesIfOffline;

  return v6;
}

- (void)accountDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"KSCloudKitAccountDidChangeStatusKey"];
  uint64_t v7 = [v6 integerValue];

  int v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"KSCloudKitAccountDidChangeUserChangedKey"];
  LOBYTE(v5) = [v9 BOOLValue];

  id v10 = [v4 userInfo];
  id v11 = [v10 objectForKeyedSubscript:@"KSCloudKitAccountDidChangeDeviceToDeviceKey"];
  char v12 = [v11 BOOLValue];

  id v13 = [v4 userInfo];

  v14 = [v13 objectForKeyedSubscript:@"KSCloudKitAccountDidSuccessfullyCreateZone"];
  LOBYTE(v11) = [v14 BOOLValue];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___KSUserWordsSynchroniser_accountDidChange___block_invoke;
  block[3] = &unk_2648919D0;
  char v17 = (char)v5;
  void block[4] = self;
  void block[5] = v7;
  char v18 = v12;
  char v19 = (char)v11;
  dispatch_async(workQueue, block);
}

- (void)identitiesDidChange:(id)a3
{
  identityThrottle = self->_identityThrottle;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke;
  v4[3] = &unk_2648909A8;
  v4[4] = self;
  [(_KSRequestThrottle *)identityThrottle postRequest:v4];
}

- (void)checkProgress:(int)a3 withInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = KSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = checkProgress_withInfo__meanings[a3];
    int v8 = 136315650;
    uint64_t v9 = "-[_KSUserWordsSynchroniser checkProgress:withInfo:]";
    __int16 v10 = 2080;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_22B2BC000, v6, OS_LOG_TYPE_INFO, "%s  State: %s: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)checkForDownload:(id)a3 uploads:(id)a4 allLanguages:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_IsEnabled())
  {
    if (v8)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2;
      v20[3] = &unk_264891A70;
      v20[4] = self;
      id v11 = (void *)MEMORY[0x230F45010](v20);
    }
    else
    {
      id v11 = &__block_literal_global_10;
    }
    workQueue = self->_workQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_4;
    v14[3] = &unk_264891B60;
    id v15 = v9;
    id v16 = v10;
    char v17 = self;
    id v18 = v8;
    id v19 = v11;
    id v13 = v11;
    dispatch_async(workQueue, v14);
  }
  else
  {
    [(_KSUserWordsSynchroniser *)self checkProgress:0 withInfo:MEMORY[0x263EFFA80]];
  }
}

- (void)keyboardUsed
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)generateKeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_attemptingConnection)
  {
    self->_attemptingConnection = 1;
    self->_needRetry = 0;
    id v5 = [(id)objc_opt_class() generateKeyWithSize:64];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke;
    v19[3] = &unk_264891BB0;
    v19[4] = self;
    id v6 = v4;
    id v20 = v6;
    uint64_t v7 = (void *)MEMORY[0x230F45010](v19);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3;
    v17[3] = &unk_264891BD8;
    v17[4] = self;
    id v18 = v6;
    id v8 = (void *)MEMORY[0x230F45010](v17);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_161;
    v12[3] = &unk_264891C28;
    id v13 = v5;
    uint64_t v14 = self;
    id v15 = v7;
    id v16 = v8;
    id v9 = v8;
    id v10 = v5;
    id v11 = v7;
    [(_KSUserWordsSynchroniser *)self saveKey:v10 withCompletion:v12];
  }
}

- (void)checkConfiguration
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_IsEnabled())
  {
    if ([(_KSControlFileController *)self->_controlFile checkIfExists])
    {
      id v3 = [(_KSUserWordsSynchroniser *)self information];
      id v4 = [v3 objectForKey:@"Key"];

      if (v4) {
        return;
      }
      id v5 = &v8;
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      id v6 = __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_2;
    }
    else
    {
      uint64_t v7 = KSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v12 = "-[_KSUserWordsSynchroniser checkConfiguration]";
        _os_log_impl(&dword_22B2BC000, v7, OS_LOG_TYPE_INFO, "%s  Persistent data not found, acquiring key!", buf, 0xCu);
      }

      id v5 = v10;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      id v6 = __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke;
    }
    v5[2] = (uint64_t)v6;
    v5[3] = (uint64_t)&unk_264891C50;
    v5[4] = (uint64_t)self;
    -[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:](self, "generateKeyWithCompletionHandler:", v8, v9);
  }
}

- (void)firstTimeDownloadWithKey:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke;
  v7[3] = &unk_264891550;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)deltaDownloadForLanguages:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54___KSUserWordsSynchroniser_deltaDownloadForLanguages___block_invoke;
  v7[3] = &unk_264891550;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (id)generateRecordListForLanguages:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_KSUserWordsSynchroniser *)self information];
  id v6 = v5;
  if (!v4)
  {
    id v4 = [v5 objectForKey:@"Languages"];
  }
  uint64_t v7 = [v6 objectForKey:@"Key"];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke;
  v22[3] = &unk_264891C78;
  id v8 = v7;
  id v23 = v8;
  v24 = self;
  [(_KSUserWordsSynchroniser *)self loadKeyWithCompletion:v22];
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v16 = -[_KSUserWordsSynchroniser recordIDForLanguage:withKey:](self, "recordIDForLanguage:withKey:", v15, v8, (void)v18);
        [v9 setObject:v15 forKey:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)filenameForLanguage:(id)a3
{
  id v3 = (uint64_t (*)(uint64_t, uint64_t))softLinkMGCopyAnswer_0;
  id v4 = a3;
  id v5 = (void *)v3(@"DeviceName", 0);
  id v6 = [NSString stringWithFormat:@"%@-%@", v5, v4];

  return v6;
}

- (id)recordIDForLanguage:(id)a3 withKey:(id)a4
{
  cloudKitManager = self->_cloudKitManager;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  id v10 = [(_KSUserWordsSynchroniser *)self filenameForLanguage:v8];

  uint64_t v11 = [v9 generateRecordNameForFilename:v10 withKey:v7];

  uint64_t v12 = [(_KSCloudKitManager *)cloudKitManager recordIDForName:v11];

  return v12;
}

- (BOOL)checkErrors:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263EFD498]];

  if (!v6) {
    goto LABEL_28;
  }
  uint64_t v7 = [v4 code];
  uint64_t v8 = 0;
  BOOL v9 = 1;
  if (v7 <= 27)
  {
    if (v7 != 2)
    {
      if (v7 != 26) {
        goto LABEL_29;
      }
      goto LABEL_15;
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v28 = [v4 userInfo];
    v29 = [v28 objectForKey:*MEMORY[0x263EFD4C8]];
    objc_super v30 = [v29 allValues];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v30);
          }
          if (![(_KSUserWordsSynchroniser *)self checkErrors:*(void *)(*((void *)&v37 + 1) + 8 * i)])
          {

            goto LABEL_18;
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

LABEL_28:
    BOOL v9 = 1;
    goto LABEL_29;
  }
  switch(v7)
  {
    case 28:
LABEL_15:
      uint64_t v26 = KSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_KSUserWordsSynchroniser checkErrors:](v4);
      }

      cloudKitManager = self->_cloudKitManager;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __40___KSUserWordsSynchroniser_checkErrors___block_invoke;
      v36[3] = &unk_264891CC0;
      v36[4] = self;
      v36[5] = v8;
      [(_KSCloudKitManager *)cloudKitManager resetZoneWithDelete:v8 withCompletionHandler:v36];
      goto LABEL_18;
    case 112:
      long long v18 = KSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_KSUserWordsSynchroniser checkErrors:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      uint64_t v8 = 2;
      goto LABEL_15;
    case 5006:
      id v10 = KSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_KSUserWordsSynchroniser checkErrors:](v10, v11, v12, v13, v14, v15, v16, v17);
      }

      [(_KSControlFileController *)self->_controlFile reset];
LABEL_18:
      BOOL v9 = 0;
      break;
  }
LABEL_29:

  return v9;
}

- (void)readFilesWithRecordIDs:(id)a3 forColumns:(id)a4 priority:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x263EFD6D8];
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[[v11 alloc] initWithRecordIDs:v13];

  [v14 setDesiredKeys:v12];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  long long v18 = __93___KSUserWordsSynchroniser_readFilesWithRecordIDs_forColumns_priority_withCompletionHandler___block_invoke;
  uint64_t v19 = &unk_264890F98;
  uint64_t v20 = self;
  id v21 = v10;
  id v15 = v10;
  [v14 setFetchRecordsCompletionBlock:&v16];
  -[_KSCloudKitManager addOperation:priority:](self->_cloudKitManager, "addOperation:priority:", v14, a5, v16, v17, v18, v19, v20);
}

- (void)overwriteFilesWithRecords:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263EFD748];
  id v8 = a3;
  BOOL v9 = (void *)[[v7 alloc] initWithRecordsToSave:v8 recordIDsToDelete:0];

  [v9 setSavePolicy:2];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __76___KSUserWordsSynchroniser_overwriteFilesWithRecords_withCompletionHandler___block_invoke;
  uint64_t v14 = &unk_264891CE8;
  id v15 = self;
  id v16 = v6;
  id v10 = v6;
  [v9 setModifyRecordsCompletionBlock:&v11];
  -[_KSCloudKitManager addOperation:](self->_cloudKitManager, "addOperation:", v9, v11, v12, v13, v14, v15);
}

- (void)loadKeyWithCompletion:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_KSCloudKitManager *)self->_cloudKitManager recordIDForName:@"key"];
  id v6 = objc_alloc(MEMORY[0x263EFD6D8]);
  v14[0] = v5;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v8 = (void *)[v6 initWithRecordIDs:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50___KSUserWordsSynchroniser_loadKeyWithCompletion___block_invoke;
  v11[3] = &unk_264891D10;
  id v12 = v5;
  id v13 = v4;
  v11[4] = self;
  id v9 = v5;
  id v10 = v4;
  [v8 setFetchRecordsCompletionBlock:v11];
  [(_KSCloudKitManager *)self->_cloudKitManager addOperation:v8];
}

- (void)saveKey:(id)a3 withCompletion:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263EFD7C8];
  id v8 = a3;
  id v9 = [v7 alloc];
  id v10 = [(_KSCloudKitManager *)self->_cloudKitManager recordIDForName:@"key"];
  uint64_t v11 = (void *)[v9 initWithRecordType:@"UserWordData" recordID:v10];

  id v12 = [v11 encryptedValueStore];
  [v12 setObject:v8 forKey:@"keybytes"];

  id v13 = objc_alloc(MEMORY[0x263EFD748]);
  v23[0] = v11;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v15 = (void *)[v13 initWithRecordsToSave:v14 recordIDsToDelete:0];

  [v15 setSavePolicy:0];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __51___KSUserWordsSynchroniser_saveKey_withCompletion___block_invoke;
  uint64_t v20 = &unk_264891CE8;
  id v21 = self;
  id v22 = v6;
  id v16 = v6;
  [v15 setModifyRecordsCompletionBlock:&v17];
  -[_KSCloudKitManager addOperation:](self->_cloudKitManager, "addOperation:", v15, v17, v18, v19, v20, v21);
}

- (void)dumpAllRecordsWithCompletionHandler:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = objc_alloc(MEMORY[0x263EFD6B8]);
  uint64_t v7 = [(_KSCloudKitManager *)self->_cloudKitManager recordZone];
  id v8 = [v7 zoneID];
  v19[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v6 initWithRecordZoneIDs:v9 optionsByRecordZoneID:0];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke;
  v17[3] = &unk_264890DE0;
  id v11 = v5;
  id v18 = v11;
  [v10 setRecordChangedBlock:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_264890930;
  id v15 = v11;
  id v16 = v4;
  id v12 = v4;
  id v13 = v11;
  [v10 setFetchRecordZoneChangesCompletionBlock:v14];
  [(_KSCloudKitManager *)self->_cloudKitManager addOperation:v10];
}

- (void)deleteZoneWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityThrottle, 0);
  objc_storeStrong((id *)&self->_languagesIfOffline, 0);
  objc_storeStrong((id *)&self->_pushTask, 0);
  objc_storeStrong((id *)&self->_controlFile, 0);
  objc_storeStrong((id *)&self->_cloudKitManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)information
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v2, v3, "%s  Incorrect data type in control file '%@', resetting", v4, v5, v6, v7, 2u);
}

- (void)checkErrors:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)checkErrors:(void *)a1 .cold.2(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v1, v2, "%s  Zone disappeared (%li)", v3, v4, v5, v6, 2u);
}

- (void)checkErrors:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end