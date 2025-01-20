@interface CDAttachmentClass
@end

@implementation CDAttachmentClass

Class __get_CDAttachmentClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_CDAttachment");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDAttachmentClass_block_invoke_cold_1();
  }
  get_CDAttachmentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDAttachmentClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDAttachmentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKSMSComposeViewServiceController.m", 91, @"Unable to find class %s", "_CDAttachment");

  __break(1u);
}

@end