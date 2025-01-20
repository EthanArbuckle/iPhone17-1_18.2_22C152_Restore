@interface UIAction
- (BOOL)rpccui_isEqualToAction:(id)a3;
@end

@implementation UIAction

- (BOOL)rpccui_isEqualToAction:(id)a3
{
  v4 = (UIAction *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && [(UIAction *)self isEqual:v4])
  {
    v6 = [(UIAction *)self title];
    v7 = [(UIAction *)v5 title];
    if (BSEqualStrings())
    {
      v8 = [(UIAction *)self discoverabilityTitle];
      v9 = [(UIAction *)v5 discoverabilityTitle];
      char v10 = BSEqualStrings();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

@end