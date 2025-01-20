@interface PHSOSAlertRestingView
- (BOOL)hasMedicalIDSlider;
- (PHSOSAlertRestingView)initWithFrame:(CGRect)a3;
- (PHSOSAlertRestingViewModel)viewModel;
- (PHSlidingButton)medicalIDSlidingButton;
- (UIButton)showMessagesButton;
- (UILabel)firstSubtitleLabel;
- (UILabel)secondSubtitleLabel;
- (UILabel)titleLabel;
- (double)sliderDistanceFromBottom;
- (double)titleDistanceFromTop;
- (id)completionHandler;
- (void)commonInit;
- (void)didFinishSlideForSlidingButton:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setFirstSubtitleLabel:(id)a3;
- (void)setHasMedicalIDSlider:(BOOL)a3;
- (void)setMedicalIDSlidingButton:(id)a3;
- (void)setSecondSubtitleLabel:(id)a3;
- (void)setShowMessagesButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setViewModel:(id)a3;
- (void)showMessagesButtonPressed;
@end

@implementation PHSOSAlertRestingView

- (PHSOSAlertRestingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHSOSAlertRestingView;
  v3 = -[PHSOSAlertRestingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PHSOSAlertRestingView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc_init((Class)UILabel);
  [(PHSOSAlertRestingView *)self setTitleLabel:v3];

  v4 = [(PHSOSAlertRestingView *)self titleLabel];
  [v4 setTextAlignment:1];

  v5 = [(PHSOSAlertRestingView *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = +[UIFont boldSystemFontOfSize:34.0];
  v7 = [(PHSOSAlertRestingView *)self titleLabel];
  [v7 setFont:v6];

  v8 = +[UIColor whiteColor];
  v9 = [(PHSOSAlertRestingView *)self titleLabel];
  [v9 setTextColor:v8];

  v10 = [(PHSOSAlertRestingView *)self titleLabel];
  [v10 setNumberOfLines:0];

  v11 = [(PHSOSAlertRestingView *)self titleLabel];
  [(PHSOSAlertRestingView *)self addSubview:v11];

  id v12 = objc_alloc_init((Class)UILabel);
  [(PHSOSAlertRestingView *)self setFirstSubtitleLabel:v12];

  v13 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  [v13 setTextAlignment:1];

  v14 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  [v15 setNumberOfLines:0];

  id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_1002D6110];
  id v66 = objc_alloc_init((Class)NSTextAttachment);
  v17 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
  v67 = +[UIImageSymbolConfiguration configurationWithFont:v17];

  v18 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v67];
  v19 = +[UIColor systemRedColor];
  v20 = [v18 imageWithTintColor:v19];
  [v66 setImage:v20];

  v65 = +[NSAttributedString attributedStringWithAttachment:v66];
  [v16 appendAttributedString:v65];
  NSAttributedStringKey v75 = NSFontAttributeName;
  v21 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
  v76 = v21;
  v64 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];

  id v63 = [objc_alloc((Class)NSAttributedString) initWithString:@" " attributes:v64];
  [v16 appendAttributedString:v63];
  v73[0] = NSFontAttributeName;
  v22 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
  v74[0] = v22;
  v73[1] = NSForegroundColorAttributeName;
  v23 = +[UIColor systemRedColor];
  v74[1] = v23;
  v62 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];

  id v24 = objc_alloc((Class)NSAttributedString);
  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"SOS_ALERT_RESTING_VIEW_FIRST_SUBTITLE" value:&stru_1002D6110 table:@"Localizable-Stewie"];
  id v61 = [v24 initWithString:v26 attributes:v62];

  [v16 appendAttributedString:v61];
  v27 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  [v27 setAttributedText:v16];

  v28 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  [(PHSOSAlertRestingView *)self addSubview:v28];

  id v29 = objc_alloc_init((Class)UILabel);
  [(PHSOSAlertRestingView *)self setSecondSubtitleLabel:v29];

  v30 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [v30 setTextAlignment:1];

  v31 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = +[UIFont systemFontOfSize:20.0];
  v33 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [v33 setFont:v32];

  v34 = +[UIColor whiteColor];
  v35 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [v35 setTextColor:v34];

  v36 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [v36 setNumberOfLines:0];

  v37 = +[NSBundle mainBundle];
  v38 = [v37 localizedStringForKey:@"SOS_ALERT_RESTING_VIEW_SECOND_SUBTITLE" value:&stru_1002D6110 table:@"Localizable-Stewie"];
  v39 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [v39 setText:v38];

  v40 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  [(PHSOSAlertRestingView *)self addSubview:v40];

  v41 = +[NSBundle mainBundle];
  v42 = [v41 localizedStringForKey:@"SOS_ALERT_RESTING_VIEW_BUTTON_LABEL" value:&stru_1002D6110 table:@"Localizable-Stewie"];

  v71[0] = NSFontAttributeName;
  v43 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
  v71[1] = NSForegroundColorAttributeName;
  v72[0] = v43;
  v44 = +[UIColor systemGreenColor];
  v72[1] = v44;
  v45 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];

  id v46 = [objc_alloc((Class)NSAttributedString) initWithString:v42 attributes:v45];
  objc_initWeak(&location, self);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000D61FC;
  v68[3] = &unk_1002CE218;
  objc_copyWeak(&v69, &location);
  v47 = +[UIAction actionWithTitle:v42 image:0 identifier:0 handler:v68];
  v48 = +[UIButton buttonWithType:0 primaryAction:v47];
  [(PHSOSAlertRestingView *)self setShowMessagesButton:v48];

  v49 = [(PHSOSAlertRestingView *)self showMessagesButton];
  [v49 setTranslatesAutoresizingMaskIntoConstraints:0];

  v50 = [(PHSOSAlertRestingView *)self showMessagesButton];
  v51 = [v50 layer];
  [v51 setCornerRadius:36.0];

  v52 = +[UIColor systemGreenColor];
  v53 = [v52 colorWithAlphaComponent:0.150000006];
  v54 = [(PHSOSAlertRestingView *)self showMessagesButton];
  [v54 setBackgroundColor:v53];

  v55 = [(PHSOSAlertRestingView *)self showMessagesButton];
  [v55 setAttributedTitle:v46 forState:0];

  v56 = [(PHSOSAlertRestingView *)self showMessagesButton];
  [(PHSOSAlertRestingView *)self addSubview:v56];

  v57 = [[PHSlidingButton alloc] initWithSlidingButtonType:9 appearanceType:0 callState:2];
  [(PHSOSAlertRestingView *)self setMedicalIDSlidingButton:v57];

  v58 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];
  [v58 setTranslatesAutoresizingMaskIntoConstraints:0];

  v59 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];
  [v59 setDelegate:self];

  v60 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];
  [(PHSOSAlertRestingView *)self addSubview:v60];

  [(PHSOSAlertRestingView *)self setUpConstraints];
  [(PHSOSAlertRestingView *)self setHasMedicalIDSlider:0];

  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);
}

- (void)setUpConstraints
{
  id v76 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [(PHSOSAlertRestingView *)self titleLabel];
  v4 = [v3 leadingAnchor];
  v5 = [(PHSOSAlertRestingView *)self leadingAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5];
  [v76 addObject:v6];

  v7 = [(PHSOSAlertRestingView *)self titleLabel];
  v8 = [v7 trailingAnchor];
  v9 = [(PHSOSAlertRestingView *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v76 addObject:v10];

  v11 = [(PHSOSAlertRestingView *)self titleLabel];
  id v12 = [v11 topAnchor];
  v13 = [(PHSOSAlertRestingView *)self safeAreaLayoutGuide];
  v14 = [v13 topAnchor];
  [(PHSOSAlertRestingView *)self titleDistanceFromTop];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v76 addObject:v15];

  id v16 = [(PHSOSAlertRestingView *)self titleLabel];
  v17 = [v16 centerXAnchor];
  v18 = [(PHSOSAlertRestingView *)self centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v76 addObject:v19];

  v20 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  v21 = [v20 leadingAnchor];
  v22 = [(PHSOSAlertRestingView *)self leadingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v76 addObject:v23];

  id v24 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  v25 = [v24 trailingAnchor];
  v26 = [(PHSOSAlertRestingView *)self trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v76 addObject:v27];

  v28 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  id v29 = [v28 bottomAnchor];
  v30 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  v31 = [v30 topAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v76 addObject:v32];

  v33 = [(PHSOSAlertRestingView *)self firstSubtitleLabel];
  v34 = [v33 centerXAnchor];
  v35 = [(PHSOSAlertRestingView *)self centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v76 addObject:v36];

  v37 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  v38 = [v37 leadingAnchor];
  v39 = [(PHSOSAlertRestingView *)self leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v76 addObject:v40];

  v41 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  v42 = [v41 trailingAnchor];
  v43 = [(PHSOSAlertRestingView *)self trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v76 addObject:v44];

  v45 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  id v46 = [v45 bottomAnchor];
  v47 = [(PHSOSAlertRestingView *)self centerYAnchor];
  v48 = [v46 constraintEqualToAnchor:v47 constant:-8.0];
  [v76 addObject:v48];

  v49 = [(PHSOSAlertRestingView *)self secondSubtitleLabel];
  v50 = [v49 centerXAnchor];
  v51 = [(PHSOSAlertRestingView *)self centerXAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v76 addObject:v52];

  v53 = [(PHSOSAlertRestingView *)self showMessagesButton];
  v54 = [v53 widthAnchor];
  v55 = [v54 constraintEqualToConstant:300.0];
  [v76 addObject:v55];

  v56 = [(PHSOSAlertRestingView *)self showMessagesButton];
  v57 = [v56 heightAnchor];
  v58 = [v57 constraintEqualToConstant:72.0];
  [v76 addObject:v58];

  v59 = [(PHSOSAlertRestingView *)self showMessagesButton];
  v60 = [v59 centerXAnchor];
  id v61 = [(PHSOSAlertRestingView *)self centerXAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v76 addObject:v62];

  id v63 = [(PHSOSAlertRestingView *)self showMessagesButton];
  v64 = [v63 topAnchor];
  v65 = [(PHSOSAlertRestingView *)self centerYAnchor];
  id v66 = [v64 constraintEqualToAnchor:v65 constant:8.0];
  [v76 addObject:v66];

  v67 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];
  v68 = [v67 centerXAnchor];
  id v69 = [(PHSOSAlertRestingView *)self centerXAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  [v76 addObject:v70];

  v71 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];
  v72 = [v71 bottomAnchor];
  v73 = [(PHSOSAlertRestingView *)self bottomAnchor];
  [(PHSOSAlertRestingView *)self sliderDistanceFromBottom];
  NSAttributedStringKey v75 = [v72 constraintEqualToAnchor:v73 constant:-v74];
  [v76 addObject:v75];

  +[NSLayoutConstraint activateConstraints:v76];
}

- (double)titleDistanceFromTop
{
  double v2 = 27.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing])
  {
    id v3 = +[UIScreen mainScreen];
    [v3 bounds];
    double v2 = v4 * 0.0599999987;
  }
  return v2;
}

- (double)sliderDistanceFromBottom
{
  double v2 = 30.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing])
  {
    id v3 = +[UIScreen mainScreen];
    [v3 bounds];
    double v2 = v4 * 0.0500000007;
  }
  return v2;
}

- (void)setHasMedicalIDSlider:(BOOL)a3
{
  unsigned int v3 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSAlertRestingView,showing medical ID slider,%d", (uint8_t *)v7, 8u);
  }

  self->_hasMedicalIDSlider = v3;
  objc_super v6 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];
  [v6 setAlpha:(double)v3];
}

- (void)setViewModel:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  viewModel = self->_viewModel;
  if (viewModel)
  {
    objc_super v6 = [(PHSOSAlertRestingViewModel *)viewModel titleString];
    v7 = [(PHSOSAlertRestingView *)self titleLabel];
    [v7 setText:v6];
  }
}

- (void)showMessagesButtonPressed
{
  unsigned int v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHSOSAlertRestingView,user pressed show messages button", v6, 2u);
  }

  double v4 = [(PHSOSAlertRestingView *)self completionHandler];

  if (v4)
  {
    v5 = [(PHSOSAlertRestingView *)self completionHandler];
    v5[2](v5, 0);
  }
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PHSOSAlertRestingView *)self medicalIDSlidingButton];

  if (v5 == v4)
  {
    objc_super v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSAlertRestingView,user slid medical ID slider", v9, 2u);
    }

    v7 = [(PHSOSAlertRestingView *)self completionHandler];

    if (v7)
    {
      id v8 = [(PHSOSAlertRestingView *)self completionHandler];
      v8[2](v8, 1);
    }
  }
}

- (BOOL)hasMedicalIDSlider
{
  return self->_hasMedicalIDSlider;
}

- (PHSOSAlertRestingViewModel)viewModel
{
  return self->_viewModel;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)firstSubtitleLabel
{
  return self->_firstSubtitleLabel;
}

- (void)setFirstSubtitleLabel:(id)a3
{
}

- (UILabel)secondSubtitleLabel
{
  return self->_secondSubtitleLabel;
}

- (void)setSecondSubtitleLabel:(id)a3
{
}

- (UIButton)showMessagesButton
{
  return self->_showMessagesButton;
}

- (void)setShowMessagesButton:(id)a3
{
}

- (PHSlidingButton)medicalIDSlidingButton
{
  return self->_medicalIDSlidingButton;
}

- (void)setMedicalIDSlidingButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, 0);
  objc_storeStrong((id *)&self->_showMessagesButton, 0);
  objc_storeStrong((id *)&self->_secondSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_firstSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end