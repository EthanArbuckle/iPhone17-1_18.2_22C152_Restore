@interface AVDarkModeCompatibleLabel
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVDarkModeCompatibleLabel

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(AVDarkModeCompatibleLabel *)self textColor];
  [(AVDarkModeCompatibleLabel *)self setTextColor:v4];
}

@end