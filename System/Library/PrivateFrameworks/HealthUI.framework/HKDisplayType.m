@interface HKDisplayType
+ (HKDisplayType)displayTypeWithIdentifier:(int64_t)a3;
+ (id)builtinDisplayTypes;
+ (id)hk_chartFactorDisplayTypes;
+ (id)hk_enumeratedValueLabelsWithDisplayTypeIdentifier:(int64_t)a3;
- (BOOL)_isWheelchairUser;
- (BOOL)_supportsDayTimeScope;
- (BOOL)_supportsFiveYearTimeScope;
- (BOOL)_supportsHourTimeScope;
- (BOOL)_supportsMonthTimeScope;
- (BOOL)_supportsSixMonthTimeScope;
- (BOOL)_supportsTenYearTimeScope;
- (BOOL)_supportsWeekTimeScope;
- (BOOL)_supportsYearTimeScope;
- (BOOL)allowsManualEntry;
- (BOOL)contextItemShouldDisplayEventCountForDistributionStyle:(int64_t)a3;
- (BOOL)contextItemShouldUseTightSpacingBetweenValueAndUnit;
- (BOOL)hk_healthQueryChartDataSourceDependsOnTimeScope;
- (BOOL)hk_isSupportedTimeScope:(int64_t)a3;
- (BOOL)hk_supportsMinMaxOverlayForChartSizeClass:(int64_t)a3;
- (BOOL)isActivitySummary;
- (BOOL)isCharacteristic;
- (BOOL)isDocument;
- (BOOL)isEqual:(id)a3;
- (CGSize)_barCornerRadiusForCurrentDevice;
- (HKDisplayCategory)displayCategory;
- (HKDisplayType)initWithDisplayTypeIdentifier:(int64_t)a3 categoryIdentifier:(int64_t)a4 secondaryCategoryIdentifiers:(id)a5 objectType:(id)a6 behavior:(id)a7 presentation:(id)a8 localization:(id)a9 chartingRules:(id)a10 defaultChartingPredicate:(id)a11 chartingPredicatesByTimeScope:(id)a12;
- (HKDisplayTypeBehavior)behavior;
- (HKDisplayTypeChartingRules)chartingRules;
- (HKDisplayTypeLocalization)localization;
- (HKDisplayTypePresentation)presentation;
- (HKObjectType)objectType;
- (HKSampleType)recordSampleType;
- (HKSampleType)sampleType;
- (HKValueRange)defaultAxisRangeOverride;
- (NSArray)secondaryCategoryIdentifiers;
- (NSArray)secondaryDisplayCategories;
- (NSString)displayTypeIdentifierString;
- (NSString)listIconImageName;
- (UIImage)detailImage;
- (UIImage)displayTypeIcon;
- (UIImage)listIcon;
- (UIImage)shareIcon;
- (UIImage)unitIcon;
- (id)_audioLevelDataSourceForTypeIdentifier:(id)a3 withHealthStore:(id)a4 attenuatesExposureData:(BOOL)a5 unitController:(id)a6;
- (id)_dataSourceForTimeScope:(int64_t)a3 dataCacheController:(id)a4;
- (id)_generateAFibBurdenLineSeriesWithColor:(id)a3;
- (id)_generateAbnormalBreathingSeriesWithDisplayCategory:(id)a3 timeScope:(int64_t)a4;
- (id)_generateBarSeriesWithFillStyle:(id)a3;
- (id)_generateBloodPressureSeriesWithColor:(id)a3;
- (id)_generateGraphSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 standardAxisConfiguration:(id)a6 externalAxisConfigurationOverrides:(id)a7 chartSizeClass:(int64_t)a8;
- (id)_generateHandwashingBarSeriesWithDisplayCategory:(id)a3;
- (id)_generateInsulinBarSeriesWithDisplayCategory;
- (id)_generateJulianIndexedSevenDayQuantitySeriesWithColor:(id)a3;
- (id)_generateLevelCategorySeriesWithColor:(id)a3 numericAxisConfigurationOverrides:(id)a4;
- (id)_generateMinMaxSeriesWithColor:(id)a3 opacity:(double)a4 unselectedPointStyle:(int64_t)a5 selectedPointStyle:(int64_t)a6;
- (id)_generateRelativeLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 valueAxisAnnotationFormatter:(id)a5 chartSizeClass:(int64_t)a6;
- (id)_generateSingleLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 numericAxisConfigurationOverrides:(id)a5;
- (id)_generateStackedSeriesWithColor:(id)a3 numericAxisConfigurationOverrides:(id)a4;
- (id)_generateStandardSeriesForChartStyle:(int64_t)a3 timeScope:(int64_t)a4 chartSizeClass:(int64_t)a5 axisConfiguration:(id)a6 displayCategory:(id)a7 unitController:(id)a8;
- (id)_singleValueUserInfoBlockWithUnitController:(id)a3 displayType:(id)a4 statisticsOption:(unint64_t)a5;
- (id)cardioFitnessDataSourceWithUnitController:(id)a3 healthStore:(id)a4;
- (id)chartingPredicateForTimeScope:(int64_t)a3;
- (id)color;
- (id)copyWithDefaultAxisRangeOverride:(id)a3;
- (id)copyWithIsWheelchairUser:(BOOL)a3;
- (id)copyWithLocalization:(id)a3;
- (id)copyWithPresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValuePredicate;
- (id)description;
- (id)generateDistributionSeriesWithColor:(id)a3 numberFormatter:(id)a4 hasMinMaxOverlay:(BOOL)a5;
- (id)generateDistributionSeriesWithColor:(id)a3 numberFormatter:(id)a4 lineWidth:(double)a5 hasMinMaxOverlay:(BOOL)a6;
- (id)generateLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4;
- (id)generateLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 valueAxisAnnotationFormatter:(id)a5;
- (id)generateScatterPlotSeriesWithColor:(id)a3;
- (id)hk_axisScalingRuleForChartSizeClass:(int64_t)a3 unitController:(id)a4;
- (id)hk_chartExcludedFactorDisplayTypes;
- (id)hk_chartFactorDescriptionDisplayTypes;
- (id)hk_customSeriesPointIntervalComponentsForTimeScope:(int64_t)a3 resolution:(int64_t)a4;
- (id)hk_defaultChartAxisBoundStringFromValue:(id)a3 defaultNumberFormatter:(id)a4 unitController:(id)a5;
- (id)hk_dimensionForChartAxisWithUnitController:(id)a3;
- (id)hk_enumeratedValueLabels;
- (id)hk_healthQueryChartCacheDataSourceForTimeScope:(int64_t)a3 healthStore:(id)a4 unitController:(id)a5;
- (id)hk_interactiveChartAxisStringFromValue:(id)a3 defaultNumberFormatter:(id)a4 unitController:(id)a5;
- (id)hk_interactiveChartsFormatterForTimeScope:(int64_t)a3;
- (id)hk_numberFormatterForUnit:(id)a3;
- (id)hk_numberFormatterForUnit:(id)a3 formattingContext:(int64_t)a4;
- (id)hk_standardInteractiveChartsFormatterForTimeScope:(int64_t)a3;
- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6;
- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6 numericAxisConfigurationOverrides:(id)a7;
- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6 numericAxisConfigurationOverrides:(id)a7 chartSizeClass:(int64_t)a8;
- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7;
- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7 numericAxisConfigurationOverrides:(id)a8;
- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7 numericAxisConfigurationOverrides:(id)a8 chartSizeClass:(int64_t)a9;
- (id)hk_startOfDayTransform;
- (id)hk_valueFormatterForUnit:(id)a3;
- (id)hk_valueFormatterForUnit:(id)a3 formattingContext:(int64_t)a4;
- (id)hk_valueOrderForStackedCharts;
- (id)localizedStringSuffixForWheelchairUser:(BOOL)a3;
- (id)unitNameForValue:(id)a3 unitPreferenceController:(id)a4;
- (int64_t)categoryIdentifier;
- (int64_t)displayTypeIdentifier;
- (int64_t)hk_stackedChartSectionsCountForTimeScope:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)hk_chartCalendarUnitForTimeScope:(int64_t)a3;
- (unint64_t)hk_interactiveChartOptions;
- (unint64_t)roundingMode;
- (void)_assignAFibBurdenAxisForSeries:(id)a3 standardAxisConfiguration:(id)a4 externalAxisConfigurationOverrides:(id)a5;
- (void)_assignWalkingAsymmetryPercentageAxisForSeries:(id)a3 standardAxisConfiguration:(id)a4 externalAxisConfigurationOverrides:(id)a5;
- (void)_setWheelchairUser:(BOOL)a3;
@end

@implementation HKDisplayType

- (HKSampleType)sampleType
{
  return (HKSampleType *)self->_objectType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_defaultAxisRangeOverride, 0);
  objc_storeStrong((id *)&self->_chartingRules, 0);
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_secondaryCategoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_listIcon, 0);
  objc_storeStrong((id *)&self->_chartingPredicatesByTimeScope, 0);
  objc_storeStrong((id *)&self->_defaultChartingPredicate, 0);
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (int64_t)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (int64_t)displayTypeIdentifier
{
  return self->_displayTypeIdentifier;
}

- (NSArray)secondaryCategoryIdentifiers
{
  return self->_secondaryCategoryIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 48) = self->_displayTypeIdentifier;
  *(void *)(v4 + 56) = self->_categoryIdentifier;
  objc_storeStrong((id *)(v4 + 64), self->_secondaryCategoryIdentifiers);
  objc_storeStrong((id *)(v4 + 112), self->_objectType);
  uint64_t v5 = [(HKDisplayTypeBehavior *)self->_behavior copy];
  v6 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v5;

  uint64_t v7 = [(HKDisplayTypePresentation *)self->_presentation copy];
  v8 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v7;

  uint64_t v9 = [(HKDisplayTypeLocalization *)self->_localization copy];
  v10 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v9;

  objc_storeStrong((id *)(v4 + 24), self->_listIcon);
  objc_storeStrong((id *)(v4 + 32), self->_detailImage);
  objc_storeStrong((id *)(v4 + 8), self->_defaultChartingPredicate);
  objc_storeStrong((id *)(v4 + 16), self->_chartingPredicatesByTimeScope);
  objc_storeStrong((id *)(v4 + 96), self->_chartingRules);
  *(unsigned char *)(v4 + 40) = self->__wheelchairUser;
  uint64_t v11 = [(HKValueRange *)self->_defaultAxisRangeOverride copy];
  v12 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v11;

  return (id)v4;
}

- (HKDisplayType)initWithDisplayTypeIdentifier:(int64_t)a3 categoryIdentifier:(int64_t)a4 secondaryCategoryIdentifiers:(id)a5 objectType:(id)a6 behavior:(id)a7 presentation:(id)a8 localization:(id)a9 chartingRules:(id)a10 defaultChartingPredicate:(id)a11 chartingPredicatesByTimeScope:(id)a12
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v40 = a10;
  id v21 = a11;
  id v22 = a12;
  v41.receiver = self;
  v41.super_class = (Class)HKDisplayType;
  v23 = [(HKDisplayType *)&v41 init];
  v24 = v23;
  if (v23)
  {
    v23->_displayTypeIdentifier = a3;
    v23->_categoryIdentifier = a4;
    uint64_t v25 = [v16 copy];
    secondaryCategoryIdentifiers = v24->_secondaryCategoryIdentifiers;
    v24->_secondaryCategoryIdentifiers = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    objectType = v24->_objectType;
    v24->_objectType = (HKObjectType *)v27;

    uint64_t v29 = [v18 copy];
    behavior = v24->_behavior;
    v24->_behavior = (HKDisplayTypeBehavior *)v29;

    uint64_t v31 = [v19 copy];
    presentation = v24->_presentation;
    v24->_presentation = (HKDisplayTypePresentation *)v31;

    uint64_t v33 = [v20 copy];
    localization = v24->_localization;
    v24->_localization = (HKDisplayTypeLocalization *)v33;

    objc_storeStrong((id *)&v24->_chartingRules, a10);
    objc_storeStrong((id *)&v24->_defaultChartingPredicate, a11);
    uint64_t v35 = [v22 copy];
    chartingPredicatesByTimeScope = v24->_chartingPredicatesByTimeScope;
    v24->_chartingPredicatesByTimeScope = (NSDictionary *)v35;
  }
  return v24;
}

- (HKDisplayTypeBehavior)behavior
{
  return self->_behavior;
}

- (HKDisplayTypePresentation)presentation
{
  return self->_presentation;
}

- (id)hk_valueFormatterForUnit:(id)a3
{
  return [(HKDisplayType *)self hk_valueFormatterForUnit:a3 formattingContext:0];
}

- (HKDisplayCategory)displayCategory
{
  return +[HKDisplayCategory categoryWithID:self->_categoryIdentifier];
}

- (id)hk_valueFormatterForUnit:(id)a3 formattingContext:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKDisplayType *)self objectType];
  v8 = (objc_class *)objc_msgSend(v7, "hk_valueFormatterClassForUnit:", v6);

  id v9 = [v8 alloc];
  v10 = [(HKDisplayType *)self hk_numberFormatterForUnit:v6 formattingContext:a4];

  uint64_t v11 = (void *)[v9 initWithNumberFormatter:v10];
  return v11;
}

- (id)hk_numberFormatterForUnit:(id)a3 formattingContext:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKDisplayType *)self chartingRules];
  v8 = [v7 allowedDecimalPrecisionRuleForUnit:v6];

  id v9 = [(HKDisplayType *)self objectType];
  v10 = objc_msgSend(v9, "hk_numberFormatterForUnit:decimalPrecisionRule:formattingContext:", v6, v8, a4);

  return v10;
}

- (HKDisplayTypeChartingRules)chartingRules
{
  return self->_chartingRules;
}

- (HKDisplayTypeLocalization)localization
{
  return self->_localization;
}

- (UIImage)unitIcon
{
  if ([(HKDisplayType *)self displayTypeIdentifier] == 13)
  {
    v2 = (void *)MEMORY[0x1E4FB1818];
    v3 = HKHealthUIFrameworkBundle();
    uint64_t v4 = [v2 imageNamed:@"nike_fuel_unit_icon" inBundle:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (UIImage *)v4;
}

- (unint64_t)roundingMode
{
  uint64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  unint64_t result = 1;
  if (v2 > 178)
  {
    if (((unint64_t)(v2 - 280) > 0x18 || ((1 << (v2 - 24)) & 0x107C04F) == 0)
      && v2 != 179
      && v2 != 186)
    {
      return 0;
    }
  }
  else if ((unint64_t)(v2 - 75) > 0x3F || ((1 << (v2 - 75)) & 0x8000005806000111) == 0)
  {
    unint64_t v4 = v2 - 7;
    if (v4 > 0x3F || ((1 << v4) & 0x800000000000006FLL) == 0) {
      return 0;
    }
  }
  return result;
}

- (id)copyWithLocalization:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(HKDisplayType *)self copy];
  uint64_t v6 = [v4 copy];

  uint64_t v7 = (void *)v5[11];
  v5[11] = v6;

  return v5;
}

+ (id)builtinDisplayTypes
{
  v220[216] = *MEMORY[0x1E4F143B8];
  v219 = HKDisplayTypeIdentifierBodyMassIndexMake();
  v220[0] = v219;
  v218 = HKDisplayTypeIdentifierBodyFatPercentageMake();
  v220[1] = v218;
  v217 = HKDisplayTypeIdentifierHeightMake();
  v220[2] = v217;
  v216 = HKDisplayTypeIdentifierBodyMassMake();
  v220[3] = v216;
  v215 = HKDisplayTypeIdentifierLeanBodyMassMake();
  v220[4] = v215;
  v214 = HKDisplayTypeIdentifierHeartRateMake();
  v220[5] = v214;
  v213 = HKDisplayTypeIdentifierStepsMake();
  v220[6] = v213;
  v212 = HKDisplayTypeIdentifierDistanceWalkingRunningMake();
  v220[7] = v212;
  v211 = HKDisplayTypeIdentifierBasalEnergyBurnedMake();
  v220[8] = v211;
  v210 = HKDisplayTypeIdentifierActiveEnergyMake();
  v220[9] = v210;
  v209 = HKDisplayTypeIdentifierFlightsClimbedMake();
  v220[10] = v209;
  v208 = HKDisplayTypeIdentifierNikeFuelMake();
  v220[11] = v208;
  v207 = HKDisplayTypeIdentifierOxygenSaturationMake();
  v220[12] = v207;
  v206 = HKDisplayTypeIdentifierBloodGlucoseMake();
  v220[13] = v206;
  v205 = HKDisplayTypeIdentifierBloodAlcoholContentMake();
  v220[14] = v205;
  v204 = HKDisplayTypeIdentifierPeripheralPerfusionIndexMake();
  v220[15] = v204;
  v203 = HKDisplayTypeIdentifierDietaryFatTotalMake();
  v220[16] = v203;
  v202 = HKDisplayTypeIdentifierDietaryFatPolyunsaturatedMake();
  v220[17] = v202;
  v201 = HKDisplayTypeIdentifierDietaryFatMonounsaturatedMake();
  v220[18] = v201;
  v200 = HKDisplayTypeIdentifierDietaryFatSaturatedMake();
  v220[19] = v200;
  v199 = HKDisplayTypeIdentifierDietaryCholesterolMake();
  v220[20] = v199;
  v198 = HKDisplayTypeIdentifierDietarySodiumMake();
  v220[21] = v198;
  v197 = HKDisplayTypeIdentifierDietaryCarbohydratesMake();
  v220[22] = v197;
  v196 = HKDisplayTypeIdentifierDietaryFiberMake();
  v220[23] = v196;
  v195 = HKDisplayTypeIdentifierDietarySugarMake();
  v220[24] = v195;
  v194 = HKDisplayTypeIdentifierDietaryEnergyMake();
  v220[25] = v194;
  v193 = HKDisplayTypeIdentifierDietaryProteinMake();
  v220[26] = v193;
  v192 = HKDisplayTypeIdentifierDietaryVitaminAMake();
  v220[27] = v192;
  v191 = HKDisplayTypeIdentifierDietaryVitaminB6Make();
  v220[28] = v191;
  v190 = HKDisplayTypeIdentifierDietaryVitaminB12Make();
  v220[29] = v190;
  v189 = HKDisplayTypeIdentifierDietaryVitaminCMake();
  v220[30] = v189;
  v188 = HKDisplayTypeIdentifierDietaryVitaminDMake();
  v220[31] = v188;
  v187 = HKDisplayTypeIdentifierDietaryVitaminEMake();
  v220[32] = v187;
  v186 = HKDisplayTypeIdentifierDietaryVitaminKMake();
  v220[33] = v186;
  v185 = HKDisplayTypeIdentifierDietaryCalciumMake();
  v220[34] = v185;
  v184 = HKDisplayTypeIdentifierDietaryIronMake();
  v220[35] = v184;
  v183 = HKDisplayTypeIdentifierDietaryThiaminMake();
  v220[36] = v183;
  v182 = HKDisplayTypeIdentifierDietaryRiboflavinMake();
  v220[37] = v182;
  v181 = HKDisplayTypeIdentifierDietaryNiacinMake();
  v220[38] = v181;
  v180 = HKDisplayTypeIdentifierDietaryFolateMake();
  v220[39] = v180;
  v179 = HKDisplayTypeIdentifierDietaryBiotinMake();
  v220[40] = v179;
  v178 = HKDisplayTypeIdentifierDietaryPantothenicAcidMake();
  v220[41] = v178;
  v177 = HKDisplayTypeIdentifierDietaryPhosphorusMake();
  v220[42] = v177;
  v176 = HKDisplayTypeIdentifierDietaryIodineMake();
  v220[43] = v176;
  v175 = HKDisplayTypeIdentifierDietaryMagnesiumMake();
  v220[44] = v175;
  v174 = HKDisplayTypeIdentifierDietaryZincMake();
  v220[45] = v174;
  v173 = HKDisplayTypeIdentifierDietarySeleniumMake();
  v220[46] = v173;
  v172 = HKDisplayTypeIdentifierDietaryCopperMake();
  v220[47] = v172;
  v171 = HKDisplayTypeIdentifierDietaryManganeseMake();
  v220[48] = v171;
  v170 = HKDisplayTypeIdentifierDietaryChromiumMake();
  v220[49] = v170;
  v169 = HKDisplayTypeIdentifierDietaryMolybdenumMake();
  v220[50] = v169;
  v168 = HKDisplayTypeIdentifierDietaryChlorideMake();
  v220[51] = v168;
  v167 = HKDisplayTypeIdentifierDietaryPotassiumMake();
  v220[52] = v167;
  v166 = HKDisplayTypeIdentifierNumberOfTimesFallenMake();
  v220[53] = v166;
  v165 = HKDisplayTypeIdentifierElectrodermalActivityMake();
  v220[54] = v165;
  v164 = HKDisplayTypeIdentifierInhalerUsageMake();
  v220[55] = v164;
  v163 = HKDisplayTypeIdentifierRespiratoryRateMake();
  v220[56] = v163;
  v162 = HKDisplayTypeIdentifierBodyTemperatureMake();
  v220[57] = v162;
  v161 = HKDisplayTypeIdentifierSleepAnalysisMake();
  v220[58] = v161;
  v160 = HKDisplayTypeIdentifierBiologicalSexMake();
  v220[59] = v160;
  v159 = HKDisplayTypeIdentifierDateOfBirthMake();
  v220[60] = v159;
  v158 = HKDisplayTypeIdentifierBloodTypeMake();
  v220[61] = v158;
  v157 = HKDisplayTypeIdentifierAppleStandHourMake();
  v220[62] = v157;
  v156 = HKDisplayTypeIdentifierForcedVitalCapacityMake();
  v220[63] = v156;
  v155 = HKDisplayTypeIdentifierForcedExpiratoryVolume1Make();
  v220[64] = v155;
  v154 = HKDisplayTypeIdentifierPeakExpiratoryFlowRateMake();
  v220[65] = v154;
  v153 = HKDisplayTypeIdentifierAppleExerciseTimeMake();
  v220[66] = v153;
  v152 = HKDisplayTypeIdentifierDietaryCaffeineMake();
  v220[67] = v152;
  v151 = HKDisplayTypeIdentifierWorkoutMake();
  v220[68] = v151;
  v150 = HKDisplayTypeIdentifierBloodPressureMake();
  v220[69] = v150;
  v149 = HKDisplayTypeIdentifierCyclingDistanceMake();
  v220[70] = v149;
  v148 = HKDisplayTypeIdentifierDietaryWaterMake();
  v220[71] = v148;
  v147 = HKDisplayTypeIdentifierFitzpatrickSkinTypeMake();
  v220[72] = v147;
  v146 = HKDisplayTypeIdentifierUVExposureMake();
  v220[73] = v146;
  v145 = HKDisplayTypeIdentifierBasalBodyTemperatureMake();
  v220[74] = v145;
  v144 = HKDisplayTypeIdentifierCervicalMucusQualityMake();
  v220[75] = v144;
  v143 = HKDisplayTypeIdentifierOvulationTestResultMake();
  v220[76] = v143;
  v142 = HKDisplayTypeIdentifierMenstruationMake();
  v220[77] = v142;
  v141 = HKDisplayTypeIdentifierIntermenstrualBleedingMake();
  v220[78] = v141;
  v140 = HKDisplayTypeIdentifierSexualActivityMake();
  v220[79] = v140;
  v139 = HKDisplayTypeIdentifierMindfulSessionMake();
  v220[80] = v139;
  v138 = HKDisplayTypeIdentifierActivitySummaryMake();
  v220[81] = v138;
  v137 = HKDisplayTypeIdentifierPushCountMake();
  v220[82] = v137;
  v136 = HKDisplayTypeIdentifierWheelchairUseMake();
  v220[83] = v136;
  v135 = HKDisplayTypeIdentifierCDADocumentMake();
  v220[84] = v135;
  v134 = HKDisplayTypeIdentifierSwimmingDistanceMake();
  v220[85] = v134;
  v133 = HKDisplayTypeIdentifierSwimmingStrokesMake();
  v220[86] = v133;
  v132 = HKDisplayTypeIdentifierWheelchairDistanceMake();
  v220[87] = v132;
  v131 = HKDisplayTypeIdentifierWaistCircumferenceMake();
  v220[88] = v131;
  v130 = HKDisplayTypeIdentifierRestingHeartRateMake();
  v220[89] = v130;
  v129 = HKDisplayTypeIdentifierVO2MaxMake();
  v220[90] = v129;
  v128 = HKDisplayTypeIdentifierInsulinDeliveryMake();
  v220[91] = v128;
  v127 = HKDisplayTypeIdentifierWalkingHeartRateAverageMake();
  v220[92] = v127;
  v126 = HKDisplayTypeIdentifierDownhillSnowSportsDistanceMake();
  v220[93] = v126;
  v125 = HKDisplayTypeIdentifierHeartRateVariabilityMake();
  v220[94] = v125;
  v124 = HKDisplayTypeIdentifierTachycardiaEventMake();
  v220[95] = v124;
  v123 = HKDisplayTypeIdentifierElectrocardiogramMake();
  v220[96] = v123;
  v122 = HKDisplayTypeIdentifierAudiogramMake();
  v220[97] = v122;
  v121 = HKDisplayTypeIdentifierBradycardiaEventMake();
  v220[98] = v121;
  v120 = HKDisplayTypeIdentifierAllergyRecordMake();
  v220[99] = v120;
  v119 = HKDisplayTypeIdentifierConditionRecordMake();
  v220[100] = v119;
  v118 = HKDisplayTypeIdentifierImmunizationRecordMake();
  v220[101] = v118;
  v117 = HKDisplayTypeIdentifierLabResultRecordMake();
  v220[102] = v117;
  v116 = HKDisplayTypeIdentifierMedicationRecordMake();
  v220[103] = v116;
  v115 = HKDisplayTypeIdentifierProcedureRecordMake();
  v220[104] = v115;
  v114 = HKDisplayTypeIdentifierVitalSignRecordMake();
  v220[105] = v114;
  v113 = HKDisplayTypeIdentifierAtrialFibrillationEventMake();
  v220[106] = v113;
  v112 = HKDisplayTypeIdentifierAbdominalCrampsMake();
  v220[107] = v112;
  v111 = HKDisplayTypeIdentifierBreastPainMake();
  v220[108] = v111;
  v110 = HKDisplayTypeIdentifierBloatingMake();
  v220[109] = v110;
  v109 = HKDisplayTypeIdentifierHeadacheMake();
  v220[110] = v109;
  v108 = HKDisplayTypeIdentifierAcneMake();
  v220[111] = v108;
  v107 = HKDisplayTypeIdentifierLowerBackPainMake();
  v220[112] = v107;
  v106 = HKDisplayTypeIdentifierPelvicPainMake();
  v220[113] = v106;
  v105 = HKDisplayTypeIdentifierMoodChangesMake();
  v220[114] = v105;
  v104 = HKDisplayTypeIdentifierConstipationMake();
  v220[115] = v104;
  v103 = HKDisplayTypeIdentifierDiarrheaMake();
  v220[116] = v103;
  v102 = HKDisplayTypeIdentifierFatigueMake();
  v220[117] = v102;
  v101 = HKDisplayTypeIdentifierNauseaMake();
  v220[118] = v101;
  v100 = HKDisplayTypeIdentifierSleepChangesMake();
  v220[119] = v100;
  v99 = HKDisplayTypeIdentifierAppetiteChangesMake();
  v220[120] = v99;
  v98 = HKDisplayTypeIdentifierHotFlashesMake();
  v220[121] = v98;
  v97 = HKDisplayTypeIdentifierEnvironmentalAudioExposureMake();
  v220[122] = v97;
  v96 = HKDisplayTypeIdentifierHeadphoneAudioExposureMake();
  v220[123] = v96;
  v95 = HKDisplayTypeIdentifierActivityMoveModeMake();
  v220[124] = v95;
  v94 = HKDisplayTypeIdentifierEnvironmentalAudioExposureEventMake();
  v220[125] = v94;
  v93 = HKDisplayTypeIdentifierAppleMoveTimeMake();
  v220[126] = v93;
  v92 = HKDisplayTypeIdentifierWalkingDoubleSupportPercentageMake();
  v220[127] = v92;
  v91 = HKDisplayTypeIdentifierSixMinuteWalkTestDistanceMake();
  v220[128] = v91;
  v90 = HKDisplayTypeIdentifierAppleStandTimeMake();
  v220[129] = v90;
  v89 = HKDisplayTypeIdentifierWalkingSpeedMake();
  v220[130] = v89;
  v88 = HKDisplayTypeIdentifierWalkingStepLengthMake();
  v220[131] = v88;
  v87 = HKDisplayTypeIdentifierToothbrushingEventMake();
  v220[132] = v87;
  v86 = HKDisplayTypeIdentifierPregnancyMake();
  v220[133] = v86;
  v85 = HKDisplayTypeIdentifierLactationMake();
  v220[134] = v85;
  v84 = HKDisplayTypeIdentifierContraceptiveMake();
  v220[135] = v84;
  v83 = HKDisplayTypeIdentifierWalkingAsymmetryPercentageMake();
  v220[136] = v83;
  v82 = HKDisplayTypeIdentifierStairAscentSpeedMake();
  v220[137] = v82;
  v81 = HKDisplayTypeIdentifierStairDescentSpeedMake();
  v220[138] = v81;
  v80 = HKDisplayTypeIdentifierSleepDurationGoalMake();
  v220[139] = v80;
  v79 = HKDisplayTypeIdentifierSleepScheduleMake();
  v220[140] = v79;
  v78 = HKDisplayTypeIdentifierHeadphoneAudioExposureEventMake();
  v220[141] = v78;
  v77 = HKDisplayTypeIdentifierRapidPoundingOrFlutteringHeartbeatMake();
  v220[142] = v77;
  v76 = HKDisplayTypeIdentifierSkippedHeartbeatMake();
  v220[143] = v76;
  v75 = HKDisplayTypeIdentifierFeverMake();
  v220[144] = v75;
  v74 = HKDisplayTypeIdentifierShortnessOfBreathMake();
  v220[145] = v74;
  v73 = HKDisplayTypeIdentifierChestTightnessOrPainMake();
  v220[146] = v73;
  v72 = HKDisplayTypeIdentifierFaintingMake();
  v220[147] = v72;
  v71 = HKDisplayTypeIdentifierDizzinessMake();
  v220[148] = v71;
  v70 = HKDisplayTypeIdentifierInsuranceRecordMake();
  v220[149] = v70;
  v69 = HKDisplayTypeIdentifierCardioFitnessMedicationsUseMake();
  v220[150] = v69;
  v68 = HKDisplayTypeIdentifierVomitingMake();
  v220[151] = v68;
  v67 = HKDisplayTypeIdentifierHeartburnMake();
  v220[152] = v67;
  v66 = HKDisplayTypeIdentifierCoughingMake();
  v220[153] = v66;
  v65 = HKDisplayTypeIdentifierWheezingMake();
  v220[154] = v65;
  v64 = HKDisplayTypeIdentifierSoreThroatMake();
  v220[155] = v64;
  v63 = HKDisplayTypeIdentifierCongestionMake();
  v220[156] = v63;
  v62 = HKDisplayTypeIdentifierRunnyNoseMake();
  v220[157] = v62;
  v61 = HKDisplayTypeIdentifierVaginalDrynessMake();
  v220[158] = v61;
  v60 = HKDisplayTypeIdentifierNightSweatsMake();
  v220[159] = v60;
  v59 = HKDisplayTypeIdentifierChillsMake();
  v220[160] = v59;
  v58 = HKDisplayTypeIdentifierHairLossMake();
  v220[161] = v58;
  v57 = HKDisplayTypeIdentifierDrySkinMake();
  v220[162] = v57;
  v56 = HKDisplayTypeIdentifierBladderIncontinenceMake();
  v220[163] = v56;
  v55 = HKDisplayTypeIdentifierMemoryLapseMake();
  v220[164] = v55;
  v54 = HKDisplayTypeIdentifierLowCardioFitnessEventMake();
  v220[165] = v54;
  v53 = HKDisplayTypeIdentifierHandwashingEventMake();
  v220[166] = v53;
  v52 = HKDisplayTypeIdentifierGeneralizedBodyAcheMake();
  v220[167] = v52;
  v51 = HKDisplayTypeIdentifierLossOfSmellMake();
  v220[168] = v51;
  v50 = HKDisplayTypeIdentifierLossOfTasteMake();
  v220[169] = v50;
  v49 = HKDisplayTypeIdentifierPregnancyTestResultMake();
  v220[170] = v49;
  v48 = HKDisplayTypeIdentifierProgesteroneTestResultMake();
  v220[171] = v48;
  v47 = HKDisplayTypeIdentifierAtrialFibrillationBurdenMake();
  v220[172] = v47;
  v46 = HKDisplayTypeIdentifierAppleWalkingSteadinessMake();
  v220[173] = v46;
  v45 = HKDisplayTypeIdentifierAppleWalkingSteadinessEventMake();
  v220[174] = v45;
  v44 = HKDisplayTypeIdentifierNumberOfAlcoholicBeveragesMake();
  v220[175] = v44;
  v43 = HKDisplayTypeIdentifierAppleSleepingWristTemperatureMake();
  v220[176] = v43;
  v42 = HKDisplayTypeIdentifierVisionPrescriptionMake();
  v220[177] = v42;
  objc_super v41 = HKDisplayTypeIdentifierRunningStrideLengthMake();
  v220[178] = v41;
  id v40 = HKDisplayTypeIdentifierRunningVerticalOscillationMake();
  v220[179] = v40;
  v39 = HKDisplayTypeIdentifierRunningGroundContactTimeMake();
  v220[180] = v39;
  v38 = HKDisplayTypeIdentifierPersistentIntermenstrualBleedingMake();
  v220[181] = v38;
  v37 = HKDisplayTypeIdentifierProlongedMenstrualPeriodsMake();
  v220[182] = v37;
  v36 = HKDisplayTypeIdentifierIrregularMenstrualCyclesMake();
  v220[183] = v36;
  uint64_t v35 = HKDisplayTypeIdentifierInfrequentMenstrualCyclesMake();
  v220[184] = v35;
  v34 = HKDisplayTypeIdentifierHeartRateRecoveryMake();
  v220[185] = v34;
  uint64_t v33 = HKDisplayTypeIdentifierClinicalNoteRecordMake();
  v220[186] = v33;
  v32 = HKDisplayTypeIdentifierUnderwaterDepthMake();
  v220[187] = v32;
  uint64_t v31 = HKDisplayTypeIdentifierRunningPowerMake();
  v220[188] = v31;
  v30 = HKDisplayTypeIdentifierEnvironmentalSoundReductionMake();
  v220[189] = v30;
  uint64_t v29 = HKDisplayTypeIdentifierMedicationDoseEventMake();
  v220[190] = v29;
  v28 = HKDisplayTypeIdentifierRunningSpeedMake();
  v220[191] = v28;
  uint64_t v27 = HKDisplayTypeIdentifierAppleSleepingBreathingDisturbancesMake();
  v220[192] = v27;
  v26 = HKDisplayTypeIdentifierSleepApneaEventMake();
  v220[193] = v26;
  uint64_t v25 = HKDisplayTypeIdentifierWaterTemperatureMake();
  v220[194] = v25;
  v24 = HKDisplayTypeIdentifierTimeInDaylightMake();
  v220[195] = v24;
  v23 = HKDisplayTypeIdentifierCyclingPowerMake();
  v220[196] = v23;
  id v22 = HKDisplayTypeIdentifierCyclingSpeedMake();
  v220[197] = v22;
  id v21 = HKDisplayTypeIdentifierCyclingCadenceMake();
  v220[198] = v21;
  id v20 = HKDisplayTypeIdentifierCyclingFunctionalThresholdPowerMake();
  v220[199] = v20;
  id v19 = HKDisplayTypeIdentifierStateOfMindMake();
  v220[200] = v19;
  id v18 = HKDisplayTypeIdentifierPhysicalEffortMake();
  v220[201] = v18;
  id v17 = HKDisplayTypeIdentifierGAD7Make();
  v220[202] = v17;
  id v16 = HKDisplayTypeIdentifierPHQ9Make();
  v220[203] = v16;
  v15 = HKDisplayTypeIdentifierPaddleSportsDistanceMake();
  v220[204] = v15;
  v14 = HKDisplayTypeIdentifierRowingDistanceMake();
  v220[205] = v14;
  uint64_t v2 = HKDisplayTypeIdentifierCrossCountrySkiingDistanceMake();
  v220[206] = v2;
  v3 = HKDisplayTypeIdentifierSkatingSportsDistanceMake();
  v220[207] = v3;
  id v4 = HKDisplayTypeIdentifierEstimatedWorkoutEffortScoreMake();
  v220[208] = v4;
  uint64_t v5 = HKDisplayTypeIdentifierRowingSpeedMake();
  v220[209] = v5;
  uint64_t v6 = HKDisplayTypeIdentifierCrossCountrySkiingSpeedMake();
  v220[210] = v6;
  uint64_t v7 = HKDisplayTypeIdentifierPaddleSportsSpeedMake();
  v220[211] = v7;
  v8 = HKDisplayTypeIdentifierWorkoutEffortScoreMake();
  v220[212] = v8;
  id v9 = HKDisplayTypeIdentifierAppleBalanceMetricsMake();
  v220[213] = v9;
  v10 = HKDisplayTypeIdentifierBleedingDuringPregnancyMake();
  v220[214] = v10;
  uint64_t v11 = HKDisplayTypeIdentifierBleedingAfterPregnancyMake();
  v220[215] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v220 count:216];

  return v13;
}

- (id)hk_numberFormatterForUnit:(id)a3
{
  return [(HKDisplayType *)self hk_numberFormatterForUnit:a3 formattingContext:0];
}

- (id)hk_customSeriesPointIntervalComponentsForTimeScope:(int64_t)a3 resolution:(int64_t)a4
{
  uint64_t v5 = [(HKDisplayType *)self presentation];
  uint64_t v6 = [v5 configurationForTimeScope:5];
  int v7 = [v6 singleDailyValue];

  v8 = 0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6 && v7)
  {
    v8 = objc_opt_new();
    [v8 setDay:1];
  }
  return v8;
}

- (unint64_t)hk_chartCalendarUnitForTimeScope:(int64_t)a3
{
  unint64_t v5 = 16;
  switch(a3)
  {
    case 0:
    case 1:
      unint64_t v5 = 4;
      break;
    case 2:
      unint64_t v5 = 8;
      break;
    case 3:
      unint64_t v5 = 0x2000;
      break;
    case 6:
    case 7:
      unint64_t v5 = 32;
      break;
    case 8:
      int v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKDisplayType+HKAdditions.m", 101, @"Invalid zoom level (%ld)", 8);

      unint64_t v5 = 16;
      break;
    default:
      break;
  }
  v8 = [(HKDisplayType *)self presentation];
  id v9 = [v8 configurationForTimeScope:5];
  unsigned __int8 v10 = [v9 singleDailyValue];

  if ((((a3 & 0xFFFFFFFFFFFFFFFELL) == 6) & v10) != 0) {
    return 16;
  }
  else {
    return v5;
  }
}

- (id)hk_startOfDayTransform
{
  if ([(HKDisplayType *)self displayTypeIdentifier] == 63) {
    HKCalendarDateTransformPreceding6PM();
  }
  else {
  uint64_t v2 = HKCalendarDateTransformNone();
  }
  return v2;
}

- (id)hk_interactiveChartAxisStringFromValue:(id)a3 defaultNumberFormatter:(id)a4 unitController:(id)a5
{
  id v8 = a5;
  id v9 = [(HKDisplayType *)self hk_defaultChartAxisBoundStringFromValue:a3 defaultNumberFormatter:a4 unitController:v8];
  unsigned __int8 v10 = [(HKDisplayType *)self presentation];
  int v11 = [v10 shouldDisplayUnitStringOnYAxis];

  if (v11)
  {
    v12 = [v8 localizedDisplayNameForDisplayType:self];
    uint64_t v13 = HKFormatValueAndUnit(v9, v12);

    id v9 = (void *)v13;
  }

  return v9;
}

- (id)hk_defaultChartAxisBoundStringFromValue:(id)a3 defaultNumberFormatter:(id)a4 unitController:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [v8 unitForDisplayType:self];
  uint64_t v12 = [(HKDisplayType *)self hk_numberFormatterForUnit:v11];
  uint64_t v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = v9;
  }
  id v15 = v14;

  id v16 = HKFormattedStringFromValue(v10, self, v8, 1, v15);

  return v16;
}

- (id)_dataSourceForTimeScope:(int64_t)a3 dataCacheController:(id)a4
{
  id v4 = [a4 interactiveChartsCacheForDisplayType:self timeScope:a3];
  unint64_t v5 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v5 setChartCache:v4];

  return v5;
}

- (id)_generateBloodPressureSeriesWithColor:(id)a3
{
  return +[HKBloodPressureSeries defaultSeriesWithDiastolicColor:a3];
}

- (id)_generateMinMaxSeriesWithColor:(id)a3 opacity:(double)a4 unselectedPointStyle:(int64_t)a5 selectedPointStyle:(int64_t)a6
{
  id v9 = a3;
  id v10 = objc_alloc_init(HKMinMaxSeries);
  int v11 = +[HKChartSeriesPointMarker chartPointWithColor:v9 radius:a5 style:4.0];
  [(HKMinMaxSeries *)v10 setUnselectedPointMarkerImage:v11];

  uint64_t v12 = [v9 colorWithAlphaComponent:a4];
  uint64_t v13 = +[HKStrokeStyle strokeStyleWithColor:v12 lineWidth:8.0];
  [(HKMinMaxSeries *)v10 setUnselectedStrokeStyle:v13];

  v14 = +[HKChartSeriesPointMarker chartPointWithColor:v9 radius:a6 style:HKUIOnePixel() + 5.0];
  [(HKMinMaxSeries *)v10 setSelectedPointMarkerImage:v14];

  id v15 = [v9 colorWithAlphaComponent:a4];

  double v16 = HKUIOnePixel();
  id v17 = +[HKStrokeStyle strokeStyleWithColor:v15 lineWidth:v16 + 5.0 + v16 + 5.0];
  [(HKMinMaxSeries *)v10 setSelectedStrokeStyle:v17];

  return v10;
}

- (CGSize)_barCornerRadiusForCurrentDevice
{
  uint64_t v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v2 isiPad]) {
    double v3 = 3.0;
  }
  else {
    double v3 = 1.5;
  }

  double v4 = v3;
  double v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_generateBarSeriesWithFillStyle:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(HKBarSeries);
  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  int v7 = +[HKStrokeStyle strokeStyleWithColor:v6 lineWidth:3.0];
  id v8 = objc_alloc_init(HKStrokeStyle);
  id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  [(HKStrokeStyle *)v8 setStrokeColor:v9];

  [(HKStrokeStyle *)v8 setLineWidth:3.0];
  [(HKStrokeStyle *)v8 setBlendMode:22];
  [(HKBarSeries *)v5 setUnselectedStrokeStyle:v8];
  [(HKBarSeries *)v5 setTiledStrokeStyle:v7];
  [(HKBarSeries *)v5 setUnselectedFillStyle:v4];
  [(HKBarSeries *)v5 setSelectedFillStyle:v4];

  id v10 = objc_alloc_init(HKSolidFillStyle);
  int v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
  [(HKSolidFillStyle *)v10 setColor:v11];

  [(HKBarSeries *)v5 setInactiveFillStyle:v10];
  [(HKDisplayType *)self _barCornerRadiusForCurrentDevice];
  -[HKBarSeries setCornerRadii:](v5, "setCornerRadii:");

  return v5;
}

- (id)_generateInsulinBarSeriesWithDisplayCategory
{
  v21[2] = *MEMORY[0x1E4F143B8];
  double v3 = objc_alloc_init(HKStackedBarSeries);
  id v4 = objc_alloc_init(HKStrokeStyle);
  double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  [(HKStrokeStyle *)v4 setStrokeColor:v5];

  [(HKStrokeStyle *)v4 setLineWidth:3.0];
  [(HKStrokeStyle *)v4 setBlendMode:22];
  [(HKBarSeries *)v3 setUnselectedStrokeStyle:v4];
  [(HKDisplayType *)self _barCornerRadiusForCurrentDevice];
  -[HKBarSeries setCornerRadii:](v3, "setCornerRadii:");
  uint64_t v6 = objc_alloc_init(HKSolidFillStyle);
  int v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_insulinBasalKeyColor");
  [(HKSolidFillStyle *)v6 setColor:v7];

  id v8 = v6;
  id v9 = objc_alloc_init(HKSolidFillStyle);
  id v10 = HKHealthKeyColor();
  [(HKSolidFillStyle *)v9 setColor:v10];

  int v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  uint64_t v12 = +[HKStrokeStyle strokeStyleWithColor:v11 lineWidth:3.0];
  [(HKBarSeries *)v3 setTiledStrokeStyle:v12];
  v21[0] = v8;
  v21[1] = v9;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [(HKStackedBarSeries *)v3 setUnselectedFillStyles:v13];

  v14 = objc_alloc_init(HKSolidFillStyle);
  id v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  [(HKSolidFillStyle *)v14 setColor:v15];

  double v16 = objc_alloc_init(HKSolidFillStyle);
  id v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
  [(HKSolidFillStyle *)v16 setColor:v17];

  v20[0] = v14;
  v20[1] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  [(HKStackedBarSeries *)v3 setInactiveFillStyles:v18];
  return v3;
}

- (id)_generateHandwashingBarSeriesWithDisplayCategory:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(HKBarSeries);
  uint64_t v6 = objc_alloc_init(HKStrokeStyle);
  int v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  [(HKStrokeStyle *)v6 setStrokeColor:v7];

  [(HKStrokeStyle *)v6 setLineWidth:3.0];
  [(HKStrokeStyle *)v6 setBlendMode:22];
  [(HKBarSeries *)v5 setUnselectedStrokeStyle:v6];
  [(HKDisplayType *)self _barCornerRadiusForCurrentDevice];
  -[HKBarSeries setCornerRadii:](v5, "setCornerRadii:");
  id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  id v9 = +[HKStrokeStyle strokeStyleWithColor:v8 lineWidth:3.0];
  [(HKBarSeries *)v5 setTiledStrokeStyle:v9];
  id v10 = [v4 fillStyle];

  [(HKBarSeries *)v5 setUnselectedFillStyle:v10];
  int v11 = objc_alloc_init(HKSolidFillStyle);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_otherSecondaryColor");
  [(HKSolidFillStyle *)v11 setColor:v12];

  uint64_t v13 = objc_alloc_init(HKBarSeriesConfiguration);
  [(HKBarSeriesConfiguration *)v13 setUnselectedFillStyle:v11];
  [(HKBarSeriesConfiguration *)v13 setIsIncludedBlock:&__block_literal_global_5];
  v14 = [(HKBarSeries *)v5 overrideConfigurations];
  [v14 addObject:v13];

  return v5;
}

uint64_t __81__HKDisplayType_HKGraphSeries___generateHandwashingBarSeriesWithDisplayCategory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInfo];
  double v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 meetsGoal] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_generateStackedSeriesWithColor:(id)a3 numericAxisConfigurationOverrides:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HKHorizontalTimePeriodSeries);
  [(HKHorizontalTimePeriodSeries *)v8 setFillColor:v7];

  [(HKHorizontalTimePeriodSeries *)v8 setLineWidth:HKUIOnePixel() + 9.0];
  id v9 = [(HKDisplayType *)self hk_enumeratedValueLabels];
  [(HKHorizontalTimePeriodSeries *)v8 setValueLabels:v9];

  id v10 = [(HKDisplayType *)self hk_valueOrderForStackedCharts];
  [(HKHorizontalTimePeriodSeries *)v8 setEnumerationValueOrdering:v10];

  int v11 = HKHealthKeyColor();
  uint64_t v12 = +[HKChartSeriesPointMarker chartPointWithColor:v11 radius:0 style:HKUIOnePixel() + 5.0];
  [(HKHorizontalTimePeriodSeries *)v8 setSelectedPointMarkerImage:v12];

  [v6 setLabelDataSource:v8];
  return v8;
}

- (id)_generateSingleLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 numericAxisConfigurationOverrides:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(HKHorizontalSingleLineSeries);
  if (a4 != 6)
  {
    int v11 = [(HKDisplayType *)self chartingRules];
    uint64_t v12 = [v11 shouldConnectSamplesWithLines];

    [(HKHorizontalSingleLineSeries *)v10 setShouldConnectPoints:v12];
  }
  [(HKHorizontalSingleLineSeries *)v10 setBaseColor:v8];
  uint64_t v13 = HKHealthKeyColor();
  v14 = +[HKChartSeriesPointMarker chartPointWithColor:v13 radius:0 style:HKUIOnePixel() + 5.0];
  [(HKHorizontalSingleLineSeries *)v10 setSelectedPointMarkerImage:v14];

  [v9 setLabelDataSource:v10];
  return v10;
}

- (id)_generateLevelCategorySeriesWithColor:(id)a3 numericAxisConfigurationOverrides:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HKLevelCategoryTimePeriodSeries);
  id v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  [(HKLevelCategoryTimePeriodSeries *)v8 setCategoryLevelFont:v9];

  id v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLightGrayTextColor");
  [(HKLevelCategoryTimePeriodSeries *)v8 setCategoryLevelColor:v10];

  [(HKHorizontalTimePeriodSeries *)v8 setFillColor:v7];
  int v11 = [(HKDisplayType *)self hk_enumeratedValueLabels];
  [(HKHorizontalTimePeriodSeries *)v8 setValueLabels:v11];

  uint64_t v12 = [(HKDisplayType *)self hk_valueOrderForStackedCharts];
  [(HKHorizontalTimePeriodSeries *)v8 setEnumerationValueOrdering:v12];

  uint64_t v13 = HKHealthKeyColor();
  v14 = +[HKChartSeriesPointMarker chartPointWithColor:v13 radius:0 style:HKUIOnePixel() + 5.0];
  [(HKHorizontalTimePeriodSeries *)v8 setSelectedPointMarkerImage:v14];

  [(HKLevelCategoryTimePeriodSeries *)v8 setMarkerRadius:4.0];
  id v15 = [(HKDisplayType *)self chartingRules];

  if (v15)
  {
    double v16 = [(HKDisplayType *)self chartingRules];
    -[HKLevelCategoryTimePeriodSeries setDrawSampleSpans:](v8, "setDrawSampleSpans:", [v16 shouldConnectSamplesWithLines]);
  }
  [v6 setLabelDataSource:v8];

  return v8;
}

- (id)_generateJulianIndexedSevenDayQuantitySeriesWithColor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[HKJulianIndexedSevenDayQuantitySeries alloc] initWithColor:v3 lineWidth:6.0];

  return v4;
}

- (id)_generateAFibBurdenLineSeriesWithColor:(id)a3
{
  id v3 = [(HKDisplayType *)self generateLineSeriesWithColor:a3 timeScope:3];
  [v3 setMaximumConnectionDistance:&unk_1F3C22940];
  return v3;
}

- (void)_assignAFibBurdenAxisForSeries:(id)a3 standardAxisConfiguration:(id)a4 externalAxisConfigurationOverrides:(id)a5
{
  if (!a5)
  {
    id v7 = a4;
    id v8 = a3;
    id v10 = objc_alloc_init(HKNumericAxisConfiguration);
    [(HKNumericAxisConfiguration *)v10 applyOverridesFromNumericAxisConfiguration:v7];

    [(HKAxisConfiguration *)v10 setMinLabels:5];
    [(HKAxisConfiguration *)v10 setMaxLabels:5];
    id v9 = +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:v10];
    [v8 setYAxis:v9];
  }
}

- (void)_assignWalkingAsymmetryPercentageAxisForSeries:(id)a3 standardAxisConfiguration:(id)a4 externalAxisConfigurationOverrides:(id)a5
{
  if (!a5)
  {
    id v7 = a4;
    id v8 = a3;
    id v10 = objc_alloc_init(HKNumericAxisConfiguration);
    [(HKNumericAxisConfiguration *)v10 applyOverridesFromNumericAxisConfiguration:v7];

    [(HKNumericAxisConfiguration *)v10 setTopVerticalLabelPadding:HKUIOnePixel() + 4.0];
    id v9 = +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:v10];
    [v8 setYAxis:v9];
  }
}

- (id)_generateRelativeLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 valueAxisAnnotationFormatter:(id)a5 chartSizeClass:(int64_t)a6
{
  id v10 = a3;
  int v11 = [(HKDisplayType *)self generateLineSeriesWithColor:v10 timeScope:a4 valueAxisAnnotationFormatter:a5];
  uint64_t v12 = [HKRelativeLineSeries alloc];
  uint64_t v13 = [MEMORY[0x1E4FB1618] systemGray3Color];
  id v14 = [(HKRelativeLineSeries *)v12 initFromLineSeries:v11 color:v10 unavailableColor:v13 indeterminateLozengeLineWidth:a6 chartSizeClass:6.0];

  return v14;
}

- (id)_generateAbnormalBreathingSeriesWithDisplayCategory:(id)a3 timeScope:(int64_t)a4
{
  id v6 = [a3 color];
  id v7 = [(HKDisplayType *)self generateLineSeriesWithColor:v6 timeScope:a4];

  id v8 = [[HKBreathingDisturbancesAxis alloc] initWithDisplayType:self];
  [v7 setYAxis:v8];

  return v7;
}

- (id)_generateGraphSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 standardAxisConfiguration:(id)a6 externalAxisConfigurationOverrides:(id)a7 chartSizeClass:(int64_t)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([(HKDisplayType *)self displayTypeIdentifier] == 286) {
    goto LABEL_2;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 15)
  {
LABEL_5:
    id v18 = [v15 unitForDisplayType:self];
    id v19 = [(HKDisplayType *)self hk_numberFormatterForUnit:v18];
    uint64_t v25 = [v14 color];
    v24 = [(HKDisplayType *)self generateDistributionSeriesWithColor:v25 numberFormatter:v19 hasMinMaxOverlay:[(HKDisplayType *)self hk_supportsMinMaxOverlayForChartSizeClass:a8]];

    goto LABEL_6;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 80)
  {
    id v18 = [v14 color];
    uint64_t v29 = [(HKDisplayType *)self _generateBloodPressureSeriesWithColor:v18];
LABEL_13:
    v24 = (void *)v29;
    goto LABEL_7;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 125)
  {
    id v30 = [(HKDisplayType *)self _generateInsulinBarSeriesWithDisplayCategory];
LABEL_16:
    v24 = v30;
    goto LABEL_8;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 5
    || [(HKDisplayType *)self displayTypeIdentifier] == 172
    || [(HKDisplayType *)self displayTypeIdentifier] == 173
    || [(HKDisplayType *)self displayTypeIdentifier] == 272)
  {
    id v18 = [v14 color];
    objc_msgSend(MEMORY[0x1E4F28EE0], "hk_wholeNumberFormatter");
    id v19 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    BOOL v20 = [(HKDisplayType *)self hk_supportsMinMaxOverlayForChartSizeClass:a8];
    id v21 = self;
    id v22 = v18;
    v23 = v19;
    goto LABEL_3;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 237)
  {
    id v30 = [(HKDisplayType *)self _generateHandwashingBarSeriesWithDisplayCategory:v14];
    goto LABEL_16;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 14)
  {
    id v18 = [[HKDisplayTypeNumberFormatter alloc] initWithDisplayType:self unitController:v15];
    uint64_t v31 = [v14 color];
    v24 = [(HKDisplayType *)self generateDistributionSeriesWithColor:v31 numberFormatter:v18 hasMinMaxOverlay:[(HKDisplayType *)self hk_supportsMinMaxOverlayForChartSizeClass:a8]];

    [v24 setZeroCountForGap:5];
    goto LABEL_7;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 248)
  {
    v32 = [v14 color];
    if (a3 == 3) {
      [(HKDisplayType *)self _generateAFibBurdenLineSeriesWithColor:v32];
    }
    else {
    v24 = [(HKDisplayType *)self _generateJulianIndexedSevenDayQuantitySeriesWithColor:v32];
    }

    [(HKDisplayType *)self _assignAFibBurdenAxisForSeries:v24 standardAxisConfiguration:v16 externalAxisConfigurationOverrides:v17];
    goto LABEL_8;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 61) {
    goto LABEL_5;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 194)
  {
    uint64_t v33 = [(HKDisplayType *)self chartingRules];
    v24 = -[HKDisplayType _generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:](self, "_generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:", [v33 chartStyleForTimeScope:a3], a3, a8, v16, v14, v15);

    [(HKDisplayType *)self _assignWalkingAsymmetryPercentageAxisForSeries:v24 standardAxisConfiguration:v16 externalAxisConfigurationOverrides:v17];
    goto LABEL_8;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 182)
  {
LABEL_2:
    id v18 = [[HKDisplayTypeNumberFormatter alloc] initWithDisplayType:self unitController:v15];
    id v19 = [v14 color];
    BOOL v20 = [(HKDisplayType *)self hk_supportsMinMaxOverlayForChartSizeClass:a8];
    id v21 = self;
    id v22 = v19;
    v23 = v18;
LABEL_3:
    v24 = [(HKDisplayType *)v21 generateDistributionSeriesWithColor:v22 numberFormatter:v23 hasMinMaxOverlay:v20];
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 269
    || [(HKDisplayType *)self displayTypeIdentifier] == 277)
  {
    id v18 = [v14 color];
    uint64_t v29 = [(HKDisplayType *)self _generateMinMaxSeriesWithColor:v18 opacity:0 unselectedPointStyle:0 selectedPointStyle:1.0];
    goto LABEL_13;
  }
  if ([(HKDisplayType *)self displayTypeIdentifier] == 187
    || [(HKDisplayType *)self displayTypeIdentifier] == 188
    || [(HKDisplayType *)self displayTypeIdentifier] == 195
    || [(HKDisplayType *)self displayTypeIdentifier] == 196)
  {
    v34 = objc_alloc_init(HKTieredDecimalPrecisionRule);
    uint64_t v35 = [(HKTieredDecimalPrecisionRule *)v34 numberFormatter];

    v36 = [v14 color];
    v24 = [(HKDisplayType *)self generateDistributionSeriesWithColor:v36 numberFormatter:v35 hasMinMaxOverlay:[(HKDisplayType *)self hk_supportsMinMaxOverlayForChartSizeClass:a8]];
  }
  else
  {
    if ([(HKDisplayType *)self displayTypeIdentifier] == 249)
    {
      uint64_t v35 = [v14 color];
      uint64_t v37 = +[HKMobilityUtilities generateAppleWalkingSteadinessSeriesForTimeScope:a3 displayType:self color:v35];
    }
    else
    {
      if ([(HKDisplayType *)self displayTypeIdentifier] == 256)
      {
        uint64_t v35 = [v14 color];
        v38 = objc_alloc_init(HKRelativeNumberFormatter);
        v24 = [(HKDisplayType *)self _generateRelativeLineSeriesWithColor:v35 timeScope:a3 valueAxisAnnotationFormatter:v38 chartSizeClass:a8];

        goto LABEL_43;
      }
      if ([(HKDisplayType *)self displayTypeIdentifier] == 284)
      {
        id v30 = +[HKStateOfMindSeries standardStateOfMindSeriesWithStateOfMindDisplayType:self unitController:v15];
        goto LABEL_16;
      }
      if ([(HKDisplayType *)self displayTypeIdentifier] == 275)
      {
        id v30 = [(HKDisplayType *)self _generateAbnormalBreathingSeriesWithDisplayCategory:v14 timeScope:a3];
        goto LABEL_16;
      }
      if ([(HKDisplayType *)self displayTypeIdentifier] == 305)
      {
        if (a3 == 6) {
          v39 = HKBalanceDaySeries;
        }
        else {
          v39 = HKBalanceSeries;
        }
        id v30 = objc_alloc_init(v39);
        goto LABEL_16;
      }
      if ([(HKDisplayType *)self displayTypeIdentifier] == 191)
      {
        objc_msgSend(MEMORY[0x1E4FB1618], "hk_pregnancyKeyColor");
        id v18 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [(HKDisplayType *)self _generateLevelCategorySeriesWithColor:v18 numericAxisConfigurationOverrides:v16];
        goto LABEL_13;
      }
      uint64_t v35 = [(HKDisplayType *)self chartingRules];
      uint64_t v37 = -[HKDisplayType _generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:](self, "_generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:", [v35 chartStyleForTimeScope:a3], a3, a8, v16, v14, v15);
    }
    v24 = (void *)v37;
  }
LABEL_43:

LABEL_8:
  v26 = [v14 color];
  [v24 setOffScreenIndicatorColor:v26];

  uint64_t v27 = [(HKDisplayType *)self chartingRules];
  objc_msgSend(v24, "setWantsRoundingDuringYRangeExpansion:", objc_msgSend(v27, "shouldRoundYAxisDuringExpansion"));

  return v24;
}

- (id)_generateStandardSeriesForChartStyle:(int64_t)a3 timeScope:(int64_t)a4 chartSizeClass:(int64_t)a5 axisConfiguration:(id)a6 displayCategory:(id)a7 unitController:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  switch(a3)
  {
    case 1:
      id v17 = [v15 color];
      uint64_t v18 = [(HKDisplayType *)self generateLineSeriesWithColor:v17 timeScope:a4];
      goto LABEL_10;
    case 2:
      id v17 = [v15 color];
      uint64_t v18 = [(HKDisplayType *)self generateScatterPlotSeriesWithColor:v17];
      goto LABEL_10;
    case 3:
      id v17 = [v15 color];
      uint64_t v18 = [(HKDisplayType *)self _generateMinMaxSeriesWithColor:v17 opacity:1 unselectedPointStyle:0 selectedPointStyle:0.3];
      goto LABEL_10;
    case 4:
      id v17 = [v15 fillStyle];
      uint64_t v18 = [(HKDisplayType *)self _generateBarSeriesWithFillStyle:v17];
      goto LABEL_10;
    case 5:
    case 6:
      id v17 = [v15 color];
      uint64_t v18 = [(HKDisplayType *)self _generateStackedSeriesWithColor:v17 numericAxisConfigurationOverrides:v14];
      goto LABEL_10;
    case 7:
      id v17 = [v15 color];
      uint64_t v18 = [(HKDisplayType *)self _generateSingleLineSeriesWithColor:v17 timeScope:a4 numericAxisConfigurationOverrides:v14];
      goto LABEL_10;
    case 8:
      id v17 = [v15 color];
      uint64_t v18 = [(HKDisplayType *)self _generateLevelCategorySeriesWithColor:v17 numericAxisConfigurationOverrides:v14];
LABEL_10:
      id v19 = (void *)v18;
      goto LABEL_11;
    case 9:
      id v17 = [v15 color];
      id v21 = [[HKDisplayTypeNumberFormatter alloc] initWithDisplayType:self unitController:v16];
      id v19 = [(HKDisplayType *)self generateDistributionSeriesWithColor:v17 numberFormatter:v21 hasMinMaxOverlay:[(HKDisplayType *)self hk_supportsMinMaxOverlayForChartSizeClass:a5]];

LABEL_11:
      break;
    default:
      id v19 = 0;
      break;
  }

  return v19;
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6
{
  return [(HKDisplayType *)self hk_standardSeriesForTimeScope:a3 displayCategory:a4 unitController:a5 dataCacheController:a6 numericAxisConfigurationOverrides:0];
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6 numericAxisConfigurationOverrides:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(HKDisplayType *)self _dataSourceForTimeScope:a3 dataCacheController:v13];
  id v17 = [(HKDisplayType *)self hk_standardSeriesForTimeScope:a3 graphSeriesDataSource:v16 displayCategory:v15 unitController:v14 dataCacheController:v13 numericAxisConfigurationOverrides:v12];

  return v17;
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6 numericAxisConfigurationOverrides:(id)a7 chartSizeClass:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  uint64_t v18 = [(HKDisplayType *)self _dataSourceForTimeScope:a3 dataCacheController:v15];
  id v19 = [(HKDisplayType *)self hk_standardSeriesForTimeScope:a3 graphSeriesDataSource:v18 displayCategory:v17 unitController:v16 dataCacheController:v15 numericAxisConfigurationOverrides:v14 chartSizeClass:a8];

  return v19;
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7
{
  return [(HKDisplayType *)self hk_standardSeriesForTimeScope:a3 graphSeriesDataSource:a4 displayCategory:a5 unitController:a6 dataCacheController:a7 numericAxisConfigurationOverrides:0];
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7 numericAxisConfigurationOverrides:(id)a8
{
  return [(HKDisplayType *)self hk_standardSeriesForTimeScope:a3 graphSeriesDataSource:a4 displayCategory:a5 unitController:a6 dataCacheController:a7 numericAxisConfigurationOverrides:a8 chartSizeClass:0];
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7 numericAxisConfigurationOverrides:(id)a8 chartSizeClass:(int64_t)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = [(HKDisplayType *)self chartingRules];
  uint64_t v19 = [v18 chartStyleForTimeScope:a3];

  BOOL v20 = objc_alloc_init(HKNumericAxisConfiguration);
  id v21 = [(HKDisplayType *)self hk_dimensionForChartAxisWithUnitController:v16];
  [(HKNumericAxisConfiguration *)v20 setLabelDimension:v21];

  if (!+[HKDisplayTypeChartingRules chartStyleContainsHorizontalGridlines:v19])[(HKAxisConfiguration *)v20 setOverrideNoTopBaseline:1]; {
  id v22 = [(HKDisplayType *)self chartingRules];
  }
  v23 = [v22 maximumYAxisLabelCount];

  if (v23)
  {
    v24 = [(HKDisplayType *)self chartingRules];
    uint64_t v25 = [v24 maximumYAxisLabelCount];
    -[HKAxisConfiguration setMaxLabels:](v20, "setMaxLabels:", [v25 integerValue]);
  }
  v26 = [(HKDisplayType *)self chartingRules];
  uint64_t v27 = [v26 maximumYAxisLabelWidth];

  if (v27)
  {
    v28 = [(HKDisplayType *)self chartingRules];
    uint64_t v29 = [v28 maximumYAxisLabelWidth];
    [(HKAxisConfiguration *)v20 setMaxLabelWidth:v29];
  }
  if (v17) {
    [(HKNumericAxisConfiguration *)v20 applyOverridesFromNumericAxisConfiguration:v17];
  }
  if (v14)
  {
    id v30 = [(HKDisplayType *)self _generateGraphSeriesForTimeScope:a3 displayCategory:v15 unitController:v16 standardAxisConfiguration:v20 externalAxisConfigurationOverrides:v17 chartSizeClass:a9];
    uint64_t v31 = +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:v20];
    v32 = [v30 yAxis];

    if (!v32) {
      [v30 setYAxis:v31];
    }
    [v30 setDataSource:v14];
    uint64_t v33 = [(HKDisplayType *)self hk_axisScalingRuleForChartSizeClass:a9 unitController:v16];
    [v30 setAxisScalingRule:v33];
    v34 = [(HKDisplayType *)self presentation];
    objc_msgSend(v30, "setIsCriticalForAutoscale:", objc_msgSend(v34, "isCriticalForAutoscale"));

    uint64_t v35 = [(HKDisplayType *)self chartingRules];
    objc_msgSend(v30, "setInvertYAxis:", objc_msgSend(v35, "shouldInvertYAxis"));
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (id)hk_axisScalingRuleForChartSizeClass:(int64_t)a3 unitController:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    && ([(HKDisplayType *)self chartingRules],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 compactChartAxisScalingRule],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [(HKDisplayType *)self chartingRules];
    uint64_t v10 = [v9 compactChartAxisScalingRule];
  }
  else
  {
    id v9 = [(HKDisplayType *)self chartingRules];
    uint64_t v10 = [v9 axisScalingRule];
  }
  int v11 = (void *)v10;

  id v12 = [v6 unitForChartingDisplayType:self];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 setUnit:v12];
  }

  return v11;
}

- (BOOL)hk_supportsMinMaxOverlayForChartSizeClass:(int64_t)a3
{
  return a3 != 1;
}

- (int64_t)hk_stackedChartSectionsCountForTimeScope:(int64_t)a3
{
  uint64_t v5 = [(HKDisplayType *)self chartingRules];
  if ([v5 chartStyleForTimeScope:a3] == 7)
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [(HKDisplayType *)self hk_enumeratedValueLabels];
    uint64_t v8 = [v7 count];
    if (v8 <= 1) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = v8;
    }
  }
  return v6;
}

- (BOOL)hk_isSupportedTimeScope:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      BOOL result = [(HKDisplayType *)self _supportsTenYearTimeScope];
      break;
    case 1:
      BOOL result = [(HKDisplayType *)self _supportsFiveYearTimeScope];
      break;
    case 2:
      BOOL result = [(HKDisplayType *)self _supportsYearTimeScope];
      break;
    case 3:
      BOOL result = [(HKDisplayType *)self _supportsSixMonthTimeScope];
      break;
    case 4:
      BOOL result = [(HKDisplayType *)self _supportsMonthTimeScope];
      break;
    case 5:
      BOOL result = [(HKDisplayType *)self _supportsWeekTimeScope];
      break;
    case 6:
      BOOL result = [(HKDisplayType *)self _supportsDayTimeScope];
      break;
    case 7:
      BOOL result = [(HKDisplayType *)self _supportsHourTimeScope];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)_supportsHourTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] >> 7) & 1;
}

- (BOOL)_supportsDayTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] & 0x400) == 0;
}

- (BOOL)_supportsWeekTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] & 0x8000) == 0;
}

- (BOOL)_supportsSixMonthTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] & 0x4000) == 0;
}

- (BOOL)_supportsMonthTimeScope
{
  return 1;
}

- (BOOL)_supportsYearTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] & 0x200) == 0;
}

- (BOOL)_supportsFiveYearTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] >> 8) & 1;
}

- (BOOL)_supportsTenYearTimeScope
{
  return ([(HKDisplayType *)self hk_interactiveChartOptions] >> 21) & 1;
}

- (BOOL)contextItemShouldUseTightSpacingBetweenValueAndUnit
{
  id v3 = [(HKDisplayType *)self objectType];
  uint64_t v4 = objc_msgSend(v3, "hk_valueFormatterClass");

  if (v4 == objc_opt_class()) {
    return 1;
  }
  uint64_t v5 = [(HKDisplayType *)self objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v7 = [(HKDisplayType *)self objectType];
  uint64_t v8 = [v7 canonicalUnit];
  id v9 = [MEMORY[0x1E4F2B618] degreeCelsiusUnit];
  char v10 = [v8 _isCompatibleWithUnit:v9];

  return (v10 & 1) != 0;
}

- (BOOL)contextItemShouldDisplayEventCountForDistributionStyle:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xB8u >> a3);
}

- (id)copyWithPresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(HKDisplayType *)self copy];
  uint64_t v6 = [v4 copy];

  id v7 = (void *)v5[10];
  v5[10] = v6;

  uint64_t v8 = (void *)v5[3];
  v5[3] = 0;

  id v9 = (void *)v5[4];
  v5[4] = 0;

  return v5;
}

- (id)copyWithDefaultAxisRangeOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(HKDisplayType *)self copy];
  uint64_t v6 = (void *)v5[13];
  v5[13] = v4;

  return v5;
}

- (id)copyWithIsWheelchairUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HKDisplayType *)self copy];
  *(unsigned char *)(v5 + 40) = v3;
  localization = self->_localization;
  id v7 = [(HKDisplayType *)self localizedStringSuffixForWheelchairUser:v3];
  uint64_t v8 = [(HKDisplayTypeLocalization *)localization copyWithLocalizedKeySuffix:v7];
  id v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  return (id)v5;
}

- (NSString)displayTypeIdentifierString
{
  BOOL v3 = HKDisplayTypeIdentifierToString([(HKDisplayType *)self displayTypeIdentifier]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownDisplayType(%ld)", -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (id)color
{
  uint64_t v2 = +[HKDisplayCategory categoryWithID:[(HKDisplayType *)self categoryIdentifier]];
  BOOL v3 = [v2 color];

  return v3;
}

- (id)defaultValuePredicate
{
  return self->_defaultChartingPredicate;
}

- (id)chartingPredicateForTimeScope:(int64_t)a3
{
  chartingPredicatesByTimeScope = self->_chartingPredicatesByTimeScope;
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [(NSDictionary *)chartingPredicatesByTimeScope objectForKeyedSubscript:v5];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    if (v6)
    {
      id v10 = v6;
    }
    else
    {
      id v10 = [(HKDisplayType *)self defaultValuePredicate];
    }
    id v9 = v10;
  }

  return v9;
}

- (id)unitNameForValue:(id)a3 unitPreferenceController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [v6 unitForDisplayType:self];
  id v9 = [v6 localizedDisplayNameForUnit:v8 value:v7];

  return v9;
}

- (UIImage)detailImage
{
  detailImage = self->_detailImage;
  if (!detailImage)
  {
    id v4 = [(HKDisplayType *)self presentation];
    id v5 = [v4 detailImageName];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4FB1818];
      id v7 = [(HKDisplayType *)self presentation];
      char v8 = [v7 detailImageName];
      id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v10 = [v6 imageNamed:v8 inBundle:v9];
      int v11 = self->_detailImage;
      self->_detailImage = v10;
    }
    else
    {
      id v7 = self->_detailImage;
      self->_detailImage = 0;
    }

    detailImage = self->_detailImage;
  }
  return detailImage;
}

- (HKSampleType)recordSampleType
{
  if ([(HKDisplayType *)self isActivitySummary]) {
    [MEMORY[0x1E4F2B448] dataTypeWithCode:76];
  }
  else {
  BOOL v3 = [(HKDisplayType *)self sampleType];
  }
  return (HKSampleType *)v3;
}

- (BOOL)isCharacteristic
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isActivitySummary
{
  return [(HKDisplayType *)self displayTypeIdentifier] == 100;
}

- (BOOL)isDocument
{
  return objc_opt_isKindOfClass() & 1;
}

- (UIImage)listIcon
{
  if (!self->_listIcon)
  {
    BOOL v3 = [(HKDisplayType *)self presentation];
    id v4 = [v3 listIconImageNameOverride];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x1E4FB1818];
      id v6 = [(HKDisplayType *)self presentation];
      id v7 = [v6 listIconImageNameOverride];
      char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v9 = [v5 imageNamed:v7 inBundle:v8];
      listIcon = self->_listIcon;
      self->_listIcon = v9;
    }
    else
    {
      id v6 = [(HKDisplayType *)self displayCategory];
      int v11 = [v6 listIcon];
      id v7 = self->_listIcon;
      self->_listIcon = v11;
    }
  }
  id v12 = self->_listIcon;
  return v12;
}

- (NSString)listIconImageName
{
  BOOL v3 = [(HKDisplayType *)self presentation];
  id v4 = [v3 listIconImageNameOverride];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(HKDisplayType *)self displayCategory];
    id v6 = [v7 listIconName];
  }
  return (NSString *)v6;
}

- (NSArray)secondaryDisplayCategories
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(HKDisplayType *)self secondaryCategoryIdentifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HKDisplayType_secondaryDisplayCategories__block_invoke;
  v7[3] = &unk_1E6D511B8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __43__HKDisplayType_secondaryDisplayCategories__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", (int)[a2 intValue]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (unint64_t)hash
{
  uint64_t v2 = [NSNumber numberWithInteger:self->_displayTypeIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t displayTypeIdentifier = self->_displayTypeIdentifier;
    BOOL v6 = displayTypeIdentifier == [v4 displayTypeIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKDisplayType;
  id v4 = [(HKDisplayType *)&v8 description];
  id v5 = HKDisplayTypeIdentifierToString(self->_displayTypeIdentifier);
  BOOL v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (HKValueRange)defaultAxisRangeOverride
{
  return self->_defaultAxisRangeOverride;
}

- (BOOL)_isWheelchairUser
{
  return self->__wheelchairUser;
}

- (void)_setWheelchairUser:(BOOL)a3
{
  self->__wheelchairUser = a3;
}

- (id)generateLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  id v7 = HKIntegerFormatter();
  objc_super v8 = [(HKDisplayType *)self generateLineSeriesWithColor:v6 timeScope:a4 valueAxisAnnotationFormatter:v7];

  return v8;
}

- (id)generateLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 valueAxisAnnotationFormatter:(id)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v44 = a5;
  objc_super v8 = objc_alloc_init(HKLineSeries);
  id v9 = [HKGradientFillStyle alloc];
  id v10 = HKHealthKeyColor();
  int v11 = [v10 colorWithAlphaComponent:0.3];
  id v12 = HKHealthKeyColor();
  id v13 = [v12 colorWithAlphaComponent:0.0];
  uint64_t v14 = [(HKGradientFillStyle *)v9 initWithFirstColor:v11 secondColor:v13];

  v46 = objc_alloc_init(HKLineSeriesPresentationStyle);
  id v15 = +[HKStrokeStyle strokeStyleWithColor:v7 lineWidth:2.0];
  [(HKLineSeriesPresentationStyle *)v46 setStrokeStyle:v15];

  [(HKLineSeriesPresentationStyle *)v46 setWaveForm:0];
  id v16 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v47 = v7;
  id v17 = +[HKStrokeStyle strokeStyleWithColor:v7 lineWidth:2.0];
  [(HKLineSeriesPresentationStyle *)v16 setStrokeStyle:v17];

  [(HKLineSeriesPresentationStyle *)v16 setWaveForm:0];
  uint64_t v18 = objc_alloc_init(HKLineSeriesPresentationStyle);
  uint64_t v19 = HKHealthKeyColor();
  BOOL v20 = +[HKStrokeStyle strokeStyleWithColor:v19 lineWidth:2.0];
  [(HKLineSeriesPresentationStyle *)v18 setStrokeStyle:v20];

  id v21 = [HKLineSeriesPointMarkerStyle alloc];
  id v22 = HKHealthKeyColor();
  uint64_t v23 = [(HKLineSeriesPointMarkerStyle *)v21 initWithColor:v22 radius:0 style:4.0];

  v42 = (void *)v23;
  [(HKLineSeriesPresentationStyle *)v18 setPointMarkerStyle:v23];
  v43 = (void *)v14;
  [(HKLineSeriesPresentationStyle *)v18 setFillStyle:v14];
  [(HKLineSeriesPresentationStyle *)v18 setWaveForm:0];
  v24 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v45 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
  uint64_t v25 = +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", 2.0);
  [(HKLineSeriesPresentationStyle *)v24 setStrokeStyle:v25];

  v26 = [(HKDisplayType *)self chartingRules];
  -[HKLineSeries setFlatLastValue:](v8, "setFlatLastValue:", [v26 lineChartFlatLastValueForTimeScope:a4]);
  -[HKLineSeries setExtendLastValue:](v8, "setExtendLastValue:", [v26 lineChartExtendLastValueForTimeScope:a4]);
  -[HKLineSeries setExtendFirstValue:](v8, "setExtendFirstValue:", [v26 lineChartExtendFirstValueForTimeScope:a4]);
  int64_t v27 = a4;
  int64_t v28 = a4;
  uint64_t v29 = v24;
  if ([v26 lineChartUsesPointMarkerImageForTimeScope:v28])
  {
    id v30 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v47 radius:1 style:4.0];
    [(HKLineSeriesPresentationStyle *)v46 setPointMarkerStyle:v30];
    [(HKLineSeriesPresentationStyle *)v16 setPointMarkerStyle:v30];
    uint64_t v31 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v45 radius:1 style:4.0];
    [(HKLineSeriesPresentationStyle *)v29 setPointMarkerStyle:v31];
    v32 = [HKLineSeriesPointMarkerStyle alloc];
    uint64_t v33 = HKHealthKeyColor();
    v34 = [(HKLineSeriesPointMarkerStyle *)v32 initWithColor:v33 radius:0 style:HKUIOnePixel() + 5.0];

    [(HKLineSeries *)v8 setSelectedPointMarkerStyle:v34];
  }
  if ([v26 lineChartUsesValueAxisAnnotationForTimeScope:v27])
  {
    uint64_t v35 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E4FB09D0]);
    v36 = +[HKAxisLabelStyle labelStyleWithColor:v47 font:v35 horizontalAlignment:0 verticalAlignment:2 numberFormatter:v44];
    [(HKLineSeriesPresentationStyle *)v46 setAxisAnnotationStyle:v36];
    [(HKLineSeriesPresentationStyle *)v16 setAxisAnnotationStyle:v36];
    [(HKLineSeriesPresentationStyle *)v18 setAxisAnnotationStyle:v36];
  }
  v50[0] = v46;
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  [(HKLineSeries *)v8 setUnhighlightedPresentationStyles:v37];

  v49 = v16;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  [(HKLineSeries *)v8 setHighlightedPresentationStyles:v38];

  v48 = v18;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  [(HKLineSeries *)v8 setSelectedPresentationStyles:v39];

  [(HKLineSeries *)v8 setInactivePresentationStyle:v29];
  return v8;
}

- (id)generateScatterPlotSeriesWithColor:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(HKLineSeries);
  id v5 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v3 radius:1 style:4.0];

  id v6 = [HKLineSeriesPointMarkerStyle alloc];
  id v7 = HKHealthKeyColor();
  objc_super v8 = [(HKLineSeriesPointMarkerStyle *)v6 initWithColor:v7 radius:0 style:4.0];

  id v9 = objc_alloc_init(HKLineSeriesPresentationStyle);
  [(HKLineSeriesPresentationStyle *)v9 setPointMarkerStyle:v5];
  id v10 = objc_alloc_init(HKLineSeriesPresentationStyle);
  [(HKLineSeriesPresentationStyle *)v10 setPointMarkerStyle:v8];
  v21[0] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(HKLineSeries *)v4 setUnhighlightedPresentationStyles:v11];

  BOOL v20 = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [(HKLineSeries *)v4 setSelectedPresentationStyles:v12];

  id v13 = [HKLineSeriesPointMarkerStyle alloc];
  uint64_t v14 = HKHealthKeyColor();
  id v15 = [(HKLineSeriesPointMarkerStyle *)v13 initWithColor:v14 radius:0 style:HKUIOnePixel() + 5.0];
  [(HKLineSeries *)v4 setSelectedPointMarkerStyle:v15];

  id v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
  id v17 = objc_alloc_init(HKLineSeriesPresentationStyle);
  uint64_t v18 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v16 radius:1 style:4.0];
  [(HKLineSeriesPresentationStyle *)v17 setPointMarkerStyle:v18];

  [(HKLineSeries *)v4 setInactivePresentationStyle:v17];
  return v4;
}

- (id)generateDistributionSeriesWithColor:(id)a3 numberFormatter:(id)a4 hasMinMaxOverlay:(BOOL)a5
{
  return [(HKDisplayType *)self generateDistributionSeriesWithColor:a3 numberFormatter:a4 lineWidth:a5 hasMinMaxOverlay:7.0];
}

- (id)generateDistributionSeriesWithColor:(id)a3 numberFormatter:(id)a4 lineWidth:(double)a5 hasMinMaxOverlay:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  int v11 = objc_alloc_init(HKQuantityDistributionSeries);
  id v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartInactiveSeriesColor");
  id v13 = +[HKStrokeStyle strokeStyleWithColor:v12 lineWidth:a5];
  [v13 setLineCap:1];
  [(HKQuantityDistributionSeries *)v11 setInactiveStrokeStyle:v13];
  id v14 = v9;
  id v15 = +[HKStrokeStyle strokeStyleWithColor:v14 lineWidth:a5];
  [v15 setLineCap:1];
  [(HKQuantityDistributionSeries *)v11 setUnselectedStrokeStyle:v15];
  id v16 = +[HKStrokeStyle strokeStyleWithColor:v14 lineWidth:a5];
  [v16 setLineCap:1];
  [(HKQuantityDistributionSeries *)v11 setSelectedStrokeStyle:v16];
  if (v6)
  {
    id v17 = (void *)MEMORY[0x1E4FB08E0];
    double v18 = *MEMORY[0x1E4FB09E0];
    id v28 = v10;
    id v19 = v14;
    v26 = objc_msgSend(v17, "hk_roundedSystemFontWithSize:weight:", 13.0, v18);
    +[HKAxisLabelStyle labelStyleWithColor:v19 font:v26 horizontalAlignment:1 verticalAlignment:2];
    BOOL v20 = v27 = v12;
    [(HKQuantityDistributionSeries *)v11 setMinMaxLabelStyle:v20];
    id v21 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E4FB09D0]);
    id v22 = +[HKAxisLabelStyle labelStyleWithColor:v19 font:v21 horizontalAlignment:1 verticalAlignment:2 numberFormatter:v28];

    [(HKQuantityDistributionSeries *)v11 setMinMaxValueStyle:v22];
    uint64_t v23 = [MEMORY[0x1E4FB1618] whiteColor];
    v24 = +[HKStrokeStyle strokeStyleWithColor:v23 lineWidth:a5 * 0.5];

    [(HKQuantityDistributionSeries *)v11 setMinMaxPointStyle:v24];
    id v10 = v28;

    id v12 = v27;
  }

  return v11;
}

- (id)cardioFitnessDataSourceWithUnitController:(id)a3 healthStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v7 options:2 displayType:self healthStore:v6];
  id v9 = [v7 unitForDisplayType:self];

  id v25 = 0;
  id v10 = [v6 biologicalSexWithError:&v25];
  id v11 = v25;
  if (!v10)
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      [(HKPopulationNormsAbstractViewModel *)(uint64_t)v11 currentBiologicalSexSegmentIndex];
    }
  }
  id v24 = v11;
  id v13 = [v6 dateOfBirthComponentsWithError:&v24];
  id v14 = v24;

  if (!v13)
  {
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      [(HKPopulationNormsAbstractViewModel *)(uint64_t)v14 currentAgeInYears];
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __84__HKDisplayType_DataSources__cardioFitnessDataSourceWithUnitController_healthStore___block_invoke;
  v20[3] = &unk_1E6D54B10;
  id v21 = v9;
  id v22 = v10;
  id v23 = v13;
  id v16 = v13;
  id v17 = v10;
  id v18 = v9;
  [(HKQuantityTypeDataSource *)v8 setUserInfoCreationBlock:v20];

  return v8;
}

HKInteractiveChartCardioFitnessData *__84__HKDisplayType_DataSources__cardioFitnessDataSourceWithUnitController_healthStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(HKInteractiveChartCardioFitnessData);
  id v5 = [v3 averageQuantity];
  [v5 doubleValueForUnit:*(void *)(a1 + 32)];
  double v7 = v6;

  [(HKInteractiveChartSinglePointData *)v4 setValue:v7];
  [(HKInteractiveChartSinglePointData *)v4 setUnit:*(void *)(a1 + 32)];
  uint64_t v8 = [v3 minQuantity];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v3 maxQuantity];

    if (v10)
    {
      [(HKInteractiveChartSinglePointData *)v4 setRepresentsRange:1];
      id v11 = [v3 minQuantity];
      [v11 doubleValueForUnit:*(void *)(a1 + 32)];
      -[HKInteractiveChartSinglePointData setMinValue:](v4, "setMinValue:");

      id v12 = [v3 maxQuantity];
      [v12 doubleValueForUnit:*(void *)(a1 + 32)];
      -[HKInteractiveChartSinglePointData setMaxValue:](v4, "setMaxValue:");
    }
  }
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", [v3 recordCount]);
  id v13 = [v3 statisticsInterval];
  [(HKInteractiveChartSinglePointData *)v4 setStatisticsInterval:v13];

  id v14 = *(void **)(a1 + 40);
  if (v14 && *(void *)(a1 + 48))
  {
    uint64_t v15 = [v14 biologicalSex];
    id v16 = [v3 statisticsInterval];
    id v17 = [v3 startDate];
    id v18 = [v3 endDate];
    id v19 = +[HKCardioFitnessUtilities effectiveChartPointDateWithStatisticsInterval:v16 startDate:v17 endDate:v18];

    uint64_t v20 = objc_msgSend(*(id *)(a1 + 48), "hk_ageWithCurrentDate:", v19);
    int64_t v21 = +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:v15 biologicalSex:v20 age:v7];
    [(HKInteractiveChartCardioFitnessData *)v4 setBiologicalSex:v15];
    [(HKInteractiveChartCardioFitnessData *)v4 setAge:v20];
    [(HKInteractiveChartCardioFitnessData *)v4 setClassification:v21];
    -[HKInteractiveChartCardioFitnessData setSampleCount:](v4, "setSampleCount:", [v3 recordCount]);
  }
  return v4;
}

- (id)_audioLevelDataSourceForTypeIdentifier:(id)a3 withHealthStore:(id)a4 attenuatesExposureData:(BOOL)a5 unitController:(id)a6
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (id)*MEMORY[0x1E4F2A7F0];
  uint64_t v13 = *MEMORY[0x1E4F2A820];
  v25[0] = *MEMORY[0x1E4F2A7F0];
  v25[1] = v13;
  v25[2] = *MEMORY[0x1E4F2A7F8];
  id v14 = (void *)MEMORY[0x1E4F1C978];
  id v15 = a6;
  id v16 = a4;
  id v17 = [v14 arrayWithObjects:v25 count:3];
  if (([v17 containsObject:v11] & 1) == 0)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKDisplayType+DataSources.m", 97, @"Invalid parameter not satisfying: %@", @"[validIdentifiers containsObject:audioExposureTypeIdentifier]" object file lineNumber description];
  }
  if (v12 == v11 && a5) {
    uint64_t v18 = 5;
  }
  else {
    uint64_t v18 = 1;
  }
  id v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v11];
  uint64_t v20 = [HKQuantityDistributionDataSource alloc];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __123__HKDisplayType_DataSources___audioLevelDataSourceForTypeIdentifier_withHealthStore_attenuatesExposureData_unitController___block_invoke;
  v24[3] = &unk_1E6D54B38;
  v24[4] = self;
  int64_t v21 = [(HKQuantityDistributionDataSource *)v20 initWithQuantityType:v19 unitController:v15 healthStore:v16 contextStyle:0 predicate:0 options:v18 baseDisplayType:self specificStartDate:0 specificEndDate:0 userInfoCreationBlock:v24];

  return v21;
}

HKQuantityDistributionChartPointData *__123__HKDisplayType_DataSources___audioLevelDataSourceForTypeIdentifier_withHealthStore_attenuatesExposureData_unitController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  double v7 = [[HKQuantityDistributionChartPointData alloc] initWithDistributionData:v6 unit:v5 displayType:*(void *)(a1 + 32)];

  return v7;
}

- (id)_singleValueUserInfoBlockWithUnitController:(id)a3 displayType:(id)a4 statisticsOption:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HKDisplayType_DataSources___singleValueUserInfoBlockWithUnitController_displayType_statisticsOption___block_invoke;
  aBlock[3] = &unk_1E6D54B60;
  id v14 = v7;
  id v15 = v8;
  unint64_t v16 = a5;
  id v9 = v8;
  id v10 = v7;
  id v11 = _Block_copy(aBlock);

  return v11;
}

HKInteractiveChartSinglePointData *__103__HKDisplayType_DataSources___singleValueUserInfoBlockWithUnitController_displayType_statisticsOption___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) unitForDisplayType:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5 == 4)
  {
    id v6 = [v3 minQuantity];
  }
  else
  {
    if (v5 != 16)
    {
      id v11 = [v3 averageQuantity];
      [v11 doubleValueForUnit:v4];
      double v9 = v12;

      uint64_t v10 = [v3 recordCount];
      goto LABEL_7;
    }
    id v6 = [v3 sumQuantity];
  }
  id v7 = v6;
  [v6 doubleValueForUnit:v4];
  double v9 = v8;

  uint64_t v10 = 1;
LABEL_7:
  uint64_t v13 = objc_alloc_init(HKInteractiveChartSinglePointData);
  [(HKInteractiveChartSinglePointData *)v13 setValue:v9];
  [(HKInteractiveChartSinglePointData *)v13 setUnit:v4];
  uint64_t v14 = [v3 minQuantity];
  if (v14)
  {
    id v15 = (void *)v14;
    unint64_t v16 = [v3 maxQuantity];

    if (v16)
    {
      [(HKInteractiveChartSinglePointData *)v13 setRepresentsRange:1];
      id v17 = [v3 minQuantity];
      [v17 doubleValueForUnit:v4];
      -[HKInteractiveChartSinglePointData setMinValue:](v13, "setMinValue:");

      uint64_t v18 = [v3 maxQuantity];
      [v18 doubleValueForUnit:v4];
      -[HKInteractiveChartSinglePointData setMaxValue:](v13, "setMaxValue:");

      uint64_t v10 = [v3 recordCount];
    }
  }
  [(HKInteractiveChartSinglePointData *)v13 setRecordCount:v10];
  id v19 = [v3 statisticsInterval];
  [(HKInteractiveChartSinglePointData *)v13 setStatisticsInterval:v19];

  return v13;
}

+ (HKDisplayType)displayTypeWithIdentifier:(int64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0:
      id v3 = HKDisplayTypeIdentifierBodyMassIndexMake();
      break;
    case 1:
      id v3 = HKDisplayTypeIdentifierBodyFatPercentageMake();
      break;
    case 2:
      id v3 = HKDisplayTypeIdentifierHeightMake();
      break;
    case 3:
      id v3 = HKDisplayTypeIdentifierBodyMassMake();
      break;
    case 4:
      id v3 = HKDisplayTypeIdentifierLeanBodyMassMake();
      break;
    case 5:
      id v3 = HKDisplayTypeIdentifierHeartRateMake();
      break;
    case 7:
      id v3 = HKDisplayTypeIdentifierStepsMake();
      break;
    case 8:
      id v3 = HKDisplayTypeIdentifierDistanceWalkingRunningMake();
      break;
    case 9:
      id v3 = HKDisplayTypeIdentifierBasalEnergyBurnedMake();
      break;
    case 10:
      id v3 = HKDisplayTypeIdentifierActiveEnergyMake();
      break;
    case 12:
      id v3 = HKDisplayTypeIdentifierFlightsClimbedMake();
      break;
    case 13:
      id v3 = HKDisplayTypeIdentifierNikeFuelMake();
      break;
    case 14:
      id v3 = HKDisplayTypeIdentifierOxygenSaturationMake();
      break;
    case 15:
      id v3 = HKDisplayTypeIdentifierBloodGlucoseMake();
      break;
    case 18:
      id v3 = HKDisplayTypeIdentifierBloodAlcoholContentMake();
      break;
    case 19:
      id v3 = HKDisplayTypeIdentifierPeripheralPerfusionIndexMake();
      break;
    case 20:
      id v3 = HKDisplayTypeIdentifierDietaryFatTotalMake();
      break;
    case 21:
      id v3 = HKDisplayTypeIdentifierDietaryFatPolyunsaturatedMake();
      break;
    case 22:
      id v3 = HKDisplayTypeIdentifierDietaryFatMonounsaturatedMake();
      break;
    case 23:
      id v3 = HKDisplayTypeIdentifierDietaryFatSaturatedMake();
      break;
    case 24:
      id v3 = HKDisplayTypeIdentifierDietaryCholesterolMake();
      break;
    case 25:
      id v3 = HKDisplayTypeIdentifierDietarySodiumMake();
      break;
    case 26:
      id v3 = HKDisplayTypeIdentifierDietaryCarbohydratesMake();
      break;
    case 27:
      id v3 = HKDisplayTypeIdentifierDietaryFiberMake();
      break;
    case 28:
      id v3 = HKDisplayTypeIdentifierDietarySugarMake();
      break;
    case 29:
      id v3 = HKDisplayTypeIdentifierDietaryEnergyMake();
      break;
    case 30:
      id v3 = HKDisplayTypeIdentifierDietaryProteinMake();
      break;
    case 31:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminAMake();
      break;
    case 32:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminB6Make();
      break;
    case 33:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminB12Make();
      break;
    case 34:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminCMake();
      break;
    case 35:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminDMake();
      break;
    case 36:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminEMake();
      break;
    case 37:
      id v3 = HKDisplayTypeIdentifierDietaryVitaminKMake();
      break;
    case 38:
      id v3 = HKDisplayTypeIdentifierDietaryCalciumMake();
      break;
    case 39:
      id v3 = HKDisplayTypeIdentifierDietaryIronMake();
      break;
    case 40:
      id v3 = HKDisplayTypeIdentifierDietaryThiaminMake();
      break;
    case 41:
      id v3 = HKDisplayTypeIdentifierDietaryRiboflavinMake();
      break;
    case 42:
      id v3 = HKDisplayTypeIdentifierDietaryNiacinMake();
      break;
    case 43:
      id v3 = HKDisplayTypeIdentifierDietaryFolateMake();
      break;
    case 44:
      id v3 = HKDisplayTypeIdentifierDietaryBiotinMake();
      break;
    case 45:
      id v3 = HKDisplayTypeIdentifierDietaryPantothenicAcidMake();
      break;
    case 46:
      id v3 = HKDisplayTypeIdentifierDietaryPhosphorusMake();
      break;
    case 47:
      id v3 = HKDisplayTypeIdentifierDietaryIodineMake();
      break;
    case 48:
      id v3 = HKDisplayTypeIdentifierDietaryMagnesiumMake();
      break;
    case 49:
      id v3 = HKDisplayTypeIdentifierDietaryZincMake();
      break;
    case 50:
      id v3 = HKDisplayTypeIdentifierDietarySeleniumMake();
      break;
    case 51:
      id v3 = HKDisplayTypeIdentifierDietaryCopperMake();
      break;
    case 52:
      id v3 = HKDisplayTypeIdentifierDietaryManganeseMake();
      break;
    case 53:
      id v3 = HKDisplayTypeIdentifierDietaryChromiumMake();
      break;
    case 54:
      id v3 = HKDisplayTypeIdentifierDietaryMolybdenumMake();
      break;
    case 55:
      id v3 = HKDisplayTypeIdentifierDietaryChlorideMake();
      break;
    case 56:
      id v3 = HKDisplayTypeIdentifierDietaryPotassiumMake();
      break;
    case 57:
      id v3 = HKDisplayTypeIdentifierNumberOfTimesFallenMake();
      break;
    case 58:
      id v3 = HKDisplayTypeIdentifierElectrodermalActivityMake();
      break;
    case 60:
      id v3 = HKDisplayTypeIdentifierInhalerUsageMake();
      break;
    case 61:
      id v3 = HKDisplayTypeIdentifierRespiratoryRateMake();
      break;
    case 62:
      id v3 = HKDisplayTypeIdentifierBodyTemperatureMake();
      break;
    case 63:
      id v3 = HKDisplayTypeIdentifierSleepAnalysisMake();
      break;
    case 64:
      id v3 = HKDisplayTypeIdentifierBiologicalSexMake();
      break;
    case 65:
      id v3 = HKDisplayTypeIdentifierDateOfBirthMake();
      break;
    case 66:
      id v3 = HKDisplayTypeIdentifierBloodTypeMake();
      break;
    case 70:
      id v3 = HKDisplayTypeIdentifierAppleStandHourMake();
      break;
    case 71:
      id v3 = HKDisplayTypeIdentifierForcedVitalCapacityMake();
      break;
    case 72:
      id v3 = HKDisplayTypeIdentifierForcedExpiratoryVolume1Make();
      break;
    case 73:
      id v3 = HKDisplayTypeIdentifierPeakExpiratoryFlowRateMake();
      break;
    case 75:
      id v3 = HKDisplayTypeIdentifierAppleExerciseTimeMake();
      break;
    case 78:
      id v3 = HKDisplayTypeIdentifierDietaryCaffeineMake();
      break;
    case 79:
      id v3 = HKDisplayTypeIdentifierWorkoutMake();
      break;
    case 80:
      id v3 = HKDisplayTypeIdentifierBloodPressureMake();
      break;
    case 83:
      id v3 = HKDisplayTypeIdentifierCyclingDistanceMake();
      break;
    case 87:
      id v3 = HKDisplayTypeIdentifierDietaryWaterMake();
      break;
    case 88:
      id v3 = HKDisplayTypeIdentifierFitzpatrickSkinTypeMake();
      break;
    case 89:
      id v3 = HKDisplayTypeIdentifierUVExposureMake();
      break;
    case 90:
      id v3 = HKDisplayTypeIdentifierBasalBodyTemperatureMake();
      break;
    case 91:
      id v3 = HKDisplayTypeIdentifierCervicalMucusQualityMake();
      break;
    case 92:
      id v3 = HKDisplayTypeIdentifierOvulationTestResultMake();
      break;
    case 95:
      id v3 = HKDisplayTypeIdentifierMenstruationMake();
      break;
    case 96:
      id v3 = HKDisplayTypeIdentifierIntermenstrualBleedingMake();
      break;
    case 97:
      id v3 = HKDisplayTypeIdentifierSexualActivityMake();
      break;
    case 99:
      id v3 = HKDisplayTypeIdentifierMindfulSessionMake();
      break;
    case 100:
      id v3 = HKDisplayTypeIdentifierActivitySummaryMake();
      break;
    case 101:
      id v3 = HKDisplayTypeIdentifierPushCountMake();
      break;
    case 102:
      id v3 = HKDisplayTypeIdentifierLocationSeriesMake();
      break;
    case 103:
      id v3 = HKDisplayTypeIdentifierWheelchairUseMake();
      break;
    case 107:
      id v3 = HKDisplayTypeIdentifierCDADocumentMake();
      break;
    case 110:
      id v3 = HKDisplayTypeIdentifierSwimmingDistanceMake();
      break;
    case 111:
      id v3 = HKDisplayTypeIdentifierSwimmingStrokesMake();
      break;
    case 113:
      id v3 = HKDisplayTypeIdentifierWheelchairDistanceMake();
      break;
    case 114:
      id v3 = HKDisplayTypeIdentifierWaistCircumferenceMake();
      break;
    case 118:
      id v3 = HKDisplayTypeIdentifierRestingHeartRateMake();
      break;
    case 119:
      id v3 = HKDisplayTypeIdentifierHeartbeatSeriesMake();
      break;
    case 124:
      id v3 = HKDisplayTypeIdentifierVO2MaxMake();
      break;
    case 125:
      id v3 = HKDisplayTypeIdentifierInsulinDeliveryMake();
      break;
    case 137:
      id v3 = HKDisplayTypeIdentifierWalkingHeartRateAverageMake();
      break;
    case 138:
      id v3 = HKDisplayTypeIdentifierDownhillSnowSportsDistanceMake();
      break;
    case 139:
      id v3 = HKDisplayTypeIdentifierHeartRateVariabilityMake();
      break;
    case 140:
      id v3 = HKDisplayTypeIdentifierTachycardiaEventMake();
      break;
    case 144:
      id v3 = HKDisplayTypeIdentifierElectrocardiogramMake();
      break;
    case 145:
      id v3 = HKDisplayTypeIdentifierAudiogramMake();
      break;
    case 147:
      id v3 = HKDisplayTypeIdentifierBradycardiaEventMake();
      break;
    case 149:
      id v3 = HKDisplayTypeIdentifierAllergyRecordMake();
      break;
    case 150:
      id v3 = HKDisplayTypeIdentifierConditionRecordMake();
      break;
    case 151:
      id v3 = HKDisplayTypeIdentifierImmunizationRecordMake();
      break;
    case 152:
      id v3 = HKDisplayTypeIdentifierLabResultRecordMake();
      break;
    case 153:
      id v3 = HKDisplayTypeIdentifierMedicationRecordMake();
      break;
    case 154:
      id v3 = HKDisplayTypeIdentifierProcedureRecordMake();
      break;
    case 155:
      id v3 = HKDisplayTypeIdentifierVitalSignRecordMake();
      break;
    case 156:
      id v3 = HKDisplayTypeIdentifierAtrialFibrillationEventMake();
      break;
    case 157:
      id v3 = HKDisplayTypeIdentifierAbdominalCrampsMake();
      break;
    case 158:
      id v3 = HKDisplayTypeIdentifierBreastPainMake();
      break;
    case 159:
      id v3 = HKDisplayTypeIdentifierBloatingMake();
      break;
    case 160:
      id v3 = HKDisplayTypeIdentifierHeadacheMake();
      break;
    case 161:
      id v3 = HKDisplayTypeIdentifierAcneMake();
      break;
    case 162:
      id v3 = HKDisplayTypeIdentifierLowerBackPainMake();
      break;
    case 163:
      id v3 = HKDisplayTypeIdentifierPelvicPainMake();
      break;
    case 164:
      id v3 = HKDisplayTypeIdentifierMoodChangesMake();
      break;
    case 165:
      id v3 = HKDisplayTypeIdentifierConstipationMake();
      break;
    case 166:
      id v3 = HKDisplayTypeIdentifierDiarrheaMake();
      break;
    case 167:
      id v3 = HKDisplayTypeIdentifierFatigueMake();
      break;
    case 168:
      id v3 = HKDisplayTypeIdentifierNauseaMake();
      break;
    case 169:
      id v3 = HKDisplayTypeIdentifierSleepChangesMake();
      break;
    case 170:
      id v3 = HKDisplayTypeIdentifierAppetiteChangesMake();
      break;
    case 171:
      id v3 = HKDisplayTypeIdentifierHotFlashesMake();
      break;
    case 172:
      id v3 = HKDisplayTypeIdentifierEnvironmentalAudioExposureMake();
      break;
    case 173:
      id v3 = HKDisplayTypeIdentifierHeadphoneAudioExposureMake();
      break;
    case 177:
      id v3 = HKDisplayTypeIdentifierActivityMoveModeMake();
      break;
    case 178:
      id v3 = HKDisplayTypeIdentifierEnvironmentalAudioExposureEventMake();
      break;
    case 179:
      id v3 = HKDisplayTypeIdentifierAppleMoveTimeMake();
      break;
    case 182:
      id v3 = HKDisplayTypeIdentifierWalkingDoubleSupportPercentageMake();
      break;
    case 183:
      id v3 = HKDisplayTypeIdentifierSixMinuteWalkTestDistanceMake();
      break;
    case 186:
      id v3 = HKDisplayTypeIdentifierAppleStandTimeMake();
      break;
    case 187:
      id v3 = HKDisplayTypeIdentifierWalkingSpeedMake();
      break;
    case 188:
      id v3 = HKDisplayTypeIdentifierWalkingStepLengthMake();
      break;
    case 189:
      id v3 = HKDisplayTypeIdentifierToothbrushingEventMake();
      break;
    case 191:
      id v3 = HKDisplayTypeIdentifierPregnancyMake();
      break;
    case 192:
      id v3 = HKDisplayTypeIdentifierLactationMake();
      break;
    case 193:
      id v3 = HKDisplayTypeIdentifierContraceptiveMake();
      break;
    case 194:
      id v3 = HKDisplayTypeIdentifierWalkingAsymmetryPercentageMake();
      break;
    case 195:
      id v3 = HKDisplayTypeIdentifierStairAscentSpeedMake();
      break;
    case 196:
      id v3 = HKDisplayTypeIdentifierStairDescentSpeedMake();
      break;
    case 197:
      id v3 = HKDisplayTypeIdentifierSleepDurationGoalMake();
      break;
    case 198:
      id v3 = HKDisplayTypeIdentifierSleepScheduleMake();
      break;
    case 199:
      id v3 = HKDisplayTypeIdentifierHeadphoneAudioExposureEventMake();
      break;
    case 201:
      id v3 = HKDisplayTypeIdentifierRapidPoundingOrFlutteringHeartbeatMake();
      break;
    case 202:
      id v3 = HKDisplayTypeIdentifierSkippedHeartbeatMake();
      break;
    case 203:
      id v3 = HKDisplayTypeIdentifierFeverMake();
      break;
    case 204:
      id v3 = HKDisplayTypeIdentifierShortnessOfBreathMake();
      break;
    case 205:
      id v3 = HKDisplayTypeIdentifierChestTightnessOrPainMake();
      break;
    case 206:
      id v3 = HKDisplayTypeIdentifierFaintingMake();
      break;
    case 207:
      id v3 = HKDisplayTypeIdentifierDizzinessMake();
      break;
    case 217:
      id v3 = HKDisplayTypeIdentifierInsuranceRecordMake();
      break;
    case 218:
      id v3 = HKDisplayTypeIdentifierCardioFitnessMedicationsUseMake();
      break;
    case 220:
      id v3 = HKDisplayTypeIdentifierVomitingMake();
      break;
    case 221:
      id v3 = HKDisplayTypeIdentifierHeartburnMake();
      break;
    case 222:
      id v3 = HKDisplayTypeIdentifierCoughingMake();
      break;
    case 223:
      id v3 = HKDisplayTypeIdentifierWheezingMake();
      break;
    case 224:
      id v3 = HKDisplayTypeIdentifierSoreThroatMake();
      break;
    case 225:
      id v3 = HKDisplayTypeIdentifierCongestionMake();
      break;
    case 226:
      id v3 = HKDisplayTypeIdentifierRunnyNoseMake();
      break;
    case 229:
      id v3 = HKDisplayTypeIdentifierVaginalDrynessMake();
      break;
    case 230:
      id v3 = HKDisplayTypeIdentifierNightSweatsMake();
      break;
    case 231:
      id v3 = HKDisplayTypeIdentifierChillsMake();
      break;
    case 232:
      id v3 = HKDisplayTypeIdentifierHairLossMake();
      break;
    case 233:
      id v3 = HKDisplayTypeIdentifierDrySkinMake();
      break;
    case 234:
      id v3 = HKDisplayTypeIdentifierBladderIncontinenceMake();
      break;
    case 235:
      id v3 = HKDisplayTypeIdentifierMemoryLapseMake();
      break;
    case 236:
      id v3 = HKDisplayTypeIdentifierLowCardioFitnessEventMake();
      break;
    case 237:
      id v3 = HKDisplayTypeIdentifierHandwashingEventMake();
      break;
    case 240:
      id v3 = HKDisplayTypeIdentifierGeneralizedBodyAcheMake();
      break;
    case 241:
      id v3 = HKDisplayTypeIdentifierLossOfSmellMake();
      break;
    case 242:
      id v3 = HKDisplayTypeIdentifierLossOfTasteMake();
      break;
    case 243:
      id v3 = HKDisplayTypeIdentifierPregnancyTestResultMake();
      break;
    case 244:
      id v3 = HKDisplayTypeIdentifierProgesteroneTestResultMake();
      break;
    case 248:
      id v3 = HKDisplayTypeIdentifierAtrialFibrillationBurdenMake();
      break;
    case 249:
      id v3 = HKDisplayTypeIdentifierAppleWalkingSteadinessMake();
      break;
    case 250:
      id v3 = HKDisplayTypeIdentifierAppleWalkingSteadinessEventMake();
      break;
    case 251:
      id v3 = HKDisplayTypeIdentifierNumberOfAlcoholicBeveragesMake();
      break;
    case 256:
      id v3 = HKDisplayTypeIdentifierAppleSleepingWristTemperatureMake();
      break;
    case 257:
      id v3 = HKDisplayTypeIdentifierVisionPrescriptionMake();
      break;
    case 258:
      id v3 = HKDisplayTypeIdentifierRunningStrideLengthMake();
      break;
    case 259:
      id v3 = HKDisplayTypeIdentifierRunningVerticalOscillationMake();
      break;
    case 260:
      id v3 = HKDisplayTypeIdentifierRunningGroundContactTimeMake();
      break;
    case 262:
      id v3 = HKDisplayTypeIdentifierPersistentIntermenstrualBleedingMake();
      break;
    case 263:
      id v3 = HKDisplayTypeIdentifierProlongedMenstrualPeriodsMake();
      break;
    case 264:
      id v3 = HKDisplayTypeIdentifierIrregularMenstrualCyclesMake();
      break;
    case 265:
      id v3 = HKDisplayTypeIdentifierInfrequentMenstrualCyclesMake();
      break;
    case 266:
      id v3 = HKDisplayTypeIdentifierHeartRateRecoveryMake();
      break;
    case 268:
      id v3 = HKDisplayTypeIdentifierClinicalNoteRecordMake();
      break;
    case 269:
      id v3 = HKDisplayTypeIdentifierUnderwaterDepthMake();
      break;
    case 270:
      id v3 = HKDisplayTypeIdentifierRunningPowerMake();
      break;
    case 272:
      id v3 = HKDisplayTypeIdentifierEnvironmentalSoundReductionMake();
      break;
    case 273:
      id v3 = HKDisplayTypeIdentifierMedicationDoseEventMake();
      break;
    case 274:
      id v3 = HKDisplayTypeIdentifierRunningSpeedMake();
      break;
    case 275:
      id v3 = HKDisplayTypeIdentifierAppleSleepingBreathingDisturbancesMake();
      break;
    case 276:
      id v3 = HKDisplayTypeIdentifierSleepApneaEventMake();
      break;
    case 277:
      id v3 = HKDisplayTypeIdentifierWaterTemperatureMake();
      break;
    case 279:
      id v3 = HKDisplayTypeIdentifierTimeInDaylightMake();
      break;
    case 280:
      id v3 = HKDisplayTypeIdentifierCyclingPowerMake();
      break;
    case 281:
      id v3 = HKDisplayTypeIdentifierCyclingSpeedMake();
      break;
    case 282:
      id v3 = HKDisplayTypeIdentifierCyclingCadenceMake();
      break;
    case 283:
      id v3 = HKDisplayTypeIdentifierCyclingFunctionalThresholdPowerMake();
      break;
    case 284:
      id v3 = HKDisplayTypeIdentifierStateOfMindMake();
      break;
    case 286:
      id v3 = HKDisplayTypeIdentifierPhysicalEffortMake();
      break;
    case 287:
      id v3 = HKDisplayTypeIdentifierGAD7Make();
      break;
    case 288:
      id v3 = HKDisplayTypeIdentifierPHQ9Make();
      break;
    case 294:
      id v3 = HKDisplayTypeIdentifierPaddleSportsDistanceMake();
      break;
    case 295:
      id v3 = HKDisplayTypeIdentifierRowingDistanceMake();
      break;
    case 296:
      id v3 = HKDisplayTypeIdentifierCrossCountrySkiingDistanceMake();
      break;
    case 297:
      id v3 = HKDisplayTypeIdentifierSkatingSportsDistanceMake();
      break;
    case 298:
      id v3 = HKDisplayTypeIdentifierEstimatedWorkoutEffortScoreMake();
      break;
    case 301:
      id v3 = HKDisplayTypeIdentifierRowingSpeedMake();
      break;
    case 302:
      id v3 = HKDisplayTypeIdentifierCrossCountrySkiingSpeedMake();
      break;
    case 303:
      id v3 = HKDisplayTypeIdentifierPaddleSportsSpeedMake();
      break;
    case 304:
      id v3 = HKDisplayTypeIdentifierWorkoutEffortScoreMake();
      break;
    case 305:
      id v3 = HKDisplayTypeIdentifierAppleBalanceMetricsMake();
      break;
    case 313:
      id v3 = HKDisplayTypeIdentifierBleedingDuringPregnancyMake();
      break;
    case 314:
      id v3 = HKDisplayTypeIdentifierBleedingAfterPregnancyMake();
      break;
    default:
      break;
  }
  return (HKDisplayType *)v3;
}

- (BOOL)allowsManualEntry
{
  uint64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  BOOL result = 0;
  if (v2 > 235)
  {
    if (((unint64_t)(v2 - 236) > 0x34 || ((1 << (v2 + 20)) & 0x1801903C107001) == 0)
      && v2 != 305
      && v2 != 313)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 137) > 0x3E || ((1 << (v2 + 119)) & 0x41C2061800080489) == 0) {
         && ((unint64_t)(v2 - 70) > 0x25 || ((1 << (v2 - 70)) & 0x2040000021) == 0)
  }
         && v2 != 13)
  {
    return 1;
  }
  return result;
}

- (id)localizedStringSuffixForWheelchairUser:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = [(HKDisplayType *)self displayTypeIdentifier];
  BOOL v5 = (unint64_t)(v4 - 70) > 0x1E || ((1 << (v4 - 70)) & 0x40000021) == 0;
  if (v5 && v4 != 186)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F2B0B8] localizationStringSuffixForWheelchairUser:v3];
  }
  return v6;
}

- (UIImage)displayTypeIcon
{
  if ([(HKDisplayType *)self displayTypeIdentifier] == 13)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
    BOOL v3 = HKHealthUIFrameworkBundle();
    int64_t v4 = [v2 imageNamed:@"healthdata_glyph_nikeplus" inBundle:v3];
    BOOL v5 = [MEMORY[0x1E4FB1618] whiteColor];
    id v6 = [v4 _flatImageWithColor:v5];
  }
  else
  {
    id v6 = 0;
  }
  return (UIImage *)v6;
}

- (UIImage)shareIcon
{
  int64_t v3 = [(HKDisplayType *)self displayTypeIdentifier];
  if (v3 == 13)
  {
    int64_t v4 = (void *)MEMORY[0x1E4FB1818];
    BOOL v5 = HKHealthUIFrameworkBundle();
    id v6 = @"sharedata_glyph_nikeplus";
    goto LABEL_5;
  }
  if (v3 == 100)
  {
    int64_t v4 = (void *)MEMORY[0x1E4FB1818];
    BOOL v5 = HKHealthUIFrameworkBundle();
    id v6 = @"sharedata_glyph_activity";
LABEL_5:
    uint64_t v7 = [v4 imageNamed:v6 inBundle:v5];
    goto LABEL_7;
  }
  BOOL v5 = [(HKDisplayType *)self displayCategory];
  uint64_t v7 = [v5 shareIcon];
LABEL_7:
  double v8 = (void *)v7;

  return (UIImage *)v8;
}

- (id)hk_enumeratedValueLabels
{
  int64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  return +[HKDisplayType hk_enumeratedValueLabelsWithDisplayTypeIdentifier:v2];
}

+ (id)hk_enumeratedValueLabelsWithDisplayTypeIdentifier:(int64_t)a3
{
  int64_t v3 = 0;
  v103[5] = *MEMORY[0x1E4F143B8];
  if (a3 > 156)
  {
    if (a3 <= 286)
    {
      switch(a3)
      {
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 165:
        case 166:
        case 167:
        case 168:
        case 171:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
        case 225:
        case 226:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 240:
        case 241:
        case 242:
          v102[0] = &unk_1F3C22378;
          v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v4 = [v65 localizedStringForKey:@"SEVERITY_UNSPECIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v103[0] = v4;
          v102[1] = &unk_1F3C22390;
          v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          BOOL v5 = [v64 localizedStringForKey:@"SEVERITY_NOT_PRESENT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v103[1] = v5;
          v102[2] = &unk_1F3C223A8;
          id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v7 = [v6 localizedStringForKey:@"SEVERITY_MILD" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v103[2] = v7;
          v102[3] = &unk_1F3C223C0;
          double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          double v9 = [v8 localizedStringForKey:@"SEVERITY_MODERATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v103[3] = v9;
          v102[4] = &unk_1F3C223D8;
          uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v11 = [v10 localizedStringForKey:@"SEVERITY_SEVERE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v103[4] = v11;
          double v12 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v13 = v103;
          uint64_t v14 = v102;
          goto LABEL_5;
        case 164:
        case 169:
          v78[0] = &unk_1F3C22378;
          unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v15 = [v16 localizedStringForKey:@"PRESENCE_PRESENT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v78[1] = &unk_1F3C22390;
          v79[0] = v15;
          v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          int64_t v27 = [v26 localizedStringForKey:@"PRESENCE_NOT_PRESENT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v79[1] = v27;
          id v28 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v29 = v79;
          id v30 = v78;
          uint64_t v31 = 2;
          goto LABEL_36;
        case 170:
          v100[0] = &unk_1F3C22378;
          unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v15 = [v16 localizedStringForKey:@"APPETITE_CHANGES_UNSPECIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v101[0] = v15;
          v100[1] = &unk_1F3C22390;
          uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v19 = [v18 localizedStringForKey:@"APPETITE_CHANGES_NO_CHANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v101[1] = v19;
          v100[2] = &unk_1F3C223A8;
          v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v33 = [v32 localizedStringForKey:@"APPETITE_CHANGES_DECREASED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v101[2] = v33;
          v100[3] = &unk_1F3C223C0;
          v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v35 = [v34 localizedStringForKey:@"APPETITE_CHANGES_INCREASED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v101[3] = v35;
          v36 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v37 = v101;
          v38 = v100;
          goto LABEL_40;
        case 178:
          v88 = &unk_1F3C22390;
          unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v15 = [v16 localizedStringForKey:@"NOISE_NOTIFICATION_LOUD_ENVIRONMENT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v89 = v15;
          v39 = (void *)MEMORY[0x1E4F1C9E8];
          id v40 = &v89;
          objc_super v41 = &v88;
          goto LABEL_30;
        case 193:
          v90[0] = &unk_1F3C22390;
          v66 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v62 = [v66 localizedStringForKey:@"CONTRACEPTIVE_UNSPECIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[0] = v62;
          v90[1] = &unk_1F3C223A8;
          v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          uint64_t v60 = [v64 localizedStringForKey:@"CONTRACEPTIVE_IMPLANT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[1] = v60;
          v90[2] = &unk_1F3C223C0;
          v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v58 = [v59 localizedStringForKey:@"CONTRACEPTIVE_INJECTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[2] = v58;
          v90[3] = &unk_1F3C223D8;
          v42 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v43 = [v42 localizedStringForKey:@"CONTRACEPTIVE_INTRAUTERINE_DEVICE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[3] = v43;
          v90[4] = &unk_1F3C223F0;
          id v44 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v45 = [v44 localizedStringForKey:@"CONTRACEPTIVE_INTRAVAGINAL_RING" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[4] = v45;
          v90[5] = &unk_1F3C22408;
          v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v47 = [v46 localizedStringForKey:@"CONTRACEPTIVE_ORAL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[5] = v47;
          v90[6] = &unk_1F3C22420;
          v48 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          unint64_t v16 = v66;
          v49 = [v48 localizedStringForKey:@"CONTRACEPTIVE_PATCH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v91[6] = v49;
          int64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:7];

          id v15 = (void *)v62;
          v50 = (void *)v60;
          goto LABEL_43;
        case 199:
          v84 = &unk_1F3C22390;
          unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v15 = [v16 localizedStringForKey:@"HEADPHONE_NOTIFICATION_LOUD_ENVIRONMENT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v85 = v15;
          v39 = (void *)MEMORY[0x1E4F1C9E8];
          id v40 = &v85;
          objc_super v41 = &v84;
          goto LABEL_30;
        case 236:
          v82 = &unk_1F3C22390;
          unint64_t v16 = HKHealthKitFrameworkBundle();
          id v15 = [v16 localizedStringForKey:@"CARDIO_FITNESS_EVENT_LOW_THRESHOLD" value:&stru_1F3B9CF20 table:@"Localizable-CardioFitness"];
          v83 = v15;
          v39 = (void *)MEMORY[0x1E4F1C9E8];
          id v40 = &v83;
          objc_super v41 = &v82;
LABEL_30:
          int64_t v3 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:1];
          goto LABEL_7;
        case 243:
          v72[0] = &unk_1F3C22390;
          unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v15 = [v16 localizedStringForKey:@"PREGNANCY_TEST_RESULT_NEGATIVE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v73[0] = v15;
          v72[1] = &unk_1F3C223A8;
          uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v19 = [v18 localizedStringForKey:@"PREGNANCY_TEST_RESULT_POSITIVE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v73[1] = v19;
          v72[2] = &unk_1F3C223C0;
          uint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          int64_t v21 = [v20 localizedStringForKey:@"PREGNANCY_TEST_RESULT_INDETERMINATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v73[2] = v21;
          id v22 = (void *)MEMORY[0x1E4F1C9E8];
          id v23 = v73;
          id v24 = v72;
          goto LABEL_33;
        case 244:
          v70[0] = &unk_1F3C22390;
          unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v15 = [v16 localizedStringForKey:@"PROGESTERONE_TEST_RESULT_NEGATIVE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v71[0] = v15;
          v70[1] = &unk_1F3C223A8;
          uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          id v19 = [v18 localizedStringForKey:@"PROGESTERONE_TEST_RESULT_POSITIVE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v71[1] = v19;
          v70[2] = &unk_1F3C223C0;
          uint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          int64_t v21 = [v20 localizedStringForKey:@"PROGESTERONE_TEST_RESULT_INDETERMINATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v71[2] = v21;
          id v22 = (void *)MEMORY[0x1E4F1C9E8];
          id v23 = v71;
          id v24 = v70;
LABEL_33:
          uint64_t v25 = 3;
          goto LABEL_34;
        case 250:
          v96[0] = &unk_1F3C22390;
          unint64_t v16 = +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:1];
          v97[0] = v16;
          v96[1] = &unk_1F3C223A8;
          id v15 = +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:2];
          v97[1] = v15;
          v96[2] = &unk_1F3C223C0;
          v26 = +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:3];
          v97[2] = v26;
          v96[3] = &unk_1F3C223D8;
          int64_t v27 = +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:4];
          v97[3] = v27;
          id v28 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v29 = v97;
          id v30 = v96;
          uint64_t v31 = 4;
LABEL_36:
          int64_t v3 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];

          goto LABEL_7;
        default:
          goto LABEL_8;
      }
    }
    if ((unint64_t)(a3 - 313) < 2)
    {
      v94[0] = &unk_1F3C22390;
      v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = [v65 localizedStringForKey:@"VAGINAL_BLEEDING_UNSPECIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v95[0] = v4;
      v94[1] = &unk_1F3C223A8;
      v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v5 = [v64 localizedStringForKey:@"VAGINAL_BLEEDING_LIGHT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v95[1] = v5;
      v94[2] = &unk_1F3C223C0;
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v7 = [v6 localizedStringForKey:@"VAGINAL_BLEEDING_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v95[2] = v7;
      v94[3] = &unk_1F3C223D8;
      double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      double v9 = [v8 localizedStringForKey:@"VAGINAL_BLEEDING_HEAVY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v95[3] = v9;
      v94[4] = &unk_1F3C223F0;
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v11 = [v10 localizedStringForKey:@"VAGINAL_BLEEDING_NONE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v95[4] = v11;
      double v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = v95;
      uint64_t v14 = v94;
      goto LABEL_5;
    }
    if (a3 != 287)
    {
      if (a3 == 288)
      {
        v74[0] = &unk_1F3C22390;
        v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v4 = [v65 localizedStringForKey:@"PHQ9_RISK_NONE_TO_MINIMAL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
        v75[0] = v4;
        v74[1] = &unk_1F3C223A8;
        v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        BOOL v5 = [v64 localizedStringForKey:@"PHQ9_RISK_MILD" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
        v75[1] = v5;
        v74[2] = &unk_1F3C223C0;
        id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v7 = [v6 localizedStringForKey:@"PHQ9_RISK_MODERATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
        v75[2] = v7;
        v74[3] = &unk_1F3C223D8;
        double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        double v9 = [v8 localizedStringForKey:@"PHQ9_RISK_MODERATELY_SEVERE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
        v75[3] = v9;
        v74[4] = &unk_1F3C223F0;
        uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        id v11 = [v10 localizedStringForKey:@"PHQ9_RISK_SEVERE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
        v75[4] = v11;
        double v12 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v13 = v75;
        uint64_t v14 = v74;
        goto LABEL_5;
      }
      goto LABEL_8;
    }
    v86[0] = &unk_1F3C22390;
    unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v15 = [v16 localizedStringForKey:@"GAD7_RISK_NONE_TO_MINIMAL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v87[0] = v15;
    v86[1] = &unk_1F3C223A8;
    uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v19 = [v18 localizedStringForKey:@"GAD7_RISK_MILD" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v87[1] = v19;
    v86[2] = &unk_1F3C223C0;
    v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v33 = [v32 localizedStringForKey:@"GAD7_RISK_MODERATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v87[2] = v33;
    v86[3] = &unk_1F3C223D8;
    v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v35 = [v34 localizedStringForKey:@"GAD7_RISK_SEVERE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v87[3] = v35;
    v36 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v37 = v87;
    v38 = v86;
    goto LABEL_40;
  }
  if (a3 <= 90)
  {
    if (a3 == 63)
    {
      v68[0] = &unk_1F3C22378;
      v67 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v15 = [v67 localizedStringForKey:@"IN_BED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v69[0] = v15;
      v68[1] = &unk_1F3C22390;
      v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v63 = [v64 localizedStringForKey:@"ASLEEP_UNSPECIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
      v69[1] = v63;
      v68[2] = &unk_1F3C223A8;
      v61 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v51 = [v61 localizedStringForKey:@"AWAKE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v69[2] = v51;
      v68[3] = &unk_1F3C223C0;
      v52 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v53 = [v52 localizedStringForKey:@"ASLEEP_CORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
      v69[3] = v53;
      v68[4] = &unk_1F3C223D8;
      v54 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v55 = [v54 localizedStringForKey:@"ASLEEP_DEEP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
      v69[4] = v55;
      v68[5] = &unk_1F3C223F0;
      v56 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v57 = [v56 localizedStringForKey:@"ASLEEP_REM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
      v69[5] = v57;
      int64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:6];

      unint64_t v16 = v67;
      v50 = (void *)v63;
LABEL_43:

      goto LABEL_6;
    }
    if (a3 != 70) {
      goto LABEL_8;
    }
    v98[0] = &unk_1F3C22378;
    unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v15 = [MEMORY[0x1E4F2B0B8] localizationStringAdditionForWheelchairUser];
    uint64_t v18 = [@"STOOD" stringByAppendingString:v15];
    id v19 = [v16 localizedStringForKey:v18 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v99[0] = v19;
    v98[1] = &unk_1F3C22390;
    uint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int64_t v21 = [v20 localizedStringForKey:@"IDLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v99[1] = v21;
    id v22 = (void *)MEMORY[0x1E4F1C9E8];
    id v23 = v99;
    id v24 = v98;
    uint64_t v25 = 2;
LABEL_34:
    int64_t v3 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];

LABEL_41:
    goto LABEL_7;
  }
  switch(a3)
  {
    case '[':
      v92[0] = &unk_1F3C22390;
      v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = [v65 localizedStringForKey:@"DRY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v93[0] = v4;
      v92[1] = &unk_1F3C223A8;
      v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v5 = [v64 localizedStringForKey:@"STICKY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v93[1] = v5;
      v92[2] = &unk_1F3C223C0;
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v7 = [v6 localizedStringForKey:@"CREAMY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v93[2] = v7;
      v92[3] = &unk_1F3C223D8;
      double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      double v9 = [v8 localizedStringForKey:@"WATERY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v93[3] = v9;
      v92[4] = &unk_1F3C223F0;
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v11 = [v10 localizedStringForKey:@"EGG_WHITE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v93[4] = v11;
      double v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = v93;
      uint64_t v14 = v92;
      goto LABEL_5;
    case '\\':
      v76[0] = &unk_1F3C22390;
      unint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v15 = [v16 localizedStringForKey:@"OVULATION_TEST_RESULT_NEGATIVE_LOW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v77[0] = v15;
      v76[1] = &unk_1F3C223A8;
      uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v19 = [v18 localizedStringForKey:@"OVULATION_TEST_RESULT_LUTEINIZING_HORMONE_SURGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v77[1] = v19;
      v76[2] = &unk_1F3C223C0;
      v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v33 = [v32 localizedStringForKey:@"OVULATION_TEST_RESULT_INDETERMINATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v77[2] = v33;
      v76[3] = &unk_1F3C223D8;
      v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v35 = [v34 localizedStringForKey:@"OVULATION_TEST_RESULT_ESTROGEN_SURGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v77[3] = v35;
      v36 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v37 = v77;
      v38 = v76;
LABEL_40:
      int64_t v3 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:4];

      goto LABEL_41;
    case '_':
      v80[0] = &unk_1F3C22390;
      v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = [v65 localizedStringForKey:@"UNSPECIFIED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v81[0] = v4;
      v80[1] = &unk_1F3C223A8;
      v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v5 = [v64 localizedStringForKey:@"LIGHT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v81[1] = v5;
      v80[2] = &unk_1F3C223C0;
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v7 = [v6 localizedStringForKey:@"MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v81[2] = v7;
      v80[3] = &unk_1F3C223D8;
      double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      double v9 = [v8 localizedStringForKey:@"HEAVY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v81[3] = v9;
      v80[4] = &unk_1F3C223F0;
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v11 = [v10 localizedStringForKey:@"MENSTRUAL_FLOW_NONE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v81[4] = v11;
      double v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = v81;
      uint64_t v14 = v80;
LABEL_5:
      int64_t v3 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:5];

      id v15 = (void *)v4;
      unint64_t v16 = v65;

LABEL_6:
LABEL_7:

      break;
  }
LABEL_8:
  return v3;
}

- (id)hk_valueOrderForStackedCharts
{
  uint64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  if (v2 <= 156)
  {
    if (v2 <= 90)
    {
      if (v2 == 63) {
        return &unk_1F3C1FB58;
      }
      if (v2 == 70) {
        return &unk_1F3C1FA68;
      }
      return &unk_1F3C1FB70;
    }
    if (v2 == 91) {
      return &unk_1F3C1FA98;
    }
    if (v2 == 92) {
      return &unk_1F3C1FAF8;
    }
    if (v2 != 95) {
      return &unk_1F3C1FB70;
    }
    return &unk_1F3C1FA80;
  }
  if (v2 > 286)
  {
    if ((unint64_t)(v2 - 313) >= 2)
    {
      if (v2 == 287) {
        return &unk_1F3C1FAC8;
      }
      if (v2 == 288) {
        return &unk_1F3C1FB10;
      }
      return &unk_1F3C1FB70;
    }
    return &unk_1F3C1FA80;
  }
  uint64_t v3 = v2 - 157;
  id result = &unk_1F3C1FA38;
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 14:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 83:
    case 84:
    case 85:
      return result;
    case 7:
    case 12:
      id result = &unk_1F3C1FAE0;
      break;
    case 13:
      id result = &unk_1F3C1FA50;
      break;
    case 36:
      id result = &unk_1F3C1FAB0;
      break;
    case 86:
      id result = &unk_1F3C1FB28;
      break;
    case 87:
      id result = &unk_1F3C1FB40;
      break;
    default:
      return &unk_1F3C1FB70;
  }
  return result;
}

- (unint64_t)hk_interactiveChartOptions
{
  uint64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  unint64_t result = 2048;
  if (v2 > 94)
  {
    switch(v2)
    {
      case 145:
        return 0x200000;
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 174:
      case 175:
      case 176:
      case 177:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 227:
      case 228:
      case 236:
      case 237:
      case 238:
      case 239:
      case 245:
      case 246:
      case 247:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 257:
      case 261:
      case 262:
      case 263:
      case 264:
      case 265:
      case 266:
      case 267:
      case 268:
      case 271:
      case 273:
      case 276:
      case 278:
      case 279:
      case 285:
      case 286:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 304:
      case 306:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
        return 0;
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 287:
      case 288:
      case 313:
      case 314:
        return result;
      case 172:
      case 173:
      case 178:
      case 258:
      case 259:
      case 260:
      case 269:
      case 270:
      case 272:
      case 274:
      case 277:
      case 280:
      case 281:
      case 282:
      case 283:
      case 301:
      case 302:
      case 303:
        return 128;
      case 191:
      case 192:
      case 284:
        return 1024;
      case 193:
        return 3072;
      case 248:
        return 99840;
      case 249:
      case 275:
        return 33792;
      case 256:
        return 1536;
      case 305:
        return 512;
      default:
        if (v2 == 95) {
          return result;
        }
        if (v2 == 125) {
          return 512;
        }
        return 0;
    }
  }
  if (v2 > 90)
  {
    if ((unint64_t)(v2 - 91) >= 2) {
      return 0;
    }
  }
  else
  {
    if (v2 != 5 && v2 != 61)
    {
      if (v2 == 63) {
        return 512;
      }
      return 0;
    }
    return 128;
  }
  return result;
}

- (id)hk_healthQueryChartCacheDataSourceForTimeScope:(int64_t)a3 healthStore:(id)a4 unitController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = 0;
  switch([(HKDisplayType *)self displayTypeIdentifier])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 62:
    case 71:
    case 72:
    case 73:
    case 75:
    case 78:
    case 83:
    case 87:
    case 89:
    case 90:
    case 101:
    case 110:
    case 111:
    case 113:
    case 114:
    case 118:
    case 124:
    case 137:
    case 138:
    case 139:
    case 179:
    case 183:
    case 186:
    case 194:
    case 251:
    case 258:
    case 259:
    case 260:
    case 266:
    case 270:
    case 274:
    case 275:
    case 277:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 301:
    case 302:
    case 303:
    case 304:
      id v11 = [(HKDisplayType *)self objectType];
      uint64_t v10 = HKInteractiveChartDataSourceQuantityType(self, v11, a3, v8, v9, 0);
      goto LABEL_3;
    case 5:
    case 15:
    case 61:
    case 182:
    case 187:
    case 188:
    case 195:
    case 196:
    case 286:
      double v12 = [(HKDisplayType *)self objectType];
      uint64_t v13 = [[HKQuantityDistributionDataSource alloc] initWithQuantityType:v12 unitController:v9 healthStore:v8 contextStyle:0 predicate:0 options:0 baseDisplayType:self specificStartDate:0 specificEndDate:0 userInfoCreationBlock:&__block_literal_global_71];
      goto LABEL_5;
    case 14:
      double v12 = [(HKDisplayType *)self objectType];
      uint64_t v13 = [[HKQuantityDistributionDataSource alloc] initWithQuantityType:v12 unitController:v9 healthStore:v8 contextStyle:0 predicate:0 options:1 baseDisplayType:self specificStartDate:0 specificEndDate:0 userInfoCreationBlock:&__block_literal_global_563];
LABEL_5:
      uint64_t v10 = v13;

      break;
    case 63:
    case 70:
    case 91:
    case 92:
    case 96:
    case 99:
    case 140:
    case 145:
    case 147:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 178:
    case 189:
    case 191:
    case 192:
    case 193:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 250:
    case 262:
    case 263:
    case 264:
    case 265:
    case 276:
    case 313:
    case 314:
      goto LABEL_10;
    case 79:
      if (a3 == 6)
      {
        uint64_t v14 = HKInteractiveChartDataSourceForWorkouts(self, v8);
      }
      else
      {
LABEL_10:
        uint64_t v14 = HKInteractiveChartDataSourceChartStyle(self, (void *)a3, v8, v9);
      }
      goto LABEL_11;
    case 80:
      uint64_t v14 = HKInteractiveChartDataSourceForBloodPressure(self, v8);
      goto LABEL_11;
    case 95:
      uint64_t v14 = HKInteractiveChartDataSourceForMenstruation(self, a3, v8);
      goto LABEL_11;
    case 97:
      uint64_t v14 = HKInteractiveChartDataSourceCount(self, v8);
      goto LABEL_11;
    case 125:
      uint64_t v14 = HKInteractiveChartDataSourceForInsulinDelivery(self, v8);
      goto LABEL_11;
    case 172:
    case 173:
    case 272:
      uint64_t v14 = HKInteractiveChartDataSourceForAudioLevel(self, v8, v9);
      goto LABEL_11;
    case 237:
      uint64_t v14 = HKInteractiveChartDataSourceForHandwashingEvent(self, v8);
      goto LABEL_11;
    case 248:
      uint64_t v14 = HKInteractiveChartDataSourceForAfibBurden(self, a3, v8, v9);
      goto LABEL_11;
    case 249:
      uint64_t v14 = HKInteractiveChartDataSourceForAppleWalkingSteadiness(self, a3, v8, v9);
      goto LABEL_11;
    case 256:
      uint64_t v14 = HKInteractiveChartDataSourceForSleepingWristTemperature(self, a3, v8, v9);
      goto LABEL_11;
    case 269:
      id v11 = [(HKDisplayType *)self objectType];
      unint64_t v16 = [(HKDisplayType *)self objectType];
      id v17 = HKPreprocessingHandlerForUnderwaterDepth(v16, v8);
      uint64_t v10 = HKInteractiveChartDataSourceQuantityType(self, v11, a3, v8, v9, v17);

LABEL_3:
      break;
    case 284:
      uint64_t v14 = HKInteractiveChartDataSourceForStateOfMind(self, v8);
      goto LABEL_11;
    case 287:
    case 288:
      uint64_t v14 = HKInteractiveChartDataSourceForScoredAssessment(self, v8);
      goto LABEL_11;
    case 305:
      uint64_t v14 = HKInteractiveChartDataSourceForBalance(self, v8);
LABEL_11:
      uint64_t v10 = (void *)v14;
      break;
    default:
      break;
  }

  return v10;
}

HKInteractiveChartSinglePointData *__110__HKDisplayType_DerivedProperties__hk_healthQueryChartCacheDataSourceForTimeScope_healthStore_unitController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  [(HKInteractiveChartSinglePointData *)v6 setUnit:v4];
  uint64_t v7 = [v5 minimumValue];
  [v7 doubleValueForUnit:v4];
  -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

  id v8 = [v5 maximumValue];

  [v8 doubleValueForUnit:v4];
  double v10 = v9;

  [(HKInteractiveChartSinglePointData *)v6 setMaxValue:v10];
  [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:1];
  return v6;
}

HKInteractiveChartSinglePointData *__110__HKDisplayType_DerivedProperties__hk_healthQueryChartCacheDataSourceForTimeScope_healthStore_unitController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  [(HKInteractiveChartSinglePointData *)v6 setUnit:v5];
  uint64_t v7 = [v4 histogramCounts];
  objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global_566);
  unint64_t v9 = (unint64_t)v8;

  double v10 = [v4 minimumValue];
  [v10 doubleValueForUnit:v5];
  if (v9 < 2)
  {
    -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");
  }
  else
  {
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    double v10 = [v4 maximumValue];
    [v10 doubleValueForUnit:v5];
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");
  }

  [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:v9 > 1];
  return v6;
}

uint64_t __110__HKDisplayType_DerivedProperties__hk_healthQueryChartCacheDataSourceForTimeScope_healthStore_unitController___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 doubleValue];
}

- (id)hk_standardInteractiveChartsFormatterForTimeScope:(int64_t)a3
{
  id v5 = [(HKDisplayType *)self objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = HKInteractiveChartGenericStatFormatter;
  }
  else
  {
    double v8 = [(HKDisplayType *)self chartingRules];
    uint64_t v9 = [v8 chartStyleForTimeScope:a3];

    if ((unint64_t)(v9 - 4) >= 3)
    {
      if ((unint64_t)(v9 - 7) < 2)
      {
        double v10 = [HKInteractiveChartCategoryValueFormatter alloc];
        id v11 = [(HKDisplayType *)self localization];
        double v12 = [v11 displayName];
        uint64_t v13 = [(HKInteractiveChartCategoryValueFormatter *)v10 initWithLocalizedCategoryName:v12];

        goto LABEL_9;
      }
      uint64_t v7 = HKInteractiveChartDataFormatter;
    }
    else
    {
      uint64_t v7 = HKInteractiveChartTimePeriodFormatter;
    }
  }
  uint64_t v13 = (HKInteractiveChartCategoryValueFormatter *)objc_alloc_init(v7);
LABEL_9:
  return v13;
}

- (id)hk_interactiveChartsFormatterForTimeScope:(int64_t)a3
{
  uint64_t v5 = [(HKDisplayType *)self displayTypeIdentifier];
  if (v5 <= 247)
  {
    if (v5 <= 124)
    {
      if (v5 > 79)
      {
        if (v5 != 80)
        {
          if (v5 == 95)
          {
            id v11 = [HKInteractiveChartMenstruationFormatter alloc];
            double v12 = [(HKDisplayType *)self localization];
            uint64_t v13 = [v12 displayName];
            id v6 = [(HKInteractiveChartCategoryValueFormatter *)v11 initWithLocalizedCategoryName:v13];

            goto LABEL_44;
          }
          if (v5 == 97)
          {
            id v6 = objc_alloc_init(HKInteractiveChartNumberFormatter);
            [(HKInteractiveChartNumberFormatter *)v6 setUnitFormatString:@"SEXUAL_ACTIVITY_UNIT"];
            goto LABEL_44;
          }
          goto LABEL_32;
        }
        uint64_t v7 = HKInteractiveChartBloodPressureFormatter;
LABEL_42:
        double v10 = (HKInteractiveChartNumberFormatter *)objc_alloc_init(v7);
        goto LABEL_43;
      }
      if (v5 == 14)
      {
        uint64_t v7 = HKInteractiveChartOxygenSaturationFormatter;
        goto LABEL_42;
      }
      if (v5 == 79 && a3 == 6)
      {
        uint64_t v7 = HKInteractiveChartTimePeriodFormatter;
        goto LABEL_42;
      }
      goto LABEL_32;
    }
    if ((unint64_t)(v5 - 172) >= 2)
    {
      if (v5 == 125)
      {
        uint64_t v7 = HKInteractiveChartInsulinFormatter;
        goto LABEL_42;
      }
      if (v5 == 237)
      {
        uint64_t v7 = HKInteractiveChartHandwashingEventFormatter;
        goto LABEL_42;
      }
      goto LABEL_32;
    }
    double v8 = [[HKInteractiveChartAudioLevelStatFormatter alloc] initForDisplayType:self timeScope:a3];
    id v6 = v8;
    uint64_t v9 = 1;
LABEL_37:
    [(HKInteractiveChartNumberFormatter *)v8 setShowsClassificationInCurrentValueView:v9];
    goto LABEL_44;
  }
  if (v5 > 271)
  {
    if (v5 > 283)
    {
      if (v5 == 284)
      {
        uint64_t v7 = HKStateOfMindChartFormatter;
        goto LABEL_42;
      }
      if (v5 == 305)
      {
        uint64_t v7 = HKBalanceChartFormatter;
        goto LABEL_42;
      }
      goto LABEL_32;
    }
    if (v5 != 272)
    {
      if (v5 == 275)
      {
        uint64_t v7 = HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter;
        goto LABEL_42;
      }
      goto LABEL_32;
    }
    double v8 = [[HKInteractiveChartAudioLevelStatFormatter alloc] initForDisplayType:self timeScope:a3];
    id v6 = v8;
    uint64_t v9 = 0;
    goto LABEL_37;
  }
  if (v5 > 255)
  {
    if (v5 == 256)
    {
      uint64_t v7 = HKInteractiveChartBaselineRelativeStatFormatter;
      goto LABEL_42;
    }
    if (v5 == 269)
    {
      id v6 = objc_alloc_init(HKInteractiveChartGenericStatFormatter);
      [(HKInteractiveChartNumberFormatter *)v6 setOverrideStatFormatterItemOptions:&unk_1F3C1FB88];
      goto LABEL_44;
    }
  }
  else
  {
    if (v5 == 248)
    {
      uint64_t v7 = HKInteractiveChartAFibBurdenFormatter;
      goto LABEL_42;
    }
    if (v5 == 249)
    {
      uint64_t v7 = HKInteractiveChartAppleWalkingSteadinessFormatter;
      goto LABEL_42;
    }
  }
LABEL_32:
  double v10 = [(HKDisplayType *)self hk_standardInteractiveChartsFormatterForTimeScope:a3];
LABEL_43:
  id v6 = v10;
LABEL_44:
  return v6;
}

- (id)hk_dimensionForChartAxisWithUnitController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKDisplayType *)self displayTypeIdentifier];
  if (v5 > 69)
  {
    char v6 = v5 - 70;
    if ((unint64_t)(v5 - 70) > 0x29) {
      goto LABEL_5;
    }
    if (((1 << v6) & 0x20088080000) == 0)
    {
      if (((1 << v6) & 0x20000201) == 0)
      {
LABEL_5:
        if (v5 != 189)
        {
          if (v5 == 256)
          {
            uint64_t v7 = HKAxisLabelDimensionRelativeTemperature;
LABEL_19:
            double v8 = (HKAxisLabelDimensionInteger *)[[v7 alloc] initWithDisplayType:self unitPreferencesController:v4];
            goto LABEL_20;
          }
          goto LABEL_17;
        }
      }
LABEL_13:
      uint64_t v9 = 0;
LABEL_14:
      double v8 = +[HKChartAxisDimensionFactory dimensionWithPurpose:v9 displayType:self unitController:v4];
      goto LABEL_20;
    }
LABEL_10:
    double v8 = objc_alloc_init(HKAxisLabelDimensionInteger);
LABEL_20:
    uint64_t v14 = v8;
    goto LABEL_21;
  }
  if ((unint64_t)v5 <= 0x3F)
  {
    if (((1 << v5) & 0x2200000000004080) != 0) {
      goto LABEL_10;
    }
    if (v5 == 2)
    {
      double v10 = [v4 unitForDisplayType:self];
      id v11 = [MEMORY[0x1E4F2B618] footUnit];

      if (v10 != v11) {
        goto LABEL_24;
      }
      uint64_t v9 = 1;
      goto LABEL_14;
    }
    if (v5 == 63) {
      goto LABEL_13;
    }
  }
LABEL_17:
  double v12 = [(HKDisplayType *)self chartingRules];
  int v13 = [v12 shouldDisplayUnitForAxisLabels];

  if (v13)
  {
    uint64_t v7 = HKAxisLabelDimensionDisplayType;
    goto LABEL_19;
  }
LABEL_24:
  uint64_t v14 = 0;
LABEL_21:

  return v14;
}

- (BOOL)hk_healthQueryChartDataSourceDependsOnTimeScope
{
  int64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  BOOL result = 1;
  switch(v2)
  {
    case 140:
    case 145:
    case 147:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 178:
    case 189:
    case 191:
    case 192:
    case 193:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 248:
    case 249:
    case 250:
    case 256:
    case 262:
    case 263:
    case 264:
    case 265:
    case 276:
      return result;
    case 141:
    case 142:
    case 143:
    case 144:
    case 146:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 190:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 218:
    case 219:
    case 227:
    case 228:
    case 236:
    case 237:
    case 238:
    case 239:
    case 245:
    case 246:
    case 247:
    case 251:
    case 252:
    case 253:
    case 254:
    case 255:
    case 257:
    case 258:
    case 259:
    case 260:
    case 261:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
      goto LABEL_6;
    default:
      if (((unint64_t)(v2 - 63) > 0x24 || ((1 << (v2 - 63)) & 0x1330010081) == 0)
        && (unint64_t)(v2 - 313) >= 2)
      {
LABEL_6:
        BOOL result = 0;
      }
      break;
  }
  return result;
}

+ (id)hk_chartFactorDisplayTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int64_t v2 = +[HKDisplayType displayTypeWithIdentifier:191];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)hk_chartExcludedFactorDisplayTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)hk_chartFactorDescriptionDisplayTypes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HKDisplayType *)self displayTypeIdentifier];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2 <= 247)
  {
    if (((unint64_t)(v2 - 118) > 0x13 || ((1 << (v2 - 118)) & 0x80041) == 0) && v2 != 3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v2 == 284 || v2 == 248)
  {
LABEL_8:
    id v4 = +[HKDisplayType displayTypeWithIdentifier:191];
    v6[0] = v4;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
LABEL_9:
  return v3;
}

@end