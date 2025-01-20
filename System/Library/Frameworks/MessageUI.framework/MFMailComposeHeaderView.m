@interface MFMailComposeHeaderView
- (MFComposeDisplayMetrics)displayMetrics;
- (void)displayMetricsDidChange;
- (void)layoutMarginsDidChange;
- (void)setDisplayMetrics:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFMailComposeHeaderView

- (void)setDisplayMetrics:(id)a3
{
  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    [(MFMailComposeHeaderView *)self displayMetricsDidChange];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v17 = [(MFMailComposeHeaderView *)self traitCollection];
  [(MFMailComposeHeaderView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFMailComposeHeaderView *)self safeAreaInsets];
  v16 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v17, v5, v7, v9, v11, v12, v13, v14, v15);
  [(MFMailComposeHeaderView *)self setDisplayMetrics:v16];
}

- (void)layoutMarginsDidChange
{
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeHeaderView;
  [(MFMailComposeHeaderView *)&v17 layoutMarginsDidChange];
  v3 = [(MFMailComposeHeaderView *)self traitCollection];
  [(MFMailComposeHeaderView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFMailComposeHeaderView *)self safeAreaInsets];
  v16 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
  [(MFMailComposeHeaderView *)self setDisplayMetrics:v16];
}

- (void)displayMetricsDidChange
{
  id v3 = [(MFMailComposeHeaderView *)self displayMetrics];
  [v3 headerViewSeparatorInset];
  -[MFMailComposeHeaderView setSeparatorDirectionalEdgeInsets:](self, "setSeparatorDirectionalEdgeInsets:");
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void).cxx_destruct
{
}

@end