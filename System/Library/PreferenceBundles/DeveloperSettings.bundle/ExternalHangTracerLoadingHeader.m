@interface ExternalHangTracerLoadingHeader
- (ExternalHangTracerLoadingHeader)initWithSpecifier:(id)a3;
- (NSLayoutConstraint)labelAlignmentConstraint;
- (NSLayoutConstraint)labelHeightConstraint;
- (NSLayoutConstraint)stackViewConstraint;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)headerLabel;
- (UIStackView)contentStackView;
- (void)setContentStackView:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setLabelAlignmentConstraint:(id)a3;
- (void)setLabelHeightConstraint:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setStackViewConstraint:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation ExternalHangTracerLoadingHeader

- (ExternalHangTracerLoadingHeader)initWithSpecifier:(id)a3
{
  id v62 = a3;
  v67.receiver = self;
  v67.super_class = (Class)ExternalHangTracerLoadingHeader;
  v4 = [(ExternalHangTracerLoadingHeader *)&v67 init];
  if (v4)
  {
    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = v5;

    [(UILabel *)v4->_headerLabel setNumberOfLines:0];
    v7 = +[UITableViewHeaderFooterView _defaultFontForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v4->_headerLabel setFont:v7];

    v8 = +[UITableViewHeaderFooterView _defaultTextColorForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v4->_headerLabel setTextColor:v8];

    v9 = [v62 name];
    v10 = [v9 localizedUppercaseString];
    [(UILabel *)v4->_headerLabel setText:v10];

    [(UILabel *)v4->_headerLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v11) = 1148846080;
    [(UILabel *)v4->_headerLabel setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UILabel *)v4->_headerLabel setContentCompressionResistancePriority:1 forAxis:v12];
    LODWORD(v13) = 1144750080;
    [(UILabel *)v4->_headerLabel setContentHuggingPriority:0 forAxis:v13];
    LODWORD(v14) = 1144750080;
    [(UILabel *)v4->_headerLabel setContentHuggingPriority:1 forAxis:v14];
    [(ExternalHangTracerLoadingHeader *)v4 addSubview:v4->_headerLabel];
    v15 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinnerView = v4->_spinnerView;
    v4->_spinnerView = v15;

    [(UIActivityIndicatorView *)v4->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ExternalHangTracerLoadingHeader *)v4 addSubview:v4->_spinnerView];
    id v17 = objc_alloc((Class)UIStackView);
    v70[0] = v4->_headerLabel;
    v70[1] = v4->_spinnerView;
    v18 = +[NSArray arrayWithObjects:v70 count:2];
    id v19 = [v17 initWithArrangedSubviews:v18];

    v20 = [(ExternalHangTracerLoadingHeader *)v4 traitCollection];
    v21 = [v20 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);

    [v19 setAxis:IsAccessibilityCategory];
    [v19 setSpacing:8.0];
    [v19 setAlignment:3];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v22) = 1148846080;
    [v19 setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [v19 setContentHuggingPriority:1 forAxis:v23];
    [(ExternalHangTracerLoadingHeader *)v4 addSubview:v19];
    v24 = [(UIActivityIndicatorView *)v4->_spinnerView centerYAnchor];
    v25 = [(UILabel *)v4->_headerLabel centerYAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25];
    labelAlignmentConstraint = v4->_labelAlignmentConstraint;
    v4->_labelAlignmentConstraint = (NSLayoutConstraint *)v26;

    BOOL v28 = !IsAccessibilityCategory;
    [(NSLayoutConstraint *)v4->_labelAlignmentConstraint setActive:v28];
    v29 = [(UIActivityIndicatorView *)v4->_spinnerView heightAnchor];
    v30 = [(UILabel *)v4->_headerLabel heightAnchor];
    uint64_t v31 = [v29 constraintEqualToAnchor:v30];
    labelHeightConstraint = v4->_labelHeightConstraint;
    v4->_labelHeightConstraint = (NSLayoutConstraint *)v31;

    [(NSLayoutConstraint *)v4->_labelHeightConstraint setActive:v28];
    v33 = [v19 heightAnchor];
    v34 = [(UILabel *)v4->_headerLabel heightAnchor];
    uint64_t v35 = [v33 constraintEqualToAnchor:v34];
    stackViewConstraint = v4->_stackViewConstraint;
    v4->_stackViewConstraint = (NSLayoutConstraint *)v35;

    [(NSLayoutConstraint *)v4->_stackViewConstraint setActive:v28];
    v60 = [(UIActivityIndicatorView *)v4->_spinnerView widthAnchor];
    v59 = [v60 constraintGreaterThanOrEqualToConstant:20.0];
    v69[0] = v59;
    v57 = [v19 leadingAnchor];
    v58 = [(ExternalHangTracerLoadingHeader *)v4 layoutMarginsGuide];
    v56 = [v58 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:12.0];
    v69[1] = v55;
    v53 = [v19 trailingAnchor];
    v54 = [(ExternalHangTracerLoadingHeader *)v4 layoutMarginsGuide];
    v52 = [v54 trailingAnchor];
    v51 = [v53 constraintLessThanOrEqualToAnchor:v52 constant:-12.0];
    v69[2] = v51;
    v37 = [v19 topAnchor];
    v38 = [(ExternalHangTracerLoadingHeader *)v4 topAnchor];
    v39 = [v62 objectForKeyedSubscript:@"top-margin"];
    [v39 doubleValue];
    if (v40 == 0.0) {
      double v40 = 10.0;
    }
    v41 = [v37 constraintEqualToAnchor:v38 constant:v40];
    v69[3] = v41;
    v42 = [v19 bottomAnchor];
    v43 = [(ExternalHangTracerLoadingHeader *)v4 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:-8.0];
    v69[4] = v44;
    v45 = +[NSArray arrayWithObjects:v69 count:5];
    +[NSLayoutConstraint activateConstraints:v45];

    [(ExternalHangTracerLoadingHeader *)v4 startAnimating];
    objc_initWeak(&location, v4);
    v46 = self;
    v68[0] = v46;
    v47 = self;
    v68[1] = v47;
    v48 = +[NSArray arrayWithObjects:v68 count:2];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_BDC0;
    v63[3] = &unk_34EE0;
    objc_copyWeak(&v64, &location);
    BOOL v65 = IsAccessibilityCategory;
    id v49 = [(ExternalHangTracerLoadingHeader *)v4 registerForTraitChanges:v48 withHandler:v63];

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (NSLayoutConstraint)labelAlignmentConstraint
{
  return self->_labelAlignmentConstraint;
}

- (void)setLabelAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelHeightConstraint
{
  return self->_labelHeightConstraint;
}

- (void)setLabelHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewConstraint
{
  return self->_stackViewConstraint;
}

- (void)setStackViewConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewConstraint, 0);
  objc_storeStrong((id *)&self->_labelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);

  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end