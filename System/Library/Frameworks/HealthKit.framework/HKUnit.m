@interface HKUnit
+ (BOOL)_isValidUnitString:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (HKUnit)atmosphereUnit;
+ (HKUnit)calorieUnit;
+ (HKUnit)centimeterOfWaterUnit;
+ (HKUnit)countUnit;
+ (HKUnit)cupImperialUnit;
+ (HKUnit)cupUSUnit;
+ (HKUnit)dayUnit;
+ (HKUnit)decibelAWeightedSoundPressureLevelUnit;
+ (HKUnit)decibelHearingLevelUnit;
+ (HKUnit)degreeAngleUnit;
+ (HKUnit)degreeCelsiusUnit;
+ (HKUnit)degreeFahrenheitUnit;
+ (HKUnit)diopterUnit;
+ (HKUnit)fluidOunceImperialUnit;
+ (HKUnit)fluidOunceUSUnit;
+ (HKUnit)footUnit;
+ (HKUnit)gramUnit;
+ (HKUnit)gramUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)hertzUnit;
+ (HKUnit)hertzUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)hourUnit;
+ (HKUnit)inchUnit;
+ (HKUnit)inchesOfMercuryUnit;
+ (HKUnit)internationalUnit;
+ (HKUnit)jouleUnit;
+ (HKUnit)jouleUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)kelvinUnit;
+ (HKUnit)kilocalorieUnit;
+ (HKUnit)largeCalorieUnit;
+ (HKUnit)literUnit;
+ (HKUnit)literUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)luxUnit;
+ (HKUnit)luxUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)meterUnit;
+ (HKUnit)meterUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)mileUnit;
+ (HKUnit)millimeterOfMercuryUnit;
+ (HKUnit)minuteUnit;
+ (HKUnit)moleUnitWithMetricPrefix:(HKMetricPrefix)prefix molarMass:(double)gramsPerMole;
+ (HKUnit)moleUnitWithMolarMass:(double)gramsPerMole;
+ (HKUnit)ounceUnit;
+ (HKUnit)pascalUnit;
+ (HKUnit)pascalUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)percentUnit;
+ (HKUnit)pintImperialUnit;
+ (HKUnit)pintUSUnit;
+ (HKUnit)poundUnit;
+ (HKUnit)prismDiopterUnit;
+ (HKUnit)radianAngleUnit;
+ (HKUnit)radianAngleUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)secondUnit;
+ (HKUnit)secondUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)siemenUnit;
+ (HKUnit)siemenUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)smallCalorieUnit;
+ (HKUnit)stoneUnit;
+ (HKUnit)unitFromEnergyFormatterUnit:(NSEnergyFormatterUnit)energyFormatterUnit;
+ (HKUnit)unitFromLengthFormatterUnit:(NSLengthFormatterUnit)lengthFormatterUnit;
+ (HKUnit)unitFromMassFormatterUnit:(NSMassFormatterUnit)massFormatterUnit;
+ (HKUnit)unitFromString:(NSString *)string;
+ (HKUnit)voltUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)wattUnit;
+ (HKUnit)wattUnitWithMetricPrefix:(HKMetricPrefix)prefix;
+ (HKUnit)yardUnit;
+ (NSEnergyFormatterUnit)energyFormatterUnitFromUnit:(HKUnit *)unit;
+ (NSLengthFormatterUnit)lengthFormatterUnitFromUnit:(HKUnit *)unit;
+ (NSMassFormatterUnit)massFormatterUnitFromUnit:(HKUnit *)unit;
+ (id)_changeInDegreeCelsiusUnit;
+ (id)_changeInDegreeFahrenheitUnit;
+ (id)_changeInUnit:(id)a3;
+ (id)_countPerMinuteUnit;
+ (id)_countPerSecondUnit;
+ (id)_distanceUnitForLocale:(id)a3;
+ (id)_foodEnergyUnitForLocale:(id)a3;
+ (id)_foundationBaseUnits;
+ (id)_heightUnitForLocale:(id)a3;
+ (id)_internationalUnitWithMassEquivalent;
+ (id)_internationalUnitWithMassEquivalent:(double)a3;
+ (id)_internationalUnitWithMetricPrefix:(int64_t)a3 massEquivalent:(double)a4;
+ (id)_internationalUnitWithMetricPrefix:(int64_t)a3 volumeEquivalent:(double)a4;
+ (id)_internationalUnitWithVolumeEquivalent;
+ (id)_internationalUnitWithVolumeEquivalent:(double)a3;
+ (id)_milligramsPerDeciliterUnit;
+ (id)_millimolesBloodGlucosePerLiterUnit;
+ (id)_nullUnit;
+ (id)_personMassUnitForLocale:(id)a3;
+ (id)_prefixStringForMetricPrefix:(int64_t)a3;
+ (id)_temperatureUnitForLocale:(id)a3;
+ (id)_unitForStringPrewarmCache;
+ (id)_voltBaseUnit;
+ (id)appleEffortScoreUnit;
+ (id)equivalentsUnit;
+ (id)equivalentsUnitWithMolarMass:(double)a3 valence:(int64_t)a4;
+ (id)kilojoulesUnit;
+ (id)milliseconds;
+ (id)moles;
+ (id)perMilleUnit;
+ (id)titerUnit;
+ (void)_prewarmUnitForStringCache;
- (BOOL)_isCompatibleWithDimension:(id)a3;
- (BOOL)_isCompatibleWithUnit:(id)a3;
- (BOOL)_isMetricDistance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNull;
- (HKUnit)init;
- (HKUnit)initWithCoder:(id)a3;
- (HKUnit)reciprocalUnit;
- (HKUnit)unitDividedByUnit:(HKUnit *)unit;
- (HKUnit)unitMultipliedByUnit:(HKUnit *)unit;
- (HKUnit)unitRaisedToPower:(NSInteger)power;
- (NSString)unitString;
- (_HKDimension)dimension;
- (_HKFactorization)_baseUnits;
- (double)_convertFromBaseUnit:(double)a3;
- (double)_convertToBaseUnit:(double)a3;
- (double)_reducedProportionalSize;
- (double)_valueByConvertingValue:(double)a3 toUnit:(id)a4;
- (double)scaleOffset;
- (id)_baseUnitReduction;
- (id)_baseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4;
- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4;
- (id)_dimensionReduction;
- (id)_foundationUnit;
- (id)_init;
- (unint64_t)hash;
- (void)_reduceIfNecessaryWithCycleSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUnit

+ (HKUnit)kilocalorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"kcal"];
}

- (double)_valueByConvertingValue:(double)a3 toUnit:(id)a4
{
  id v6 = a4;
  if (![(HKUnit *)self _isCompatibleWithUnit:v6]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to convert incompatible units: %@, %@", self, v6 format];
  }
  if (![(HKUnit *)self isEqual:v6])
  {
    [(HKUnit *)self _convertToBaseUnit:a3];
    objc_msgSend(v6, "_convertFromBaseUnit:");
    a3 = v7;
  }

  return a3;
}

- (BOOL)_isCompatibleWithUnit:(id)a3
{
  id v4 = a3;
  v5 = [(HKUnit *)self _dimensionReduction];
  id v6 = [v4 _dimensionReduction];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)_dimensionReduction
{
  dimensionReduction = self->_dimensionReduction;
  if (!dimensionReduction)
  {
    [(HKUnit *)self _reduceIfNecessaryWithCycleSet:0];
    dimensionReduction = self->_dimensionReduction;
  }

  return dimensionReduction;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKUnit *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HKUnit *)self unitString];
      id v6 = [(HKUnit *)v4 unitString];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

+ (HKUnit)minuteUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"min"];
}

+ (HKUnit)countUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"count"];
}

+ (HKUnit)meterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"m"];
}

+ (HKUnit)secondUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"s"];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUnit *)self unitString];
  [v4 encodeObject:v5 forKey:@"HKUnitStringKey"];
}

+ (HKUnit)unitFromString:(NSString *)string
{
  v3 = string;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = &stru_1EEC60288;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unitForStringCacheLock);
  id v5 = [(id)unitForStringCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = _HKBaseUnitGrammar();
    char v7 = +[_HKFactorization factorizationFromString:v4 factorGrammar:v6];

    if ([v7 factorCount] == 1
      && ([v7 anyFactor],
          v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v7 exponentForFactor:v8],
          v8,
          v9 == 1))
    {
      uint64_t v10 = [v7 anyFactor];
    }
    else
    {
      uint64_t v10 = +[_HKCompoundUnit unitWithBaseUnits:v7];
    }
    id v5 = (void *)v10;
    if (v10)
    {
      v11 = (void *)unitForStringCache;
      if (!unitForStringCache)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v13 = (void *)unitForStringCache;
        unitForStringCache = (uint64_t)v12;

        v11 = (void *)unitForStringCache;
      }
      [v11 setObject:v5 forKeyedSubscript:v4];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unitForStringCacheLock);

  return (HKUnit *)v5;
}

+ (HKUnit)secondUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    id v4 = +[HKUnit secondUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 secondUnit];
  }

  return (HKUnit *)v5;
}

+ (id)_prefixStringForMetricPrefix:(int64_t)a3
{
  return _prefixStringForMetricPrefix__prefixes[a3];
}

+ (id)_countPerMinuteUnit
{
  if (_countPerMinuteUnit_onceToken != -1) {
    dispatch_once(&_countPerMinuteUnit_onceToken, &__block_literal_global_208);
  }
  v2 = (void *)_countPerMinuteUnit_unit;

  return v2;
}

- (double)_reducedProportionalSize
{
  return self->_reducedProportionalSize;
}

- (void)_reduceIfNecessaryWithCycleSet:(id)a3
{
  id v4 = a3;
  p_dimensionReductionLock = &self->_dimensionReductionLock;
  os_unfair_lock_lock(&self->_dimensionReductionLock);
  if (!self->_dimensionReduction)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA80] set];
    }
    char v7 = v6;
    v8 = [(HKUnit *)self _computeBaseUnitReductionAndProportionalSize:&self->_reducedProportionalSize withCycleSet:v6];
    baseUnitReduction = self->_baseUnitReduction;
    self->_baseUnitReduction = v8;

    uint64_t v10 = +[_HKFactorization factorization];
    v11 = self->_baseUnitReduction;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__HKUnit__reduceIfNecessaryWithCycleSet___block_invoke;
    v15[3] = &unk_1E58C4638;
    id v12 = v10;
    v16 = v12;
    [(_HKFactorization *)v11 enumerateFactorsWithHandler:v15];
    dimensionReduction = self->_dimensionReduction;
    self->_dimensionReduction = v12;
    v14 = v12;
  }
  os_unfair_lock_unlock(p_dimensionReductionLock);
}

- (double)scaleOffset
{
  return self->_scaleOffset;
}

+ (HKUnit)meterUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    id v4 = +[HKUnit meterUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 meterUnit];
  }

  return (HKUnit *)v5;
}

+ (id)_countPerSecondUnit
{
  if (_countPerSecondUnit_onceToken != -1) {
    dispatch_once(&_countPerSecondUnit_onceToken, &__block_literal_global_102);
  }
  v2 = (void *)_countPerSecondUnit_unit;

  return v2;
}

- (HKUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"HKUnitStringKey"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKUnitStringKey"];
    id v6 = +[HKUnit unitFromString:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HKUnit;
    self = [(HKUnit *)&v8 init];
    id v6 = self;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseUnitReduction, 0);

  objc_storeStrong((id *)&self->_dimensionReduction, 0);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKUnit;
  id result = [(HKUnit *)&v3 init];
  if (result) {
    *((_DWORD *)result + 8) = 0;
  }
  return result;
}

void __41__HKUnit__reduceIfNecessaryWithCycleSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [a2 dimension];
  [v4 multiplyByFactor:v5 exponent:a3];
}

+ (id)_nullUnit
{
  v2 = +[_HKFactorization factorization];
  objc_super v3 = +[_HKCompoundUnit unitWithBaseUnits:v2];

  return v3;
}

- (id)_baseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  [(HKUnit *)self _reduceIfNecessaryWithCycleSet:a4];
  if (a3) {
    *a3 = self->_reducedProportionalSize;
  }
  baseUnitReduction = self->_baseUnitReduction;

  return baseUnitReduction;
}

+ (HKUnit)gramUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    objc_super v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    id v4 = +[HKUnit gramUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 gramUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)gramUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"g"];
}

- (HKUnit)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUnit)unitMultipliedByUnit:(HKUnit *)unit
{
  uint64_t v4 = unit;
  id v5 = [(HKUnit *)self _baseUnits];
  id v6 = [(HKUnit *)v4 _baseUnits];

  char v7 = [v5 factorizationByMultiplying:v6];

  objc_super v8 = +[_HKCompoundUnit unitWithBaseUnits:v7];

  return (HKUnit *)v8;
}

- (HKUnit)unitDividedByUnit:(HKUnit *)unit
{
  uint64_t v4 = unit;
  id v5 = [(HKUnit *)self _baseUnits];
  id v6 = [(HKUnit *)v4 _baseUnits];

  char v7 = [v6 reciprocal];
  objc_super v8 = [v5 factorizationByMultiplying:v7];

  uint64_t v9 = +[_HKCompoundUnit unitWithBaseUnits:v8];

  return (HKUnit *)v9;
}

- (HKUnit)unitRaisedToPower:(NSInteger)power
{
  uint64_t v4 = [(HKUnit *)self _baseUnits];
  id v5 = [v4 factorizationByRaisingToExponent:power];

  id v6 = +[_HKCompoundUnit unitWithBaseUnits:v5];

  return (HKUnit *)v6;
}

- (HKUnit)reciprocalUnit
{
  v2 = [(HKUnit *)self _baseUnits];
  objc_super v3 = [v2 reciprocal];

  uint64_t v4 = +[_HKCompoundUnit unitWithBaseUnits:v3];

  return (HKUnit *)v4;
}

- (unint64_t)hash
{
  v2 = [(HKUnit *)self unitString];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (HKUnit)poundUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"lb"];
}

+ (HKUnit)ounceUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"oz"];
}

+ (HKUnit)stoneUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"st"];
}

+ (HKUnit)moleUnitWithMetricPrefix:(HKMetricPrefix)prefix molarMass:(double)gramsPerMole
{
  if (prefix)
  {
    id v5 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    id v6 = [NSNumber numberWithDouble:gramsPerMole];
    char v7 = +[HKUnit moles];
    objc_super v8 = +[HKBaseUnit _uniquedUnitWithPrefix:v5 conversionConstant:v6 rootUnit:v7];
  }
  else
  {
    objc_super v8 = [a1 moleUnitWithMolarMass:gramsPerMole];
  }

  return (HKUnit *)v8;
}

+ (HKUnit)moleUnitWithMolarMass:(double)gramsPerMole
{
  unint64_t v3 = [NSNumber numberWithDouble:gramsPerMole];
  uint64_t v4 = +[HKUnit moles];
  id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v3 rootUnit:v4];

  return (HKUnit *)v5;
}

+ (id)moles
{
  return +[HKBaseUnit _uniquedRootUnit:@"mol"];
}

+ (HKUnit)mileUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"mi"];
}

+ (HKUnit)footUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"ft"];
}

+ (HKUnit)yardUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"yd"];
}

+ (HKUnit)inchUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"in"];
}

+ (HKUnit)literUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit literUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 literUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)literUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"L"];
}

+ (HKUnit)fluidOunceUSUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"fl_oz_us"];
}

+ (HKUnit)fluidOunceImperialUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"fl_oz_imp"];
}

+ (HKUnit)pintUSUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"pt_us"];
}

+ (HKUnit)pintImperialUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"pt_imp"];
}

+ (HKUnit)cupUSUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"cup_us"];
}

+ (HKUnit)cupImperialUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"cup_imp"];
}

+ (HKUnit)pascalUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit pascalUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 pascalUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)pascalUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"Pa"];
}

+ (HKUnit)millimeterOfMercuryUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"mmHg"];
}

+ (HKUnit)centimeterOfWaterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"cmAq"];
}

+ (HKUnit)atmosphereUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"atm"];
}

+ (HKUnit)decibelAWeightedSoundPressureLevelUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"dBASPL"];
}

+ (HKUnit)inchesOfMercuryUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"inHg"];
}

+ (id)milliseconds
{
  return (id)[a1 secondUnitWithMetricPrefix:4];
}

+ (HKUnit)hourUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"hr"];
}

+ (HKUnit)dayUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"d"];
}

+ (HKUnit)jouleUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit jouleUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 jouleUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)jouleUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"J"];
}

+ (id)kilojoulesUnit
{
  return (id)[a1 jouleUnitWithMetricPrefix:9];
}

+ (HKUnit)calorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"cal"];
}

+ (HKUnit)smallCalorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"cal"];
}

+ (HKUnit)largeCalorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"Cal"];
}

+ (HKUnit)kelvinUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"K"];
}

+ (HKUnit)degreeCelsiusUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"degC"];
}

+ (HKUnit)degreeFahrenheitUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"degF"];
}

+ (HKUnit)siemenUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit siemenUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 siemenUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)siemenUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"S"];
}

+ (HKUnit)voltUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    uint64_t v4 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    id v5 = [a1 _voltBaseUnit];
    id v6 = +[HKBaseUnit _uniquedUnitWithPrefix:v4 rootUnit:v5];
  }
  else
  {
    id v6 = [a1 voltUnit];
  }

  return (HKUnit *)v6;
}

+ (id)_voltBaseUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"V"];
}

+ (HKUnit)hertzUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit hertzUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 hertzUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)hertzUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"Hz"];
}

+ (HKUnit)wattUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit wattUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 wattUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)wattUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"W"];
}

+ (HKUnit)decibelHearingLevelUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"dBHL"];
}

+ (HKUnit)percentUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"%"];
}

+ (id)perMilleUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"‰"];
}

+ (id)titerUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"titer"];
}

+ (HKUnit)diopterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"D"];
}

+ (HKUnit)prismDiopterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"pD"];
}

+ (HKUnit)radianAngleUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit radianAngleUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 radianAngleUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)radianAngleUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"rad"];
}

+ (HKUnit)degreeAngleUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"deg"];
}

+ (HKUnit)luxUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  if (prefix)
  {
    unint64_t v3 = objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    uint64_t v4 = +[HKUnit luxUnit];
    id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:v3 rootUnit:v4];
  }
  else
  {
    id v5 = [a1 luxUnit];
  }

  return (HKUnit *)v5;
}

+ (HKUnit)luxUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"lx"];
}

+ (id)appleEffortScoreUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"appleEffortScore"];
}

+ (id)_internationalUnitWithMetricPrefix:(int64_t)a3 massEquivalent:(double)a4
{
  id v5 = [a1 _prefixStringForMetricPrefix:a3];
  id v6 = [NSNumber numberWithDouble:a4];
  char v7 = +[HKUnit _internationalUnitWithMassEquivalent];
  objc_super v8 = +[HKBaseUnit _uniquedUnitWithPrefix:v5 conversionConstant:v6 rootUnit:v7];

  return v8;
}

+ (id)_internationalUnitWithMassEquivalent:(double)a3
{
  unint64_t v3 = [NSNumber numberWithDouble:a3];
  uint64_t v4 = +[HKUnit _internationalUnitWithMassEquivalent];
  id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v3 rootUnit:v4];

  return v5;
}

+ (id)_internationalUnitWithMassEquivalent
{
  return +[HKBaseUnit _uniquedRootUnit:@"IU_mass"];
}

+ (id)_internationalUnitWithMetricPrefix:(int64_t)a3 volumeEquivalent:(double)a4
{
  id v5 = [a1 _prefixStringForMetricPrefix:a3];
  id v6 = [NSNumber numberWithDouble:a4];
  char v7 = +[HKUnit _internationalUnitWithVolumeEquivalent];
  objc_super v8 = +[HKBaseUnit _uniquedUnitWithPrefix:v5 conversionConstant:v6 rootUnit:v7];

  return v8;
}

+ (id)_internationalUnitWithVolumeEquivalent:(double)a3
{
  unint64_t v3 = [NSNumber numberWithDouble:a3];
  uint64_t v4 = +[HKUnit _internationalUnitWithVolumeEquivalent];
  id v5 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v3 rootUnit:v4];

  return v5;
}

+ (id)_internationalUnitWithVolumeEquivalent
{
  return +[HKBaseUnit _uniquedRootUnit:@"IU_volume"];
}

+ (HKUnit)internationalUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:@"IU"];
}

+ (id)equivalentsUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"Eq"];
}

+ (id)equivalentsUnitWithMolarMass:(double)a3 valence:(int64_t)a4
{
  uint64_t v4 = [NSNumber numberWithDouble:a3 / (double)a4];
  id v5 = +[HKUnit equivalentsUnit];
  id v6 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v4 rootUnit:v5];

  return v6;
}

void __29__HKUnit__countPerSecondUnit__block_invoke()
{
  id v3 = +[HKUnit countUnit];
  v0 = +[HKUnit secondUnit];
  uint64_t v1 = [v3 unitDividedByUnit:v0];
  v2 = (void *)_countPerSecondUnit_unit;
  _countPerSecondUnit_unit = v1;
}

void __29__HKUnit__countPerMinuteUnit__block_invoke()
{
  id v3 = +[HKUnit countUnit];
  v0 = +[HKUnit minuteUnit];
  uint64_t v1 = [v3 unitDividedByUnit:v0];
  v2 = (void *)_countPerMinuteUnit_unit;
  _countPerMinuteUnit_unit = v1;
}

+ (id)_milligramsPerDeciliterUnit
{
  if (_milligramsPerDeciliterUnit_onceToken != -1) {
    dispatch_once(&_milligramsPerDeciliterUnit_onceToken, &__block_literal_global_210);
  }
  v2 = (void *)_milligramsPerDeciliterUnit_unit;

  return v2;
}

void __37__HKUnit__milligramsPerDeciliterUnit__block_invoke()
{
  id v3 = +[HKUnit gramUnitWithMetricPrefix:4];
  v0 = +[HKUnit literUnitWithMetricPrefix:6];
  uint64_t v1 = [v3 unitDividedByUnit:v0];
  v2 = (void *)_milligramsPerDeciliterUnit_unit;
  _milligramsPerDeciliterUnit_unit = v1;
}

+ (id)_millimolesBloodGlucosePerLiterUnit
{
  if (_millimolesBloodGlucosePerLiterUnit_onceToken != -1) {
    dispatch_once(&_millimolesBloodGlucosePerLiterUnit_onceToken, &__block_literal_global_212);
  }
  v2 = (void *)_millimolesBloodGlucosePerLiterUnit_unit;

  return v2;
}

void __45__HKUnit__millimolesBloodGlucosePerLiterUnit__block_invoke()
{
  id v3 = +[HKUnit moleUnitWithMetricPrefix:4 molarMass:180.15588];
  v0 = +[HKUnit literUnit];
  uint64_t v1 = [v3 unitDividedByUnit:v0];
  v2 = (void *)_millimolesBloodGlucosePerLiterUnit_unit;
  _millimolesBloodGlucosePerLiterUnit_unit = v1;
}

+ (id)_changeInDegreeCelsiusUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"deltaDegC"];
}

+ (id)_changeInDegreeFahrenheitUnit
{
  return +[HKBaseUnit _uniquedRootUnit:@"deltaDegF"];
}

+ (id)_changeInUnit:(id)a3
{
  id v4 = a3;
  id v5 = [a1 degreeCelsiusUnit];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = [a1 _changeInDegreeCelsiusUnit];
  }
  else
  {
    objc_super v8 = [a1 degreeFahrenheitUnit];
    int v9 = [v4 isEqual:v8];

    if (v9)
    {
      [a1 _changeInDegreeFahrenheitUnit];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No unit is defined for change in %@", v4 format];
      +[HKUnit _nullUnit];
    uint64_t v7 = };
  }
  uint64_t v10 = (void *)v7;

  return v10;
}

+ (void)_prewarmUnitForStringCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&unitForStringCacheLock);
  id v3 = (void *)unitForStringCache;
  if (!unitForStringCache)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = (void *)unitForStringCache;
    unitForStringCache = (uint64_t)v4;

    id v3 = (void *)unitForStringCache;
  }
  int v6 = [a1 _unitForStringPrewarmCache];
  [v3 addEntriesFromDictionary:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unitForStringCacheLock);
}

+ (id)_unitForStringPrewarmCache
{
  v71[43] = *MEMORY[0x1E4F143B8];
  v70[0] = @"%";
  v69 = +[HKUnit percentUnit];
  v71[0] = v69;
  v70[1] = @"Cal";
  v68 = +[HKUnit largeCalorieUnit];
  v71[1] = v68;
  v70[2] = @"IU";
  v67 = +[HKUnit internationalUnit];
  v71[2] = v67;
  v70[3] = @"L";
  v66 = +[HKUnit literUnit];
  v71[3] = v66;
  v70[4] = @"L/min";
  v65 = +[HKUnit literUnit];
  v64 = +[HKUnit minuteUnit];
  v63 = [v65 unitDividedByUnit:v64];
  v71[4] = v63;
  v70[5] = @"cal";
  v62 = +[HKUnit smallCalorieUnit];
  v71[5] = v62;
  v70[6] = @"cm";
  v61 = +[HKUnit meterUnitWithMetricPrefix:5];
  v71[6] = v61;
  v70[7] = @"count";
  v60 = +[HKUnit countUnit];
  v71[7] = v60;
  v70[8] = @"count/min";
  v59 = +[HKUnit countUnit];
  v58 = +[HKUnit minuteUnit];
  v57 = [v59 unitDividedByUnit:v58];
  v71[8] = v57;
  v70[9] = @"cup_imp";
  v56 = +[HKUnit cupImperialUnit];
  v71[9] = v56;
  v70[10] = @"cup_us";
  v55 = +[HKUnit cupUSUnit];
  v71[10] = v55;
  v70[11] = @"dBASPL";
  v54 = +[HKUnit decibelAWeightedSoundPressureLevelUnit];
  v71[11] = v54;
  v70[12] = @"degF";
  v53 = +[HKUnit degreeFahrenheitUnit];
  v71[12] = v53;
  v70[13] = @"fl_oz_imp";
  v52 = +[HKUnit fluidOunceImperialUnit];
  v71[13] = v52;
  v70[14] = @"fl_oz_us";
  v51 = +[HKUnit fluidOunceUSUnit];
  v71[14] = v51;
  v70[15] = @"ft";
  v50 = +[HKUnit footUnit];
  v71[15] = v50;
  v70[16] = @"ft/s";
  v49 = +[HKUnit footUnit];
  v48 = +[HKUnit secondUnit];
  v47 = [v49 unitDividedByUnit:v48];
  v71[16] = v47;
  v70[17] = @"g";
  v46 = +[HKUnit gramUnit];
  v71[17] = v46;
  v70[18] = @"hr";
  v45 = +[HKUnit hourUnit];
  v71[18] = v45;
  v70[19] = @"in";
  v44 = +[HKUnit inchUnit];
  v71[19] = v44;
  v70[20] = @"kcal";
  v43 = +[HKUnit kilocalorieUnit];
  v71[20] = v43;
  v70[21] = @"kg";
  v42 = +[HKUnit gramUnitWithMetricPrefix:9];
  v71[21] = v42;
  v70[22] = @"km/hr";
  v41 = +[HKUnit meterUnitWithMetricPrefix:9];
  v40 = +[HKUnit hourUnit];
  v39 = [v41 unitDividedByUnit:v40];
  v71[22] = v39;
  v70[23] = @"lb";
  v38 = +[HKUnit poundUnit];
  v71[23] = v38;
  v70[24] = @"m";
  v37 = +[HKUnit meterUnit];
  v71[24] = v37;
  v70[25] = @"m/s";
  v36 = +[HKUnit meterUnit];
  v35 = +[HKUnit secondUnit];
  v34 = [v36 unitDividedByUnit:v35];
  v71[25] = v34;
  v70[26] = @"mL";
  v33 = +[HKUnit literUnitWithMetricPrefix:4];
  v71[26] = v33;
  v70[27] = @"mL/min·kg";
  v31 = +[HKUnit literUnitWithMetricPrefix:4];
  v32 = +[HKUnit gramUnitWithMetricPrefix:9];
  v30 = +[HKUnit minuteUnit];
  v29 = [v32 unitMultipliedByUnit:v30];
  v28 = [v31 unitDividedByUnit:v29];
  v71[27] = v28;
  v70[28] = @"m^3";
  v27 = +[HKUnit meterUnit];
  v26 = [v27 unitRaisedToPower:3];
  v71[28] = v26;
  v70[29] = @"mcS";
  v25 = +[HKUnit siemenUnitWithMetricPrefix:3];
  v71[29] = v25;
  v70[30] = @"mcg";
  v24 = +[HKUnit gramUnitWithMetricPrefix:3];
  v71[30] = v24;
  v70[31] = @"mg";
  v23 = +[HKUnit gramUnitWithMetricPrefix:4];
  v71[31] = v23;
  v70[32] = @"mg/dL";
  v22 = +[HKUnit gramUnitWithMetricPrefix:4];
  v21 = +[HKUnit literUnitWithMetricPrefix:6];
  v20 = [v22 unitDividedByUnit:v21];
  v71[32] = v20;
  v70[33] = @"mi";
  v19 = +[HKUnit mileUnit];
  v71[33] = v19;
  v70[34] = @"mi/hr";
  v18 = +[HKUnit mileUnit];
  v17 = +[HKUnit hourUnit];
  v16 = [v18 unitDividedByUnit:v17];
  v71[34] = v16;
  v70[35] = @"min";
  v15 = +[HKUnit minuteUnit];
  v71[35] = v15;
  v70[36] = @"ml/(kg*min)";
  v14 = +[HKUnit literUnitWithMetricPrefix:4];
  v2 = +[HKUnit gramUnitWithMetricPrefix:9];
  id v3 = +[HKUnit minuteUnit];
  id v4 = [v2 unitMultipliedByUnit:v3];
  id v5 = [v14 unitDividedByUnit:v4];
  v71[36] = v5;
  v70[37] = @"mmHg";
  int v6 = +[HKUnit millimeterOfMercuryUnit];
  v71[37] = v6;
  v70[38] = @"ms";
  uint64_t v7 = +[HKUnit secondUnitWithMetricPrefix:4];
  v71[38] = v7;
  v70[39] = @"pt_imp";
  objc_super v8 = +[HKUnit pintImperialUnit];
  v71[39] = v8;
  v70[40] = @"pt_us";
  int v9 = +[HKUnit pintUSUnit];
  v71[40] = v9;
  v70[41] = @"s";
  uint64_t v10 = +[HKUnit secondUnit];
  v71[41] = v10;
  v70[42] = @"yd";
  v11 = +[HKUnit yardUnit];
  v71[42] = v11;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:43];

  return v13;
}

- (id)_foundationUnit
{
  if (_foundationUnit_onceToken != -1) {
    dispatch_once(&_foundationUnit_onceToken, &__block_literal_global_276);
  }
  id v3 = (void *)_foundationUnit_nsUnits;
  id v4 = [(HKUnit *)self unitString];
  id v5 = [v3 objectForKey:v4];

  return v5;
}

void __25__HKUnit__foundationUnit__block_invoke()
{
  v113[110] = *MEMORY[0x1E4F143B8];
  v112[0] = @"m/s^2";
  v111 = [MEMORY[0x1E4F29150] metersPerSecondSquared];
  v113[0] = v111;
  v112[1] = @"nm^2";
  v110 = [MEMORY[0x1E4F29160] squareNanometers];
  v113[1] = v110;
  v112[2] = @"mcm^2";
  v109 = [MEMORY[0x1E4F29160] squareMicrometers];
  v113[2] = v109;
  v112[3] = @"mm^2";
  v108 = [MEMORY[0x1E4F29160] squareMillimeters];
  v113[3] = v108;
  v112[4] = @"cm^2";
  v107 = [MEMORY[0x1E4F29160] squareCentimeters];
  v113[4] = v107;
  v112[5] = @"m^2";
  v106 = [MEMORY[0x1E4F29160] squareMeters];
  v113[5] = v106;
  v112[6] = @"km^2";
  v105 = [MEMORY[0x1E4F29160] squareKilometers];
  v113[6] = v105;
  v112[7] = @"Mm^2";
  v104 = [MEMORY[0x1E4F29160] squareMegameters];
  v113[7] = v104;
  v112[8] = @"in^2";
  v103 = [MEMORY[0x1E4F29160] squareInches];
  v113[8] = v103;
  v112[9] = @"ft^2";
  v102 = [MEMORY[0x1E4F29160] squareFeet];
  v113[9] = v102;
  v112[10] = @"yd^2";
  v101 = [MEMORY[0x1E4F29160] squareYards];
  v113[10] = v101;
  v112[11] = @"mi^2";
  v100 = [MEMORY[0x1E4F29160] squareMiles];
  v113[11] = v100;
  v112[12] = @"g/L";
  v99 = [MEMORY[0x1E4F29168] gramsPerLiter];
  v113[12] = v99;
  v112[13] = @"mg/dL";
  v98 = [MEMORY[0x1E4F29168] milligramsPerDeciliter];
  v113[13] = v98;
  v112[14] = @"s";
  v97 = [MEMORY[0x1E4F29180] seconds];
  v113[14] = v97;
  v112[15] = @"min";
  v96 = [MEMORY[0x1E4F29180] minutes];
  v113[15] = v96;
  v112[16] = @"hr";
  v95 = [MEMORY[0x1E4F29180] hours];
  v113[16] = v95;
  v112[17] = @"1/count^6";
  v94 = [MEMORY[0x1E4F29178] partsPerMillion];
  v113[17] = v94;
  v112[18] = @"1/S";
  v93 = [MEMORY[0x1E4F291A8] ohms];
  v113[18] = v93;
  v112[19] = @"kJ";
  v92 = [MEMORY[0x1E4F291B0] kilojoules];
  v113[19] = v92;
  v112[20] = @"J";
  v91 = [MEMORY[0x1E4F291B0] joules];
  v113[20] = v91;
  v112[21] = @"kcal";
  v90 = [MEMORY[0x1E4F291B0] kilocalories];
  v113[21] = v90;
  v112[22] = @"cal";
  v89 = [MEMORY[0x1E4F291B0] calories];
  v113[22] = v89;
  v112[23] = @"Cal";
  v88 = [MEMORY[0x1E4F291B0] kilocalories];
  v113[23] = v88;
  v112[24] = @"1/ps";
  v87 = [MEMORY[0x1E4F291B8] terahertz];
  v113[24] = v87;
  v112[25] = @"1/ns";
  v86 = [MEMORY[0x1E4F291B8] gigahertz];
  v113[25] = v86;
  v112[26] = @"1/µs";
  v85 = [MEMORY[0x1E4F291B8] megahertz];
  v113[26] = v85;
  v112[27] = @"1/mcs";
  v84 = [MEMORY[0x1E4F291B8] megahertz];
  v113[27] = v84;
  v112[28] = @"1/ms";
  v83 = [MEMORY[0x1E4F291B8] kilohertz];
  v113[28] = v83;
  v112[29] = @"1/s";
  v82 = [MEMORY[0x1E4F291B8] hertz];
  v113[29] = v82;
  v112[30] = @"1/ks";
  v81 = [MEMORY[0x1E4F291B8] millihertz];
  v113[30] = v81;
  v112[31] = @"1/Ms";
  v80 = [MEMORY[0x1E4F291B8] microhertz];
  v113[31] = v80;
  v112[32] = @"1/Gs";
  v79 = [MEMORY[0x1E4F291B8] nanohertz];
  v113[32] = v79;
  v112[33] = @"Hz";
  v78 = [MEMORY[0x1E4F291B8] hertz];
  v113[33] = v78;
  v112[34] = @"Mm";
  v77 = [MEMORY[0x1E4F291E0] megameters];
  v113[34] = v77;
  v112[35] = @"km";
  v76 = [MEMORY[0x1E4F291E0] kilometers];
  v113[35] = v76;
  v112[36] = @"hm";
  v75 = [MEMORY[0x1E4F291E0] hectometers];
  v113[36] = v75;
  v112[37] = @"dam";
  v74 = [MEMORY[0x1E4F291E0] decameters];
  v113[37] = v74;
  v112[38] = @"m";
  v73 = [MEMORY[0x1E4F291E0] meters];
  v113[38] = v73;
  v112[39] = @"dm";
  v72 = [MEMORY[0x1E4F291E0] decimeters];
  v113[39] = v72;
  v112[40] = @"cm";
  v71 = [MEMORY[0x1E4F291E0] centimeters];
  v113[40] = v71;
  v112[41] = @"mm";
  v70 = [MEMORY[0x1E4F291E0] millimeters];
  v113[41] = v70;
  v112[42] = @"µm";
  v69 = [MEMORY[0x1E4F291E0] micrometers];
  v113[42] = v69;
  v112[43] = @"mcm";
  v68 = [MEMORY[0x1E4F291E0] micrometers];
  v113[43] = v68;
  v112[44] = @"nm";
  v67 = [MEMORY[0x1E4F291E0] nanometers];
  v113[44] = v67;
  v112[45] = @"pm";
  v66 = [MEMORY[0x1E4F291E0] picometers];
  v113[45] = v66;
  v112[46] = @"in";
  v65 = [MEMORY[0x1E4F291E0] inches];
  v113[46] = v65;
  v112[47] = @"ft";
  v64 = [MEMORY[0x1E4F291E0] feet];
  v113[47] = v64;
  v112[48] = @"yd";
  v63 = [MEMORY[0x1E4F291E0] yards];
  v113[48] = v63;
  v112[49] = @"mi";
  v62 = [MEMORY[0x1E4F291E0] miles];
  v113[49] = v62;
  v112[50] = @"kg";
  v61 = [MEMORY[0x1E4F291E8] kilograms];
  v113[50] = v61;
  v112[51] = @"g";
  v60 = [MEMORY[0x1E4F291E8] grams];
  v113[51] = v60;
  v112[52] = @"dg";
  v59 = [MEMORY[0x1E4F291E8] decigrams];
  v113[52] = v59;
  v112[53] = @"cg";
  v58 = [MEMORY[0x1E4F291E8] centigrams];
  v113[53] = v58;
  v112[54] = @"mg";
  v57 = [MEMORY[0x1E4F291E8] milligrams];
  v113[54] = v57;
  v112[55] = @"µg";
  v56 = [MEMORY[0x1E4F291E8] micrograms];
  v113[55] = v56;
  v112[56] = @"mcg";
  v55 = [MEMORY[0x1E4F291E8] micrograms];
  v113[56] = v55;
  v112[57] = @"ng";
  v54 = [MEMORY[0x1E4F291E8] nanograms];
  v113[57] = v54;
  v112[58] = @"pg";
  v53 = [MEMORY[0x1E4F291E8] picograms];
  v113[58] = v53;
  v112[59] = @"oz";
  v52 = [MEMORY[0x1E4F291E8] ounces];
  v113[59] = v52;
  v112[60] = @"lb";
  v51 = [MEMORY[0x1E4F291E8] poundsMass];
  v113[60] = v51;
  v112[61] = @"st";
  v50 = [MEMORY[0x1E4F291E8] stones];
  v113[61] = v50;
  v112[62] = @"MW";
  v49 = [MEMORY[0x1E4F291F0] megawatts];
  v113[62] = v49;
  v112[63] = @"kW";
  v48 = [MEMORY[0x1E4F291F0] kilowatts];
  v113[63] = v48;
  v112[64] = @"W";
  v47 = [MEMORY[0x1E4F291F0] watts];
  v113[64] = v47;
  v112[65] = @"mW";
  v46 = [MEMORY[0x1E4F291F0] milliwatts];
  v113[65] = v46;
  v112[66] = @"µW";
  v45 = [MEMORY[0x1E4F291F0] microwatts];
  v113[66] = v45;
  v112[67] = @"mcW";
  v44 = [MEMORY[0x1E4F291F0] microwatts];
  v113[67] = v44;
  v112[68] = @"Pa";
  v43 = [MEMORY[0x1E4F291F8] newtonsPerMetersSquared];
  v113[68] = v43;
  v112[69] = @"GPa";
  v42 = [MEMORY[0x1E4F291F8] gigapascals];
  v113[69] = v42;
  v112[70] = @"MPa";
  v41 = [MEMORY[0x1E4F291F8] megapascals];
  v113[70] = v41;
  v112[71] = @"kPa";
  v40 = [MEMORY[0x1E4F291F8] kilopascals];
  v113[71] = v40;
  v112[72] = @"hPa";
  v39 = [MEMORY[0x1E4F291F8] hectopascals];
  v113[72] = v39;
  v112[73] = @"mmHg";
  v38 = [MEMORY[0x1E4F291F8] millimetersOfMercury];
  v113[73] = v38;
  v112[74] = @"inHg";
  v37 = [MEMORY[0x1E4F291F8] inchesOfMercury];
  v113[74] = v37;
  v112[75] = @"m/s";
  v36 = [MEMORY[0x1E4F29208] metersPerSecond];
  v113[75] = v36;
  v112[76] = @"km/hr";
  v35 = [MEMORY[0x1E4F29208] kilometersPerHour];
  v113[76] = v35;
  v112[77] = @"mi/hr";
  v34 = [MEMORY[0x1E4F29208] milesPerHour];
  v113[77] = v34;
  v112[78] = @"degC";
  v33 = [MEMORY[0x1E4F29218] celsius];
  v113[78] = v33;
  v112[79] = @"degF";
  v32 = [MEMORY[0x1E4F29218] fahrenheit];
  v113[79] = v32;
  v112[80] = @"K";
  v31 = [MEMORY[0x1E4F29218] kelvin];
  v113[80] = v31;
  v112[81] = @"ML";
  v30 = [MEMORY[0x1E4F29228] megaliters];
  v113[81] = v30;
  v112[82] = @"kL";
  v29 = [MEMORY[0x1E4F29228] kiloliters];
  v113[82] = v29;
  v112[83] = @"L";
  v28 = [MEMORY[0x1E4F29228] liters];
  v113[83] = v28;
  v112[84] = @"dL";
  v27 = [MEMORY[0x1E4F29228] deciliters];
  v113[84] = v27;
  v112[85] = @"cL";
  v26 = [MEMORY[0x1E4F29228] centiliters];
  v113[85] = v26;
  v112[86] = @"mL";
  v25 = [MEMORY[0x1E4F29228] milliliters];
  v113[86] = v25;
  v112[87] = @"m^3";
  v24 = [MEMORY[0x1E4F29228] cubicMeters];
  v113[87] = v24;
  v112[88] = @"dm^3";
  v23 = [MEMORY[0x1E4F29228] cubicDecimeters];
  v113[88] = v23;
  v112[89] = @"cm^3";
  v22 = [MEMORY[0x1E4F29228] cubicCentimeters];
  v113[89] = v22;
  v112[90] = @"mm^3";
  v21 = [MEMORY[0x1E4F29228] cubicMillimeters];
  v113[90] = v21;
  v112[91] = @"in^3";
  v20 = [MEMORY[0x1E4F29228] cubicInches];
  v113[91] = v20;
  v112[92] = @"ft^3";
  v19 = [MEMORY[0x1E4F29228] cubicFeet];
  v113[92] = v19;
  v112[93] = @"yd^3";
  v18 = [MEMORY[0x1E4F29228] cubicYards];
  v113[93] = v18;
  v112[94] = @"mi^3";
  v17 = [MEMORY[0x1E4F29228] cubicMiles];
  v113[94] = v17;
  v112[95] = @"fl_oz_us";
  v16 = [MEMORY[0x1E4F29228] fluidOunces];
  v113[95] = v16;
  v112[96] = @"cup_us";
  v15 = [MEMORY[0x1E4F29228] cups];
  v113[96] = v15;
  v112[97] = @"pt_us";
  v14 = [MEMORY[0x1E4F29228] pints];
  v113[97] = v14;
  v112[98] = @"fl_oz_imp";
  id v13 = [MEMORY[0x1E4F29228] imperialFluidOunces];
  v113[98] = v13;
  v112[99] = @"pt_imp";
  id v12 = [MEMORY[0x1E4F29228] imperialPints];
  v113[99] = v12;
  v112[100] = @"cup_imp";
  v0 = [MEMORY[0x1E4F29228] metricCups];
  v113[100] = v0;
  v112[101] = @"µV";
  uint64_t v1 = [MEMORY[0x1E4F291A0] microvolts];
  v113[101] = v1;
  v112[102] = @"mcV";
  v2 = [MEMORY[0x1E4F291A0] microvolts];
  v113[102] = v2;
  v112[103] = @"mV";
  id v3 = [MEMORY[0x1E4F291A0] millivolts];
  v113[103] = v3;
  v112[104] = @"V";
  id v4 = [MEMORY[0x1E4F291A0] volts];
  v113[104] = v4;
  v112[105] = @"kV";
  id v5 = [MEMORY[0x1E4F291A0] kilovolts];
  v113[105] = v5;
  v112[106] = @"MV";
  int v6 = [MEMORY[0x1E4F291A0] megavolts];
  v113[106] = v6;
  v112[107] = @"rad";
  uint64_t v7 = [MEMORY[0x1E4F29158] radians];
  v113[107] = v7;
  v112[108] = @"deg";
  objc_super v8 = [MEMORY[0x1E4F29158] degrees];
  v113[108] = v8;
  v112[109] = @"lx";
  int v9 = [MEMORY[0x1E4F291C8] lux];
  v113[109] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:110];
  v11 = (void *)_foundationUnit_nsUnits;
  _foundationUnit_nsUnits = v10;
}

+ (id)_foundationBaseUnits
{
  if (_foundationBaseUnits_onceToken != -1) {
    dispatch_once(&_foundationBaseUnits_onceToken, &__block_literal_global_491);
  }
  v2 = (void *)_foundationBaseUnits_units;

  return v2;
}

void __30__HKUnit__foundationBaseUnits__block_invoke()
{
  v16[14] = *MEMORY[0x1E4F143B8];
  v15 = +[HKUnit unitFromString:@"m/s^2"];
  v16[0] = v15;
  v14 = +[HKUnit unitFromString:@"m^2"];
  v16[1] = v14;
  id v13 = +[HKUnit unitFromString:@"g/L"];
  v16[2] = v13;
  id v12 = +[HKUnit unitFromString:@"s"];
  v16[3] = v12;
  v0 = +[HKUnit unitFromString:@"1/S"];
  v16[4] = v0;
  uint64_t v1 = +[HKUnit unitFromString:@"J"];
  v16[5] = v1;
  v2 = +[HKUnit unitFromString:@"1/s"];
  v16[6] = v2;
  id v3 = +[HKUnit unitFromString:@"m"];
  v16[7] = v3;
  id v4 = +[HKUnit unitFromString:@"kg"];
  v16[8] = v4;
  id v5 = +[HKUnit unitFromString:@"kg*m^2*s^-3"];
  v16[9] = v5;
  int v6 = +[HKUnit unitFromString:@"Pa"];
  v16[10] = v6;
  uint64_t v7 = +[HKUnit unitFromString:@"m/s^2"];
  v16[11] = v7;
  objc_super v8 = +[HKUnit unitFromString:@"K"];
  v16[12] = v8;
  int v9 = +[HKUnit unitFromString:@"L"];
  v16[13] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:14];
  v11 = (void *)_foundationBaseUnits_units;
  _foundationBaseUnits_units = v10;
}

+ (HKUnit)unitFromMassFormatterUnit:(NSMassFormatterUnit)massFormatterUnit
{
  id v4 = 0;
  if (massFormatterUnit <= 1536)
  {
    if (massFormatterUnit == NSMassFormatterUnitGram)
    {
      id v4 = [a1 gramUnit];
    }
    else if (massFormatterUnit == NSMassFormatterUnitKilogram)
    {
      id v4 = [a1 gramUnitWithMetricPrefix:9];
    }
  }
  else
  {
    switch(massFormatterUnit)
    {
      case NSMassFormatterUnitOunce:
        id v4 = [a1 ounceUnit];
        break;
      case NSMassFormatterUnitPound:
        id v4 = [a1 poundUnit];
        break;
      case NSMassFormatterUnitStone:
        id v4 = [a1 stoneUnit];
        break;
    }
  }

  return (HKUnit *)v4;
}

+ (NSMassFormatterUnit)massFormatterUnitFromUnit:(HKUnit *)unit
{
  id v4 = unit;
  id v5 = [a1 gramUnit];
  BOOL v6 = [(HKUnit *)v4 isEqual:v5];

  if (v6)
  {
    NSMassFormatterUnit v7 = NSMassFormatterUnitGram;
  }
  else
  {
    objc_super v8 = [a1 gramUnitWithMetricPrefix:9];
    BOOL v9 = [(HKUnit *)v4 isEqual:v8];

    if (v9)
    {
      NSMassFormatterUnit v7 = NSMassFormatterUnitKilogram;
    }
    else
    {
      uint64_t v10 = [a1 ounceUnit];
      BOOL v11 = [(HKUnit *)v4 isEqual:v10];

      if (v11)
      {
        NSMassFormatterUnit v7 = NSMassFormatterUnitOunce;
      }
      else
      {
        id v12 = [a1 poundUnit];
        BOOL v13 = [(HKUnit *)v4 isEqual:v12];

        if (v13)
        {
          NSMassFormatterUnit v7 = NSMassFormatterUnitPound;
        }
        else
        {
          v14 = [a1 stoneUnit];
          BOOL v15 = [(HKUnit *)v4 isEqual:v14];

          if (v15)
          {
            NSMassFormatterUnit v7 = NSMassFormatterUnitStone;
          }
          else
          {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No mapping for unit %@ to NSMassFormatterUnit", v4 format];
            NSMassFormatterUnit v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

+ (HKUnit)unitFromLengthFormatterUnit:(NSLengthFormatterUnit)lengthFormatterUnit
{
  BOOL v6 = 0;
  if (!v4 & v3)
  {
    switch(lengthFormatterUnit)
    {
      case NSLengthFormatterUnitInch:
        BOOL v6 = [a1 inchUnit];
        break;
      case NSLengthFormatterUnitFoot:
        BOOL v6 = [a1 footUnit];
        break;
      case NSLengthFormatterUnitYard:
        BOOL v6 = [a1 yardUnit];
        break;
      case NSLengthFormatterUnitMile:
        BOOL v6 = [a1 mileUnit];
        break;
      default:
        break;
    }
  }
  else
  {
    switch(lengthFormatterUnit)
    {
      case 8:
        id v7 = a1;
        uint64_t v8 = 4;
        goto LABEL_10;
      case 9:
        id v7 = a1;
        uint64_t v8 = 5;
        goto LABEL_10;
      case 10:
      case 12:
      case 13:
        break;
      case 11:
        BOOL v6 = [a1 meterUnit];
        break;
      case 14:
        id v7 = a1;
        uint64_t v8 = 9;
LABEL_10:
        BOOL v6 = [v7 meterUnitWithMetricPrefix:v8];
        break;
      default:
        JUMPOUT(0);
    }
  }

  return (HKUnit *)v6;
}

+ (NSLengthFormatterUnit)lengthFormatterUnitFromUnit:(HKUnit *)unit
{
  char v4 = unit;
  id v5 = [a1 meterUnitWithMetricPrefix:5];
  BOOL v6 = [(HKUnit *)v4 isEqual:v5];

  if (v6)
  {
    NSLengthFormatterUnit v7 = NSLengthFormatterUnitCentimeter;
  }
  else
  {
    uint64_t v8 = [a1 footUnit];
    BOOL v9 = [(HKUnit *)v4 isEqual:v8];

    if (v9)
    {
      NSLengthFormatterUnit v7 = NSLengthFormatterUnitFoot;
    }
    else
    {
      uint64_t v10 = [a1 inchUnit];
      BOOL v11 = [(HKUnit *)v4 isEqual:v10];

      if (v11)
      {
        NSLengthFormatterUnit v7 = NSLengthFormatterUnitInch;
      }
      else
      {
        id v12 = [a1 meterUnitWithMetricPrefix:9];
        BOOL v13 = [(HKUnit *)v4 isEqual:v12];

        if (v13)
        {
          NSLengthFormatterUnit v7 = NSLengthFormatterUnitKilometer;
        }
        else
        {
          v14 = [a1 meterUnit];
          BOOL v15 = [(HKUnit *)v4 isEqual:v14];

          if (v15)
          {
            NSLengthFormatterUnit v7 = NSLengthFormatterUnitMeter;
          }
          else
          {
            v16 = [a1 mileUnit];
            BOOL v17 = [(HKUnit *)v4 isEqual:v16];

            if (v17)
            {
              NSLengthFormatterUnit v7 = NSLengthFormatterUnitMile;
            }
            else
            {
              v18 = [a1 meterUnitWithMetricPrefix:4];
              BOOL v19 = [(HKUnit *)v4 isEqual:v18];

              if (v19)
              {
                NSLengthFormatterUnit v7 = NSLengthFormatterUnitMillimeter;
              }
              else
              {
                v20 = [a1 yardUnit];
                BOOL v21 = [(HKUnit *)v4 isEqual:v20];

                if (v21)
                {
                  NSLengthFormatterUnit v7 = NSLengthFormatterUnitYard;
                }
                else
                {
                  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No mapping for unit %@ to NSLengthFormatterUnit", v4 format];
                  NSLengthFormatterUnit v7 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

+ (HKUnit)unitFromEnergyFormatterUnit:(NSEnergyFormatterUnit)energyFormatterUnit
{
  char v4 = 0;
  if (energyFormatterUnit > 1792)
  {
    if (energyFormatterUnit == NSEnergyFormatterUnitKilocalorie)
    {
      char v4 = [a1 kilocalorieUnit];
    }
    else if (energyFormatterUnit == NSEnergyFormatterUnitCalorie)
    {
      char v4 = [a1 smallCalorieUnit];
    }
  }
  else if (energyFormatterUnit == NSEnergyFormatterUnitJoule)
  {
    char v4 = [a1 jouleUnit];
  }
  else if (energyFormatterUnit == NSEnergyFormatterUnitKilojoule)
  {
    char v4 = [a1 kilojoulesUnit];
  }

  return (HKUnit *)v4;
}

+ (NSEnergyFormatterUnit)energyFormatterUnitFromUnit:(HKUnit *)unit
{
  char v4 = unit;
  id v5 = [a1 smallCalorieUnit];
  BOOL v6 = [(HKUnit *)v4 isEqual:v5];

  if (v6)
  {
    NSEnergyFormatterUnit v7 = NSEnergyFormatterUnitCalorie;
    goto LABEL_9;
  }
  uint64_t v8 = [a1 jouleUnit];
  BOOL v9 = [(HKUnit *)v4 isEqual:v8];

  if (v9)
  {
    NSEnergyFormatterUnit v7 = NSEnergyFormatterUnitJoule;
    goto LABEL_9;
  }
  uint64_t v10 = [a1 kilocalorieUnit];
  if ([(HKUnit *)v4 isEqual:v10])
  {

LABEL_8:
    NSEnergyFormatterUnit v7 = NSEnergyFormatterUnitKilocalorie;
    goto LABEL_9;
  }
  BOOL v11 = [a1 largeCalorieUnit];
  BOOL v12 = [(HKUnit *)v4 isEqual:v11];

  if (v12) {
    goto LABEL_8;
  }
  v14 = [a1 kilojoulesUnit];
  BOOL v15 = [(HKUnit *)v4 isEqual:v14];

  if (v15)
  {
    NSEnergyFormatterUnit v7 = NSEnergyFormatterUnitKilojoule;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No mapping for unit %@ to NSEnergyFormatterUnit", v4 format];
    NSEnergyFormatterUnit v7 = 0;
  }
LABEL_9:

  return v7;
}

- (BOOL)isNull
{
  char v3 = +[HKUnit _nullUnit];
  LOBYTE(self) = [(HKUnit *)self isEqual:v3];

  return (char)self;
}

- (BOOL)_isMetricDistance
{
  char v3 = +[HKUnit meterUnitWithMetricPrefix:9];
  if ([(HKUnit *)self isEqual:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = +[HKUnit meterUnitWithMetricPrefix:5];
    if ([(HKUnit *)self isEqual:v5])
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v6 = +[HKUnit meterUnit];
      BOOL v4 = [(HKUnit *)self isEqual:v6];
    }
  }

  return v4;
}

+ (BOOL)_isValidUnitString:(id)a3
{
  id v3 = a3;
  id v4 = (id)[(id)objc_opt_class() unitFromString:v3];

  return 1;
}

- (BOOL)_isCompatibleWithDimension:(id)a3
{
  id v4 = a3;
  id v5 = [(HKUnit *)self _dimensionReduction];
  BOOL v6 = [v4 reduction];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)_baseUnitReduction
{
  [(HKUnit *)self _reduceIfNecessaryWithCycleSet:0];
  baseUnitReduction = self->_baseUnitReduction;

  return baseUnitReduction;
}

- (double)_convertToBaseUnit:(double)a3
{
  [(HKUnit *)self _reducedProportionalSize];
  double v6 = v5;
  [(HKUnit *)self scaleOffset];
  return v7 + a3 * v6;
}

- (double)_convertFromBaseUnit:(double)a3
{
  [(HKUnit *)self scaleOffset];
  double v6 = a3 - v5;
  [(HKUnit *)self _reducedProportionalSize];
  return v6 / v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_heightUnitForLocale:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F1C490]];
  int v4 = [v3 BOOLValue];

  if (v4) {
    +[HKUnit meterUnitWithMetricPrefix:5];
  }
  else {
  double v5 = +[HKUnit footUnit];
  }

  return v5;
}

+ (id)_distanceUnitForLocale:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F1C490]];
  int v4 = [v3 BOOLValue];

  if (v4) {
    +[HKUnit meterUnitWithMetricPrefix:9];
  }
  else {
  double v5 = +[HKUnit mileUnit];
  }

  return v5;
}

+ (id)_personMassUnitForLocale:(id)a3
{
  id v3 = a3;
  int v4 = [v3 localeIdentifier];
  int v5 = [v4 isEqualToString:@"en_GB"];

  if (v5)
  {
    uint64_t v6 = +[HKUnit stoneUnit];
  }
  else
  {
    double v7 = [v3 objectForKey:*MEMORY[0x1E4F1C490]];
    int v8 = [v7 BOOLValue];

    if (v8) {
      +[HKUnit gramUnitWithMetricPrefix:9];
    }
    else {
    uint64_t v6 = +[HKUnit poundUnit];
    }
  }
  BOOL v9 = (void *)v6;

  return v9;
}

+ (id)_temperatureUnitForLocale:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F1C490]];
  int v4 = [v3 BOOLValue];

  if (v4) {
    +[HKUnit degreeCelsiusUnit];
  }
  else {
  int v5 = +[HKUnit degreeFahrenheitUnit];
  }

  return v5;
}

+ (id)_foodEnergyUnitForLocale:(id)a3
{
  id v3 = [a3 objectForKey:*MEMORY[0x1E4F1C490]];
  int v4 = [v3 BOOLValue];

  if (v4) {
    +[HKUnit jouleUnitWithMetricPrefix:9];
  }
  else {
  int v5 = +[HKUnit kilocalorieUnit];
  }

  return v5;
}

- (NSString)unitString
{
  return (NSString *)&stru_1EEC60288;
}

- (_HKDimension)dimension
{
  return 0;
}

- (_HKFactorization)_baseUnits
{
  return 0;
}

- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  return 0;
}

@end