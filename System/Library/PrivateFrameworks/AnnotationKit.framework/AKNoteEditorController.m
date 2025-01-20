@interface AKNoteEditorController
- (AKNoteEditorControllerDelegate)delegate;
- (AKNoteEditorViewController)contentViewController;
- (AKPopupAnnotation)annotation;
- (NSString)editedText;
- (double)suggestedEditorHeightForWidth:(double)a3;
- (id)_popupBackgroundColorForPopupAnnotation:(id)a3;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)beginEditing:(BOOL)a3;
- (void)finishEditing;
- (void)noteEditorViewControllerDidBeginEditing:(id)a3;
- (void)noteEditorViewControllerDidEndEditing:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AKNoteEditorController

- (NSString)editedText
{
  v2 = [(AKNoteEditorController *)self contentViewController];
  v3 = [v2 textView];
  v4 = [v3 text];

  return (NSString *)v4;
}

- (double)suggestedEditorHeightForWidth:(double)a3
{
  return 170.0;
}

- (void)beginEditing:(BOOL)a3
{
  id v27 = [(AKNoteEditorController *)self delegate];
  [v27 stickyViewFrameForNoteEditor:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [v27 stickyContainerForNoteEditor:self];
  if ([v27 edgeForNoteEditor:self])
  {
    v13 = [AKNoteEditorViewController alloc];
    v14 = +[AKController akBundle];
    v15 = [(AKNoteEditorViewController *)v13 initWithNibName:@"AKNoteEditorViewController" bundle:v14];

    [(AKNoteEditorViewController *)v15 setDelegate:self];
    v16 = [(AKNoteEditorController *)self annotation];
    [(AKNoteEditorViewController *)v15 setAnnotation:v16];

    [(AKNoteEditorViewController *)v15 setModalPresentationStyle:7];
    v17 = [MEMORY[0x263F1C550] clearColor];
    v18 = [(AKNoteEditorViewController *)v15 view];
    [v18 setBackgroundColor:v17];

    -[AKNoteEditorViewController setPreferredContentSize:](v15, "setPreferredContentSize:", 320.0, 200.0);
    v19 = [(AKNoteEditorViewController *)v15 popoverPresentationController];
    [v19 setSourceView:v12];

    v20 = [(AKNoteEditorViewController *)v15 popoverPresentationController];
    objc_msgSend(v20, "setSourceRect:", v5, v7, v9, v11);

    v21 = [(AKNoteEditorController *)self annotation];
    v22 = [(AKNoteEditorController *)self _popupBackgroundColorForPopupAnnotation:v21];
    v23 = [v22 colorWithAlphaComponent:1.0];
    v24 = [(AKNoteEditorViewController *)v15 popoverPresentationController];
    [v24 setBackgroundColor:v23];

    v25 = [(AKNoteEditorViewController *)v15 popoverPresentationController];
    [v25 setDelegate:self];

    v26 = [v27 popoverPresentingViewControllerForNoteEditor:self];
    [(AKNoteEditorController *)self setContentViewController:v15];
    [v26 presentViewController:v15 animated:1 completion:0];
  }
}

- (void)finishEditing
{
  id v5 = [(AKNoteEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 noteEditorWillDismissFromFullScreen:self];
  }
  v3 = [(AKNoteEditorController *)self contentViewController];
  double v4 = [v3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)noteEditorViewControllerDidBeginEditing:(id)a3
{
  id v4 = [(AKNoteEditorController *)self delegate];
  [v4 noteEditorDidBeginEditing:self];
}

- (void)noteEditorViewControllerDidEndEditing:(id)a3
{
  id v4 = [(AKNoteEditorController *)self delegate];
  [v4 noteEditorDidFinishEditing:self];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 0;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(AKNoteEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 noteEditorWillPresentFullScreen:self];
  }
  double v7 = [v5 presentedViewController];
  double v8 = [(AKNoteEditorController *)self annotation];
  double v9 = [(AKNoteEditorController *)self _popupBackgroundColorForPopupAnnotation:v8];
  double v10 = [v9 colorWithAlphaComponent:1.0];
  double v11 = [v7 view];
  [v11 setBackgroundColor:v10];

  v12 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v7];
  v13 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_finishEditing];
  v14 = [v12 topViewController];
  v15 = [v14 navigationItem];
  [v15 setRightBarButtonItem:v13];

  return v12;
}

- (id)_popupBackgroundColorForPopupAnnotation:(id)a3
{
  v3 = [a3 parentAnnotation];
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [v3 color];
    int64_t v7 = +[AKHighlightAppearanceHelper attributeTagForHighlightOfColor:v6];
  }
  else
  {
    int64_t v7 = 765200;
  }
  double v8 = +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:v7];

  return v8;
}

- (AKPopupAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (AKNoteEditorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKNoteEditorControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKNoteEditorViewController)contentViewController
{
  return (AKNoteEditorViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_annotation, 0);
}

@end