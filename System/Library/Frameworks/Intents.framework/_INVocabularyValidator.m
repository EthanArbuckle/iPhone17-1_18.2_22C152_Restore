@interface _INVocabularyValidator
+ (void)initialize;
- (BOOL)_bundleID:(id)a3 isWhitelistedForVocabularyType:(int64_t)a4;
- (id)_intentsUsingVocabularyType:(int64_t)a3;
- (id)_pathToAppWithBundleID:(id)a3;
- (id)_validatedItemsFromVocabularyObject:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5 withItemFactory:(id)a6;
- (id)validatedItemsFromVocabularySpeakables:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5;
- (id)validatedItemsFromVocabularyStrings:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5;
- (unint64_t)maximumNumberOfVocabularyStringsForType:(int64_t)a3;
- (void)_confirmExistenceOfWatchAppForCompanionBundleID:(id)a3 handlingIntents:(id)a4 completion:(id)a5;
- (void)_determineIfBundleID:(id)a3 appPath:(id)a4 canProvideVocabularyOfType:(int64_t)a5 completion:(id)a6;
- (void)determineIfBundleID:(id)a3 canProvideVocabularyOfType:(int64_t)a4 completion:(id)a5;
@end

@implementation _INVocabularyValidator

- (id)_validatedItemsFromVocabularyObject:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5 withItemFactory:(id)a6
{
  BOOL v7 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(id, void))a6;
  unint64_t v12 = [(_INVocabularyValidator *)self maximumNumberOfVocabularyStringsForType:a4];
  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v14 = [v10 count];
  if (v14 >= v12) {
    unint64_t v15 = v12;
  }
  else {
    unint64_t v15 = v14;
  }
  v16 = (void *)[v13 initWithCapacity:v15];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = v10;
  uint64_t v33 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v33)
  {
    uint64_t v18 = *(void *)v39;
    id v31 = v17;
    v32 = v11;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v17);
        }
        v20 = v11[2](v11, *(void *)(*((void *)&v38 + 1) + 8 * i));
        id v21 = v20;
        if (!v20 || ![v20 count]) {
          goto LABEL_28;
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v21 = v21;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (!v22) {
          goto LABEL_27;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            uint64_t v27 = [v26 validate];
            if (v27 == 1)
            {
              if ([v16 count] >= v12)
              {

                id v17 = v31;
                v11 = v32;
                goto LABEL_32;
              }
              [v16 addObject:v26];
            }
            else
            {
              if (!v7) {
                continue;
              }
              if (v27 == 4)
              {
                v28 = _INStringFromVocabularyStringType(a4);
                NSLog((NSString *)@"WARNING: ignoring a vocabulary item of type %@ because the vocabulary identifier is too long", v28);
              }
              else
              {
                if (v27 != 3) {
                  continue;
                }
                v28 = _INStringFromVocabularyStringType(a4);
                NSLog((NSString *)@"WARNING: ignoring a vocabulary item of type %@ because the string is too long", v28);
              }
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v23) {
            continue;
          }
          break;
        }
LABEL_27:

        id v17 = v31;
        v11 = v32;
        uint64_t v18 = v30;
LABEL_28:
      }
      uint64_t v33 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v33);
  }
LABEL_32:

  return v16;
}

- (unint64_t)maximumNumberOfVocabularyStringsForType:(int64_t)a3
{
  if (a3 <= 499)
  {
    if (a3 > 199)
    {
      if ((unint64_t)(a3 - 300) >= 2)
      {
        if ((unint64_t)(a3 - 400) < 2 || a3 == 200) {
          return 500;
        }
        return 0;
      }
    }
    else
    {
      if ((unint64_t)(a3 - 100) < 2) {
        return 500;
      }
      if (a3 == 1) {
        return 1500;
      }
      if (a3 != 2) {
        return 0;
      }
    }
    return 1000;
  }
  if ((unint64_t)(a3 - 700) < 5) {
    return 500;
  }
  switch(a3)
  {
    case 50000:
      return 1000;
    case 50001:
      return 500;
    case 50002:
      unint64_t result = 10;
      break;
    case 50003:
      unint64_t result = 2000;
      break;
    default:
      if ((unint64_t)(a3 - 500) >= 2) {
        return 0;
      }
      unint64_t result = 200;
      break;
  }
  return result;
}

- (id)_pathToAppWithBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v11 = 0;
  v4 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v11];
  id v5 = v11;
  if (!v4)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v13 = "-[_INVocabularyValidator _pathToAppWithBundleID:]";
      __int16 v14 = 2114;
      id v15 = v3;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s Could not get a bundle record for %{public}@ %{public}@", buf, 0x20u);
    }
  }
  BOOL v7 = objc_msgSend(v4, "if_containingAppRecord");
  v8 = [v7 URL];
  v9 = [v8 path];

  return v9;
}

- (id)validatedItemsFromVocabularyStrings:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5
{
  return [(_INVocabularyValidator *)self _validatedItemsFromVocabularyObject:a3 ofType:a4 loggingWarnings:a5 withItemFactory:&__block_literal_global_79];
}

- (void)determineIfBundleID:(id)a3 canProvideVocabularyOfType:(int64_t)a4 completion:(id)a5
{
  id v10 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    if ([(_INVocabularyValidator *)self _bundleID:v10 isWhitelistedForVocabularyType:a4])
    {
      v8[2](v8, 1);
    }
    else
    {
      v9 = [(_INVocabularyValidator *)self _pathToAppWithBundleID:v10];
      [(_INVocabularyValidator *)self _determineIfBundleID:v10 appPath:v9 canProvideVocabularyOfType:a4 completion:v8];
    }
  }
}

- (void)_determineIfBundleID:(id)a3 appPath:(id)a4 canProvideVocabularyOfType:(int64_t)a5 completion:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (void (**)(id, uint64_t))a6;
  if (v12)
  {
    id v13 = INPluginKitCompatiblePathFromPath(v11);
    if (v13)
    {
      __int16 v14 = [(_INVocabularyValidator *)self _intentsUsingVocabularyType:a5];
      if ([v14 count])
      {
        uint64_t v30 = v13;
        id v31 = v10;
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
        id v15 = +[INAppInfo appInfoWithApplicationRecord:](INAppInfo, "appInfoWithApplicationRecord:");
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v32 = v14;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v22 = [v15 supportedIntents];
              LODWORD(v21) = [v22 containsObject:v21];

              if (v21)
              {
                v12[2](v12, 1);
                id v13 = v30;
                id v10 = v31;
                goto LABEL_17;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        v42[0] = *MEMORY[0x1E4F282B0];
        v42[1] = @"IntentsSupported";
        v43[0] = @"com.apple.intents-service";
        v43[1] = v16;
        v42[2] = *MEMORY[0x1E4F914B0];
        id v13 = v30;
        v43[2] = v30;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
        uint64_t v24 = (void *)MEMORY[0x1E4F28C70];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke;
        v33[3] = &unk_1E551A990;
        long long v37 = v12;
        id v10 = v31;
        id v34 = v31;
        long long v35 = self;
        id v36 = v16;
        [v24 extensionsWithMatchingAttributes:v23 completion:v33];

        id v16 = (id)v23;
LABEL_17:

        __int16 v14 = v32;
      }
      else
      {
        v26 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = v26;
          v28 = _INStringFromVocabularyStringType(a5);
          *(_DWORD *)buf = 136315394;
          v46 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]";
          __int16 v47 = 2114;
          id v48 = v28;
          _os_log_error_impl(&dword_18CB2F000, v27, OS_LOG_TYPE_ERROR, "%s No intents use user-vocabulary of type %{public}@", buf, 0x16u);
        }
        v12[2](v12, 0);
      }
    }
    else
    {
      v25 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]";
        __int16 v47 = 2114;
        id v48 = v10;
        __int16 v49 = 2114;
        id v50 = v11;
        _os_log_error_impl(&dword_18CB2F000, v25, OS_LOG_TYPE_ERROR, "%s Couldn't get realpath() to %{public}@ %{public}@", buf, 0x20u);
      }
      v12[2](v12, 0);
    }
  }
}

- (id)_intentsUsingVocabularyType:(int64_t)a3
{
  if (_intentsUsingVocabularyType__onceToken != -1) {
    dispatch_once(&_intentsUsingVocabularyType__onceToken, &__block_literal_global_66666);
  }
  v4 = (void *)_intentsUsingVocabularyType__sIntentsUsingSyncSlot;
  id v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (BOOL)_bundleID:(id)a3 isWhitelistedForVocabularyType:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"com.apple.mobileslideshow"])
  {
    BOOL v6 = (unint64_t)(a4 - 100) < 2 || a4 == 50003;
    char v7 = (unint64_t)(a4 - 1) < 2 || v6;
    goto LABEL_29;
  }
  char v7 = 0;
  if (a4 > 49999)
  {
    if (a4 == 50003) {
      goto LABEL_20;
    }
    if (a4 == 50000)
    {
      v8 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:v5];
      v9 = v8;
      if (v8)
      {
        id v10 = [v8 bundleType];
        if ([v10 isEqualToString:*MEMORY[0x1E4F22348]]
          && ([v9 bundleURL],
              id v11 = objc_claimAutoreleasedReturnValue(),
              [v11 path],
              unint64_t v12 = objc_claimAutoreleasedReturnValue(),
              char v13 = [v12 hasPrefix:@"/System/Library/"],
              v12,
              v11,
              (v13 & 1) != 0)
          || ([v10 isEqualToString:*MEMORY[0x1E4F22350]] & 1) != 0)
        {
          char v7 = 1;
        }
        else
        {
          char v7 = [v10 isEqualToString:*MEMORY[0x1E4F22380]];
        }
      }
      else
      {
        char v7 = 1;
      }
    }
  }
  else
  {
    if (a4 != 2)
    {
      if (a4 != 301) {
        goto LABEL_29;
      }
      if (([v5 isEqualToString:@"com.apple.passd"] & 1) == 0)
      {
LABEL_24:
        char v7 = 0;
        goto LABEL_29;
      }
LABEL_20:
      char v7 = 1;
      goto LABEL_29;
    }
    if (![v5 isEqualToString:@"com.apple.MobileSMS"]) {
      goto LABEL_24;
    }
    __int16 v14 = INSiriLogContextIntents;
    char v7 = 1;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[_INVocabularyValidator _bundleID:isWhitelistedForVocabularyType:]";
      _os_log_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_INFO, "%s INVocabularyValidator returning true for whitelisted app com.apple.MobileSMS", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_29:

  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (void)_confirmExistenceOfWatchAppForCompanionBundleID:(id)a3 handlingIntents:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (INSupportsPairedDevice_onceToken != -1) {
      dispatch_once(&INSupportsPairedDevice_onceToken, &__block_literal_global_81);
    }
    if (INSupportsPairedDevice_supportsPairedDevice)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2050000000;
      id v10 = (void *)getACXDeviceConnectionClass_softClass;
      uint64_t v22 = getACXDeviceConnectionClass_softClass;
      if (!getACXDeviceConnectionClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v24 = __getACXDeviceConnectionClass_block_invoke;
        v25 = &unk_1E5520EB8;
        v26 = &v19;
        __getACXDeviceConnectionClass_block_invoke((uint64_t)&buf);
        id v10 = (void *)v20[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v19, 8);
      unint64_t v12 = [v11 sharedDeviceConnection];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke;
      v15[3] = &unk_1E551A968;
      id v18 = v9;
      id v16 = v12;
      id v17 = v8;
      id v13 = v12;
      [v13 fetchWatchAppBundleIDForCompanionAppBundleID:v7 completion:v15];
    }
    else
    {
      __int16 v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlin"
                                        "gIntents:completion:]";
        _os_log_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_INFO, "%s No watch pairing capability", (uint8_t *)&buf, 0xCu);
      }
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (id)validatedItemsFromVocabularySpeakables:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5
{
  return [(_INVocabularyValidator *)self _validatedItemsFromVocabularyObject:a3 ofType:a4 loggingWarnings:a5 withItemFactory:&__block_literal_global_82_66660];
}

@end