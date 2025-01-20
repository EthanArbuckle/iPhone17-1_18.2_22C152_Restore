@interface FBKPreviewItemTXT
- (id)previewItemContentType;
@end

@implementation FBKPreviewItemTXT

- (id)previewItemContentType
{
  return (id)*MEMORY[0x263F01B48];
}

@end