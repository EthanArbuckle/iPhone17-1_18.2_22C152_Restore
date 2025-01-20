@interface QLICSItemViewController
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canEnterFullScreen;
- (BOOL)canSwipeToDismiss;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (id)scrollView;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
@end

@implementation QLICSItemViewController

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  QLRunInMainThread();
}

- (id)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return WeakRetained;
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icsPreviewController, 0);

  objc_destroyWeak((id *)&self->_scrollView);
}

@end