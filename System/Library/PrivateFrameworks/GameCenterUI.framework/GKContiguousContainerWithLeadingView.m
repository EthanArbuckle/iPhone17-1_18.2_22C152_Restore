@interface GKContiguousContainerWithLeadingView
- (CGSize)intrinsicContentSize;
@end

@implementation GKContiguousContainerWithLeadingView

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v3;
  result.width = v2;
  return result;
}

@end