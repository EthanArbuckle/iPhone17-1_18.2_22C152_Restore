@interface LTTextTranslationRequestClass
@end

@implementation LTTextTranslationRequestClass

void __get_LTTextTranslationRequestClass_block_invoke(uint64_t a1)
{
  TranslationLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_LTTextTranslationRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_LTTextTranslationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_LTTextTranslationRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTranslateTextAction.m", 20, @"Unable to find class %s", "_LTTextTranslationRequest");

    __break(1u);
  }
}

@end