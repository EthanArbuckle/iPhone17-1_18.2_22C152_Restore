@interface HAMenstrualAlgorithmsDayInput
+ (BOOL)supportsSecureCoding;
- (BOOL)spotting;
- (HAMenstrualAlgorithmsDayInput)initWithCoder:(id)a3;
- (HAMenstrualAlgorithmsHeartRateStatistics)sedentaryHeartRateStatistics;
- (HAMenstrualAlgorithmsHeartRateStatistics)sleepHeartRateStatistics;
- (HAMenstrualAlgorithmsWristTemperature)wristTemperature;
- (unsigned)flow;
- (unsigned)julianDay;
- (unsigned)ovulationTestResult;
- (void)encodeWithCoder:(id)a3;
- (void)setFlow:(unsigned __int8)a3;
- (void)setJulianDay:(unsigned int)a3;
- (void)setOvulationTestResult:(unsigned __int8)a3;
- (void)setSedentaryHeartRateStatistics:(id)a3;
- (void)setSleepHeartRateStatistics:(id)a3;
- (void)setSpotting:(BOOL)a3;
- (void)setWristTemperature:(id)a3;
@end

@implementation HAMenstrualAlgorithmsDayInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  uint64_t julianDay = self->_julianDay;
  v5 = NSStringFromSelector(sel_julianDay);
  [v17 encodeInt32:julianDay forKey:v5];

  uint64_t flow = self->_flow;
  v7 = NSStringFromSelector(sel_flow);
  [v17 encodeInt32:flow forKey:v7];

  LODWORD(flow) = self->_spotting;
  v8 = NSStringFromSelector(sel_spotting);
  [v17 encodeBool:flow != 0 forKey:v8];

  uint64_t ovulationTestResult = self->_ovulationTestResult;
  v10 = NSStringFromSelector(sel_ovulationTestResult);
  [v17 encodeInt32:ovulationTestResult forKey:v10];

  sedentaryHeartRateStatistics = self->_sedentaryHeartRateStatistics;
  v12 = NSStringFromSelector(sel_sedentaryHeartRateStatistics);
  [v17 encodeObject:sedentaryHeartRateStatistics forKey:v12];

  sleepHeartRateStatistics = self->_sleepHeartRateStatistics;
  v14 = NSStringFromSelector(sel_sleepHeartRateStatistics);
  [v17 encodeObject:sleepHeartRateStatistics forKey:v14];

  wristTemperature = self->_wristTemperature;
  v16 = NSStringFromSelector(sel_wristTemperature);
  [v17 encodeObject:wristTemperature forKey:v16];
}

- (HAMenstrualAlgorithmsDayInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAMenstrualAlgorithmsDayInput *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_julianDay);
    v5->_uint64_t julianDay = [v4 decodeInt32ForKey:v6];

    v7 = NSStringFromSelector(sel_flow);
    v5->_uint64_t flow = [v4 decodeInt32ForKey:v7];

    v8 = NSStringFromSelector(sel_spotting);
    v5->_spotting = [v4 decodeBoolForKey:v8];

    v9 = NSStringFromSelector(sel_ovulationTestResult);
    v5->_uint64_t ovulationTestResult = [v4 decodeInt32ForKey:v9];

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_sedentaryHeartRateStatistics);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    sedentaryHeartRateStatistics = v5->_sedentaryHeartRateStatistics;
    v5->_sedentaryHeartRateStatistics = (HAMenstrualAlgorithmsHeartRateStatistics *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_sleepHeartRateStatistics);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    sleepHeartRateStatistics = v5->_sleepHeartRateStatistics;
    v5->_sleepHeartRateStatistics = (HAMenstrualAlgorithmsHeartRateStatistics *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_wristTemperature);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    wristTemperature = v5->_wristTemperature;
    v5->_wristTemperature = (HAMenstrualAlgorithmsWristTemperature *)v20;

    v22 = v5;
  }

  return v5;
}

- (unsigned)julianDay
{
  return self->_julianDay;
}

- (void)setJulianDay:(unsigned int)a3
{
  self->_uint64_t julianDay = a3;
}

- (unsigned)flow
{
  return self->_flow;
}

- (void)setFlow:(unsigned __int8)a3
{
  self->_uint64_t flow = a3;
}

- (BOOL)spotting
{
  return self->_spotting;
}

- (void)setSpotting:(BOOL)a3
{
  self->_spotting = a3;
}

- (unsigned)ovulationTestResult
{
  return self->_ovulationTestResult;
}

- (void)setOvulationTestResult:(unsigned __int8)a3
{
  self->_uint64_t ovulationTestResult = a3;
}

- (HAMenstrualAlgorithmsHeartRateStatistics)sedentaryHeartRateStatistics
{
  return self->_sedentaryHeartRateStatistics;
}

- (void)setSedentaryHeartRateStatistics:(id)a3
{
}

- (HAMenstrualAlgorithmsHeartRateStatistics)sleepHeartRateStatistics
{
  return self->_sleepHeartRateStatistics;
}

- (void)setSleepHeartRateStatistics:(id)a3
{
}

- (HAMenstrualAlgorithmsWristTemperature)wristTemperature
{
  return self->_wristTemperature;
}

- (void)setWristTemperature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristTemperature, 0);
  objc_storeStrong((id *)&self->_sleepHeartRateStatistics, 0);
  objc_storeStrong((id *)&self->_sedentaryHeartRateStatistics, 0);
}

@end