@interface _UIScreenRouteSelectionTableViewCell
- (UIImageView)iconView;
- (UILabel)titleLabel;
@end

@implementation _UIScreenRouteSelectionTableViewCell

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (UIImageView)iconView
{
  return (UIImageView *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end