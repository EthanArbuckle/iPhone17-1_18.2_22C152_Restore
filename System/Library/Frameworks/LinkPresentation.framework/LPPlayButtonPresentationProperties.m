@interface LPPlayButtonPresentationProperties
- (BOOL)disabled;
- (UIColor)accentColor;
- (void)setAccentColor:(id)a3;
- (void)setDisabled:(BOOL)a3;
@end

@implementation LPPlayButtonPresentationProperties

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
}

@end