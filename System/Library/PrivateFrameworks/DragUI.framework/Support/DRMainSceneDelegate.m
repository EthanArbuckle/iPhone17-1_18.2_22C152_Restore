@interface DRMainSceneDelegate
- (DRTouchTrackingWindow)touchTrackingWindow;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setTouchTrackingWindow:(id)a3;
- (void)setWindow:(id)a3;
- (void)viewController:(id)a3 didUpdatePresentation:(id)a4 forSession:(unsigned int)a5;
- (void)viewController:(id)a3 requestImagesForSessionID:(unsigned int)a4 client:(id)a5 itemIndexes:(id)a6;
- (void)viewController:(id)a3 setTouchOffset:(CGPoint)a4 forSession:(unsigned int)a5;
@end

@implementation DRMainSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  obj = [[DRTouchTrackingWindow alloc] initWithWindowScene:v6];
  v7 = +[DRDragSessionManager sharedSessionManager];
  [(DRTouchTrackingWindow *)obj setTrackingDelegate:v7];

  [(DRTouchTrackingWindow *)obj setHidden:0];
  objc_storeStrong((id *)&self->_touchTrackingWindow, obj);
  v8 = [[DRContentWindow alloc] initWithWindowScene:v6];
  v9 = [v6 screen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = -[DRViewController initWithDelegate:initialFrame:]([DRViewController alloc], "initWithDelegate:initialFrame:", self, v11, v13, v15, v17);
  v19 = [v6 screen];

  LODWORD(v6) = [v19 _isEmbeddedScreen];
  if (v6) {
    [(DRViewController *)v18 observeInterfaceOrientationUpdates];
  }
  [(DRContentWindow *)v8 setRootViewController:v18];
  [(DRContentWindow *)v8 makeKeyAndVisible];
  window = self->_window;
  self->_window = &v8->super;
}

- (void)viewController:(id)a3 requestImagesForSessionID:(unsigned int)a4 client:(id)a5 itemIndexes:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a6;
  id v9 = a5;
  id v10 = +[DRDragSessionManager sharedSessionManager];
  [v10 requestImagesForSessionID:v7 client:v9 itemIndexSet:v8];
}

- (void)viewController:(id)a3 setTouchOffset:(CGPoint)a4 forSession:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double y = a4.y;
  double x = a4.x;
  id v8 = +[DRDragSessionManager sharedSessionManager];
  objc_msgSend(v8, "setTouchOffset:forSession:", v5, x, y);
}

- (void)viewController:(id)a3 didUpdatePresentation:(id)a4 forSession:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v6 = a4;
  id v7 = +[DRDragSessionManager sharedSessionManager];
  [v7 presentationDidUpdate:v6 forSession:v5];
}

- (DRTouchTrackingWindow)touchTrackingWindow
{
  return self->_touchTrackingWindow;
}

- (void)setTouchTrackingWindow:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_touchTrackingWindow, 0);
}

@end