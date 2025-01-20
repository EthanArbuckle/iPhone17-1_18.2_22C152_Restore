@interface PSTableCell
- (void)setActivityAccessoryView;
@end

@implementation PSTableCell

- (void)setActivityAccessoryView
{
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(PSTableCell *)self setAccessoryView:v3];
  [v3 startAnimating];
}

@end