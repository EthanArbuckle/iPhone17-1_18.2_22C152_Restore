@interface HACCContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAlwaysExpand;
- (CCUIContentModuleContentViewController)expandedViewController;
- (CGRect)collapsedFrame;
- (HACCContentModule)contentView;
- (HACCContentViewController)initWithContentModule:(unint64_t)a3 andDelegate:(id)a4;
- (UITapGestureRecognizer)tapRecognizer;
- (double)preferredExpandedContentHeight;
- (id)_axIdentifierForModule:(unint64_t)a3;
- (id)contentViewForControlType:(unint64_t)a3 module:(unint64_t)a4 delegate:(id)a5;
- (id)value;
- (unint64_t)controlTypeForModule:(unint64_t)a3;
- (void)_contentViewSubscribeListeners;
- (void)_contentViewUnsubscribeListeners;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)addExpandedView:(id)a3 shouldAlwaysExpand:(BOOL)a4;
- (void)removeExpandedView:(id)a3;
- (void)setCollapsedFrame:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setExpandedViewController:(id)a3;
- (void)setShouldAlwaysExpand:(BOOL)a3;
- (void)setTapRecognizer:(id)a3;
- (void)updateValue;
- (void)updateViewConstraints;
- (void)updateWithValue:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HACCContentViewController

- (HACCContentViewController)initWithContentModule:(unint64_t)a3 andDelegate:(id)a4
{
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HACCContentViewController;
  v7 = [(HACCContentViewController *)&v23 init];
  v8 = v7;
  if (v7)
  {
    v7->_controlType = [(HACCContentViewController *)v7 controlTypeForModule:a3];
    v9 = [(HACCContentViewController *)v8 view];
    v10 = [MEMORY[0x263F825C8] clearColor];
    [v9 setBackgroundColor:v10];

    v11 = [(HACCContentViewController *)v8 view];
    [v11 setOpaque:1];

    uint64_t v12 = [(HACCContentViewController *)v8 contentViewForControlType:v8->_controlType module:a3 delegate:v6];
    contentView = v8->_contentView;
    v8->_contentView = (HACCContentModule *)v12;

    v14 = [(HACCContentViewController *)v8 view];
    [v14 setTag:HUICCViewTagForModule(a3)];

    v15 = [(HACCContentViewController *)v8 view];
    [v15 addSubview:v8->_contentView];

    v16 = v8->_contentView;
    v17 = [(HACCContentViewController *)v8 _axIdentifierForModule:a3];
    [(HACCContentModule *)v16 setAccessibilityIdentifier:v17];

    v18 = v8->_contentView;
    v19 = [(HACCContentViewController *)v8 view];
    [v19 bounds];
    -[HACCContentModule setFrame:](v18, "setFrame:");

    [(HACCContentModule *)v8->_contentView setDelegate:v6];
    [(HACCContentModule *)v8->_contentView setModule:a3];
    [(HACCContentModule *)v8->_contentView setAutoresizingMask:18];
    [(HACCContentModule *)v8->_contentView updateValue];
    [(HACCContentViewController *)v8 updateViewConstraints];
    v20 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v8 action:sel__handleTapGestureRecognizer_];
    [v20 setDelegate:v8];
    v21 = [(HACCContentViewController *)v8 view];
    [v21 addGestureRecognizer:v20];

    [(HACCContentViewController *)v8 setTapRecognizer:v20];
  }

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HACCContentViewController;
  [(HACCContentViewController *)&v4 viewWillAppear:a3];
  [(HACCContentViewController *)self _contentViewSubscribeListeners];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HACCContentViewController;
  [(HACCContentViewController *)&v4 viewDidDisappear:a3];
  [(HACCContentViewController *)self _contentViewUnsubscribeListeners];
}

- (void)_contentViewSubscribeListeners
{
  if (objc_opt_respondsToSelector())
  {
    contentView = self->_contentView;
    [(HACCContentModule *)contentView subscribeListeners];
  }
}

- (void)_contentViewUnsubscribeListeners
{
  if (objc_opt_respondsToSelector())
  {
    contentView = self->_contentView;
    [(HACCContentModule *)contentView unsubscribeListeners];
  }
}

- (void)updateValue
{
}

- (void)updateWithValue:(id)a3
{
  id v14 = a3;
  if ([(HACCContentModule *)self->_contentView module] == 23
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = *MEMORY[0x263F47508];
    id v5 = v14;
    id v6 = [v5 objectForKey:v4];
    [v6 floatValue];
    float v8 = v7;

    v9 = [v5 objectForKey:*MEMORY[0x263F47500]];
    [v9 floatValue];
    float v11 = v10;

    uint64_t v12 = [v5 objectForKey:*MEMORY[0x263F47510]];

    uint64_t v13 = [v12 unsignedIntegerValue];
    [(HACCContentModule *)self->_contentView updateViewsWithSlowLeq:v13 fastLeq:v8 andThreshold:v11];
  }
  else
  {
    [(HACCContentModule *)self->_contentView updateValue];
  }
}

- (id)value
{
  return (id)[(HACCContentModule *)self->_contentView contentValue];
}

- (void)updateViewConstraints
{
  v8.receiver = self;
  v8.super_class = (Class)HACCContentViewController;
  [(HACCContentViewController *)&v8 updateViewConstraints];
  v3 = [(HACCContentViewController *)self view];
  uint64_t v4 = [(HACCContentViewController *)self view];
  id v5 = [v4 constraints];
  [v3 removeConstraints:v5];

  [(HACCContentModule *)self->_contentView setHidden:0];
  [(HACCContentModule *)self->_contentView updateConstraints];
  contentView = self->_contentView;
  float v7 = [(HACCContentViewController *)self view];
  [v7 bounds];
  -[HACCContentModule setFrame:](contentView, "setFrame:");
}

- (unint64_t)controlTypeForModule:(unint64_t)a3
{
  if (a3 > 0x23) {
    return 1;
  }
  else {
    return qword_226B99ED8[a3];
  }
}

- (id)contentViewForControlType:(unint64_t)a3 module:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 0uLL:
      uint64_t v12 = HACCStatusView;
      goto LABEL_8;
    case 1uLL:
      float v11 = [[HACCSlider alloc] initWithModule:a4 andDelegate:v8];
      goto LABEL_18;
    case 2uLL:
      uint64_t v12 = HUICCBackgroundSoundsButton;
      goto LABEL_8;
    case 3uLL:
      if ([v8 shouldShowHeadphoneLevelUnavailable])
      {
        uint64_t v12 = HUIHeadphoneLevelUnavailableView;
LABEL_8:
        id v13 = [v12 alloc];
        float v11 = (HACCSlider *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      }
      else
      {
        id v14 = HUIHeadphoneLevelView;
LABEL_17:
        float v11 = (HACCSlider *)objc_alloc_init(v14);
      }
LABEL_18:
      v15 = (HUICCMenuTextView *)v11;
LABEL_19:

      return v15;
    case 4uLL:
      id v14 = HACCLiveListenButton;
      goto LABEL_17;
    case 5uLL:
      id v14 = HACCPMEToggle;
      goto LABEL_17;
    case 6uLL:
      id v14 = HACCPSESettings;
      goto LABEL_17;
    case 7uLL:
    case 9uLL:
      float v10 = [HUICCMenuCheckmarkView alloc];
      float v11 = -[HUICCMenuCheckmarkView initWithFrame:andModule:](v10, "initWithFrame:andModule:", a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      goto LABEL_18;
    case 8uLL:
      id v14 = HACCSSLButton;
      goto LABEL_17;
    case 0xAuLL:
      v15 = [[HUICCMenuTextView alloc] initWithModule:a4 andDelegate:v8];
      objc_initWeak(&location, v15);
      objc_initWeak(&from, self);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __71__HACCContentViewController_contentViewForControlType_module_delegate___block_invoke;
      v17[3] = &unk_2647CDB38;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      [(HUICCMenuTextView *)v15 setPresentVCBlock:v17];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_19;
    case 0xBuLL:
      float v11 = [[HUICCFooterView alloc] initWithModule:a4];
      goto LABEL_18;
    default:
      v15 = 0;
      goto LABEL_19;
  }
}

void __71__HACCContentViewController_contentViewForControlType_module_delegate___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [v3 willTransitionToExpandedContentMode:1];
  uint64_t v4 = a1 + 4;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained presentViewController:v3 animated:1 completion:0];

  [v3 didTransitionToExpandedContentMode:1];
  a1 += 5;
  id v6 = objc_loadWeakRetained(a1);
  float v7 = [v6 delegate];
  [v7 updateView];

  id v10 = objc_loadWeakRetained(a1);
  id v8 = [v10 delegate];
  id v9 = objc_loadWeakRetained(v4);
  [v8 viewController:v9 didExpand:1];
}

- (void)addExpandedView:(id)a3 shouldAlwaysExpand:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = self->_contentView;
    [(HACCContentModule *)v6 addExpandedView:v7];
    if (v4 && [(HACCContentModule *)v6 supportsExpanding])
    {
      [(HACCContentModule *)v6 setIsExpanded:1];
      [(HACCContentViewController *)self setShouldAlwaysExpand:1];
    }
  }
}

- (void)removeExpandedView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(HACCContentModule *)self->_contentView removeExpandedView:v4];
  }
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v5 = a3;
  if ((!v5 || [v5 state] == 3)
    && ![(HACCContentViewController *)self shouldAlwaysExpand])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = self->_contentView;
      if ([(HACCContentModule *)v4 supportsExpanding]) {
        [(HACCContentModule *)v4 setIsExpanded:[(HACCContentModule *)v4 isExpanded] ^ 1];
      }
      else {
        [(HACCContentModule *)v4 buttonTapped];
      }
    }
  }
}

- (id)_axIdentifierForModule:(unint64_t)a3
{
  if (a3 > 0x23) {
    return 0;
  }
  else {
    return off_2647CDB58[a3];
  }
}

- (double)preferredExpandedContentHeight
{
  return self->preferredExpandedContentHeight;
}

- (CGRect)collapsedFrame
{
  double x = self->_collapsedFrame.origin.x;
  double y = self->_collapsedFrame.origin.y;
  double width = self->_collapsedFrame.size.width;
  double height = self->_collapsedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCollapsedFrame:(CGRect)a3
{
  self->_collapsedFrame = a3;
}

- (HACCContentModule)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CCUIContentModuleContentViewController)expandedViewController
{
  return self->_expandedViewController;
}

- (void)setExpandedViewController:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (BOOL)shouldAlwaysExpand
{
  return self->_shouldAlwaysExpand;
}

- (void)setShouldAlwaysExpand:(BOOL)a3
{
  self->_shouldAlwaysExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_expandedViewController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
}

@end