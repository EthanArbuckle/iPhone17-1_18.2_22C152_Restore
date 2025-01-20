@interface DKNowPlayingMetadataKeyClass
@end

@implementation DKNowPlayingMetadataKeyClass

Class __get_DKNowPlayingMetadataKeyClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreDuetLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E55D7280;
    uint64_t v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_1) {
    __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_DKNowPlayingMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_2();
  }
  get_DKNowPlayingMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMNowPlayingEvent.m", 21, @"%s", *a1);

  __break(1u);
}

void __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKNowPlayingMetadataKeyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMNowPlayingEvent.m", 23, @"Unable to find class %s", "_DKNowPlayingMetadataKey");

  __break(1u);
}

@end