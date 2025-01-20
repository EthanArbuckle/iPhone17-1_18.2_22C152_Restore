@interface CDInteractionAdvisorClass
@end

@implementation CDInteractionAdvisorClass

void __get_CDInteractionAdvisorClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_CDInteractionAdvisor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_CDInteractionAdvisorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_CDInteractionAdvisorClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CNCoreDuet.h", 29, @"Unable to find class %s", "_CDInteractionAdvisor");

    __break(1u);
  }
}

@end