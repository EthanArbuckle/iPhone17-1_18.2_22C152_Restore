@interface AMUINotificationIndicatorView
- (AMUINotificationIndicatorView)initWithNotificationCount:(unint64_t)a3;
- (BOOL)hideNotificationCount;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)_attributedStringForNotificationCount:(unint64_t)a3;
- (id)_fontForNotificationIndicatorLabel;
- (id)_notificationIndicatorImage;
- (unint64_t)notificationCount;
- (void)_configureNotificationIndicatorLabelIfNecessary;
- (void)layoutSubviews;
- (void)setHideNotificationCount:(BOOL)a3;
- (void)setNotificationCount:(unint64_t)a3;
@end

@implementation AMUINotificationIndicatorView

- (AMUINotificationIndicatorView)initWithNotificationCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMUINotificationIndicatorView;
  v4 = [(AMUINotificationIndicatorView *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_notificationCount = a3;
    v4->_hideNotificationCount = 1;
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"amui-notification-indicator-view,count:%lu", a3);
    [(AMUINotificationIndicatorView *)v5 setAccessibilityIdentifier:v6];
  }
  return v5;
}

- (void)setNotificationCount:(unint64_t)a3
{
  if (self->_notificationCount != a3)
  {
    self->_notificationCount = a3;
    [(AMUINotificationIndicatorView *)self setNeedsLayout];
  }
}

- (void)setHideNotificationCount:(BOOL)a3
{
  if (self->_hideNotificationCount != a3)
  {
    self->_hideNotificationCount = a3;
    [(UILabel *)self->_notificationIndicatorLabel removeFromSuperview];
    notificationIndicatorLabel = self->_notificationIndicatorLabel;
    self->_notificationIndicatorLabel = 0;

    [(AMUINotificationIndicatorView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AMUINotificationIndicatorView *)self _configureNotificationIndicatorLabelIfNecessary];
  notificationIndicatorLabel = self->_notificationIndicatorLabel;

  -[UILabel sizeThatFits:](notificationIndicatorLabel, "sizeThatFits:", width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AMUINotificationIndicatorView;
  [(AMUINotificationIndicatorView *)&v4 layoutSubviews];
  [(AMUINotificationIndicatorView *)self _configureNotificationIndicatorLabelIfNecessary];
  notificationIndicatorLabel = self->_notificationIndicatorLabel;
  [(AMUINotificationIndicatorView *)self bounds];
  -[UILabel setFrame:](notificationIndicatorLabel, "setFrame:");
}

- (void)_configureNotificationIndicatorLabelIfNecessary
{
  notificationIndicatorLabel = self->_notificationIndicatorLabel;
  if (notificationIndicatorLabel) {
    goto LABEL_5;
  }
  if ([(AMUINotificationIndicatorView *)self notificationCount])
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_notificationIndicatorLabel;
    self->_notificationIndicatorLabel = v5;

    double v7 = self->_notificationIndicatorLabel;
    double v8 = [MEMORY[0x263F1C550] systemWhiteColor];
    [(UILabel *)v7 setTextColor:v8];

    [(AMUINotificationIndicatorView *)self addSubview:self->_notificationIndicatorLabel];
  }
  notificationIndicatorLabel = self->_notificationIndicatorLabel;
  if (notificationIndicatorLabel)
  {
LABEL_5:
    id v9 = [(AMUINotificationIndicatorView *)self _attributedStringForNotificationCount:[(AMUINotificationIndicatorView *)self notificationCount]];
    [(UILabel *)notificationIndicatorLabel setAttributedText:v9];
  }
}

- (id)_fontForNotificationIndicatorLabel
{
  v2 = [MEMORY[0x263F29D38] preferredFontProvider];
  v3 = [v2 preferredFontForTextStyle:*MEMORY[0x263F1D280] hiFontStyle:1];

  return v3;
}

- (id)_notificationIndicatorImage
{
  v2 = (void *)MEMORY[0x263F1C6C8];
  v3 = [(AMUINotificationIndicatorView *)self _fontForNotificationIndicatorLabel];
  id v4 = [v2 configurationWithFont:v3];

  v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"circlebadge.fill" withConfiguration:v4];
  v6 = [v5 imageWithRenderingMode:2];

  return v6;
}

- (id)_attributedStringForNotificationCount:(unint64_t)a3
{
  v5 = [(AMUINotificationIndicatorView *)self _notificationIndicatorImage];
  id v6 = objc_alloc_init(MEMORY[0x263F1C370]);
  [v6 setImage:v5];
  double v7 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v6];
  double v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v7];
  if (![(AMUINotificationIndicatorView *)self hideNotificationCount])
  {
    id v9 = (void *)MEMORY[0x263F08A30];
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    v11 = [v9 localizedStringFromNumber:v10 numberStyle:0];

    v12 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v11];
    if ([(AMUINotificationIndicatorView *)self _shouldReverseLayoutDirection])
    {
      [v12 appendAttributedString:v8];
      id v13 = v12;

      double v8 = v13;
    }
    else
    {
      [v8 appendAttributedString:v12];
    }
  }

  return v8;
}

- (unint64_t)notificationCount
{
  return self->_notificationCount;
}

- (BOOL)hideNotificationCount
{
  return self->_hideNotificationCount;
}

- (void).cxx_destruct
{
}

@end