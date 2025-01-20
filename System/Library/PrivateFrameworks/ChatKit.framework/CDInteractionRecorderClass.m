@interface CDInteractionRecorderClass
@end

@implementation CDInteractionRecorderClass

Class __get_CDInteractionRecorderClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_CDInteractionRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDInteractionRecorderClass_block_invoke_cold_1();
  }
  get_CDInteractionRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDInteractionRecorderClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDInteractionRecorderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKSMSComposeViewServiceController.m", 94, @"Unable to find class %s", "_CDInteractionRecorder");

  __break(1u);
}

@end