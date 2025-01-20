@interface CalibrationViewController
- (BOOL)circleIsCompleted;
- (BOOL)prefersStatusBarHidden;
- (CalibrationViewController)init;
- (CalibrationViewController)initWithOriginPoint:(CGPoint)a3;
- (double)_correctedAngleForCurrentOrientation:(double)a3;
- (double)completeCircle;
- (float)quantizedPercentage:(double)a3 forAngle:(double)a4;
- (id)updatedMaskingPath;
- (void)_updateSizes;
- (void)addConstraints;
- (void)cancel;
- (void)dealloc;
- (void)hideAllTics;
- (void)reset;
- (void)setBallAngle:(double)a3 tiltAngle:(double)a4;
- (void)setMotion:(id)a3;
- (void)showTicAtAngle:(double)a3 withCredit:(double)a4;
- (void)showTicsBetweenStartAngle:(double)a3 endAngle:(double)a4 withCredit:(double)a5;
- (void)updateMaskingPath;
- (void)userDefaultsChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CalibrationViewController

- (CalibrationViewController)init
{
  return (CalibrationViewController *)MEMORY[0x270F9A6D0](self, sel_initWithOriginPoint_);
}

- (CalibrationViewController)initWithOriginPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)CalibrationViewController;
  v5 = [(CalibrationViewController *)&v14 init];
  if (v5)
  {
    v5->_ticsShowingArradouble y = (float *)malloc_type_calloc(0xB4uLL, 4uLL, 0x100004052888210uLL);
    v5->_angleToRim = 0.34906585;
    v5->_previousHorizontalAngle = -1.0;
    if (x != *MEMORY[0x263F00148] || y != *(double *)(MEMORY[0x263F00148] + 8))
    {
      v5->_compassOriginPoint.double x = x;
      v5->_compassOriginPoint.double y = y;
    }
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v7 doubleForKey:@"CalibrationAwesomeAngle"];
    v5->_calibrationAngle = v8 * 3.14159265 / 180.0;

    if (v5->_calibrationAngle == 0.0) {
      v5->_calibrationAngle = 0.872664626;
    }
    v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v5->_quantizationType = [v9 integerForKey:@"CalibrationQuantizationType"];

    if (!v5->_quantizationType) {
      v5->_quantizationType = 0;
    }
    v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v5->_shouldCompleteTics = [v10 BOOLForKey:@"CalibrationShouldCompleteTics"];

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    calibrationConstraints = v5->_calibrationConstraints;
    v5->_calibrationConstraints = v11;
  }
  return v5;
}

- (void)_updateSizes
{
  v3 = [(CalibrationViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] == 2)
  {
    v4 = [(CalibrationViewController *)self traitCollection];
    BOOL v5 = [v4 verticalSizeClass] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  v6 = [(CalibrationViewController *)self view];
  [v6 frame];
  double Width = CGRectGetWidth(v39);

  double v8 = [(CalibrationViewController *)self view];
  [v8 frame];
  double Height = CGRectGetHeight(v40);

  if (Width >= Height) {
    double Width = Height;
  }
  double v10 = 203.0;
  double v11 = round(Width * 100.0 / 320.0);
  if (!v5) {
    double v10 = v11;
  }
  self->_double compassRadius = v10;
  double v12 = 0.0;
  -[CompassBackgroundView setFrame:](self->_compassBackgroundView, "setFrame:", 0.0, 0.0, Width, Width);
  [(CompassBackgroundView *)self->_compassBackgroundView setTicRadius:self->_compassRadius];
  [(CompassBackgroundView *)self->_compassBackgroundView center];
  double v14 = v13 - self->_compassRadius;
  [(CompassBackgroundView *)self->_compassBackgroundView center];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15 - self->_compassRadius, self->_compassRadius + self->_compassRadius, self->_compassRadius + self->_compassRadius);
  v16 = (void *)MEMORY[0x263F1C658];
  if (v5)
  {
    double v17 = 24.0;
    double v12 = 6.0;
    double v18 = 4.0;
  }
  else
  {
    LODWORD(v37) = -798153473;
    long long v36 = xmmword_23673A0E0;
    int v19 = MGIsDeviceOfType();
    double v20 = 0.850000024;
    double v18 = 1.0;
    if (!v19) {
      double v20 = 1.0;
    }
    double v17 = round(Width * 18.0 / 320.0) * v20;
  }
  v21 = objc_msgSend(v16, "systemFontOfSize:", v17, v36, v37);
  [(UILabel *)self->_titleLabel setFont:v21];

  v22 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
  [v22 pointSize];
  double v24 = v23;

  double v25 = fmin(v24, 26.0);
  v26 = (void *)MEMORY[0x263F1C658];
  v27 = [MEMORY[0x263F1C920] mainScreen];
  [v27 bounds];
  double v29 = v28;
  LODWORD(v38) = -798153473;
  int v30 = MGIsDeviceOfType();
  double v31 = 0.850000024;
  if (!v30) {
    double v31 = 1.0;
  }
  v32 = objc_msgSend(v26, "boldSystemFontOfSize:", v31 * round(v25 * v29 / 320.0), 0x6C743B9540D7A421, 0xBCD16A8CA16013ECLL, v38);
  [(UILabel *)self->_instructionLabel setFont:v32];

  [(CompassBackgroundView *)self->_compassBackgroundView ticLength];
  [(CalibrationBallView *)self->_ballView setBallRadius:v33 - v12];
  double compassRadius = self->_compassRadius;
  [(CalibrationBallView *)self->_ballView ballRadius];
  [(CalibrationBallView *)self->_ballView setTrackRadius:compassRadius - v35 - v18];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidLoad
{
  v55.receiver = self;
  v55.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v55 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] blackColor];
  v4 = [(CalibrationViewController *)self view];
  [v4 setBackgroundColor:v3];

  BOOL v5 = [(CalibrationViewController *)self view];
  v6 = [v5 layer];
  [v6 setBorderWidth:1.0];

  id v7 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v8 = [v7 CGColor];
  v9 = [(CalibrationViewController *)self view];
  double v10 = [v9 layer];
  [v10 setBorderColor:v8];

  double v11 = [CompassBackgroundView alloc];
  double v12 = *MEMORY[0x263F001A8];
  double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  v16 = -[CompassBackgroundView initWithFrame:forCompass:](v11, "initWithFrame:forCompass:", 0, *MEMORY[0x263F001A8], v13, v14, v15);
  compassBackgroundView = self->_compassBackgroundView;
  self->_compassBackgroundView = v16;

  [(CompassBackgroundView *)self->_compassBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_numCompleteTics = 0;
  double v18 = [MEMORY[0x263F15880] layer];
  compassBackgroundViewMask = self->_compassBackgroundViewMask;
  self->_compassBackgroundViewMask = v18;

  id v20 = [MEMORY[0x263F1C550] blackColor];
  -[CAShapeLayer setFillColor:](self->_compassBackgroundViewMask, "setFillColor:", [v20 CGColor]);

  [(CAShapeLayer *)self->_compassBackgroundViewMask setLineWidth:0.5];
  LODWORD(v21) = 1060320051;
  [(CAShapeLayer *)self->_compassBackgroundViewMask setOpacity:v21];
  [(CalibrationViewController *)self reset];
  v22 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v12, v13, v14, v15);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v22;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  double v24 = [MEMORY[0x263F1C550] grayColor];
  [(UILabel *)self->_titleLabel setTextColor:v24];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  double v25 = [MEMORY[0x263F086E0] mainBundle];
  v26 = [v25 localizedStringForKey:@"Calibrate" value:&stru_26E9AD258 table:0];
  [(UILabel *)self->_titleLabel setText:v26];

  v27 = [MEMORY[0x263F1C550] clearColor];
  [(UILabel *)self->_titleLabel setBackgroundColor:v27];

  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.699999988];
  double v28 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v12, v13, v14, v15);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v28;

  [(UILabel *)self->_instructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  int v30 = [MEMORY[0x263F1C550] grayColor];
  [(UILabel *)self->_instructionLabel setTextColor:v30];

  [(UILabel *)self->_instructionLabel setTextAlignment:1];
  double v31 = [MEMORY[0x263F086E0] mainBundle];
  v32 = [v31 localizedStringForKey:@"Tilt the screen to roll the ball around the circle" value:&stru_26E9AD258 table:0];
  [(UILabel *)self->_instructionLabel setText:v32];

  [(UILabel *)self->_instructionLabel setNumberOfLines:3];
  [(CompassBackgroundView *)self->_compassBackgroundView center];
  -[UILabel setCenter:](self->_instructionLabel, "setCenter:");
  double v33 = [MEMORY[0x263F1C488] buttonWithType:1];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v33;

  [(UIButton *)self->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
  double v35 = [MEMORY[0x263F1C550] colorWithWhite:0.400000006 alpha:1.0];
  [(UIButton *)self->_cancelButton setBackgroundColor:v35];

  long long v36 = [(UIButton *)self->_cancelButton layer];
  [v36 setCornerRadius:5.0];

  uint64_t v37 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
  uint64_t v38 = [(UIButton *)self->_cancelButton titleLabel];
  [v38 setFont:v37];

  CGRect v39 = self->_cancelButton;
  CGRect v40 = [MEMORY[0x263F086E0] mainBundle];
  v41 = [v40 localizedStringForKey:@"Cancel" value:&stru_26E9AD258 table:0];
  [(UIButton *)v39 setTitle:v41 forState:0];

  v42 = self->_cancelButton;
  v43 = [MEMORY[0x263F1C550] blackColor];
  [(UIButton *)v42 setTitleColor:v43 forState:0];

  v44 = self->_cancelButton;
  v45 = [MEMORY[0x263F1C550] whiteColor];
  [(UIButton *)v44 setTitleColor:v45 forState:4];

  [(UIButton *)self->_cancelButton addTarget:self action:sel_cancel forControlEvents:64];
  v46 = -[CalibrationBallView initWithFrame:ballRadius:]([CalibrationBallView alloc], "initWithFrame:ballRadius:", v12, v13, v14, v15, 0.0);
  ballView = self->_ballView;
  self->_ballView = v46;

  [(CalibrationBallView *)self->_ballView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CalibrationViewController *)self _updateSizes];
  v48 = [(CalibrationViewController *)self view];
  [v48 addSubview:self->_compassBackgroundView];

  v49 = [(CalibrationViewController *)self view];
  [v49 addSubview:self->_instructionLabel];

  v50 = [(CalibrationViewController *)self view];
  v51 = [v50 layer];
  [v51 addSublayer:self->_compassBackgroundViewMask];

  v52 = [(CalibrationViewController *)self view];
  [v52 addSubview:self->_titleLabel];

  v53 = [(CalibrationViewController *)self view];
  [v53 addSubview:self->_ballView];

  v54 = [(CalibrationViewController *)self view];
  [v54 addSubview:self->_cancelButton];
}

- (void)userDefaultsChanged:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", a3);
  self->_quantizationType = [v4 integerForKey:@"CalibrationQuantizationType"];

  if (!self->_quantizationType) {
    self->_quantizationType = 0;
  }
  BOOL v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 doubleForKey:@"CalibrationAwesomeAngle"];
  self->_calibrationAngle = v6 * 3.14159265 / 180.0;

  if (self->_calibrationAngle == 0.0) {
    self->_calibrationAngle = 0.872664626;
  }
  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  self->_shouldCompleteTics = [v7 BOOLForKey:@"CalibrationShouldCompleteTics"];
}

- (float)quantizedPercentage:(double)a3 forAngle:(double)a4
{
  if (qword_2688969C8 != -1) {
    dispatch_once(&qword_2688969C8, &unk_26E9ACF98);
  }
  double v7 = fmax(cos((a4 * 2.0 + -270.0) * 3.14159265 / 180.0) * *(double *)&qword_2688969C0, 0.0) + a3;
  int quantizationType = self->_quantizationType;
  if (quantizationType)
  {
    if (quantizationType == 1)
    {
      float result = 1.0;
      if (v7 > 0.660000026) {
        return result;
      }
      if (v7 > 0.330000013) {
        return 0.66;
      }
      if (v7 > 0.100000001) {
        return 0.33;
      }
    }
    else if (quantizationType == 2 && v7 > 0.100000001)
    {
      return v7;
    }
    return 0.1;
  }
  float result = 1.0;
  if (v7 <= 0.5)
  {
    float result = 0.5;
    if (v7 <= 0.100000001) {
      return 0.1;
    }
  }
  return result;
}

- (void)addConstraints
{
  v118[1] = *MEMORY[0x263EF8340];
  v3 = [(CalibrationViewController *)self view];
  [v3 removeConstraints:self->_calibrationConstraints];

  [(NSMutableArray *)self->_calibrationConstraints removeAllObjects];
  calibrationConstraints = self->_calibrationConstraints;
  BOOL v5 = [MEMORY[0x263F08938] constraintWithItem:self->_compassBackgroundView attribute:7 relatedBy:0 toItem:self->_compassBackgroundView attribute:8 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)calibrationConstraints addObject:v5];

  double v6 = self->_calibrationConstraints;
  double v7 = (void *)MEMORY[0x263F08938];
  compassBackgroundView = self->_compassBackgroundView;
  v9 = [(CalibrationViewController *)self view];
  double v10 = [v7 constraintWithItem:compassBackgroundView attribute:9 relatedBy:0 toItem:v9 attribute:9 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v6 addObject:v10];

  double v11 = [(CalibrationViewController *)self view];
  [v11 frame];
  double v13 = v12;

  double v14 = [(CalibrationViewController *)self view];
  [v14 frame];
  double v16 = v15;

  if (v13 >= v16) {
    double v17 = v16;
  }
  else {
    double v17 = v13;
  }
  double v18 = self->_calibrationConstraints;
  int v19 = (void *)MEMORY[0x263F08938];
  v117 = @"compassWidth";
  id v20 = [NSNumber numberWithDouble:v17];
  v118[0] = v20;
  double v21 = [NSDictionary dictionaryWithObjects:v118 forKeys:&v117 count:1];
  v22 = _NSDictionaryOfVariableBindings(&cfstr_Compassbackgro_0.isa, self->_compassBackgroundView, 0);
  double v23 = [v19 constraintsWithVisualFormat:@"[_compassBackgroundView(==compassWidth)]" options:0 metrics:v21 views:v22];
  [(NSMutableArray *)v18 addObjectsFromArray:v23];

  double v24 = self->_calibrationConstraints;
  double v25 = [MEMORY[0x263F08938] constraintWithItem:self->_ballView attribute:3 relatedBy:0 toItem:self->_compassBackgroundView attribute:3 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v24 addObject:v25];

  v26 = self->_calibrationConstraints;
  v27 = [MEMORY[0x263F08938] constraintWithItem:self->_ballView attribute:1 relatedBy:0 toItem:self->_compassBackgroundView attribute:1 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v26 addObject:v27];

  double v28 = self->_calibrationConstraints;
  double v29 = [MEMORY[0x263F08938] constraintWithItem:self->_ballView attribute:4 relatedBy:0 toItem:self->_compassBackgroundView attribute:4 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v28 addObject:v29];

  int v30 = self->_calibrationConstraints;
  double v31 = [MEMORY[0x263F08938] constraintWithItem:self->_ballView attribute:2 relatedBy:0 toItem:self->_compassBackgroundView attribute:2 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v30 addObject:v31];

  v32 = self->_calibrationConstraints;
  double v33 = [MEMORY[0x263F08938] constraintWithItem:self->_titleLabel attribute:10 relatedBy:0 toItem:self->_compassBackgroundView attribute:10 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v32 addObject:v33];

  v34 = self->_calibrationConstraints;
  double v35 = [MEMORY[0x263F08938] constraintWithItem:self->_titleLabel attribute:9 relatedBy:0 toItem:self->_compassBackgroundView attribute:9 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v34 addObject:v35];

  long long v36 = self->_calibrationConstraints;
  uint64_t v37 = [MEMORY[0x263F08938] constraintWithItem:self->_instructionLabel attribute:9 relatedBy:0 toItem:self->_compassBackgroundView attribute:9 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v36 addObject:v37];

  uint64_t v38 = self->_calibrationConstraints;
  CGRect v39 = (void *)MEMORY[0x263F08938];
  instructionLabel = self->_instructionLabel;
  v41 = [(CalibrationViewController *)self view];
  v42 = [v39 constraintWithItem:instructionLabel attribute:7 relatedBy:0 toItem:v41 attribute:7 multiplier:0.660000026 constant:0.0];
  [(NSMutableArray *)v38 addObject:v42];

  v43 = self->_calibrationConstraints;
  v44 = (void *)MEMORY[0x263F08938];
  cancelButton = self->_cancelButton;
  v46 = [(CalibrationViewController *)self view];
  v47 = [v44 constraintWithItem:cancelButton attribute:9 relatedBy:0 toItem:v46 attribute:9 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)v43 addObject:v47];

  v48 = self->_calibrationConstraints;
  v49 = [MEMORY[0x263F08938] constraintWithItem:self->_cancelButton attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:150.0];
  [(NSMutableArray *)v48 addObject:v49];

  v50 = [(CalibrationViewController *)self view];
  [v50 frame];
  double v52 = v51;

  v53 = self->_calibrationConstraints;
  double v54 = (v52 - (self->_compassRadius + v52 * 0.5 + 40.0 + 7.0)) * 0.5;
  objc_super v55 = (void *)MEMORY[0x263F08938];
  v115[0] = @"buttonHeight";
  v115[1] = @"buttonBottomMargin";
  v116[0] = &unk_26E9ADF08;
  v116[1] = &unk_26E9ADF18;
  v115[2] = @"instructionBottomMargin";
  v56 = [NSNumber numberWithDouble:v54];
  v116[2] = v56;
  v57 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:3];
  v58 = _NSDictionaryOfVariableBindings(&cfstr_Instructionlab.isa, self->_instructionLabel, self->_cancelButton, 0);
  v59 = [v55 constraintsWithVisualFormat:@"V:[_instructionLabel]-(instructionBottomMargin)-[_cancelButton(==buttonHeight)]-(buttonBottomMargin)-|" options:0 metrics:v57 views:v58];
  [(NSMutableArray *)v53 addObjectsFromArray:v59];

  v60 = [(CalibrationViewController *)self traitCollection];
  if ([v60 horizontalSizeClass] == 2)
  {
    v61 = [(CalibrationViewController *)self traitCollection];
    BOOL v62 = [v61 verticalSizeClass] == 2;
  }
  else
  {
    BOOL v62 = 0;
  }

  v63 = [(CalibrationViewController *)self view];
  [v63 frame];
  double Width = CGRectGetWidth(v119);

  v65 = [(CalibrationViewController *)self view];
  [v65 frame];
  double Height = CGRectGetHeight(v120);

  if (Width >= Height) {
    double Width = Height;
  }
  v67 = [(CalibrationViewController *)self view];
  [v67 frame];
  double v68 = CGRectGetWidth(v121);

  double compassRadius = self->_compassRadius;
  [(CompassBackgroundView *)self->_compassBackgroundView ticLength];
  double v71 = (v68 + (compassRadius - v70) * -2.0) * 0.5;
  if (v71 >= 0.0) {
    double v72 = v71;
  }
  else {
    double v72 = 0.0;
  }
  v113[0] = @"titleLabelWidth";
  v73 = NSNumber;
  double v74 = self->_compassRadius;
  [(CompassBackgroundView *)self->_compassBackgroundView ticLength];
  v76 = [v73 numberWithDouble:v74 - v75 + v74 - v75];
  v113[1] = @"titleMarginWidth";
  v114[0] = v76;
  v77 = [NSNumber numberWithDouble:v72];
  v114[1] = v77;
  v78 = [NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:2];

  v79 = self->_calibrationConstraints;
  v80 = (void *)MEMORY[0x263F08938];
  v81 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, self->_titleLabel, 0);
  v82 = [v80 constraintsWithVisualFormat:@"|-(>=titleMarginWidth)-[_titleLabel(==titleLabelWidth)]-(>=titleMarginWidth)-|" options:0 metrics:v78 views:v81];
  [(NSMutableArray *)v79 addObjectsFromArray:v82];

  if (v62
    || ([(CalibrationViewController *)self traitCollection],
        v83 = objc_claimAutoreleasedReturnValue(),
        uint64_t v84 = [v83 horizontalSizeClass],
        v83,
        v84 == 2))
  {
    v85 = self->_calibrationConstraints;
    v86 = (void *)MEMORY[0x263F08938];
    v87 = self->_compassBackgroundView;
    v88 = [(CalibrationViewController *)self view];
    v89 = [v86 constraintWithItem:v87 attribute:10 relatedBy:0 toItem:v88 attribute:10 multiplier:1.0 constant:-18.0];
    [(NSMutableArray *)v85 addObject:v89];

    v90 = self->_calibrationConstraints;
    v91 = [MEMORY[0x263F08938] constraintWithItem:self->_compassBackgroundView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:Width];
    [(NSMutableArray *)v90 addObject:v91];
  }
  else
  {
    v92 = [(CalibrationViewController *)self view];
    [v92 frame];
    double v94 = (v93 + v93) / 3.0;
    [(CompassBackgroundView *)self->_compassBackgroundView frame];
    double v96 = v95;

    if (v94 <= v96)
    {
      v100 = self->_calibrationConstraints;
      v109 = (void *)MEMORY[0x263F08938];
      v110 = self->_compassBackgroundView;
      v91 = [(CalibrationViewController *)self view];
      double v103 = 1.0;
      double v108 = 20.0;
      v104 = v109;
      v105 = v110;
      uint64_t v106 = 3;
      v107 = v91;
    }
    else
    {
      v97 = [(CalibrationViewController *)self view];
      [v97 frame];
      double v99 = round(v98 * 227.0 / 568.0);

      v100 = self->_calibrationConstraints;
      v101 = (void *)MEMORY[0x263F08938];
      v102 = self->_compassBackgroundView;
      v91 = [(CalibrationViewController *)self view];
      double v103 = 1.0;
      v104 = v101;
      v105 = v102;
      uint64_t v106 = 10;
      v107 = v91;
      double v108 = v99;
    }
    v111 = [v104 constraintWithItem:v105 attribute:v106 relatedBy:0 toItem:v107 attribute:3 multiplier:v103 constant:v108];
    [(NSMutableArray *)v100 addObject:v111];
  }
  v112 = [(CalibrationViewController *)self view];
  [v112 addConstraints:self->_calibrationConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v5 viewWillAppear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_userDefaultsChanged_ name:*MEMORY[0x263F08660] object:0];

  memset_pattern16(self->_ticsShowingArray, &unk_23673A110, 0x2D0uLL);
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v10 viewDidAppear:a3];
  v4 = [(CalibrationViewController *)self view];
  [v4 setNeedsLayout];

  objc_super v5 = [(CalibrationViewController *)self view];
  [v5 layoutIfNeeded];

  double v6 = [MEMORY[0x263F15890] animationWithKeyPath:@"path"];
  [v6 setStiffness:1560.0];
  [v6 setMass:3.0];
  [v6 setDamping:600.0];
  [v6 setDuration:0.400000006];
  [v6 setBeginTime:CACurrentMediaTime() + 0.5];
  memset_pattern16(self->_ticsShowingArray, &unk_23673A110, 0x2D0uLL);
  id v7 = [(CalibrationViewController *)self updatedMaskingPath];
  objc_msgSend(v6, "setFromValue:", objc_msgSend(v7, "CGPath"));

  memset_pattern16(self->_ticsShowingArray, &unk_23673A100, 0x2D0uLL);
  id v8 = [(CalibrationViewController *)self updatedMaskingPath];
  uint64_t v9 = [v8 CGPath];

  [v6 setToValue:v9];
  [v6 setFillMode:*MEMORY[0x263F15AA8]];
  [(CAShapeLayer *)self->_compassBackgroundViewMask setPath:v9];
  [(CAShapeLayer *)self->_compassBackgroundViewMask addAnimation:v6 forKey:@"growAnimation"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v5 viewWillDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  self->_ignoreMotionUpdates = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v4 viewDidDisappear:a3];
  [(CalibrationViewController *)self hideAllTics];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v3 viewWillLayoutSubviews];
  [(CalibrationViewController *)self _updateSizes];
  [(CalibrationViewController *)self addConstraints];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v3 viewDidLayoutSubviews];
  [(CompassBackgroundView *)self->_compassBackgroundView frame];
  -[CAShapeLayer setFrame:](self->_compassBackgroundViewMask, "setFrame:");
  [(CalibrationViewController *)self updateMaskingPath];
}

- (void)reset
{
  self->_ignoreMotionUpdates = 0;
  [(CalibrationViewController *)self hideAllTics];
  self->_previousTimestamp = -1.0;
  self->_startTicAngle = -1.0;
}

- (id)updatedMaskingPath
{
  double compassRadius = self->_compassRadius;
  [(CompassBackgroundView *)self->_compassBackgroundView ticLength];
  double v19 = compassRadius + v4 * 0.5 + 1.0;
  [(CompassBackgroundView *)self->_compassBackgroundView frame];
  double v21 = v5 * 0.5;
  [(CompassBackgroundView *)self->_compassBackgroundView frame];
  double v20 = v6 * 0.5;
  id v7 = [MEMORY[0x263F1C478] bezierPath];
  [v7 setLineWidth:0.5];
  uint64_t v8 = 0;
  for (uint64_t i = 0; i != 360; i += 2)
  {
    double v10 = (float)(1.0 - self->_ticsShowingArray[v8]);
    [(CompassBackgroundView *)self->_compassBackgroundView ticLength];
    double v12 = (v11 + 2.0) * v10;
    long double v13 = fmod((double)(int)i + -1.0, (double)0x168uLL);
    __double2 v14 = __sincos_stret(v13 * 3.14159265 / 180.0);
    objc_msgSend(v7, "moveToPoint:");
    double v15 = v19 - v12;
    objc_msgSend(v7, "addLineToPoint:", v21 + v15 * v14.__cosval, v20 + v15 * v14.__sinval);
    long double v16 = fmod((double)(int)i + 1.0, (double)0x168uLL);
    __double2 v17 = __sincos_stret(v16 * 3.14159265 / 180.0);
    objc_msgSend(v7, "addLineToPoint:", v21 + v15 * v17.__cosval, v20 + v15 * v17.__sinval);
    objc_msgSend(v7, "addLineToPoint:", v21 + v19 * v17.__cosval, v20 + v19 * v17.__sinval);
    objc_msgSend(v7, "addLineToPoint:", v21 + v19 * v14.__cosval, v20 + v19 * v14.__sinval);
    ++v8;
  }

  return v7;
}

- (void)updateMaskingPath
{
  id v3 = [(CalibrationViewController *)self updatedMaskingPath];
  -[CAShapeLayer setPath:](self->_compassBackgroundViewMask, "setPath:", [v3 CGPath]);
}

- (void)showTicAtAngle:(double)a3 withCredit:(double)a4
{
  unint64_t v5 = vcvtmd_u64_f64(a3 * 0.5);
  if (v5 <= 0xB3) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v5 % 0xB3;
  }
  ticsShowingArradouble y = self->_ticsShowingArray;
  float v8 = ticsShowingArray[v6];
  if (v8 < 1.0)
  {
    if (v8 < a4)
    {
      [(CalibrationViewController *)self quantizedPercentage:a4 forAngle:a3];
      ticsShowingArradouble y = self->_ticsShowingArray;
    }
    ticsShowingArray[v6] = v8;
    if (v8 == 1.0) {
      ++self->_numCompleteTics;
    }
    [(CalibrationViewController *)self updateMaskingPath];
  }
}

- (void)showTicsBetweenStartAngle:(double)a3 endAngle:(double)a4 withCredit:(double)a5
{
  for (; a3 - a4 > 180.0; a3 = a3 + -360.0)
    ;
  for (; a4 - a3 > 180.0; a4 = a4 + -360.0)
    ;
  char v7 = 0;
  unint64_t v8 = vcvtmd_u64_f64(a3 * 0.5) % 0xB4;
  unint64_t v9 = vcvtmd_u64_f64(a4 * 0.5);
  if (v8 <= v9 % 0xB4) {
    unint64_t v10 = v9 % 0xB4;
  }
  else {
    unint64_t v10 = v8;
  }
  if (v8 >= v9 % 0xB4) {
    unint64_t v11 = v9 % 0xB4;
  }
  else {
    unint64_t v11 = v8;
  }
  ticsShowingArradouble y = self->_ticsShowingArray;
  do
  {
    float v13 = ticsShowingArray[v11];
    if (v13 < 1.0)
    {
      if (v13 < a5)
      {
        [(CalibrationViewController *)self quantizedPercentage:a5 forAngle:(double)v11];
        ticsShowingArradouble y = self->_ticsShowingArray;
      }
      ticsShowingArray[v11] = v13;
      if (v13 == 1.0) {
        ++self->_numCompleteTics;
      }
      char v7 = 1;
    }
    unint64_t v11 = (v11 + 1);
  }
  while (v10 >= v11);
  if (v7)
  {
    [(CalibrationViewController *)self updateMaskingPath];
  }
}

- (void)hideAllTics
{
  memset_pattern16(self->_ticsShowingArray, &unk_23673A100, 0x2D0uLL);
  self->_numCompleteTics = 0;

  [(CalibrationViewController *)self updateMaskingPath];
}

- (BOOL)circleIsCompleted
{
  return self->_numCompleteTics - 176 < 5;
}

- (void)setBallAngle:(double)a3 tiltAngle:(double)a4
{
  if (self->_startTicAngle < 0.0) {
    self->_startTicAngle = a3 / 0.0174532925;
  }
  -[CalibrationViewController showTicsBetweenStartAngle:endAngle:withCredit:](self, "showTicsBetweenStartAngle:endAngle:withCredit:");
  self->_startTicAngle = a3 / 0.0174532925;
  [(CalibrationBallView *)self->_ballView setAngle:a3];
  [(CompassBackgroundView *)self->_compassBackgroundView setNeedsLayout];
  ballView = self->_ballView;

  [(CalibrationBallView *)ballView setNeedsLayout];
}

- (double)_correctedAngleForCurrentOrientation:(double)a3
{
  double v4 = [(CalibrationViewController *)self view];
  unint64_t v5 = [v4 window];
  unint64_t v6 = [v5 windowScene];
  uint64_t v7 = [v6 interfaceOrientation];

  switch(v7)
  {
    case 2:
      double v8 = 3.14159265;
      break;
    case 3:
      double v8 = -1.57079633;
      break;
    case 4:
      double v8 = 1.57079633;
      break;
    default:
      return a3;
  }
  double v9 = a3 + v8;
  long double v10 = fmod(a3 + v8, 6.28318531);
  a3 = v10;
  if (v9 < 0.0) {
    return v10 + 6.28318531;
  }
  return a3;
}

- (void)setMotion:(id)a3
{
  if (!self->_ignoreMotionUpdates)
  {
    id v4 = a3;
    [v4 gravity];
    double v6 = v5;
    v8.f64[1] = v7;
    __double x = v8;
    long double v9 = atan2(sqrt(vaddvq_f64(vmulq_f64(v8, v8))), -v5);
    double v10 = fmod(v9, 6.28318531);
    if (v9 < 0.0) {
      double v10 = v10 + 6.28318531;
    }
    [(CalibrationViewController *)self _correctedAngleForCurrentOrientation:v10];
    *(double *)&long long v12 = *(double *)&v12 * 1.4037466 + 0.01;
    if (*(double *)&v12 <= 0.5) {
      double v13 = *(double *)&v12;
    }
    else {
      double v13 = 0.5;
    }
    float64x2_t __xa = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)self->_previousGravity, 1.0 - v13), __x, v13);
    double v14 = *(double *)&self->_previousGravity[16] * (1.0 - v13);
    *(double *)&long long v12 = v14 + v13 * v6;
    long long v25 = v12;
    objc_msgSend(v4, "timestamp", *(void *)&v13, v11);
    double v16 = v15;

    long double v17 = atan2(-__xa.f64[1], __xa.f64[0]);
    double v18 = fmod(v17, 6.28318531);
    if (v17 < 0.0) {
      double v18 = v18 + 6.28318531;
    }
    [(CalibrationViewController *)self _correctedAngleForCurrentOrientation:v18];
    double v20 = v19;
    long double v21 = atan2(sqrt(vaddvq_f64(vmulq_f64(__xa, __xa))), -(v14 + v24 * v6));
    double v22 = fmod(v21, 6.28318531);
    double v23 = v22 + 6.28318531;
    if (v21 >= 0.0) {
      double v23 = v22;
    }
    self->_previousHorizontalAngle = v20;
    [(CalibrationViewController *)self setBallAngle:v20 tiltAngle:v23];
    *(float64x2_t *)self->_previousGravitdouble y = __xa;
    *(_OWORD *)&self->_previousGravity[16] = v25;
    self->_previousTimestamp = v16;
  }
}

- (double)completeCircle
{
  self->_ignoreMotionUpdates = 1;
  [(CalibrationBallView *)self->_ballView currentAngle];
  double v4 = v3 * 180.0 / 3.14159265;
  objc_initWeak(&location, self);
  double v5 = 0.0;
  int v6 = 360;
  float64_t v7 = MEMORY[0x263EF83A0];
  do
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v5 / 360.0 * 1000000000.0));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_2367383E0;
    v10[3] = &unk_264CAC150;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&v5;
    v11[2] = *(id *)&v4;
    dispatch_after(v8, v7, v10);
    objc_destroyWeak(v11);
    double v5 = v5 + 1.0;
    --v6;
  }
  while (v6);
  objc_destroyWeak(&location);
  return 1.0;
}

- (void)cancel
{
}

- (void)dealloc
{
  free(self->_ticsShowingArray);
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewController;
  [(CalibrationViewController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationConstraints, 0);
  objc_storeStrong((id *)&self->_ballView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_compassBackgroundViewMask, 0);

  objc_storeStrong((id *)&self->_compassBackgroundView, 0);
}

@end