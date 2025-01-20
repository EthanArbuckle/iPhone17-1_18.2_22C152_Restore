@interface WKVideoFullScreenViewController
- (BOOL)prefersStatusBarHidden;
- (WKVideoFullScreenViewController)initWithAVPlayerViewController:(id)a3;
- (id).cxx_construct;
- (void)viewDidLoad;
@end

@implementation WKVideoFullScreenViewController

- (WKVideoFullScreenViewController)initWithAVPlayerViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKVideoFullScreenViewController;
  v4 = [(WKVideoFullScreenViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak(&v4->_avPlayerViewController.m_weakReference, a3);
    [(WKVideoFullScreenViewController *)v5 setModalPresentationCapturesStatusBarAppearance:1];
    [(WKVideoFullScreenViewController *)v5 setModalPresentationStyle:5];
  }
  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WKVideoFullScreenViewController;
  [(WKVideoFullScreenViewController *)&v7 viewDidLoad];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
  objc_msgSend((id)-[WKVideoFullScreenViewController view](self, "view"), "setFrame:", v3, v4, v5, v6);
  objc_msgSend((id)-[WKVideoFullScreenViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "blackColor"));
  objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_avPlayerViewController.m_weakReference), "view"), "setAutoresizingMask:", 18);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 122) = 0;
  return self;
}

@end