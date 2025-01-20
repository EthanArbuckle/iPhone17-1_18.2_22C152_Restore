@interface HearingPlaceholderCell
- (HearingPlaceholderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation HearingPlaceholderCell

- (HearingPlaceholderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)HearingPlaceholderCell;
  v5 = [(HearingPlaceholderCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = v6;

    [(UIActivityIndicatorView *)v5->_spinner startAnimating];
    v8 = [(HearingPlaceholderCell *)v5 contentView];
    [v8 addSubview:v5->_spinner];
  }
  return v5;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)HearingPlaceholderCell;
  [(HearingPlaceholderCell *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HearingPlaceholderCell;
  [(HearingPlaceholderCell *)&v14 layoutSubviews];
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v4 = v3;
  double v6 = v5;
  double v7 = 10.0;
  if (![UIApp userInterfaceLayoutDirection])
  {
    v8 = [(HearingPlaceholderCell *)self contentView];
    [v8 frame];
    double v7 = v9 - v4 + -10.0;
  }
  objc_super v10 = [(HearingPlaceholderCell *)self contentView];
  [v10 frame];
  float v12 = (v11 - v6) * 0.5;
  double v13 = ceilf(v12);

  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v7, v13, v4, v6);
}

- (void).cxx_destruct
{
}

@end