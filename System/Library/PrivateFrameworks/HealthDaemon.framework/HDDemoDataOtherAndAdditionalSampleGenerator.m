@interface HDDemoDataOtherAndAdditionalSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataOtherAndAdditionalSampleGenerator)initWithCoder:(id)a3;
- (id)_generateToothbrushingSampleForDate:(void *)a3 demoPerson:(double)a4 atTime:;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
@end

@implementation HDDemoDataOtherAndAdditionalSampleGenerator

- (HDDemoDataOtherAndAdditionalSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataOtherAndAdditionalSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v10 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"NextToothbrushingSampleTimeKey"];
    v5->_nextToothbrushingSampleTime = v6;
    [v4 decodeDoubleForKey:@"NextHandwashingSampleTimeKey"];
    v5->_nextHandwashingSampleTime = v7;
    [v4 decodeDoubleForKey:@"nexttimeInDaylightSampleTimeKey"];
    v5->_nexttimeInDaylightSampleTime = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataOtherAndAdditionalSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v6 encodeWithCoder:v4];
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"NextToothbrushingSampleTimeKey", self->_nextToothbrushingSampleTime, v6.receiver, v6.super_class);
    [v4 encodeDouble:@"NextHandwashingSampleTimeKey" forKey:self->_nextHandwashingSampleTime];
    double nexttimeInDaylightSampleTime = self->_nexttimeInDaylightSampleTime;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"NextToothbrushingSampleTimeKey", 0.0, v6.receiver, v6.super_class);
    [v4 encodeDouble:@"NextHandwashingSampleTimeKey" forKey:0.0];
    double nexttimeInDaylightSampleTime = 0.0;
  }
  [v4 encodeDouble:@"nexttimeInDaylightSampleTimeKey" forKey:nexttimeInDaylightSampleTime];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v113.receiver = self;
  v113.super_class = (Class)HDDemoDataOtherAndAdditionalSampleGenerator;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v113 generateObjectsForDemoPerson:v13 fromTime:v12 toTime:v11 currentDate:a5 objectCollection:a5];
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  v17 = v16;
  if (!self)
  {

    id v102 = v14;
    id v103 = v15;
    id v104 = v17;
    goto LABEL_10;
  }
  v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if (self->_nextToothbrushingSampleTime <= a5)
  {
    id v110 = v18;
    id v19 = v18;
    v20 = [v19 components:30 fromDate:v15];
    [v20 setHour:8];
    [v20 setMinute:arc4random_uniform(0x3Bu)];
    v107 = [v19 dateFromComponents:v20];

    id v21 = v19;
    v22 = [v21 components:30 fromDate:v15];
    [v22 setHour:21];
    [v22 setMinute:arc4random_uniform(0x3Bu)];
    v105 = [v21 dateFromComponents:v22];

    v23 = -[HDDemoDataOtherAndAdditionalSampleGenerator _generateToothbrushingSampleForDate:demoPerson:atTime:](self, v107, v14, a5);
    v24 = -[HDDemoDataOtherAndAdditionalSampleGenerator _generateToothbrushingSampleForDate:demoPerson:atTime:](self, v105, v14, a5);
    [v17 addObjectFromPhone:v23];
    [v17 addObjectFromPhone:v24];
    v25 = (void *)MEMORY[0x1E4F1C9A8];
    id v26 = v15;
    v27 = [v25 currentCalendar];
    v28 = [v27 components:254 fromDate:v26];

    objc_msgSend(v28, "setHour:", objc_msgSend(v28, "hour") + 24);
    self->_nextToothbrushingSampleTime = floor(a5) + HDDemoData_timeFromNSDateComponents(v28);

    v18 = v110;
  }

  id v29 = v14;
  id v30 = v15;
  id v31 = v17;
  if (self->_nextHandwashingSampleTime <= a5)
  {
    id v111 = v31;
    v32 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v33 = [v32 sleepSampleGenerator];
    if (([v33 isDemoPersonAwake:v29 atTime:a5] & 1) == 0)
    {

      goto LABEL_9;
    }
    [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v34 = v108 = v17;
    [v34 activitySampleGenerator];
    v36 = id v35 = v30;
    char v37 = [v36 _isDemoPersonSedentary:v29 atTime:a5];

    v38 = v35;
    v17 = v108;

    if ((v37 & 1) == 0)
    {
      id v39 = v29;
      id v40 = v38;
      [v39 handwashingDurationMean];
      double v42 = v41;
      [v39 handwashingDurationMeanStdDev];
      double v44 = v43;

      v45 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v46 = [v45 statisticsSampleGenerator];
      [v46 computeNoiseFromTime:a5 stdDev:v44];
      double v48 = v42 + v47;

      v49 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297B8]];
      v50 = (void *)MEMORY[0x1E4F2ACB0];
      v51 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v40 sinceDate:v48];
      v32 = [v50 categorySampleWithType:v49 value:0 startDate:v40 endDate:v51];

      [v111 addObjectFromWatch:v32];
      [v39 handwashingSampleFrequency];
      double v53 = v52;
      [v39 handwashingSampleFrequencyStdDev];
      double v55 = v54;
      v56 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v57 = [v56 statisticsSampleGenerator];
      [v57 computeStatisticalTimeFromCurrentTime:a5 mean:v53 stdDev:v55];
      double v59 = v58;

      self->_nextHandwashingSampleTime = v59 + a5;
LABEL_9:
    }
  }
LABEL_10:

  id v60 = v14;
  id v61 = v15;
  id v62 = v17;
  if (self)
  {
    if (self->_nexttimeInDaylightSampleTime <= a5)
    {
      v63 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v64 = [v63 sleepSampleGenerator];
      int v65 = [v64 isDemoPersonAwake:v60 atTime:a5];

      if (v65)
      {
        id v66 = v60;
        id v67 = v61;
        [v66 timeInDaylightDurationMean];
        double v69 = v68;
        [v66 timeInDaylightDurationMeanStdDev];
        double v71 = v70;

        double v72 = (double)arc4random_uniform(0x32u) / 100.0 + 5.0;
        double v73 = v72 + (double)arc4random_uniform(5u);
        v74 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v75 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        int v76 = [v74 isDemoDataTimeInWeekend:v75 calendar:a5];

        id v112 = v66;
        id v106 = v61;
        v77 = v67;
        if (v76) {
          double v73 = v73 + (double)arc4random_uniform(3u);
        }
        id v109 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint32_t v78 = arc4random_uniform(0x32u);
        double v79 = (double)(v78 + arc4random_uniform(0x514u) + 150);
        v80 = (void *)MEMORY[0x1E4F2B370];
        v81 = [MEMORY[0x1E4F2B618] luxUnit];
        v82 = [v80 quantityWithUnit:v81 doubleValue:v79];
        [v109 setObject:v82 forKeyedSubscript:*MEMORY[0x1E4F2A198]];

        v83 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v84 = [v83 statisticsSampleGenerator];
        [v84 computeNoiseFromTime:a5 stdDev:v71];
        double v86 = v69 + v85;

        v87 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A900]];
        v88 = (void *)MEMORY[0x1E4F2B388];
        v89 = (void *)MEMORY[0x1E4F2B370];
        v90 = [MEMORY[0x1E4F2B618] minuteUnit];
        v91 = [v89 quantityWithUnit:v90 doubleValue:v73];
        v92 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v77 sinceDate:v86];
        v93 = [v88 quantitySampleWithType:v87 quantity:v91 startDate:v77 endDate:v92 metadata:v109];

        [v62 addObjectFromWatch:v93];
        [v112 timeInDaylightSampleFrequency];
        double v95 = v94;
        [v112 timeInDaylightSampleFrequencyStdDev];
        double v97 = v96;
        v98 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v99 = [v98 statisticsSampleGenerator];
        [v99 computeStatisticalTimeFromCurrentTime:a5 mean:v95 stdDev:v97];
        double v101 = v100;

        self->_double nexttimeInDaylightSampleTime = v101 + a5;
        id v61 = v106;
      }
    }
  }
}

- (id)_generateToothbrushingSampleForDate:(void *)a3 demoPerson:(double)a4 atTime:
{
  id v7 = a3;
  id v8 = a2;
  [v7 toothbrushingDurationMean];
  double v10 = v9;
  [v7 toothbrushingDurationMeanStdDev];
  double v12 = v11;

  id v13 = [a1 demoDataGenerator];
  id v14 = [v13 statisticsSampleGenerator];
  [v14 computeNoiseFromTime:a4 stdDev:v12];
  double v16 = v10 + v15;

  v17 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29888]];
  v18 = (void *)MEMORY[0x1E4F2ACB0];
  id v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v8 sinceDate:v16];
  v20 = [v18 categorySampleWithType:v17 value:0 startDate:v8 endDate:v19];

  return v20;
}

@end