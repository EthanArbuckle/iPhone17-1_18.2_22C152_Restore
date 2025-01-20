@interface ARCoachingRoundedButton
- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7;
- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7;
- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7 adjustsFontForContentSizeCategory:(BOOL)a8;
- (void)_setupViewWithCornerRadius:(double)a3;
@end

@implementation ARCoachingRoundedButton

- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7
{
  v10.receiver = self;
  v10.super_class = (Class)ARCoachingRoundedButton;
  v7 = [(ARCoachingButton *)&v10 initWithTitle:a3 buttonStyle:a4 textStyle:a5 controlStyle:a6 adjustsFontForContentSizeCategory:a7];
  v8 = v7;
  if (v7) {
    [(ARCoachingRoundedButton *)v7 _setupViewWithCornerRadius:16.0];
  }
  return v8;
}

- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7
{
  return [(ARCoachingRoundedButton *)self initWithTitle:a3 buttonStyle:a4 textStyle:a5 controlStyle:a6 cornerRadius:0 adjustsFontForContentSizeCategory:a7];
}

- (ARCoachingRoundedButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 cornerRadius:(double)a7 adjustsFontForContentSizeCategory:(BOOL)a8
{
  v12.receiver = self;
  v12.super_class = (Class)ARCoachingRoundedButton;
  v9 = [(ARCoachingButton *)&v12 initWithTitle:a3 buttonStyle:a4 textStyle:a5 controlStyle:a6 adjustsFontForContentSizeCategory:a8];
  objc_super v10 = v9;
  if (v9) {
    [(ARCoachingRoundedButton *)v9 _setupViewWithCornerRadius:a7];
  }
  return v10;
}

- (void)_setupViewWithCornerRadius:(double)a3
{
  [(ARCoachingRoundedButton *)self _setContinuousCornerRadius:a3];

  [(ARCoachingRoundedButton *)self setClipsToBounds:1];
}

@end