@interface DDEKDayViewController
- (CGSize)preferredContentSize;
- (EKEvent)dd_event;
- (void)dd_update_scroll;
- (void)didMoveToParentViewController:(id)a3;
- (void)setDd_event:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DDEKDayViewController

- (CGSize)preferredContentSize
{
  double v2 = 375.0;
  double v3 = 375.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dd_update_scroll
{
  if ([(DDEKDayViewController *)self isViewLoaded])
  {
    double v3 = [(DDEKDayViewController *)self view];
    v4 = [v3 window];

    if (v4)
    {
      id v5 = [(DDEKDayViewController *)self dd_event];
      [(EKDayViewController *)self scrollEventIntoView:v5 animated:0];
    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DDEKDayViewController;
  [(DDEKDayViewController *)&v4 didMoveToParentViewController:a3];
  [(DDEKDayViewController *)self dd_update_scroll];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DDEKDayViewController;
  [(EKDayViewController *)&v4 viewDidAppear:a3];
  [(DDEKDayViewController *)self dd_update_scroll];
}

- (void)viewDidLayoutSubviews
{
  [(DDEKDayViewController *)self dd_update_scroll];
  v3.receiver = self;
  v3.super_class = (Class)DDEKDayViewController;
  [(EKDayViewController *)&v3 viewDidLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DDEKDayViewController;
  -[EKDayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(DDEKDayViewController *)self dd_update_scroll];
}

- (EKEvent)dd_event
{
  return (EKEvent *)objc_getProperty(self, a2, 1312, 1);
}

- (void)setDd_event:(id)a3
{
}

- (void).cxx_destruct
{
}

@end