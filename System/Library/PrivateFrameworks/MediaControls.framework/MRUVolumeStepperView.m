@interface MRUVolumeStepperView
- (CCUIButtonModuleView)decreaseButton;
- (CCUIButtonModuleView)increaseButton;
- (MRUVolumeStepperView)initWithFrame:(CGRect)a3;
- (UIView)decreaseMaterialView;
- (UIView)increaseMaterialView;
- (double)continuousButtonCornerRadius;
- (void)layoutSubviews;
- (void)setContinuousButtonCornerRadius:(double)a3;
- (void)setDecreaseMaterialView:(id)a3;
- (void)setIncreaseMaterialView:(id)a3;
@end

@implementation MRUVolumeStepperView

- (MRUVolumeStepperView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MRUVolumeStepperView;
  v3 = -[MRUVolumeStepperView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F5AE08] controlCenterModuleBackgroundMaterial];
    increaseMaterialView = v3->_increaseMaterialView;
    v3->_increaseMaterialView = (UIView *)v4;

    [(UIView *)v3->_increaseMaterialView setUserInteractionEnabled:1];
    [(UIView *)v3->_increaseMaterialView setClipsToBounds:1];
    [(MRUVolumeStepperView *)v3 addSubview:v3->_increaseMaterialView];
    uint64_t v6 = [MEMORY[0x1E4F5AE08] controlCenterModuleBackgroundMaterial];
    decreaseMaterialView = v3->_decreaseMaterialView;
    v3->_decreaseMaterialView = (UIView *)v6;

    [(UIView *)v3->_decreaseMaterialView setUserInteractionEnabled:1];
    [(UIView *)v3->_decreaseMaterialView setClipsToBounds:1];
    [(MRUVolumeStepperView *)v3 addSubview:v3->_decreaseMaterialView];
    v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:24.0];
    id v9 = objc_alloc(MEMORY[0x1E4F5ADD0]);
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    increaseButton = v3->_increaseButton;
    v3->_increaseButton = (CCUIButtonModuleView *)v14;

    v16 = +[MRUAssetsProvider volumeRelativePlus];
    v17 = [v16 imageWithSymbolConfiguration:v8];
    [(CCUIButtonModuleView *)v3->_increaseButton setGlyphImage:v17];

    [(UIView *)v3->_increaseMaterialView addSubview:v3->_increaseButton];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5ADD0]), "initWithFrame:", v10, v11, v12, v13);
    decreaseButton = v3->_decreaseButton;
    v3->_decreaseButton = (CCUIButtonModuleView *)v18;

    v20 = +[MRUAssetsProvider volumeRelativeMinus];
    v21 = [v20 imageWithSymbolConfiguration:v8];
    [(CCUIButtonModuleView *)v3->_decreaseButton setGlyphImage:v21];

    [(UIView *)v3->_decreaseMaterialView addSubview:v3->_decreaseButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeStepperView;
  [(MRUVolumeStepperView *)&v9 layoutSubviews];
  [(MRUVolumeStepperView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double v7 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v11);
  -[UIView setFrame:](self->_increaseMaterialView, "setFrame:", 0.0, 0.0, v7, v7);
  [(UIView *)self->_increaseMaterialView bounds];
  -[CCUIButtonModuleView setFrame:](self->_increaseButton, "setFrame:");
  -[UIView setFrame:](self->_decreaseMaterialView, "setFrame:", 0.0, v8 - v7, v7, v7);
  [(UIView *)self->_decreaseMaterialView bounds];
  -[CCUIButtonModuleView setFrame:](self->_decreaseButton, "setFrame:");
}

- (void)setContinuousButtonCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_increaseMaterialView, "_setContinuousCornerRadius:");
  decreaseMaterialView = self->_decreaseMaterialView;

  [(UIView *)decreaseMaterialView _setContinuousCornerRadius:a3];
}

- (CCUIButtonModuleView)increaseButton
{
  return self->_increaseButton;
}

- (CCUIButtonModuleView)decreaseButton
{
  return self->_decreaseButton;
}

- (double)continuousButtonCornerRadius
{
  return self->_continuousButtonCornerRadius;
}

- (UIView)increaseMaterialView
{
  return self->_increaseMaterialView;
}

- (void)setIncreaseMaterialView:(id)a3
{
}

- (UIView)decreaseMaterialView
{
  return self->_decreaseMaterialView;
}

- (void)setDecreaseMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decreaseMaterialView, 0);
  objc_storeStrong((id *)&self->_increaseMaterialView, 0);
  objc_storeStrong((id *)&self->_decreaseButton, 0);

  objc_storeStrong((id *)&self->_increaseButton, 0);
}

@end