@interface HKPrivateMetadataKeyAudioExposureLimitSymbolLoc
@end

@implementation HKPrivateMetadataKeyAudioExposureLimitSymbolLoc

void *__get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HealthKitLibrary();
  result = dlsym(v2, "_HKPrivateMetadataKeyAudioExposureLimit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end