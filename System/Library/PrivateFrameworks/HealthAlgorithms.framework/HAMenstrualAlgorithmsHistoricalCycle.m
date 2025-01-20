@interface HAMenstrualAlgorithmsHistoricalCycle
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeterminant;
- (HAMenstrualAlgorithmsHistoricalCycle)init;
- (HAMenstrualAlgorithmsHistoricalCycle)initWithCoder:(id)a3;
- (NSArray)phases;
- (NSNumber)fertilityEndJulianDay;
- (NSNumber)fertilityStartJulianDay;
- (int64_t)dailyEligibleWristTemperatureCount;
- (unsigned)julianDayOfMenstruationEnd;
- (unsigned)julianDayOfMenstruationStart;
- (unsigned)ovulationConfirmationFailure;
- (unsigned)predictionPrimarySource;
- (void)encodeWithCoder:(id)a3;
- (void)setDailyEligibleWristTemperatureCount:(int64_t)a3;
- (void)setFertilityEndJulianDay:(id)a3;
- (void)setFertilityStartJulianDay:(id)a3;
- (void)setIsDeterminant:(BOOL)a3;
- (void)setJulianDayOfMenstruationEnd:(unsigned int)a3;
- (void)setJulianDayOfMenstruationStart:(unsigned int)a3;
- (void)setOvulationConfirmationFailure:(unsigned __int8)a3;
- (void)setPhases:(id)a3;
- (void)setPredictionPrimarySource:(unsigned __int8)a3;
@end

@implementation HAMenstrualAlgorithmsHistoricalCycle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsHistoricalCycle)init
{
  v7.receiver = self;
  v7.super_class = (Class)HAMenstrualAlgorithmsHistoricalCycle;
  v2 = [(HAMenstrualAlgorithmsHistoricalCycle *)&v7 init];
  v3 = v2;
  if (v2)
  {
    phases = v2->_phases;
    v2->_phases = (NSArray *)MEMORY[0x263EFFA68];

    v5 = v3;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  fertilityStartJulianDay = self->_fertilityStartJulianDay;
  v5 = NSStringFromSelector(sel_fertilityStartJulianDay);
  [v21 encodeObject:fertilityStartJulianDay forKey:v5];

  fertilityEndJulianDay = self->_fertilityEndJulianDay;
  objc_super v7 = NSStringFromSelector(sel_fertilityEndJulianDay);
  [v21 encodeObject:fertilityEndJulianDay forKey:v7];

  uint64_t julianDayOfMenstruationStart = self->_julianDayOfMenstruationStart;
  v9 = NSStringFromSelector(sel_julianDayOfMenstruationStart);
  [v21 encodeInt32:julianDayOfMenstruationStart forKey:v9];

  uint64_t julianDayOfMenstruationEnd = self->_julianDayOfMenstruationEnd;
  v11 = NSStringFromSelector(sel_julianDayOfMenstruationEnd);
  [v21 encodeInt32:julianDayOfMenstruationEnd forKey:v11];

  LODWORD(julianDayOfMenstruationEnd) = self->_isDeterminant;
  v12 = NSStringFromSelector(sel_isDeterminant);
  [v21 encodeBool:julianDayOfMenstruationEnd != 0 forKey:v12];

  uint64_t predictionPrimarySource = self->_predictionPrimarySource;
  v14 = NSStringFromSelector(sel_predictionPrimarySource);
  [v21 encodeInt32:predictionPrimarySource forKey:v14];

  phases = self->_phases;
  v16 = NSStringFromSelector(sel_phases);
  [v21 encodeObject:phases forKey:v16];

  int64_t dailyEligibleWristTemperatureCount = self->_dailyEligibleWristTemperatureCount;
  v18 = NSStringFromSelector(sel_dailyEligibleWristTemperatureCount);
  [v21 encodeInteger:dailyEligibleWristTemperatureCount forKey:v18];

  uint64_t ovulationConfirmationFailure = self->_ovulationConfirmationFailure;
  v20 = NSStringFromSelector(sel_ovulationConfirmationFailure);
  [v21 encodeInt32:ovulationConfirmationFailure forKey:v20];
}

- (HAMenstrualAlgorithmsHistoricalCycle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAMenstrualAlgorithmsHistoricalCycle *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_fertilityStartJulianDay);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    fertilityStartJulianDay = v5->_fertilityStartJulianDay;
    v5->_fertilityStartJulianDay = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_fertilityEndJulianDay);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    fertilityEndJulianDay = v5->_fertilityEndJulianDay;
    v5->_fertilityEndJulianDay = (NSNumber *)v12;

    v14 = NSStringFromSelector(sel_julianDayOfMenstruationStart);
    v5->_uint64_t julianDayOfMenstruationStart = [v4 decodeInt32ForKey:v14];

    v15 = NSStringFromSelector(sel_julianDayOfMenstruationEnd);
    v5->_uint64_t julianDayOfMenstruationEnd = [v4 decodeInt32ForKey:v15];

    v16 = NSStringFromSelector(sel_isDeterminant);
    v5->_isDeterminant = [v4 decodeBoolForKey:v16];

    v17 = NSStringFromSelector(sel_predictionPrimarySource);
    v5->_uint64_t predictionPrimarySource = [v4 decodeInt32ForKey:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_phases);
    uint64_t v20 = [v4 decodeArrayOfObjectsOfClass:v18 forKey:v19];
    phases = v5->_phases;
    v5->_phases = (NSArray *)v20;

    v22 = NSStringFromSelector(sel_dailyEligibleWristTemperatureCount);
    v5->_int64_t dailyEligibleWristTemperatureCount = [v4 decodeIntegerForKey:v22];

    v23 = NSStringFromSelector(sel_ovulationConfirmationFailure);
    v5->_uint64_t ovulationConfirmationFailure = [v4 decodeInt32ForKey:v23];

    v24 = v5;
  }

  return v5;
}

- (NSNumber)fertilityStartJulianDay
{
  return self->_fertilityStartJulianDay;
}

- (void)setFertilityStartJulianDay:(id)a3
{
}

- (NSNumber)fertilityEndJulianDay
{
  return self->_fertilityEndJulianDay;
}

- (void)setFertilityEndJulianDay:(id)a3
{
}

- (unsigned)julianDayOfMenstruationStart
{
  return self->_julianDayOfMenstruationStart;
}

- (void)setJulianDayOfMenstruationStart:(unsigned int)a3
{
  self->_uint64_t julianDayOfMenstruationStart = a3;
}

- (unsigned)julianDayOfMenstruationEnd
{
  return self->_julianDayOfMenstruationEnd;
}

- (void)setJulianDayOfMenstruationEnd:(unsigned int)a3
{
  self->_uint64_t julianDayOfMenstruationEnd = a3;
}

- (BOOL)isDeterminant
{
  return self->_isDeterminant;
}

- (void)setIsDeterminant:(BOOL)a3
{
  self->_isDeterminant = a3;
}

- (unsigned)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(unsigned __int8)a3
{
  self->_uint64_t predictionPrimarySource = a3;
}

- (NSArray)phases
{
  return self->_phases;
}

- (void)setPhases:(id)a3
{
}

- (int64_t)dailyEligibleWristTemperatureCount
{
  return self->_dailyEligibleWristTemperatureCount;
}

- (void)setDailyEligibleWristTemperatureCount:(int64_t)a3
{
  self->_int64_t dailyEligibleWristTemperatureCount = a3;
}

- (unsigned)ovulationConfirmationFailure
{
  return self->_ovulationConfirmationFailure;
}

- (void)setOvulationConfirmationFailure:(unsigned __int8)a3
{
  self->_uint64_t ovulationConfirmationFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phases, 0);
  objc_storeStrong((id *)&self->_fertilityEndJulianDay, 0);
  objc_storeStrong((id *)&self->_fertilityStartJulianDay, 0);
}

@end