@interface HUSimpleSliderControlView
+ (Class)valueClass;
- (BOOL)isDisabled;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HUControlViewDelegate)delegate;
- (HUSimpleSliderControlView)initWithFrame:(CGRect)a3;
- (NSString)identifier;
- (UISlider)slider;
- (float)maxValue;
- (float)minValue;
- (id)value;
- (void)_sliderTouchDown:(id)a3;
- (void)_sliderTouchUp:(id)a3;
- (void)_sliderValueChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxValue:(float)a3;
- (void)setMinValue:(float)a3;
- (void)setValue:(id)a3;
@end

@implementation HUSimpleSliderControlView

- (HUSimpleSliderControlView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)HUSimpleSliderControlView;
  v7 = -[HUSimpleSliderControlView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DF0]), "initWithFrame:", x, y, width, height);
    slider = v7->_slider;
    v7->_slider = (UISlider *)v8;

    [(UISlider *)v7->_slider setAutoresizingMask:18];
    [(UISlider *)v7->_slider addTarget:v7 action:sel__sliderTouchDown_ forControlEvents:1];
    [(UISlider *)v7->_slider addTarget:v7 action:sel__sliderValueChanged_ forControlEvents:4096];
    [(UISlider *)v7->_slider addTarget:v7 action:sel__sliderTouchUp_ forControlEvents:448];
    [(HUSimpleSliderControlView *)v7 addSubview:v7->_slider];
  }
  return v7;
}

- (float)minValue
{
  v2 = [(HUSimpleSliderControlView *)self slider];
  [v2 minimumValue];
  float v4 = v3;

  return v4;
}

- (void)setMinValue:(float)a3
{
  id v5 = [(HUSimpleSliderControlView *)self slider];
  *(float *)&double v4 = a3;
  [v5 setMinimumValue:v4];
}

- (float)maxValue
{
  v2 = [(HUSimpleSliderControlView *)self slider];
  [v2 maximumValue];
  float v4 = v3;

  return v4;
}

- (void)setMaxValue:(float)a3
{
  id v5 = [(HUSimpleSliderControlView *)self slider];
  *(float *)&double v4 = a3;
  [v5 setMaximumValue:v4];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUSimpleSliderControlView *)self slider];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(HUSimpleSliderControlView *)self slider];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  v2 = NSNumber;
  double v3 = [(HUSimpleSliderControlView *)self slider];
  [v3 value];
  double v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  id v9 = [(HUSimpleSliderControlView *)self slider];
  [v4 floatValue];
  int v6 = v5;

  uint64_t v7 = [MEMORY[0x1E4F42FF0] _isInAnimationBlock];
  LODWORD(v8) = v6;
  [v9 setValue:v7 animated:v8];
}

- (BOOL)isDisabled
{
  v2 = [(HUSimpleSliderControlView *)self slider];
  char v3 = [v2 isEnabled] ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HUSimpleSliderControlView *)self slider];
  [v4 setEnabled:v3];
}

- (void)_sliderTouchDown:(id)a3
{
  id v4 = [(HUSimpleSliderControlView *)self delegate];
  [v4 controlViewDidBeginUserInteraction:self];
}

- (void)_sliderTouchUp:(id)a3
{
  id v4 = [(HUSimpleSliderControlView *)self delegate];
  [v4 controlViewDidEndUserInteraction:self];
}

- (void)_sliderValueChanged:(id)a3
{
  id v5 = [(HUSimpleSliderControlView *)self delegate];
  id v4 = [(HUSimpleSliderControlView *)self value];
  [v5 controlView:self valueDidChange:v4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (HUControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISlider)slider
{
  return self->_slider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end