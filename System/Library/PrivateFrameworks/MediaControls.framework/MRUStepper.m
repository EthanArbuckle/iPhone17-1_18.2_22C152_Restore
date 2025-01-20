@interface MRUStepper
- (BOOL)isDimmed;
- (MRUStepper)initWithFrame:(CGRect)a3;
- (MRUStepperDelegate)delegate;
- (MRUTransportButton)decrementButton;
- (MRUTransportButton)incrementButton;
- (MRUVisualStylingProvider)stylingProvider;
- (UIImage)decrementImage;
- (UIImage)incrementImage;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UIView)decrementBackground;
- (UIView)incrementBackground;
- (void)decreaseButtonHoldBegan:(id)a3;
- (void)decreaseButtonHoldReleased:(id)a3;
- (void)decreaseTouchUpInside:(id)a3;
- (void)increaseButtonHoldBegan:(id)a3;
- (void)increaseButtonHoldReleased:(id)a3;
- (void)increaseTouchUpInside:(id)a3;
- (void)layoutSubviews;
- (void)setDecrementBackground:(id)a3;
- (void)setDecrementButton:(id)a3;
- (void)setDecrementImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setIncrementBackground:(id)a3;
- (void)setIncrementButton:(id)a3;
- (void)setIncrementImage:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRUStepper

- (MRUStepper)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MRUStepper;
  v3 = -[MRUStepper initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    decrementBackground = v3->_decrementBackground;
    v3->_decrementBackground = v4;

    [(MRUStepper *)v3 addSubview:v3->_decrementBackground];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    incrementBackground = v3->_incrementBackground;
    v3->_incrementBackground = v6;

    [(MRUStepper *)v3 addSubview:v3->_incrementBackground];
    uint64_t v8 = +[MPButton easyTouchButtonWithType:0];
    decrementButton = v3->_decrementButton;
    v3->_decrementButton = (MRUTransportButton *)v8;

    [(MRUTransportButton *)v3->_decrementButton setShowHighlightCircle:0];
    [(MRUTransportButton *)v3->_decrementButton setPointerStyle:1];
    v10 = [(MRUTransportButton *)v3->_decrementButton imageView];
    [v10 setContentMode:1];

    [(MRUTransportButton *)v3->_decrementButton addTarget:v3 action:sel_decreaseTouchUpInside_ forControlEvents:64];
    [(MRUTransportButton *)v3->_decrementButton addTarget:v3 action:sel_decreaseButtonHoldBegan_ forControlEvents:0x1000000];
    [(MRUTransportButton *)v3->_decrementButton addTarget:v3 action:sel_decreaseButtonHoldReleased_ forControlEvents:0x2000000];
    [(MRUStepper *)v3 addSubview:v3->_decrementButton];
    uint64_t v11 = +[MPButton easyTouchButtonWithType:0];
    incrementButton = v3->_incrementButton;
    v3->_incrementButton = (MRUTransportButton *)v11;

    [(MRUTransportButton *)v3->_incrementButton setShowHighlightCircle:0];
    [(MRUTransportButton *)v3->_incrementButton setPointerStyle:1];
    v13 = [(MRUTransportButton *)v3->_incrementButton imageView];
    [v13 setContentMode:1];

    [(MRUTransportButton *)v3->_incrementButton addTarget:v3 action:sel_increaseTouchUpInside_ forControlEvents:64];
    [(MRUTransportButton *)v3->_incrementButton addTarget:v3 action:sel_increaseButtonHoldBegan_ forControlEvents:0x1000000];
    [(MRUTransportButton *)v3->_incrementButton addTarget:v3 action:sel_increaseButtonHoldReleased_ forControlEvents:0x2000000];
    [(MRUStepper *)v3 addSubview:v3->_incrementButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)MRUStepper;
  [(MRUStepper *)&v15 layoutSubviews];
  [(MRUStepper *)self bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  CGRectGetWidth(v16);
  UIRoundToViewScale();
  double v8 = v7;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v19);
  [(MRUStepper *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUTransportButton setFrame:](self->_decrementButton, "setFrame:");
  v20.origin.CGFloat x = MinX;
  v20.origin.CGFloat y = MinY;
  v20.size.CGFloat width = v8;
  v20.size.CGFloat height = v11;
  [(MRUTransportButton *)self->_decrementButton _setContinuousCornerRadius:CGRectGetHeight(v20) * 0.5];
  -[UIView setFrame:](self->_decrementBackground, "setFrame:", MinX, MinY, v8, v11);
  v21.origin.CGFloat x = MinX;
  v21.origin.CGFloat y = MinY;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v11;
  [(UIView *)self->_decrementBackground _setContinuousCornerRadius:CGRectGetHeight(v21) * 0.5];
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v12 = CGRectGetMaxX(v22) - v8;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v13 = CGRectGetMinY(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v24);
  [(MRUStepper *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUTransportButton setFrame:](self->_incrementButton, "setFrame:");
  v25.origin.CGFloat x = v12;
  v25.origin.CGFloat y = v13;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v14;
  [(MRUTransportButton *)self->_incrementButton _setContinuousCornerRadius:CGRectGetHeight(v25) * 0.5];
  -[UIView setFrame:](self->_incrementBackground, "setFrame:", v12, v13, v8, v14);
  v26.origin.CGFloat x = v12;
  v26.origin.CGFloat y = v13;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v14;
  [(UIView *)self->_incrementBackground _setContinuousCornerRadius:CGRectGetHeight(v26) * 0.5];
}

- (void)setDecrementImage:(id)a3
{
  objc_storeStrong((id *)&self->_decrementImage, a3);
  id v5 = a3;
  [(MRUTransportButton *)self->_decrementButton setImage:v5 forState:0];
}

- (void)setIncrementImage:(id)a3
{
  objc_storeStrong((id *)&self->_incrementImage, a3);
  id v5 = a3;
  [(MRUTransportButton *)self->_incrementButton setImage:v5 forState:0];
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
  id v5 = a3;
  [(MRUTransportButton *)self->_incrementButton setPreferredSymbolConfiguration:v5 forImageInState:0];
  [(MRUTransportButton *)self->_decrementButton setPreferredSymbolConfiguration:v5 forImageInState:0];
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  double v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUStepper *)self updateVisualStyling];
    [(MRUTransportButton *)self->_incrementButton setStylingProvider:v7];
    [(MRUTransportButton *)self->_decrementButton setStylingProvider:v7];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_BOOL dimmed = a3;
    -[MRUTransportButton setDimmed:](self->_incrementButton, "setDimmed:");
    BOOL dimmed = self->_dimmed;
    decrementButton = self->_decrementButton;
    [(MRUTransportButton *)decrementButton setDimmed:dimmed];
  }
}

- (void)decreaseTouchUpInside:(id)a3
{
  if (![(MPButton *)self->_decrementButton isHolding])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stepperDidDecrement:self];
  }
}

- (void)decreaseButtonHoldBegan:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [0 stepperDecrementHoldBegan:self];
  }
}

- (void)decreaseButtonHoldReleased:(id)a3
{
  if ([(MPButton *)self->_decrementButton isHolding] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [0 stepperDecrementHoldEnded:self];
  }
}

- (void)increaseTouchUpInside:(id)a3
{
  if (![(MPButton *)self->_incrementButton isHolding])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stepperDidIncrement:self];
  }
}

- (void)increaseButtonHoldBegan:(id)a3
{
  if ([(MPButton *)self->_incrementButton isHolding] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [0 stepperIncrementHoldBegan:self];
  }
}

- (void)increaseButtonHoldReleased:(id)a3
{
  if ([(MPButton *)self->_incrementButton isHolding] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [0 stepperIncrementHoldEnded:self];
  }
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:2 toView:self->_decrementBackground];
  stylingProvider = self->_stylingProvider;
  incrementBackground = self->_incrementBackground;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:2 toView:incrementBackground];
}

- (MRUStepperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUStepperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)decrementImage
{
  return self->_decrementImage;
}

- (UIImage)incrementImage
{
  return self->_incrementImage;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (UIView)decrementBackground
{
  return self->_decrementBackground;
}

- (void)setDecrementBackground:(id)a3
{
}

- (UIView)incrementBackground
{
  return self->_incrementBackground;
}

- (void)setIncrementBackground:(id)a3
{
}

- (MRUTransportButton)decrementButton
{
  return self->_decrementButton;
}

- (void)setDecrementButton:(id)a3
{
}

- (MRUTransportButton)incrementButton
{
  return self->_incrementButton;
}

- (void)setIncrementButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementButton, 0);
  objc_storeStrong((id *)&self->_decrementButton, 0);
  objc_storeStrong((id *)&self->_incrementBackground, 0);
  objc_storeStrong((id *)&self->_decrementBackground, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_incrementImage, 0);
  objc_storeStrong((id *)&self->_decrementImage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end