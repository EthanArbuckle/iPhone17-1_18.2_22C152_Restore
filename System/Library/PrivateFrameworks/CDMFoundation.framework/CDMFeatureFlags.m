@interface CDMFeatureFlags
+ (BOOL)globalOverridesAreEnabled;
+ (BOOL)isAmbiguityRefactorEnabled;
+ (BOOL)isCATIEnabled;
+ (BOOL)isCATIMultiTurnEnabled;
+ (BOOL)isCDMClientXPCEnabled;
+ (BOOL)isCbrUnrestrictedByRDEnabled;
+ (BOOL)isCcqrAerCbrEnabled;
+ (BOOL)isContextUpdateEnabled;
+ (BOOL)isContextualSpanMatcherEnabled;
+ (BOOL)isFeatureStoreEnabled;
+ (BOOL)isFeatureStoreEnabledForExternalBuilds;
+ (BOOL)isInterpretationGroupFilteringEnabled;
+ (BOOL)isLVCEnabled;
+ (BOOL)isLighthouseAPIEnabled;
+ (BOOL)isLogNluEnabled;
+ (BOOL)isMarrsMentionDetectorEnabled;
+ (BOOL)isMarrsMentionResolverEnabled;
+ (BOOL)isMentionResolverRewriterEnabled;
+ (BOOL)isNLv4ServiceOverridesEnabled;
+ (BOOL)isPSCEnabled;
+ (BOOL)isPhoneticSpanMatchingEnabled;
+ (BOOL)isRepetitionDetectionEnabled;
+ (BOOL)isSSUCacheUpdateOnEveryRequestEnabled;
+ (BOOL)isSSUEnableIndexingEnabled;
+ (BOOL)isSSUEnabled;
+ (BOOL)isShortcutsNLv4FollowupEnabled;
+ (BOOL)isSiriMiniEnabled;
+ (BOOL)isTrieOverridesEnabled;
+ (BOOL)isUaaPEnabled;
+ (BOOL)isUaaPPreferred;
+ (BOOL)isUsoEntitySpanEnabled;
@end

@implementation CDMFeatureFlags

+ (BOOL)isSiriMiniEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUaaPEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRepetitionDetectionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPSCEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMarrsMentionResolverEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMarrsMentionDetectorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLVCEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isContextualSpanMatcherEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isContextUpdateEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCcqrAerCbrEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCATIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)globalOverridesAreEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLighthouseAPIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSSUEnabled
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if ([a1 isCDMClientXPCEnabled])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v4 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315138;
        v7 = "+[CDMFeatureFlags isSSUEnabled]";
        _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Mismatched feature flags: SiriNL/SiriMiniSSU cannot be enabled while SiriNL/isCDMClientXPCEnabled is disabled. Forcing SiriNL/SiriMiniSSU=off.", (uint8_t *)&v6, 0xCu);
      }

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (BOOL)isCDMClientXPCEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPhoneticSpanMatchingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNLv4ServiceOverridesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isInterpretationGroupFilteringEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAmbiguityRefactorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUsoEntitySpanEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTrieOverridesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isShortcutsNLv4FollowupEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMentionResolverRewriterEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFeatureStoreEnabledForExternalBuilds
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFeatureStoreEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSSUCacheUpdateOnEveryRequestEnabled
{
  int v2 = [a1 isSSUEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

+ (BOOL)isSSUEnableIndexingEnabled
{
  int v2 = [a1 isSSUEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

+ (BOOL)isLogNluEnabled
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return +[CDMUserDefaultsUtils isWriteDebugToDiskEnabled];
}

+ (BOOL)isUaaPPreferred
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCATIMultiTurnEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCbrUnrestrictedByRDEnabled
{
  return _os_feature_enabled_impl();
}

@end