@interface UIWebDocumentView(AXPrivate)
- (uint64_t)_axPluginViews;
@end

@implementation UIWebDocumentView(AXPrivate)

- (uint64_t)_axPluginViews
{
  return *(void *)(a1 + (int)*MEMORY[0x263F1CD90]);
}

@end