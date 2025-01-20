@interface CopyProperty
@end

@implementation CopyProperty

uint64_t __captureDeferredPhotoProcessor_CopyProperty_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 40) + 56);
  return result;
}

uint64_t __captureDeferredPhotoProcessor_CopyProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(+[FigCaptureDeferredProcessingEngine sharedProcessingEngine](FigCaptureDeferredProcessingEngine, "sharedProcessingEngine"), "lastJobReusedGraph");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end