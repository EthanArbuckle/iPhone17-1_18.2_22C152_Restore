@interface MKPlaceHoursView
- (BOOL)_shouldCollapseTopMessageLabel;
- (BOOL)wantsDefaultClipping;
- (GEOBusinessHours)businessHours;
- (MKPlaceHoursView)initWithBusinessHours:(id)a3;
- (MKPlaceHoursViewDelegate)hoursDelegate;
- (NSDictionary)formattedHoursData;
- (_MKLocalizedHoursBuilder)hoursBuilder;
- (_MKUILabel)topLabel;
- (id)_standardLabel;
- (id)hoursGrayColor;
- (unint64_t)placeHoursViewOptions;
- (void)_collapseAllLabelsFromOptions;
- (void)_commonInit;
- (void)_contentSizeDidChange;
- (void)_updateHoursView;
- (void)_updateOptionsForCollapsingToSingleLineAndColor;
- (void)applyRulesForTopAndBottomLabel;
- (void)infoCardThemeChanged;
- (void)setBusinessHours:(id)a3;
- (void)setFormattedHoursData:(id)a3;
- (void)setHoursBuilder:(id)a3;
- (void)setHoursDelegate:(id)a3;
- (void)setPlaceHoursViewOptions:(unint64_t)a3;
- (void)setTopLabel:(id)a3;
@end

@implementation MKPlaceHoursView

- (MKPlaceHoursView)initWithBusinessHours:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceHoursView;
  v6 = -[MKPlaceHoursView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_businessHours, a3);
    uint64_t v8 = [(GEOBusinessHours *)v7->_businessHours placeDailyHours];
    placeDailyHours = v7->_placeDailyHours;
    v7->_placeDailyHours = (NSArray *)v8;

    [(MKPlaceHoursView *)v7 _commonInit];
  }

  return v7;
}

- (void)_commonInit
{
  v44[4] = *MEMORY[0x1E4F143B8];
  [(MKPlaceHoursView *)self setPreservesSuperviewLayoutMargins:1];
  [(MKPlaceHoursView *)self setClipsToBounds:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];

  v4 = [(MKPlaceHoursView *)self _standardLabel];
  topMessageLabel = self->_topMessageLabel;
  self->_topMessageLabel = v4;

  [(_MKUILabel *)self->_topMessageLabel set_mapkit_themeColorProvider:0];
  v6 = self->_topMessageLabel;
  v7 = [MEMORY[0x1E4F428B8] grayColor];
  [(_MKUILabel *)v6 setTextColor:v7];

  uint64_t v8 = [(MKPlaceHoursView *)self _standardLabel];
  bottomMessageLabel = self->_bottomMessageLabel;
  self->_bottomMessageLabel = v8;

  [(_MKUILabel *)self->_bottomMessageLabel set_mapkit_themeColorProvider:0];
  v10 = self->_bottomMessageLabel;
  objc_super v11 = [MEMORY[0x1E4F428B8] grayColor];
  [(_MKUILabel *)v10 setTextColor:v11];

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(MKPlaceHoursView *)self layoutMarginsGuide];
  v39 = [v41 leadingAnchor];
  v38 = [(_MKUILabel *)self->_topMessageLabel leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v44[0] = v37;
  v36 = [(MKPlaceHoursView *)self layoutMarginsGuide];
  v35 = [v36 trailingAnchor];
  v34 = [(_MKUILabel *)self->_topMessageLabel trailingAnchor];
  v32 = [v35 constraintEqualToAnchor:v34];
  v44[1] = v32;
  v31 = [(MKPlaceHoursView *)self layoutMarginsGuide];
  v12 = [v31 leadingAnchor];
  v13 = [(_MKUILabel *)self->_bottomMessageLabel leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v44[2] = v14;
  v15 = [(MKPlaceHoursView *)self layoutMarginsGuide];
  v16 = [v15 trailingAnchor];
  v17 = [(_MKUILabel *)self->_bottomMessageLabel trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v44[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [v33 activateConstraints:v19];

  v42 = [(MKPlaceHoursView *)self layoutMarginsGuide];
  v40 = [v42 topAnchor];
  v20 = [(_MKUILabel *)self->_topMessageLabel topAnchor];
  v21 = [v40 constraintEqualToAnchor:v20];
  v43[0] = v21;
  v22 = [(_MKUILabel *)self->_topMessageLabel bottomAnchor];
  v23 = [(_MKUILabel *)self->_bottomMessageLabel topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v43[1] = v24;
  v25 = [(MKPlaceHoursView *)self layoutMarginsGuide];
  v26 = [v25 bottomAnchor];
  v27 = [(_MKUILabel *)self->_bottomMessageLabel bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v43[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  topAndBottomLabelConstraints = self->_topAndBottomLabelConstraints;
  self->_topAndBottomLabelConstraints = v29;
}

- (id)hoursGrayColor
{
  if (MapKitIdiomIsMacCatalyst()) {
    [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  }
  else {
  v2 = [MEMORY[0x1E4F428B8] grayColor];
  }

  return v2;
}

- (void)_contentSizeDidChange
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = +[MKFontManager sharedManager];
  v4 = [v3 bodyFont];
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_baselineToTop, "setConstant:");

  id v5 = +[MKFontManager sharedManager];
  v6 = [v5 bodyFont];
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", 22.0);
  double v8 = v7;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = self->_baselineToBaselineConstraints;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v13++) setConstant:v8];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  v14 = +[MKFontManager sharedManager];
  v15 = [v14 bodyFont];
  objc_msgSend(v15, "_mapkit_scaledValueForValue:", 17.0);
  double v17 = v16;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v18 = self->_baselineToBottomConstraints;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "setConstant:", v17, (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

- (_MKUILabel)topLabel
{
  if (![(MKPlaceHoursView *)self _shouldCollapseTopMessageLabel]
    || (topMessageLabel = self->_topDayOrHourLabel) == 0)
  {
    topMessageLabel = self->_topMessageLabel;
  }
  v4 = topMessageLabel;
  topLabel = self->_topLabel;
  self->_topLabel = v4;

  v6 = self->_topLabel;

  return v6;
}

- (void)setTopLabel:(id)a3
{
  id v5 = (_MKUILabel *)a3;
  if (self->_topLabel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_topLabel, a3);
    id v5 = v6;
  }
}

- (NSDictionary)formattedHoursData
{
  if (self->_placeHoursViewOptions)
  {
    v3 = [(MKPlaceHoursView *)self hoursBuilder];
    v4 = [v3 formatData:self->_placeDailyHours];
    formattedHoursData = self->_formattedHoursData;
    self->_formattedHoursData = v4;
  }
  v6 = self->_formattedHoursData;

  return v6;
}

- (void)setHoursBuilder:(id)a3
{
  id v5 = (_MKLocalizedHoursBuilder *)a3;
  if (self->_hoursBuilder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hoursBuilder, a3);
    [(MKPlaceHoursView *)self _updateHoursView];
    id v5 = v6;
  }
}

- (void)setPlaceHoursViewOptions:(unint64_t)a3
{
  if (self->_placeHoursViewOptions != a3)
  {
    self->_placeHoursViewOptions = a3;
    [(MKPlaceHoursView *)self _updateHoursView];
  }
}

- (void)applyRulesForTopAndBottomLabel
{
  uint64_t v3 = 424;
  [(_MKUILabel *)self->_topMessageLabel setText:&stru_1ED919588];
  topMessageLabel = self->_topMessageLabel;
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  [(_MKUILabel *)topMessageLabel setTextColor:v5];

  [(_MKUILabel *)self->_bottomMessageLabel setText:&stru_1ED919588];
  bottomMessageLabel = self->_bottomMessageLabel;
  double v7 = [MEMORY[0x1E4F428B8] clearColor];
  [(_MKUILabel *)bottomMessageLabel setTextColor:v7];

  unint64_t placeHoursViewOptions = self->_placeHoursViewOptions;
  uint64_t v9 = [(GEOBusinessHours *)self->_businessHours hoursType];
  if ((placeHoursViewOptions & 8) != 0)
  {
    switch(v9)
    {
      case 1:
LABEL_5:
        uint64_t v3 = 416;
        topLabel = self->_topLabel;
        v18 = [(GEOBusinessHours *)self->_businessHours localizedMessage];
        if (v18) {
          goto LABEL_9;
        }
        uint64_t v19 = +[_MKLocalizedHoursBuilder localizedHoursStringNormalHours];
        goto LABEL_11;
      case 2:
        uint64_t v3 = 416;
LABEL_8:
        topLabel = *(_MKUILabel **)((char *)&self->super.super.super.isa + v3);
        v18 = [(GEOBusinessHours *)self->_businessHours localizedMessage];
        if (v18)
        {
LABEL_9:
          [(_MKUILabel *)topLabel setText:v18];
        }
        else
        {
          uint64_t v19 = +[_MKLocalizedHoursBuilder localizedHoursDayRangeString:self->_businessHours];
          if (v19)
          {
LABEL_11:
            [(_MKUILabel *)topLabel setText:v19];
          }
          else
          {
            uint64_t v20 = +[_MKLocalizedHoursBuilder localizedHoursStringSpecialHours];
            [(_MKUILabel *)topLabel setText:v20];
          }
        }

        double v16 = *(_MKUILabel **)((char *)&self->super.super.super.isa + v3);
        goto LABEL_14;
      case 3:
      case 4:
LABEL_4:
        uint64_t v10 = self->_topMessageLabel;
        uint64_t v11 = [(_MKLocalizedHoursBuilder *)self->_hoursBuilder localizedOpenState];
        [(_MKUILabel *)v10 setText:v11];

        uint64_t v12 = self->_topMessageLabel;
        uint64_t v13 = [(_MKLocalizedHoursBuilder *)self->_hoursBuilder hoursStateLabelColor];
        [(_MKUILabel *)v12 setTextColor:v13];

        v14 = self->_bottomMessageLabel;
        v15 = [(GEOBusinessHours *)self->_businessHours localizedMessage];
        [(_MKUILabel *)v14 setText:v15];

        double v16 = self->_bottomMessageLabel;
LABEL_14:
        id v21 = [(MKPlaceHoursView *)self hoursGrayColor];
        [(_MKUILabel *)v16 setTextColor:v21];

        break;
      default:
        return;
    }
  }
  else
  {
    switch(v9)
    {
      case 1:
        goto LABEL_5;
      case 2:
        goto LABEL_8;
      case 3:
      case 4:
        goto LABEL_4;
      default:
        return;
    }
  }
}

- (BOOL)wantsDefaultClipping
{
  return 0;
}

- (void)infoCardThemeChanged
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceHoursView;
  [(UIView *)&v7 infoCardThemeChanged];
  uint64_t v3 = [(MKPlaceHoursView *)self hoursBuilder];
  [v3 updateHoursLabelColor];

  collapsableOpenStateLabel = self->_collapsableOpenStateLabel;
  id v5 = [(MKPlaceHoursView *)self hoursBuilder];
  v6 = [v5 hoursStateLabelColor];
  [(_MKUILabel *)collapsableOpenStateLabel setTextColor:v6];
}

- (id)_standardLabel
{
  uint64_t v3 = [_MKUILabel alloc];
  v4 = -[_MKUILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_MKUILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)v4 set_mapkit_themeColorProvider:&__block_literal_global_96];
  id v5 = +[MKFontManager sharedManager];
  v6 = [v5 bodyFont];
  [(_MKUILabel *)v4 setFont:v6];

  [(_MKUILabel *)v4 setNumberOfLines:4];
  [(MKPlaceHoursView *)self addSubview:v4];

  return v4;
}

uint64_t __34__MKPlaceHoursView__standardLabel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

- (void)_updateOptionsForCollapsingToSingleLineAndColor
{
  self->_placeHoursViewOptions &= ~4uLL;
  BOOL v3 = ([(_MKLocalizedHoursBuilder *)self->_hoursBuilder geoMapItemOpeningHourOptions] & 8) != 0
    && (self->_placeHoursViewOptions & 8) == 0;
  BOOL v4 = ([(_MKLocalizedHoursBuilder *)self->_hoursBuilder geoMapItemOpeningHourOptions] & 0x10) != 0
    && (self->_placeHoursViewOptions & 8) == 0;
  if (v3 || v4) {
    self->_placeHoursViewOptions |= 4uLL;
  }
}

- (void)_updateHoursView
{
  v2 = self;
  v132[1] = *MEMORY[0x1E4F143B8];
  [(MKPlaceHoursView *)self applyRulesForTopAndBottomLabel];
  if (!v2->_hoursBuilder
    || (v2->_placeHoursViewOptions | 0x40) == 0x40
    || ![(GEOBusinessHours *)v2->_businessHours hoursType]
    || [(GEOBusinessHours *)v2->_businessHours hoursType] == 4
    || [(GEOBusinessHours *)v2->_businessHours hoursType] == 3)
  {
    [MEMORY[0x1E4F28DC8] activateConstraints:v2->_topAndBottomLabelConstraints];
    [(MKPlaceHoursView *)v2 _collapseAllLabelsFromOptions];
    return;
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:v2->_topAndBottomLabelConstraints];
  BOOL v3 = [(MKPlaceHoursView *)v2 formattedHoursData];

  if (!v3) {
    return;
  }
  [(MKPlaceHoursView *)v2 _updateOptionsForCollapsingToSingleLineAndColor];
  if ((v2->_placeHoursViewOptions & 8) != 0)
  {
    [(MKPlaceHoursView *)v2 bounds];
    double Width = CGRectGetWidth(v134);
    if (Width == 0.0)
    {
      uint64_t v10 = +[MKSystemController sharedInstance];
      [v10 screenSize];
      double v12 = v11;
      double v14 = v13;

      if (v12 >= v14) {
        double v12 = v14;
      }
    }
    else
    {
      double v12 = Width;
    }
    [(MKPlaceHoursView *)v2 layoutMargins];
    BOOL v17 = v15 == 0.0;
    if (v16 == 0.0) {
      BOOL v17 = 1;
    }
    double v18 = 320.0;
    if (v17) {
      double v15 = 16.0;
    }
    else {
      double v18 = v16;
    }
    double v19 = v12 - v15 - v18 + -32.0;
    uint64_t v20 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"DaysFullWidth"];
    [v20 floatValue];
    float v22 = v21;

    long long v23 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"DaysShortWidth"];
    [v23 floatValue];
    double v25 = v24;

    long long v26 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"HoursFullWidth"];
    [v26 floatValue];
    float v28 = v27;

    long long v29 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"HoursShortWidth"];
    [v29 floatValue];
    double v31 = v30;

    if ((v2->_placeHoursViewOptions & 0x80) != 0)
    {
      id v5 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"DaysShort"];
      v112 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"HoursShort"];
    }
    else
    {
      double v32 = v28;
      uint64_t v33 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"DaysFull"];
      uint64_t v34 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"HoursFull"];
      v35 = (void *)v34;
      double v8 = v22 + v32;
      if (v8 <= v19)
      {
        v112 = (void *)v34;
        id v5 = v33;
        goto LABEL_31;
      }
      id v5 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"DaysShort", v8];

      double v8 = v25 + v32;
      if (v25 + v32 <= v19)
      {
        v112 = v35;
        goto LABEL_31;
      }
      v112 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"HoursShort", v8];
    }
    double v8 = v25 + v31;
    if (v25 + v31 > v19) {
      v2->_placeHoursViewOptions |= 1uLL;
    }
    goto LABEL_31;
  }
  BOOL v4 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"CurrentHours"];
  v132[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:1];

  v6 = [(NSDictionary *)v2->_formattedHoursData objectForKeyedSubscript:@"CurrentOpenState"];
  v130 = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
  v131 = v7;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];

LABEL_31:
  location = (id *)&v2->_labels;
  -[NSArray makeObjectsPerformSelector:](v2->_labels, "makeObjectsPerformSelector:", sel_removeFromSuperview, v8);
  v36 = (void *)MEMORY[0x1E4F1CBF0];
  v37 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v114 = (void *)[v36 mutableCopy];
  v38 = (void *)[v36 mutableCopy];
  id v121 = (id)[v36 mutableCopy];
  collapsableOpenStateLabel = v2->_collapsableOpenStateLabel;
  v2->_collapsableOpenStateLabel = 0;

  v40 = [(_MKUILabel *)v2->_topMessageLabel firstBaselineAnchor];
  v41 = [(MKPlaceHoursView *)v2 topAnchor];
  uint64_t v42 = [v40 constraintEqualToAnchor:v41 constant:22.0];
  baselineToTop = v2->_baselineToTop;
  v2->_baselineToTop = (NSLayoutConstraint *)v42;

  [v38 addObject:v2->_baselineToTop];
  v113 = v5;
  if ([v5 count])
  {
    v44 = v5;
    unint64_t v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v117 = v37;
    v116 = v2;
    v123 = v38;
    do
    {
      v49 = v48;
      v50 = [(MKPlaceHoursView *)v2 _standardLabel];
      v51 = [v44 objectAtIndexedSubscript:v45];
      [v50 setText:v51];

      [v121 addObject:v50];
      unint64_t v115 = v45;
      if (!v45)
      {
        objc_storeStrong((id *)&v2->_topDayOrHourLabel, v50);
        [(MKPlaceHoursView *)v2 setTopLabel:v2->_topDayOrHourLabel];
      }
      v52 = [v50 leadingAnchor];
      v53 = [(MKPlaceHoursView *)v2 layoutMarginsGuide];
      v54 = [v53 leadingAnchor];
      v55 = [v52 constraintEqualToAnchor:v54];
      [v123 addObject:v55];

      v56 = [(MKPlaceHoursView *)v2 bottomAnchor];
      v57 = [v50 lastBaselineAnchor];
      v58 = [v56 constraintGreaterThanOrEqualToAnchor:v57];
      [v114 addObject:v58];

      if (v2->_placeHoursViewOptions)
      {
        v59 = [v50 trailingAnchor];
        v60 = [(MKPlaceHoursView *)v2 layoutMarginsGuide];
        v61 = [v60 trailingAnchor];
        v62 = [v59 constraintEqualToAnchor:v61];
        [v123 addObject:v62];
      }
      v63 = [v50 firstBaselineAnchor];
      if (v49 && v47)
      {
        v64 = [(_MKUILabel *)v49 lastBaselineAnchor];
        v65 = [v63 constraintGreaterThanOrEqualToAnchor:v64];
        [v37 addObject:v65];

        v63 = [v50 firstBaselineAnchor];
        topMessageLabel = v47;
      }
      else
      {
        topMessageLabel = v2->_topMessageLabel;
      }
      v67 = [(_MKUILabel *)topMessageLabel lastBaselineAnchor];
      v68 = [v63 constraintGreaterThanOrEqualToAnchor:v67];
      [v37 addObject:v68];

      id v69 = v50;
      id v70 = v69;

      v48 = (_MKUILabel *)v70;
      v118 = v48;
      unint64_t v71 = v115;
      if ((v2->_placeHoursViewOptions & 4) != 0 || v115 >= [v112 count])
      {
        [(_MKUILabel *)v48 set_mapkit_themeColorProvider:0];
        v99 = [(MKPlaceHoursView *)v2 hoursBuilder];
        v100 = [v99 hoursStateLabelColor];
        [(_MKUILabel *)v118 setTextColor:v100];

        v48 = v118;
        v46 = v118;
        v101 = v2->_collapsableOpenStateLabel;
        v2->_collapsableOpenStateLabel = v46;
        v74 = v46;
        v44 = v113;
      }
      else
      {
        v72 = [v112 objectAtIndexedSubscript:v115];
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        obj = v72;
        uint64_t v122 = [(_MKUILabel *)v72 countByEnumeratingWithState:&v125 objects:v129 count:16];
        if (v122)
        {
          uint64_t v120 = *(void *)v126;
          v73 = v48;
          v74 = v48;
          do
          {
            uint64_t v75 = 0;
            v76 = v47;
            do
            {
              if (*(void *)v126 != v120) {
                objc_enumerationMutation(obj);
              }
              uint64_t v77 = *(void *)(*((void *)&v125 + 1) + 8 * v75);
              v78 = [(MKPlaceHoursView *)v2 _standardLabel];
              [v78 setText:v77];
              [v121 addObject:v78];
              v124 = v73;
              if ((v2->_placeHoursViewOptions & 8) != 0)
              {
                v82 = [(MKPlaceHoursView *)v2 layoutMarginsGuide];
                v83 = [v82 trailingAnchor];
                v84 = [v78 trailingAnchor];
                v85 = [v83 constraintEqualToAnchor:v84];
                [v123 addObject:v85];
              }
              else
              {
                objc_msgSend(v78, "set_mapkit_themeColorProvider:", 0);
                v79 = [(MKPlaceHoursView *)v2 hoursBuilder];
                v80 = [v79 hoursStateLabelColor];
                [v78 setTextColor:v80];

                v81 = v78;
                v82 = v2->_collapsableOpenStateLabel;
                v2->_collapsableOpenStateLabel = v81;
              }

              unint64_t placeHoursViewOptions = v2->_placeHoursViewOptions;
              v87 = [v78 firstBaselineAnchor];
              if ((placeHoursViewOptions & 1) != 0 || !v74)
              {
                v93 = [(_MKUILabel *)v48 lastBaselineAnchor];
                v94 = [v87 constraintGreaterThanOrEqualToAnchor:v93 constant:22.0];
                [v117 addObject:v94];

                if (v76)
                {
                  v95 = [v78 firstBaselineAnchor];
                  v96 = [(_MKUILabel *)v76 lastBaselineAnchor];
                  v97 = [v95 constraintGreaterThanOrEqualToAnchor:v96 constant:22.0];
                  [v117 addObject:v97];
                }
                v90 = [(MKPlaceHoursView *)v116 layoutMarginsGuide];
                v91 = [v90 leadingAnchor];
                v92 = [v78 leadingAnchor];
                v98 = [v91 constraintLessThanOrEqualToAnchor:v92];
                [v123 addObject:v98];

                v2 = v116;
                v48 = v118;
              }
              else
              {
                v88 = [(_MKUILabel *)v48 firstBaselineAnchor];
                v89 = [v87 constraintEqualToAnchor:v88];
                [v123 addObject:v89];

                v90 = [v78 leadingAnchor];
                v91 = [(_MKUILabel *)v48 trailingAnchor];
                v92 = [v90 constraintGreaterThanOrEqualToAnchor:v91 constant:8.0];
                [v123 addObject:v92];
              }

              v47 = v78;
              v74 = 0;
              ++v75;
              v76 = v47;
              v73 = v47;
            }
            while (v122 != v75);
            v74 = 0;
            v73 = v47;
            uint64_t v122 = [(_MKUILabel *)obj countByEnumeratingWithState:&v125 objects:v129 count:16];
          }
          while (v122);
          v46 = v47;
          v44 = v113;
          unint64_t v71 = v115;
        }
        else
        {
          v46 = v48;
          v74 = v48;
          v44 = v113;
        }
        v101 = obj;
      }

      unint64_t v45 = v71 + 1;
      v37 = v117;
    }
    while (v45 < [v44 count]);
    if (v46)
    {
      v102 = [(_MKUILabel *)v2->_bottomMessageLabel firstBaselineAnchor];
      v103 = [(_MKUILabel *)v46 lastBaselineAnchor];
      v104 = [v102 constraintEqualToAnchor:v103 constant:22.0];
      v105 = v123;
      [v123 addObject:v104];
    }
    else
    {
      v105 = v123;
    }
  }
  else
  {
    v46 = 0;
    v47 = 0;
    v118 = 0;
    v105 = v38;
  }
  v106 = [(MKPlaceHoursView *)v2 bottomAnchor];
  uint64_t v107 = [(_MKUILabel *)v2->_bottomMessageLabel lastBaselineAnchor];
  v108 = [v106 constraintEqualToAnchor:v107];
  [v114 addObject:v108];

  objc_storeStrong((id *)&v2->_baselineToBaselineConstraints, v37);
  [v105 addObjectsFromArray:v2->_baselineToBaselineConstraints];
  objc_storeStrong((id *)&v2->_baselineToBottomConstraints, v114);
  [v105 addObjectsFromArray:v2->_baselineToBottomConstraints];
  [MEMORY[0x1E4F28DC8] activateConstraints:v105];
  [(MKPlaceHoursView *)v2 _collapseAllLabelsFromOptions];
  objc_storeStrong(location, v121);
  [(MKPlaceHoursView *)v2 _contentSizeDidChange];
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_hoursDelegate);
  LOBYTE(v107) = objc_opt_respondsToSelector();

  if (v107)
  {
    v110 = [(MKPlaceHoursView *)v2 hoursDelegate];
    [v110 hoursViewDidUpdate:v2];
  }
}

- (void)_collapseAllLabelsFromOptions
{
  id v11 = (id)objc_opt_new();
  if ([(MKPlaceHoursView *)self _shouldCollapseTopMessageLabel])
  {
    BOOL v3 = [(_MKUILabel *)self->_topMessageLabel heightAnchor];
    BOOL v4 = [v3 constraintEqualToConstant:0.0];
    [v11 addObject:v4];

    if ([(NSArray *)self->_labels count]) {
      [(MKPlaceHoursView *)self setTopLabel:self->_topDayOrHourLabel];
    }
  }
  unint64_t placeHoursViewOptions = self->_placeHoursViewOptions;
  if ((placeHoursViewOptions & 0x20) != 0)
  {
    v6 = [(_MKUILabel *)self->_bottomMessageLabel heightAnchor];
    objc_super v7 = [v6 constraintEqualToConstant:0.0];
    [v11 addObject:v7];

    unint64_t placeHoursViewOptions = self->_placeHoursViewOptions;
  }
  if ((placeHoursViewOptions & 0x104) == 0x100)
  {
    collapsableOpenStateLabel = self->_collapsableOpenStateLabel;
    if (collapsableOpenStateLabel)
    {
      uint64_t v9 = [(_MKUILabel *)collapsableOpenStateLabel heightAnchor];
      uint64_t v10 = [v9 constraintEqualToConstant:0.0];
      [v11 addObject:v10];
    }
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v11];
}

- (BOOL)_shouldCollapseTopMessageLabel
{
  if ((self->_placeHoursViewOptions & 0x10) != 0) {
    return 1;
  }
  v2 = [(_MKUILabel *)self->_topMessageLabel text];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (unint64_t)placeHoursViewOptions
{
  return self->_placeHoursViewOptions;
}

- (_MKLocalizedHoursBuilder)hoursBuilder
{
  return self->_hoursBuilder;
}

- (void)setFormattedHoursData:(id)a3
{
}

- (GEOBusinessHours)businessHours
{
  return self->_businessHours;
}

- (void)setBusinessHours:(id)a3
{
}

- (MKPlaceHoursViewDelegate)hoursDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoursDelegate);

  return (MKPlaceHoursViewDelegate *)WeakRetained;
}

- (void)setHoursDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hoursDelegate);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_formattedHoursData, 0);
  objc_storeStrong((id *)&self->_hoursBuilder, 0);
  objc_storeStrong((id *)&self->_placeDailyHours, 0);
  objc_storeStrong((id *)&self->_topAndBottomLabelConstraints, 0);
  objc_storeStrong((id *)&self->_baselineToBottomConstraints, 0);
  objc_storeStrong((id *)&self->_baselineToBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_baselineToTop, 0);
  objc_storeStrong((id *)&self->_collapsableOpenStateLabel, 0);
  objc_storeStrong((id *)&self->_bottomMessageLabel, 0);
  objc_storeStrong((id *)&self->_topDayOrHourLabel, 0);
  objc_storeStrong((id *)&self->_topMessageLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

@end