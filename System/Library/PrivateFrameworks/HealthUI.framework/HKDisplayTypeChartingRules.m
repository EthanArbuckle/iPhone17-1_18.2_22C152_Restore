@interface HKDisplayTypeChartingRules
+ (BOOL)chartStyleContainsHorizontalGridlines:(int64_t)a3;
+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 axisScalingRule:(id)a4;
+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 chartStyleForTimeScopes:(id)a4 axisScalingRule:(id)a5 compactAxisScalingRule:(id)a6 preferredTimeScope:(int64_t)a7 chartingOptions:(unint64_t)a8;
+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 chartStyleForTimeScopes:(id)a4 axisScalingRule:(id)a5 preferredTimeScope:(int64_t)a6 chartingOptions:(unint64_t)a7;
- (BOOL)lineChartExtendFirstValueForTimeScope:(int64_t)a3;
- (BOOL)lineChartExtendLastValueForTimeScope:(int64_t)a3;
- (BOOL)lineChartFlatLastValueForTimeScope:(int64_t)a3;
- (BOOL)lineChartUsesPointMarkerImageForTimeScope:(int64_t)a3;
- (BOOL)lineChartUsesValueAxisAnnotationForTimeScope:(int64_t)a3;
- (BOOL)shouldConnectSamplesWithLines;
- (BOOL)shouldDisplayUnitForAxisLabels;
- (BOOL)shouldInvertYAxis;
- (BOOL)shouldRoundYAxisDuringExpansion;
- (BOOL)shouldShowInitialLollipop;
- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3;
- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3 chartingOptions:(unint64_t)a4;
- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3 chartingOptions:(unint64_t)a4 preferredTimeScope:(int64_t)a5;
- (HKInteractiveChartsAxisScalingRule)axisScalingRule;
- (HKInteractiveChartsAxisScalingRule)compactChartAxisScalingRule;
- (HKRemoteChartConfiguration)remoteChartConfiguration;
- (NSNumber)maximumYAxisLabelCount;
- (NSNumber)maximumYAxisLabelWidth;
- (double)chartPointLineWidthForTimeScope:(int64_t)a3;
- (double)chartPointRadiusForTimeScope:(int64_t)a3;
- (id)_ruleForKey:(id)a3 timeScope:(int64_t)a4;
- (id)allowedDecimalPrecisionRuleForUnit:(id)a3;
- (id)intervalComponentsForTimeScope:(int64_t)a3;
- (int64_t)chartStyleForTimeScope:(int64_t)a3;
- (int64_t)defaultChartStyle;
- (int64_t)preferredTimeScope;
- (void)_setRule:(id)a3 forKey:(id)a4 timeScope:(int64_t)a5;
- (void)setAllowedDecimalPrecisionRule:(id)a3 perUnitPrecisionRules:(id)a4;
- (void)setAxisScalingRule:(id)a3;
- (void)setChartPointLineWidth:(double)a3 forTimeScope:(int64_t)a4;
- (void)setChartPointRadius:(double)a3 forTimeScope:(int64_t)a4;
- (void)setChartStyle:(int64_t)a3 forTimeScope:(int64_t)a4;
- (void)setCompactChartAxisScalingRule:(id)a3;
- (void)setIntervalComponents:(id)a3 forTimeScope:(int64_t)a4;
- (void)setLineChartExtendFirstValue:(BOOL)a3 forTimeScope:(int64_t)a4;
- (void)setLineChartExtendLastValue:(BOOL)a3 forTimeScope:(int64_t)a4;
- (void)setLineChartFlatLastValue:(BOOL)a3 forTimeScope:(int64_t)a4;
- (void)setLineChartUsesPointMarkerImage:(BOOL)a3 forTimeScope:(int64_t)a4;
- (void)setLineChartUsesValueAxisAnnotation:(BOOL)a3 forTimeScope:(int64_t)a4;
- (void)setMaximumYAxisLabelCount:(id)a3;
- (void)setMaximumYAxisLabelWidth:(id)a3;
- (void)setPreferredTimeScope:(int64_t)a3;
- (void)setRemoteChartConfiguration:(id)a3;
@end

@implementation HKDisplayTypeChartingRules

- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3 chartingOptions:(unint64_t)a4 preferredTimeScope:(int64_t)a5
{
  char v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKDisplayTypeChartingRules;
  v8 = [(HKDisplayTypeChartingRules *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_defaultChartStyle = a3;
    if (_DefaultDecimalPrecisionRule_onceToken != -1) {
      dispatch_once(&_DefaultDecimalPrecisionRule_onceToken, &__block_literal_global_39);
    }
    objc_storeStrong((id *)&v9->_allowedDecimalPrecisionRule, (id)_DefaultDecimalPrecisionRule_defaultPrecisionRule);
    maximumYAxisLabelCount = v9->_maximumYAxisLabelCount;
    v9->_maximumYAxisLabelCount = 0;

    maximumYAxisLabelWidth = v9->_maximumYAxisLabelWidth;
    v9->_maximumYAxisLabelWidth = (NSNumber *)&unk_1F3C22A00;

    v9->_preferredTimeScope = a5;
    v9->_shouldDisplayUnitForAxisLabels = v6 & 1;
    v9->_shouldShowInitialLollipop = (v6 & 2) == 0;
    v9->_shouldInvertYAxis = (v6 & 4) != 0;
    v9->_shouldConnectSamplesWithLines = (v6 & 8) == 0;
    v9->_shouldRoundYAxisDuringExpansion = (v6 & 0x10) == 0;
  }
  return v9;
}

- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3 chartingOptions:(unint64_t)a4
{
  return [(HKDisplayTypeChartingRules *)self initWithDefaultChartStyle:a3 chartingOptions:a4 preferredTimeScope:5];
}

- (HKDisplayTypeChartingRules)initWithDefaultChartStyle:(int64_t)a3
{
  return [(HKDisplayTypeChartingRules *)self initWithDefaultChartStyle:a3 chartingOptions:0];
}

- (void)setCompactChartAxisScalingRule:(id)a3
{
}

- (id)allowedDecimalPrecisionRuleForUnit:(id)a3
{
  v5 = self->_allowedDecimalPrecisionRule;
  if (a3)
  {
    char v6 = [(NSDictionary *)self->_perUnitDecimalPrecision objectForKeyedSubscript:a3];
    v7 = v6;
    if (v6)
    {
      v8 = v6;

      v5 = v8;
    }
  }
  return v5;
}

- (void)setChartStyle:(int64_t)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithInteger:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"chartStyle" timeScope:a4];
}

- (void)setLineChartUsesValueAxisAnnotation:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"lineChartUsesValueAxisAnnotation" timeScope:a4];
}

- (void)setLineChartUsesPointMarkerImage:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"lineChartUsesPointMarkerImage" timeScope:a4];
}

- (void)_setRule:(id)a3 forKey:(id)a4 timeScope:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  rulesByTimeScope = self->_rulesByTimeScope;
  if (!rulesByTimeScope)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11 = self->_rulesByTimeScope;
    self->_rulesByTimeScope = v10;

    rulesByTimeScope = self->_rulesByTimeScope;
  }
  id v12 = [(NSMutableDictionary *)rulesByTimeScope objectForKeyedSubscript:v8];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_rulesByTimeScope setObject:v12 forKeyedSubscript:v8];
  }
  objc_super v13 = [NSNumber numberWithInteger:a5];
  [v12 setObject:v14 forKeyedSubscript:v13];
}

- (void)setLineChartFlatLastValue:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"lineChartFlatLastValue" timeScope:a4];
}

- (void)setLineChartExtendLastValue:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"lineChartExtendLastValue" timeScope:a4];
}

- (void)setLineChartExtendFirstValue:(BOOL)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"lineChartExtendFirstValue" timeScope:a4];
}

- (void)setRemoteChartConfiguration:(id)a3
{
}

- (void)setIntervalComponents:(id)a3 forTimeScope:(int64_t)a4
{
}

- (void)setChartPointRadius:(double)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithDouble:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"radius" timeScope:a4];
}

- (void)setChartPointLineWidth:(double)a3 forTimeScope:(int64_t)a4
{
  id v6 = [NSNumber numberWithDouble:a3];
  [(HKDisplayTypeChartingRules *)self _setRule:v6 forKey:@"lineWidth" timeScope:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteChartConfiguration, 0);
  objc_storeStrong((id *)&self->_compactChartAxisScalingRule, 0);
  objc_storeStrong((id *)&self->_axisScalingRule, 0);
  objc_storeStrong((id *)&self->_maximumYAxisLabelWidth, 0);
  objc_storeStrong((id *)&self->_maximumYAxisLabelCount, 0);
  objc_storeStrong((id *)&self->_perUnitDecimalPrecision, 0);
  objc_storeStrong((id *)&self->_allowedDecimalPrecisionRule, 0);
  objc_storeStrong((id *)&self->_rulesByTimeScope, 0);
}

- (void)setAxisScalingRule:(id)a3
{
}

- (void)setAllowedDecimalPrecisionRule:(id)a3 perUnitPrecisionRules:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (v8) {
    objc_storeStrong((id *)&self->_allowedDecimalPrecisionRule, a3);
  }
  if (v7) {
    objc_storeStrong((id *)&self->_perUnitDecimalPrecision, a4);
  }
}

+ (BOOL)chartStyleContainsHorizontalGridlines:(int64_t)a3
{
  return (unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFFDLL;
}

+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 axisScalingRule:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() chartingRulesWithDefaultChartStyle:a3 chartStyleForTimeScopes:0 axisScalingRule:v5 preferredTimeScope:5 chartingOptions:0];

  return (HKDisplayTypeChartingRules *)v6;
}

+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 chartStyleForTimeScopes:(id)a4 axisScalingRule:(id)a5 preferredTimeScope:(int64_t)a6 chartingOptions:(unint64_t)a7
{
  id v11 = a5;
  id v12 = a4;
  objc_super v13 = [(id)objc_opt_class() chartingRulesWithDefaultChartStyle:a3 chartStyleForTimeScopes:v12 axisScalingRule:v11 compactAxisScalingRule:0 preferredTimeScope:a6 chartingOptions:a7];

  return (HKDisplayTypeChartingRules *)v13;
}

+ (HKDisplayTypeChartingRules)chartingRulesWithDefaultChartStyle:(int64_t)a3 chartStyleForTimeScopes:(id)a4 axisScalingRule:(id)a5 compactAxisScalingRule:(id)a6 preferredTimeScope:(int64_t)a7 chartingOptions:(unint64_t)a8
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  v16 = [[HKDisplayTypeChartingRules alloc] initWithDefaultChartStyle:a3 chartingOptions:a8];
  [(HKDisplayTypeChartingRules *)v16 setAxisScalingRule:v15];

  [(HKDisplayTypeChartingRules *)v16 setCompactChartAxisScalingRule:v14];
  [(HKDisplayTypeChartingRules *)v16 setPreferredTimeScope:a7];
  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __163__HKDisplayTypeChartingRules_chartingRulesWithDefaultChartStyle_chartStyleForTimeScopes_axisScalingRule_compactAxisScalingRule_preferredTimeScope_chartingOptions___block_invoke;
    v18[3] = &unk_1E6D53A60;
    v19 = v16;
    [v13 enumerateKeysAndObjectsUsingBlock:v18];
  }
  return v16;
}

uint64_t __163__HKDisplayTypeChartingRules_chartingRulesWithDefaultChartStyle_chartStyleForTimeScopes_axisScalingRule_compactAxisScalingRule_preferredTimeScope_chartingOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [v5 integerValue];

  return [v4 setChartStyle:v6 forTimeScope:v7];
}

- (int64_t)chartStyleForTimeScope:(int64_t)a3
{
  v4 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"chartStyle" timeScope:a3];
  id v5 = v4;
  if (v4) {
    uint64_t defaultChartStyle = [v4 integerValue];
  }
  else {
    uint64_t defaultChartStyle = self->_defaultChartStyle;
  }

  return defaultChartStyle;
}

- (id)intervalComponentsForTimeScope:(int64_t)a3
{
  v4 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"intervalComponents" timeScope:a3];
  if (!v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v4 = v6;
    switch(a3)
    {
      case 0:
      case 1:
        [v6 setYear:1];
        break;
      case 2:
        [v6 setMonth:1];
        break;
      case 3:
        [v6 setWeekOfYear:1];
        break;
      case 4:
      case 5:
      case 8:
        [v6 setDay:1];
        break;
      case 6:
        [v6 setHour:1];
        break;
      case 7:
        [v6 setMinute:15];
        break;
      default:
        break;
    }
  }
  return v4;
}

- (double)chartPointLineWidthForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"lineWidth" timeScope:a3];
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.5;
  }

  return v6;
}

- (double)chartPointRadiusForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"radius" timeScope:a3];
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 2.5;
  }

  return v6;
}

- (BOOL)lineChartFlatLastValueForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"lineChartFlatLastValue" timeScope:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)lineChartExtendLastValueForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"lineChartExtendLastValue" timeScope:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)lineChartExtendFirstValueForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"lineChartExtendFirstValue" timeScope:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)lineChartUsesPointMarkerImageForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"lineChartUsesPointMarkerImage" timeScope:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)lineChartUsesValueAxisAnnotationForTimeScope:(int64_t)a3
{
  v3 = [(HKDisplayTypeChartingRules *)self _ruleForKey:@"lineChartUsesValueAxisAnnotation" timeScope:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_ruleForKey:(id)a3 timeScope:(int64_t)a4
{
  char v5 = [(NSMutableDictionary *)self->_rulesByTimeScope objectForKeyedSubscript:a3];
  double v6 = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (BOOL)shouldDisplayUnitForAxisLabels
{
  return self->_shouldDisplayUnitForAxisLabels;
}

- (BOOL)shouldShowInitialLollipop
{
  return self->_shouldShowInitialLollipop;
}

- (BOOL)shouldInvertYAxis
{
  return self->_shouldInvertYAxis;
}

- (BOOL)shouldConnectSamplesWithLines
{
  return self->_shouldConnectSamplesWithLines;
}

- (BOOL)shouldRoundYAxisDuringExpansion
{
  return self->_shouldRoundYAxisDuringExpansion;
}

- (NSNumber)maximumYAxisLabelCount
{
  return self->_maximumYAxisLabelCount;
}

- (void)setMaximumYAxisLabelCount:(id)a3
{
}

- (NSNumber)maximumYAxisLabelWidth
{
  return self->_maximumYAxisLabelWidth;
}

- (void)setMaximumYAxisLabelWidth:(id)a3
{
}

- (int64_t)defaultChartStyle
{
  return self->_defaultChartStyle;
}

- (HKInteractiveChartsAxisScalingRule)axisScalingRule
{
  return self->_axisScalingRule;
}

- (HKInteractiveChartsAxisScalingRule)compactChartAxisScalingRule
{
  return self->_compactChartAxisScalingRule;
}

- (int64_t)preferredTimeScope
{
  return self->_preferredTimeScope;
}

- (void)setPreferredTimeScope:(int64_t)a3
{
  self->_preferredTimeScope = a3;
}

- (HKRemoteChartConfiguration)remoteChartConfiguration
{
  return self->_remoteChartConfiguration;
}

@end