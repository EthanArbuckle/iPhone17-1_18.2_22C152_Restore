uint64_t HM_FEATURE_RVC_DEFAULTS_ENABLED()
{
  if (HM_FEATURE_RVC_DEFAULTS_ENABLED_onceToken != -1) {
    dispatch_once(&HM_FEATURE_RVC_DEFAULTS_ENABLED_onceToken, &__block_literal_global);
  }
  return HM_FEATURE_RVC_DEFAULTS_ENABLED_RVC_DefaultEnabled;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}