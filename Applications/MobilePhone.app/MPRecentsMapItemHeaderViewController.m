@interface MPRecentsMapItemHeaderViewController
- (CHRecentCall)recentCall;
- (PHRecentCallDetailsView)detailsView;
- (UILabel)titleLabel;
- (void)loadLayoutConstraints;
- (void)loadView;
- (void)setDetailsView:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MPRecentsMapItemHeaderViewController

- (void)loadView
{
  v22.receiver = self;
  v22.super_class = (Class)MPRecentsMapItemHeaderViewController;
  [(MPRecentsMapItemHeaderViewController *)&v22 loadView];
  v3 = [(MPRecentsMapItemHeaderViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1132068864;
  [v3 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1132068864;
  [v3 setContentHuggingPriority:1 forAxis:v7];
  v8 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline addingSymbolicTraits:0x8000 options:1];
  id v9 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  v15 = +[UIFont fontWithDescriptor:v8 size:0.0];
  [(UILabel *)self->_titleLabel setFont:v15];

  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"RECENT_CALLS" value:&stru_100285990 table:@"PHRecents"];
  [(UILabel *)self->_titleLabel setText:v17];

  v18 = [v3 tintColor];
  [(UILabel *)self->_titleLabel setTextColor:v18];

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_titleLabel];
  v19 = -[PHRecentCallDetailsView initWithFrame:]([PHRecentCallDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  detailsView = self->_detailsView;
  self->_detailsView = v19;

  [(PHRecentCallDetailsView *)self->_detailsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(MPRecentsMapItemHeaderViewController *)self recentCall];
  [(PHRecentCallDetailsView *)self->_detailsView setRecentCall:v21];

  [v3 addSubview:self->_detailsView];
  [(MPRecentsMapItemHeaderViewController *)self loadLayoutConstraints];
}

- (void)loadLayoutConstraints
{
  v3 = [(MPRecentsMapItemHeaderViewController *)self view];
  titleLabel = self->_titleLabel;
  double v5 = [(MPRecentsMapItemHeaderViewController *)self view];
  double v6 = +[NSLayoutConstraint constraintWithItem:titleLabel attribute:5 relatedBy:0 toItem:v5 attribute:5 multiplier:1.0 constant:16.0];
  [v3 addConstraint:v6];

  double v7 = [(MPRecentsMapItemHeaderViewController *)self view];
  v8 = self->_titleLabel;
  id v9 = [(MPRecentsMapItemHeaderViewController *)self view];
  v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:6 relatedBy:0 toItem:v9 attribute:6 multiplier:1.0 constant:16.0];
  [v7 addConstraint:v10];

  v11 = [(UILabel *)self->_titleLabel font];
  [v11 _scaledValueForValue:16.0];
  double v13 = v12;

  v14 = [(MPRecentsMapItemHeaderViewController *)self view];
  v15 = self->_titleLabel;
  v16 = [(MPRecentsMapItemHeaderViewController *)self view];
  v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v16 attribute:3 multiplier:1.0 constant:v13];
  [v14 addConstraint:v17];

  v18 = [(MPRecentsMapItemHeaderViewController *)self view];
  detailsView = self->_detailsView;
  v20 = [(MPRecentsMapItemHeaderViewController *)self view];
  v21 = +[NSLayoutConstraint constraintWithItem:detailsView attribute:5 relatedBy:0 toItem:v20 attribute:5 multiplier:1.0 constant:16.0];
  [v18 addConstraint:v21];

  objc_super v22 = [(MPRecentsMapItemHeaderViewController *)self view];
  v23 = self->_detailsView;
  v24 = [(MPRecentsMapItemHeaderViewController *)self view];
  v25 = +[NSLayoutConstraint constraintWithItem:v23 attribute:6 relatedBy:0 toItem:v24 attribute:6 multiplier:1.0 constant:0.0];
  [v22 addConstraint:v25];

  v26 = [(MPRecentsMapItemHeaderViewController *)self view];
  v27 = +[NSLayoutConstraint constraintWithItem:self->_detailsView attribute:3 relatedBy:0 toItem:self->_titleLabel attribute:11 multiplier:1.0 constant:0.0];
  [v26 addConstraint:v27];

  v28 = [(UILabel *)self->_titleLabel font];
  [v28 _scaledValueForValue:4.0];
  double v30 = -v29;

  id v34 = [(MPRecentsMapItemHeaderViewController *)self view];
  v31 = self->_detailsView;
  v32 = [(MPRecentsMapItemHeaderViewController *)self view];
  v33 = +[NSLayoutConstraint constraintWithItem:v31 attribute:4 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:v30];
  [v34 addConstraint:v33];
}

- (void)setRecentCall:(id)a3
{
  v8 = (CHRecentCall *)a3;
  if (self->_recentCall != v8)
  {
    objc_storeStrong((id *)&self->_recentCall, a3);
    double v5 = [(MPRecentsMapItemHeaderViewController *)self detailsView];

    if (v5)
    {
      double v6 = [(MPRecentsMapItemHeaderViewController *)self recentCall];
      double v7 = [(MPRecentsMapItemHeaderViewController *)self detailsView];
      [v7 setRecentCall:v6];
    }
  }
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (PHRecentCallDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end