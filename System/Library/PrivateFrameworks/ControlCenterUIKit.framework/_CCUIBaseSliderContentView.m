@interface _CCUIBaseSliderContentView
- (CCUIBaseSliderView)containingSliderView;
- (void)didAddSubview:(id)a3;
- (void)setContainingSliderView:(id)a3;
@end

@implementation _CCUIBaseSliderContentView

- (void)didAddSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CCUIBaseSliderContentView;
  [(_CCUIBaseSliderContentView *)&v5 didAddSubview:a3];
  v4 = [(_CCUIBaseSliderContentView *)self containingSliderView];
  [v4 setNeedsLayout];
}

- (CCUIBaseSliderView)containingSliderView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSliderView);
  return (CCUIBaseSliderView *)WeakRetained;
}

- (void)setContainingSliderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end