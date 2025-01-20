@interface HPRFSessionTrackerAboutViewController
- (HPRFSessionTrackerAboutViewController)initWithTitle:(id)a3 message:(id)a4;
- (void)_dismiss;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation HPRFSessionTrackerAboutViewController

- (HPRFSessionTrackerAboutViewController)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPRFSessionTrackerAboutViewController;
  v9 = [(HPRFSessionTrackerAboutViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v10;
}

- (void)loadView
{
  v38.receiver = self;
  v38.super_class = (Class)HPRFSessionTrackerAboutViewController;
  [(HPRFSessionTrackerAboutViewController *)&v38 loadView];
  v3 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v5;

  id v7 = [(HPRFSessionTrackerAboutViewController *)self view];
  [v7 addSubview:self->_scrollView];

  [(UIScrollView *)self->_scrollView addSubview:self->_descriptionLabel];
  id v8 = +[PSListController appearance];
  v9 = [v8 backgroundColor];

  v10 = +[PSListController appearance];
  v11 = [v10 separatorColor];

  objc_super v12 = [(HPRFSessionTrackerAboutViewController *)self view];
  [v12 setBackgroundColor:v9];

  v13 = [(HPRFSessionTrackerAboutViewController *)self view];
  [v13 setTintColor:v9];

  [(UIScrollView *)self->_scrollView setBackgroundColor:v9];
  [(UIScrollView *)self->_scrollView setTintColor:v9];
  [(UIScrollView *)self->_scrollView setIndicatorStyle:2];
  [(UILabel *)self->_descriptionLabel setAttributedText:self->_message];
  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_descriptionLabel setFont:v14];

  [(UILabel *)self->_descriptionLabel setLineBreakMode:0];
  [(UILabel *)self->_descriptionLabel setTextAlignment:4];
  v15 = +[PSListController appearance];
  v16 = [v15 textColor];
  [(UILabel *)self->_descriptionLabel setTextColor:v16];

  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismiss"];
  v18 = [(HPRFSessionTrackerAboutViewController *)self navigationItem];
  [v18 setRightBarButtonItem:v17];

  title = self->_title;
  v20 = [(HPRFSessionTrackerAboutViewController *)self navigationItem];
  [v20 setTitle:title];

  v21 = [(HPRFSessionTrackerAboutViewController *)self navigationController];
  v22 = [v21 navigationBar];
  [v22 setBarStyle:1];

  v23 = +[PSListController appearance];
  v24 = [v23 buttonTextColor];
  v25 = [(HPRFSessionTrackerAboutViewController *)self navigationItem];
  v26 = [v25 rightBarButtonItem];
  [v26 setTintColor:v24];

  v27 = [(HPRFSessionTrackerAboutViewController *)self navigationController];
  v28 = [v27 navigationBar];
  [v28 setBackgroundColor:v9];

  v29 = [(HPRFSessionTrackerAboutViewController *)self navigationController];
  v30 = [v29 navigationBar];
  v31 = BPSBridgeTintColor();
  [v30 setTintColor:v31];

  v32 = [(HPRFSessionTrackerAboutViewController *)self navigationController];
  v33 = [v32 navigationBar];
  v34 = HPRFPointImageWithColor(v9);
  [v33 setBackgroundImage:v34 forBarMetrics:0];

  v35 = [(HPRFSessionTrackerAboutViewController *)self navigationController];
  v36 = [v35 navigationBar];
  v37 = HPRFPointImageWithColor(v11);
  [v36 setShadowImage:v37];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)HPRFSessionTrackerAboutViewController;
  [(HPRFSessionTrackerAboutViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(HPRFSessionTrackerAboutViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4 + -32.0;

  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v5, 1.79769313e308);
  double v7 = v6;
  id v8 = [(HPRFSessionTrackerAboutViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 16.0, 16.0, v5, v7);
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v10, v12, v14, v16);
  v18.origin.x = 16.0;
  v18.origin.y = 16.0;
  v18.size.width = v5;
  v18.size.height = v7;
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v14, CGRectGetMaxY(v18) + 16.0);
}

- (void)_dismiss
{
  id v3 = [(HPRFSessionTrackerAboutViewController *)self navigationController];
  v2 = [v3 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end