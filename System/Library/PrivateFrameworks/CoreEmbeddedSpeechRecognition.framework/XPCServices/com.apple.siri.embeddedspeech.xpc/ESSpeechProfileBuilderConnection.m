@interface ESSpeechProfileBuilderConnection
+ (BOOL)_isProfileValidFromVersionsMap:(id)a3;
+ (id)userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8;
+ (void)_addContactWords:(id)a3 toSpeechProfile:(id)a4 forSpeechCategory:(id)a5;
+ (void)_addUserData:(id)a3 toSpeechProfile:(id)a4 addedCategoriesOut:(id)a5;
- (ESSpeechProfileBuilderConnection)initWithXPCConnection:(id)a3;
- (id)_speechProfileWithError:(id *)a3;
- (void)addCodepathId:(id)a3 completion:(id)a4;
- (void)addVocabularyItems:(id)a3 isBoosted:(id)a4 completion:(id)a5;
- (void)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)cancelWithCompletion:(id)a3;
- (void)dealloc;
- (void)finishAndSaveProfile:(BOOL)a3 completion:(id)a4;
- (void)getCodepathIdsWithCompletion:(id)a3;
- (void)getVersionForCategory:(id)a3 completion:(id)a4;
- (void)removeCodepathId:(id)a3 completion:(id)a4;
- (void)setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6 completion:(id)a7;
@end

@implementation ESSpeechProfileBuilderConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_assetConfig, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_codepathIds, 0);
  objc_storeStrong((id *)&self->_seenCategories, 0);
  objc_storeStrong((id *)&self->_committedCategoryToVersion, 0);
  objc_storeStrong((id *)&self->_stagedCategoryToVersion, 0);
  objc_storeStrong((id *)&self->_committedItems, 0);

  objc_storeStrong((id *)&self->_stagedItems, 0);
}

- (id)_speechProfileWithError:(id *)a3
{
  p_profile = (id *)&self->_profile;
  profile = self->_profile;
  if (profile)
  {
    v5 = profile;
    goto LABEL_30;
  }
  assetConfig = self->_assetConfig;
  id v32 = 0;
  v9 = +[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:assetConfig modelOverridePath:0 overrides:0 isJit:0 returningFoundPath:0 error:&v32];
  id v10 = v32;
  v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    id v13 = *p_profile;
    id *p_profile = 0;

    if (a3)
    {
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      [v14 setObject:@"Failed to load speech assets" forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
      if (v11) {
        [v14 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      id v15 = +[NSError errorWithDomain:@"CESRProfileErrorDomain" code:9 userInfo:v14];
      *a3 = v15;
    }
    v16 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ESSpeechProfileBuilderConnection _speechProfileWithError:]";
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Could not create EAR profile builder: %@", buf, 0x16u);
    }
    v5 = 0;
    goto LABEL_29;
  }
  v17 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ESSpeechProfileBuilderConnection _speechProfileWithError:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Created _EARProfileBuilder from asset config.", buf, 0xCu);
  }
  v18 = +[CESRSpeechProfileBuilder profileFilePathFromBasePath:self->_baseDirectory language:self->_language userId:self->_userId];
  v19 = +[NSFileManager defaultManager];
  unsigned int v20 = [v19 fileExistsAtPath:v18];

  if (v20)
  {
    [v9 readUserProfileWithPath:v18 reuseProfile:1];
    v21 = [v9 templateToVersion];
    id v22 = [v21 mutableCopy];

    if (!+[ESSpeechProfileBuilderConnection _isProfileValidFromVersionsMap:v22])
    {
      if (a3)
      {
        NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v34 = @"Failed to read the existing speech profile";
        v28 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v29 = +[NSError errorWithDomain:@"CESRProfileErrorDomain" code:6 userInfo:v28];
        *a3 = v29;
      }
      v5 = 0;
      goto LABEL_28;
    }
    v23 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ESSpeechProfileBuilderConnection _speechProfileWithError:]";
      __int16 v37 = 2112;
      v38 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s Existing profile found at %@", buf, 0x16u);
    }
    [v22 addEntriesFromDictionary:self->_committedCategoryToVersion];
    objc_storeStrong((id *)&self->_committedCategoryToVersion, v22);
    v24 = [v9 experimentIds];
    if (v24)
    {
      v25 = [v9 experimentIds];
      v26 = (NSMutableSet *)[v25 mutableCopy];
      codepathIds = self->_codepathIds;
      self->_codepathIds = v26;
    }
    else
    {
      v30 = self->_codepathIds;
      v25 = self->_codepathIds;
      self->_codepathIds = v30;
    }
  }
  objc_storeStrong(p_profile, v9);
  v5 = (_EARUserProfile *)*p_profile;
LABEL_28:

LABEL_29:
LABEL_30:

  return v5;
}

- (void)finishAndSaveProfile:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void, id))a4;
  seenCategories = self->_seenCategories;
  v8 = [(NSMutableDictionary *)self->_stagedCategoryToVersion allKeys];
  [(NSMutableSet *)seenCategories addObjectsFromArray:v8];

  stagedItems = self->_stagedItems;
  committedItems = self->_committedItems;
  v11 = [(NSMutableDictionary *)self->_stagedCategoryToVersion allKeys];
  BOOL v12 = +[NSSet setWithArray:v11];
  [(NSMutableDictionary *)committedItems setObject:stagedItems forKey:v12];

  [(NSMutableDictionary *)self->_committedCategoryToVersion addEntriesFromDictionary:self->_stagedCategoryToVersion];
  id v13 = self->_stagedItems;
  self->_stagedItems = 0;

  stagedCategoryToVersion = self->_stagedCategoryToVersion;
  self->_stagedCategoryToVersion = 0;

  if (!v4) {
    goto LABEL_38;
  }
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10000C188;
  v57 = sub_10000C198;
  id v58 = +[NSMutableArray array];
  id v15 = self->_committedItems;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10000C1A0;
  v52[3] = &unk_100050BA8;
  v52[4] = &v53;
  [(NSMutableDictionary *)v15 enumerateKeysAndObjectsUsingBlock:v52];
  [(NSMutableDictionary *)self->_committedItems removeAllObjects];
  id v51 = 0;
  v16 = [(ESSpeechProfileBuilderConnection *)self _speechProfileWithError:&v51];
  id v17 = v51;
  v18 = v17;
  if (!v16 || v17)
  {
    v6[2](v6, 0, v17);
    int v19 = 1;
  }
  else
  {
    [v16 setTemplateToVersion:self->_committedCategoryToVersion];
    [v16 setExperimentIds:self->_codepathIds];
    if (self->_dataProtectionClass == 6) {
      [v16 setUserId:self->_userId];
    }
    else {
      [v16 setUserId:&stru_1000519F0];
    }
    [v16 removeAllWords];
    unsigned int v20 = +[NSMutableSet set];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v21 = (id)v54[5];
    id v22 = [v21 countByEnumeratingWithState:&v47 objects:v66 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v48;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v21);
          }
          +[ESSpeechProfileBuilderConnection _addUserData:*(void *)(*((void *)&v47 + 1) + 8 * i) toSpeechProfile:v16 addedCategoriesOut:v20];
        }
        id v22 = [v21 countByEnumeratingWithState:&v47 objects:v66 count:16];
      }
      while (v22);
    }

    [v16 signalEndOfUserData];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v25 = self->_seenCategories;
    id v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v43 objects:v65 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v44;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * (void)j);
          if (([v20 containsObject:v29] & 1) == 0) {
            [v16 removeLmeDataForTemplateName:v29];
          }
        }
        id v26 = [(NSMutableSet *)v25 countByEnumeratingWithState:&v43 objects:v65 count:16];
      }
      while (v26);
    }

    CFStringRef v42 = 0;
    v30 = +[CESRSpeechProfileBuilder profileFilePathFromBasePath:self->_baseDirectory language:self->_language userId:self->_userId];
    v31 = [v30 stringByDeletingLastPathComponent];
    id v32 = +[NSFileManager defaultManager];
    [v32 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:0];

    int64_t dataProtectionClass = self->_dataProtectionClass;
    id v41 = 0;
    unsigned __int8 v34 = [v16 writeProfileToFile:v30 protectionClass:dataProtectionClass length:&v42 error:&v41];
    id v35 = v41;
    unsigned __int8 v36 = v35 ? 0 : v34;
    __int16 v37 = AFSiriLogContextSpeech;
    if (v36)
    {
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v60 = "-[ESSpeechProfileBuilderConnection finishAndSaveProfile:completion:]";
        __int16 v61 = 2048;
        CFStringRef v62 = v42;
        __int16 v63 = 2112;
        id v64 = v30;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Speech profile updated successfully. Wrote %lu bytes to %@", buf, 0x20u);
      }
      [(NSMutableSet *)self->_seenCategories removeAllObjects];
      int v19 = 0;
      transaction = self->_transaction;
      self->_transaction = 0;
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v60 = "-[ESSpeechProfileBuilderConnection finishAndSaveProfile:completion:]";
        __int16 v61 = 2112;
        CFStringRef v62 = @"Failed to write profile";
        __int16 v63 = 2112;
        id v64 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s %@: %@", buf, 0x20u);
      }
      v39 = (OS_os_transaction *)objc_alloc_init((Class)NSMutableDictionary);
      transaction = v39;
      if (v35) {
        [(OS_os_transaction *)v39 setObject:v35 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      [(OS_os_transaction *)transaction setObject:@"Failed to write profile" forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
      v40 = +[NSError errorWithDomain:@"CESRProfileErrorDomain" code:7 userInfo:transaction];
      v6[2](v6, 0, v40);

      int v19 = 1;
    }
  }
  _Block_object_dispose(&v53, 8);

  if (!v19) {
LABEL_38:
  }
    v6[2](v6, 1, 0);
}

- (void)cancelWithCompletion:(id)a3
{
  stagedItems = self->_stagedItems;
  self->_stagedItems = 0;
  v6 = (void (**)(id, uint64_t, void))a3;

  stagedCategoryToVersion = self->_stagedCategoryToVersion;
  self->_stagedCategoryToVersion = 0;

  v6[2](v6, 1, 0);
}

- (void)addVocabularyItems:(id)a3 isBoosted:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if (self->_stagedItems && self->_stagedCategoryToVersion)
  {
    id v11 = [v8 count];
    if (v11 == [v9 count])
    {
      BOOL v12 = (char *)[v8 count];
      if (v12)
      {
        id v13 = v12;
        for (i = 0; i != v13; ++i)
        {
          id v15 = [v8 objectAtIndex:i];
          v16 = [v9 objectAtIndexedSubscript:i];
          objc_msgSend(v15, "setIsBoosted:", objc_msgSend(v16, "BOOLValue"));
        }
      }
    }
    else
    {
      unsigned int v20 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ESSpeechProfileBuilderConnection addVocabularyItems:isBoosted:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Internal inconsistency error: CCSharedItems list and corresponding isBoosted BOOLeans list are out of sync. This batch of items will not be boosted.", buf, 0xCu);
      }

      id v9 = 0;
    }
    [(NSMutableArray *)self->_stagedItems addObjectsFromArray:v8];
    v10[2](v10, 1, 0);
  }
  else
  {
    id v17 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[ESSpeechProfileBuilderConnection addVocabularyItems:isBoosted:completion:]";
      __int16 v25 = 2112;
      CFStringRef v26 = @"Add called before categories have been set with Begin";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s %@.", buf, 0x16u);
    }
    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v22 = @"Add called before categories have been set with Begin";
    v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    int v19 = +[NSError errorWithDomain:@"CESRProfileErrorDomain" code:3 userInfo:v18];
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v19);
  }
}

- (void)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a5;
  id v35 = 0;
  id v9 = [(ESSpeechProfileBuilderConnection *)self _speechProfileWithError:&v35];
  id v10 = v35;
  id v11 = v10;
  if (!v9 || v10)
  {
    v8[2](v8, 0, v10);
    goto LABEL_10;
  }
  if (self->_stagedItems || self->_stagedCategoryToVersion)
  {
    BOOL v12 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v44 = "-[ESSpeechProfileBuilderConnection beginWithCategoriesAndVersions:bundleId:completion:]";
      __int16 v45 = 2112;
      CFStringRef v46 = @"Begin called while there are already active categories.";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v42 = @"Begin called while there are already active categories.";
    id v13 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v14 = +[NSError errorWithDomain:@"CESRProfileErrorDomain" code:3 userInfo:v13];
    v8[2](v8, 0, v14);

    goto LABEL_8;
  }
  id v13 = +[CESRSpeechProfileBuilder supportedCategories];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v7 allKeys];
  id v15 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (!v15) {
    goto LABEL_20;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v32;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v32 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
      if ([(NSMutableSet *)self->_seenCategories containsObject:v19])
      {
        v24 = +[NSString stringWithFormat:@"Speech category %@ has already been committed with a call to Begin followed by Finish", v19];
        __int16 v25 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v44 = "-[ESSpeechProfileBuilderConnection beginWithCategoriesAndVersions:bundleId:completion:]";
          __int16 v45 = 2112;
          CFStringRef v46 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s %@.", buf, 0x16u);
        }
        NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
        v39 = v24;
        CFStringRef v26 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        uint64_t v27 = 3;
        goto LABEL_27;
      }
      if (([v13 containsObject:v19] & 1) == 0)
      {
        v24 = +[NSString stringWithFormat:@"Speech category %@ is unsupported", v19];
        v28 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v44 = "-[ESSpeechProfileBuilderConnection beginWithCategoriesAndVersions:bundleId:completion:]";
          __int16 v45 = 2112;
          CFStringRef v46 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s %@.", buf, 0x16u);
        }
        NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
        __int16 v37 = v24;
        CFStringRef v26 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        uint64_t v27 = 5;
LABEL_27:
        uint64_t v29 = +[NSError errorWithDomain:@"CESRProfileErrorDomain" code:v27 userInfo:v26];
        v8[2](v8, 0, v29);

        goto LABEL_8;
      }
    }
    id v16 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_20:

  unsigned int v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  stagedItems = self->_stagedItems;
  self->_stagedItems = v20;

  CFStringRef v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  stagedCategoryToVersion = self->_stagedCategoryToVersion;
  self->_stagedCategoryToVersion = v22;

  [(NSMutableDictionary *)self->_stagedCategoryToVersion addEntriesFromDictionary:v7];
  v8[2](v8, 1, 0);
LABEL_8:

LABEL_10:
}

- (void)getVersionForCategory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v13 = 0;
  id v8 = [(ESSpeechProfileBuilderConnection *)self _speechProfileWithError:&v13];
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, -1, v9);
  }
  else
  {
    id v11 = [(NSMutableDictionary *)self->_committedCategoryToVersion objectForKey:v6];

    if (v11)
    {
      BOOL v12 = [(NSMutableDictionary *)self->_committedCategoryToVersion objectForKey:v6];
      v7[2](v7, (uint64_t)[v12 longLongValue], 0);
    }
    else
    {
      v7[2](v7, -1, 0);
    }
  }
}

- (void)getCodepathIdsWithCompletion:(id)a3
{
  id v8 = 0;
  BOOL v4 = (void (**)(id, void, id))a3;
  v5 = [(ESSpeechProfileBuilderConnection *)self _speechProfileWithError:&v8];
  id v6 = v8;
  id v7 = v6;
  if (!v5 || v6) {
    v4[2](v4, 0, v6);
  }
  else {
    ((void (**)(id, NSMutableSet *, id))v4)[2](v4, self->_codepathIds, 0);
  }
}

- (void)addCodepathId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v11 = 0;
  id v8 = [(ESSpeechProfileBuilderConnection *)self _speechProfileWithError:&v11];
  id v9 = v11;
  id v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    [(NSMutableSet *)self->_codepathIds addObject:v6];
    v7[2](v7, 1, 0);
  }
}

- (void)removeCodepathId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v11 = 0;
  id v8 = [(ESSpeechProfileBuilderConnection *)self _speechProfileWithError:&v11];
  id v9 = v11;
  id v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    [(NSMutableSet *)self->_codepathIds removeObject:v6];
    v7[2](v7, 1, 0);
  }
}

- (void)setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6 completion:(id)a7
{
  BOOL v12 = (NSString *)a3;
  id v13 = (NSString *)a4;
  id v14 = (NSString *)a5;
  language = self->_language;
  self->_language = v12;
  id v16 = v12;
  uint64_t v23 = (void (**)(id, uint64_t, void))a7;

  baseDirectory = self->_baseDirectory;
  self->_baseDirectory = v13;
  v18 = v13;

  userId = self->_userId;
  self->_userId = v14;
  unsigned int v20 = v14;

  self->_int64_t dataProtectionClass = a6;
  NSErrorUserInfoKey v21 = (SFEntitledAssetConfig *)[objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:self->_language assetType:3];
  assetConfig = self->_assetConfig;
  self->_assetConfig = v21;

  v23[2](v23, 1, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ESSpeechProfileBuilderConnection;
  [(ESSpeechProfileBuilderConnection *)&v3 dealloc];
}

- (ESSpeechProfileBuilderConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ESSpeechProfileBuilderConnection;
  id v6 = [(ESSpeechProfileBuilderConnection *)&v28 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = os_transaction_create();
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

    stagedItems = v7->_stagedItems;
    v7->_stagedItems = 0;

    id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    committedItems = v7->_committedItems;
    v7->_committedItems = v11;

    stagedCategoryToVersion = v7->_stagedCategoryToVersion;
    v7->_stagedCategoryToVersion = 0;

    id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    committedCategoryToVersion = v7->_committedCategoryToVersion;
    v7->_committedCategoryToVersion = v14;

    id v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    seenCategories = v7->_seenCategories;
    v7->_seenCategories = v16;

    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    codepathIds = v7->_codepathIds;
    v7->_codepathIds = v18;

    objc_initWeak(&location, v7);
    CFStringRef v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10000D0F0;
    __int16 v25 = &unk_100050E60;
    objc_copyWeak(&v26, &location);
    unsigned int v20 = objc_retainBlock(&v22);
    objc_msgSend(v5, "setInterruptionHandler:", v20, v22, v23, v24, v25);
    [v5 setInvalidationHandler:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (void)_addContactWords:(id)a3 toSpeechProfile:(id)a4 forSpeechCategory:(id)a5
{
  id v7 = a3;
  id v25 = a4;
  id v24 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v23 = *(void *)v33;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v10);
        BOOL v12 = +[NSMutableArray array];
        id v13 = [v11 components];
        id v14 = [v13 mutableCopy];

        id v15 = [v14 objectForKeyedSubscript:@"\\contact-first-phonetic"];
        id v16 = [v14 objectForKeyedSubscript:@"\\contact-last-phonetic"];
        uint64_t v17 = [v14 objectForKeyedSubscript:@"\\contact-middle-phonetic"];
        if (v15) {
          [v14 removeObjectForKey:@"\\contact-first-phonetic"];
        }
        if (v16) {
          [v14 removeObjectForKey:@"\\contact-last-phonetic"];
        }
        if (v17) {
          [v14 removeObjectForKey:@"\\contact-middle-phonetic"];
        }
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10000D4B4;
        v26[3] = &unk_100050BF8;
        id v27 = v15;
        id v28 = v16;
        id v29 = v17;
        v30 = v11;
        id v31 = v12;
        id v18 = v15;
        id v19 = v16;
        id v20 = v17;
        id v21 = v12;
        [v14 enumerateKeysAndObjectsUsingBlock:v26];
        [v25 addWordWithParts:v21 templateName:v24];

        id v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }
}

+ (void)_addUserData:(id)a3 toSpeechProfile:(id)a4 addedCategoriesOut:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 groupNameWords];
  id v11 = [v10 count];

  if (v11)
  {
    BOOL v12 = [v7 groupNameWords];
    +[ESSpeechProfileBuilderConnection _addContactWords:v12 toSpeechProfile:v8 forSpeechCategory:@"\\NT-appcontact"];

    [v9 addObject:@"\\NT-appcontact"];
  }
  id v13 = [v7 firstPartyContactWords];
  id v14 = [v13 count];

  if (v14)
  {
    id v15 = [v7 firstPartyContactWords];
    +[ESSpeechProfileBuilderConnection _addContactWords:v15 toSpeechProfile:v8 forSpeechCategory:@"\\NT-contact"];

    [v9 addObject:@"\\NT-contact"];
  }
  id v16 = [v7 thirdPartyContactWords];
  id v17 = [v16 count];

  if (v17)
  {
    id v18 = [v7 thirdPartyContactWords];
    +[ESSpeechProfileBuilderConnection _addContactWords:v18 toSpeechProfile:v8 forSpeechCategory:@"\\NT-appcontact"];

    [v9 addObject:@"\\NT-appcontact"];
  }
  NSErrorUserInfoKey v36 = v7;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  objc_msgSend(v7, "radioWords", v9);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v19 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        uint64_t v23 = v8;
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v25 = objc_alloc((Class)_EARWordPart);
        id v26 = +[NSSet set];
        id v27 = [v25 initWithOrthography:v24 pronunciations:v26 tagName:@"\\playlist-first" frequency:1];

        id v49 = v27;
        id v28 = +[NSArray arrayWithObjects:&v49 count:1];
        id v8 = v23;
        [v23 addWordWithParts:v28 templateName:@"\\NT-playlist"];

        id v29 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          CFStringRef v46 = "+[ESSpeechProfileBuilderConnection _addUserData:toSpeechProfile:addedCategoriesOut:]";
          __int16 v47 = 2112;
          uint64_t v48 = v24;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Adding #radio vocab %@ to speech profile", buf, 0x16u);
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v20);
  }

  v30 = [v36 radioWords];
  id v31 = [v30 count];

  if (v31) {
    [v35 addObject:@"\\NT-playlist"];
  }
  long long v32 = [v36 vocabularyWords];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000D9EC;
  v38[3] = &unk_100050BD0;
  id v39 = v35;
  id v40 = v8;
  id v33 = v8;
  id v34 = v35;
  [v32 enumerateKeysAndObjectsUsingBlock:v38];
}

+ (id)userProfileWithAssetConfig:(id)a3 modelOverridePath:(id)a4 overrides:(id)a5 isJit:(BOOL)a6 returningFoundPath:(id *)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v43 = a5;
  long long v44 = [v12 language];
  if (v13 && AFIsInternalInstall())
  {
    id v14 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "+[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]";
      __int16 v53 = 2112;
      id v54 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Set model root to %@", buf, 0x16u);
    }
    id v15 = v13;
    id v16 = 0;
    id v17 = v12;
    goto LABEL_11;
  }
  id v18 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[ESSpeechProfileBuilderConnection userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Use currently installed asset.", buf, 0xCu);
  }
  id v19 = +[SFEntitledAssetManager sharedInstance];
  objc_msgSend(v19, "switchToNewAssetsForAssetType:", objc_msgSend(v12, "assetType"));

  id v20 = +[ESAssetManager sharedInstance];
  id v46 = 0;
  id v15 = [v20 installedQuasarModelPathForAssetConfig:v12 error:&v46 triggerDownload:0 ignoreSpellingModel:1];
  id v21 = v46;

  if (v15)
  {
    id v17 = v12;
    id v16 = v21;
LABEL_11:
    id v42 = v16;
    if (a7) {
      *a7 = v15;
    }
    uint64_t v24 = [v15 stringByAppendingPathComponent:@"mini.json"];
    id v25 = [v15 stringByAppendingPathComponent:@"ncs"];
    id v26 = [v25 stringByAppendingPathComponent:@"en_US_napg.json"];
    id v27 = [v25 stringByAppendingPathComponent:@"vocdelta.voc"];
    id v28 = [v25 stringByAppendingPathComponent:@"pg.voc"];
    id v29 = [v25 stringByAppendingPathComponent:@"mrec.psh"];
    LOBYTE(v38) = a6;
    id v30 = [objc_alloc((Class)_EARUserProfile) initWithConfiguration:v24 language:v44 overrides:v43 sdapiOverrides:v26 emptyVoc:v27 pgVoc:v28 paramsetHolder:v29 isJit:v38];
    id v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else if (a8)
    {
      uint64_t v39 = kAFAssistantErrorDomain;
      NSErrorUserInfoKey v47 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v48 = @"Error during _EARUserProfile initialization";
      +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      id v33 = v40 = v13;
      *a8 = +[NSError errorWithDomain:v39 code:600 userInfo:v33];

      id v13 = v40;
    }

    id v16 = v42;
LABEL_18:

    id v34 = v16;
    long long v35 = v31;
    goto LABEL_19;
  }
  id v17 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v44 assetType:3];

  CFStringRef v22 = +[SFEntitledAssetManager sharedInstance];
  objc_msgSend(v22, "switchToNewAssetsForAssetType:", objc_msgSend(v17, "assetType"));

  uint64_t v23 = +[ESAssetManager sharedInstance];
  id v45 = v21;
  id v15 = [v23 installedQuasarModelPathForAssetConfig:v17 error:&v45 triggerDownload:0 ignoreSpellingModel:1];
  id v16 = v45;

  if (v15) {
    goto LABEL_11;
  }
  if (a8)
  {
    uint64_t v37 = kAFAssistantErrorDomain;
    if (v16)
    {
      NSErrorUserInfoKey v49 = NSUnderlyingErrorKey;
      id v50 = v16;
      id v15 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    }
    else
    {
      id v15 = 0;
    }
    +[NSError errorWithDomain:v37 code:600 userInfo:v15];
    id v31 = 0;
    id v34 = 0;
    long long v35 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  long long v35 = 0;
  id v34 = v16;
LABEL_19:

  return v35;
}

+ (BOOL)_isProfileValidFromVersionsMap:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = objc_msgSend(a3, "allValues", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (((unint64_t)[*(id *)(*((void *)&v8 + 1) + 8 * i) longLongValue] & 0x8000000000000000) == 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

@end