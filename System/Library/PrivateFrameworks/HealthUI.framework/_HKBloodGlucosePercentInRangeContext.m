@interface _HKBloodGlucosePercentInRangeContext
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKDisplayTypeController)displayTypeController;
- (HKInteractiveChartDisplayType)baseDisplayType;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKUnitPreferenceController)unitController;
- (NSNumberFormatter)percentageFormatter;
- (_HKBloodGlucosePercentInRangeContext)initWithBaseDisplayType:(id)a3 classification:(int64_t)a4 overlayChartController:(id)a5 unitController:(id)a6 displayTypeController:(id)a7;
- (double)_fractionForClassificationFromUserInfo:(id)a3;
- (id)_buildAccessibilityIdentifier;
- (id)_buildTitleString;
- (id)_fractionRangeFromChartPoints:(id)a3;
- (id)_stringFromFractionRange:(id)a3;
- (id)_stringFromFractionRangeBound:(id)a3;
- (id)baseDisplayTypeForOverlay:(int64_t)a3;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)classification;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)_updateContextItemFromChartPoints:(id)a3;
- (void)setLastUpdatedItem:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKBloodGlucosePercentInRangeContext

- (_HKBloodGlucosePercentInRangeContext)initWithBaseDisplayType:(id)a3 classification:(int64_t)a4 overlayChartController:(id)a5 unitController:(id)a6 displayTypeController:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_HKBloodGlucosePercentInRangeContext;
  v17 = [(_HKBloodGlucosePercentInRangeContext *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseDisplayType, a3);
    v18->_classification = a4;
    objc_storeStrong((id *)&v18->_overlayChartController, a5);
    objc_storeStrong((id *)&v18->_unitController, a6);
    objc_storeStrong((id *)&v18->_displayTypeController, a7);
    lastUpdatedItem = v18->_lastUpdatedItem;
    v18->_lastUpdatedItem = 0;

    v20 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_percentDecimalNumberFormatter");
    uint64_t v21 = [v20 copy];
    percentageFormatter = v18->_percentageFormatter;
    v18->_percentageFormatter = (NSNumberFormatter *)v21;

    [(_HKBloodGlucosePercentInRangeContext *)v18 _updateContextItemFromChartPoints:MEMORY[0x1E4F1CBF0]];
  }

  return v18;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  return self->_baseDisplayType;
}

- (id)contextItemForLastUpdate
{
  return self->_lastUpdatedItem;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)sampleTypeForDateRangeUpdates
{
  return (id)[MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A610]];
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v11 = a7;
  overlayChartController = self->_overlayChartController;
  baseDisplayType = self->_baseDisplayType;
  id v14 = a3;
  id v15 = [(HKInteractiveChartDisplayType *)baseDisplayType graphSeriesForTimeScope:a5];
  id v16 = [v14 startDate];
  v17 = [v14 endDate];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __123___HKBloodGlucosePercentInRangeContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v19[3] = &unk_1E6D51BB8;
  v19[4] = self;
  id v20 = v11;
  id v18 = v11;
  [(HKInteractiveChartOverlayViewController *)overlayChartController cachedDataForCustomGraphSeries:v15 timeScope:a5 resolution:a6 startDate:v16 endDate:v17 completion:v19];
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)_updateContextItemFromChartPoints:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HKDisplayTypeContextItem);
  v6 = [(_HKBloodGlucosePercentInRangeContext *)self _buildTitleString];
  [(HKDisplayTypeContextItem *)v5 setTitle:v6];

  v7 = [(_HKBloodGlucosePercentInRangeContext *)self _buildAccessibilityIdentifier];
  [(HKDisplayTypeContextItem *)v5 setAccessibilityIdentifier:v7];

  id v21 = [(_HKBloodGlucosePercentInRangeContext *)self _fractionRangeFromChartPoints:v4];

  if (v21)
  {
    v8 = [(_HKBloodGlucosePercentInRangeContext *)self _stringFromFractionRange:v21];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v9 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  unitController = self->_unitController;
  id v11 = [MEMORY[0x1E4F2B618] percentUnit];
  v12 = [(HKUnitPreferenceController *)unitController localizedDisplayNameForUnit:v11 value:0];

  id v13 = NSString;
  id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v15 = [v14 localizedStringForKey:@"PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v15, v8, v12);
  [(HKDisplayTypeContextItem *)v5 setValue:v16];

  [(HKDisplayTypeContextItem *)v5 setUnit:v12];
  [(HKDisplayTypeContextItem *)v5 setIsUnitIncludedInValue:1];
  [(HKDisplayTypeContextItem *)v5 setUseTightSpacingBetweenValueAndUnit:1];
  v17 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  id v18 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v17];
  [(HKDisplayTypeContextItem *)v5 setMetricColors:v18];

  v19 = +[HKUIMetricColors vitalsColors];
  [(HKDisplayTypeContextItem *)v5 setSelectedMetricColors:v19];

  lastUpdatedItem = self->_lastUpdatedItem;
  self->_lastUpdatedItem = v5;
}

- (id)_buildTitleString
{
  v3 = [(HKDisplayTypeController *)self->_displayTypeController displayTypeWithIdentifier:&unk_1F3C204B8];
  id v4 = [(HKUnitPreferenceController *)self->_unitController unitForDisplayType:v3];
  v5 = [(HKUnitPreferenceController *)self->_unitController localizedDisplayNameForDisplayType:v3];
  switch(self->_classification)
  {
    case 0:
      v6 = [MEMORY[0x1E4F2B380] ATTDLevel2HypoglycemicRangeWithUnit:v4];
      v7 = [v6 maximum];
      goto LABEL_5;
    case 1:
      v6 = [MEMORY[0x1E4F2B380] ATTDEuglycemicRangeWithUnit:v4];
      v7 = [v6 minimum];
LABEL_5:
      v9 = v7;
      [v7 doubleValueForUnit:v4];
      double v11 = v10;

      v12 = [NSNumber numberWithDouble:v11];
      id v13 = HKFormattedStringFromValue(v12, v3, self->_unitController, 0, 0);

      id v14 = NSString;
      id v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v16 = v15;
      v17 = @"GLUCOSE_OVERLAY_PERCENT_BELOW_RANGE";
      goto LABEL_8;
    case 2:
      id v18 = NSString;
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v13 = [v6 localizedStringForKey:@"GLUCOSE_OVERLAY_PERCENT_IN_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v8 = [v18 stringWithFormat:v13];
      goto LABEL_9;
    case 3:
      v6 = [MEMORY[0x1E4F2B380] ATTDEuglycemicRangeWithUnit:v4];
      v19 = [v6 maximum];
      [v19 doubleValueForUnit:v4];
      double v21 = v20;

      v22 = [NSNumber numberWithDouble:v21];
      id v13 = HKFormattedStringFromValue(v22, v3, self->_unitController, 0, 0);

      id v14 = NSString;
      id v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v16 = v15;
      v17 = @"GLUCOSE_OVERLAY_PERCENT_ABOVE_RANGE";
LABEL_8:
      v23 = [v15 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      objc_super v24 = HKFormatValueAndUnit(v13, v5);
      v8 = objc_msgSend(v14, "stringWithFormat:", v23, v24);

LABEL_9:
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_buildAccessibilityIdentifier
{
  unint64_t classification = self->_classification;
  if (classification > 3) {
    v3 = @"UnknownBloodGlucoseLevel";
  }
  else {
    v3 = off_1E6D51C20[classification];
  }
  return (id)objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", v3);
}

- (id)_stringFromFractionRange:(id)a3
{
  id v4 = a3;
  v5 = [v4 minValue];
  v6 = [(_HKBloodGlucosePercentInRangeContext *)self _stringFromFractionRangeBound:v5];

  v7 = [v4 maxValue];

  v8 = [(_HKBloodGlucosePercentInRangeContext *)self _stringFromFractionRangeBound:v7];

  if ([v6 isEqualToString:v8])
  {
    id v9 = v6;
  }
  else
  {
    double v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    double v11 = [v10 localizedStringForKey:@"OVERLAY_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    objc_msgSend(NSString, "stringWithFormat:", v11, v6, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_stringFromFractionRangeBound:(id)a3
{
  id v4 = a3;
  [v4 doubleValue];
  BOOL v7 = 0;
  if (v5 > 0.0)
  {
    [v4 doubleValue];
    if (v6 < 0.01) {
      BOOL v7 = 1;
    }
  }
  [(NSNumberFormatter *)self->_percentageFormatter setMaximumFractionDigits:v7];
  v8 = [(NSNumberFormatter *)self->_percentageFormatter stringFromNumber:v4];

  return v8;
}

- (id)_fractionRangeFromChartPoints:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    v17 = 0;
    goto LABEL_21;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v6)
  {
    v17 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v21;
  double v9 = 2.22507386e-308;
  double v10 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      id v13 = objc_msgSend(v12, "userInfo", (void)v20);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v15 = [v12 userInfo];
        [(_HKBloodGlucosePercentInRangeContext *)self _fractionForClassificationFromUserInfo:v15];
        if (v16 < v10) {
          double v10 = v16;
        }
        if (v16 > v9) {
          double v9 = v16;
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v7);

  v17 = 0;
  if (v10 != 1.79769313e308 && v9 != 2.22507386e-308)
  {
    id v5 = [NSNumber numberWithDouble:v10];
    id v18 = [NSNumber numberWithDouble:v9];
    v17 = +[HKValueRange valueRangeWithMinValue:v5 maxValue:v18];

LABEL_20:
  }
LABEL_21:

  return v17;
}

- (double)_fractionForClassificationFromUserInfo:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  int64_t classification = self->_classification;
  if ((unint64_t)(classification - 2) < 2 || classification == 0)
  {
    objc_msgSend(v5, "fractionForClassification:");
    double v3 = v9;
  }
  else if (classification == 1)
  {
    objc_msgSend(v5, "fractionForClassification:");
    double v11 = v10;
    [v6 fractionForClassification:0];
    double v3 = v11 + v12;
  }

  return v3;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (HKInteractiveChartDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (int64_t)classification
{
  return self->_classification;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
}

@end