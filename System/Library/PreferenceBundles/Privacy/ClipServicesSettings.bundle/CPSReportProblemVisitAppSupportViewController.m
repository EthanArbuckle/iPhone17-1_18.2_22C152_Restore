@interface CPSReportProblemVisitAppSupportViewController
- (id)finishAction;
- (void)doneButtonTapped;
- (void)openButtonTapped;
- (void)setFinishAction:(id)a3;
- (void)setupContentStackView;
- (void)viewDidLoad;
@end

@implementation CPSReportProblemVisitAppSupportViewController

- (void)viewDidLoad
{
  v65.receiver = self;
  v65.super_class = (Class)CPSReportProblemVisitAppSupportViewController;
  [(CPSReportProblemVisitAppSupportViewController *)&v65 viewDidLoad];
  v3 = _CPSLocalizedString();
  [(CPSReportProblemVisitAppSupportViewController *)self setTitle:v3];

  id v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = _CPSLocalizedString();
  id v6 = [v4 initWithTitle:v5 style:2 target:self action:"doneButtonTapped"];
  v7 = [(CPSReportProblemVisitAppSupportViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8 = +[UIColor systemBackgroundColor];
  v9 = [(CPSReportProblemVisitAppSupportViewController *)self view];
  [v9 setBackgroundColor:v8];

  id v10 = objc_alloc_init((Class)UIScrollView);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setContentInsetAdjustmentBehavior:2];
  v11 = [(CPSReportProblemVisitAppSupportViewController *)self view];
  [v11 addSubview:v10];

  [(CPSReportProblemVisitAppSupportViewController *)self setupContentStackView];
  [v10 addSubview:self->_contentStackView];
  v64 = [v10 frameLayoutGuide];
  v62 = [v64 topAnchor];
  v63 = [(CPSReportProblemVisitAppSupportViewController *)self view];
  v61 = [v63 topAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v66[0] = v60;
  v59 = [v10 frameLayoutGuide];
  v57 = [v59 leadingAnchor];
  v58 = [(CPSReportProblemVisitAppSupportViewController *)self view];
  v56 = [v58 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v66[1] = v55;
  v54 = [v10 frameLayoutGuide];
  v52 = [v54 trailingAnchor];
  v53 = [(CPSReportProblemVisitAppSupportViewController *)self view];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v66[2] = v50;
  v49 = [v10 frameLayoutGuide];
  v47 = [v49 bottomAnchor];
  v48 = [(CPSReportProblemVisitAppSupportViewController *)self view];
  v46 = [v48 bottomAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v66[3] = v45;
  v44 = [v10 frameLayoutGuide];
  v42 = [v44 widthAnchor];
  v43 = [v10 contentLayoutGuide];
  v41 = [v43 widthAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v66[4] = v40;
  v39 = [v10 frameLayoutGuide];
  v37 = [v39 heightAnchor];
  v38 = [v10 contentLayoutGuide];
  v36 = [v38 heightAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  LODWORD(v12) = 1132068864;
  v34 = objc_msgSend(v35, "cps_setPriority:", v12);
  v66[5] = v34;
  v32 = [(UIStackView *)self->_contentStackView topAnchor];
  v33 = [v10 contentLayoutGuide];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintGreaterThanOrEqualToAnchor:v31];
  v66[6] = v30;
  v28 = [(UIStackView *)self->_contentStackView leadingAnchor];
  v29 = [v10 layoutMarginsGuide];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v66[7] = v26;
  v25 = [v10 layoutMarginsGuide];
  v24 = [v25 trailingAnchor];
  v23 = [(UIStackView *)self->_contentStackView trailingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v66[8] = v22;
  v13 = [v10 contentLayoutGuide];
  v14 = [v13 bottomAnchor];
  v15 = [(UIStackView *)self->_contentStackView bottomAnchor];
  v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:40.0];
  v66[9] = v16;
  v17 = [(UIStackView *)self->_contentStackView centerYAnchor];
  v18 = [v10 contentLayoutGuide];
  v19 = [v18 centerYAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v66[10] = v20;
  v21 = +[NSArray arrayWithObjects:v66 count:11];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)setupContentStackView
{
  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  contentStackView = self->_contentStackView;
  self->_contentStackView = v3;

  [(UIStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_contentStackView setAxis:1];
  [(UIStackView *)self->_contentStackView setAlignment:3];
  id v5 = objc_alloc((Class)UIImageView);
  id v6 = +[UIImage systemImageNamed:@"safari"];
  id v7 = [v5 initWithImage:v6];

  v8 = +[UIColor systemMidGrayColor];
  [v7 setTintColor:v8];

  v9 = [v7 widthAnchor];
  id v10 = [v9 constraintEqualToConstant:120.0];
  v50[0] = v10;
  v11 = [v7 heightAnchor];
  double v12 = [v7 widthAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v50[1] = v13;
  v14 = +[NSArray arrayWithObjects:v50 count:2];
  +[NSLayoutConstraint activateConstraints:v14];

  v48 = v7;
  [(UIStackView *)self->_contentStackView addArrangedSubview:v7];
  [(UIStackView *)self->_contentStackView setCustomSpacing:v7 afterView:10.0];
  id v47 = objc_alloc_init((Class)UILabel);
  v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  [v47 setFont:v15];

  [v47 setAdjustsFontForContentSizeCategory:1];
  [v47 setNumberOfLines:0];
  v16 = _CPSLocalizedString();
  [v47 setText:v16];

  [v47 setTextAlignment:1];
  [(UIStackView *)self->_contentStackView addArrangedSubview:v47];
  [(UIStackView *)self->_contentStackView setCustomSpacing:v47 afterView:10.0];
  id v17 = objc_alloc_init((Class)UILabel);
  v18 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:");
  [v17 setFont:v18];

  [v17 setAdjustsFontForContentSizeCategory:1];
  [v17 setNumberOfLines:0];
  v19 = +[UIColor secondaryLabelColor];
  [v17 setTextColor:v19];

  v20 = _CPSLocalizedString();
  [v17 setText:v20];

  [v17 setTextAlignment:1];
  [(UIStackView *)self->_contentStackView addArrangedSubview:v17];
  [(UIStackView *)self->_contentStackView setCustomSpacing:v17 afterView:40.0];
  v46 = [v17 leadingAnchor];
  v21 = [(UIStackView *)self->_contentStackView layoutMarginsGuide];
  v22 = [v21 leadingAnchor];
  v23 = [v46 constraintEqualToAnchor:v22 constant:55.0];
  v49[0] = v23;
  v24 = [v17 trailingAnchor];
  v25 = [(UIStackView *)self->_contentStackView layoutMarginsGuide];
  v26 = [v25 trailingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:-55.0];
  v49[1] = v27;
  v28 = +[NSArray arrayWithObjects:v49 count:2];
  +[NSLayoutConstraint activateConstraints:v28];

  v29 = +[UIButton buttonWithType:1];
  openButton = self->_openButton;
  self->_openButton = v29;

  v31 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v32 = [(UIButton *)self->_openButton titleLabel];
  [v32 setFont:v31];

  v33 = [(UIButton *)self->_openButton titleLabel];
  [v33 setAdjustsFontForContentSizeCategory:1];

  v34 = [(UIButton *)self->_openButton titleLabel];
  [v34 setNumberOfLines:0];

  v35 = [(UIButton *)self->_openButton titleLabel];
  [v35 setTextAlignment:1];

  v36 = [(UIButton *)self->_openButton lastBaselineAnchor];
  v37 = [(UIButton *)self->_openButton lastBaselineAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  LODWORD(v39) = 1132068864;
  v40 = objc_msgSend(v38, "cps_setPriority:", v39);
  [v40 setActive:1];

  -[UIButton setContentEdgeInsets:](self->_openButton, "setContentEdgeInsets:", 15.0, 50.0, 15.0, 50.0);
  v41 = self->_openButton;
  v42 = _CPSLocalizedString();
  [(UIButton *)v41 setTitle:v42 forState:0];

  v43 = self->_openButton;
  v44 = +[UIColor whiteColor];
  [(UIButton *)v43 setTitleColor:v44 forState:0];

  v45 = +[UIColor systemBlueColor];
  [(UIButton *)self->_openButton setBackgroundColor:v45];

  [(UIButton *)self->_openButton _setContinuousCornerRadius:12.0];
  [(UIStackView *)self->_contentStackView addArrangedSubview:self->_openButton];
  [(UIButton *)self->_openButton addTarget:self action:"openButtonTapped" forControlEvents:0x2000];
}

- (void)openButtonTapped
{
  finishAction = (void (**)(id, uint64_t))self->_finishAction;
  if (finishAction) {
    finishAction[2](finishAction, 1);
  }
}

- (void)doneButtonTapped
{
  finishAction = (void (**)(id, void))self->_finishAction;
  if (finishAction) {
    finishAction[2](finishAction, 0);
  }
}

- (id)finishAction
{
  return self->_finishAction;
}

- (void)setFinishAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishAction, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end