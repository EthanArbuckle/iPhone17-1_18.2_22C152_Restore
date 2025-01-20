@interface HKSelectedRangeFormatter
- (HKInteractiveChartRangeProvider)chartRangeProvider;
- (HKSelectedRangeFormatter)initWithUnitPreferenceController:(id)a3;
- (HKUnitPreferenceController)unitPreferenceController;
- (UIFont)majorFont;
- (UIFont)minorFont;
- (id)_formatterForDisplayType:(id)a3 timeScope:(int64_t)a4 majorFont:(id)a5 minorFont:(id)a6;
- (id)_handwashingStatFormatterItemOptionsForTimePeriodTimeScope:(int64_t)a3;
- (id)_statFormatterItemOptionsForTimePeriodDisplayType:(id)a3 timeScope:(int64_t)a4 context:(int64_t)a5;
- (id)selectedRangeDataWithChartData:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8;
- (id)selectedRangeDataWithCoordinateInfo:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8;
- (id)selectedRangeDataWithCoordinates:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8;
- (id)selectedRangeDataWithGraphView:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8;
- (void)setChartRangeProvider:(id)a3;
- (void)setMajorFont:(id)a3;
- (void)setMinorFont:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
@end

@implementation HKSelectedRangeFormatter

- (HKSelectedRangeFormatter)initWithUnitPreferenceController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSelectedRangeFormatter;
  v5 = [(HKSelectedRangeFormatter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(HKSelectedRangeFormatter *)v5 setChartRangeProvider:0];
    [(HKSelectedRangeFormatter *)v6 setUnitPreferenceController:v4];
    v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    [(HKSelectedRangeFormatter *)v6 setMajorFont:v7];

    v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D0]];
    [(HKSelectedRangeFormatter *)v6 setMinorFont:v8];
  }
  return v6;
}

- (id)selectedRangeDataWithCoordinates:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [v14 array];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __111__HKSelectedRangeFormatter_selectedRangeDataWithCoordinates_majorFont_minorFont_displayType_timeScope_context___block_invoke;
  v23[3] = &unk_1E6D55128;
  id v24 = v19;
  id v20 = v19;
  [v18 enumerateObjectsUsingBlock:v23];

  v21 = [(HKSelectedRangeFormatter *)self selectedRangeDataWithCoordinateInfo:v20 majorFont:v17 minorFont:v16 displayType:v15 timeScope:a7 context:a8];

  return v21;
}

void __111__HKSelectedRangeFormatter_selectedRangeDataWithCoordinates_majorFont_minorFont_displayType_timeScope_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 userInfo];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v6 userInfo];
    [v4 addObject:v5];
  }
}

- (id)selectedRangeDataWithGraphView:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v19 = [v14 primarySeries];
  if (v19)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __109__HKSelectedRangeFormatter_selectedRangeDataWithGraphView_majorFont_minorFont_displayType_timeScope_context___block_invoke;
    v22[3] = &unk_1E6D55150;
    id v23 = v18;
    [v14 enumerateVisibleCoordinatesForSeries:v19 block:v22];
  }
  id v20 = [(HKSelectedRangeFormatter *)self selectedRangeDataWithCoordinateInfo:v18 majorFont:v15 minorFont:v16 displayType:v17 timeScope:a7 context:a8];

  return v20;
}

void __109__HKSelectedRangeFormatter_selectedRangeDataWithGraphView_majorFont_minorFont_displayType_timeScope_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 userInfo];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v6 userInfo];
    [v4 addObject:v5];
  }
}

- (id)selectedRangeDataWithCoordinateInfo:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  id v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [v14 array];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __114__HKSelectedRangeFormatter_selectedRangeDataWithCoordinateInfo_majorFont_minorFont_displayType_timeScope_context___block_invoke;
  v23[3] = &unk_1E6D55178;
  id v24 = v19;
  id v20 = v19;
  [v18 enumerateObjectsUsingBlock:v23];

  v21 = [(HKSelectedRangeFormatter *)self selectedRangeDataWithChartData:v20 majorFont:v17 minorFont:v16 displayType:v15 timeScope:a7 context:a8];

  return v21;
}

void __114__HKSelectedRangeFormatter_selectedRangeDataWithCoordinateInfo_majorFont_minorFont_displayType_timeScope_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F3C3E850]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)selectedRangeDataWithChartData:(id)a3 majorFont:(id)a4 minorFont:(id)a5 displayType:(id)a6 timeScope:(int64_t)a7 context:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (![v14 count])
  {
    v25 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  id v18 = [(HKSelectedRangeFormatter *)self _formatterForDisplayType:v17 timeScope:a7 majorFont:v15 minorFont:v16];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v17 objectType],
        v19 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v19,
        (isKindOfClass & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
      v25 = [v18 formattedSelectedRangeLabelDataWithChartData:v14 context:a8];
      goto LABEL_18;
    }
    id v26 = v18;
    v27 = [v26 displayType];
    uint64_t v34 = [(HKSelectedRangeFormatter *)self _statFormatterItemOptionsForTimePeriodDisplayType:v27 timeScope:a7 context:a8];

    uint64_t v28 = [v17 displayTypeIdentifier];
    if (a7 != 6 || v28 != 79) {
      goto LABEL_15;
    }
    if (a8 == 1)
    {
      v32 = [(HKSelectedRangeFormatter *)self chartRangeProvider];
      v29 = (void *)v34;
      v25 = [v26 formattedBoundedSelectedRangeLabelDataWithChartData:v14 items:v34 customDataType:6 chartRangeProvider:v32];

      goto LABEL_17;
    }
    if (!a8)
    {
      v29 = (void *)v34;
      uint64_t v30 = [v26 formattedSelectedRangeLabelDataWithChartData:v14 items:v34 customDataType:6];
    }
    else
    {
LABEL_15:
      v29 = (void *)v34;
      uint64_t v30 = [v26 formattedSelectedRangeLabelDataWithChartData:v14 items:v34];
    }
    v25 = (void *)v30;
LABEL_17:

    goto LABEL_18;
  }
  id v21 = v18;
  [v17 objectType];
  v22 = id v33 = v15;
  id v23 = [v21 displayType];
  id v24 = [(HKSelectedRangeFormatter *)self chartRangeProvider];
  [v21 configureFormatterForDisplayType:v23 quantityType:v22 chartRangeProvider:v24 timeScope:a7 context:a8];

  v25 = [v21 formattedSelectedRangeLabelDataWithChartData:v14 context:a8];

  id v15 = v33;
LABEL_18:

LABEL_19:
  return v25;
}

- (id)_formatterForDisplayType:(id)a3 timeScope:(int64_t)a4 majorFont:(id)a5 minorFont:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_msgSend(v10, "hk_interactiveChartsFormatterForTimeScope:", a4);
  [v13 setMajorFont:v11];
  [v13 setMinorFont:v12];
  id v14 = v10;
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    while (1)
    {
      id v16 = v15;
      id v15 = [v16 baseDisplayType];

      if (!v15) {
        break;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
    }
    id v15 = v16;
  }
LABEL_7:
  [v13 setDisplayType:v15];
  id v17 = [(HKSelectedRangeFormatter *)self unitPreferenceController];
  [v13 setUnitController:v17];

  return v13;
}

- (id)_statFormatterItemOptionsForTimePeriodDisplayType:(id)a3 timeScope:(int64_t)a4 context:(int64_t)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = v9;
  if (a5 != 1)
  {
    if (a5) {
      goto LABEL_18;
    }
    if ([v9 displayTypeIdentifier] != 237)
    {
      unint64_t v11 = a4 & 0xFFFFFFFFFFFFFFFELL;
      id v12 = &unk_1F3C1F558;
      v13 = &unk_1F3C1F540;
      goto LABEL_15;
    }
LABEL_9:
    v5 = [(HKSelectedRangeFormatter *)self _handwashingStatFormatterItemOptionsForTimePeriodTimeScope:a4];
    goto LABEL_18;
  }
  uint64_t v14 = [v9 displayTypeIdentifier];
  v5 = &unk_1F3C1F600;
  if (v14 > 98)
  {
    if (v14 == 99)
    {
      if ((unint64_t)a4 > 6) {
        uint64_t v16 = 8;
      }
      else {
        uint64_t v16 = qword_1E0F05CC8[a4];
      }
      id v17 = [NSNumber numberWithUnsignedInteger:v16];
      v18[0] = v17;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

      goto LABEL_18;
    }
    if (v14 != 189)
    {
      if (v14 != 237) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v11 = a4 & 0xFFFFFFFFFFFFFFFELL;
    id v12 = &unk_1F3C1F5E8;
    v13 = &unk_1F3C1F5D0;
LABEL_15:
    if (v11 == 2) {
      v5 = v13;
    }
    else {
      v5 = v12;
    }
    goto LABEL_18;
  }
  if (v14 == 70) {
    goto LABEL_14;
  }
  if (v14 == 79)
  {
    if ((unint64_t)(a4 - 2) >= 5) {
      v5 = &unk_1F3C1F5B8;
    }
    else {
      v5 = (void *)qword_1E6D55198[a4 - 2];
    }
  }
LABEL_18:

  return v5;
}

- (id)_handwashingStatFormatterItemOptionsForTimePeriodTimeScope:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return &unk_1F3C1F618;
  }
  else {
    return &unk_1F3C1F630;
  }
}

- (HKInteractiveChartRangeProvider)chartRangeProvider
{
  return self->_chartRangeProvider;
}

- (void)setChartRangeProvider:(id)a3
{
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_chartRangeProvider, 0);
}

@end