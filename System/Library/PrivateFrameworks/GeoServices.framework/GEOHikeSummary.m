@interface GEOHikeSummary
- (GEOHikeSummary)initWithPDHikeSummary:(id)a3;
- (GEOPDHikeSummary)hikeSummary;
- (NSMeasurement)elevationGainMeters;
- (NSMeasurement)elevationLossMeters;
- (NSMeasurement)expectedDurationSeconds;
- (NSMeasurement)lengthMeters;
- (id)_GEOStringForDistanceMeasurement:(id)a3 forUnit:(id)a4 allowUnitConversion:(BOOL)a5;
- (id)durationString;
- (id)elevationGainStringForUnit:(id)a3;
- (id)elevationLossStringForUnit:(id)a3;
- (id)hikeTypeNameString;
- (id)lengthStringForUnit:(id)a3;
- (void)setElevationGainMeters:(id)a3;
- (void)setElevationLossMeters:(id)a3;
- (void)setExpectedDurationSeconds:(id)a3;
- (void)setLengthMeters:(id)a3;
@end

@implementation GEOHikeSummary

- (GEOHikeSummary)initWithPDHikeSummary:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v30.receiver = self;
    v30.super_class = (Class)GEOHikeSummary;
    v6 = [(GEOHikeSummary *)&v30 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_hikeSummary, a3);
      if ([v5 hasSumElevationGainCm])
      {
        id v8 = objc_alloc(MEMORY[0x1E4F28E28]);
        double v9 = (double)[v5 sumElevationGainCm] / 100.0;
        v10 = [MEMORY[0x1E4F291E0] meters];
        uint64_t v11 = [v8 initWithDoubleValue:v10 unit:v9];
        elevationGainMeters = v7->_elevationGainMeters;
        v7->_elevationGainMeters = (NSMeasurement *)v11;
      }
      if ([v5 hasSumElevationLossCm])
      {
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        double v14 = (double)[v5 sumElevationLossCm] / 100.0;
        v15 = [MEMORY[0x1E4F291E0] meters];
        uint64_t v16 = [v13 initWithDoubleValue:v15 unit:v14];
        elevationLossMeters = v7->_elevationLossMeters;
        v7->_elevationLossMeters = (NSMeasurement *)v16;
      }
      if ([v5 hasExpectedDurationSeconds])
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28E28]);
        double v19 = (double)[v5 expectedDurationSeconds];
        v20 = [MEMORY[0x1E4F29180] seconds];
        uint64_t v21 = [v18 initWithDoubleValue:v20 unit:v19];
        expectedDurationSeconds = v7->_expectedDurationSeconds;
        v7->_expectedDurationSeconds = (NSMeasurement *)v21;
      }
      if ([v5 hasLengthMeters])
      {
        id v23 = objc_alloc(MEMORY[0x1E4F28E28]);
        double v24 = (double)[v5 lengthMeters];
        v25 = [MEMORY[0x1E4F291E0] meters];
        uint64_t v26 = [v23 initWithDoubleValue:v25 unit:v24];
        lengthMeters = v7->_lengthMeters;
        v7->_lengthMeters = (NSMeasurement *)v26;
      }
    }
    self = v7;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)elevationLossStringForUnit:(id)a3
{
  elevationLossMeters = self->_elevationLossMeters;
  if (elevationLossMeters)
  {
    id v5 = [(GEOHikeSummary *)self _GEOStringForDistanceMeasurement:elevationLossMeters forUnit:a3 allowUnitConversion:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)elevationGainStringForUnit:(id)a3
{
  elevationGainMeters = self->_elevationGainMeters;
  if (elevationGainMeters)
  {
    id v5 = [(GEOHikeSummary *)self _GEOStringForDistanceMeasurement:elevationGainMeters forUnit:a3 allowUnitConversion:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)lengthStringForUnit:(id)a3
{
  lengthMeters = self->_lengthMeters;
  if (lengthMeters)
  {
    id v5 = [(GEOHikeSummary *)self _GEOStringForDistanceMeasurement:lengthMeters forUnit:a3 allowUnitConversion:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)durationString
{
  expectedDurationSeconds = self->_expectedDurationSeconds;
  if (expectedDurationSeconds)
  {
    [expectedDurationSeconds doubleValue];
    expectedDurationSeconds = GEOStringForDuration(1, v3);
  }

  return expectedDurationSeconds;
}

- (id)hikeTypeNameString
{
  if ([(GEOPDHikeSummary *)self->_hikeSummary hasHikeTypeName])
  {
    double v3 = [GEOComposedString alloc];
    v4 = [(GEOPDHikeSummary *)self->_hikeSummary hikeTypeName];
    id v5 = [(GEOComposedString *)v3 initWithGeoFormattedString:v4];

    v6 = [(GEOComposedString *)v5 stringWithDefaultOptions];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_GEOStringForDistanceMeasurement:(id)a3 forUnit:(id)a4 allowUnitConversion:(BOOL)a5
{
  BOOL v5 = a5;
  v6 = [a3 measurementByConvertingToUnit:a4];
  if (v5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 97;
  }
  id v8 = +[GEOComposedString localizationProvider];
  double v9 = _GEOStringForDistanceMeasurement(v6, v8, v7, 0);

  return v9;
}

- (NSMeasurement)elevationGainMeters
{
  return self->_elevationGainMeters;
}

- (void)setElevationGainMeters:(id)a3
{
}

- (NSMeasurement)elevationLossMeters
{
  return self->_elevationLossMeters;
}

- (void)setElevationLossMeters:(id)a3
{
}

- (NSMeasurement)expectedDurationSeconds
{
  return self->_expectedDurationSeconds;
}

- (void)setExpectedDurationSeconds:(id)a3
{
}

- (NSMeasurement)lengthMeters
{
  return self->_lengthMeters;
}

- (void)setLengthMeters:(id)a3
{
}

- (GEOPDHikeSummary)hikeSummary
{
  return self->_hikeSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hikeSummary, 0);
  objc_storeStrong((id *)&self->_lengthMeters, 0);
  objc_storeStrong((id *)&self->_expectedDurationSeconds, 0);
  objc_storeStrong((id *)&self->_elevationLossMeters, 0);

  objc_storeStrong((id *)&self->_elevationGainMeters, 0);
}

@end