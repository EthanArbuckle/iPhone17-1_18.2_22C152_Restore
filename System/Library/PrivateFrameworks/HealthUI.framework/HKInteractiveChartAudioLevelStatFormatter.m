@interface HKInteractiveChartAudioLevelStatFormatter
- (BOOL)showsClassificationInCurrentValueView;
- (id)_attributedCurrentAudioExposureClassificationForChartData:(id)a3;
- (id)_formatDuration:(double)a3;
- (id)_formatQuantityAudioData:(id)a3;
- (id)_formattedCurrentValueForChartData:(id)a3;
- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5;
- (id)_majorAttributes;
- (id)_minorAttributes;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)initForDisplayType:(id)a3 timeScope:(int64_t)a4;
- (int64_t)_numberOfDaysVisibleInRange:(id)a3;
- (void)setShowsClassificationInCurrentValueView:(BOOL)a3;
@end

@implementation HKInteractiveChartAudioLevelStatFormatter

- (id)initForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKInteractiveChartAudioLevelStatFormatter;
  v7 = [(HKInteractiveChartAudioLevelStatFormatter *)&v15 init];
  if (v7)
  {
    v8 = [v6 chartingRules];
    if ([v8 chartStyleForTimeScope:a4] == 3)
    {
    }
    else
    {
      v9 = [v6 chartingRules];
      uint64_t v10 = [v9 chartStyleForTimeScope:a4];

      if (v10 != 9)
      {
        v12 = [v6 objectType];
        uint64_t v13 = [v12 aggregationStyle];

        if (v13) {
          v11 = &unk_1F3C1F288;
        }
        else {
          v11 = &unk_1F3C1F270;
        }
        goto LABEL_9;
      }
    }
    v11 = &unk_1F3C1F258;
LABEL_9:
    [(HKInteractiveChartGenericStatFormatter *)v7 setOverrideStatFormatterItemOptions:v11];
  }

  return v7;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6 || ![v6 count])
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_13;
  }
  v8 = [v7 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(HKInteractiveChartAudioLevelStatFormatter *)self _formatQuantityAudioData:v7];
  }
  else
  {
    v11 = [v7 firstObject];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      if ([(HKInteractiveChartAudioLevelStatFormatter *)self showsClassificationInCurrentValueView])
      {
        if (a4 == 1)
        {
          uint64_t v10 = [(HKInteractiveChartAudioLevelStatFormatter *)self _formattedCurrentValueForChartData:v7];
          goto LABEL_12;
        }
        if (a4) {
          goto LABEL_13;
        }
      }
      uint64_t v10 = [(HKInteractiveChartGenericStatFormatter *)self _formattedAnnotationForDistributionChartData:v7];
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)HKInteractiveChartAudioLevelStatFormatter;
      uint64_t v10 = [(HKInteractiveChartGenericStatFormatter *)&v14 formattedSelectedRangeLabelDataWithChartData:v7 context:a4];
    }
  }
LABEL_12:
  v11 = (void *)v10;
LABEL_13:

  return v11;
}

- (id)_formattedCurrentValueForChartData:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HKSelectedRangeData alloc] initWithStatisticsType:4];
  id v6 = [(HKInteractiveChartAudioLevelStatFormatter *)self _attributedCurrentAudioExposureClassificationForChartData:v4];

  [(HKSelectedRangeData *)v5 setAttributedString:v6];
  [(HKSelectedRangeData *)v5 setValueAsNumber:0];
  v9[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (id)_attributedCurrentAudioExposureClassificationForChartData:(id)a3
{
  id v4 = a3;
  v5 = [HKDateCache alloc];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [(HKDateCache *)v5 initWithCalendar:v6];

  v8 = [v4 lastObject];
  v9 = [v8 endDate];

  uint64_t v10 = [(HKInteractiveChartGenericStatFormatter *)self chartRangeProvider];
  v11 = [v10 effectiveVisibleRangeActive];
  int64_t v12 = [(HKInteractiveChartAudioLevelStatFormatter *)self _numberOfDaysVisibleInRange:v11];

  uint64_t v23 = 0;
  v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__HKInteractiveChartAudioLevelStatFormatter__attributedCurrentAudioExposureClassificationForChartData___block_invoke;
  v22[3] = &unk_1E6D52830;
  v22[4] = &v23;
  uint64_t v13 = objc_msgSend(v4, "hk_map:", v22);
  objc_super v14 = [MEMORY[0x1E4F2AC28] computeLEQFromAudioExposureValues:v13];
  objc_super v15 = [HKAudioExposureDataProviderCurrentValue alloc];
  v16 = [(HKAudioExposureDataProviderCurrentValue *)v15 initWithLEQQuantity:v14 secondsListened:v12 daysAggregated:v9 date:v24[3]];
  v17 = [(HKInteractiveChartDataFormatter *)self displayType];
  v18 = [(HKInteractiveChartDataFormatter *)self unitController];
  v19 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v20 = [(HKAudioExposureDataProviderCurrentValue *)v16 attributedStringWithDisplayType:v17 unitController:v18 valueFont:v19 unitFont:0 dateCache:v7];

  _Block_object_dispose(&v23, 8);
  return v20;
}

id __103__HKInteractiveChartAudioLevelStatFormatter__attributedCurrentAudioExposureClassificationForChartData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 duration];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  id v5 = objc_alloc(MEMORY[0x1E4F2AC30]);
  [v3 averageValue];
  double v7 = v6;
  [v3 duration];
  double v9 = v8;

  uint64_t v10 = (void *)[v5 initWithValue:v7 duration:v9];
  return v10;
}

- (id)_majorAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v2 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB0700];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v7[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_minorAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v2 = [(HKInteractiveChartDataFormatter *)self minorFont];
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB0700];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  v7[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  BOOL v5 = a5;
  v33[1] = *MEMORY[0x1E4F143B8];
  double v8 = NSNumber;
  id v9 = a4;
  uint64_t v10 = [v8 numberWithDouble:a3];
  v11 = [(HKInteractiveChartDataFormatter *)self displayType];
  if (v11)
  {
    int64_t v12 = [(HKInteractiveChartDataFormatter *)self displayType];
    uint64_t v13 = [v12 presentation];
    id v14 = [v13 adjustedValueForDaemonValue:v10];
  }
  else
  {
    id v14 = v10;
  }

  objc_super v15 = [NSNumber numberWithDouble:a3];
  v16 = [(HKInteractiveChartDataFormatter *)self unitStringFromUnit:v9 number:v15];

  v17 = [(HKInteractiveChartDataFormatter *)self valueStringFromNumber:v14];
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  v19 = [(HKInteractiveChartAudioLevelStatFormatter *)self _majorAttributes];
  v20 = (void *)[v18 initWithString:v17 attributes:v19];

  if (v5 && [v16 length])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v32 = *MEMORY[0x1E4FB06F8];
    v22 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v33[0] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v24 = (void *)[v21 initWithString:@" " attributes:v23];

    id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v26 = [(HKInteractiveChartAudioLevelStatFormatter *)self _minorAttributes];
    v27 = (void *)[v25 initWithString:v16 attributes:v26];

    v31[0] = v20;
    v31[1] = v24;
    v31[2] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
    HKUIJoinAttributedStringsForLocale(v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v29 = v20;
  }

  return v29;
}

- (int64_t)_numberOfDaysVisibleInRange:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 startDate];
  if (v4
    && (BOOL v5 = (void *)v4,
        [v3 endDate],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    double v7 = [v3 startDate];
    double v8 = [v3 endDate];
    id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [v9 components:16 fromDate:v7 toDate:v8 options:0];

    if ([v10 day] < 1) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = [v10 day];
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (id)_formatQuantityAudioData:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F2B618] decibelAWeightedSoundPressureLevelUnit];
  unint64_t v6 = [v4 count];
  double v7 = [v4 firstObject];
  double v8 = v7;
  if (v6 < 2)
  {
    v22 = [v7 overviewData];
    if (v22)
    {
      uint64_t v23 = [v8 overviewData];
      [v23 averageLEQ];
      double v25 = v24;
    }
    else
    {
      [v8 averageLEQ];
      double v25 = v28;
    }

    id v29 = [v8 overviewData];
    if (v29)
    {
      v30 = [v8 overviewData];
      [v30 duration];
      double v32 = v31;
    }
    else
    {
      [v8 duration];
      double v32 = v33;
    }

    v34 = [(HKInteractiveChartGenericStatFormatter *)self overrideStatFormatterItemOptions];
    uint64_t v35 = [v34 count];

    if (v35 == 1)
    {
      v36 = [(HKInteractiveChartGenericStatFormatter *)self overrideStatFormatterItemOptions];
      v37 = [v36 firstObject];
      int64_t v38 = +[HKInteractiveChartGenericStatFormatter mapSingleItemToStatisticsType:v37];
    }
    else
    {
      int64_t v38 = 4;
    }
    uint64_t v26 = [[HKSelectedRangeData alloc] initWithStatisticsType:v38];
    v39 = [(HKInteractiveChartAudioLevelStatFormatter *)self _formattedStringWithValue:v5 unit:1 showUnit:v25];
    [(HKSelectedRangeData *)v26 setAttributedString:v39];

    v40 = [NSNumber numberWithDouble:v25];
    [(HKSelectedRangeData *)v26 setValueAsNumber:v40];

    v27 = [(HKInteractiveChartAudioLevelStatFormatter *)self _formatDuration:v32];
  }
  else
  {
    [v7 averageLEQ];
    double v10 = v9;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v44;
      double v15 = 0.0;
      double v16 = v10;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          id v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          objc_msgSend(v18, "averageLEQ", (void)v43);
          if (v16 >= v19) {
            double v16 = v19;
          }
          [v18 averageLEQ];
          if (v10 < v20) {
            double v10 = v20;
          }
          [v18 duration];
          double v15 = v15 + v21;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v13);
    }
    else
    {
      double v15 = 0.0;
      double v16 = v10;
    }

    uint64_t v26 = [(HKInteractiveChartGenericStatFormatter *)self _formatMin:v5 max:v16 unit:v10];
    v27 = [(HKInteractiveChartAudioLevelStatFormatter *)self _formatDuration:v15];
  }
  v47[0] = v26;
  v47[1] = v27;
  v41 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 2, (void)v43);

  return v41;
}

- (id)_formatDuration:(double)a3
{
  BOOL v5 = [[HKSelectedRangeData alloc] initWithStatisticsType:10];
  unint64_t v6 = [(HKInteractiveChartDataFormatter *)self majorFont];
  double v7 = [(HKInteractiveChartDataFormatter *)self minorFont];
  double v8 = [NSNumber numberWithDouble:a3];
  double v9 = HKTimePeriodStringWithFonts(v6, v7, v8, 0x14uLL);
  [(HKSelectedRangeData *)v5 setAttributedString:v9];

  double v10 = [NSNumber numberWithDouble:a3];
  [(HKSelectedRangeData *)v5 setValueAsNumber:v10];

  return v5;
}

- (BOOL)showsClassificationInCurrentValueView
{
  return self->_showsClassificationInCurrentValueView;
}

- (void)setShowsClassificationInCurrentValueView:(BOOL)a3
{
  self->_showsClassificationInCurrentValueView = a3;
}

@end