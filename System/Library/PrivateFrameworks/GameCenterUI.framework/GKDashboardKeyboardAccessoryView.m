@interface GKDashboardKeyboardAccessoryView
- (UILabel)descriptionLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setDescriptionLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation GKDashboardKeyboardAccessoryView

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  self->_subtitleLabel = (UILabel *)a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

@end