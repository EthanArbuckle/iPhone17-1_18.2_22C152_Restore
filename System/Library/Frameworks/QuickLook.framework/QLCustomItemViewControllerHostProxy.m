@interface QLCustomItemViewControllerHostProxy
- (QLCustomItemViewControllerHost)delegate;
- (void)dismissQuickLook;
- (void)forwardMessageToHostOfCustomViewController:(id)a3 completionHandler:(id)a4;
- (void)presentShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setFullScreen:(BOOL)a3;
@end

@implementation QLCustomItemViewControllerHostProxy

- (void)presentShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(QLCustomItemViewControllerHostProxy *)self delegate];
  [v11 presentShareSheetWithPopoverTracker:v10 customSharedURL:v9 dismissCompletion:v8];
}

- (void)setFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLCustomItemViewControllerHostProxy *)self delegate];
  [v4 setFullScreen:v3];
}

- (void)dismissQuickLook
{
  id v2 = [(QLCustomItemViewControllerHostProxy *)self delegate];
  [v2 dismissQuickLook];
}

- (void)forwardMessageToHostOfCustomViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLCustomItemViewControllerHostProxy *)self delegate];
  [v8 forwardMessageToHostOfCustomViewController:v7 completionHandler:v6];
}

- (QLCustomItemViewControllerHost)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (QLCustomItemViewControllerHost *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end