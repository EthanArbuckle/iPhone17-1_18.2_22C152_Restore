@interface PHSOSRestingView
- (BOOL)hasMedicalIDSlider;
- (NSDate)dateOfSOSEvent;
- (PHSOSRestingView)initWithFrame:(CGRect)a3;
- (PHSOSRestingViewModel)viewModel;
- (PHSlidingButton)medicalIDSlidingButton;
- (PHSlidingButton)sosCallSlidingButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)medicalIdSliderDistanceFromBottom;
- (double)sosSliderDistanceFromMedicalId;
- (double)titleDistanceFromTop;
- (id)completionHandler;
- (void)commonInit;
- (void)didFinishSlideForSlidingButton:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDateOfSOSEvent:(id)a3;
- (void)setHasMedicalIDSlider:(BOOL)a3;
- (void)setMedicalIDSlidingButton:(id)a3;
- (void)setSosCallSlidingButton:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleAndSubtitle;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setViewModel:(id)a3;
- (void)setdateOfSOSEvent:(id)a3;
@end

@implementation PHSOSRestingView

- (PHSOSRestingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHSOSRestingView;
  v3 = -[PHSOSRestingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PHSOSRestingView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc_init((Class)UILabel);
  [(PHSOSRestingView *)self setTitleLabel:v3];

  v4 = [(PHSOSRestingView *)self titleLabel];
  [v4 setTextAlignment:1];

  v5 = [(PHSOSRestingView *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = +[UIFont boldSystemFontOfSize:34.0];
  v7 = [(PHSOSRestingView *)self titleLabel];
  [v7 setFont:v6];

  v8 = +[UIColor whiteColor];
  v9 = [(PHSOSRestingView *)self titleLabel];
  [v9 setTextColor:v8];

  v10 = [(PHSOSRestingView *)self titleLabel];
  [v10 setNumberOfLines:0];

  v11 = [(PHSOSRestingView *)self titleLabel];
  [(PHSOSRestingView *)self addSubview:v11];

  id v12 = objc_alloc_init((Class)UILabel);
  [(PHSOSRestingView *)self setSubtitleLabel:v12];

  v13 = [(PHSOSRestingView *)self subtitleLabel];
  [v13 setTextAlignment:1];

  v14 = [(PHSOSRestingView *)self subtitleLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = +[UIFont systemFontOfSize:22.0];
  v16 = [(PHSOSRestingView *)self subtitleLabel];
  [v16 setFont:v15];

  v17 = +[UIColor whiteColor];
  v18 = [(PHSOSRestingView *)self subtitleLabel];
  [v18 setTextColor:v17];

  v19 = [(PHSOSRestingView *)self subtitleLabel];
  [v19 setNumberOfLines:0];

  v20 = [(PHSOSRestingView *)self subtitleLabel];
  [(PHSOSRestingView *)self addSubview:v20];

  v21 = [[PHSlidingButton alloc] initWithSlidingButtonType:9 appearanceType:0 callState:2];
  [(PHSOSRestingView *)self setMedicalIDSlidingButton:v21];

  v22 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  [v23 setDelegate:self];

  v24 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  [(PHSOSRestingView *)self addSubview:v24];

  v25 = [[PHSlidingButton alloc] initWithSlidingButtonType:7 appearanceType:0 callState:2];
  [(PHSOSRestingView *)self setSosCallSlidingButton:v25];

  v26 = [(PHSOSRestingView *)self sosCallSlidingButton];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(PHSOSRestingView *)self sosCallSlidingButton];
  [v27 setDelegate:self];

  v28 = [(PHSOSRestingView *)self sosCallSlidingButton];
  [(PHSOSRestingView *)self addSubview:v28];

  [(PHSOSRestingView *)self setUpConstraints];

  [(PHSOSRestingView *)self setHasMedicalIDSlider:0];
}

- (void)setUpConstraints
{
  id v56 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [(PHSOSRestingView *)self titleLabel];
  v4 = [v3 leadingAnchor];
  v5 = [(PHSOSRestingView *)self leadingAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5];
  [v56 addObject:v6];

  v7 = [(PHSOSRestingView *)self titleLabel];
  v8 = [v7 trailingAnchor];
  v9 = [(PHSOSRestingView *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v56 addObject:v10];

  v11 = [(PHSOSRestingView *)self titleLabel];
  id v12 = [v11 topAnchor];
  v13 = [(PHSOSRestingView *)self safeAreaLayoutGuide];
  v14 = [v13 topAnchor];
  [(PHSOSRestingView *)self titleDistanceFromTop];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v56 addObject:v15];

  v16 = [(PHSOSRestingView *)self titleLabel];
  v17 = [v16 centerXAnchor];
  v18 = [(PHSOSRestingView *)self centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v56 addObject:v19];

  v20 = [(PHSOSRestingView *)self subtitleLabel];
  v21 = [v20 leadingAnchor];
  v22 = [(PHSOSRestingView *)self leadingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v56 addObject:v23];

  v24 = [(PHSOSRestingView *)self subtitleLabel];
  v25 = [v24 trailingAnchor];
  v26 = [(PHSOSRestingView *)self trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v56 addObject:v27];

  v28 = [(PHSOSRestingView *)self subtitleLabel];
  v29 = [v28 topAnchor];
  v30 = [(PHSOSRestingView *)self titleLabel];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:22.0];
  [v56 addObject:v32];

  v33 = [(PHSOSRestingView *)self subtitleLabel];
  v34 = [v33 centerXAnchor];
  v35 = [(PHSOSRestingView *)self centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v56 addObject:v36];

  v37 = [(PHSOSRestingView *)self sosCallSlidingButton];
  v38 = [v37 bottomAnchor];
  v39 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  v40 = [v39 topAnchor];
  [(PHSOSRestingView *)self sosSliderDistanceFromMedicalId];
  v42 = [v38 constraintEqualToAnchor:v40 constant:-v41];
  [v56 addObject:v42];

  v43 = [(PHSOSRestingView *)self sosCallSlidingButton];
  v44 = [v43 centerXAnchor];
  v45 = [(PHSOSRestingView *)self centerXAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v56 addObject:v46];

  v47 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  v48 = [v47 bottomAnchor];
  v49 = [(PHSOSRestingView *)self bottomAnchor];
  [(PHSOSRestingView *)self medicalIdSliderDistanceFromBottom];
  v51 = [v48 constraintEqualToAnchor:v49 constant:-v50];
  [v56 addObject:v51];

  v52 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  v53 = [v52 centerXAnchor];
  v54 = [(PHSOSRestingView *)self centerXAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v56 addObject:v55];

  +[NSLayoutConstraint activateConstraints:v56];
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

- (double)sosSliderDistanceFromMedicalId
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

- (double)medicalIdSliderDistanceFromBottom
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

- (void)setdateOfSOSEvent:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_dateOfSOSEvent, a3);
  viewModel = self->_viewModel;
  if (viewModel)
  {
    [(PHSOSRestingViewModel *)viewModel setDateOfSOSEvent:v6];
    [(PHSOSRestingView *)self setTitleAndSubtitle];
  }
}

- (void)setHasMedicalIDSlider:(BOOL)a3
{
  unsigned int v3 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSRestingView,showing medical ID slider,%d", (uint8_t *)v7, 8u);
  }

  self->_hasMedicalIDSlider = v3;
  id v6 = [(PHSOSRestingView *)self medicalIDSlidingButton];
  [v6 setAlpha:(double)v3];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  if (self->_dateOfSOSEvent) {
    -[PHSOSRestingViewModel setDateOfSOSEvent:](self->_viewModel, "setDateOfSOSEvent:");
  }
  [(PHSOSRestingView *)self setTitleAndSubtitle];
}

- (void)setTitleAndSubtitle
{
  viewModel = self->_viewModel;
  if (viewModel)
  {
    double v4 = [(PHSOSRestingViewModel *)viewModel titleString];
    id v5 = [(PHSOSRestingView *)self titleLabel];
    [v5 setText:v4];

    id v7 = [(PHSOSRestingViewModel *)self->_viewModel subtitleString];
    id v6 = [(PHSOSRestingView *)self subtitleLabel];
    [v6 setText:v7];
  }
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PHSOSRestingView *)self sosCallSlidingButton];

  if (v5 == v4)
  {
    v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHSOSRestingView,user slid SOS slider", buf, 2u);
    }

    id v12 = [(PHSOSRestingView *)self completionHandler];

    if (v12)
    {
      v9 = [(PHSOSRestingView *)self completionHandler];
      v10 = (void (*)(void))v9[2];
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = [(PHSOSRestingView *)self medicalIDSlidingButton];

    if (v6 == v4)
    {
      id v7 = sub_1000D5130();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHSOSRestingView,user slid medical ID slider", v13, 2u);
      }

      v8 = [(PHSOSRestingView *)self completionHandler];

      if (v8)
      {
        v9 = [(PHSOSRestingView *)self completionHandler];
        v10 = (void (*)(void))v9[2];
LABEL_11:
        v10();
      }
    }
  }
}

- (NSDate)dateOfSOSEvent
{
  return self->_dateOfSOSEvent;
}

- (void)setDateOfSOSEvent:(id)a3
{
}

- (BOOL)hasMedicalIDSlider
{
  return self->_hasMedicalIDSlider;
}

- (PHSOSRestingViewModel)viewModel
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

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (PHSlidingButton)medicalIDSlidingButton
{
  return self->_medicalIDSlidingButton;
}

- (void)setMedicalIDSlidingButton:(id)a3
{
}

- (PHSlidingButton)sosCallSlidingButton
{
  return self->_sosCallSlidingButton;
}

- (void)setSosCallSlidingButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosCallSlidingButton, 0);
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_dateOfSOSEvent, 0);
}

@end