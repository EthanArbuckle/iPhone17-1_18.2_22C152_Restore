@interface SASyncAnchor(SyncPrivate)
+ (id)_af_normalizedKeyForKey:()SyncPrivate appBundleID:syncSlotName:;
- (id)_af_normalizedKey;
- (uint64_t)_af_isValid;
@end

@implementation SASyncAnchor(SyncPrivate)

+ (id)_af_normalizedKeyForKey:()SyncPrivate appBundleID:syncSlotName:
{
  if (a4) {
    v7 = a4;
  }
  else {
    v7 = &stru_1EEE35D28;
  }
  v8 = v7;
  v9 = a5;
  id v10 = a3;
  if (v9) {
    v11 = v9;
  }
  else {
    v11 = &stru_1EEE35D28;
  }
  v12 = v11;

  v13 = [NSString stringWithFormat:@"%@#%@#%@", v10, v8, v12];

  return v13;
}

- (uint64_t)_af_isValid
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [a1 key];
  if ([v2 length])
  {
    v3 = [a1 appMetaData];
    v4 = [v3 appIdentifyingInfo];
    v5 = [v4 bundleId];
    v6 = [v4 clientIdentifier];
    if ([v2 isEqualToString:@"com.apple.siri.appIntentSupportPolicyAndVocab"])
    {
      if ([v5 length])
      {
        v7 = v5;
        v8 = v7;
        if (v7 == @"com.apple.ShortcutsActions"
          || v7 && (int v9 = [@"com.apple.ShortcutsActions" isEqual:v7], v8, v9))
        {
          id v10 = AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 136315394;
            v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
            __int16 v20 = 2112;
            v21 = v8;
            _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s ShortcutsActions received in %@ anchor key, marking as invalid and skipping", (uint8_t *)&v18, 0x16u);
          }
          goto LABEL_23;
        }
LABEL_15:
        uint64_t v12 = 1;
LABEL_24:

        goto LABEL_25;
      }
      v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315138;
        v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
        v16 = "%s SASyncAppMetaData has no bundleID, but it is required for this key";
LABEL_22:
        _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (![v2 isEqualToString:@"com.apple.siri.vocabularyupdates"]) {
        goto LABEL_15;
      }
      v13 = [v3 syncSlots];
      uint64_t v14 = [v13 count];

      if (v14 == 1)
      {
        if ([v6 length]) {
          goto LABEL_15;
        }
        v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315138;
          v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
          v16 = "%s SASyncAppMetaData has no -applicationClientIdentifier, as required for this key";
          goto LABEL_22;
        }
      }
      else
      {
        v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315138;
          v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
          v16 = "%s SASyncAppMetaData does not have exactly one -syncSlots, as required for this key";
          goto LABEL_22;
        }
      }
    }
LABEL_23:
    uint64_t v12 = 0;
    goto LABEL_24;
  }
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
    _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Sync info is missing a key", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v12 = 0;
LABEL_25:

  return v12;
}

- (id)_af_normalizedKey
{
  v2 = [a1 appMetaData];
  v3 = objc_msgSend(v2, "_af_preferredBundleID");
  v4 = [v2 syncSlots];
  v5 = [v4 firstObject];

  v6 = objc_opt_class();
  v7 = [a1 key];
  v8 = objc_msgSend(v6, "_af_normalizedKeyForKey:appBundleID:syncSlotName:", v7, v3, v5);

  return v8;
}

@end