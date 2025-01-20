@interface _SFTranslationTargetLocaleAlertActionContentView
- (UILabel)titleLabel;
- (void)setTitleLabel:(id)a3;
- (void)tintColorDidChange;
@end

@implementation _SFTranslationTargetLocaleAlertActionContentView

- (void)tintColorDidChange
{
  id v3 = [(_SFTranslationTargetLocaleAlertActionContentView *)self tintColor];
  [(UILabel *)self->_titleLabel setTextColor:v3];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end