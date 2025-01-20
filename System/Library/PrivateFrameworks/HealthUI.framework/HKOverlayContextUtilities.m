@interface HKOverlayContextUtilities
+ (id)defaultMetricColorsForOverlayMode:(int64_t)a3;
+ (id)selectedMetricColorsForCategory:(int64_t)a3;
+ (id)stackedAxisConfiguration;
+ (id)stackedChartMetricColorsForSampleType:(id)a3 templateType:(id)a4;
+ (void)setStackedSeriesLegend:(id)a3 title:(id)a4;
@end

@implementation HKOverlayContextUtilities

+ (id)selectedMetricColorsForCategory:(int64_t)a3
{
  switch(a3)
  {
    case -1:
    case 7:
      v5 = [MEMORY[0x1E4FB1618] whiteColor];
      v3 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v5];

      break;
    case 1:
    case 11:
      uint64_t v4 = +[HKUIMetricColors vitalsColors];
      goto LABEL_26;
    case 2:
      uint64_t v4 = +[HKUIMetricColors activityColors];
      goto LABEL_26;
    case 4:
      uint64_t v4 = +[HKUIMetricColors nutritionColors];
      goto LABEL_26;
    case 5:
      uint64_t v4 = +[HKUIMetricColors sleepColors];
      goto LABEL_26;
    case 6:
      uint64_t v4 = +[HKUIMetricColors bodyMeasurementColors];
      goto LABEL_26;
    case 8:
      uint64_t v4 = +[HKUIMetricColors reproductiveHealthColors];
      goto LABEL_26;
    case 9:
    case 15:
      uint64_t v4 = +[HKUIMetricColors unknownCategoryClinicalColors];
      goto LABEL_26;
    case 10:
      uint64_t v4 = +[HKUIMetricColors mindfulnessColors];
      goto LABEL_26;
    case 12:
      uint64_t v4 = +[HKUIMetricColors hearingHealthColors];
      goto LABEL_26;
    case 13:
      uint64_t v4 = +[HKUIMetricColors respiratoryColors];
      goto LABEL_26;
    case 14:
      uint64_t v4 = +[HKUIMetricColors otherColors];
      goto LABEL_26;
    case 16:
      uint64_t v4 = +[HKUIMetricColors allergiesClinicalColors];
      goto LABEL_26;
    case 17:
      uint64_t v4 = +[HKUIMetricColors vitalsClinicalColors];
      goto LABEL_26;
    case 18:
      uint64_t v4 = +[HKUIMetricColors conditionsClinicalColors];
      goto LABEL_26;
    case 19:
      uint64_t v4 = +[HKUIMetricColors immunizationsClinicalColors];
      goto LABEL_26;
    case 20:
      uint64_t v4 = +[HKUIMetricColors labResultsClinicalColors];
      goto LABEL_26;
    case 21:
      uint64_t v4 = +[HKUIMetricColors medicationsClinicalColors];
      goto LABEL_26;
    case 22:
      uint64_t v4 = +[HKUIMetricColors proceduresClinicalColors];
      goto LABEL_26;
    case 23:
      uint64_t v4 = +[HKUIMetricColors mobilityColors];
      goto LABEL_26;
    case 26:
      uint64_t v4 = +[HKUIMetricColors symptomsColors];
      goto LABEL_26;
    case 27:
      uint64_t v4 = +[HKUIMetricColors insuranceClinicalColors];
      goto LABEL_26;
    case 30:
      uint64_t v4 = +[HKUIMetricColors clinicalNotesClinicalColors];
      goto LABEL_26;
    case 31:
      uint64_t v4 = +[HKUIMetricColors medicationTrackingColors];
LABEL_26:
      v3 = (void *)v4;
      break;
    default:
      break;
  }
  return v3;
}

+ (id)stackedChartMetricColorsForSampleType:(id)a3 templateType:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 code];
  if (v6 <= 74)
  {
    switch(v6)
    {
      case 3:
        uint64_t v7 = +[HKUIMetricColors bodyMeasurementColors];
        goto LABEL_18;
      case 61:
        uint64_t v7 = +[HKUIMetricColors respiratoryColors];
        goto LABEL_18;
      case 63:
        uint64_t v7 = +[HKUIMetricColors sleepColors];
        goto LABEL_18;
    }
LABEL_16:
    v8 = [v5 displayCategory];
    v9 = [v8 color];
    v10 = +[HKUIMetricColors categoryColorsWithColor:v9];

    goto LABEL_19;
  }
  if (v6 > 190)
  {
    if (v6 == 191)
    {
      uint64_t v7 = +[HKUIMetricColors pregnancyColors];
      goto LABEL_18;
    }
    if (v6 == 251)
    {
      uint64_t v7 = +[HKUIMetricColors otherColors];
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v6 == 75)
  {
    uint64_t v7 = +[HKUIMetricColors activityColors];
    goto LABEL_18;
  }
  if (v6 != 99) {
    goto LABEL_16;
  }
  uint64_t v7 = +[HKUIMetricColors mindfulnessColors];
LABEL_18:
  v10 = (void *)v7;
LABEL_19:

  return v10;
}

+ (id)defaultMetricColorsForOverlayMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    if (a3 != 3) {
      goto LABEL_6;
    }
    uint64_t v4 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  id v5 = (void *)v4;
  v3 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v4];

LABEL_6:
  return v3;
}

+ (void)setStackedSeriesLegend:(id)a3 title:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v5, "hk_defaultSecondaryTextColor");
  v9 = +[HKLegendEntry legendEntryWithTitle:v6 labelColor:v8];

  v11[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 setTitleLegendEntries:v10];
}

+ (id)stackedAxisConfiguration
{
  v2 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKNumericAxisConfiguration *)v2 setTopVerticalLabelPadding:4.0];
  [(HKNumericAxisConfiguration *)v2 setBottomVerticalLabelPadding:2.0];
  [(HKAxisConfiguration *)v2 setMinLabels:3];
  [(HKAxisConfiguration *)v2 setMaxLabels:3];
  return v2;
}

@end