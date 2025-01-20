@interface GKContentView
+ (CGSize)preferredSize;
+ (double)maxTextWidth;
- (GKContentView)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7;
- (NSArray)connectionButtons;
- (NSString)message;
- (NSString)title;
- (UIActivityIndicatorView)activityIndicator;
- (UIButton)cancelButton;
- (UIButton)otherButton;
- (UIFont)messageFont;
- (UIFont)titleFont;
- (UIImage)icon;
- (UIImageView)iconView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UITableView)table;
- (int64_t)numberOfMessageLines;
- (int64_t)numberOfTitleLines;
- (void)setActivityIndicator:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setIconView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setOtherButton:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation GKContentView

- (GKContentView)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)GKContentView;
  return [(GKContentView *)&v8 init];
}

- (UIImage)icon
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (int64_t)numberOfTitleLines
{
  int64_t result = (int64_t)self->_titleLabel;
  if (result) {
    return [(id)result numberOfLines];
  }
  return result;
}

- (NSString)message
{
  return 0;
}

- (int64_t)numberOfMessageLines
{
  return 0;
}

- (UITableView)table
{
  return 0;
}

+ (CGSize)preferredSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)maxTextWidth
{
  return 0.0;
}

- (UIFont)titleFont
{
  return (UIFont *)[MEMORY[0x263F1C658] boldSystemFontOfSize:14.0];
}

- (UIFont)messageFont
{
  return (UIFont *)[MEMORY[0x263F1C658] systemFontOfSize:17.0];
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)otherButton
{
  return self->_otherButton;
}

- (void)setOtherButton:(id)a3
{
}

- (NSArray)connectionButtons
{
  return self->_connectionButtons;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

@end