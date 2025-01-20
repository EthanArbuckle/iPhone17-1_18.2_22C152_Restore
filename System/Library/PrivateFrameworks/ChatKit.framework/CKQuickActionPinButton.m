@interface CKQuickActionPinButton
- (UIEdgeInsets)contentEdgeInsetsForState:(unint64_t)a3;
- (double)animationDurationForState:(unint64_t)a3;
- (id)buttonImageForState:(unint64_t)a3;
@end

@implementation CKQuickActionPinButton

- (double)animationDurationForState:(unint64_t)a3
{
  double result = 0.05;
  if (a3 != 2) {
    double result = 0.0;
  }
  if (a3 == 3) {
    return 0.15;
  }
  return result;
}

- (id)buttonImageForState:(unint64_t)a3
{
  if (a3 >= 3)
  {
    if (a3 != 3)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"pin"];
    v5 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:16.0];
    v4 = [v3 imageWithSymbolConfiguration:v5];
  }
  else
  {
    v3 = +[CKUIBehavior sharedBehaviors];
    v4 = [v3 quickPinButtonImage];
  }

LABEL_7:

  return v4;
}

- (UIEdgeInsets)contentEdgeInsetsForState:(unint64_t)a3
{
  if (a3 > 2)
  {
    double v5 = *MEMORY[0x1E4F437F8];
    double v7 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else
  {
    v3 = +[CKUIBehavior sharedBehaviors];
    [v3 quickActionPinButtonImageInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

@end