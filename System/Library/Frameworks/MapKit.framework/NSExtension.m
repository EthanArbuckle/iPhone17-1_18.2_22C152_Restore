@interface NSExtension
@end

@implementation NSExtension

uint64_t __78__NSExtension_MapsExtension___extensionVendorContextForUUID_withErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end