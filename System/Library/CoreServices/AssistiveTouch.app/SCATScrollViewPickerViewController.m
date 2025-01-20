@interface SCATScrollViewPickerViewController
- (void)loadView;
- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
@end

@implementation SCATScrollViewPickerViewController

- (void)loadView
{
  v4 = objc_alloc_init(SCATPromptView);
  v3 = sub_100040EC8(@"CHOOSE_SCROLL_VIEW");
  [(SCATPromptView *)v4 setPrompt:v3];

  [(SCATPromptView *)v4 setAutoresizingMask:18];
  [(SCATScrollViewPickerViewController *)self setView:v4];
}

- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(SCATScrollViewPickerViewController *)self view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16.receiver = self;
  v16.super_class = (Class)SCATScrollViewPickerViewController;
  [(SCATElementManagerViewController *)&v16 willPresentWithDisplayContext:v6 animated:v4];
}

@end