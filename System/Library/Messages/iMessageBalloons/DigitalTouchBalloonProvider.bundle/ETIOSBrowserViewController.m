@interface ETIOSBrowserViewController
- (BOOL)canvasViewControllerUsesCompactKeyboardLayout:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldShowChatChrome;
- (BOOL)supportsQuickView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (CGRect)horizontalSwipeExclusionRect;
- (Class)canvasViewControllerClass;
- (double)canvasViewControllerPercentExpanded:(id)a3;
- (int64_t)browserPresentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateBottomMargin;
- (void)beginSuppressingAppearanceMethods;
- (void)canvasViewController:(id)a3 requestsPresentationStyleExpanded:(BOOL)a4;
- (void)canvasViewControllerHideEntryView:(id)a3;
- (void)canvasViewControllerShowEntryView:(id)a3;
- (void)dismissCanvasViewController:(id)a3;
- (void)endSuppressingAppearanceMethods;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidTransitionToCompactPresentation;
- (void)viewDidTransitionToExpandedPresentation;
@end

@implementation ETIOSBrowserViewController

- (BOOL)shouldAutorotate
{
  v2 = [(ETBrowserViewController *)self canvasViewController];
  unsigned __int8 v3 = [v2 shouldAutorotate];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(ETBrowserViewController *)self canvasViewController];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ETIOSBrowserViewController;
  [(ETBrowserViewController *)&v6 viewDidLoad];
  id v3 = [(ETIOSBrowserViewController *)self view];
  v4 = +[UIColor colorWithWhite:0.1 alpha:1.0];
  [v3 setBackgroundColor:v4];

  v5 = [(ETBrowserViewController *)self canvasViewController];
  [v5 setPresentationDelegate:self];
  [(ETIOSBrowserViewController *)self _updateBottomMargin];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ETIOSBrowserViewController;
  [(ETIOSBrowserViewController *)&v3 viewDidLayoutSubviews];
  [(ETIOSBrowserViewController *)self _updateBottomMargin];
}

- (BOOL)shouldShowChatChrome
{
  return 1;
}

- (BOOL)wantsDarkUI
{
  return 1;
}

- (BOOL)supportsQuickView
{
  return 1;
}

- (BOOL)wantsOpaqueUI
{
  return 1;
}

- (CGRect)horizontalSwipeExclusionRect
{
  objc_super v3 = [(ETBrowserViewController *)self canvasViewController];
  v4 = [v3 canvasView];

  v5 = [(ETIOSBrowserViewController *)self view];
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v4 superview];
  objc_msgSend(v5, "convertRect:fromView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (int64_t)browserPresentationStyle
{
  return 0;
}

- (void)viewDidTransitionToExpandedPresentation
{
  id v2 = [(ETBrowserViewController *)self canvasViewController];
  [v2 viewDidTransitionToExpandedPresentation];
}

- (void)viewDidTransitionToCompactPresentation
{
  id v2 = [(ETBrowserViewController *)self canvasViewController];
  [v2 viewDidTransitionToCompactPresentation];
}

- (void)beginSuppressingAppearanceMethods
{
  id v2 = [(ETBrowserViewController *)self canvasViewController];
  [v2 setIgnoreAppearanceCallbacks:1];
}

- (void)endSuppressingAppearanceMethods
{
  id v2 = [(ETBrowserViewController *)self canvasViewController];
  [v2 setIgnoreAppearanceCallbacks:0];
}

- (void)_updateBottomMargin
{
  id v11 = [(ETBrowserViewController *)self canvasViewController];
  objc_super v3 = [(ETIOSBrowserViewController *)self view];
  [v3 safeAreaInsets];

  v4 = [(ETIOSBrowserViewController *)self sheetPresentationController];
  [v4 _grabberTopSpacing];
  double v6 = v5 + v5;

  double v7 = [v11 view];
  double v8 = [(ETIOSBrowserViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:", v9 + 0.0, v6 + v10);
}

- (void)canvasViewController:(id)a3 requestsPresentationStyleExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ETIOSBrowserViewController *)self sendDelegate];
  [v5 requestPresentationStyleExpanded:v4];
}

- (void)dismissCanvasViewController:(id)a3
{
  id v3 = [(ETIOSBrowserViewController *)self sendDelegate];
  [v3 dismiss];
}

- (void)canvasViewControllerHideEntryView:(id)a3
{
  id v3 = [(ETIOSBrowserViewController *)self sendDelegate];
  [v3 setEntryViewHidden:1];
}

- (void)canvasViewControllerShowEntryView:(id)a3
{
  id v3 = [(ETIOSBrowserViewController *)self sendDelegate];
  [v3 setEntryViewHidden:0];
}

- (Class)canvasViewControllerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canvasViewControllerUsesCompactKeyboardLayout:(id)a3
{
  return [(ETIOSBrowserViewController *)self inExpandedPresentation] ^ 1;
}

- (double)canvasViewControllerPercentExpanded:(id)a3
{
  BOOL v4 = [(ETIOSBrowserViewController *)self sheetPresentationController];
  id v5 = [v4 _detentValues];
  double v6 = 0.0;
  if ((unint64_t)[v5 count] >= 2)
  {
    double v7 = [(ETIOSBrowserViewController *)self view];
    [v7 bounds];
    double v9 = v8;
    double v10 = [(ETIOSBrowserViewController *)self view];
    [v10 safeAreaInsets];
    double v12 = v9 - v11;
    double v13 = [v5 objectAtIndexedSubscript:1];
    [v13 doubleValue];
    double v15 = v14;
    double v16 = [v5 objectAtIndexedSubscript:0];
    [v16 doubleValue];
    double v6 = (v12 - v15) / (v17 - v15);
  }
  return v6;
}

@end