@interface HWScrollView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
@end

@implementation HWScrollView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  v5 = [(HWScrollView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 handwritingScrollView:self shouldCancelTouchesInView:v4];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end