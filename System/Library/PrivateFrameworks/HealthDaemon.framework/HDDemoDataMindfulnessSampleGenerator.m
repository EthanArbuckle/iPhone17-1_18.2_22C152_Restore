@interface HDDemoDataMindfulnessSampleGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)didGenerateMindfulnessMinute;
- (HDDemoDataMindfulnessSampleGenerator)init;
- (HDDemoDataMindfulnessSampleGenerator)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataMindfulnessSampleGenerator

- (HDDemoDataMindfulnessSampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result)
  {
    result->_nextMindfulSessionSampleTime = 0.0;
    result->_didGenerateMindfulnessMinute = 0;
  }
  return result;
}

- (HDDemoDataMindfulnessSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"NextMindfulnessMinuteSampleTime"];
    v5->_nextMindfulSessionSampleTime = v6;
    v5->_didGenerateMindfulnessMinute = [v4 decodeBoolForKey:@"_DidGenerateMindfulnessMinuteKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v6 encodeWithCoder:v4];
  if (self) {
    double nextMindfulSessionSampleTime = self->_nextMindfulSessionSampleTime;
  }
  else {
    double nextMindfulSessionSampleTime = 0.0;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", @"NextMindfulnessMinuteSampleTime", nextMindfulSessionSampleTime, v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", -[HDDemoDataMindfulnessSampleGenerator didGenerateMindfulnessMinute](self, "didGenerateMindfulnessMinute"), @"_DidGenerateMindfulnessMinuteKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v3 setupWithDemoDataGenerator:a3];
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  v89.receiver = self;
  v89.super_class = (Class)HDDemoDataMindfulnessSampleGenerator;
  id v13 = a6;
  [(HDDemoDataBaseSampleGenerator *)&v89 generateObjectsForDemoPerson:v11 fromTime:v13 toTime:v12 currentDate:a5 objectCollection:a5];
  id v14 = v11;
  id v15 = v13;
  if (!self || self->_nextMindfulSessionSampleTime > a5) {
    goto LABEL_3;
  }
  v17 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v18 = [v17 sleepSampleGenerator];
  if (![v18 isDemoPersonAwake:v14 atTime:a5]) {
    goto LABEL_13;
  }
  v19 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v20 = [v19 activitySampleGenerator];
  if (([v20 _isDemoPersonInWorkoutRecovery:v14 atTime:a5] & 1) == 0)
  {
    v85 = v14;
    v21 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v22 = [v21 generatorState];
    v87 = self;
    char v23 = [v22 isExercising];

    if (v23)
    {
      v16 = 0;
      id v14 = v85;
      self = v87;
      goto LABEL_15;
    }
    id v14 = v85;
    [v85 mindfulSessionFrequency];
    self = v87;
    v87->_double nextMindfulSessionSampleTime = v24 + a5;
    [v85 mindfulSessionFrequency];
    long double v26 = exp2(v25 * -2.0) * 100.0;
    if (v26 <= (double)arc4random_uniform(0x64u))
    {
LABEL_3:
      v16 = 0;
      goto LABEL_15;
    }
    v27 = [(HDDemoDataBaseSampleGenerator *)v87 demoDataGenerator];
    v28 = [v27 statisticsSampleGenerator];
    objc_msgSend(v28, "computeNoiseFromTime:stdDev:", a5, (double)objc_msgSend(v85, "mindfulSessionStdDev"));
    double v30 = v29;

    uint64_t v31 = llround(v30 + (double)[v85 mindfulSessionMean]);
    v17 = objc_msgSend(&unk_1F17EAE78, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(&unk_1F17EAE78, "count")));
    uint32_t v32 = arc4random_uniform(0x1Eu);
    uint64_t v33 = *MEMORY[0x1E4F2BAD8];
    v90[0] = *MEMORY[0x1E4F2BB60];
    v90[1] = v33;
    v91[0] = v17;
    v91[1] = &unk_1F17EF270;
    v90[2] = *MEMORY[0x1E4F2BAE0];
    v34 = [NSNumber numberWithInteger:v32 + 60];
    v91[2] = v34;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];

    if (v31 >= 1)
    {
      v19 = [v15 dateByAddingTimeInterval:(double)(60 * v31)];
      v35 = (void *)MEMORY[0x1E4F2ACB0];
      v20 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29818]];
      v16 = [v35 categorySampleWithType:v20 value:0 startDate:v15 endDate:v19 metadata:v18];
      goto LABEL_7;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_7:

LABEL_14:
LABEL_15:

  if (v16)
  {
    [v12 addObjectFromWatch:v16];
    id v36 = v16;
    id v37 = v14;
    if (self)
    {
      v83 = v16;
      id v84 = v12;
      id v86 = v14;
      v88 = self;
      v39 = v37;
      v40 = [v36 endDate];
      v41 = [v36 startDate];
      [v40 timeIntervalSinceDate:v41];
      uint64_t v43 = (uint64_t)(v42 / 60.0);

      v44 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
      v45 = [MEMORY[0x1E4F1CA48] array];
      v82 = v36;
      v46 = [v36 startDate];
      [v46 timeIntervalSinceReferenceDate];
      double v48 = v47;

      uint64_t v49 = *MEMORY[0x1E4F2BB28];
      if (v43 >= 1)
      {
        do
        {
          double v48 = v48 + 60.0;
          uint64_t v50 = [v39 restingHeartRate];
          double v51 = (double)(v50 + arc4random_uniform(3u) + 2);
          v52 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v48];
          v53 = (void *)MEMORY[0x1E4F2B370];
          v54 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
          v55 = [v53 quantityWithUnit:v54 doubleValue:v51];

          v56 = (void *)MEMORY[0x1E4F2B388];
          v90[0] = v49;
          v91[0] = &unk_1F17EF288;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:1];
          v58 = [v56 quantitySampleWithType:v44 quantity:v55 startDate:v52 endDate:v52 metadata:v57];

          [v45 addObject:v58];
          --v43;
        }
        while (v43);
      }
      uint64_t v59 = [v39 restingHeartRate];
      double v60 = (double)(v59 + arc4random_uniform(3u) + 2);
      v61 = [v82 startDate];
      [v61 dateByAddingTimeInterval:-180.0];
      v62 = v39;
      v63 = id v81 = v39;

      v64 = (void *)MEMORY[0x1E4F2B370];
      v65 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
      v66 = [v64 quantityWithUnit:v65 doubleValue:v60];

      v67 = (void *)MEMORY[0x1E4F2B388];
      uint64_t v68 = v49;
      uint64_t v94 = v49;
      v95[0] = &unk_1F17EF240;
      v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
      v70 = [v67 quantitySampleWithType:v44 quantity:v66 startDate:v63 endDate:v63 metadata:v69];

      v38 = v45;
      [v45 addObject:v70];
      uint64_t v71 = [v62 restingHeartRate];
      double v72 = (double)(v71 + arc4random_uniform(3u) + 2);
      v73 = [v82 startDate];
      v74 = [v73 dateByAddingTimeInterval:120.0];

      v75 = (void *)MEMORY[0x1E4F2B370];
      v76 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
      v77 = [v75 quantityWithUnit:v76 doubleValue:v72];

      v78 = (void *)MEMORY[0x1E4F2B388];
      uint64_t v92 = v68;
      v93 = &unk_1F17EF240;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
      v80 = [v78 quantitySampleWithType:v44 quantity:v77 startDate:v74 endDate:v74 metadata:v79];

      [v38 addObject:v80];
      id v36 = v82;

      id v12 = v84;
      id v14 = v86;
      self = v88;
      v16 = v83;
      id v37 = v81;
    }
    else
    {
      v38 = 0;
    }

    [v12 addObjectsFromWatch:v38];
    if (self) {
      self->_didGenerateMindfulnessMinute = 1;
    }
  }
  else if (self)
  {
    self->_didGenerateMindfulnessMinute = 0;
  }
}

- (BOOL)didGenerateMindfulnessMinute
{
  return self->_didGenerateMindfulnessMinute;
}

@end