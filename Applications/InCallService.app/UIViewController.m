@interface UIViewController
- (BOOL)isChildOf:(id)a3;
@end

@implementation UIViewController

- (BOOL)isChildOf:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self parentViewController];
  v6 = v5;
  if (v5)
  {
    if (v5 == v4) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = [v5 isChildOf:v4];
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

@end