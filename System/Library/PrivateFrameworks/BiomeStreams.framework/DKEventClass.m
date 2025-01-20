@interface DKEventClass
@end

@implementation DKEventClass

Class __get_DKEventClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKEventClass_block_invoke_cold_1();
  }
  get_DKEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKEventClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKEventClass_block_invoke_cold_1_0();
  }
  get_DKEventClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKEventClass_block_invoke_1(uint64_t a1)
{
  CoreDuetLibrary_1();
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKEventClass_block_invoke_cold_1_1();
  }
  get_DKEventClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKEventClass_block_invoke_2(uint64_t a1)
{
  CoreDuetLibrary_2();
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKEventClass_block_invoke_cold_1_2();
  }
  get_DKEventClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKEventClass_block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_7)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreDuetLibraryCore_block_invoke_7;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E55D7920;
    uint64_t v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_7 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_7) {
    __get_DKEventClass_block_invoke_cold_1_3(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKEventClass_block_invoke_cold_2();
  }
  get_DKEventClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKEventClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMKnowledgeContextMapping.m", 18, @"Unable to find class %s", "_DKEvent");

  __break(1u);
}

void __get_DKEventClass_block_invoke_cold_1_0()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 36, @"Unable to find class %s", "_DKEvent");

  __break(1u);
}

void __get_DKEventClass_block_invoke_cold_1_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_BMDKEventCodec_DKPREvent.m", 20, @"Unable to find class %s", "_DKEvent");

  __break(1u);
}

void __get_DKEventClass_block_invoke_cold_1_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMTipsStreams.m", 27, @"Unable to find class %s", "_DKEvent");

  __break(1u);
}

void __get_DKEventClass_block_invoke_cold_1_3(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"_BMDKEventCodec_BMPBDKEvent.m", 17, @"%s", *a1);

  __break(1u);
}

void __get_DKEventClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_BMDKEventCodec_BMPBDKEvent.m", 18, @"Unable to find class %s", "_DKEvent");

  __break(1u);
}

@end