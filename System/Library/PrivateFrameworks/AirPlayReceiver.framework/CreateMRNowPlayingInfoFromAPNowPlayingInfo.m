@interface CreateMRNowPlayingInfoFromAPNowPlayingInfo
@end

@implementation CreateMRNowPlayingInfoFromAPNowPlayingInfo

void ___CreateMRNowPlayingInfoFromAPNowPlayingInfo_block_invoke(uint64_t a1, void *key, const void *a3)
{
  if (_getMetadataKeyMap_s_onceToken != -1) {
    dispatch_once(&_getMetadataKeyMap_s_onceToken, &__block_literal_global_154);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)_getMetadataKeyMap_s_metadataKeyMap, key);
  if (Value)
  {
    v7 = Value;
    if (!CFEqual((CFTypeRef)*MEMORY[0x263EFFD08], a3))
    {
      v8 = *(__CFDictionary **)(a1 + 32);
      CFDictionaryAddValue(v8, v7, a3);
    }
  }
}

@end