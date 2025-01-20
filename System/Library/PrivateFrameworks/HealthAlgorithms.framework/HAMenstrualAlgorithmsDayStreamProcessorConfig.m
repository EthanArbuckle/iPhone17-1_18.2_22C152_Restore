@interface HAMenstrualAlgorithmsDayStreamProcessorConfig
+ (BOOL)supportsSecureCoding;
- (HAMenstrualAlgorithmsDayStreamProcessorConfig)initWithCoder:(id)a3;
- (HAMenstrualAlgorithmsDeviationInput)deviationInput;
- (NSDateComponents)birthDateComponents;
- (NSNumber)julianDayOfUserReportedCycleLength;
- (NSNumber)julianDayOfUserReportedMenstruationLength;
- (NSNumber)userReportedCycleLength;
- (NSNumber)userReportedMenstruationLength;
- (unsigned)todayAsJulianDay;
- (void)encodeWithCoder:(id)a3;
- (void)setBirthDateComponents:(id)a3;
- (void)setDeviationInput:(id)a3;
- (void)setJulianDayOfUserReportedCycleLength:(id)a3;
- (void)setJulianDayOfUserReportedMenstruationLength:(id)a3;
- (void)setTodayAsJulianDay:(unsigned int)a3;
- (void)setUserReportedCycleLength:(id)a3;
- (void)setUserReportedMenstruationLength:(id)a3;
@end

@implementation HAMenstrualAlgorithmsDayStreamProcessorConfig

- (NSNumber)userReportedMenstruationLength
{
  return self->_userReportedMenstruationLength;
}

- (NSNumber)userReportedCycleLength
{
  return self->_userReportedCycleLength;
}

- (NSNumber)julianDayOfUserReportedMenstruationLength
{
  return self->_julianDayOfUserReportedMenstruationLength;
}

- (NSNumber)julianDayOfUserReportedCycleLength
{
  return self->_julianDayOfUserReportedCycleLength;
}

- (HAMenstrualAlgorithmsDeviationInput)deviationInput
{
  return self->_deviationInput;
}

- (NSDateComponents)birthDateComponents
{
  return self->_birthDateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviationInput, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_julianDayOfUserReportedMenstruationLength, 0);
  objc_storeStrong((id *)&self->_userReportedMenstruationLength, 0);
  objc_storeStrong((id *)&self->_julianDayOfUserReportedCycleLength, 0);
  objc_storeStrong((id *)&self->_userReportedCycleLength, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  userReportedCycleLength = self->_userReportedCycleLength;
  v5 = NSStringFromSelector(sel_userReportedCycleLength);
  [v18 encodeObject:userReportedCycleLength forKey:v5];

  julianDayOfUserReportedCycleLength = self->_julianDayOfUserReportedCycleLength;
  v7 = NSStringFromSelector(sel_julianDayOfUserReportedCycleLength);
  [v18 encodeObject:julianDayOfUserReportedCycleLength forKey:v7];

  userReportedMenstruationLength = self->_userReportedMenstruationLength;
  v9 = NSStringFromSelector(sel_userReportedMenstruationLength);
  [v18 encodeObject:userReportedMenstruationLength forKey:v9];

  julianDayOfUserReportedMenstruationLength = self->_julianDayOfUserReportedMenstruationLength;
  v11 = NSStringFromSelector(sel_julianDayOfUserReportedMenstruationLength);
  [v18 encodeObject:julianDayOfUserReportedMenstruationLength forKey:v11];

  birthDateComponents = self->_birthDateComponents;
  v13 = NSStringFromSelector(sel_birthDateComponents);
  [v18 encodeObject:birthDateComponents forKey:v13];

  deviationInput = self->_deviationInput;
  v15 = NSStringFromSelector(sel_deviationInput);
  [v18 encodeObject:deviationInput forKey:v15];

  uint64_t todayAsJulianDay = self->_todayAsJulianDay;
  v17 = NSStringFromSelector(sel_todayAsJulianDay);
  [v18 encodeInt32:todayAsJulianDay forKey:v17];
}

- (HAMenstrualAlgorithmsDayStreamProcessorConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HAMenstrualAlgorithmsDayStreamProcessorConfig;
  v5 = [(HAMenstrualAlgorithmsDayStreamProcessorConfig *)&v33 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_userReportedCycleLength);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    userReportedCycleLength = v5->_userReportedCycleLength;
    v5->_userReportedCycleLength = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_julianDayOfUserReportedCycleLength);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    julianDayOfUserReportedCycleLength = v5->_julianDayOfUserReportedCycleLength;
    v5->_julianDayOfUserReportedCycleLength = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_userReportedMenstruationLength);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    userReportedMenstruationLength = v5->_userReportedMenstruationLength;
    v5->_userReportedMenstruationLength = (NSNumber *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_julianDayOfUserReportedMenstruationLength);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    julianDayOfUserReportedMenstruationLength = v5->_julianDayOfUserReportedMenstruationLength;
    v5->_julianDayOfUserReportedMenstruationLength = (NSNumber *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_birthDateComponents);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    birthDateComponents = v5->_birthDateComponents;
    v5->_birthDateComponents = (NSDateComponents *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_deviationInput);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    deviationInput = v5->_deviationInput;
    v5->_deviationInput = (HAMenstrualAlgorithmsDeviationInput *)v28;

    v30 = NSStringFromSelector(sel_todayAsJulianDay);
    v5->_uint64_t todayAsJulianDay = [v4 decodeInt32ForKey:v30];

    v31 = v5;
  }

  return v5;
}

- (unsigned)todayAsJulianDay
{
  return self->_todayAsJulianDay;
}

- (void)setUserReportedMenstruationLength:(id)a3
{
}

- (void)setUserReportedCycleLength:(id)a3
{
}

- (void)setTodayAsJulianDay:(unsigned int)a3
{
  self->_uint64_t todayAsJulianDay = a3;
}

- (void)setJulianDayOfUserReportedMenstruationLength:(id)a3
{
}

- (void)setJulianDayOfUserReportedCycleLength:(id)a3
{
}

- (void)setDeviationInput:(id)a3
{
}

- (void)setBirthDateComponents:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end