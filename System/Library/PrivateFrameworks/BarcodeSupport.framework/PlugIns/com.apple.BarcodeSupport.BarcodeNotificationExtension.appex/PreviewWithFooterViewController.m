@interface PreviewWithFooterViewController
- (PreviewWithFooterViewController)initWithPreviewViewController:(id)a3 footerTitle:(id)a4 footerSubtitle:(id)a5;
- (UIView)footerView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PreviewWithFooterViewController

- (PreviewWithFooterViewController)initWithPreviewViewController:(id)a3 footerTitle:(id)a4 footerSubtitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PreviewWithFooterViewController;
  v12 = [(PreviewWithFooterViewController *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewViewController, a3);
    v14 = (NSString *)[v10 copy];
    footerTitle = v13->_footerTitle;
    v13->_footerTitle = v14;

    v16 = (NSString *)[v11 copy];
    footerSubtitle = v13->_footerSubtitle;
    v13->_footerSubtitle = v16;

    v18 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PreviewWithFooterViewController;
  [(PreviewWithFooterViewController *)&v8 viewDidLoad];
  [(PreviewWithFooterViewController *)self addChildViewController:self->_previewViewController];
  v3 = [(PreviewWithFooterViewController *)self view];
  v4 = [(UIViewController *)self->_previewViewController view];
  [v3 addSubview:v4];

  [(UIViewController *)self->_previewViewController didMoveToParentViewController:self];
  if ([(NSString *)self->_footerTitle length])
  {
    v5 = [[PreviewFooterView alloc] initWithTitle:self->_footerTitle subtitle:self->_footerSubtitle];
    footerView = self->_footerView;
    self->_footerView = &v5->super;

    v7 = [(PreviewWithFooterViewController *)self view];
    [v7 addSubview:self->_footerView];
  }
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PreviewWithFooterViewController;
  [(PreviewWithFooterViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(PreviewWithFooterViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double Width = CGRectGetWidth(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double Height = CGRectGetHeight(v19);
  -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", Width, 1.79769313e308);
  double v15 = Height - v14;
  -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, v15, Width, v14);
  v16 = [(UIViewController *)self->_previewViewController view];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, v15);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_footerSubtitle, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
}

@end