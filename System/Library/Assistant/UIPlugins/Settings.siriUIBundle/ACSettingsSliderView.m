@interface ACSettingsSliderView
- (ACSettingsSliderView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (UISlider)slider;
@end

@implementation ACSettingsSliderView

- (ACSettingsSliderView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)ACSettingsSliderView;
  v3 = -[ACSettingsSnippetView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISlider *)objc_msgSend(objc_alloc((Class)UISlider), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    slider = v3->_slider;
    v3->_slider = v4;

    [(UISlider *)v3->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = v3->_slider;
    v7 = [(ACSettingsSliderView *)v3 tintColor];
    [(UISlider *)v6 setTintColor:v7];

    v8 = v3->_slider;
    v9 = +[UIColor siriui_keylineColor];
    [(UISlider *)v8 setMaximumTrackTintColor:v9];

    [(ACSettingsSliderView *)v3 addSubview:v3->_slider];
    v10 = +[NSLayoutConstraint constraintWithItem:v3->_slider attribute:5 relatedBy:0 toItem:v3 attribute:17 multiplier:1.0 constant:SiriUIPlatterStyle[32] + -5.0];
    LODWORD(v11) = 1148682240;
    [v10 setPriority:v11];
    v12 = +[NSLayoutConstraint constraintWithItem:v3->_slider attribute:6 relatedBy:0 toItem:v3 attribute:18 multiplier:1.0 constant:5.0 - SiriUIPlatterStyle[34]];
    LODWORD(v13) = 1148682240;
    [v12 setPriority:v13];
    v14 = +[NSLayoutConstraint constraintWithItem:v3->_slider attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    [(ACSettingsSliderView *)v3 addConstraint:v10];
    [(ACSettingsSliderView *)v3 addConstraint:v12];
    [(ACSettingsSliderView *)v3 addConstraint:v14];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 47.0;
  result.height = v3;
  return result;
}

- (UISlider)slider
{
  return self->_slider;
}

- (void).cxx_destruct
{
}

@end