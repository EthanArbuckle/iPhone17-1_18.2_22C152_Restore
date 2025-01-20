@interface GEOConfigStorageRemote
@end

@implementation GEOConfigStorageRemote

void __75___GEOConfigStorageRemote_getConfigValueForKey_countryCode_options_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = GEOConfig_getCountryAwareValueForKeyFromDictionary(*(void **)(a1 + 32), *(void **)(a1 + 40), a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end