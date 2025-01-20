@interface LTTextTranslationRequestClass
@end

@implementation LTTextTranslationRequestClass

AXMVisionResult *__get_LTTextTranslationRequestClass_block_invoke(uint64_t a1)
{
  TranslationLibrary();
  result = (AXMVisionResult *)objc_getClass("_LTTextTranslationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_LTTextTranslationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__get_LTTextTranslationRequestClass_block_invoke_cold_1();
    return +[AXMVisionResult resultWithImage:v5 features:v6 orientation:v7 metricSession:v8];
  }
  return result;
}

uint64_t __get_LTTextTranslationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMVisionEngineCache _cacheQueue_resultForKey:](v0);
}

@end