@interface CARTemplateUIDashboardButton
- (void)focusableItemFocused:(BOOL)a3;
- (void)focusableItemPressed:(BOOL)a3;
- (void)focusableItemSelected;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
@end

@implementation CARTemplateUIDashboardButton

- (void)focusableItemFocused:(BOOL)a3
{
}

- (void)focusableItemPressed:(BOOL)a3
{
  double v3 = 0.8;
  if (!a3) {
    double v3 = 1.0;
  }
  [(CARTemplateUIDashboardButton *)self setAlpha:v3];
}

- (void)focusableItemSelected
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CARTemplateUIDashboardButton;
  [(CARTemplateUIDashboardButton *)&v4 touchesCancelled:a3 withEvent:a4];
}

@end