@interface WKNSURL
- (id)_web_createTarget;
@end

@implementation WKNSURL

- (id)_web_createTarget
{
  uint64_t v2 = *MEMORY[0x1E4F1CF80];
  v3 = (void *)[(WKObject *)self _apiObject][8];

  return WKURLCopyCFURL(v2, v3);
}

@end