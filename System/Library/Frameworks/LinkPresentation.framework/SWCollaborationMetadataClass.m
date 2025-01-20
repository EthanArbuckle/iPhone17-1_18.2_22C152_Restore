@interface SWCollaborationMetadataClass
@end

@implementation SWCollaborationMetadataClass

Class __get_SWCollaborationMetadataClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!SharedWithYouLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __SharedWithYouLibraryCore_block_invoke;
    v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E5B05250;
    uint64_t v9 = 0;
    SharedWithYouLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SharedWithYouLibraryCore_frameworkLibrary)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *SharedWithYouLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"LPMetadata.m", 48, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("_SWCollaborationMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"Class get_SWCollaborationMetadataClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"LPMetadata.m", 49, @"Unable to find class %s", "_SWCollaborationMetadata");

LABEL_10:
    __break(1u);
  }
  get_SWCollaborationMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end