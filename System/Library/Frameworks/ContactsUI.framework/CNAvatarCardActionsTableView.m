@interface CNAvatarCardActionsTableView
- (CGSize)intrinsicContentSize;
@end

@implementation CNAvatarCardActionsTableView

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4FB30D8];
  double v4 = (double)[(CNAvatarCardActionsTableView *)self numberOfRowsInSection:0];
  [(CNAvatarCardActionsTableView *)self rowHeight];
  double v6 = v5 * v4;
  double v7 = v3;
  result.height = v6;
  result.width = v7;
  return result;
}

@end