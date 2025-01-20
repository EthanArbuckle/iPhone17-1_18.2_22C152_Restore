@interface CNComposeRecipientActionButton
- (BOOL)_supportsMacIdiom;
- (BOOL)canBecomeFocused;
- (UIColor)buttonColor;
- (void)setButtonColor:(id)a3;
@end

@implementation CNComposeRecipientActionButton

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (UIColor)buttonColor
{
  return (UIColor *)objc_getProperty(self, a2, 744, 1);
}

- (void)setButtonColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end