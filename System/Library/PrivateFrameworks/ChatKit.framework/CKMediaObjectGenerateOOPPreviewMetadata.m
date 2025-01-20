@interface CKMediaObjectGenerateOOPPreviewMetadata
@end

@implementation CKMediaObjectGenerateOOPPreviewMetadata

uint64_t ___CKMediaObjectGenerateOOPPreviewMetadata_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

@end