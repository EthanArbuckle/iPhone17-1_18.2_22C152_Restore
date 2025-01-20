@interface LUILogContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (LUILogContentViewControllerDelegate)delegate;
- (LUILogLocatorView)logLocatorView;
- (LUILogOptionsView)logOptionsView;
- (NSArray)screenshotItems;
- (UIActivityIndicatorView)spinner;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UILabel)scrollIndicatorView;
- (UIPanGestureRecognizer)panGesture;
- (UITextView)textView;
- (UIView)textViewHolderView;
- (_NSRange)_visibleRangeOfTextView:(id)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_createLogLocatorView;
- (id)_createLogOptionsView;
- (id)_createLogTextView;
- (id)_dateWithPercentage:(double)a3;
- (id)_generateScreenshotItem;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_applyScreenShotAnimation;
- (void)_setupButtonActions;
- (void)_setupTextViewGesture;
- (void)clearScreenshots;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)downArrowButtonTapped:(id)a3;
- (void)enableTimeConsumingOptions:(BOOL)a3;
- (void)handlePan:(id)a3;
- (void)loadView;
- (void)logOptionButtonTapped:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)screenshotButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogLocatorView:(id)a3;
- (void)setLogOptionsView:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setScreenshotItems:(id)a3;
- (void)setScrollIndicatorView:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTextViewHolderView:(id)a3;
- (void)showLogOptionsView;
- (void)showLogTextView;
- (void)showSpinner:(BOOL)a3;
- (void)upArrowButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LUILogContentViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)LUILogContentViewController;
  [(LUILogContentViewController *)&v5 viewDidLoad];
  [(LUILogContentViewController *)self _setupButtonActions];
  [(LUILogContentViewController *)self showLogOptionsView];
  [(LUILogContentViewController *)self enableTimeConsumingOptions:0];
  v3 = objc_opt_new();
  [(LUILogContentViewController *)self setScreenshotItems:v3];

  [(LUILogContentViewController *)self screenshotItems];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "self.screenshotItems");
  [(LUILogContentViewController *)self addObserver:self forKeyPath:v4 options:1 context:0];

  [(LUILogContentViewController *)self _setupTextViewGesture];
}

- (void)dealloc
{
  [(LUILogContentViewController *)self screenshotItems];

  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "self.screenshotItems");
  [(LUILogContentViewController *)self removeObserver:self forKeyPath:v3];

  v4.receiver = self;
  v4.super_class = (Class)LUILogContentViewController;
  [(LUILogContentViewController *)&v4 dealloc];
}

- (void)loadView
{
  v18.receiver = self;
  v18.super_class = (Class)LUILogContentViewController;
  [(LUILogContentViewController *)&v18 loadView];
  v3 = [(LUILogContentViewController *)self _createLogTextView];
  textView = self->_textView;
  self->_textView = v3;

  objc_super v5 = (UIView *)objc_opt_new();
  textViewHolderView = self->_textViewHolderView;
  self->_textViewHolderView = v5;

  [(UIView *)self->_textViewHolderView frame];
  -[UITextView setFrame:](self->_textView, "setFrame:");
  [(UITextView *)self->_textView setAutoresizingMask:18];
  [(UIView *)self->_textViewHolderView addSubview:self->_textView];
  v7 = [(LUILogContentViewController *)self _createLogOptionsView];
  logOptionsView = self->_logOptionsView;
  self->_logOptionsView = v7;

  v9 = [(LUILogContentViewController *)self _createLogLocatorView];
  logLocatorView = self->_logLocatorView;
  self->_logLocatorView = v9;

  v11 = [(LUILogContentViewController *)self view];
  [v11 frame];
  -[LUILogOptionsView setFrame:](self->_logOptionsView, "setFrame:");

  [(LUILogOptionsView *)self->_logOptionsView setAutoresizingMask:18];
  v12 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v12;

  v14 = [(LUILogContentViewController *)self view];
  [v14 addSubview:self->_spinner];

  v15 = [(LUILogContentViewController *)self view];
  [v15 addSubview:self->_textViewHolderView];

  v16 = [(LUILogContentViewController *)self view];
  [v16 addSubview:self->_logOptionsView];

  v17 = [(LUILogContentViewController *)self view];
  [v17 addSubview:self->_logLocatorView];
}

- (void)viewWillLayoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)LUILogContentViewController;
  [(LUILogContentViewController *)&v37 viewWillLayoutSubviews];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  objc_super v4 = [v3 delegate];
  objc_super v5 = [v4 window];
  v6 = [v5 windowScene];
  uint64_t v7 = [v6 interfaceOrientation];

  v8 = [(LUILogContentViewController *)self view];
  [v8 frame];
  double Width = CGRectGetWidth(v38);
  v10 = [(LUILogContentViewController *)self view];
  [v10 frame];
  if ((unint64_t)(v7 - 1) > 1)
  {
    double Height = CGRectGetHeight(*(CGRect *)&v11);
    v28 = [(LUILogContentViewController *)self textViewHolderView];
    objc_msgSend(v28, "setFrame:", 0.0, 0.0, Width + -150.0 + -10.0, Height);

    v17 = [(LUILogContentViewController *)self textViewHolderView];
    [v17 frame];
    CGFloat v29 = CGRectGetMaxX(v41) + 10.0;
    v19 = [(LUILogContentViewController *)self view];
    [v19 frame];
    CGFloat v30 = CGRectGetHeight(v42);
    v21 = [(LUILogContentViewController *)self logLocatorView];
    v22 = v21;
    double v26 = 150.0;
    double v25 = 0.0;
    double v24 = v29;
    double v23 = v30;
  }
  else
  {
    CGFloat v15 = CGRectGetHeight(*(CGRect *)&v11) + -150.0 + -10.0;
    v16 = [(LUILogContentViewController *)self textViewHolderView];
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, v15);

    v17 = [(LUILogContentViewController *)self textViewHolderView];
    [v17 frame];
    CGFloat v18 = CGRectGetMaxY(v39) + 10.0;
    v19 = [(LUILogContentViewController *)self view];
    [v19 frame];
    CGFloat v20 = CGRectGetWidth(v40);
    v21 = [(LUILogContentViewController *)self logLocatorView];
    v22 = v21;
    double v23 = 150.0;
    double v24 = 0.0;
    double v25 = v18;
    double v26 = v20;
  }
  objc_msgSend(v21, "setFrame:", v24, v25, v26, v23);

  v31 = [(LUILogContentViewController *)self textViewHolderView];
  [v31 center];
  double v33 = v32;
  double v35 = v34;
  v36 = [(LUILogContentViewController *)self spinner];
  objc_msgSend(v36, "setCenter:", v33, v35);
}

- (void)_setupButtonActions
{
  v3 = [(LUILogContentViewController *)self logOptionsView];
  objc_super v4 = [v3 tenMinutesLogButton];
  [v4 addTarget:self action:sel_logOptionButtonTapped_ forControlEvents:64];

  objc_super v5 = [(LUILogContentViewController *)self logOptionsView];
  v6 = [v5 halfHourButton];
  [v6 addTarget:self action:sel_logOptionButtonTapped_ forControlEvents:64];

  uint64_t v7 = [(LUILogContentViewController *)self logOptionsView];
  v8 = [v7 hourButton];
  [v8 addTarget:self action:sel_logOptionButtonTapped_ forControlEvents:64];

  v9 = [(LUILogContentViewController *)self logOptionsView];
  v10 = [v9 lastDayButton];
  [v10 addTarget:self action:sel_logOptionButtonTapped_ forControlEvents:64];

  uint64_t v11 = [(LUILogContentViewController *)self logOptionsView];
  v12 = [v11 streamButton];
  [v12 addTarget:self action:sel_logOptionButtonTapped_ forControlEvents:64];

  v13 = [(LUILogContentViewController *)self logLocatorView];
  v14 = [v13 screenshotButton];
  [v14 addTarget:self action:sel_screenshotButtonTapped_ forControlEvents:64];

  CGFloat v15 = [(LUILogContentViewController *)self logLocatorView];
  v16 = [v15 upArrowButton];
  [v16 addTarget:self action:sel_upArrowButtonTapped_ forControlEvents:64];

  id v18 = [(LUILogContentViewController *)self logLocatorView];
  v17 = [v18 downArrowButton];
  [v17 addTarget:self action:sel_downArrowButtonTapped_ forControlEvents:64];
}

- (void)_setupTextViewGesture
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_handlePan_];
  [(LUILogContentViewController *)self setPanGesture:v3];

  objc_super v4 = [(LUILogContentViewController *)self textView];
  objc_super v5 = [(LUILogContentViewController *)self panGesture];
  [v4 addGestureRecognizer:v5];

  id v6 = [(LUILogContentViewController *)self panGesture];
  [v6 setDelegate:self];
}

- (void)showLogOptionsView
{
  v3 = [(LUILogContentViewController *)self logOptionsView];
  [v3 setAlpha:1.0];

  objc_super v4 = [(LUILogContentViewController *)self textViewHolderView];
  [v4 setAlpha:0.0];

  id v5 = [(LUILogContentViewController *)self logLocatorView];
  [v5 setAlpha:0.0];
}

- (void)showLogTextView
{
  v3 = [(LUILogContentViewController *)self logOptionsView];
  [v3 setAlpha:0.0];

  objc_super v4 = [(LUILogContentViewController *)self textViewHolderView];
  [v4 setAlpha:1.0];

  id v5 = [(LUILogContentViewController *)self logLocatorView];
  [v5 setAlpha:1.0];
}

- (void)enableTimeConsumingOptions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(LUILogContentViewController *)self logOptionsView];
  id v6 = [v5 hourButton];
  uint64_t v7 = v6;
  if (v3)
  {
    [v6 setEnabled:1];

    id v11 = [(LUILogContentViewController *)self logOptionsView];
    v8 = [v11 lastDayButton];
    v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    [v6 setEnabled:0];

    id v11 = [(LUILogContentViewController *)self logOptionsView];
    v8 = [v11 lastDayButton];
    v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setEnabled:v10];
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(LUILogContentViewController *)self spinner];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (id)_createLogOptionsView
{
  v2 = objc_opt_new();

  return v2;
}

- (id)_createLogTextView
{
  v2 = objc_opt_new();
  [v2 setEditable:0];
  BOOL v3 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setTextColor:v3];

  [v2 setIndicatorStyle:2];
  objc_super v4 = [MEMORY[0x263F1C550] clearColor];
  [v2 setBackgroundColor:v4];

  id v5 = [v2 layoutManager];
  [v5 setAllowsNonContiguousLayout:1];

  return v2;
}

- (id)_createLogLocatorView
{
  BOOL v3 = objc_opt_new();
  objc_super v4 = [v3 screenshotCollectionView];
  [v4 setDelegate:self];

  id v5 = [v3 screenshotCollectionView];
  [v5 setDataSource:self];

  return v3;
}

- (id)_dateWithPercentage:(double)a3
{
  id v5 = [(LUILogContentViewController *)self delegate];
  id v6 = [v5 logContentViewControllerLogStartDate:self];

  uint64_t v7 = [(LUILogContentViewController *)self delegate];
  v8 = [v7 logContentViewControllerLogEndDate:self];

  [v8 timeIntervalSinceDate:v6];
  *(float *)&double v9 = v9 * a3;
  uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeInterval:v6 sinceDate:roundf(*(float *)&v9)];

  return v10;
}

- (UILabel)scrollIndicatorView
{
  scrollIndicatorView = self->_scrollIndicatorView;
  if (!scrollIndicatorView)
  {
    objc_super v4 = (UILabel *)objc_opt_new();
    [(UILabel *)v4 setClipsToBounds:1];
    id v5 = [(UILabel *)v4 layer];
    [v5 setCornerRadius:5.0];

    id v6 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v7 = [v6 colorWithAlphaComponent:0.699999988];
    [(UILabel *)v4 setBackgroundColor:v7];

    v8 = [MEMORY[0x263F1C550] darkGrayColor];
    [(UILabel *)v4 setTextColor:v8];

    double v9 = self->_scrollIndicatorView;
    self->_scrollIndicatorView = v4;

    scrollIndicatorView = self->_scrollIndicatorView;
  }

  return scrollIndicatorView;
}

- (void)clearScreenshots
{
}

- (id)_generateScreenshotItem
{
  BOOL v3 = objc_opt_new();
  objc_super v4 = [(LUILogContentViewController *)self textViewHolderView];
  [v4 bounds];
  v15.width = v5;
  v15.height = v6;
  UIGraphicsBeginImageContextWithOptions(v15, 1, 0.0);
  uint64_t v7 = [v4 layer];
  [v7 renderInContext:UIGraphicsGetCurrentContext()];

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v3 setScreenshotImage:v8];
  double v9 = [(LUILogContentViewController *)self textView];
  uint64_t v10 = [(LUILogContentViewController *)self _visibleRangeOfTextView:v9];
  objc_msgSend(v3, "setVisibleRange:", v10, v11);

  v12 = objc_opt_new();
  [v3 setScreenshotDate:v12];

  return v3;
}

- (_NSRange)_visibleRangeOfTextView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = objc_msgSend(v3, "characterRangeAtPoint:");
  v13 = [v12 start];

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGSize v15 = objc_msgSend(v3, "characterRangeAtPoint:", MaxX, CGRectGetMaxY(v24) + -10.0);
  v16 = [v15 end];

  v17 = [v3 beginningOfDocument];
  uint64_t v18 = [v3 offsetFromPosition:v17 toPosition:v13];
  uint64_t v19 = [v3 offsetFromPosition:v13 toPosition:v16];

  NSUInteger v20 = v18;
  NSUInteger v21 = v19;
  result.length = v21;
  result.location = v20;
  return result;
}

- (void)_applyScreenShotAnimation
{
  v2 = [(LUILogContentViewController *)self textViewHolderView];
  CGAffineTransformMakeScale(&v8, 1.2, 1.2);
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];
  id v3 = (void *)MEMORY[0x263F1CB60];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__LUILogContentViewController__applyScreenShotAnimation__block_invoke;
  v5[3] = &unk_265097790;
  id v6 = v2;
  id v4 = v2;
  [v3 animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:0.8 completion:1.0];
}

uint64_t __56__LUILogContentViewController__applyScreenShotAnimation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

- (void)logOptionButtonTapped:(id)a3
{
  id v15 = a3;
  id v4 = [(LUILogContentViewController *)self logOptionsView];
  id v5 = [v4 tenMinutesLogButton];

  if (v5 == v15)
  {
    double v13 = 600.0;
  }
  else
  {
    id v6 = [(LUILogContentViewController *)self logOptionsView];
    id v7 = [v6 halfHourButton];

    if (v7 == v15)
    {
      double v13 = 1800.0;
    }
    else
    {
      CGAffineTransform v8 = [(LUILogContentViewController *)self logOptionsView];
      id v9 = [v8 hourButton];

      if (v9 == v15)
      {
        double v13 = 3600.0;
      }
      else
      {
        double v10 = [(LUILogContentViewController *)self logOptionsView];
        id v11 = [v10 lastDayButton];

        if (v11 == v15)
        {
          double v13 = 86400.0;
        }
        else
        {
          v12 = [(LUILogContentViewController *)self logOptionsView];
          [v12 streamButton];

          double v13 = 0.0;
        }
      }
    }
  }
  v14 = [(LUILogContentViewController *)self delegate];
  [v14 logContentViewController:self didSelectLogOptionWithTimeInterval:v13];
}

- (void)screenshotButtonTapped:(id)a3
{
  id v6 = [(LUILogContentViewController *)self _generateScreenshotItem];
  id v4 = [(LUILogContentViewController *)self screenshotItems];
  id v5 = [v4 arrayByAddingObject:v6];
  [(LUILogContentViewController *)self setScreenshotItems:v5];

  [(LUILogContentViewController *)self _applyScreenShotAnimation];
}

- (void)upArrowButtonTapped:(id)a3
{
  id v3 = [(LUILogContentViewController *)self textView];
  objc_msgSend(v3, "scrollRangeToVisible:", 0, 0);
}

- (void)downArrowButtonTapped:(id)a3
{
  id v6 = [(LUILogContentViewController *)self textView];
  id v4 = [(LUILogContentViewController *)self textView];
  id v5 = [v4 text];
  objc_msgSend(v6, "scrollRangeToVisible:", objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4) - 1, 0);
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  id v5 = [(LUILogContentViewController *)self textViewHolderView];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  double v9 = v8;

  double v10 = [(LUILogContentViewController *)self textViewHolderView];
  [v10 frame];
  double v11 = CGRectGetWidth(v38) + -50.0;
  v12 = [(LUILogContentViewController *)self textViewHolderView];
  [v12 frame];
  CGFloat Height = CGRectGetHeight(v39);

  v14 = [(LUILogContentViewController *)self textViewHolderView];
  [v14 frame];
  double v15 = (v9 + -12.0) / (CGRectGetHeight(v40) + -24.0);

  double v16 = 0.0;
  if (v15 >= 0.0) {
    double v16 = v15;
  }
  double v17 = fmin(v16, 1.0);
  uint64_t v18 = [v4 state];

  if ((unint64_t)(v18 - 3) >= 3)
  {
    if (v18 != 2)
    {
      if (v18 != 1) {
        return;
      }
      NSUInteger v21 = [(LUILogContentViewController *)self textViewHolderView];
      v22 = [(LUILogContentViewController *)self scrollIndicatorView];
      [v21 addSubview:v22];

      CGRect v23 = [(LUILogContentViewController *)self textViewHolderView];
      CGRect v24 = [(LUILogContentViewController *)self scrollIndicatorView];
      [v23 bringSubviewToFront:v24];
    }
    v42.size.width = 50.0;
    v42.origin.y = 0.0;
    v42.origin.x = v11;
    v42.size.height = Height;
    v37.x = v7;
    v37.y = v9;
    BOOL v25 = CGRectContainsPoint(v42, v37);
    double v26 = [(LUILogContentViewController *)self scrollIndicatorView];
    id v34 = v26;
    if (!v25)
    {
      [v26 setAlpha:0.0];
      goto LABEL_14;
    }
    [v26 setAlpha:1.0];

    id v34 = [(LUILogContentViewController *)self _dateWithPercentage:v17];
    NSUInteger v20 = secondStringWithDate(v34);
    v27 = [(LUILogContentViewController *)self scrollIndicatorView];
    [v27 setText:v20];

    v28 = [(LUILogContentViewController *)self scrollIndicatorView];
    [v28 sizeToFit];

    CGFloat v29 = [(LUILogContentViewController *)self textViewHolderView];
    [v29 frame];
    CGFloat v30 = CGRectGetWidth(v43) + -50.0;
    v31 = [(LUILogContentViewController *)self scrollIndicatorView];
    [v31 frame];
    CGFloat v32 = v30 + CGRectGetWidth(v44) * -0.5;
    double v33 = [(LUILogContentViewController *)self scrollIndicatorView];
    objc_msgSend(v33, "setCenter:", v32, v9);
  }
  else
  {
    uint64_t v19 = [(LUILogContentViewController *)self scrollIndicatorView];
    [v19 removeFromSuperview];

    v41.size.width = 50.0;
    v41.origin.y = 0.0;
    v41.origin.x = v11;
    v41.size.height = Height;
    v36.x = v7;
    v36.y = v9;
    if (!CGRectContainsPoint(v41, v36)) {
      return;
    }
    id v34 = [(LUILogContentViewController *)self delegate];
    NSUInteger v20 = [(LUILogContentViewController *)self _dateWithPercentage:v17];
    [v34 logContentViewController:self didSelectDateForLog:v20];
  }

LABEL_14:
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(LUILogContentViewController *)self textViewHolderView];
  [v4 locationInView:v5];
  double v7 = v6;

  double v8 = [(LUILogContentViewController *)self textViewHolderView];
  [v8 frame];
  CGFloat v9 = CGRectGetWidth(v19) - v7;

  double v10 = [(LUILogContentViewController *)self textViewHolderView];
  [v4 velocityInView:v10];
  double v12 = v11;
  double v14 = v13;

  if (v9 >= 50.0 || fabs(v14) <= fabs(v12)) {
    return 0;
  }
  double v15 = [(LUILogContentViewController *)self textView];
  double v16 = [v15 text];
  BOOL v17 = v16 != 0;

  return v17;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  [(LUILogContentViewController *)self screenshotItems];

  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "self.screenshotItems");
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v11 = [(LUILogContentViewController *)self logLocatorView];
    double v10 = [v11 screenshotCollectionView];
    [v10 reloadData];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(LUILogContentViewController *)self screenshotItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"screenshotCell" forIndexPath:v7];
  if (collectionView_cellForItemAtIndexPath__onceToken != -1) {
    dispatch_once(&collectionView_cellForItemAtIndexPath__onceToken, &__block_literal_global_0);
  }
  int v9 = [(LUILogContentViewController *)self screenshotItems];
  double v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  id v11 = (void *)collectionView_cellForItemAtIndexPath__formatter;
  double v12 = [v10 screenshotDate];
  double v13 = [v11 stringFromDate:v12];

  double v14 = [v10 screenshotImage];
  double v15 = [v8 screenshotImageView];
  [v15 setImage:v14];

  double v16 = [v8 screenshotDateLabel];
  [v16 setText:v13];

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__LUILogContentViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v19[3] = &unk_265097A28;
  objc_copyWeak(&v21, &location);
  id v17 = v10;
  id v20 = v17;
  [v8 setClearButtonAction:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __69__LUILogContentViewController_collectionView_cellForItemAtIndexPath___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)collectionView_cellForItemAtIndexPath__formatter;
  collectionView_cellForItemAtIndexPath__formatter = (uint64_t)v0;

  long long v2 = (void *)collectionView_cellForItemAtIndexPath__formatter;

  return [v2 setDateFormat:@"HH:mm:ss.SSS"];
}

void __69__LUILogContentViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v2 = [WeakRetained screenshotItems];
  id v3 = (void *)[v2 mutableCopy];

  [v3 removeObject:*(void *)(a1 + 32)];
  id v4 = (void *)[v3 copy];
  [WeakRetained setScreenshotItems:v4];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(LUILogContentViewController *)self screenshotItems];
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  int v9 = [(LUILogContentViewController *)self textView];
  uint64_t v10 = [v12 visibleRange];
  objc_msgSend(v9, "scrollRangeToVisible:", v10, v11);

  [v7 deselectItemAtIndexPath:v6 animated:0];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 130.0;
  double v6 = 130.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 10.0;
  double v7 = 0.0;
  double v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UITextView)textView
{
  return self->_textView;
}

- (LUILogContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LUILogContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LUILogOptionsView)logOptionsView
{
  return self->_logOptionsView;
}

- (void)setLogOptionsView:(id)a3
{
}

- (LUILogLocatorView)logLocatorView
{
  return self->_logLocatorView;
}

- (void)setLogLocatorView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSArray)screenshotItems
{
  return self->_screenshotItems;
}

- (void)setScreenshotItems:(id)a3
{
}

- (UIView)textViewHolderView
{
  return self->_textViewHolderView;
}

- (void)setTextViewHolderView:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (void)setScrollIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollIndicatorView, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_textViewHolderView, 0);
  objc_storeStrong((id *)&self->_screenshotItems, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_logLocatorView, 0);
  objc_storeStrong((id *)&self->_logOptionsView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end