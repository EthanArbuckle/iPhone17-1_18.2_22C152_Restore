@interface _INVocabularyStoreManager
+ (id)_customVocabularyDirectory;
+ (id)_globalClassQueue;
+ (id)_hashOfAppPath:(id)a3;
+ (id)_latestVocabularyStringsAt:(id)a3;
+ (id)appDatastoreDirectoryForAppBundleID:(id)a3 bundlePath:(id)a4;
+ (id)managerForBundleID:(id)a3 bundlePath:(id)a4;
+ (id)savedCustomVocabularyOverviewDictionary;
+ (void)_iterateVocabularyWithSummary:(id)a3 optionalBlock:(id)a4;
+ (void)deleteAllUserVocabularyFromAllAppsAsync;
+ (void)enumerateVocabularyUsingBlock:(id)a3;
- (NSString)appBundleID;
- (NSString)appBundlePath;
- (NSString)baseDirectoryPath;
- (_INVocabularyStoreManager)init;
- (_INVocabularyStoreManager)initWithBaseDirectory:(id)a3 appBundleID:(id)a4 appBundlePath:(id)a5;
- (id)_baseDirectoryPathForIntentSlot:(id)a3;
- (id)_documentWithItems:(id)a3 forIntentSlot:(id)a4;
- (id)_validator;
- (id)deleteEverything;
- (id)deleteIntentSlot:(id)a3;
- (id)deleteVocabularyStoreItemAt:(id)a3;
- (id)getPathToLatestVocabulary:(id *)a3 pathDuringReading:(id *)a4 sentVocabulary:(id *)a5 forIntentSlot:(id)a6;
- (void)_writeLatestVocabularyItems:(id)a3 forIntentSlot:(id)a4 completion:(id)a5;
- (void)checkIfSyncSlot:(id)a3 isAllowedWithCompletion:(id)a4;
- (void)setAppBundleID:(id)a3;
- (void)setAppBundlePath:(id)a3;
- (void)writeLatestVocabularyItems:(id)a3 forIntentSlot:(id)a4 completion:(id)a5;
@end

@implementation _INVocabularyStoreManager

+ (id)managerForBundleID:(id)a3 bundlePath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = v7;
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      v14 = "+[_INVocabularyStoreManager managerForBundleID:bundlePath:]";
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_ERROR, "%s radar://24597826 ignoring that %{public}@ is installed at '%{public}@'. All installed instances will share the same vocabulary.", (uint8_t *)&v13, 0x20u);
    }
  }
  v10 = +[_INVocabularyStoreManager appDatastoreDirectoryForAppBundleID:v6 bundlePath:0];
  v11 = (void *)[objc_alloc((Class)a1) initWithBaseDirectory:v10 appBundleID:v6 appBundlePath:0];

  return v11;
}

- (_INVocabularyStoreManager)initWithBaseDirectory:(id)a3 appBundleID:(id)a4 appBundlePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_INVocabularyStoreManager;
  v11 = [(_INVocabularyStoreManager *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    appBundleID = v11->_appBundleID;
    v11->_appBundleID = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    appBundlePath = v11->_appBundlePath;
    v11->_appBundlePath = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    baseDirectoryPath = v11->_baseDirectoryPath;
    v11->_baseDirectoryPath = (NSString *)v16;

    v18 = NSString;
    uint64_t v19 = [(id)objc_opt_class() description];
    v20 = [v18 stringWithFormat:@"%@.%@", v19, v11->_appBundleID];

    id v21 = v20;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v22;
  }
  return v11;
}

+ (id)appDatastoreDirectoryForAppBundleID:(id)a3 bundlePath:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _hashOfAppPath:a4];
  id v8 = [a1 _customVocabularyDirectory];
  id v9 = [v8 stringByAppendingPathComponent:v6];

  id v10 = [v9 stringByAppendingPathComponent:v7];

  return v10;
}

+ (id)_hashOfAppPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  *(void *)md = 0;
  uint64_t v9 = 0;
  int v10 = 0;
  if ([v3 length])
  {
    id v4 = [v3 dataUsingEncoding:4];
    CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);

  return v5;
}

+ (id)savedCustomVocabularyOverviewDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [a1 _iterateVocabularyWithSummary:v3 optionalBlock:0];

  return v3;
}

+ (void)_iterateVocabularyWithSummary:(id)a3 optionalBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _customVocabularyDirectory];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EDBAAEC0];
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = +[_INVocabulary supportedVocabularyStringTypes];
  int v13 = [v11 setWithArray:v12];

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke;
  v32[3] = &unk_1E55164D0;
  v35 = v36;
  id v14 = v9;
  id v33 = v14;
  id v15 = v10;
  id v34 = v15;
  uint64_t v16 = (void (**)(void, void, void))MEMORY[0x192F984C0](v32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_50;
  v23[3] = &unk_1E5516548;
  id v17 = v8;
  id v24 = v17;
  v18 = v16;
  id v28 = v18;
  id v19 = v6;
  id v25 = v19;
  id v20 = v13;
  id v26 = v20;
  id v21 = v7;
  v30 = v36;
  id v31 = a1;
  id v29 = v21;
  id v22 = v14;
  id v27 = v22;
  ((void (**)(void, id, void *))v16)[2](v18, v17, v23);

  _Block_object_dispose(v36, 8);
}

- (void)_writeLatestVocabularyItems:(id)a3 forIntentSlot:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v11 = [(_INVocabularyStoreManager *)self _baseDirectoryPathForIntentSlot:v9];
  if ([v8 count]
    || (buf[0] = 0,
        [MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v12 fileExistsAtPath:v11 isDirectory:buf],
        v12,
        buf[0]))
  {
    int v13 = [(_INVocabularyStoreManager *)self _documentWithItems:v8 forIntentSlot:v9];
    id v14 = [v11 stringByAppendingPathComponent:@"LatestVocabulary.plist"];
    id v15 = [v13 writeToFile:v14 createIntermediateDirectories:1];
    if (v15)
    {
      uint64_t v16 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[_INVocabularyStoreManager _writeLatestVocabularyItems:forIntentSlot:completion:]";
        __int16 v24 = 2114;
        id v25 = v15;
        _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s error writing sync state %{public}@", buf, 0x16u);
      }
      id v17 = v15;
      uint64_t v18 = 0;
    }
    else
    {
      id v21 = [v11 stringByAppendingPathComponent:@"SentVocabulary.plist"];
      id v19 = [[_INVocabularyGenerationDocument alloc] initWithContentsOfFile:v21];
      id v20 = [v13 diffFromPreviousDocument:v19];
      uint64_t v18 = [v20 hasChanges];
    }
    v10[2](v10, v18, v15);
  }
  else
  {
    v10[2](v10, 0, 0);
  }
}

- (id)_baseDirectoryPathForIntentSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"VoiceCommandNameType"]) {
    [(id)objc_opt_class() appDatastoreDirectoryForAppBundleID:@"com.apple.siriVoiceShortcuts" bundlePath:0];
  }
  else {
  v5 = [(_INVocabularyStoreManager *)self baseDirectoryPath];
  }
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (NSString)baseDirectoryPath
{
  return self->_baseDirectoryPath;
}

+ (id)_customVocabularyDirectory
{
  v2 = INUserSupportDirectoryPath();
  id v3 = [v2 stringByAppendingPathComponent:@"CustomVocabulary"];

  return v3;
}

- (id)_documentWithItems:(id)a3 forIntentSlot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(_INVocabularyGenerationDocument);
  if ([v6 isEqualToString:@"VoiceCommandNameType"])
  {
    [(_INVocabularyGenerationDocument *)v8 setAppBundleID:@"com.apple.siriVoiceShortcuts"];
  }
  else
  {
    id v9 = [(_INVocabularyStoreManager *)self appBundleID];
    [(_INVocabularyGenerationDocument *)v8 setAppBundleID:v9];
  }
  [(_INVocabularyGenerationDocument *)v8 setVocabularyItems:v7];

  [(_INVocabularyGenerationDocument *)v8 setIntentSlot:v6];

  return v8;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (id)deleteEverything
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    appBundleID = self->_appBundleID;
    int v10 = 136315394;
    uint64_t v11 = "-[_INVocabularyStoreManager deleteEverything]";
    __int16 v12 = 2112;
    int v13 = appBundleID;
    _os_log_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_INFO, "%s deleting user-vocabulary for %@", (uint8_t *)&v10, 0x16u);
  }
  v5 = [(_INVocabularyStoreManager *)self baseDirectoryPath];
  id v6 = [(_INVocabularyStoreManager *)self deleteVocabularyStoreItemAt:v5];

  notify_post("INVoocabularyChangedNotification");
  if (v6)
  {
    id v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      id v9 = self->_appBundleID;
      int v10 = 136315650;
      uint64_t v11 = "-[_INVocabularyStoreManager deleteEverything]";
      __int16 v12 = 2114;
      int v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to delete user-vocabulary for %{public}@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v6;
}

- (id)deleteVocabularyStoreItemAt:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _customVocabularyDirectory];
  if ([v3 hasPrefix:v4])
  {
    v5 = INRemoveItemAtPath(v3);
    if (!v5)
    {
      id v6 = [v3 stringByDeletingLastPathComponent];
      _CleanUpDirectoryAsNeeded(v6, v4);

      v5 = 0;
    }
  }
  else
  {
    id v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[_INVocabularyStoreManager deleteVocabularyStoreItemAt:]";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Attempt to delete a files outside of the vocabulary-directory we manage. Offending file: %@", buf, 0x16u);
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28328];
    id v12 = v3;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v5 = [v8 errorWithDomain:@"IntentsErrorDomain" code:4000 userInfo:v9];
  }

  return v5;
}

- (void)checkIfSyncSlot:(id)a3 isAllowedWithCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _INVocabularyStringTypeFromSlotName(v6);
    if (v8)
    {
      id v9 = [(_INVocabularyStoreManager *)self _validator];
      appBundleID = self->_appBundleID;
      uint64_t v11 = [v8 integerValue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __69___INVocabularyStoreManager_checkIfSyncSlot_isAllowedWithCompletion___block_invoke;
      v13[3] = &unk_1E55180A8;
      id v14 = v7;
      [v9 determineIfBundleID:appBundleID canProvideVocabularyOfType:v11 completion:v13];
    }
    else
    {
      id v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v16 = "-[_INVocabularyStoreManager checkIfSyncSlot:isAllowedWithCompletion:]";
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s '%{public}@' is not a valid slot", buf, 0x16u);
      }
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (id)_validator
{
  validator = self->_validator;
  if (!validator)
  {
    id v4 = objc_alloc_init(_INVocabularyValidator);
    v5 = self->_validator;
    self->_validator = v4;

    validator = self->_validator;
  }

  return validator;
}

- (void)writeLatestVocabularyItems:(id)a3 forIntentSlot:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81___INVocabularyStoreManager_writeLatestVocabularyItems_forIntentSlot_completion___block_invoke;
  v15[3] = &unk_1E551DC80;
  id v16 = v9;
  __int16 v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundlePath, 0);
  objc_storeStrong((id *)&self->_baseDirectoryPath, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_validator, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAppBundlePath:(id)a3
{
}

- (NSString)appBundlePath
{
  return self->_appBundlePath;
}

- (void)setAppBundleID:(id)a3
{
}

- (id)getPathToLatestVocabulary:(id *)a3 pathDuringReading:(id *)a4 sentVocabulary:(id *)a5 forIntentSlot:(id)a6
{
  id v9 = [(_INVocabularyStoreManager *)self _baseDirectoryPathForIntentSlot:a6];
  id v10 = v9;
  if (a3)
  {
    *a3 = [v9 stringByAppendingPathComponent:@"LatestVocabulary.plist"];
  }
  if (a4)
  {
    *a4 = [v10 stringByAppendingPathComponent:@"StagedVocabulary.plist"];
  }
  if (a5)
  {
    *a5 = [v10 stringByAppendingPathComponent:@"SentVocabulary.plist"];
  }

  return 0;
}

- (id)deleteIntentSlot:(id)a3
{
  id v4 = a3;
  v5 = [(_INVocabularyStoreManager *)self baseDirectoryPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = [(_INVocabularyStoreManager *)self deleteVocabularyStoreItemAt:v6];

  return v7;
}

- (_INVocabularyStoreManager)init
{
}

+ (void)deleteAllUserVocabularyFromAllAppsAsync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "+[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]";
    _os_log_impl(&dword_18CB2F000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = [a1 _globalClassQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___INVocabularyStoreManager_deleteAllUserVocabularyFromAllAppsAsync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v4, block);
}

+ (void)enumerateVocabularyUsingBlock:(id)a3
{
  if (a3) {
    [a1 _iterateVocabularyWithSummary:0 optionalBlock:a3];
  }
}

+ (id)_latestVocabularyStringsAt:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v28[0] = @"LatestVocabulary.plist";
  v28[1] = @"StagedVocabulary.plist";
  v28[2] = @"SentVocabulary.plist";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v5 = (id)[v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v9 = [_INVocabularyGenerationDocument alloc];
        id v10 = [v3 stringByAppendingPathComponent:v8];
        uint64_t v11 = [(_INVocabularyGenerationDocument *)v9 initWithContentsOfFile:v10];

        if (v11)
        {
          id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v12 = [(_INVocabularyGenerationDocument *)v11 vocabularyItems];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                __int16 v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) string];
                if (v17) {
                  [v5 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }

          goto LABEL_20;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  return v5;
}

+ (id)_globalClassQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___INVocabularyStoreManager__globalClassQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_globalClassQueue_onceToken != -1) {
    dispatch_once(&_globalClassQueue_onceToken, block);
  }
  v2 = (void *)_globalClassQueue_stGlobalClassQueue;

  return v2;
}

@end