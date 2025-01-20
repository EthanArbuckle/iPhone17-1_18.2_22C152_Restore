@interface CCUISliderButtonModuleViewController
- (BOOL)providesOwnPlatter;
- (CCUIBaseSliderView)sliderView;
- (id)createSliderView;
- (id)viewForTouchContinuation;
- (void)_applyCompactContinuousCornerRadius;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUISliderButtonModuleViewController

- (CCUIBaseSliderView)sliderView
{
  [(CCUISliderButtonModuleViewController *)self loadViewIfNeeded];
  sliderView = self->_sliderView;
  return sliderView;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CCUISliderButtonModuleViewController;
  [(CCUIButtonModuleViewController *)&v8 viewDidLoad];
  v3 = [(CCUISliderButtonModuleViewController *)self createSliderView];
  [(CCUIBaseSliderView *)v3 setAutoresizingMask:18];
  [(CCUIBaseSliderView *)v3 setUserInteractionEnabled:0];
  [(CCUIBaseSliderView *)v3 setGlyphVisible:0];
  sliderView = self->_sliderView;
  self->_sliderView = v3;
  v5 = v3;

  v6 = [(CCUISliderButtonModuleViewController *)self view];
  v7 = [(CCUIButtonModuleViewController *)self buttonView];
  [v6 insertSubview:v5 belowSubview:v7];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CCUISliderButtonModuleViewController;
  id v7 = a4;
  -[CCUISliderButtonModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__CCUISliderButtonModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AD44D0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __91__CCUISliderButtonModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CCUISliderButtonModuleViewController;
  [(CCUIButtonModuleViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(CCUIButtonModuleViewController *)self buttonView];
  v4 = [(CCUISliderButtonModuleViewController *)self sliderView];
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    [v3 setAlpha:0.0];
    [v4 setValueVisible:1];
    [(CCUISliderButtonModuleViewController *)self preferredExpandedContinuousCornerRadius];
    objc_msgSend(v4, "setContinuousSliderCornerRadius:");
  }
  else
  {
    [v3 setAlpha:1.0];
    [v4 setValueVisible:0];
  }
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUISliderButtonModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v6, sel_willTransitionToExpandedContentMode_);
  objc_super v5 = [(CCUISliderButtonModuleViewController *)self sliderView];
  [v5 setUserInteractionEnabled:v3];
}

- (void)_applyCompactContinuousCornerRadius
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISliderButtonModuleViewController;
  [(CCUIButtonModuleViewController *)&v4 _applyCompactContinuousCornerRadius];
  BOOL v3 = [(CCUISliderButtonModuleViewController *)self sliderView];
  [(CCUIButtonModuleViewController *)self compactContinuousCornerRadius];
  objc_msgSend(v3, "setContinuousSliderCornerRadius:");
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (id)viewForTouchContinuation
{
  return self->_sliderView;
}

- (void).cxx_destruct
{
}

- (id)createSliderView
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  BOOL v3 = [CCUIBaseSliderView alloc];
  objc_super v4 = [(CCUISliderButtonModuleViewController *)self view];
  [v4 bounds];
  objc_super v5 = -[CCUIBaseSliderView initWithFrame:](v3, "initWithFrame:");

  return v5;
}

@end