@interface HKOverlayRoomViewControllerDistributionContext
- (BOOL)isEqual:(id)a3;
- (HKInteractiveChartOverlayPredicate)namedPredicate;
- (HKOverlayRoomViewControllerDistributionContext)initWithStyle:(int64_t)a3 namedPredicate:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 optionalDelegate:(id)a7 options:(int64_t)a8 mode:(int64_t)a9;
- (HKOverlayRoomViewControllerIntegratedContextDelegate)optionalDelegate;
- (NSDictionary)styleToMetricColors;
- (id)_computeTitleAndIdentifierFromStyleAndPredicate;
- (id)_representativeDisplayTypeForStyle:(int64_t)a3;
- (id)_selectedMetricColorsForDistributionStyle:(int64_t)a3;
- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7;
- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)representativeDisplayType;
- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6;
- (int64_t)distributionStyle;
- (int64_t)options;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6;
- (void)setDistributionStyle:(int64_t)a3;
- (void)setNamedPredicate:(id)a3;
- (void)setOptionalDelegate:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setStyleToMetricColors:(id)a3;
@end

@implementation HKOverlayRoomViewControllerDistributionContext

- (HKOverlayRoomViewControllerDistributionContext)initWithStyle:(int64_t)a3 namedPredicate:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 optionalDelegate:(id)a7 options:(int64_t)a8 mode:(int64_t)a9
{
  v34[8] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HKOverlayRoomViewControllerDistributionContext;
  v18 = [(HKOverlayRoomViewControllerIntegratedContext *)&v32 initWithOverlayChartController:a5 applicationItems:a6 mode:a9];
  v19 = v18;
  if (v18)
  {
    v18->_distributionStyle = a3;
    objc_storeWeak((id *)&v18->_optionalDelegate, v17);
    v19->_options = a8;
    objc_storeStrong((id *)&v19->_namedPredicate, a4);
    v33[0] = &unk_1F3C20308;
    id v31 = v16;
    v20 = +[HKUIMetricColors vitalsColors];
    v34[0] = v20;
    v33[1] = &unk_1F3C20320;
    v21 = +[HKUIMetricColors mindfulnessColors];
    v34[1] = v21;
    v33[2] = &unk_1F3C20338;
    v22 = +[HKUIMetricColors workoutContextViewColors];
    v34[2] = v22;
    v33[3] = &unk_1F3C20350;
    v23 = +[HKUIMetricColors vitalsColors];
    v34[3] = v23;
    v33[4] = &unk_1F3C20368;
    v24 = +[HKUIMetricColors vitalsColors];
    v34[4] = v24;
    v33[5] = &unk_1F3C20380;
    v25 = +[HKUIMetricColors hearingHealthColors];
    v34[5] = v25;
    v33[6] = &unk_1F3C20398;
    v26 = +[HKUIMetricColors hearingHealthColors];
    v34[6] = v26;
    v33[7] = &unk_1F3C203B0;
    v27 = +[HKUIMetricColors sleepColors];
    v34[7] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:8];
    styleToMetricColors = v19->_styleToMetricColors;
    v19->_styleToMetricColors = (NSDictionary *)v28;

    id v16 = v31;
  }

  return v19;
}

- (id)representativeDisplayType
{
  int64_t v3 = [(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle];
  return [(HKOverlayRoomViewControllerDistributionContext *)self _representativeDisplayTypeForStyle:v3];
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 firstObject];
  v14 = [v13 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)HKOverlayRoomViewControllerDistributionContext;
    v29 = [(HKOverlayRoomViewControllerIntegratedContext *)&v34 valueString:v10 applicationItems:v11 representativeDisplayType:v12 isUnitIncludedInValue:a6];
    goto LABEL_21;
  }
  id v33 = v11;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v17)
  {

    goto LABEL_19;
  }
  uint64_t v18 = v17;
  id v31 = v12;
  id v32 = v10;
  id v19 = 0;
  uint64_t v20 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v36 != v20) {
        objc_enumerationMutation(v16);
      }
      v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      v23 = [v22 userInfo];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [v22 userInfo];
        v25 = [v24 identifiers];

        if (!v25) {
          continue;
        }
        if (!v19) {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        v23 = [v22 userInfo];
        v26 = [v23 identifiers];
        [v19 addObjectsFromArray:v26];
      }
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v18);

  id v12 = v31;
  id v10 = v32;
  if (v19)
  {
    v27 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v29 = [v27 localizedStringFromNumber:v28 numberStyle:0];

    goto LABEL_20;
  }
LABEL_19:
  id v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v29 = [v19 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_20:
  id v11 = v33;

LABEL_21:
  return v29;
}

- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HKOverlayRoomViewControllerDistributionContext *)self optionalDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(HKOverlayRoomViewControllerDistributionContext *)self optionalDelegate];
    v14 = [v13 unitString:v8 applicationItems:v9 representativeDisplayType:v10];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKOverlayRoomViewControllerDistributionContext;
    v14 = [(HKOverlayRoomViewControllerIntegratedContext *)&v16 unitString:v8 applicationItems:v9 representativeDisplayType:v10];
  }

  return v14;
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = [(HKOverlayRoomViewControllerDistributionContext *)self representativeDisplayType];
  v15 = objc_alloc_init(HKDisplayTypeContextItem);
  objc_super v16 = [(HKOverlayRoomViewControllerDistributionContext *)self _computeTitleAndIdentifierFromStyleAndPredicate];
  uint64_t v17 = [v16 title];
  [(HKDisplayTypeContextItem *)v15 setTitle:v17];

  uint64_t v18 = [v16 accessibilityIdentifier];
  [(HKDisplayTypeContextItem *)v15 setAccessibilityIdentifier:v18];

  [(HKDisplayTypeContextItem *)v15 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v15 setValue:v13];

  [(HKDisplayTypeContextItem *)v15 setValueContext:v12];
  if ((objc_msgSend(v14, "contextItemShouldDisplayEventCountForDistributionStyle:", -[HKOverlayRoomViewControllerDistributionContext distributionStyle](self, "distributionStyle")) & 1) == 0)
  {
    id v19 = [v14 objectType];
    uint64_t v20 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
    v21 = [v20 healthStore];
    v22 = objc_msgSend(v19, "hk_metadataValueDisplayTypeInStore:", v21);

    if (v11)
    {
      [(HKDisplayTypeContextItem *)v15 setUnit:v11];
    }
    else
    {
      v23 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
      v24 = [v23 unitController];
      v25 = [v24 localizedDisplayNameForDisplayType:v22];
      [(HKDisplayTypeContextItem *)v15 setUnit:v25];
    }
    -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v15, "setUseTightSpacingBetweenValueAndUnit:", [v22 contextItemShouldUseTightSpacingBetweenValueAndUnit]);
    [(HKDisplayTypeContextItem *)v15 setIsUnitIncludedInValue:v7];
  }
  v26 = +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:[(HKOverlayRoomViewControllerIntegratedContext *)self overlayMode]];
  [(HKDisplayTypeContextItem *)v15 setMetricColors:v26];

  v27 = [(HKOverlayRoomViewControllerDistributionContext *)self _selectedMetricColorsForDistributionStyle:[(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle]];
  [(HKDisplayTypeContextItem *)v15 setSelectedMetricColors:v27];

  return v15;
}

- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  v5 = [(HKOverlayRoomViewControllerDistributionContext *)self optionalDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(HKOverlayRoomViewControllerDistributionContext *)self optionalDelegate];
    id v8 = [v7 formatterForTimescope:a3];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(HKOverlayRoomViewControllerDistributionContext *)self _selectedMetricColorsForDistributionStyle:[(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle]];
  id v10 = [v9 keyColor];

  id v11 = [(HKOverlayRoomViewControllerIntegratedContext *)self overlayChartController];
  int64_t v12 = [(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle];
  int64_t v13 = [(HKOverlayRoomViewControllerDistributionContext *)self options];
  v14 = [(HKOverlayRoomViewControllerDistributionContext *)self namedPredicate];
  v15 = [v11 displayTypeForQuantityDistributionStyle:v12 timeScope:a3 overlayColor:v10 options:v13 alternateFormatter:v8 namedPredicate:v14];

  return v15;
}

- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  int64_t v12 = [(HKOverlayRoomViewControllerIntegratedContext *)self overlayChartController];
  int64_t v13 = [(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle];
  v14 = [v11 startDate];
  v15 = [v11 endDate];

  objc_super v16 = [(HKOverlayRoomViewControllerDistributionContext *)self namedPredicate];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__HKOverlayRoomViewControllerDistributionContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke;
  v18[3] = &unk_1E6D51838;
  id v19 = v10;
  id v17 = v10;
  [v12 cachedDataForQuantityDistributionStyle:v13 timeScope:a3 resolution:a4 startDate:v14 endDate:v15 namedPredicate:v16 completion:v18];
}

uint64_t __113__HKOverlayRoomViewControllerDistributionContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return a3 == 5 && a4 == 1;
}

- (id)_representativeDisplayTypeForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      int64_t v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self overlayChartController];
      v4 = [v3 primaryDisplayType];
      goto LABEL_9;
    case 3:
      int64_t v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
      v5 = [v3 displayTypeController];
      char v6 = v5;
      BOOL v7 = &unk_1F3C203C8;
      goto LABEL_8;
    case 4:
      int64_t v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
      v5 = [v3 displayTypeController];
      char v6 = v5;
      BOOL v7 = &unk_1F3C203E0;
      goto LABEL_8;
    case 5:
      int64_t v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
      v5 = [v3 displayTypeController];
      char v6 = v5;
      BOOL v7 = &unk_1F3C203F8;
      goto LABEL_8;
    case 7:
      int64_t v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
      v5 = [v3 displayTypeController];
      char v6 = v5;
      BOOL v7 = &unk_1F3C20410;
LABEL_8:
      v4 = [v5 displayTypeWithIdentifier:v7];

LABEL_9:
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)_computeTitleAndIdentifierFromStyleAndPredicate
{
  switch([(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle])
  {
    case 0:
      int64_t v3 = [(HKOverlayRoomViewControllerDistributionContext *)self namedPredicate];

      if (v3)
      {
        v4 = [_HKContextTitleAndIdentifier alloc];
        v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        char v6 = [(HKOverlayRoomViewControllerDistributionContext *)self namedPredicate];
        BOOL v7 = [v6 localizedNameKey];
        id v8 = [v5 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        id v9 = NSString;
        id v10 = [(HKOverlayRoomViewControllerDistributionContext *)self namedPredicate];
        id v11 = [v10 localizedNameKey];
        int64_t v12 = objc_msgSend(v9, "hk_chartOverlayAccessibilityIdentifier:", v11);
        int64_t v13 = [(_HKContextTitleAndIdentifier *)v4 initWithTitle:v8 accessibilityIdentifier:v12];

        goto LABEL_12;
      }
      if ((self->_options & 2) == 0) {
        goto LABEL_17;
      }
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v6 = [v5 localizedStringForKey:@"OVERLAY_RANGE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = NSString;
      objc_super v16 = @"Range";
      goto LABEL_11;
    case 1:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v6 = [v5 localizedStringForKey:@"BREATHE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = NSString;
      objc_super v16 = @"Breathe";
      goto LABEL_11;
    case 2:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v6 = [v5 localizedStringForKey:@"WORKOUT_SINGULAR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = NSString;
      objc_super v16 = @"Workouts";
      goto LABEL_11;
    case 3:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = HKHealthKitFrameworkBundle();
      char v6 = [v5 localizedStringForKey:@"TACHYCARDIA" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];
      v15 = NSString;
      objc_super v16 = @"HighHeartRate";
      goto LABEL_11;
    case 4:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = HKHealthKitFrameworkBundle();
      char v6 = [v5 localizedStringForKey:@"BRADYCARDIA" value:&stru_1F3B9CF20 table:@"Localizable-Tortuga"];
      v15 = NSString;
      objc_super v16 = @"LowHeartRate";
      goto LABEL_11;
    case 5:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = HKHealthKitFrameworkBundle();
      char v6 = [v5 localizedStringForKey:@"AUDIO_EXPOSURE_EVENT" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];
      v15 = NSString;
      objc_super v16 = @"NoiseNotification";
      goto LABEL_11;
    case 6:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v6 = [v5 localizedStringForKey:@"SLEEP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = NSString;
      objc_super v16 = @"Sleep";
      goto LABEL_11;
    case 7:
      v14 = [_HKContextTitleAndIdentifier alloc];
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v6 = [v5 localizedStringForKey:@"AUDIO_OVERLAY_HEADPHONES_NOTIFICATIONS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = NSString;
      objc_super v16 = @"HeadphoneNotification";
LABEL_11:
      BOOL v7 = objc_msgSend(v15, "hk_chartOverlayAccessibilityIdentifier:", v16);
      int64_t v13 = [(_HKContextTitleAndIdentifier *)v14 initWithTitle:v6 accessibilityIdentifier:v7];
LABEL_12:

      break;
    default:
LABEL_17:
      int64_t v13 = 0;
      break;
  }
  return v13;
}

- (id)_selectedMetricColorsForDistributionStyle:(int64_t)a3
{
  if (a3)
  {
    v4 = [(HKOverlayRoomViewControllerDistributionContext *)self styleToMetricColors];
    v5 = [NSNumber numberWithInteger:a3];
    char v6 = [v4 objectForKeyedSubscript:v5];
  }
  else
  {
    v4 = [(HKOverlayRoomViewControllerDistributionContext *)self representativeDisplayType];
    char v6 = +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", [v4 categoryIdentifier]);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKOverlayRoomViewControllerDistributionContext *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(HKOverlayRoomViewControllerDistributionContext *)self distributionStyle];
      if (v6 == [(HKOverlayRoomViewControllerDistributionContext *)v5 distributionStyle]
        && (int64_t v7 = [(HKOverlayRoomViewControllerDistributionContext *)self options],
            v7 == [(HKOverlayRoomViewControllerDistributionContext *)v5 options]))
      {
        id v8 = [(HKOverlayRoomViewControllerDistributionContext *)self optionalDelegate];
        id v9 = [v8 cacheDataSource];
        id v10 = [v9 name];
        id v11 = [(HKOverlayRoomViewControllerDistributionContext *)v5 optionalDelegate];
        int64_t v12 = [v11 cacheDataSource];
        int64_t v13 = [v12 name];
        BOOL v14 = v10 == v13;
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (int64_t)distributionStyle
{
  return self->_distributionStyle;
}

- (void)setDistributionStyle:(int64_t)a3
{
  self->_distributionStyle = a3;
}

- (HKOverlayRoomViewControllerIntegratedContextDelegate)optionalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionalDelegate);
  return (HKOverlayRoomViewControllerIntegratedContextDelegate *)WeakRetained;
}

- (void)setOptionalDelegate:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (HKInteractiveChartOverlayPredicate)namedPredicate
{
  return self->_namedPredicate;
}

- (void)setNamedPredicate:(id)a3
{
}

- (NSDictionary)styleToMetricColors
{
  return self->_styleToMetricColors;
}

- (void)setStyleToMetricColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleToMetricColors, 0);
  objc_storeStrong((id *)&self->_namedPredicate, 0);
  objc_destroyWeak((id *)&self->_optionalDelegate);
}

@end