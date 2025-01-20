@interface FIUIWorkoutSimpleCompletionRingCell
+ (double)preferredHeightForActivityType:(id)a3 fittingWidth:(double)a4 plural:(BOOL)a5;
+ (double)preferredHeightForLocalizedName:(id)a3 fittingWidth:(double)a4;
+ (double)preferredHeightForWorkout:(id)a3 fittingWidth:(double)a4;
- (ARUIRingsView)ringsView;
- (FIUIWorkoutSimpleCompletionRingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)iconImageView;
- (UIImageView)ringImageView;
- (UILabel)typeLabel;
- (void)configurePluralViewWithWorkoutActivityType:(id)a3;
- (void)configureWithWorkout:(id)a3;
- (void)layoutSubviews;
- (void)setIconImageView:(id)a3;
- (void)setRingImageView:(id)a3;
- (void)setRingsView:(id)a3;
- (void)setTypeLabel:(id)a3;
@end

@implementation FIUIWorkoutSimpleCompletionRingCell

+ (double)preferredHeightForWorkout:(id)a3 fittingWidth:(double)a4
{
  v5 = objc_msgSend(a3, "fiui_activityType");
  +[FIUIWorkoutSimpleCompletionRingCell preferredHeightForActivityType:v5 fittingWidth:0 plural:a4];
  double v7 = v6;

  return v7;
}

+ (double)preferredHeightForActivityType:(id)a3 fittingWidth:(double)a4 plural:(BOOL)a5
{
  if (a5)
  {
    double v6 = [a3 workoutActivityType];
    double v7 = [v6 localizedNamePlural];
  }
  else
  {
    double v7 = [a3 localizedName];
  }
  +[FIUIWorkoutSimpleCompletionRingCell preferredHeightForLocalizedName:v7 fittingWidth:a4];
  double v9 = v8;

  return v9;
}

+ (double)preferredHeightForLocalizedName:(id)a3 fittingWidth:(double)a4
{
  uint64_t v5 = preferredHeightForLocalizedName_fittingWidth__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&preferredHeightForLocalizedName_fittingWidth__onceToken, &__block_literal_global_13);
  }
  [(id)preferredHeightForLocalizedName_fittingWidth__sizingLabel setText:v6];

  objc_msgSend((id)preferredHeightForLocalizedName_fittingWidth__sizingLabel, "sizeThatFits:", a4 + 5.5 * -2.0, 1.79769313e308);
  double v8 = v7;
  [(id)preferredHeightForLocalizedName_fittingWidth__sizingLabel _firstLineBaselineOffsetFromBoundsTop];
  return v8 - v9 + 5.5 + 40.0 + 20.0;
}

void __84__FIUIWorkoutSimpleCompletionRingCell_preferredHeightForLocalizedName_fittingWidth___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F828E0]);
  uint64_t v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v2 = (void *)preferredHeightForLocalizedName_fittingWidth__sizingLabel;
  preferredHeightForLocalizedName_fittingWidth__sizingLabel = v1;

  [(id)preferredHeightForLocalizedName_fittingWidth__sizingLabel setNumberOfLines:0];
  _Font();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(id)preferredHeightForLocalizedName_fittingWidth__sizingLabel setFont:v3];
}

- (FIUIWorkoutSimpleCompletionRingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)FIUIWorkoutSimpleCompletionRingCell;
  v4 = [(FIUIWorkoutSimpleCompletionRingCell *)&v25 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F23970]) initWithNumberOfRings:1];
    HIDWORD(v6) = 1078198272;
    *(float *)&double v6 = 40.0;
    [v5 setRingDiameter:v6];
    HIDWORD(v7) = 1075052544;
    *(float *)&double v7 = 5.0;
    [v5 setRingThickness:v7];
    uint64_t v8 = [objc_alloc(MEMORY[0x263F23980]) initWithRingGroupController:v5];
    ringsView = v4->_ringsView;
    v4->_ringsView = (ARUIRingsView *)v8;

    id v10 = objc_alloc(MEMORY[0x263F82828]);
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], v12, v13, v14);
    ringImageView = v4->_ringImageView;
    v4->_ringImageView = (UIImageView *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v11, v12, v13, v14);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v17;

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v11, v12, v13, v14);
    typeLabel = v4->_typeLabel;
    v4->_typeLabel = (UILabel *)v19;

    [(UILabel *)v4->_typeLabel setNumberOfLines:0];
    v21 = _Font();
    [(UILabel *)v4->_typeLabel setFont:v21];

    v22 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v4->_typeLabel setTextColor:v22];

    v23 = [(FIUIWorkoutSimpleCompletionRingCell *)v4 contentView];
    [v23 addSubview:v4->_ringImageView];
    [v23 addSubview:v4->_iconImageView];
    [v23 addSubview:v4->_typeLabel];
  }
  return v4;
}

- (void)configureWithWorkout:(id)a3
{
  id v22 = a3;
  v4 = objc_msgSend(MEMORY[0x263F23950], "metricColorsForGoalTypeIdentifier:", objc_msgSend(v22, "_goalType"));
  if ([v22 _goalType])
  {
    uint64_t v5 = (void *)MEMORY[0x263F23978];
    double v6 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringsView];
    objc_msgSend(v22, "fiui_completionFactor");
    double v8 = v7;
    double v9 = [v4 gradientLightColor];
    id v10 = [v4 gradientDarkColor];
    double v11 = [v5 renderSingleRingUsingRingsView:v6 forPercentage:v9 withDiameter:v10 thickness:v8 topColor:40.0 bottomColor:5.0];
    double v12 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
    [v12 setImage:v11];
  }
  else
  {
    double v6 = FIUICircularWorkoutGradientImage(40.0);
    double v9 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
    [v9 setImage:v6];
  }

  double v13 = +[FIUIWorkoutActivityType activityTypeWithWorkout:v22];
  double v14 = FIUIStaticWorkoutIconImage(v13, 2);
  uint64_t v15 = [v14 imageWithRenderingMode:2];
  v16 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  [v16 setImage:v15];

  uint64_t v17 = [v4 nonGradientTextColor];
  v18 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  [v18 setTintColor:v17];

  uint64_t v19 = objc_msgSend(v22, "fiui_activityType");
  v20 = [v19 localizedName];
  v21 = [(FIUIWorkoutSimpleCompletionRingCell *)self typeLabel];
  [v21 setText:v20];
}

- (void)configurePluralViewWithWorkoutActivityType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FIUICircularWorkoutGradientImage(40.0);
  double v6 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
  [v6 setImage:v5];

  double v7 = FIUIStaticWorkoutIconImage(v4, 2);
  double v8 = [v7 imageWithRenderingMode:2];
  double v9 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  [v9 setImage:v8];

  id v10 = [MEMORY[0x263F23950] noMetricColors];
  double v11 = [v10 nonGradientTextColor];
  double v12 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  [v12 setTintColor:v11];

  id v15 = [v4 workoutActivityType];

  double v13 = [v15 localizedNamePlural];
  double v14 = [(FIUIWorkoutSimpleCompletionRingCell *)self typeLabel];
  [v14 setText:v13];
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)FIUIWorkoutSimpleCompletionRingCell;
  [(FIUIWorkoutSimpleCompletionRingCell *)&v36 layoutSubviews];
  id v3 = [(FIUIWorkoutSimpleCompletionRingCell *)self contentView];
  id v4 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
  objc_msgSend(v4, "setFrame:", 5.5, 5.5, 40.0, 40.0);

  uint64_t v5 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  objc_msgSend(v5, "setFrame:", 5.5, 5.5, 28.0, 28.0);

  double v6 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
  [v6 center];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  objc_msgSend(v11, "setCenter:", v8, v10);

  double v12 = [(FIUIWorkoutSimpleCompletionRingCell *)self typeLabel];
  [v3 frame];
  objc_msgSend(v12, "sizeThatFits:", v13 + 5.5 * -2.0, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;

  v18 = [(FIUIWorkoutSimpleCompletionRingCell *)self typeLabel];
  objc_msgSend(v18, "setFrame:", 5.5, 0.0, v15, v17);

  uint64_t v19 = [(FIUIWorkoutSimpleCompletionRingCell *)self typeLabel];
  v20 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
  [v20 frame];
  [v19 _setFirstLineBaselineFrameOriginY:CGRectGetMaxY(v37) + 20.0];

  v21 = [(FIUIWorkoutSimpleCompletionRingCell *)self ringImageView];
  [v3 bounds];
  FIUIFlipViewRightToLeftIfNeeded(v21, v22, v23, v24, v25);

  v26 = [(FIUIWorkoutSimpleCompletionRingCell *)self iconImageView];
  [v3 bounds];
  FIUIFlipViewRightToLeftIfNeeded(v26, v27, v28, v29, v30);

  v31 = [(FIUIWorkoutSimpleCompletionRingCell *)self typeLabel];
  [v3 bounds];
  FIUIFlipViewRightToLeftIfNeeded(v31, v32, v33, v34, v35);
}

- (ARUIRingsView)ringsView
{
  return self->_ringsView;
}

- (void)setRingsView:(id)a3
{
}

- (UIImageView)ringImageView
{
  return self->_ringImageView;
}

- (void)setRingImageView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_ringImageView, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end