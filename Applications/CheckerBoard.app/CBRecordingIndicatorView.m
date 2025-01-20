@interface CBRecordingIndicatorView
+ (Class)layerClass;
- (CBRecordingIndicatorView)initWithCoder:(id)a3;
- (CBRecordingIndicatorView)initWithFrame:(CGRect)a3;
- (unint64_t)indicatorType;
- (void)layoutSubviews;
- (void)setIndicatorType:(unint64_t)a3;
@end

@implementation CBRecordingIndicatorView

- (CBRecordingIndicatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CBRecordingIndicatorView;
  v3 = -[CBRecordingIndicatorView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    sub_10001CA64((id *)&v3->super.super.super.isa);
  }
  return v4;
}

- (CBRecordingIndicatorView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CBRecordingIndicatorView;
  v3 = [(CBRecordingIndicatorView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    sub_10001CA64((id *)&v3->super.super.super.isa);
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CBRecordingIndicatorView;
  [(CBRecordingIndicatorView *)&v8 layoutSubviews];
  if ([(CBRecordingIndicatorView *)self indicatorType] > 1)
  {
    v5 = [(CBRecordingIndicatorView *)self layer];
    objc_super v6 = v5;
    double v7 = 0.0;
  }
  else
  {
    [(CBRecordingIndicatorView *)self bounds];
    double v4 = v3 * 0.5;
    v5 = [(CBRecordingIndicatorView *)self layer];
    objc_super v6 = v5;
    double v7 = v4;
  }
  [v5 setCornerRadius:v7];

  [(CBRecordingIndicatorView *)self _setAllowsHighContrastForBackgroundColor:1];
}

- (void)setIndicatorType:(unint64_t)a3
{
  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    v5 = [(CBRecordingIndicatorView *)self layer];
    objc_super v6 = sub_10001C9C0((id)a3);
    double v7 = [v5 privacyIndicatorType];

    if (v6 != v7)
    {
      objc_super v8 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for view-dot to %@", (uint8_t *)&v9, 0xCu);
      }

      [v5 setPrivacyIndicatorType:v6];
      [(CBRecordingIndicatorView *)self setNeedsLayout];
      [(CBRecordingIndicatorView *)self layoutIfNeeded];
    }
  }
}

- (unint64_t)indicatorType
{
  return self->_indicatorType;
}

@end