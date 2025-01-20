@interface SWMutableCollaborationMetadataClass
@end

@implementation SWMutableCollaborationMetadataClass

Class __get_SWMutableCollaborationMetadataClass_block_invoke(uint64_t a1)
{
  SharedWithYouLibrary();
  Class result = objc_getClass("_SWMutableCollaborationMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_SWMutableCollaborationMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (_BlastDoorLPPlatformColor *)__get_SWMutableCollaborationMetadataClass_block_invoke_cold_1();
    return (Class)[(_BlastDoorLPPlatformColor *)v3 copyWithZone:v5];
  }
  return result;
}

uint64_t __get_SWMutableCollaborationMetadataClass_block_invoke_cold_1()
{
  v0 = abort_report_np();
  return BD_IOSurfaceDisallowForever_cold_1(v0);
}

@end