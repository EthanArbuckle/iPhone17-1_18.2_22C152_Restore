@interface ICDocCamFilterViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BOOL)transitioning;
- (CGSize)contentSize;
- (DCSinglePixelHorizontalLineView)horizontalLineView;
- (DCSinglePixelVerticalLineView)verticalLineView;
- (ICDocCamFilterViewController)init;
- (ICDocCamFilterViewDelegate)filterViewDelegate;
- (NSArray)layoutConstraints;
- (NSLayoutConstraint)scrollViewBottomConstraint;
- (NSLayoutConstraint)scrollViewTrailingConstraint;
- (NSMutableArray)filterButtons;
- (UILongPressGestureRecognizer)longPressGesture;
- (UIScrollView)scrollView;
- (UIView)backgroundView;
- (double)bottomContentInset;
- (double)bottomOffset;
- (double)horizontalOffset;
- (id)filterButtonFromLocation:(CGPoint)a3;
- (signed)currentFilterType;
- (unint64_t)supportedInterfaceOrientations;
- (void)applyToAll:(signed __int16)a3;
- (void)centerContent:(BOOL)a3 isPortrait:(BOOL)a4;
- (void)dealloc;
- (void)filterSelected:(id)a3;
- (void)initializeFilters;
- (void)longPressGesture:(id)a3;
- (void)prepareToAnimateIn:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setBottomOffset:(double)a3;
- (void)setCurrentFilterType:(signed __int16)a3;
- (void)setFilterButtons:(id)a3;
- (void)setFilterViewDelegate:(id)a3;
- (void)setHorizontalLineView:(id)a3;
- (void)setHorizontalOffset:(double)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLongPressGesture:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewBottomConstraint:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setUpScrollView;
- (void)setVerticalLineView:(id)a3;
- (void)updateConstraints;
- (void)updateConstraintsPad;
- (void)updateConstraintsPhone;
- (void)updateScrollViewContentSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICDocCamFilterViewController

- (ICDocCamFilterViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamFilterViewController;
  v4 = [(ICDocCamFilterViewController *)&v6 initWithNibName:@"ICDocCamFilterViewController" bundle:v3];

  return v4;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)ICDocCamFilterViewController;
  [(ICDocCamFilterViewController *)&v17 viewDidLoad];
  v3 = [(ICDocCamFilterViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:1];

  v4 = [(ICDocCamFilterViewController *)self view];
  [v4 setAutoresizingMask:18];

  v5 = [MEMORY[0x263F1C550] clearColor];
  objc_super v6 = [(ICDocCamFilterViewController *)self view];
  [v6 setBackgroundColor:v5];

  v7 = [(ICDocCamFilterViewController *)self scrollView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(ICDocCamFilterViewController *)self scrollView];
  [v8 setAutoresizingMask:0];

  v9 = [(ICDocCamFilterViewController *)self scrollView];
  [v9 setScrollEnabled:0];

  v10 = [(ICDocCamFilterViewController *)self backgroundView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(ICDocCamFilterViewController *)self initializeFilters];
  v11 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_longPressGesture_];
  [(ICDocCamFilterViewController *)self setLongPressGesture:v11];

  v12 = [(ICDocCamFilterViewController *)self longPressGesture];
  [v12 setDelegate:self];

  v13 = [(ICDocCamFilterViewController *)self view];
  v14 = [(ICDocCamFilterViewController *)self longPressGesture];
  [v13 addGestureRecognizer:v14];

  v15 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v16 = [(ICDocCamFilterViewController *)self backgroundView];
  [v16 setBackgroundColor:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamFilterViewController;
  [(ICDocCamFilterViewController *)&v3 viewWillAppear:a3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)centerContent:(BOOL)a3 isPortrait:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    objc_super v6 = [(ICDocCamFilterViewController *)self scrollView];
    [v6 contentSize];
    double v8 = v7;
    double v10 = v9;

    v11 = [(ICDocCamFilterViewController *)self scrollView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    if (v4)
    {
      double v16 = (v13 - v8) * 0.5;
      if (v8 >= v13) {
        double v16 = 0.0;
      }
      double v17 = -v16;
      id v24 = [(ICDocCamFilterViewController *)self scrollView];
      objc_msgSend(v24, "setContentOffset:", v17, 0.0);
    }
    else
    {
      if (v10 >= v15) {
        double v18 = 0.0;
      }
      else {
        double v18 = (v15 - v10) * 0.5;
      }
      id v24 = [(ICDocCamFilterViewController *)self navigationController];
      v19 = [v24 navigationBar];
      [v19 bounds];
      double MaxY = CGRectGetMaxY(v26);
      [(ICDocCamFilterViewController *)self bottomContentInset];
      double v22 = -(v18 - (MaxY - v21) * -0.5);
      v23 = [(ICDocCamFilterViewController *)self scrollView];
      objc_msgSend(v23, "setContentOffset:", 0.0, v22);
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICDocCamFilterViewController;
  [(ICDocCamFilterViewController *)&v8 viewDidLayoutSubviews];
  [(ICDocCamFilterViewController *)self updateScrollViewContentSize];
  [(ICDocCamFilterViewController *)self updateConstraints];
  [(ICDocCamFilterViewController *)self setUpScrollView];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v7 andEffectiveInterfaceIdiom:&v6];
  BOOL v3 = v6 == 0;
  BOOL v4 = (unint64_t)([(UIViewController *)self dc_effectiveInterfaceOrientation]
                        - 1) < 2;
  v5 = [(ICDocCamFilterViewController *)self view];
  [v5 layoutIfNeeded];

  [(ICDocCamFilterViewController *)self centerContent:v3 isPortrait:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterViewController;
  id v7 = a4;
  -[ICDocCamFilterViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(ICDocCamFilterViewController *)self setTransitioning:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__ICDocCamFilterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_2642A92C0;
  v8[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_7 completion:v8];
}

uint64_t __83__ICDocCamFilterViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitioning:0];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  objc_msgSend(*(id *)(a1 + 32), "dc_getEffectiveInterfaceOrientation:andEffectiveInterfaceIdiom:", &v6, &v5);
  BOOL v2 = v5 == 0;
  BOOL v3 = (unint64_t)(objc_msgSend(*(id *)(a1 + 32), "dc_effectiveInterfaceOrientation") - 1) < 2;
  [*(id *)(a1 + 32) updateConstraints];
  [*(id *)(a1 + 32) setUpScrollView];
  return [*(id *)(a1 + 32) centerContent:v2 isPortrait:v3];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamFilterViewController;
  [(ICDocCamFilterViewController *)&v4 dealloc];
}

- (void)prepareToAnimateIn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v18 andEffectiveInterfaceIdiom:&v17];
  if ((DCDebugInterfaceEnabled() & 1) != 0 || ((unint64_t)(v18 - 3) >= 2 ? (BOOL v5 = v17 == 1) : (BOOL v5 = 1), v5))
  {
    [(ICDocCamFilterViewController *)self contentSize];
    -[ICDocCamFilterViewController setHorizontalOffset:](self, "setHorizontalOffset:");
    double v7 = 0.0;
  }
  else
  {
    [(ICDocCamFilterViewController *)self setHorizontalOffset:0.0];
    [(ICDocCamFilterViewController *)self contentSize];
    double v7 = v6;
  }
  [(ICDocCamFilterViewController *)self setBottomOffset:v7];
  [(ICDocCamFilterViewController *)self updateConstraints];
  objc_super v8 = (void *)MEMORY[0x263F1CB60];
  if (v3)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke;
    v16[3] = &unk_2642A9250;
    v16[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v16];
    [(ICDocCamFilterViewController *)self setHorizontalOffset:0.0];
    [(ICDocCamFilterViewController *)self setBottomOffset:0.0];
    [(ICDocCamFilterViewController *)self updateConstraints];
    objc_super v8 = (void *)MEMORY[0x263F1CB60];
    v14[4] = self;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_2;
    v15[3] = &unk_2642A9250;
    v15[4] = self;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_3;
    v14[3] = &unk_2642A92E8;
    double v9 = 0.05;
    double v10 = v15;
    v11 = v14;
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_4;
    v13[3] = &unk_2642A9250;
    v13[4] = self;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_5;
    v12[3] = &unk_2642A92E8;
    v12[4] = self;
    double v9 = 0.15;
    double v10 = v13;
    v11 = v12;
  }
  [v8 animateWithDuration:v10 animations:v11 completion:v9];
}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) horizontalLineView];
  BOOL v3 = [v2 layer];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];

  id v7 = [*(id *)(a1 + 32) verticalLineView];
  BOOL v5 = [v7 layer];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];
}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_3(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) horizontalLineView];
  BOOL v3 = [v2 layer];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];

  id v7 = [*(id *)(a1 + 32) verticalLineView];
  BOOL v5 = [v7 layer];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];
}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_4(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) horizontalLineView];
  BOOL v3 = [v2 layer];
  [v3 setOpacity:0.0];

  id v5 = [*(id *)(a1 + 32) verticalLineView];
  double v4 = [v5 layer];
  [v4 setOpacity:0.0];
}

void __51__ICDocCamFilterViewController_prepareToAnimateIn___block_invoke_5(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) horizontalLineView];
  BOOL v3 = [v2 layer];
  [v3 setOpacity:0.0];

  id v5 = [*(id *)(a1 + 32) verticalLineView];
  double v4 = [v5 layer];
  [v4 setOpacity:0.0];
}

- (void)setBottomContentInset:(double)a3
{
  if (self->_bottomContentInset != a3)
  {
    self->_bottomContentInset = a3;
    id v3 = [(ICDocCamFilterViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)updateConstraints
{
  id v3 = [(ICDocCamFilterViewController *)self layoutConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x263F08938];
    id v5 = [(ICDocCamFilterViewController *)self layoutConstraints];
    [v4 deactivateConstraints:v5];

    [(ICDocCamFilterViewController *)self setLayoutConstraints:0];
  }
  [(ICDocCamFilterViewController *)self setScrollViewBottomConstraint:0];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v7 andEffectiveInterfaceIdiom:&v6];
  if ((DCDebugInterfaceEnabled() & 1) != 0 || v6 == 1) {
    [(ICDocCamFilterViewController *)self updateConstraintsPad];
  }
  else {
    [(ICDocCamFilterViewController *)self updateConstraintsPhone];
  }
}

- (void)updateConstraintsPad
{
  id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [(ICDocCamFilterViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  uint64_t v6 = [(ICDocCamFilterViewController *)self scrollView];
  [v6 contentSize];
  double v8 = v7;

  double v9 = (v5 - v8) * 0.5;
  double v10 = [(ICDocCamFilterViewController *)self navigationController];
  v11 = [v10 navigationBar];
  [v11 frame];
  double MaxY = CGRectGetMaxY(v54);
  [(ICDocCamFilterViewController *)self bottomContentInset];
  double v14 = (MaxY - v13) * 0.5;

  double v15 = [(ICDocCamFilterViewController *)self backgroundView];
  double v16 = [v15 widthAnchor];
  uint64_t v17 = [v16 constraintEqualToConstant:128.0];
  [v52 addObject:v17];

  uint64_t v18 = [(ICDocCamFilterViewController *)self backgroundView];
  v19 = [v18 trailingAnchor];
  v20 = [(ICDocCamFilterViewController *)self view];
  double v21 = [v20 trailingAnchor];
  [(ICDocCamFilterViewController *)self horizontalOffset];
  double v22 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  [v52 addObject:v22];

  v23 = [(ICDocCamFilterViewController *)self backgroundView];
  id v24 = [v23 topAnchor];
  v25 = [(ICDocCamFilterViewController *)self view];
  CGRect v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v52 addObject:v27];

  v28 = [(ICDocCamFilterViewController *)self backgroundView];
  v29 = [v28 bottomAnchor];
  v30 = [(ICDocCamFilterViewController *)self view];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v52 addObject:v32];

  v33 = [(ICDocCamFilterViewController *)self scrollView];
  v34 = [v33 widthAnchor];
  v35 = [v34 constraintEqualToConstant:60.0];
  [v52 addObject:v35];

  v36 = [(ICDocCamFilterViewController *)self scrollView];
  v37 = [v36 trailingAnchor];
  v38 = [(ICDocCamFilterViewController *)self view];
  v39 = [v38 trailingAnchor];
  [(ICDocCamFilterViewController *)self horizontalOffset];
  v41 = [v37 constraintEqualToAnchor:v39 constant:v40 + -34.0];
  [v52 addObject:v41];

  v42 = [(ICDocCamFilterViewController *)self scrollView];
  v43 = [v42 topAnchor];
  v44 = [(ICDocCamFilterViewController *)self view];
  v45 = [v44 topAnchor];
  v46 = [v43 constraintEqualToAnchor:v45 constant:v9 + v14];
  [v52 addObject:v46];

  v47 = [(ICDocCamFilterViewController *)self scrollView];
  v48 = [v47 bottomAnchor];
  v49 = [(ICDocCamFilterViewController *)self view];
  v50 = [v49 bottomAnchor];
  v51 = [v48 constraintEqualToAnchor:v50 constant:v14 - v9];
  [v52 addObject:v51];

  [MEMORY[0x263F08938] activateConstraints:v52];
  [(ICDocCamFilterViewController *)self setLayoutConstraints:v52];
}

- (CGSize)contentSize
{
  id v3 = [(ICDocCamFilterViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  uint64_t v7 = v6;

  uint64_t v17 = 0;
  uint64_t v18 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v18 andEffectiveInterfaceIdiom:&v17];
  if ((DCDebugInterfaceEnabled() & 1) != 0 || ((unint64_t)(v18 - 3) >= 2 ? (BOOL v8 = v17 == 1) : (BOOL v8 = 1), v8))
  {
    int v9 = DCDebugInterfaceEnabled();
    if (v17 == 1) {
      int v10 = 1;
    }
    else {
      int v10 = v9;
    }
    double v11 = 34.0;
    if (!v10) {
      double v11 = 16.0;
    }
    double v12 = v11 * 2.0 + 60.0;
    double v13 = [(ICDocCamFilterViewController *)self view];
    objc_msgSend(v13, "dc_directionalSafeAreaInsets");
    double v5 = v12 + v14;
  }
  else
  {
    *(double *)&uint64_t v7 = 100.0;
  }
  double v15 = v5;
  double v16 = *(double *)&v7;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)updateConstraintsPhone
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v92 andEffectiveInterfaceIdiom:&v91];
  unint64_t v4 = v92 - 3;
  double v5 = [(ICDocCamFilterViewController *)self backgroundView];
  uint64_t v6 = v5;
  if (v4 > 1)
  {
    v34 = [v5 heightAnchor];
    v35 = [v34 constraintEqualToConstant:100.0];
    [v3 addObject:v35];

    v36 = [(ICDocCamFilterViewController *)self backgroundView];
    v37 = [v36 leadingAnchor];
    v38 = [(ICDocCamFilterViewController *)self view];
    v39 = [v38 leadingAnchor];
    double v40 = [v37 constraintEqualToAnchor:v39];
    [v3 addObject:v40];

    v41 = [(ICDocCamFilterViewController *)self backgroundView];
    v42 = [v41 trailingAnchor];
    v43 = [(ICDocCamFilterViewController *)self view];
    v44 = [v43 trailingAnchor];
    v45 = [v42 constraintEqualToAnchor:v44];
    [v3 addObject:v45];

    v46 = [(ICDocCamFilterViewController *)self backgroundView];
    v47 = [v46 bottomAnchor];
    v48 = [(ICDocCamFilterViewController *)self view];
    v49 = [v48 bottomAnchor];
    [(ICDocCamFilterViewController *)self bottomOffset];
    double v51 = v50;
    [(ICDocCamFilterViewController *)self bottomContentInset];
    v53 = [v47 constraintEqualToAnchor:v49 constant:v51 - v52];
    [v3 addObject:v53];

    CGRect v54 = [(ICDocCamFilterViewController *)self scrollView];
    v55 = [v54 heightAnchor];
    v56 = [v55 constraintEqualToConstant:60.0];
    [v3 addObject:v56];

    v57 = [(ICDocCamFilterViewController *)self scrollView];
    v58 = [v57 leadingAnchor];
    v59 = [(ICDocCamFilterViewController *)self view];
    v60 = [v59 leadingAnchor];
    v61 = [v58 constraintEqualToAnchor:v60];
    [v3 addObject:v61];

    v62 = [(ICDocCamFilterViewController *)self scrollView];
    v63 = [v62 trailingAnchor];
    v64 = [(ICDocCamFilterViewController *)self view];
    v65 = [v64 trailingAnchor];
    v66 = [v63 constraintEqualToAnchor:v65];
    [v3 addObject:v66];

    v67 = [(ICDocCamFilterViewController *)self scrollView];
    v68 = [v67 bottomAnchor];
    v69 = [(ICDocCamFilterViewController *)self view];
    v70 = [v69 bottomAnchor];
    [(ICDocCamFilterViewController *)self bottomOffset];
    double v72 = v71;
    [(ICDocCamFilterViewController *)self bottomContentInset];
    v74 = [v68 constraintEqualToAnchor:v70 constant:v72 - (v73 + 28.0)];
    [(ICDocCamFilterViewController *)self setScrollViewBottomConstraint:v74];

    v75 = [(ICDocCamFilterViewController *)self scrollViewBottomConstraint];
    [v3 addObject:v75];
  }
  else
  {
    uint64_t v7 = [v5 widthAnchor];
    BOOL v8 = [(ICDocCamFilterViewController *)self view];
    objc_msgSend(v8, "dc_directionalSafeAreaInsets");
    int v10 = [v7 constraintEqualToConstant:v9 + 92.0];
    [v3 addObject:v10];

    double v11 = [(ICDocCamFilterViewController *)self backgroundView];
    double v12 = [v11 trailingAnchor];
    double v13 = [(ICDocCamFilterViewController *)self view];
    double v14 = [v13 trailingAnchor];
    [(ICDocCamFilterViewController *)self horizontalOffset];
    double v15 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
    [v3 addObject:v15];

    double v16 = [(ICDocCamFilterViewController *)self backgroundView];
    uint64_t v17 = [v16 topAnchor];
    uint64_t v18 = [(ICDocCamFilterViewController *)self view];
    v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [v3 addObject:v20];

    double v21 = [(ICDocCamFilterViewController *)self backgroundView];
    double v22 = [v21 bottomAnchor];
    v23 = [(ICDocCamFilterViewController *)self view];
    id v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v3 addObject:v25];

    CGRect v26 = [(ICDocCamFilterViewController *)self scrollView];
    v27 = [v26 widthAnchor];
    v28 = [v27 constraintEqualToConstant:60.0];
    [v3 addObject:v28];

    v29 = [(ICDocCamFilterViewController *)self view];
    objc_msgSend(v29, "dc_directionalSafeAreaInsets");
    if (v30 == 0.0)
    {
      double v33 = 16.0;
    }
    else
    {
      v31 = [(ICDocCamFilterViewController *)self view];
      objc_msgSend(v31, "dc_directionalSafeAreaInsets");
      double v33 = v32;
    }
    v76 = [(ICDocCamFilterViewController *)self scrollView];
    v77 = [v76 trailingAnchor];
    v78 = [(ICDocCamFilterViewController *)self view];
    v79 = [v78 trailingAnchor];
    [(ICDocCamFilterViewController *)self horizontalOffset];
    v81 = [v77 constraintEqualToAnchor:v79 constant:v80 - v33];
    [v3 addObject:v81];

    v82 = [(ICDocCamFilterViewController *)self scrollView];
    v83 = [v82 topAnchor];
    v84 = [(ICDocCamFilterViewController *)self view];
    v85 = [v84 topAnchor];
    v86 = [v83 constraintEqualToAnchor:v85];
    [v3 addObject:v86];

    v75 = [(ICDocCamFilterViewController *)self scrollView];
    v87 = [v75 bottomAnchor];
    v88 = [(ICDocCamFilterViewController *)self view];
    v89 = [v88 bottomAnchor];
    v90 = [v87 constraintEqualToAnchor:v89];
    [v3 addObject:v90];
  }
  [MEMORY[0x263F08938] activateConstraints:v3];
  [(ICDocCamFilterViewController *)self setLayoutConstraints:v3];
}

- (void)filterSelected:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(ICDocCamFilterViewController *)self currentFilterType];
  if (v5 != [v4 filterType])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(ICDocCamFilterViewController *)self filterButtons];
    id v7 = (id)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          int v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v10 isSelected])
          {
            id v7 = v10;
            [v7 setSelected:0];
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    [v4 setSelected:1];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    objc_initWeak(&v16, v7);
    dispatch_time_t v11 = dispatch_time(0, 50000000);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__ICDocCamFilterViewController_filterSelected___block_invoke;
    v12[3] = &unk_2642A9B80;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &v16);
    dispatch_after(v11, MEMORY[0x263EF83A0], v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __47__ICDocCamFilterViewController_filterSelected___block_invoke(id *a1)
{
  BOOL v2 = a1 + 4;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v4 = [WeakRetained filterViewDelegate];
  id v5 = objc_loadWeakRetained(a1 + 5);
  int v6 = objc_msgSend(v4, "filterViewControllerDidSelectFilter:", objc_msgSend(v5, "filterType"));

  id v7 = objc_loadWeakRetained(a1 + 5);
  id v10 = v7;
  if (v6)
  {
    uint64_t v8 = [v7 filterType];
    id v9 = objc_loadWeakRetained(v2);
    [v9 setCurrentFilterType:v8];
  }
  else
  {
    [v7 setSelected:0];

    id v10 = objc_loadWeakRetained(a1 + 6);
    [v10 setSelected:1];
  }
}

- (void)initializeFilters
{
  id v3 = [(ICDocCamFilterViewController *)self filterButtons];

  if (!v3)
  {
    id v4 = [(ICDocCamFilterViewController *)self scrollView];
    [v4 setShowsVerticalScrollIndicator:0];

    id v5 = [(ICDocCamFilterViewController *)self scrollView];
    [v5 setShowsHorizontalScrollIndicator:0];

    int v6 = [(ICDocCamFilterViewController *)self scrollView];
    [v6 setDelegate:self];

    id v7 = [(ICDocCamFilterViewController *)self scrollView];
    [v7 setClipsToBounds:0];

    uint64_t v8 = [(ICDocCamFilterViewController *)self scrollView];
    [v8 setDelaysContentTouches:0];

    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t i = 0; i != 4; ++i)
    {
      id v10 = +[ICDocCamFilterButton filterButtonWithType:word_217928BBC[i]];
      [v10 addTarget:self action:sel_filterSelected_ forControlEvents:64];
      [v12 addObject:v10];
      dispatch_time_t v11 = [(ICDocCamFilterViewController *)self scrollView];
      [v11 addSubview:v10];
    }
    [(ICDocCamFilterViewController *)self setFilterButtons:v12];
    [(ICDocCamFilterViewController *)self setCurrentFilterType:[(ICDocCamFilterViewController *)self currentFilterType]];
  }
}

- (void)updateScrollViewContentSize
{
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v45 andEffectiveInterfaceIdiom:&v44];
  if ((DCDebugInterfaceEnabled() & 1) != 0 || v44 == 1)
  {
    double v21 = *MEMORY[0x263F001B0];
    double v22 = *(double *)(MEMORY[0x263F001B0] + 8);
    v23 = [(ICDocCamFilterViewController *)self filterButtons];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      unint64_t v25 = 0;
      do
      {
        CGRect v26 = [(ICDocCamFilterViewController *)self filterButtons];
        v27 = [v26 objectAtIndexedSubscript:v25];

        [v27 bounds];
        double v29 = v28;
        double v30 = [(ICDocCamFilterViewController *)self filterButtons];
        unint64_t v31 = [v30 count] - 1;

        if (v31 <= v25) {
          double v32 = v29;
        }
        else {
          double v32 = 101.0;
        }
        double v22 = v22 + v32;

        ++v25;
        double v33 = [(ICDocCamFilterViewController *)self filterButtons];
        unint64_t v34 = [v33 count];
      }
      while (v34 > v25);
    }
  }
  else
  {
    double v3 = 20.0;
    double v4 = 20.0;
    if ((unint64_t)(v45 - 3) <= 1)
    {
      id v5 = [(ICDocCamFilterViewController *)self view];
      int v6 = [v5 safeAreaLayoutGuide];
      [v6 layoutFrame];
      double Height = CGRectGetHeight(v46);

      if (Height > 322.0) {
        double v4 = 20.0;
      }
      else {
        double v4 = 8.0;
      }
    }
    uint64_t v8 = [(ICDocCamFilterViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;

    id v13 = [(ICDocCamFilterViewController *)self navigationController];
    id v14 = [v13 navigationBar];
    [v14 frame];
    CGFloat v15 = CGRectGetMaxY(v47) + v4 * 2.0;
    [(ICDocCamFilterViewController *)self bottomContentInset];
    double v17 = v15 + v16;

    if (v10 == 320.0) {
      double v3 = 8.0;
    }
    [(ICDocCamFilterViewController *)self bottomContentInset];
    BOOL v19 = v12 > 256.0 && v18 == 0.0;
    double v20 = v17 + 8.0;
    if (!v19) {
      double v20 = v17;
    }
    double v21 = v10 - v3 * 2.0;
    double v22 = v12 - v20;
  }
  v35 = [(ICDocCamFilterViewController *)self filterButtons];
  v36 = [v35 objectAtIndexedSubscript:0];

  if (v44)
  {
    [v36 size];
    double v38 = v37;
    v39 = [(ICDocCamFilterViewController *)self scrollView];
  }
  else
  {
    unint64_t v40 = v45 - 1;
    [v36 size];
    double v38 = v41;
    double v43 = v42;
    v39 = [(ICDocCamFilterViewController *)self scrollView];
    if (v40 <= 1)
    {
      double v38 = v21;
      double v22 = v43;
    }
  }
  objc_msgSend(v39, "setContentSize:", v38, v22);
}

- (void)setUpScrollView
{
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  [(UIViewController *)self dc_getEffectiveInterfaceOrientation:&v51 andEffectiveInterfaceIdiom:&v50];
  double v3 = (double *)MEMORY[0x263F001B0];
  double v4 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
  uint64_t v5 = v50;
  if ((unint64_t)(v51 - 3) <= 1 && v50 == 0)
  {
    double v9 = [(ICDocCamFilterViewController *)self view];
    double v10 = [v9 safeAreaLayoutGuide];
    [v10 layoutFrame];
    double Height = CGRectGetHeight(v52);

    BOOL v12 = Height > 322.0;
    if (Height > 322.0) {
      double v8 = 44.0;
    }
    else {
      double v8 = 40.0;
    }
    uint64_t v5 = v50;
    if (v12) {
      double v7 = 22.0;
    }
    else {
      double v7 = 26.0;
    }
  }
  else
  {
    double v7 = 8.0;
    double v8 = 60.0;
  }
  double v13 = *v3;
  double v14 = v3[1];
  if (v5)
  {
    char v15 = 0;
    double v16 = 16.0;
    double v17 = v3[1];
    double v18 = *v3;
  }
  else
  {
    BOOL v19 = [(ICDocCamFilterViewController *)self scrollView];
    [v19 contentSize];
    double v21 = v20;
    double v23 = v22;

    if ((unint64_t)(v51 - 1) > 1)
    {
      uint64_t v25 = [MEMORY[0x263F1C658] systemFontOfSize:11.0];

      CGRect v26 = [(ICDocCamFilterViewController *)self filterButtons];
      uint64_t v24 = [v26 firstObject];

      [v24 setIconSize:v8];
      [v24 bounds];
      double v28 = v23 - (v27 - v7);
      double v29 = [(ICDocCamFilterViewController *)self filterButtons];
      double v17 = v28 / (double)(unint64_t)([v29 count] - 1);

      char v15 = 0;
      double v16 = 14.0;
      double v4 = (void *)v25;
      double v18 = v13;
    }
    else
    {
      char v15 = objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL");
      uint64_t v24 = [(ICDocCamFilterViewController *)self filterButtons];
      double v18 = (v21 - v8) / (double)(unint64_t)([v24 count] - 1);
      double v16 = 20.0;
      double v17 = v14;
    }
  }
  double v30 = [(ICDocCamFilterViewController *)self filterButtons];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    unint64_t v32 = 0;
    uint64_t v33 = -1;
    do
    {
      unint64_t v34 = [(ICDocCamFilterViewController *)self filterButtons];
      v35 = v34;
      if (v15)
      {
        v36 = [(ICDocCamFilterViewController *)self filterButtons];
        double v37 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v36, "count") + v33);
      }
      else
      {
        double v37 = [v34 objectAtIndexedSubscript:v32];
      }

      double v38 = [v37 filterNameLabel];
      [v38 setFont:v4];

      v39 = [v37 labelVerticalSpacingConstraint];
      [v39 setConstant:v16];

      [v37 setIconSize:v8];
      [v37 bounds];
      double v42 = 0.0;
      if (!v50)
      {
        if ((unint64_t)(v51 - 1) <= 1)
        {
          if (v40 > 60.0) {
            double v40 = 60.0;
          }
          double v43 = 0.0;
          double v42 = v13;
          goto LABEL_32;
        }
        if (v40 <= 60.0) {
          double v42 = 0.0;
        }
        else {
          double v42 = (60.0 - v40) * 0.5;
        }
      }
      double v43 = v14;
LABEL_32:
      CGRect v53 = CGRectIntegral(*(CGRect *)&v42);
      objc_msgSend(v37, "setFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
      int v44 = DCDebugInterfaceEnabled();
      if (v50 == 1) {
        int v45 = 1;
      }
      else {
        int v45 = v44;
      }
      if (v45) {
        double v46 = v8 + 41.0;
      }
      else {
        double v46 = v17;
      }
      double v47 = -0.0;
      if (!v45) {
        double v47 = v18;
      }
      double v13 = v13 + v47;
      double v14 = v14 + v46;

      ++v32;
      v48 = [(ICDocCamFilterViewController *)self filterButtons];
      unint64_t v49 = [v48 count];

      --v33;
    }
    while (v49 > v32);
  }
}

- (void)setCurrentFilterType:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_currentFilterType = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(ICDocCamFilterViewController *)self filterButtons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "setSelected:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "filterType") == v3);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)filterButtonFromLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(ICDocCamFilterViewController *)self view];
  uint64_t v6 = objc_msgSend(v5, "hitTest:withEvent:", 0, x, y);

  if (v6)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v7 = [v6 superview];

      uint64_t v6 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = objc_opt_class();
  long long v9 = DCDynamicCast(v8, (uint64_t)v6);

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDocCamFilterViewController *)self longPressGesture];

  if (v5 == v4)
  {
    uint64_t v7 = [(ICDocCamFilterViewController *)self view];
    [v4 locationInView:v7];
    uint64_t v8 = -[ICDocCamFilterViewController filterButtonFromLocation:](self, "filterButtonFromLocation:");

    BOOL v6 = v8 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)applyToAll:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(ICDocCamFilterViewController *)self filterViewDelegate];
  [v5 filterViewControllerApplyToAll:v3];

  [(ICDocCamFilterViewController *)self setCurrentFilterType:v3];
}

- (void)longPressGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [(ICDocCamFilterViewController *)self view];
    [v4 locationInView:v5];
    BOOL v6 = -[ICDocCamFilterViewController filterButtonFromLocation:](self, "filterButtonFromLocation:");

    uint64_t v7 = [v6 filterType];
    uint64_t v8 = [(ICDocCamFilterViewController *)self filterViewDelegate];
    int v9 = [v8 filterViewControllerCanApplyToAll:v7];

    if (v9)
    {
      long long v10 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
      long long v11 = (void *)MEMORY[0x263F1C3F0];
      long long v12 = +[DCLocalization localizedStringForKey:@"Apply Filter to All Scans" value:@"Apply Filter to All Scans" table:@"Localizable"];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __49__ICDocCamFilterViewController_longPressGesture___block_invoke;
      v20[3] = &unk_2642A9BA8;
      v20[4] = self;
      __int16 v21 = v7;
      double v13 = [v11 actionWithTitle:v12 style:0 handler:v20];

      [v10 addAction:v13];
      [v10 setPreferredAction:v13];
      uint64_t v14 = (void *)MEMORY[0x263F1C3F0];
      char v15 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
      double v16 = [v14 actionWithTitle:v15 style:1 handler:&__block_literal_global_57];
      [v10 addAction:v16];

      double v17 = [v10 popoverPresentationController];
      double v18 = [v6 filterIconView];
      [v17 setSourceView:v18];

      BOOL v19 = [v6 filterIconView];
      [v19 bounds];
      objc_msgSend(v17, "setSourceRect:");

      [(ICDocCamFilterViewController *)self presentViewController:v10 animated:1 completion:0];
    }
  }
}

uint64_t __49__ICDocCamFilterViewController_longPressGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyToAll:*(__int16 *)(a1 + 40)];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (void)setHorizontalOffset:(double)a3
{
  self->_horizontalOffset = a3;
}

- (double)bottomOffset
{
  return self->_bottomOffset;
}

- (void)setBottomOffset:(double)a3
{
  self->_bottomOffset = a3;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (ICDocCamFilterViewDelegate)filterViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterViewDelegate);

  return (ICDocCamFilterViewDelegate *)WeakRetained;
}

- (void)setFilterViewDelegate:(id)a3
{
}

- (signed)currentFilterType
{
  return self->_currentFilterType;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void)setScrollViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewTrailingConstraint
{
  return self->_scrollViewTrailingConstraint;
}

- (UIView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);

  return (UIView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (DCSinglePixelVerticalLineView)verticalLineView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_verticalLineView);

  return (DCSinglePixelVerticalLineView *)WeakRetained;
}

- (void)setVerticalLineView:(id)a3
{
}

- (DCSinglePixelHorizontalLineView)horizontalLineView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_horizontalLineView);

  return (DCSinglePixelHorizontalLineView *)WeakRetained;
}

- (void)setHorizontalLineView:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (NSMutableArray)filterButtons
{
  return self->_filterButtons;
}

- (void)setFilterButtons:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_filterButtons, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_destroyWeak((id *)&self->_horizontalLineView);
  objc_destroyWeak((id *)&self->_verticalLineView);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_destroyWeak((id *)&self->_scrollView);

  objc_destroyWeak((id *)&self->_filterViewDelegate);
}

@end