@interface QLMarkupImageItemViewController
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (CGSize)imageSize;
- (UIEdgeInsets)customEdgeInsets;
- (UIEdgeInsets)customSketchOverlayInsets;
- (id)clientPreviewOptions;
- (id)editProgressIndicatorMessage;
- (id)imageAnalysisToolbarButton;
- (id)imageForAnalysis;
- (id)scrollView;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)performFirstTimeAppearanceActions:(unint64_t)a3;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4;
@end

@implementation QLMarkupImageItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012BF0;
  v9[3] = &unk_100024C60;
  v10 = self;
  id v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)QLMarkupImageItemViewController;
  id v7 = v11;
  [(QLMarkupItemViewController *)&v8 loadPreviewControllerWithContents:a3 context:a4 completionHandler:v9];
}

- (void)previewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)QLMarkupImageItemViewController;
  [(QLMarkupItemViewController *)&v10 previewWillAppear:a3];
  uint64_t v4 = QLMarkupImageItemViewControllerMarkupImageViewAccessibilityIdentifier;
  v5 = [(QLMarkupImageItemViewController *)self view];
  [v5 setAccessibilityIdentifier:v4];

  if (!self->_isVisible)
  {
    v6 = [(QLMarkupImageItemViewController *)self scrollView];
    [v6 minimumZoomScale];
    double v8 = v7;
    v9 = [(QLMarkupImageItemViewController *)self scrollView];
    [v9 setZoomScale:v8];
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(QLMarkupItemViewController *)self markupViewController];
  [v5 setupAndStartImageAnalysisIfNeeded];

  v7.receiver = self;
  v7.super_class = (Class)QLMarkupImageItemViewController;
  [(QLMarkupItemViewController *)&v7 previewDidAppear:v3];
  self->_isVisible = 1;
  v6 = [(QLMarkupItemViewController *)self markupViewController];
  [v6 shouldHideMarkupOverlays:0 animated:0];
}

- (void)previewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLMarkupImageItemViewController;
  [(QLMarkupItemViewController *)&v5 previewWillDisappear:a3];
  uint64_t v4 = [(QLMarkupItemViewController *)self markupViewController];
  [v4 shouldHideMarkupOverlays:1 animated:0];
}

- (void)previewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(QLMarkupItemViewController *)self markupViewController];
  [v5 stopImageAnalysis];

  v6.receiver = self;
  v6.super_class = (Class)QLMarkupImageItemViewController;
  [(QLMarkupItemViewController *)&v6 previewDidDisappear:v3];
  self->_isVisible = 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(QLMarkupImageItemViewController *)self appearance];
  v14.receiver = self;
  v14.super_class = (Class)QLMarkupImageItemViewController;
  [(QLMarkupItemViewController *)&v14 setAppearance:v6 animated:v4];

  double v8 = (char *)[v7 presentationMode];
  v9 = [(QLMarkupImageItemViewController *)self appearance];
  objc_super v10 = (char *)[v9 presentationMode];

  if (v8 != v10)
  {
    if ((unint64_t)(v10 - 1) <= 1)
    {
      id v11 = [(QLMarkupItemViewController *)self markupViewController];
      v12 = v11;
      uint64_t v13 = 0;
LABEL_6:
      [v11 setPresentationMode:v13];

      goto LABEL_7;
    }
    if ((unint64_t)(v10 - 3) <= 2)
    {
      id v11 = [(QLMarkupItemViewController *)self markupViewController];
      v12 = v11;
      uint64_t v13 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (id)editProgressIndicatorMessage
{
  return (id)QLLocalizedString();
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)QLMarkupImageItemViewController;
  BOOL v4 = [(QLMarkupItemViewController *)&v10 toolbarButtonsForTraitCollection:a3];
  id v5 = [v4 mutableCopy];

  if (!v5)
  {
    id v5 = +[NSMutableArray array];
  }
  if (_os_feature_enabled_impl())
  {
    id v6 = [(QLMarkupItemViewController *)self markupViewController];
    if ([v6 isInteractionActive])
    {
      objc_super v7 = [(QLMarkupItemViewController *)self markupViewController];
      unsigned int v8 = [v7 hasResultsForVisualSearch];

      if (!v8) {
        goto LABEL_8;
      }
      id v6 = [(QLMarkupImageItemViewController *)self imageAnalysisToolbarButton];
      [v5 addObject:v6];
    }
  }
LABEL_8:

  return v5;
}

- (id)imageAnalysisToolbarButton
{
  if (!self->_infoButton)
  {
    id v3 = objc_alloc((Class)QLToolbarButton);
    BOOL v4 = (QLToolbarButton *)[v3 initWithIdentifier:QLVisualSearchButtonIdentifier];
    infoButton = self->_infoButton;
    self->_infoButton = v4;

    [(QLToolbarButton *)self->_infoButton setPlacement:0];
    [(QLToolbarButton *)self->_infoButton setAccessibilityIdentifier:QLOverlayImageAnalysisButtonAccessibilityIdentifier];
  }
  id v6 = [(QLMarkupItemViewController *)self markupViewController];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v6 infoButtonGlyphName], objc_super v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    unsigned int v8 = [v6 infoButtonGlyphName];
  }
  else
  {
    unsigned int v8 = @"info.circle.and.sparkles";
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v6 filledInfoButtonGlyphName],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_super v10 = [v6 filledInfoButtonGlyphName];
  }
  else
  {
    objc_super v10 = @"info.circle.and.sparkles.fill";
  }
  id v11 = [(QLMarkupItemViewController *)self markupViewController];
  unsigned int v12 = [v11 isVisualSearchEnabled];

  if (v12) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v8;
  }
  [(QLToolbarButton *)self->_infoButton setSymbolImageName:v13];
  [(QLToolbarButton *)self->_infoButton setUseInternalSymbolImage:1];
  objc_super v14 = self->_infoButton;

  return v14;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  int v8 = _os_feature_enabled_impl();
  if ([v6 isEqualToString:QLVisualSearchButtonIdentifier]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)QLMarkupImageItemViewController;
    [(QLMarkupItemViewController *)&v11 buttonPressedWithIdentifier:v6 completionHandler:v7];
  }
  else
  {
    objc_super v10 = [(QLMarkupItemViewController *)self markupViewController];
    [v10 infoButtonTapped];

    if (v7) {
      v7[2](v7);
    }
  }
}

- (UIEdgeInsets)customEdgeInsets
{
  id v3 = [(QLMarkupImageItemViewController *)self appearance];
  id v4 = [v3 presentationMode];

  [(QLMarkupImageItemViewController *)self imageSize];
  id v5 = [(QLMarkupImageItemViewController *)self view];
  [v5 frame];
  int v6 = QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance();

  if (v4 == (id)4 || v6)
  {
    double top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }
  else
  {
    objc_super v7 = [(QLMarkupImageItemViewController *)self appearance];
    [v7 peripheryInsets];
    double top = v8;
    CGFloat left = v10;
    double bottom = v12;
    CGFloat right = v14;
  }
  v16 = [(QLMarkupItemViewController *)self markupViewController];
  unsigned int v17 = [v16 annotationEditingEnabled];

  if (v17)
  {
    v18 = [(QLMarkupImageItemViewController *)self appearance];
    [v18 topInset];
    double v20 = v19;

    if (top < v20) {
      double top = v20;
    }
    v21 = [(QLMarkupItemViewController *)self markupViewController];
    v22 = [v21 toolbar];
    [v22 frame];
    double v24 = v23;

    if (bottom >= v24) {
      double v24 = bottom;
    }
    v25 = [(QLMarkupImageItemViewController *)self appearance];
    [v25 bottomInset];
    double bottom = v26;

    if (v24 >= bottom) {
      double bottom = v24;
    }
  }
  double v27 = top;
  double v28 = left;
  double v29 = bottom;
  double v30 = right;
  result.CGFloat right = v30;
  result.double bottom = v29;
  result.CGFloat left = v28;
  result.double top = v27;
  return result;
}

- (UIEdgeInsets)customSketchOverlayInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)scrollView
{
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    id v4 = [(QLMarkupItemViewController *)self markupViewController];
    id v5 = [v4 contentViewScrollView];
    int v6 = self->_scrollView;
    self->_scrollView = v5;

    [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)self->_scrollView setClipsToBounds:0];
    scrollView = self->_scrollView;
  }

  return scrollView;
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)QLMarkupImageItemViewController;
  -[QLMarkupImageItemViewController transitionWillFinish:didComplete:](&v8, "transitionWillFinish:didComplete:");
  if (v4 && !a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013628;
    v7[3] = &unk_100024A30;
    v7[4] = self;
    +[UIView animateWithDuration:v7 animations:0.1];
  }
}

- (CGSize)imageSize
{
  v2 = [(QLMarkupImageItemViewController *)self imageForAnalysis];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)imageForAnalysis
{
  imageForAnalysis = self->_imageForAnalysis;
  if (imageForAnalysis)
  {
    double v3 = imageForAnalysis;
  }
  else
  {
    double v4 = [(QLMarkupImageItemViewController *)self contents];
    double v3 = [v4 image];
  }

  return v3;
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  char v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLMarkupImageItemViewController;
  unsigned __int8 v4 = -[QLMarkupItemViewController canPerformFirstTimeAppearanceActions:](&v7, "canPerformFirstTimeAppearanceActions:");
  BOOL v5 = (v3 & 0x28) != 0;
  if (v4) {
    BOOL v5 = 1;
  }
  return (v3 & 0x10) != 0 || v5;
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  char v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLMarkupImageItemViewController;
  -[QLMarkupItemViewController performFirstTimeAppearanceActions:](&v11, "performFirstTimeAppearanceActions:");
  BOOL v5 = [(QLMarkupItemViewController *)self markupViewController];
  unsigned __int8 v6 = [v5 annotationEditingEnabled];

  objc_super v7 = [(QLMarkupItemViewController *)self markupViewController];
  double v8 = v7;
  if (v3 & 8) == 0 || (v6)
  {
    if ((v3 & 0x10) != 0) {
      char v9 = v6;
    }
    else {
      char v9 = 1;
    }
    if (v9)
    {
      if ((v3 & 0x20) != 0) {
        char v10 = v6;
      }
      else {
        char v10 = 1;
      }
      if ((v10 & 1) == 0) {
        [v7 setShouldUpliftSubjectAfterNextAnalysis:1];
      }
    }
    else
    {
      [v7 setShouldEnterVisualSearchAfterNextAnalysis:1];
    }
  }
  else
  {
    [v7 setShouldHighlightTextAndDDAfterNextAnalysis:1];
  }
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLMarkupImageItemViewController;
  if ([(QLMarkupItemViewController *)&v12 shouldAcceptTouch:v6 ofGestureRecognizer:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [(QLMarkupItemViewController *)self markupViewController];
      unsigned __int8 v9 = [v8 acceptSingleTouch:v6];

      char v10 = v9 ^ 1;
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)clientPreviewOptions
{
  v2 = [(QLMarkupImageItemViewController *)self context];
  char v3 = [v2 clientPreviewOptions];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_imageForAnalysis, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end