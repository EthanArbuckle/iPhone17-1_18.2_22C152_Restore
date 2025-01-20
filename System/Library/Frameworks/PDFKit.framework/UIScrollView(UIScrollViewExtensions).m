@interface UIScrollView(UIScrollViewExtensions)
- (uint64_t)PDFKitDocumentVisibleRectIncludingContentInsets;
@end

@implementation UIScrollView(UIScrollViewExtensions)

- (uint64_t)PDFKitDocumentVisibleRectIncludingContentInsets
{
  return [a1 contentInset];
}

@end