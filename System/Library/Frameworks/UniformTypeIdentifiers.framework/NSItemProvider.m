@interface NSItemProvider
@end

@implementation NSItemProvider

uint64_t __95__NSItemProvider_UTType__initWithContentsOfURL_contentType_openInPlace_coordinated_visibility___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __93__NSItemProvider_UTType__loadFileRepresentationForContentType_openInPlace_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a2, 0, a3);
  }
  return result;
}

@end