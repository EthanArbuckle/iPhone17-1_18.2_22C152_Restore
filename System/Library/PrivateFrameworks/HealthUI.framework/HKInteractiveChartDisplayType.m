@interface HKInteractiveChartDisplayType
- (HKDisplayType)baseDisplayType;
- (HKGraphSeries)mainGraphSeries;
- (HKInteractiveChartDataFormatter)specifiedValueFormatter;
- (HKInteractiveChartDisplayType)initWithBaseDisplayType:(id)a3 valueFormatter:(id)a4 dataTypeCode:(int64_t)a5 seriesForTimeScopeMapping:(id)a6;
- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 baseDisplayType:(id)a4 dataTypeCode:(int64_t)a5;
- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 baseDisplayType:(id)a4 valueFormatter:(id)a5 dataTypeCode:(int64_t)a6;
- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 displayName:(id)a4 unitName:(id)a5 valueFormatter:(id)a6 dataTypeCode:(int64_t)a7;
- (NSDictionary)seriesForTimeScopeMapping;
- (NSString)specifiedDisplayName;
- (NSString)specifiedUnitName;
- (UIColor)color;
- (id)_initWithDisplayName:(id)a3 unitDisplayNameOverrides:(id)a4 localizationTableOverride:(id)a5 chartingRules:(id)a6 unitName:(id)a7 valueFormatter:(id)a8 dataTypeCode:(int64_t)a9 baseDisplayType:(id)a10 mainGraphSeries:(id)a11 seriesForTimeScopeMapping:(id)a12;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayName;
- (id)graphSeriesForTimeScope:(int64_t)a3;
- (id)hk_interactiveChartsFormatterForTimeScope:(int64_t)a3;
- (id)unitNameForValue:(id)a3 unitPreferenceController:(id)a4;
- (int64_t)_internalDisplayTypeIdentifier;
- (void)setColor:(id)a3;
- (void)setSeriesForTimeScopeMapping:(id)a3;
@end

@implementation HKInteractiveChartDisplayType

- (id)_initWithDisplayName:(id)a3 unitDisplayNameOverrides:(id)a4 localizationTableOverride:(id)a5 chartingRules:(id)a6 unitName:(id)a7 valueFormatter:(id)a8 dataTypeCode:(int64_t)a9 baseDisplayType:(id)a10 mainGraphSeries:(id)a11 seriesForTimeScopeMapping:(id)a12
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v17 = a4;
  id v18 = a5;
  v19 = (HKDisplayTypeChartingRules *)a6;
  id v57 = a7;
  id v66 = a7;
  id v65 = a8;
  id v20 = a10;
  id v63 = a11;
  id v62 = a12;
  if (!v19) {
    v19 = [[HKDisplayTypeChartingRules alloc] initWithDefaultChartStyle:1];
  }
  v67 = v19;
  v21 = [HKDisplayTypeBehavior alloc];
  v22 = [v20 behavior];
  BYTE2(v53) = 0;
  LOWORD(v53) = 256;
  v69 = -[HKDisplayTypeBehavior initWithStatisticsMergeStrategy:preferredCalendaryDayAlignment:allowsSourceReordering:unitPreferenceChangeConfirmation:chartsRelativeData:appearsInDataTypeSearch:supportsAssociatedSamples:canBecomeFavorite:hidden:](v21, "initWithStatisticsMergeStrategy:preferredCalendaryDayAlignment:allowsSourceReordering:unitPreferenceChangeConfirmation:chartsRelativeData:appearsInDataTypeSearch:supportsAssociatedSamples:canBecomeFavorite:hidden:", 0, 0, 1, 0, [v22 chartsRelativeData], 1, v53);

  v23 = [[HKDisplayTypePresentationConfiguration alloc] initWithCurrentValue:0 secondaryValue:0 detailChart:0 singleDailyValue:0];
  v24 = [HKDisplayTypePresentation alloc];
  v25 = v24;
  v64 = v20;
  v61 = v23;
  if (v20)
  {
    v26 = [v20 presentation];
    [v26 scaleFactor];
    LOBYTE(v54) = 0;
    v27 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v28 = -[HKDisplayTypePresentation initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:](v25, "initWithDefaultConfiguration:configurationOverrides:scaleFactor:showAllDataHierarchically:showAppDataHierarchically:shouldDisplayUnitStringOnYAxis:useSecondsWhenDisplayingDuration:isCriticalForAutoscale:detailImageName:listIconImageNameOverride:summaryAttribution:", v23, MEMORY[0x1E4F1CC08], 0, 0, 0, 0, v54, 0, 0, 0);

    v29 = [HKDisplayTypeLocalization alloc];
    v30 = [v20 localization];
    v31 = [v30 displayNameKey];
    if (v17) {
      id v32 = v17;
    }
    else {
      id v32 = v27;
    }
    v33 = [(HKDisplayTypeLocalization *)v29 initWithDisplayNameKey:v31 labelDisplayNameKey:0 localizationTableNameOverride:v18 localizedKeySuffix:0 unitNameKeyOverrides:v32];

    v34 = v67;
    v35 = v68;
  }
  else
  {
    LOBYTE(v54) = 0;
    v36 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v28 = [(HKDisplayTypePresentation *)v24 initWithDefaultConfiguration:v23 configurationOverrides:MEMORY[0x1E4F1CC08] scaleFactor:0 showAllDataHierarchically:0 showAppDataHierarchically:0 shouldDisplayUnitStringOnYAxis:0 useSecondsWhenDisplayingDuration:1.0 isCriticalForAutoscale:v54 detailImageName:0 listIconImageNameOverride:0 summaryAttribution:0];
    v37 = [HKDisplayTypeLocalization alloc];
    if (v17) {
      id v38 = v17;
    }
    else {
      id v38 = v36;
    }
    v35 = v68;
    v33 = [(HKDisplayTypeLocalization *)v37 initWithDisplayNameKey:v68 labelDisplayNameKey:0 localizationTableNameOverride:v18 localizedKeySuffix:0 unitNameKeyOverrides:v38];
    v34 = v67;
  }
  int64_t v39 = [(HKInteractiveChartDisplayType *)self _internalDisplayTypeIdentifier];
  v40 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:a9];
  v74.receiver = self;
  v74.super_class = (Class)HKInteractiveChartDisplayType;
  v60 = (void *)v28;
  v41 = [(HKDisplayType *)&v74 initWithDisplayTypeIdentifier:v39 categoryIdentifier:0 secondaryCategoryIdentifiers:MEMORY[0x1E4F1CBF0] objectType:v40 behavior:v69 presentation:v28 localization:v33 chartingRules:v34 defaultChartingPredicate:0 chartingPredicatesByTimeScope:0];

  if (v41)
  {
    id v55 = v18;
    id v58 = v17;
    objc_storeStrong((id *)&v41->_specifiedDisplayName, a3);
    objc_storeStrong((id *)&v41->_specifiedUnitName, v57);
    objc_storeStrong((id *)&v41->_specifiedValueFormatter, a8);
    objc_storeStrong((id *)&v41->_baseDisplayType, a10);
    objc_storeStrong((id *)&v41->_mainGraphSeries, a11);
    objc_storeStrong((id *)&v41->_seriesForTimeScopeMapping, a12);
    v42 = [(HKDisplayType *)v41 presentation];
    -[HKGraphSeries setIsCriticalForAutoscale:](v41->_mainGraphSeries, "setIsCriticalForAutoscale:", [v42 isCriticalForAutoscale]);

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v43 = v41->_seriesForTimeScopeMapping;
    uint64_t v44 = [(NSDictionary *)v43 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v71 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          v49 = [(HKDisplayType *)v41 presentation];
          uint64_t v50 = [v49 isCriticalForAutoscale];
          v51 = [(NSDictionary *)v41->_seriesForTimeScopeMapping objectForKeyedSubscript:v48];
          [v51 setIsCriticalForAutoscale:v50];
        }
        uint64_t v45 = [(NSDictionary *)v43 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v45);
    }

    v34 = v67;
    v35 = v68;
    id v17 = v58;
    id v18 = v55;
  }

  return v41;
}

- (int64_t)_internalDisplayTypeIdentifier
{
  os_unfair_lock_lock((os_unfair_lock_t)&_internalDisplayTypeIdentifier__identifierLock);
  if (_internalDisplayTypeIdentifier__currentIdentifier) {
    int64_t v2 = _internalDisplayTypeIdentifier__currentIdentifier;
  }
  else {
    int64_t v2 = HKDisplayTypeIdentifierEnding;
  }
  _internalDisplayTypeIdentifier__currentIdentifier = v2 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&_internalDisplayTypeIdentifier__identifierLock);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesForTimeScopeMapping, 0);
  objc_storeStrong((id *)&self->_specifiedValueFormatter, 0);
  objc_storeStrong((id *)&self->_specifiedUnitName, 0);
  objc_storeStrong((id *)&self->_specifiedDisplayName, 0);
  objc_storeStrong((id *)&self->_mainGraphSeries, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 displayName:(id)a4 unitName:(id)a5 valueFormatter:(id)a6 dataTypeCode:(int64_t)a7
{
  return (HKInteractiveChartDisplayType *)[(HKInteractiveChartDisplayType *)self _initWithDisplayName:a4 unitDisplayNameOverrides:0 localizationTableOverride:0 chartingRules:0 unitName:a5 valueFormatter:a6 dataTypeCode:a7 baseDisplayType:0 mainGraphSeries:a3 seriesForTimeScopeMapping:0];
}

- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 baseDisplayType:(id)a4 dataTypeCode:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 localization];
  v10 = [v9 displayName];
  v11 = [v7 localization];
  v12 = [v11 unitNameKeyOverrides];
  v13 = [v7 localization];
  v14 = [v13 localizationTableNameOverride];
  v15 = [v7 chartingRules];
  v16 = [(HKInteractiveChartDisplayType *)self _initWithDisplayName:v10 unitDisplayNameOverrides:v12 localizationTableOverride:v14 chartingRules:v15 unitName:&stru_1F3B9CF20 valueFormatter:0 dataTypeCode:a5 baseDisplayType:v7 mainGraphSeries:v8 seriesForTimeScopeMapping:0];

  return v16;
}

- (HKInteractiveChartDisplayType)initWithGraphSeries:(id)a3 baseDisplayType:(id)a4 valueFormatter:(id)a5 dataTypeCode:(int64_t)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v21 = [v9 localization];
  v11 = [v21 displayName];
  v12 = [v9 localization];
  v13 = [v12 unitNameKeyOverrides];
  v14 = [v9 localization];
  v15 = [v14 localizationTableNameOverride];
  v16 = [v9 chartingRules];
  id v17 = [(HKInteractiveChartDisplayType *)self _initWithDisplayName:v11 unitDisplayNameOverrides:v13 localizationTableOverride:v15 chartingRules:v16 unitName:&stru_1F3B9CF20 valueFormatter:v8 dataTypeCode:a6 baseDisplayType:v9 mainGraphSeries:v10 seriesForTimeScopeMapping:0];

  return v17;
}

- (HKInteractiveChartDisplayType)initWithBaseDisplayType:(id)a3 valueFormatter:(id)a4 dataTypeCode:(int64_t)a5 seriesForTimeScopeMapping:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  v21 = [v10 localization];
  v11 = [v21 displayName];
  v12 = [v10 localization];
  v13 = [v12 unitNameKeyOverrides];
  v14 = [v10 localization];
  v15 = [v14 localizationTableNameOverride];
  v16 = [v10 chartingRules];
  id v17 = [(HKInteractiveChartDisplayType *)self _initWithDisplayName:v11 unitDisplayNameOverrides:v13 localizationTableOverride:v15 chartingRules:v16 unitName:&stru_1F3B9CF20 valueFormatter:v9 dataTypeCode:a5 baseDisplayType:v10 mainGraphSeries:0 seriesForTimeScopeMapping:v8];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HKInteractiveChartDisplayType;
  id v4 = [(HKDisplayType *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_specifiedDisplayName copy];
  v6 = (void *)*((void *)v4 + 18);
  *((void *)v4 + 18) = v5;

  uint64_t v7 = [(NSString *)self->_specifiedUnitName copy];
  id v8 = (void *)*((void *)v4 + 19);
  *((void *)v4 + 19) = v7;

  uint64_t v9 = [(NSDictionary *)self->_seriesForTimeScopeMapping copy];
  id v10 = (void *)*((void *)v4 + 21);
  *((void *)v4 + 21) = v9;

  objc_storeStrong((id *)v4 + 20, self->_specifiedValueFormatter);
  objc_storeStrong((id *)v4 + 17, self->_mainGraphSeries);
  objc_storeStrong((id *)v4 + 16, self->_baseDisplayType);
  objc_storeStrong((id *)v4 + 15, self->_color);
  return v4;
}

- (id)graphSeriesForTimeScope:(int64_t)a3
{
  uint64_t v5 = [(HKInteractiveChartDisplayType *)self mainGraphSeries];

  if (v5)
  {
    v6 = [(HKInteractiveChartDisplayType *)self mainGraphSeries];
  }
  else
  {
    uint64_t v7 = [(HKInteractiveChartDisplayType *)self seriesForTimeScopeMapping];
    id v8 = [NSNumber numberWithInteger:a3];
    v6 = [v7 objectForKey:v8];
  }
  return v6;
}

- (id)displayName
{
  return self->_specifiedDisplayName;
}

- (id)unitNameForValue:(id)a3 unitPreferenceController:(id)a4
{
  return self->_specifiedUnitName;
}

- (UIColor)color
{
  color = self->_color;
  if (color)
  {
    v3 = color;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HKInteractiveChartDisplayType;
    v3 = [(HKDisplayType *)&v5 color];
  }
  return v3;
}

- (id)hk_interactiveChartsFormatterForTimeScope:(int64_t)a3
{
  specifiedValueFormatter = self->_specifiedValueFormatter;
  if (specifiedValueFormatter || (baseDisplayType = self->_baseDisplayType) == 0)
  {
    id v4 = specifiedValueFormatter;
  }
  else
  {
    id v4 = [(HKDisplayType *)baseDisplayType hk_interactiveChartsFormatterForTimeScope:a3];
  }
  return v4;
}

- (id)description
{
  int64_t v2 = NSString;
  v3 = [(HKInteractiveChartDisplayType *)self displayName];
  id v4 = [v2 stringWithFormat:@"HKInteractiveChartInternalDisplayType(%@)", v3];

  return v4;
}

- (void)setColor:(id)a3
{
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKGraphSeries)mainGraphSeries
{
  return self->_mainGraphSeries;
}

- (NSString)specifiedDisplayName
{
  return self->_specifiedDisplayName;
}

- (NSString)specifiedUnitName
{
  return self->_specifiedUnitName;
}

- (HKInteractiveChartDataFormatter)specifiedValueFormatter
{
  return self->_specifiedValueFormatter;
}

- (NSDictionary)seriesForTimeScopeMapping
{
  return self->_seriesForTimeScopeMapping;
}

- (void)setSeriesForTimeScopeMapping:(id)a3
{
}

@end