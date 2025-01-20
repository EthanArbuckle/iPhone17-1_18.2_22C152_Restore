@interface GKBaseComposeController
- (BOOL)_gkWantsCustomRightBarButtonItemInViewService;
- (BOOL)showHeaderFieldContainer;
- (CGRect)lastKnownKeyboardFrame;
- (GKBaseComposeController)init;
- (GKContiguousContainerView)headerFieldContainer;
- (GKTextView)messageField;
- (NSArray)composeHeaderFields;
- (NSLayoutConstraint)contentHeightConstraint;
- (NSLayoutConstraint)contentLeadingConstraint;
- (NSLayoutConstraint)messageFieldTrailingConstraint;
- (UIEdgeInsets)margins;
- (UIScrollView)backgroundView;
- (UIView)contentView;
- (UIView)intendedFirstResponder;
- (double)scrollContentInsetAdjustY;
- (id)viewMetricsForContainerView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustContentInsetForShowingKeyboard:(BOOL)a3;
- (void)_scrollSelectedTextToVisible;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)keyboardWillHideShow:(id)a3;
- (void)loadView;
- (void)setBackgroundView:(id)a3;
- (void)setComposeHeaderFields:(id)a3;
- (void)setContentHeightConstraint:(id)a3;
- (void)setContentLeadingConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setHeaderFieldContainer:(id)a3;
- (void)setIntendedFirstResponder:(id)a3;
- (void)setLastKnownKeyboardFrame:(CGRect)a3;
- (void)setMessageField:(id)a3;
- (void)setMessageFieldText:(id)a3;
- (void)setMessageFieldTrailingConstraint:(id)a3;
- (void)setScrollContentInsetAdjustY:(double)a3;
- (void)setShowHeaderFieldContainer:(BOOL)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKBaseComposeController

- (GKBaseComposeController)init
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)GKBaseComposeController;
  v2 = [(GKLoadableContentViewController *)&v27 init];
  v3 = v2;
  if (v2)
  {
    [(GKBaseComposeController *)v2 setShowHeaderFieldContainer:1];
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    v5 = [MEMORY[0x1E4F639B0] sharedPalette];
    [v4 setBounces:1];
    [v4 setAlwaysBounceVertical:1];
    objc_msgSend(v4, "setContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v11;

    [(UIView *)v3->_contentView setBackgroundColor:0];
    [(UIView *)v3->_contentView setOpaque:0];
    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addSubview:v3->_contentView];
    objc_storeStrong((id *)&v3->_backgroundView, v4);
    v13 = -[GKTextView initWithFrame:]([GKTextView alloc], "initWithFrame:", v7, v8, v9, v10);
    [(GKTextView *)v13 setDelegate:v3];
    [(GKTextView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKTextView *)v13 setBackgroundColor:0];
    [(GKTextView *)v13 setOpaque:0];
    [(GKTextView *)v13 setScrollEnabled:0];
    v14 = [MEMORY[0x1E4F639F8] textStyle];
    v15 = [v14 composeMessage];
    v16 = [v15 emphasized];
    [(GKTextView *)v13 applyTextStyle:v16];

    [(UIView *)v3->_contentView addSubview:v13];
    objc_storeStrong((id *)&v3->_messageField, v13);
    LODWORD(v17) = 1148846080;
    [(GKTextView *)v3->_messageField setContentCompressionResistancePriority:1 forAxis:v17];
    uint64_t v18 = +[GKContiguousContainerView containerViewForViews:0 overlap:1 vertical:0.0];
    headerFieldContainer = v3->_headerFieldContainer;
    v3->_headerFieldContainer = (GKContiguousContainerView *)v18;

    [(UIView *)v3->_contentView addSubview:v3->_headerFieldContainer];
    [(GKBaseComposeController *)v3 setIntendedFirstResponder:v13];
    v20 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v21 = [v20 userInterfaceIdiom];

    if (v21 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38]))
    {
      [v4 setOpaque:0];
      [v4 setBackgroundColor:0];
    }
    else
    {
      [v4 setOpaque:1];
      v22 = [v5 viewBackgroundColor];
      [v4 setBackgroundColor:v22];
    }
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v3 selector:sel_keyboardWillHideShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v3 selector:sel_keyboardWillHideShow_ name:*MEMORY[0x1E4FB2C50] object:0];

    v28[0] = v3->_backgroundView;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [(GKLoadableContentViewController *)v3 setViewsToHideWhileLoading:v25];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKBaseComposeController;
  [(GKBaseComposeController *)&v4 dealloc];
}

- (void)setComposeHeaderFields:(id)a3
{
  p_composeHeaderFields = &self->_composeHeaderFields;
  double v7 = (NSArray *)a3;
  if (*p_composeHeaderFields != v7)
  {
    id v6 = [(GKBaseComposeController *)self headerFieldContainer];
    [v6 replaceSubviews:v7];
    objc_storeStrong((id *)p_composeHeaderFields, a3);
  }
}

- (BOOL)_gkWantsCustomRightBarButtonItemInViewService
{
  return 1;
}

- (void)_adjustContentInsetForShowingKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1)
  {
    double scrollContentInsetAdjustY = self->_scrollContentInsetAdjustY;
    if (v3)
    {
      if (scrollContentInsetAdjustY > 0.0) {
        [(GKBaseComposeController *)self _adjustContentInsetForShowingKeyboard:0];
      }
      [(UIScrollView *)self->_backgroundView contentInset];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      CGFloat height = self->_lastKnownKeyboardFrame.size.height;
      self->_double scrollContentInsetAdjustY = height;
      double v16 = v15 + height;
      [(UIScrollView *)self->_backgroundView setContentInset:v9];
      -[UIScrollView setScrollIndicatorInsets:](self->_backgroundView, "setScrollIndicatorInsets:", v9, v11, v16, v13);
      double scrollContentInsetAdjustY = self->_scrollContentInsetAdjustY;
    }
    else if (scrollContentInsetAdjustY > 0.0)
    {
      [(UIScrollView *)self->_backgroundView contentInset];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23 - self->_scrollContentInsetAdjustY;
      [(UIScrollView *)self->_backgroundView setContentInset:v17];
      -[UIScrollView setScrollIndicatorInsets:](self->_backgroundView, "setScrollIndicatorInsets:", v18, v20, v24, v22);
      self->_double scrollContentInsetAdjustY = 0.0;
      double scrollContentInsetAdjustY = 0.0;
    }
    double v25 = -scrollContentInsetAdjustY;
    contentHeightConstraint = self->_contentHeightConstraint;
    [(NSLayoutConstraint *)contentHeightConstraint setConstant:v25];
  }
}

- (void)keyboardWillHideShow:(id)a3
{
  id v18 = a3;
  objc_super v4 = [v18 name];
  uint64_t v5 = [v4 isEqual:*MEMORY[0x1E4FB2C58]];

  if (v5)
  {
    uint64_t v6 = [(GKBaseComposeController *)self view];
    double v7 = [v6 window];
    double v8 = [v18 userInfo];
    double v9 = [v8 objectForKey:*MEMORY[0x1E4FB2BD8]];
    [v9 CGRectValue];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v7, "convertRect:fromWindow:", 0, v11, v13, v15, v17);
    objc_msgSend(v6, "convertRect:fromView:", 0);
    -[GKBaseComposeController setLastKnownKeyboardFrame:](self, "setLastKnownKeyboardFrame:");
  }
  [(GKBaseComposeController *)self _adjustContentInsetForShowingKeyboard:v5];
}

- (id)viewMetricsForContainerView:(id)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  [a3 frame];
  double v4 = v3;
  v10[0] = &unk_1F08121E0;
  v9[0] = @"headerLeftMargin";
  v9[1] = @"headerWidth";
  uint64_t v5 = [NSNumber numberWithDouble:v3 + -15.0];
  v10[1] = v5;
  v10[2] = &unk_1F08121F8;
  v9[2] = @"bodyLeftMargin";
  v9[3] = @"bodyRightMargin";
  v10[3] = &unk_1F08121F8;
  v9[4] = @"bodyWidth";
  uint64_t v6 = [NSNumber numberWithDouble:v4 + -20.0];
  v10[4] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (void)loadView
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)GKBaseComposeController;
  [(GKViewController *)&v30 loadView];
  double v3 = [(GKBaseComposeController *)self view];
  double v4 = [MEMORY[0x1E4F639B0] sharedPalette];
  uint64_t v5 = v4;
  if (*MEMORY[0x1E4F63830]) {
    [v4 viewBackgroundColor];
  }
  else {
  uint64_t v6 = [v4 windowBackgroundColor];
  }
  [v3 setBackgroundColor:v6];

  [v3 addSubview:self->_backgroundView];
  backgroundView = self->_backgroundView;
  v31[0] = @"scroll";
  v31[1] = @"content";
  contentView = self->_contentView;
  v32[0] = backgroundView;
  v32[1] = contentView;
  headerFieldContainer = self->_headerFieldContainer;
  v31[2] = @"header";
  v31[3] = @"message";
  messageField = self->_messageField;
  v32[2] = headerFieldContainer;
  v32[3] = messageField;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
  double v12 = self->_contentView;
  double v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[message]" options:0 metrics:0 views:v11];
  [(UIView *)v12 addConstraints:v13];

  if ([(GKBaseComposeController *)self showHeaderFieldContainer])
  {
    double v14 = self->_contentView;
    double v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[header]|" options:0 metrics:0 views:v11];
    [(UIView *)v14 addConstraints:v15];

    double v16 = self->_contentView;
    double v17 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[header]-16-[message]|" options:0 metrics:0 views:v11];
    [(UIView *)v16 addConstraints:v17];
  }
  id v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[scroll]|" options:0 metrics:0 views:v11];
  [v3 addConstraints:v18];

  double v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[scroll]|" options:0 metrics:0 views:v11];
  [v3 addConstraints:v19];

  double v20 = self->_backgroundView;
  double v21 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[content]|" options:0 metrics:0 views:v11];
  [(UIScrollView *)v20 addConstraints:v21];

  double v22 = self->_backgroundView;
  double v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:6 relatedBy:0 toItem:v22 attribute:6 multiplier:1.0 constant:0.0];
  [(UIScrollView *)v22 addConstraint:v23];

  double v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:6 relatedBy:0 toItem:v3 attribute:6 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v24];

  double v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:8 relatedBy:1 toItem:v3 attribute:8 multiplier:1.0 constant:0.0];
  [(GKBaseComposeController *)self setContentHeightConstraint:v25];

  [v3 addConstraint:self->_contentHeightConstraint];
  if (*MEMORY[0x1E4F63830]) {
    uint64_t v26 = 5;
  }
  else {
    uint64_t v26 = 17;
  }
  if (*MEMORY[0x1E4F63830]) {
    uint64_t v27 = 6;
  }
  else {
    uint64_t v27 = 18;
  }
  v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:5 relatedBy:0 toItem:v3 attribute:v26 multiplier:1.0 constant:0.0];
  [(GKBaseComposeController *)self setContentLeadingConstraint:v28];

  v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_messageField attribute:6 relatedBy:0 toItem:v3 attribute:v27 multiplier:1.0 constant:0.0];
  [(GKBaseComposeController *)self setMessageFieldTrailingConstraint:v29];

  [v3 addConstraint:self->_contentLeadingConstraint];
  [v3 addConstraint:self->_messageFieldTrailingConstraint];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)GKBaseComposeController;
  [(GKBaseComposeController *)&v9 viewDidLayoutSubviews];
  [(UIView *)self->_contentView bounds];
  -[UIScrollView setContentSize:](self->_backgroundView, "setContentSize:", v3, v4);
  if (*MEMORY[0x1E4F63830])
  {
    [(NSLayoutConstraint *)self->_contentLeadingConstraint constant];
    if (v5 == 0.0)
    {
      [(GKBaseComposeController *)self margins];
      double v7 = v6;
      [(NSLayoutConstraint *)self->_contentLeadingConstraint setConstant:v8];
      [(NSLayoutConstraint *)self->_messageFieldTrailingConstraint setConstant:-v7];
    }
  }
}

- (UIEdgeInsets)margins
{
  double v3 = [(GKBaseComposeController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (v7 == 0.0)
  {
    double v12 = [(GKBaseComposeController *)self view];
    [v12 _contentMargin];
    double v7 = v13;

    if (v7 == 0.0)
    {
      double v14 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      if (v15 != 1 || (double v7 = 20.0, *MEMORY[0x1E4F63830]) && !*MEMORY[0x1E4F63A38])
      {
        double v16 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v17 = [v16 userInterfaceIdiom];

        double v7 = 15.0;
        if (!v17)
        {
          if (([MEMORY[0x1E4FB1BA8] mainScreen],
                id v18 = objc_claimAutoreleasedReturnValue(),
                [v18 bounds],
                double v20 = v19,
                double v22 = v21,
                v18,
                v20 >= 414.0)
            && v22 >= 736.0
            || (v22 >= 414.0 ? (BOOL v23 = v20 < 736.0) : (BOOL v23 = 1), !v23))
          {
            double v7 = 20.0;
          }
        }
      }
    }
  }
  if (v11 == 0.0) {
    double v24 = v7;
  }
  else {
    double v24 = v11;
  }
  double v25 = v5;
  double v26 = v7;
  double v27 = v9;
  result.right = v24;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKBaseComposeController;
  [(GKViewController *)&v5 viewWillAppear:a3];
  double v4 = [(GKLoadableContentViewController *)self loadingState];

  if (v4 == @"Initial")
  {
    [(GKLoadableContentViewController *)self setLoadingState:@"LoadingState"];
    [(GKLoadableContentViewController *)self setLoadingState:@"LoadedState"];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKBaseComposeController;
  -[GKViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  if (v3)
  {
    objc_super v5 = [(GKBaseComposeController *)self backgroundView];
    [v5 flashScrollIndicators];
  }
  double v6 = [(GKBaseComposeController *)self intendedFirstResponder];
  [v6 becomeFirstResponder];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = (unsigned char *)MEMORY[0x1E4F63830];
  if (*MEMORY[0x1E4F63830]) {
    return 30;
  }
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1 && (!*v2 || *MEMORY[0x1E4F63A38] != 0)) {
    return 30;
  }
  objc_super v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8) {
    return 2;
  }
  double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  BOOL v14 = v11 < 414.0 || v13 < 736.0;
  if (v14 && (v13 >= 414.0 ? (BOOL v15 = v11 < 736.0) : (BOOL v15 = 1), v15)) {
    return 2;
  }
  else {
    return 30;
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKBaseComposeController;
  [(GKBaseComposeController *)&v5 didRotateFromInterfaceOrientation:a3];
  double v4 = [(GKBaseComposeController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)setMessageFieldText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(GKBaseComposeController *)self messageField];
  [v5 setText:v4];

  [(GKBaseComposeController *)self messageFieldTextDidChange];
}

- (void)_scrollSelectedTextToVisible
{
  id v13 = [(GKBaseComposeController *)self messageField];
  BOOL v3 = [v13 selectedTextRange];
  id v4 = [v3 start];
  [v13 caretRectForPosition:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.CGFloat height = v12;
  if (!CGRectIsEmpty(v15))
  {
    -[UIScrollView convertRect:fromView:](self->_backgroundView, "convertRect:fromView:", v13, v6, v8, v10, v12);
    -[UIScrollView scrollRectToVisible:animated:](self->_backgroundView, "scrollRectToVisible:animated:", 1);
  }
}

- (void)textViewDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(GKBaseComposeController *)self messageField];
  if (v4 == v9)
  {
    double v5 = [v9 text];
    uint64_t v6 = [v5 length];

    if (v6 >= 141)
    {
      double v7 = [v9 text];
      double v8 = [v7 substringToIndex:140];
      [v9 setText:v8];
    }
    [(GKBaseComposeController *)self _scrollSelectedTextToVisible];
    [(GKBaseComposeController *)self messageFieldTextDidChange];
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  id v6 = [(GKBaseComposeController *)self messageField];

  double v5 = v6;
  if (v6 == v4)
  {
    [(GKBaseComposeController *)self _scrollSelectedTextToVisible];
    double v5 = v6;
  }
}

- (BOOL)showHeaderFieldContainer
{
  return self->_showHeaderFieldContainer;
}

- (void)setShowHeaderFieldContainer:(BOOL)a3
{
  self->_showHeaderFieldContainer = a3;
}

- (UIScrollView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSArray)composeHeaderFields
{
  return self->_composeHeaderFields;
}

- (GKTextView)messageField
{
  return self->_messageField;
}

- (void)setMessageField:(id)a3
{
}

- (UIView)intendedFirstResponder
{
  return self->_intendedFirstResponder;
}

- (void)setIntendedFirstResponder:(id)a3
{
  self->_intendedFirstResponder = (UIView *)a3;
}

- (CGRect)lastKnownKeyboardFrame
{
  double x = self->_lastKnownKeyboardFrame.origin.x;
  double y = self->_lastKnownKeyboardFrame.origin.y;
  double width = self->_lastKnownKeyboardFrame.size.width;
  double height = self->_lastKnownKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastKnownKeyboardFrame:(CGRect)a3
{
  self->_lastKnownKeyboardFrame = a3;
}

- (GKContiguousContainerView)headerFieldContainer
{
  return self->_headerFieldContainer;
}

- (void)setHeaderFieldContainer:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (double)scrollContentInsetAdjustY
{
  return self->_scrollContentInsetAdjustY;
}

- (void)setScrollContentInsetAdjustY:(double)a3
{
  self->_double scrollContentInsetAdjustY = a3;
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentLeadingConstraint
{
  return self->_contentLeadingConstraint;
}

- (void)setContentLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageFieldTrailingConstraint
{
  return self->_messageFieldTrailingConstraint;
}

- (void)setMessageFieldTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFieldTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerFieldContainer, 0);
  objc_storeStrong((id *)&self->_messageField, 0);
  objc_storeStrong((id *)&self->_composeHeaderFields, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end