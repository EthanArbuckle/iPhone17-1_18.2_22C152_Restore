@interface CNPostalAddressEditorTableView
- (CGSize)intrinsicContentSize;
@end

@implementation CNPostalAddressEditorTableView

- (CGSize)intrinsicContentSize
{
  double v3 = (double)[(CNPostalAddressEditorTableView *)self numberOfRowsInSection:0];
  [(CNPostalAddressEditorTableView *)self rowHeight];
  double v5 = v4 * v3;
  double v6 = *MEMORY[0x1E4FB30D8];
  result.height = v5;
  result.width = v6;
  return result;
}

@end