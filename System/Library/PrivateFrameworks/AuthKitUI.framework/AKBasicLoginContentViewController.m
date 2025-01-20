@interface AKBasicLoginContentViewController
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation AKBasicLoginContentViewController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginContentViewController;
  [(AKBasicLoginContentViewController *)&v5 loadView];
  v3 = [AKBasicLoginContentViewControllerContainerView alloc];
  v4 = -[AKBasicLoginContentViewControllerContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AKBasicLoginContentViewController *)self setView:v4];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginContentViewController;
  [(AKBasicLoginContentViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(AKBasicLoginContentViewController *)self view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B98], *(double *)(MEMORY[0x1E4F43B98] + 8));
  -[AKBasicLoginContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

@end