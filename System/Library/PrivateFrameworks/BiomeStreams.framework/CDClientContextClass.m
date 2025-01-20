@interface CDClientContextClass
@end

@implementation CDClientContextClass

Class __get_CDClientContextClass_block_invoke(uint64_t a1)
{
  CoreDuetContextLibrary();
  Class result = objc_getClass("_CDClientContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDClientContextClass_block_invoke_cold_1();
  }
  get_CDClientContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_CDClientContextClass_block_invoke_0(uint64_t a1)
{
  CoreDuetContextLibrary_0();
  Class result = objc_getClass("_CDClientContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDClientContextClass_block_invoke_cold_1_0();
  }
  get_CDClientContextClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_CDClientContextClass_block_invoke_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreDuetContextLibraryCore_frameworkLibrary_2)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreDuetContextLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E55D8040;
    uint64_t v5 = 0;
    CoreDuetContextLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!CoreDuetContextLibraryCore_frameworkLibrary_2) {
    __get_CDClientContextClass_block_invoke_cold_1_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_CDClientContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDClientContextClass_block_invoke_cold_2();
  }
  get_CDClientContextClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDClientContextClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDClientContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 41, @"Unable to find class %s", "_CDClientContext");

  __break(1u);
}

void __get_CDClientContextClass_block_invoke_cold_1_0()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDClientContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMTipsStreams.m", 32, @"Unable to find class %s", "_CDClientContext");

  __break(1u);
}

void __get_CDClientContextClass_block_invoke_cold_1_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *CoreDuetContextLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMCoreDuetStream.m", 26, @"%s", *a1);

  __break(1u);
}

void __get_CDClientContextClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDClientContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMCoreDuetStream.m", 27, @"Unable to find class %s", "_CDClientContext");

  __break(1u);
}

@end