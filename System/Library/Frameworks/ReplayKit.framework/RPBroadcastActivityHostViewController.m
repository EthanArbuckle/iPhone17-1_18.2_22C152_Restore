@interface RPBroadcastActivityHostViewController
- (CGRect)popoverControllerSourceRect;
- (RPBroadcastActivityViewController)broadcastActivityViewController;
- (int64_t)modalPresentationStyle;
- (unint64_t)popoverArrowDirection;
- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6;
- (void)presentationInfoWithCompletion:(id)a3;
- (void)setBroadcastActivityViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation RPBroadcastActivityHostViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)RPBroadcastActivityHostViewController;
  [(RPBroadcastActivityHostViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  v4 = [(RPBroadcastActivityHostViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  p_broadcastActivityViewController = &self->_broadcastActivityViewController;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_broadcastActivityViewController);
  [WeakRetained extensionDidFinishWithLaunchURL:v12 broadcastURL:v11 extensionBundleID:v10 cancelled:v6];
}

- (CGRect)popoverControllerSourceRect
{
  p_broadcastActivityViewController = &self->_broadcastActivityViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
  v4 = [WeakRetained popoverPresentationController];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_broadcastActivityViewController);
    BOOL v6 = [v5 popoverPresentationController];
    v7 = [v6 sourceView];

    id v8 = objc_loadWeakRetained((id *)p_broadcastActivityViewController);
    v9 = [v8 popoverPresentationController];
    [v9 sourceRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = [v7 superview];
    v19 = [v7 window];
    objc_msgSend(v18, "convertRect:toView:", v19, v11, v13, v15, v17);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
  }
  else
  {
    double v21 = *MEMORY[0x263F001A8];
    double v23 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v25 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v27 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (unint64_t)popoverArrowDirection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
  v3 = [WeakRetained popoverPresentationController];
  unint64_t v4 = [v3 arrowDirection];

  return v4;
}

- (int64_t)modalPresentationStyle
{
  [(RPBroadcastActivityHostViewController *)self popoverControllerSourceRect];
  if (!CGRectEqualToRect(v6, *MEMORY[0x263F001A8])) {
    return 7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);
  int64_t v4 = [WeakRetained modalPresentationStyle];

  return v4;
}

- (void)presentationInfoWithCompletion:(id)a3
{
  id v10 = a3;
  int64_t v5 = [(RPBroadcastActivityHostViewController *)self modalPresentationStyle];
  [(RPBroadcastActivityHostViewController *)self popoverControllerSourceRect];
  (*((void (**)(id, int64_t, unint64_t, double, double, double, double))a3 + 2))(v10, v5, [(RPBroadcastActivityHostViewController *)self popoverArrowDirection], v6, v7, v8, v9);
}

- (RPBroadcastActivityViewController)broadcastActivityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_broadcastActivityViewController);

  return (RPBroadcastActivityViewController *)WeakRetained;
}

- (void)setBroadcastActivityViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end