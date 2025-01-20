@interface CARTableView
- (BOOL)_shouldShowHeadersAndFooters;
- (id)preferredFocusEnvironments;
@end

@implementation CARTableView

- (id)preferredFocusEnvironments
{
  objc_opt_class();
  id v3 = [(CARTableView *)self dataSource];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = [v4 preferredFocusEnvironmentsForTableView:self];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CARTableView;
    id v7 = [(CARTableView *)&v10 preferredFocusEnvironments];
  }
  v8 = v7;

  return v8;
}

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

@end