@interface HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc
@end

@implementation HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc

void *__get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HealthKitLibrary();
  result = dlsym(v2, "_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstParty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstPartySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                          + 24);
  return result;
}

@end