@interface SWCollaborationMetadataClass
@end

@implementation SWCollaborationMetadataClass

void __get_SWCollaborationMetadataClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_SWCollaborationMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_SWCollaborationMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_SWCollaborationMetadataClass_block_invoke_cold_1();
    SharedWithYouLibrary();
  }
}

uint64_t __get_SWCollaborationMetadataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_SWMutableCollaborationMetadataClass_block_invoke_cold_1(v0);
}

@end