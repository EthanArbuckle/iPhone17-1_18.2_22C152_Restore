@interface AVURLAsset(MediaCoreUI_SwiftWorkaround)
- (id)mcui_safeURL;
@end

@implementation AVURLAsset(MediaCoreUI_SwiftWorkaround)

- (id)mcui_safeURL
{
  v1 = [a1 URL];
  v2 = (void *)[v1 copy];

  return v2;
}

@end