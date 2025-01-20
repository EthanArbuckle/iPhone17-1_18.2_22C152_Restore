@interface NLActivityRichComplicationRectangularView
- (CLKMonochromeFilterProvider)filterProvider;
- (CLKUIColoringLabel)exerciseLabel;
- (CLKUIColoringLabel)moveLabel;
- (CLKUIColoringLabel)standLabel;
- (CLKUIColoringLabel)titleLabel;
- (NLActivityRichComplicationChartView)chartView;
- (NLActivityRichComplicationRectangularView)initWithFrame:(CGRect)a3;
- (NSArray)accentViews;
- (NSArray)flatViews;
- (NSLayoutConstraint)moveGlyphTitleLabelTrailingConstraint;
- (UIImageView)exerciseGlyphView;
- (UIImageView)moveGlyphView;
- (UIImageView)standGlyphView;
- (UIView)chartTitleView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_setAccentViewsVisibility:(BOOL)a3;
- (void)_setupViews;
- (void)_updateViews:(id)a3 withFilters:(id)a4;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)setAccentViews:(id)a3;
- (void)setChartTitleView:(id)a3;
- (void)setChartView:(id)a3;
- (void)setExerciseGlyphView:(id)a3;
- (void)setExerciseLabel:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setFlatViews:(id)a3;
- (void)setMoveGlyphTitleLabelTrailingConstraint:(id)a3;
- (void)setMoveGlyphView:(id)a3;
- (void)setMoveLabel:(id)a3;
- (void)setNeedsLayout;
- (void)setStandGlyphView:(id)a3;
- (void)setStandLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NLActivityRichComplicationRectangularView

- (NLActivityRichComplicationRectangularView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NLActivityRichComplicationRectangularView;
  v3 = -[NLActivityRichComplicationRectangularView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NLActivityRichComplicationRectangularView *)v3 _setupViews];
  }
  return v4;
}

- (void)_setupViews
{
  double v143 = 0.0;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  memset(v138, 0, sizeof(v138));
  v3 = +[CLKDevice currentDevice];
  sub_20A8(v3, (uint64_t)v138);

  double v4 = *((double *)v138 + 1);
  uint64_t v5 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*((double *)v138 + 1) design:UIFontWeightSemibold];
  id v6 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = (UIView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  chartTitleView = self->_chartTitleView;
  self->_chartTitleView = v10;

  [(UIView *)self->_chartTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NLActivityRichComplicationRectangularView *)self addSubview:self->_chartTitleView];
  v12 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 0, CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  [(CLKUIColoringLabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)self->_titleLabel setTextProviderFont:v5];
  [(UIView *)self->_chartTitleView addSubview:self->_titleLabel];
  v14 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 0, CGRectZero.origin.x, y, width, height);
  moveLabel = self->_moveLabel;
  self->_moveLabel = v14;

  [(CLKUIColoringLabel *)self->_moveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)self->_moveLabel setTextProviderFont:v5];
  [(UIView *)self->_chartTitleView addSubview:self->_moveLabel];
  uint64_t v16 = +[UIImageSymbolConfiguration configurationWithPointSize:v4];
  v17 = +[UIImage _systemImageNamed:@"activity.move" withConfiguration:v16];
  v18 = NTKMoveNonGradientTextColor();
  v136 = [v17 imageWithTintColor:v18 renderingMode:1];

  v19 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v136];
  moveGlyphView = self->_moveGlyphView;
  self->_moveGlyphView = v19;

  [(UIImageView *)self->_moveGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_chartTitleView addSubview:self->_moveGlyphView];
  v21 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 0, CGRectZero.origin.x, y, width, height);
  exerciseLabel = self->_exerciseLabel;
  self->_exerciseLabel = v21;

  [(CLKUIColoringLabel *)self->_exerciseLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v134 = (void *)v5;
  [(CLKUIColoringLabel *)self->_exerciseLabel setTextProviderFont:v5];
  [(UIView *)self->_chartTitleView addSubview:self->_exerciseLabel];
  v133 = (void *)v16;
  v23 = +[UIImage _systemImageNamed:@"activity.exercise" withConfiguration:v16];
  v24 = NTKExerciseNonGradientTextColor();
  v135 = [v23 imageWithTintColor:v24 renderingMode:1];

  v25 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v135];
  exerciseGlyphView = self->_exerciseGlyphView;
  self->_exerciseGlyphView = v25;

  [(UIImageView *)self->_exerciseGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_chartTitleView addSubview:self->_exerciseGlyphView];
  v27 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)CLKUIColoringLabel), "initWithFrame:options:", 0, CGRectZero.origin.x, y, width, height);
  standLabel = self->_standLabel;
  self->_standLabel = v27;

  [(CLKUIColoringLabel *)self->_standLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)self->_standLabel setTextProviderFont:v5];
  [(UIView *)self->_chartTitleView addSubview:self->_standLabel];
  v29 = +[UIImage _systemImageNamed:@"activity.stand" withConfiguration:v16];
  v30 = NTKStandNonGradientTextColor();
  v132 = [v29 imageWithTintColor:v30 renderingMode:1];

  v31 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v132];
  standGlyphView = self->_standGlyphView;
  self->_standGlyphView = v31;

  [(UIImageView *)self->_standGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_chartTitleView addSubview:self->_standGlyphView];
  v33 = [NLActivityRichComplicationChartView alloc];
  v34 = +[CLKDevice currentDevice];
  v35 = [(NLActivityRichComplicationChartView *)v33 initForDevice:v34];
  chartView = self->_chartView;
  self->_chartView = v35;

  [(NLActivityRichComplicationChartView *)self->_chartView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NLActivityRichComplicationRectangularView *)self addSubview:self->_chartView];
  v37 = self->_titleLabel;
  v147[0] = self->_chartView;
  v147[1] = v37;
  v38 = +[NSArray arrayWithObjects:v147 count:2];
  flatViews = self->_flatViews;
  self->_flatViews = v38;

  v40 = self->_moveLabel;
  v41 = self->_exerciseGlyphView;
  v146[0] = self->_moveGlyphView;
  v146[1] = v40;
  v42 = self->_exerciseLabel;
  v43 = self->_standGlyphView;
  v146[2] = v41;
  v146[3] = v42;
  v44 = self->_standLabel;
  v146[4] = v43;
  v146[5] = v44;
  v45 = +[NSArray arrayWithObjects:v146 count:6];
  accentViews = self->_accentViews;
  self->_accentViews = v45;

  id v47 = objc_alloc_init((Class)UILayoutGuide);
  [(NLActivityRichComplicationRectangularView *)self addLayoutGuide:v47];
  v130 = [v47 bottomAnchor];
  v129 = [(NLActivityRichComplicationRectangularView *)self bottomAnchor];
  v128 = [v130 constraintEqualToAnchor:v129 constant:-*((double *)&v142 + 1)];
  v145[0] = v128;
  v127 = [v47 leadingAnchor];
  v126 = [(NLActivityRichComplicationRectangularView *)self leadingAnchor];
  v125 = [v127 constraintEqualToAnchor:v126 constant:*(double *)&v142];
  v145[1] = v125;
  v131 = v47;
  v124 = [v47 trailingAnchor];
  v123 = [(NLActivityRichComplicationRectangularView *)self trailingAnchor];
  v122 = [v124 constraintEqualToAnchor:v123 constant:-v143];
  v145[2] = v122;
  v121 = [v47 topAnchor];
  v120 = [(NLActivityRichComplicationRectangularView *)self topAnchor];
  v119 = [v121 constraintEqualToAnchor:v120 constant:*((double *)&v141 + 1)];
  v145[3] = v119;
  v118 = [(UIView *)self->_chartTitleView topAnchor];
  v117 = [(NLActivityRichComplicationRectangularView *)self topAnchor];
  v116 = [v118 constraintEqualToAnchor:v117];
  v145[4] = v116;
  v115 = [(UIView *)self->_chartTitleView leadingAnchor];
  v114 = [(NLActivityRichComplicationRectangularView *)self leadingAnchor];
  v113 = [v115 constraintEqualToAnchor:v114];
  v145[5] = v113;
  v112 = [(CLKUIColoringLabel *)self->_titleLabel topAnchor];
  v111 = [(UIView *)self->_chartTitleView topAnchor];
  v110 = [v112 constraintEqualToAnchor:v111];
  v145[6] = v110;
  v109 = [(CLKUIColoringLabel *)self->_titleLabel leadingAnchor];
  v108 = [(UIView *)self->_chartTitleView leadingAnchor];
  double v48 = *(double *)&v139;
  v107 = [v109 constraintEqualToAnchor:v108 constant:*(double *)&v139];
  v145[7] = v107;
  v106 = [(CLKUIColoringLabel *)self->_titleLabel firstBaselineAnchor];
  v105 = [(UIView *)self->_chartTitleView bottomAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v145[8] = v104;
  v103 = [(UIImageView *)self->_moveGlyphView centerYAnchor];
  v102 = [(CLKUIColoringLabel *)self->_titleLabel centerYAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v145[9] = v101;
  v100 = [(UIImageView *)self->_moveGlyphView leadingAnchor];
  v99 = [(UIView *)self->_chartTitleView leadingAnchor];
  v98 = [v100 constraintGreaterThanOrEqualToAnchor:v99 constant:v48];
  v145[10] = v98;
  v97 = [(CLKUIColoringLabel *)self->_moveLabel topAnchor];
  v96 = [(CLKUIColoringLabel *)self->_titleLabel topAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v145[11] = v95;
  v94 = [(CLKUIColoringLabel *)self->_moveLabel leadingAnchor];
  v93 = [(UIImageView *)self->_moveGlyphView trailingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v145[12] = v92;
  v91 = [(UIImageView *)self->_exerciseGlyphView centerYAnchor];
  v90 = [(CLKUIColoringLabel *)self->_titleLabel centerYAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v145[13] = v89;
  v88 = [(UIImageView *)self->_exerciseGlyphView leadingAnchor];
  v137 = [(CLKUIColoringLabel *)self->_moveLabel trailingAnchor];
  double v49 = *(double *)&v140;
  v87 = [v88 constraintEqualToAnchor:v137 constant:*(double *)&v140];
  v145[14] = v87;
  v85 = [(CLKUIColoringLabel *)self->_exerciseLabel topAnchor];
  v84 = [(CLKUIColoringLabel *)self->_titleLabel topAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v145[15] = v83;
  v82 = [(CLKUIColoringLabel *)self->_exerciseLabel leadingAnchor];
  v81 = [(UIImageView *)self->_exerciseGlyphView trailingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v145[16] = v80;
  v79 = [(UIImageView *)self->_standGlyphView centerYAnchor];
  v78 = [(CLKUIColoringLabel *)self->_titleLabel centerYAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v145[17] = v77;
  v76 = [(UIImageView *)self->_standGlyphView leadingAnchor];
  v75 = [(CLKUIColoringLabel *)self->_exerciseLabel trailingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75 constant:v49];
  v145[18] = v74;
  v73 = [(CLKUIColoringLabel *)self->_standLabel topAnchor];
  v72 = [(CLKUIColoringLabel *)self->_titleLabel topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v145[19] = v71;
  v70 = [(CLKUIColoringLabel *)self->_standLabel leadingAnchor];
  v69 = [(UIImageView *)self->_standGlyphView trailingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v145[20] = v68;
  v67 = [(CLKUIColoringLabel *)self->_standLabel trailingAnchor];
  v66 = [(UIView *)self->_chartTitleView trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v145[21] = v65;
  v64 = [(NLActivityRichComplicationChartView *)self->_chartView topAnchor];
  v50 = [(UIView *)self->_chartTitleView bottomAnchor];
  v51 = [v64 constraintEqualToAnchor:v50 constant:*((double *)&v141 + 1)];
  v145[22] = v51;
  v52 = [(NLActivityRichComplicationChartView *)self->_chartView centerXAnchor];
  v53 = [(NLActivityRichComplicationRectangularView *)self centerXAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  v145[23] = v54;
  v55 = [(NLActivityRichComplicationChartView *)self->_chartView heightAnchor];
  v56 = [v55 constraintEqualToConstant:*((double *)&v140 + 1)];
  v145[24] = v56;
  v57 = [(NLActivityRichComplicationChartView *)self->_chartView widthAnchor];
  v58 = [v57 constraintEqualToConstant:*(double *)&v141];
  v145[25] = v58;
  v86 = +[NSArray arrayWithObjects:v145 count:26];

  +[NSLayoutConstraint activateConstraints:v86];
  v59 = [(UIImageView *)self->_moveGlyphView leadingAnchor];
  v60 = [(CLKUIColoringLabel *)self->_titleLabel trailingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  moveGlyphTitleLabelTrailingConstraint = self->_moveGlyphTitleLabelTrailingConstraint;
  self->_moveGlyphTitleLabelTrailingConstraint = v61;

  v144 = self->_moveGlyphTitleLabelTrailingConstraint;
  v63 = +[NSArray arrayWithObjects:&v144 count:1];
  +[NSLayoutConstraint activateConstraints:v63];
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)NLActivityRichComplicationRectangularView;
  [(NLActivityRichComplicationRectangularView *)&v3 setNeedsLayout];
  [(NLActivityRichComplicationChartView *)self->_chartView setNeedsLayout];
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NLActivityRichComplicationRectangularView initWithFrame:](self, "initWithFrame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  uint64_t v5 = [a3 metadata];
  id v6 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewActivityText"];
  v7 = [(NLActivityRichComplicationRectangularView *)self titleLabel];
  [v7 setTextProvider:v6];

  v61 = v6;
  v8 = [v6 tintColor];
  v9 = [(NLActivityRichComplicationRectangularView *)self titleLabel];
  [v9 setColor:v8];

  v10 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewMoveText"];
  v11 = [(NLActivityRichComplicationRectangularView *)self moveLabel];
  [v11 setTextProvider:v10];

  v60 = v10;
  v12 = [v10 tintColor];
  v13 = [(NLActivityRichComplicationRectangularView *)self moveLabel];
  [v13 setColor:v12];

  v14 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewExerciseText"];
  v15 = [(NLActivityRichComplicationRectangularView *)self exerciseLabel];
  [v15 setTextProvider:v14];

  v59 = v14;
  uint64_t v16 = [v14 tintColor];
  v17 = [(NLActivityRichComplicationRectangularView *)self exerciseLabel];
  [v17 setColor:v16];

  v18 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewSleepText"];
  v19 = [(NLActivityRichComplicationRectangularView *)self standLabel];
  [v19 setTextProvider:v18];

  v58 = v18;
  v20 = [v18 tintColor];
  v21 = [(NLActivityRichComplicationRectangularView *)self standLabel];
  [v21 setColor:v20];

  v22 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewActivityMoveMode"];
  id v23 = [v22 integerValue];

  v24 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewMoveChartData"];
  if (v24)
  {
    v25 = [(NLActivityRichComplicationRectangularView *)self chartView];
    [v25 setMoveGraphData:v24 activityMoveMode:v23];
  }
  v26 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewExerciseChartData"];
  if (v26)
  {
    v27 = [(NLActivityRichComplicationRectangularView *)self chartView];
    [v27 setExerciseGraphData:v26];
  }
  v28 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewStandChartData"];
  if (v28)
  {
    v29 = [(NLActivityRichComplicationRectangularView *)self chartView];
    [v29 setStandGraphData:v28];
  }
  v30 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewWheelchairUseKey"];
  unsigned int v31 = [v30 BOOLValue];

  v32 = @"activity.stand";
  if (v31) {
    v32 = @"activity.roll";
  }
  v33 = v32;
  v34 = +[CLKDevice currentDevice];
  sub_20A8(v34, (uint64_t)v62);
  v35 = +[UIImageSymbolConfiguration configurationWithPointSize:v63];

  v36 = +[UIImage _systemImageNamed:v33 withConfiguration:v35];

  v37 = NTKStandNonGradientTextColor();
  v38 = [v36 imageWithTintColor:v37 renderingMode:1];

  v39 = [(NLActivityRichComplicationRectangularView *)self standGlyphView];
  [v39 setImage:v38];

  v40 = [v5 objectForKeyedSubscript:@"NLActivityRichComplicationRectangularViewHideAccentViews"];
  id v41 = [v40 BOOLValue];

  [(NLActivityRichComplicationRectangularView *)self _setAccentViewsVisibility:v41];
  if (v41)
  {
    v42 = [(NLActivityRichComplicationRectangularView *)self titleLabel];
    v43 = v42;
LABEL_15:
    [v42 setHidden:0];

    goto LABEL_16;
  }
  v44 = +[CLKDevice currentDevice];
  [v44 screenBounds];
  double v46 = v45;

  id v47 = [(NLActivityRichComplicationRectangularView *)self moveGlyphTitleLabelTrailingConstraint];
  unsigned __int8 v48 = [v47 isActive];

  if ((v48 & 1) == 0)
  {
    double v49 = [(NLActivityRichComplicationRectangularView *)self moveGlyphTitleLabelTrailingConstraint];
    v65 = v49;
    v50 = +[NSArray arrayWithObjects:&v65 count:1];
    +[NSLayoutConstraint activateConstraints:v50];
  }
  v51 = [(NLActivityRichComplicationRectangularView *)self chartTitleView];
  LODWORD(v52) = 1112014848;
  LODWORD(v53) = 1112014848;
  objc_msgSend(v51, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 1.79769313e308, UILayoutFittingCompressedSize.height, v52, v53);
  double v55 = v54;

  v42 = [(NLActivityRichComplicationRectangularView *)self titleLabel];
  v43 = v42;
  if (v55 <= v46) {
    goto LABEL_15;
  }
  [v42 setHidden:1];

  v56 = [(NLActivityRichComplicationRectangularView *)self moveGlyphTitleLabelTrailingConstraint];
  v64 = v56;
  v57 = +[NSArray arrayWithObjects:&v64 count:1];
  +[NSLayoutConstraint deactivateConstraints:v57];

LABEL_16:
  [(NLActivityRichComplicationRectangularView *)self setNeedsLayout];
}

- (void)setFilterProvider:(id)a3
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v5 = [(NLActivityRichComplicationRectangularView *)self filterProvider];
  id v10 = [v5 filtersForView:self style:0 fraction:a3];

  if (v10)
  {
    id v6 = [(NLActivityRichComplicationRectangularView *)self flatViews];
    [(NLActivityRichComplicationRectangularView *)self _updateViews:v6 withFilters:v10];
  }
  v7 = [(NLActivityRichComplicationRectangularView *)self filterProvider];
  v8 = [v7 filtersForView:self style:2 fraction:a3];

  if (v8)
  {
    v9 = [(NLActivityRichComplicationRectangularView *)self accentViews];
    [(NLActivityRichComplicationRectangularView *)self _updateViews:v9 withFilters:v8];
  }
}

- (void)updateMonochromeColor
{
  objc_super v3 = [(NLActivityRichComplicationRectangularView *)self filterProvider];
  id v8 = [v3 filtersForView:self style:0];

  if (v8)
  {
    double v4 = [(NLActivityRichComplicationRectangularView *)self flatViews];
    [(NLActivityRichComplicationRectangularView *)self _updateViews:v4 withFilters:v8];
  }
  uint64_t v5 = [(NLActivityRichComplicationRectangularView *)self filterProvider];
  id v6 = [v5 filtersForView:self style:2];

  if (v6)
  {
    v7 = [(NLActivityRichComplicationRectangularView *)self accentViews];
    [(NLActivityRichComplicationRectangularView *)self _updateViews:v7 withFilters:v6];
  }
}

- (void)_updateViews:(id)a3 withFilters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) layer];
        [v11 setFilters:v6];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_setAccentViewsVisibility:(BOOL)a3
{
  double v4 = [(NLActivityRichComplicationRectangularView *)self accentViews];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2B88;
  v5[3] = &unk_10540;
  BOOL v6 = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (UIView)chartTitleView
{
  return self->_chartTitleView;
}

- (void)setChartTitleView:(id)a3
{
}

- (CLKUIColoringLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (CLKUIColoringLabel)moveLabel
{
  return self->_moveLabel;
}

- (void)setMoveLabel:(id)a3
{
}

- (UIImageView)moveGlyphView
{
  return self->_moveGlyphView;
}

- (void)setMoveGlyphView:(id)a3
{
}

- (NSLayoutConstraint)moveGlyphTitleLabelTrailingConstraint
{
  return self->_moveGlyphTitleLabelTrailingConstraint;
}

- (void)setMoveGlyphTitleLabelTrailingConstraint:(id)a3
{
}

- (CLKUIColoringLabel)exerciseLabel
{
  return self->_exerciseLabel;
}

- (void)setExerciseLabel:(id)a3
{
}

- (UIImageView)exerciseGlyphView
{
  return self->_exerciseGlyphView;
}

- (void)setExerciseGlyphView:(id)a3
{
}

- (CLKUIColoringLabel)standLabel
{
  return self->_standLabel;
}

- (void)setStandLabel:(id)a3
{
}

- (UIImageView)standGlyphView
{
  return self->_standGlyphView;
}

- (void)setStandGlyphView:(id)a3
{
}

- (NLActivityRichComplicationChartView)chartView
{
  return self->_chartView;
}

- (void)setChartView:(id)a3
{
}

- (NSArray)flatViews
{
  return self->_flatViews;
}

- (void)setFlatViews:(id)a3
{
}

- (NSArray)accentViews
{
  return self->_accentViews;
}

- (void)setAccentViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentViews, 0);
  objc_storeStrong((id *)&self->_flatViews, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_standGlyphView, 0);
  objc_storeStrong((id *)&self->_standLabel, 0);
  objc_storeStrong((id *)&self->_exerciseGlyphView, 0);
  objc_storeStrong((id *)&self->_exerciseLabel, 0);
  objc_storeStrong((id *)&self->_moveGlyphTitleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_moveGlyphView, 0);
  objc_storeStrong((id *)&self->_moveLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_chartTitleView, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

@end