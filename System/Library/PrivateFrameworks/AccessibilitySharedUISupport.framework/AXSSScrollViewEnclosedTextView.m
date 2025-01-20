@interface AXSSScrollViewEnclosedTextView
- (BOOL)_forwardsToParentScroller;
@end

@implementation AXSSScrollViewEnclosedTextView

- (BOOL)_forwardsToParentScroller
{
  return 1;
}

@end