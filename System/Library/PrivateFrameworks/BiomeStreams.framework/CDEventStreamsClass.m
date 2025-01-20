@interface CDEventStreamsClass
@end

@implementation CDEventStreamsClass

Class __get_CDEventStreamsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_3)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreDuetLibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E55D76B8;
    uint64_t v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_3) {
    __get_CDEventStreamsClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_CDEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDEventStreamsClass_block_invoke_cold_2();
  }
  get_CDEventStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_CDEventStreamsClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_9)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreDuetLibraryCore_block_invoke_9;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E55D8348;
    uint64_t v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_9 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_9) {
    __get_CDEventStreamsClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_CDEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDEventStreamsClass_block_invoke_cold_2_0();
  }
  get_CDEventStreamsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDEventStreamsClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMDKEventStream.m", 18, @"%s", *a1);

  __break(1u);
}

void __get_CDEventStreamsClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDKEventStream.m", 19, @"Unable to find class %s", "_CDEventStreams");

  __break(1u);
}

void __get_CDEventStreamsClass_block_invoke_cold_1_0(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMDaemon+Pruning.m", 31, @"%s", *a1);

  __break(1u);
}

void __get_CDEventStreamsClass_block_invoke_cold_2_0()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDaemon+Pruning.m", 32, @"Unable to find class %s", "_CDEventStreams");

  __break(1u);
}

@end