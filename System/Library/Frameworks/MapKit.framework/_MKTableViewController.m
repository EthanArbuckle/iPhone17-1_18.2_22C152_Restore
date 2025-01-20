@interface _MKTableViewController
- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO;
- (double)defaultLeadingSeparatorInset;
- (double)defaultTrailingSeparatorInset;
- (id)separatorColor;
@end

@implementation _MKTableViewController

- (double)defaultLeadingSeparatorInset
{
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  v4 = [(_MKTableViewController *)self view];
  [v4 layoutMargins];
  double v6 = v5;
  double v8 = v7;

  if (IsRightToLeft) {
    return v8;
  }
  else {
    return v6;
  }
}

- (double)defaultTrailingSeparatorInset
{
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  v4 = [(_MKTableViewController *)self view];
  [v4 layoutMargins];
  double v6 = v5;
  double v8 = v7;

  if (IsRightToLeft) {
    return v6;
  }
  else {
    return v8;
  }
}

- (id)separatorColor
{
  v2 = [(UIViewController *)self mk_theme];
  v3 = [v2 separatorLineColor];

  return v3;
}

- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO
{
  return 1;
}

@end