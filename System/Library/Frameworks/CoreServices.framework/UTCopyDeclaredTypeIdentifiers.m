@interface UTCopyDeclaredTypeIdentifiers
@end

@implementation UTCopyDeclaredTypeIdentifiers

void ___UTCopyDeclaredTypeIdentifiers_block_invoke(uint64_t a1)
{
  id v2 = (id)_CSStringCopyCFString();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

@end