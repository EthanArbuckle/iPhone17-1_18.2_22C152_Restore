@interface FIUIChartTimeAxisDescriptor
+ (unint64_t)_spacingIntervalFromAxisSpacing:(id)a3;
- (BOOL)_validateProperties;
- (BOOL)forceAMPMOnFirstLabel;
- (BOOL)generateSubAxisDescriptorOnlyForNoonMidnight;
- (BOOL)hideClippedLabels;
- (BOOL)subAxisCapitalize;
- (BOOL)useMinMaxLabelPlacement;
- (Class)expectedDataType;
- (FIUIChartDateAnchorRule)anchorRule;
- (FIUIChartDateAnchorRule)subAnchorRule;
- (FIUIChartTimeAxisDescriptor)init;
- (NSDateComponents)axisSpacing;
- (NSDateComponents)subAxisSpacing;
- (UIColor)highlightedLabelColor;
- (UIColor)highlightedSubLabelColor;
- (UIColor)selectedLabelColor;
- (UIColor)unhighlightedLabelColor;
- (UIColor)unhighlightedSubLabelColor;
- (UIFont)labelAMPMFont;
- (UIFont)labelFont;
- (UIFont)subLabelFont;
- (double)axisDescriptorPadding;
- (double)subAxisDescriptorPadding;
- (double)subAxisVerticalPadding;
- (id)_hourMinuteFormatterWithTextStyle:(unint64_t)a3;
- (id)_labelAtIndex:(unint64_t)a3;
- (id)_labelsForSpacingInterval:(unint64_t)a3 withSpacing:(id)a4 textStyle:(unint64_t)a5;
- (id)_newSubLabelFromDate:(id)a3 withTimeInterval:(unint64_t)a4 textStyle:(unint64_t)a5;
- (id)_startDateFromTimeInterval:(unint64_t)a3;
- (id)_stringFromDate:(id)a3 withTimeInterval:(unint64_t)a4 textStyle:(unint64_t)a5 forceAMPM:(BOOL)a6;
- (id)_subLabelAtIndex:(unint64_t)a3;
- (id)_subLabelsForSpacingInterval:(unint64_t)a3 withSpacing:(id)a4 textStyle:(unint64_t)a5;
- (id)axisLabels;
- (id)axisSubLabels;
- (id)dayFormatter:(unint64_t)a3;
- (id)hourFormatter:(unint64_t)a3;
- (id)maxValue;
- (id)minValue;
- (id)monthFormatter:(unint64_t)a3;
- (id)positionForLabelAtIndex:(unint64_t)a3;
- (id)positionForSubLabelAtIndex:(unint64_t)a3;
- (id)textForLabelAtIndex:(unint64_t)a3;
- (id)textForSubLabelAtIndex:(unint64_t)a3;
- (id)weekdayFormatter:(unint64_t)a3;
- (id)yearFormatter:(unint64_t)a3;
- (int64_t)_hourComponentFromDate:(id)a3;
- (unint64_t)labelAlignment;
- (unint64_t)numLabels;
- (unint64_t)numSubLabels;
- (unint64_t)subLabelAlignment;
- (unint64_t)subTextStyle;
- (unint64_t)subTimeInterval;
- (unint64_t)textStyle;
- (unint64_t)timeInterval;
- (void)_clearCache;
- (void)_clearFormatters;
- (void)_generateAxisLabels;
- (void)_generateAxisSubLabels;
- (void)invalidateCaches;
- (void)selectLabel:(BOOL)a3 atIndex:(unint64_t)a4;
- (void)setAnchorRule:(id)a3;
- (void)setAxisDescriptorPadding:(double)a3;
- (void)setAxisSpacing:(id)a3;
- (void)setForceAMPMOnFirstLabel:(BOOL)a3;
- (void)setGenerateSubAxisDescriptorOnlyForNoonMidnight:(BOOL)a3;
- (void)setHideClippedLabels:(BOOL)a3;
- (void)setHighlightedLabelColor:(id)a3;
- (void)setHighlightedSubLabelColor:(id)a3;
- (void)setLabelAMPMFont:(id)a3;
- (void)setLabelAlignment:(unint64_t)a3;
- (void)setLabelFont:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setSelectedLabelColor:(id)a3;
- (void)setSubAnchorRule:(id)a3;
- (void)setSubAxisCapitalize:(BOOL)a3;
- (void)setSubAxisDescriptorPadding:(double)a3;
- (void)setSubAxisSpacing:(id)a3;
- (void)setSubAxisVerticalPadding:(double)a3;
- (void)setSubLabelAlignment:(unint64_t)a3;
- (void)setSubLabelFont:(id)a3;
- (void)setSubTextStyle:(unint64_t)a3;
- (void)setSubTimeInterval:(unint64_t)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setTimeInterval:(unint64_t)a3;
- (void)setUnhighlightedLabelColor:(id)a3;
- (void)setUnhighlightedSubLabelColor:(id)a3;
- (void)setUseMinMaxLabelPlacement:(BOOL)a3;
@end

@implementation FIUIChartTimeAxisDescriptor

- (FIUIChartTimeAxisDescriptor)init
{
  v15.receiver = self;
  v15.super_class = (Class)FIUIChartTimeAxisDescriptor;
  v2 = [(FIUIChartTimeAxisDescriptor *)&v15 init];
  v3 = v2;
  if (v2)
  {
    cachedAxisLabels = v2->_cachedAxisLabels;
    v2->_cachedAxisLabels = 0;

    cachedAxisSubLabels = v3->_cachedAxisSubLabels;
    v3->_cachedAxisSubLabels = 0;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    cachedAxisLabelColors = v3->_cachedAxisLabelColors;
    v3->_cachedAxisLabelColors = (NSMutableArray *)v6;

    v3->_hideClippedLabels = 0;
    uint64_t v8 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    labelFont = v3->_labelFont;
    v3->_labelFont = (UIFont *)v8;

    uint64_t v10 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    subLabelFont = v3->_subLabelFont;
    v3->_subLabelFont = (UIFont *)v10;

    v12 = objc_alloc_init(FIUIChartDateAnchorRule);
    anchorRule = v3->_anchorRule;
    v3->_anchorRule = v12;

    [(FIUIChartDateAnchorRule *)v3->_anchorRule setRoundingValue:3];
    [(FIUIChartDateAnchorRule *)v3->_anchorRule setCalendarUnit:32];
    [(FIUIChartTimeAxisDescriptor *)v3 setTextStyle:4];
    [(FIUIChartTimeAxisDescriptor *)v3 setSubTextStyle:4];
    v3->_timeInterval = 6;
    v3->_subTimeInterval = 6;
  }
  return v3;
}

- (void)setAxisSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_axisSpacing, a3);
  id v6 = a3;
  cachedAxisLabels = self->_cachedAxisLabels;
  self->_cachedAxisLabels = 0;

  [(NSMutableArray *)self->_cachedAxisLabelColors removeAllObjects];
}

- (void)setSubAxisSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_subAxisSpacing, a3);
  id v6 = a3;
  cachedAxisSubLabels = self->_cachedAxisSubLabels;
  self->_cachedAxisSubLabels = 0;
}

- (id)_hourMinuteFormatterWithTextStyle:(unint64_t)a3
{
  hourMinuteFormatters = self->_hourMinuteFormatters;
  if (!hourMinuteFormatters)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_hourMinuteFormatters;
    self->_hourMinuteFormatters = v6;

    hourMinuteFormatters = self->_hourMinuteFormatters;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)hourMinuteFormatters objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    [v9 setDateStyle:0];
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
      case 3uLL:
      case 4uLL:
        uint64_t v10 = v9;
        uint64_t v11 = 1;
        goto LABEL_8;
      case 2uLL:
        [v9 setTimeStyle:1];
        objc_super v15 = [MEMORY[0x263EFF960] currentLocale];
        v19[0] = 0;
        v19[1] = 0;
        v18[0] = 0;
        v18[1] = 0;
        id v16 = GetFormatAndHourFieldRangesFor_ha(v15, v19, v18);
        if (v19[0] >= (unint64_t)v18[0]) {
          v17 = @"ah:mm";
        }
        else {
          v17 = @"h:mma";
        }
        [v9 setDateFormat:v17];

        break;
      case 5uLL:
        uint64_t v10 = v9;
        uint64_t v11 = 2;
        goto LABEL_8;
      case 6uLL:
        uint64_t v10 = v9;
        uint64_t v11 = 3;
LABEL_8:
        [v10 setTimeStyle:v11];
        break;
      default:
        break;
    }
    v12 = self->_hourMinuteFormatters;
    v13 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v9 forKeyedSubscript:v13];
  }
  return v9;
}

- (id)hourFormatter:(unint64_t)a3
{
  hourFormatters = self->_hourFormatters;
  if (!hourFormatters)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_hourFormatters;
    self->_hourFormatters = v6;

    hourFormatters = self->_hourFormatters;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)hourFormatters objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
    [v9 setLocale:v10];

    id v11 = objc_alloc_init(MEMORY[0x263F08790]);
    v12 = [v9 locale];
    [v11 setLocale:v12];

    [v11 setTimeStyle:1];
    v13 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    v14 = (void *)[v13 mutableCopy];

    objc_super v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    [v14 formUnionWithCharacterSet:v15];

    id v16 = [MEMORY[0x263EFF910] date];
    v17 = [v11 stringFromDate:v16];
    v18 = [v17 stringByTrimmingCharactersInSet:v14];

    if ([v18 length])
    {
      v19 = [v18 substringToIndex:1];
    }
    else
    {
      v19 = &stru_26CF5F1B8;
    }
    int v20 = _FIUICPTimeFormatIs24HourMode();
    v21 = @"h";
    if (v20 && a3 <= 7) {
      v21 = off_2644A86B0[a3];
    }
    if (a3 != 1)
    {
      if (a3)
      {
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          objc_msgSend(MEMORY[0x263EFF960], "currentLocale", v21);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v32[0] = 0;
          v32[1] = 0;
          v31[0] = 0;
          v31[1] = 0;
          id v23 = GetFormatAndHourFieldRangesFor_ha(v22, v32, v31);
          v24 = @"ah";
          if (a3 == 3) {
            v24 = @"a h";
          }
          v25 = @"h a";
          if (a3 != 3) {
            v25 = @"ha";
          }
          if (v32[0] >= (unint64_t)v31[0]) {
            v26 = v24;
          }
          else {
            v26 = v25;
          }
          v27 = v9;
        }
        else
        {
          if (a3 == 6)
          {
            [NSString stringWithFormat:@"%@%@mm a", v21, v19];
          }
          else
          {
            if (a3 != 5 && a3 != 4) {
              goto LABEL_30;
            }
            [NSString stringWithFormat:@"%@%@mm", v21, v19];
          }
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v27 = v9;
          v26 = v22;
        }
        [v27 setDateFormat:v26];

LABEL_30:
        v28 = self->_hourFormatters;
        v29 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v28 setObject:v9 forKeyedSubscript:v29];

        goto LABEL_31;
      }
      v21 = @"a";
    }
    [v9 setDateFormat:v21];
    goto LABEL_30;
  }
LABEL_31:
  return v9;
}

- (id)dayFormatter:(unint64_t)a3
{
  dayFormatters = self->_dayFormatters;
  if (!dayFormatters)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_dayFormatters;
    self->_dayFormatters = v6;

    dayFormatters = self->_dayFormatters;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)dayFormatters objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
    [v9 setLocale:v10];

    if (a3 <= 6 && ((1 << a3) & 0x73) != 0) {
      [v9 setDateFormat:@"d"];
    }
    id v11 = self->_dayFormatters;
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
  }
  return v9;
}

- (id)weekdayFormatter:(unint64_t)a3
{
  weekdayFormatters = self->_weekdayFormatters;
  if (!weekdayFormatters)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_weekdayFormatters;
    self->_weekdayFormatters = v6;

    weekdayFormatters = self->_weekdayFormatters;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)weekdayFormatters objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
    [v9 setLocale:v10];

    if (a3 <= 6 && ((0x73u >> a3) & 1) != 0) {
      [v9 setDateFormat:off_2644A86F0[a3]];
    }
    id v11 = self->_weekdayFormatters;
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
  }
  return v9;
}

- (id)monthFormatter:(unint64_t)a3
{
  monthFormatters = self->_monthFormatters;
  if (!monthFormatters)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_monthFormatters;
    self->_monthFormatters = v6;

    monthFormatters = self->_monthFormatters;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)monthFormatters objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
    [v9 setLocale:v10];

    if (a3 <= 6 && ((0x73u >> a3) & 1) != 0) {
      [v9 setDateFormat:off_2644A8728[a3]];
    }
    id v11 = self->_monthFormatters;
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
  }
  return v9;
}

- (id)yearFormatter:(unint64_t)a3
{
  yearFormatters = self->_yearFormatters;
  if (!yearFormatters)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = self->_yearFormatters;
    self->_yearFormatters = v6;

    yearFormatters = self->_yearFormatters;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)yearFormatters objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
    [v9 setLocale:v10];

    if (a3 <= 6 && ((1 << a3) & 0x73) != 0) {
      [v9 setDateFormat:@"YYYY"];
    }
    id v11 = self->_yearFormatters;
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
  }
  return v9;
}

- (void)setMinValue:(id)a3
{
  id v4 = a3;
  if ([self->_minValue compare:v4]) {
    [(FIUIChartTimeAxisDescriptor *)self _clearCache];
  }
  id minValue = self->_minValue;
  self->_id minValue = v4;
}

- (void)setMaxValue:(id)a3
{
  id v4 = a3;
  if ([self->_maxValue compare:v4]) {
    [(FIUIChartTimeAxisDescriptor *)self _clearCache];
  }
  id maxValue = self->_maxValue;
  self->_id maxValue = v4;
}

- (void)invalidateCaches
{
  cachedAxisLabels = self->_cachedAxisLabels;
  self->_cachedAxisLabels = 0;

  cachedAxisSubLabels = self->_cachedAxisSubLabels;
  self->_cachedAxisSubLabels = 0;

  [(FIUIChartTimeAxisDescriptor *)self _clearFormatters];
}

- (void)_clearCache
{
  cachedAxisLabels = self->_cachedAxisLabels;
  self->_cachedAxisLabels = 0;

  cachedAxisSubLabels = self->_cachedAxisSubLabels;
  self->_cachedAxisSubLabels = 0;

  cachedAxisLabelColors = self->_cachedAxisLabelColors;
  [(NSMutableArray *)cachedAxisLabelColors removeAllObjects];
}

- (void)_clearFormatters
{
  hourFormatters = self->_hourFormatters;
  self->_hourFormatters = 0;

  dayFormatters = self->_dayFormatters;
  self->_dayFormatters = 0;

  weekdayFormatters = self->_weekdayFormatters;
  self->_weekdayFormatters = 0;

  monthFormatters = self->_monthFormatters;
  self->_monthFormatters = 0;

  yearFormatters = self->_yearFormatters;
  self->_yearFormatters = 0;
}

- (void)_generateAxisLabels
{
  if ([(FIUIChartTimeAxisDescriptor *)self _validateProperties])
  {
    unint64_t timeInterval = self->_timeInterval;
    if (timeInterval == 6) {
      unint64_t timeInterval = [(id)objc_opt_class() _spacingIntervalFromAxisSpacing:self->_axisSpacing];
    }
    self->_cachedAxisLabels = [(FIUIChartTimeAxisDescriptor *)self _labelsForSpacingInterval:timeInterval withSpacing:self->_axisSpacing textStyle:self->_textStyle];
  }
  else
  {
    self->_cachedAxisLabels = 0;
  }
  MEMORY[0x270F9A758]();
}

- (void)_generateAxisSubLabels
{
  if ([(FIUIChartTimeAxisDescriptor *)self _validateProperties])
  {
    unint64_t subTimeInterval = self->_subTimeInterval;
    if (subTimeInterval == 6) {
      unint64_t subTimeInterval = [(id)objc_opt_class() _spacingIntervalFromAxisSpacing:self->_subAxisSpacing];
    }
    self->_cachedAxisSubLabels = [(FIUIChartTimeAxisDescriptor *)self _subLabelsForSpacingInterval:subTimeInterval withSpacing:self->_subAxisSpacing textStyle:self->_subTextStyle];
  }
  else
  {
    self->_cachedAxisSubLabels = 0;
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)_validateProperties
{
  v3 = [(FIUIChartTimeAxisDescriptor *)self minValue];
  id v4 = [(FIUIChartTimeAxisDescriptor *)self maxValue];
  uint64_t v5 = [v3 compare:v4];

  if (v5 == 1) {
    goto LABEL_4;
  }
  axisSpacing = self->_axisSpacing;
  if (axisSpacing)
  {
    if (_ZeroDateComponents(axisSpacing))
    {
LABEL_4:
      LOBYTE(axisSpacing) = 0;
      return (char)axisSpacing;
    }
    subAxisSpacing = self->_subAxisSpacing;
    if (subAxisSpacing) {
      LOBYTE(axisSpacing) = !_ZeroDateComponents(subAxisSpacing);
    }
    else {
      LOBYTE(axisSpacing) = 1;
    }
  }
  return (char)axisSpacing;
}

- (id)_labelsForSpacingInterval:(unint64_t)a3 withSpacing:(id)a4 textStyle:(unint64_t)a5
{
  id v29 = a4;
  unint64_t v27 = a3;
  v7 = [(FIUIChartTimeAxisDescriptor *)self _startDateFromTimeInterval:a3];
  uint64_t v8 = [(FIUIChartTimeAxisDescriptor *)self maxValue];
  id v9 = (void *)v8;
  id v30 = 0;
  if (v7 && v8)
  {
    id v30 = [MEMORY[0x263EFF980] array];
    v31 = [MEMORY[0x263EFF910] date];
    v26 = v7;
    id v10 = v7;
    id v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    BOOL forceAMPMOnFirstLabel = self->_forceAMPMOnFirstLabel;
    uint64_t v13 = [v11 component:32 fromDate:v10];
    if ((objc_msgSend(v10, "hk_isAfterDate:", v9) & 1) == 0)
    {
      BOOL v14 = forceAMPMOnFirstLabel;
      uint64_t v15 = v13 < 12;
      do
      {
        id v16 = v10;
        objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v29, v10, 0, v26);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v11 component:32 fromDate:v10] < 12;
        v18 = objc_alloc_init(FIUIChartAxisLabel);
        BOOL v19 = v14 || self->_useMinMaxLabelPlacement;
        int v20 = [(FIUIChartTimeAxisDescriptor *)self _stringFromDate:v16 withTimeInterval:v27 textStyle:a5 forceAMPM:v19];
        [(FIUIChartAxisLabel *)v18 setText:v20];
        [(FIUIChartAxisLabel *)v18 setLocation:v16];
        [(FIUIChartAxisLabel *)v18 setLabelColor:self->_unhighlightedLabelColor];
        if (self->_useMinMaxLabelPlacement && objc_msgSend(v10, "hk_isAfterDate:", v9)) {
          [(FIUIChartAxisLabel *)v18 setUseReversePlacement:1];
        }
        int v21 = objc_msgSend(v10, "hk_isAfterDate:", v31);
        p_unhighlightedLabelColor = &self->_unhighlightedLabelColor;
        if (v21)
        {
          int v23 = objc_msgSend(v16, "hk_isBeforeDate:", v31);
          p_unhighlightedLabelColor = &self->_unhighlightedLabelColor;
          if (v23)
          {
            [(FIUIChartAxisLabel *)v18 setLabelColor:self->_highlightedLabelColor];
            p_unhighlightedLabelColor = &self->_highlightedLabelColor;
          }
        }
        [(NSMutableArray *)self->_cachedAxisLabelColors addObject:*p_unhighlightedLabelColor];
        [v30 addObject:v18];
        BOOL v14 = self->_forceAMPMOnFirstLabel && v15 != v17;

        uint64_t v15 = v17;
      }
      while (!objc_msgSend(v10, "hk_isAfterDate:", v9));
    }

    v7 = v26;
  }

  return v30;
}

- (int64_t)_hourComponentFromDate:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  id v6 = [v5 components:32 fromDate:v4];

  int64_t v7 = [v6 hour];
  return v7;
}

- (id)_newSubLabelFromDate:(id)a3 withTimeInterval:(unint64_t)a4 textStyle:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(FIUIChartAxisLabel);
  id v10 = [(FIUIChartTimeAxisDescriptor *)self _stringFromDate:v8 withTimeInterval:a4 textStyle:a5 forceAMPM:0];
  id v11 = v10;
  if (self->_subAxisCapitalize)
  {
    uint64_t v12 = [v10 localizedUppercaseString];

    id v11 = (void *)v12;
  }
  [(FIUIChartAxisLabel *)v9 setText:v11];
  [(FIUIChartAxisLabel *)v9 setLocation:v8];
  [(FIUIChartAxisLabel *)v9 setLabelColor:self->_unhighlightedSubLabelColor];

  return v9;
}

- (id)_subLabelsForSpacingInterval:(unint64_t)a3 withSpacing:(id)a4 textStyle:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(FIUIChartTimeAxisDescriptor *)self _startDateFromTimeInterval:a3];
  uint64_t v9 = [(FIUIChartTimeAxisDescriptor *)self maxValue];
  id v10 = (void *)v9;
  id v11 = 0;
  if (v8 && v9)
  {
    id v11 = [MEMORY[0x263EFF980] array];
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    BOOL v19 = v8;
    id v13 = v8;
    BOOL v14 = [MEMORY[0x263EFF8F0] currentCalendar];
    if ((objc_msgSend(v13, "hk_isAfterDate:", v10) & 1) == 0)
    {
      while (1)
      {
        uint64_t v15 = v13;
        objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v7, v13, 0, v19);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!self->_generateSubAxisDescriptorOnlyForNoonMidnight) {
          break;
        }
        unint64_t v16 = [(FIUIChartTimeAxisDescriptor *)self _hourComponentFromDate:v15];
        if (v16 > 0x18 || ((1 << v16) & 0x1001001) == 0 || (_FIUICPTimeFormatIs24HourMode() & 1) != 0) {
          goto LABEL_15;
        }
        id v17 = [(FIUIChartTimeAxisDescriptor *)self _newSubLabelFromDate:v15 withTimeInterval:a3 textStyle:a5];
        if (objc_msgSend(v13, "hk_isAfterDate:", v12)
          && (objc_msgSend(v15, "hk_isBeforeDate:", v12) & 1) != 0)
        {
          goto LABEL_13;
        }
LABEL_14:
        [v11 addObject:v17];

LABEL_15:
        if (objc_msgSend(v13, "hk_isAfterDate:", v10)) {
          goto LABEL_16;
        }
      }
      id v17 = [(FIUIChartTimeAxisDescriptor *)self _newSubLabelFromDate:v15 withTimeInterval:a3 textStyle:a5];
      if (!objc_msgSend(v13, "hk_isAfterDate:", v12)
        || !objc_msgSend(v15, "hk_isBeforeDate:", v12))
      {
        goto LABEL_14;
      }
LABEL_13:
      [v17 setLabelColor:self->_highlightedSubLabelColor];
      goto LABEL_14;
    }
LABEL_16:

    id v8 = v19;
  }

  return v11;
}

- (id)_startDateFromTimeInterval:(unint64_t)a3
{
  id v4 = [(FIUIChartTimeAxisDescriptor *)self minValue];

  if (v4)
  {
    anchorRule = self->_anchorRule;
    id v6 = [(FIUIChartTimeAxisDescriptor *)self minValue];
    id v7 = [(FIUIChartDateAnchorRule *)anchorRule generateAnchorFromDate:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_stringFromDate:(id)a3 withTimeInterval:(unint64_t)a4 textStyle:(unint64_t)a5 forceAMPM:(BOOL)a6
{
  id v9 = a3;
  switch(a4)
  {
    case 0uLL:
      id v10 = [(FIUIChartTimeAxisDescriptor *)self _hourMinuteFormatterWithTextStyle:a5];
      goto LABEL_17;
    case 1uLL:
      if (a5 == 7)
      {
        uint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
        uint64_t v13 = [v12 component:32 fromDate:v9];

        if (v13 == 12)
        {
          BOOL v14 = FIUIBundle();
          uint64_t v15 = [v14 localizedStringForKey:@"NOON" value:&stru_26CF5F1B8 table:@"Localizable"];
          goto LABEL_18;
        }
        unint64_t v16 = self;
        unint64_t v17 = 4;
      }
      else
      {
        [(FIUIChartTimeAxisDescriptor *)self _hourComponentFromDate:v9];
        if (a5 & 0xFFFFFFFFFFFFFFFELL) == 2 && (_FIUICPTimeFormatIs24HourMode())
        {
          unint64_t v16 = self;
          unint64_t v17 = 1;
        }
        else
        {
          unint64_t v16 = self;
          unint64_t v17 = a5;
        }
      }
      id v10 = [(FIUIChartTimeAxisDescriptor *)v16 hourFormatter:v17];
LABEL_17:
      BOOL v14 = v10;
      uint64_t v15 = [v10 stringFromDate:v9];
LABEL_18:
      id v11 = (void *)v15;

LABEL_19:
      return v11;
    case 2uLL:
      id v10 = [(FIUIChartTimeAxisDescriptor *)self weekdayFormatter:a5];
      goto LABEL_17;
    case 3uLL:
      id v10 = [(FIUIChartTimeAxisDescriptor *)self dayFormatter:a5];
      goto LABEL_17;
    case 4uLL:
      id v10 = [(FIUIChartTimeAxisDescriptor *)self monthFormatter:a5];
      goto LABEL_17;
    case 5uLL:
      id v10 = [(FIUIChartTimeAxisDescriptor *)self yearFormatter:a5];
      goto LABEL_17;
    default:
      id v11 = 0;
      goto LABEL_19;
  }
}

+ (unint64_t)_spacingIntervalFromAxisSpacing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 day];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = [v3 weekOfYear];
  uint64_t v7 = [v3 month];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = [v3 year];

  if ((unint64_t)(v9 - 1) <= 0x7FFFFFFFFFFFFFFDLL && !v8) {
    return 5;
  }
  BOOL v11 = (unint64_t)(v6 - 1) >= 0x7FFFFFFFFFFFFFFELL && v5 <= 0;
  uint64_t v12 = 3;
  if (v11) {
    uint64_t v12 = 1;
  }
  if ((unint64_t)(v5 - 1) >= 6) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = 2;
  }
  if (v8 <= 0) {
    return v13;
  }
  else {
    return 4;
  }
}

- (id)_labelAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(FIUIChartTimeAxisDescriptor *)self axisLabels];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)axisLabels
{
  cachedAxisLabels = self->_cachedAxisLabels;
  if (!cachedAxisLabels)
  {
    [(FIUIChartTimeAxisDescriptor *)self _generateAxisLabels];
    cachedAxisLabels = self->_cachedAxisLabels;
  }
  return cachedAxisLabels;
}

- (unint64_t)numLabels
{
  v2 = [(FIUIChartTimeAxisDescriptor *)self axisLabels];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)positionForLabelAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(FIUIChartTimeAxisDescriptor *)self _labelAtIndex:a3];
  uint64_t v4 = [v3 location];

  return v4;
}

- (id)textForLabelAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(FIUIChartTimeAxisDescriptor *)self _labelAtIndex:a3];
  uint64_t v4 = [v3 text];

  return v4;
}

- (void)selectLabel:(BOOL)a3 atIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  if ([(FIUIChartTimeAxisDescriptor *)self numLabels] <= a4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(FIUIChartTimeAxisDescriptor *)self _labelAtIndex:a4];
  }
  id v10 = v7;
  if (v5)
  {
    [v7 setLabelColor:self->_selectedLabelColor];
  }
  else
  {
    if ([(NSMutableArray *)self->_cachedAxisLabelColors count] <= a4)
    {
      uint64_t v8 = self->_unhighlightedLabelColor;
    }
    else
    {
      uint64_t v8 = [(NSMutableArray *)self->_cachedAxisLabelColors objectAtIndexedSubscript:a4];
    }
    uint64_t v9 = v8;
    [v10 setLabelColor:v8];
  }
}

- (id)_subLabelAtIndex:(unint64_t)a3
{
  if (self->_subAxisSpacing)
  {
    uint64_t v4 = [(FIUIChartTimeAxisDescriptor *)self axisSubLabels];
    BOOL v5 = [v4 objectAtIndex:a3];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (id)axisSubLabels
{
  if (self->_subAxisSpacing)
  {
    cachedAxisSubLabels = self->_cachedAxisSubLabels;
    if (!cachedAxisSubLabels)
    {
      [(FIUIChartTimeAxisDescriptor *)self _generateAxisSubLabels];
      cachedAxisSubLabels = self->_cachedAxisSubLabels;
    }
    uint64_t v4 = cachedAxisSubLabels;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (unint64_t)numSubLabels
{
  if (!self->_subAxisSpacing) {
    return 0;
  }
  v2 = [(FIUIChartTimeAxisDescriptor *)self axisSubLabels];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)positionForSubLabelAtIndex:(unint64_t)a3
{
  if (self->_subAxisSpacing)
  {
    unint64_t v3 = [(FIUIChartTimeAxisDescriptor *)self _subLabelAtIndex:a3];
    uint64_t v4 = [v3 location];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)textForSubLabelAtIndex:(unint64_t)a3
{
  if (self->_subAxisSpacing)
  {
    unint64_t v3 = [(FIUIChartTimeAxisDescriptor *)self _subLabelAtIndex:a3];
    uint64_t v4 = [v3 text];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (Class)expectedDataType
{
  return (Class)objc_opt_class();
}

- (id)minValue
{
  return self->_minValue;
}

- (id)maxValue
{
  return self->_maxValue;
}

- (unint64_t)labelAlignment
{
  return self->_labelAlignment;
}

- (void)setLabelAlignment:(unint64_t)a3
{
  self->_labelAlignment = a3;
}

- (unint64_t)subLabelAlignment
{
  return self->_subLabelAlignment;
}

- (void)setSubLabelAlignment:(unint64_t)a3
{
  self->_subLabelAlignment = a3;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
}

- (UIColor)highlightedLabelColor
{
  return self->_highlightedLabelColor;
}

- (void)setHighlightedLabelColor:(id)a3
{
}

- (UIColor)unhighlightedLabelColor
{
  return self->_unhighlightedLabelColor;
}

- (void)setUnhighlightedLabelColor:(id)a3
{
}

- (UIColor)selectedLabelColor
{
  return self->_selectedLabelColor;
}

- (void)setSelectedLabelColor:(id)a3
{
}

- (double)axisDescriptorPadding
{
  return self->_axisDescriptorPadding;
}

- (void)setAxisDescriptorPadding:(double)a3
{
  self->_axisDescriptorPadding = a3;
}

- (double)subAxisDescriptorPadding
{
  return self->_subAxisDescriptorPadding;
}

- (void)setSubAxisDescriptorPadding:(double)a3
{
  self->_subAxisDescriptorPadding = a3;
}

- (BOOL)hideClippedLabels
{
  return self->_hideClippedLabels;
}

- (void)setHideClippedLabels:(BOOL)a3
{
  self->_hideClippedLabels = a3;
}

- (UIFont)subLabelFont
{
  return self->_subLabelFont;
}

- (void)setSubLabelFont:(id)a3
{
}

- (UIColor)highlightedSubLabelColor
{
  return self->_highlightedSubLabelColor;
}

- (void)setHighlightedSubLabelColor:(id)a3
{
}

- (UIColor)unhighlightedSubLabelColor
{
  return self->_unhighlightedSubLabelColor;
}

- (void)setUnhighlightedSubLabelColor:(id)a3
{
}

- (unint64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(unint64_t)a3
{
  self->_textStyle = a3;
}

- (NSDateComponents)axisSpacing
{
  return self->_axisSpacing;
}

- (FIUIChartDateAnchorRule)anchorRule
{
  return self->_anchorRule;
}

- (void)setAnchorRule:(id)a3
{
}

- (unint64_t)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(unint64_t)a3
{
  self->_unint64_t timeInterval = a3;
}

- (BOOL)forceAMPMOnFirstLabel
{
  return self->_forceAMPMOnFirstLabel;
}

- (void)setForceAMPMOnFirstLabel:(BOOL)a3
{
  self->_BOOL forceAMPMOnFirstLabel = a3;
}

- (BOOL)useMinMaxLabelPlacement
{
  return self->_useMinMaxLabelPlacement;
}

- (void)setUseMinMaxLabelPlacement:(BOOL)a3
{
  self->_useMinMaxLabelPlacement = a3;
}

- (unint64_t)subTextStyle
{
  return self->_subTextStyle;
}

- (void)setSubTextStyle:(unint64_t)a3
{
  self->_subTextStyle = a3;
}

- (NSDateComponents)subAxisSpacing
{
  return self->_subAxisSpacing;
}

- (FIUIChartDateAnchorRule)subAnchorRule
{
  return self->_subAnchorRule;
}

- (void)setSubAnchorRule:(id)a3
{
}

- (unint64_t)subTimeInterval
{
  return self->_subTimeInterval;
}

- (void)setSubTimeInterval:(unint64_t)a3
{
  self->_unint64_t subTimeInterval = a3;
}

- (BOOL)generateSubAxisDescriptorOnlyForNoonMidnight
{
  return self->_generateSubAxisDescriptorOnlyForNoonMidnight;
}

- (void)setGenerateSubAxisDescriptorOnlyForNoonMidnight:(BOOL)a3
{
  self->_generateSubAxisDescriptorOnlyForNoonMidnight = a3;
}

- (BOOL)subAxisCapitalize
{
  return self->_subAxisCapitalize;
}

- (void)setSubAxisCapitalize:(BOOL)a3
{
  self->_subAxisCapitalize = a3;
}

- (double)subAxisVerticalPadding
{
  return self->_subAxisVerticalPadding;
}

- (void)setSubAxisVerticalPadding:(double)a3
{
  self->_subAxisVerticalPadding = a3;
}

- (UIFont)labelAMPMFont
{
  return self->_labelAMPMFont;
}

- (void)setLabelAMPMFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAMPMFont, 0);
  objc_storeStrong((id *)&self->_subAnchorRule, 0);
  objc_storeStrong((id *)&self->_subAxisSpacing, 0);
  objc_storeStrong((id *)&self->_anchorRule, 0);
  objc_storeStrong((id *)&self->_axisSpacing, 0);
  objc_storeStrong((id *)&self->_unhighlightedSubLabelColor, 0);
  objc_storeStrong((id *)&self->_highlightedSubLabelColor, 0);
  objc_storeStrong((id *)&self->_subLabelFont, 0);
  objc_storeStrong((id *)&self->_selectedLabelColor, 0);
  objc_storeStrong((id *)&self->_unhighlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_highlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong(&self->_maxValue, 0);
  objc_storeStrong(&self->_minValue, 0);
  objc_storeStrong((id *)&self->_yearFormatters, 0);
  objc_storeStrong((id *)&self->_monthFormatters, 0);
  objc_storeStrong((id *)&self->_dayFormatters, 0);
  objc_storeStrong((id *)&self->_weekdayFormatters, 0);
  objc_storeStrong((id *)&self->_hourFormatters, 0);
  objc_storeStrong((id *)&self->_hourMinuteFormatters, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabelColors, 0);
  objc_storeStrong((id *)&self->_cachedAxisSubLabels, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabels, 0);
}

@end