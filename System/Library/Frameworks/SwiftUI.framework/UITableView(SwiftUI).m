@interface UITableView(SwiftUI)
- (double)horizontalMargin;
@end

@implementation UITableView(SwiftUI)

- (double)horizontalMargin
{
  uint64_t v2 = [a1 effectiveUserInterfaceLayoutDirection];
  [a1 safeAreaInsets];
  if (v2 == 1) {
    double v5 = v4;
  }
  else {
    double v5 = v3;
  }
  [a1 _defaultLeadingCellMarginWidth];
  double v7 = v6;
  int v8 = [a1 _sectionContentInsetFollowsLayoutMargins];
  double v9 = 0.0;
  if (!v8) {
    double v9 = v5;
  }
  return v7 - v9;
}

@end