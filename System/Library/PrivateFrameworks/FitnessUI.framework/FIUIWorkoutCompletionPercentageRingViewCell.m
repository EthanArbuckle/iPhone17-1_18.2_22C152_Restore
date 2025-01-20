@interface FIUIWorkoutCompletionPercentageRingViewCell
+ (double)_ringDiameter;
+ (double)_ringToTypeSpacing;
+ (double)_ringTopPadding;
+ (double)_secondaryLabelToSeparatorSpacing;
+ (double)_typeToSecondaryLabelSpacing;
+ (double)rowHeightForWorkout:(id)a3 width:(double)a4;
- (ARUIRingsView)ringsView;
- (FIUIDividerView)separatorView;
- (FIUIWorkoutCompletionPercentageRingViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (FIUIWorkoutCompletionPercentageRingViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 ringsViewRenderer:(id)a5;
- (HKWorkout)workout;
- (UIImageView)gradientBackgroundImageView;
- (UIImageView)iconImageView;
- (UILabel)secondaryLabel;
- (UILabel)typeLabel;
- (double)currentCompletionFactor;
- (void)animateRingWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentCompletionFactor:(double)a3;
- (void)setGradientBackgroundImageView:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setRingsView:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTypeLabel:(id)a3;
- (void)setWorkout:(id)a3;
- (void)setWorkout:(id)a3 fillRing:(BOOL)a4;
- (void)setWorkoutWithoutFillingRing:(id)a3;
@end

@implementation FIUIWorkoutCompletionPercentageRingViewCell

+ (double)rowHeightForWorkout:(id)a3 width:(double)a4
{
  v6 = (void *)MEMORY[0x263F81708];
  uint64_t v7 = *MEMORY[0x263F83570];
  id v8 = a3;
  v9 = [v6 defaultFontForTextStyle:v7];
  [a1 _ringTopPadding];
  double v11 = v10;
  [a1 _ringDiameter];
  double v13 = v11 + v12;
  v14 = _TypeLabel();
  v15 = objc_msgSend(v8, "fiui_activityType");

  v16 = [v15 localizedName];
  [v14 setText:v16];

  objc_msgSend(v14, "sizeThatFits:", a4 + 5.5 * -2.0, 1.79769313e308);
  [v14 frame];
  objc_msgSend(v14, "setFrame:");
  v17 = [v14 font];
  [a1 _ringToTypeSpacing];
  objc_msgSend(v17, "_scaledValueForValue:");
  [v14 _setFirstLineBaselineFrameOriginY:v13 + v18];

  [v14 _lastLineBaselineFrameOriginY];
  double v20 = v19;
  [a1 _typeToSecondaryLabelSpacing];
  double v22 = v21;
  [a1 _secondaryLabelToSeparatorSpacing];
  objc_msgSend(v9, "_scaledValueForValue:");
  double v24 = v23;
  if (FIUIOnePixel_onceToken_0 != -1) {
    dispatch_once(&FIUIOnePixel_onceToken_0, &__block_literal_global_15);
  }
  double v25 = v20 + v22 + v24 + *(double *)&FIUIOnePixel_onePixel_0;

  return v25;
}

+ (double)_ringTopPadding
{
  return 5.0;
}

+ (double)_ringDiameter
{
  return 50.0;
}

+ (double)_ringToTypeSpacing
{
  return 20.0;
}

- (FIUIWorkoutCompletionPercentageRingViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(FIUIWorkoutCompletionPercentageRingViewCell *)self initWithStyle:a3 reuseIdentifier:a4 ringsViewRenderer:0];
}

- (void)setWorkoutWithoutFillingRing:(id)a3
{
}

- (void)setWorkout:(id)a3 fillRing:(BOOL)a4
{
  BOOL v4 = a4;
  id v49 = a3;
  p_workout = &self->_workout;
  objc_storeStrong((id *)&self->_workout, a3);
  uint64_t v8 = [(HKWorkout *)self->_workout _goalType];
  v9 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  double v10 = v9;
  if (v8)
  {
    [v9 setHidden:0];

    double v11 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self gradientBackgroundImageView];
    double v12 = v11;
    uint64_t v13 = 1;
  }
  else
  {
    [v9 setHidden:1];

    double v11 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self gradientBackgroundImageView];
    double v12 = v11;
    uint64_t v13 = 0;
  }
  [v11 setHidden:v13];

  v14 = objc_msgSend(MEMORY[0x263F23950], "metricColorsForGoalTypeIdentifier:", -[HKWorkout _goalType](*p_workout, "_goalType"));
  v15 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  v16 = [v15 ringGroupController];
  v17 = [v14 gradientDarkColor];
  double v18 = [v14 gradientLightColor];
  [v16 setTopColor:v17 bottomColor:v18 ofRingAtIndex:0];

  if (v4)
  {
    double v19 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self workout];
    objc_msgSend(v19, "fiui_completionFactor");
    -[FIUIWorkoutCompletionPercentageRingViewCell setCurrentCompletionFactor:](self, "setCurrentCompletionFactor:");

    double v20 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
    double v21 = [v20 ringGroupController];
    double v22 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self workout];
    objc_msgSend(v22, "fiui_completionFactor");
    objc_msgSend(v21, "setPercentage:ofRingAtIndex:animated:", 0, 0);
  }
  double v23 = [(HKWorkout *)*p_workout fiui_connectedGymBrandName];
  if (v23)
  {
    double v24 = [MEMORY[0x263F825C8] grayColor];
    double v25 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
    [v25 setTextColor:v24];

    v26 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
    [v26 setText:v23];
  }
  else
  {
    v27 = [v14 nonGradientTextColor];
    v28 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
    [v28 setTextColor:v27];

    if ([v49 _goalType])
    {
      v29 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self workout];
      objc_msgSend(v29, "fiui_completionFactor");
      double v31 = v30;

      v32 = NSString;
      v26 = FIUIBundle();
      v33 = [v26 localizedStringForKey:@"%@_PERCENTAGE_COMPLETE_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
      v34 = [NSNumber numberWithDouble:round(v31 * 100.0) / 100.0];
      v35 = +[FIUIFormattingManager percentStringWithNumber:v34];
      v36 = objc_msgSend(v32, "stringWithFormat:", v33, v35);
      v37 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
      [v37 setText:v36];
    }
    else
    {
      v26 = FIUIBundle();
      v33 = [v26 localizedStringForKey:@"WORKOUT_OPEN_GOAL" value:&stru_26CF5F1B8 table:@"Localizable"];
      v38 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
      [v38 setText:v33];
    }
  }

  v39 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self workout];
  v40 = objc_msgSend(v39, "fiui_activityType");
  v41 = [v40 localizedName];
  v42 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  [v42 setText:v41];

  v43 = +[FIUIWorkoutActivityType activityTypeWithWorkout:*p_workout];
  v44 = FIUIStaticWorkoutIconImage(v43, 4);
  v45 = [v44 imageWithRenderingMode:2];
  v46 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self iconImageView];
  [v46 setImage:v45];

  v47 = [v14 nonGradientTextColor];
  v48 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self iconImageView];
  [v48 setTintColor:v47];

  [(FIUIWorkoutCompletionPercentageRingViewCell *)self setNeedsLayout];
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (ARUIRingsView)ringsView
{
  return self->_ringsView;
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)layoutSubviews
{
  v95.receiver = self;
  v95.super_class = (Class)FIUIWorkoutCompletionPercentageRingViewCell;
  [(FIUIWorkoutCompletionPercentageRingViewCell *)&v95 layoutSubviews];
  v3 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(id)objc_opt_class() _ringTopPadding];
  double v13 = v12;
  [(id)objc_opt_class() _ringDiameter];
  double v15 = v14;
  [(id)objc_opt_class() _ringDiameter];
  *(double *)&uint64_t v91 = 5.5;
  double v92 = v13;
  double v93 = v15;
  double v94 = v16;
  CGFloat v86 = v7;
  CGFloat v87 = v5;
  CGFloat rect = v11;
  FIUIFlipFrameRightToLeftIfNeeded((CGFloat *)&v91, v5, v7, v9, v11);
  double v17 = *(double *)&v91;
  double v18 = v92;
  double v20 = v93;
  double v19 = v94;
  double v21 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  objc_msgSend(v21, "setFrame:", v17, v18, v20, v19);

  double v22 = *(double *)&v91;
  double v23 = v92;
  double v24 = v93;
  double v25 = v94;
  v26 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self gradientBackgroundImageView];
  objc_msgSend(v26, "setFrame:", v22, v23, v24, v25);

  v27 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self iconImageView];
  [v27 sizeToFit];

  v28 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  [v28 center];
  double v30 = v29;
  double v32 = v31;
  v33 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self iconImageView];
  objc_msgSend(v33, "setCenter:", v30, v32);

  if (FIUILocaleIsRightToLeft())
  {
    CGAffineTransformMakeScale(&v90, -1.0, 1.0);
    v34 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self iconImageView];
    v35 = v34;
    CGAffineTransform v89 = v90;
    v36 = &v89;
  }
  else
  {
    v34 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self iconImageView];
    v35 = v34;
    long long v37 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v88[0] = *MEMORY[0x263F000D0];
    v88[1] = v37;
    v88[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    v36 = (CGAffineTransform *)v88;
  }
  [v34 setTransform:v36];

  v38 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  objc_msgSend(v38, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  double v40 = v39;

  v41 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  objc_msgSend(v41, "setFrame:", 5.5, 0.0, v9 + 5.5 * -2.0, v40);

  v42 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  [v42 frame];
  double MaxY = CGRectGetMaxY(v96);
  v44 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  v45 = [v44 font];
  [(id)objc_opt_class() _ringToTypeSpacing];
  objc_msgSend(v45, "_scaledValueForValue:");
  double v47 = MaxY + v46;
  v48 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  [v48 _setFirstLineBaselineFrameOriginY:v47];

  id v49 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  [v49 frame];
  v50 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self contentView];
  double v51 = FIUIRoundFrameToViewScale(v50);
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  v58 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  objc_msgSend(v58, "setFrame:", v51, v53, v55, v57);

  v59 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
  objc_msgSend(v59, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  double v61 = v60;

  v62 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
  objc_msgSend(v62, "setFrame:", 5.5, 0.0, v9 + 5.5 * -2.0, v61);

  v63 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self typeLabel];
  [v63 _lastLineBaselineFrameOriginY];
  double v65 = v64;
  [(id)objc_opt_class() _typeToSecondaryLabelSpacing];
  double v67 = v65 + v66;
  v68 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
  [v68 _setFirstLineBaselineFrameOriginY:v67];

  v69 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
  [v69 frame];
  v70 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self contentView];
  double v71 = FIUIRoundFrameToViewScale(v70);
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  v78 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self secondaryLabel];
  objc_msgSend(v78, "setFrame:", v71, v73, v75, v77);

  CGFloat v79 = v9 + 5.5 * -2.0;
  v80 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self separatorView];
  objc_msgSend(v80, "sizeThatFits:", v79, 1.79769313e308);
  double v82 = v81;

  v97.origin.y = v86;
  v97.origin.x = v87;
  v97.size.width = v9;
  v97.size.height = rect;
  CGFloat v83 = CGRectGetMaxY(v97) - v82;
  v84 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self separatorView];
  objc_msgSend(v84, "setFrame:", 5.5, v83, v79, v82);
}

- (FIUIDividerView)separatorView
{
  return self->_separatorView;
}

- (void)animateRingWithCompletion:(id)a3
{
  double v4 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  [v4 setPaused:0];

  id v7 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self ringsView];
  CGFloat v5 = [v7 ringGroupController];
  double v6 = [(FIUIWorkoutCompletionPercentageRingViewCell *)self workout];
  objc_msgSend(v6, "fiui_completionFactor");
  objc_msgSend(v5, "setPercentage:ofRingAtIndex:animated:", 0, 0);
}

+ (double)_typeToSecondaryLabelSpacing
{
  return 18.0;
}

+ (double)_secondaryLabelToSeparatorSpacing
{
  return 9.0;
}

- (FIUIWorkoutCompletionPercentageRingViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 ringsViewRenderer:(id)a5
{
  id v8 = a5;
  v42.receiver = self;
  v42.super_class = (Class)FIUIWorkoutCompletionPercentageRingViewCell;
  CGFloat v9 = [(FIUIWorkoutCompletionPercentageRingViewCell *)&v42 initWithStyle:a3 reuseIdentifier:a4];
  if (v9)
  {
    double v10 = (void *)[objc_alloc(MEMORY[0x263F23970]) initWithNumberOfRings:1];
    [(id)objc_opt_class() _ringDiameter];
    *(float *)&double v11 = v11;
    [v10 setRingDiameter:v11];
    HIDWORD(v12) = 1075052544;
    *(float *)&double v12 = 5.0;
    [v10 setRingThickness:v12];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F23980]) initWithRingGroupController:v10 renderer:v8];
    ringsView = v9->_ringsView;
    v9->_ringsView = (ARUIRingsView *)v13;

    [(ARUIRingsView *)v9->_ringsView setPreferredFramesPerSecond:30];
    [(ARUIRingsView *)v9->_ringsView setPaused:1];
    [(ARUIRingsView *)v9->_ringsView setEmptyRingAlpha:0.2];
    [(id)objc_opt_class() _ringDiameter];
    double v16 = FIUICircularWorkoutGradientImage(v15);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v16];
    gradientBackgroundImageView = v9->_gradientBackgroundImageView;
    v9->_gradientBackgroundImageView = (UIImageView *)v17;

    id v19 = objc_alloc(MEMORY[0x263F82828]);
    double v20 = *MEMORY[0x263F001A8];
    double v21 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v23 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v24 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x263F001A8], v21, v22, v23);
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = (UIImageView *)v24;

    v26 = v9->_ringsView;
    v27 = [MEMORY[0x263F825C8] clearColor];
    [(ARUIRingsView *)v26 setBackgroundColor:v27];

    [(ARUIRingsView *)v9->_ringsView setOpaque:0];
    [(ARUIRingsView *)v9->_ringsView setMaskView:0];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v20, v21, v22, v23);
    secondaryLabel = v9->_secondaryLabel;
    v9->_secondaryLabel = (UILabel *)v28;

    double v30 = _LabelFont();
    [(UILabel *)v9->_secondaryLabel setFont:v30];

    uint64_t v31 = _TypeLabel();
    typeLabel = v9->_typeLabel;
    v9->_typeLabel = (UILabel *)v31;

    v33 = -[FIUIDividerView initWithFrame:]([FIUIDividerView alloc], "initWithFrame:", v20, v21, v22, v23);
    separatorView = v9->_separatorView;
    v9->_separatorView = v33;

    v35 = [(FIUIWorkoutCompletionPercentageRingViewCell *)v9 contentView];
    [v35 addSubview:v9->_ringsView];

    v36 = [(FIUIWorkoutCompletionPercentageRingViewCell *)v9 contentView];
    [v36 addSubview:v9->_gradientBackgroundImageView];

    long long v37 = [(FIUIWorkoutCompletionPercentageRingViewCell *)v9 contentView];
    [v37 addSubview:v9->_iconImageView];

    v38 = [(FIUIWorkoutCompletionPercentageRingViewCell *)v9 contentView];
    [v38 addSubview:v9->_typeLabel];

    double v39 = [(FIUIWorkoutCompletionPercentageRingViewCell *)v9 contentView];
    [v39 addSubview:v9->_secondaryLabel];

    double v40 = [(FIUIWorkoutCompletionPercentageRingViewCell *)v9 contentView];
    [v40 addSubview:v9->_separatorView];
  }
  return v9;
}

- (void)setWorkout:(id)a3
{
}

- (double)currentCompletionFactor
{
  return self->_currentCompletionFactor;
}

- (void)setCurrentCompletionFactor:(double)a3
{
  self->_currentCompletionFactor = a3;
}

- (void)setRingsView:(id)a3
{
}

- (UIImageView)gradientBackgroundImageView
{
  return self->_gradientBackgroundImageView;
}

- (void)setGradientBackgroundImageView:(id)a3
{
}

- (void)setIconImageView:(id)a3
{
}

- (void)setTypeLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end