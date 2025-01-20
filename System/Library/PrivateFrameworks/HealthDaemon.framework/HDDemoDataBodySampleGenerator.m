@interface HDDemoDataBodySampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataBodySampleGenerator)init;
- (HDDemoDataBodySampleGenerator)initWithCoder:(id)a3;
- (double)lastHeightInCm;
- (double)lastWeightInKg;
- (double)weightChangeForDemoPerson:(double)a3 atTime:;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataBodySampleGenerator

- (HDDemoDataBodySampleGenerator)init
{
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataBodySampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v13 init];
  v3 = v2;
  if (v2)
  {
    boysHeightBirthTo36MonthsGrowthCurve = v2->_boysHeightBirthTo36MonthsGrowthCurve;
    v2->_boysHeightBirthTo36MonthsGrowthCurve = 0;

    boysHeight2To20YearsGrowthCurve = v3->_boysHeight2To20YearsGrowthCurve;
    v3->_boysHeight2To20YearsGrowthCurve = 0;

    boysWeightBirthTo36MonthsGrowthCurve = v3->_boysWeightBirthTo36MonthsGrowthCurve;
    v3->_boysWeightBirthTo36MonthsGrowthCurve = 0;

    boysWeight2To20YearsGrowthCurve = v3->_boysWeight2To20YearsGrowthCurve;
    v3->_boysWeight2To20YearsGrowthCurve = 0;

    girlsHeightBirthTo36MonthsGrowthCurve = v3->_girlsHeightBirthTo36MonthsGrowthCurve;
    v3->_girlsHeightBirthTo36MonthsGrowthCurve = 0;

    girlsHeight2To20YearsGrowthCurve = v3->_girlsHeight2To20YearsGrowthCurve;
    v3->_girlsHeight2To20YearsGrowthCurve = 0;

    girlsWeightBirthTo36MonthsGrowthCurve = v3->_girlsWeightBirthTo36MonthsGrowthCurve;
    v3->_girlsWeightBirthTo36MonthsGrowthCurve = 0;

    girlsWeight2To20YearsGrowthCurve = v3->_girlsWeight2To20YearsGrowthCurve;
    v3->_girlsWeight2To20YearsGrowthCurve = 0;

    v3->_nextHeightSampleTime = 0.0;
    v3->_nextWeightSampleTime = 0.0;
    v3->_lastHeightInCm = 0.0;
    v3->_lastWeightInKg = 0.0;
    v3->_weightAdultStartInKg = 0.0;
  }
  return v3;
}

- (HDDemoDataBodySampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDemoDataBodySampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v12 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataBodySampleGeneratorNextHeightSampleTimeKey"];
    v5->_nextHeightSampleTime = v6;
    [v4 decodeDoubleForKey:@"HDDemoDataBodySampleGeneratorNextWeightSampleTimeKey"];
    v5->_nextWeightSampleTime = v7;
    [v4 decodeDoubleForKey:@"HDDemoDataBodySampleGeneratorLastHeightInCmKey"];
    v5->_lastHeightInCm = v8;
    [v4 decodeDoubleForKey:@"HDDemoDataBodySampleGeneratorLastWeightInKgKey"];
    v5->_lastWeightInKg = v9;
    [v4 decodeDoubleForKey:@"HDDemoDataBodySampleGeneratorWeightAdultStartInKgKey"];
    v5->_weightAdultStartInKg = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataBodySampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataBodySampleGeneratorNextHeightSampleTimeKey", self->_nextHeightSampleTime, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataBodySampleGeneratorNextWeightSampleTimeKey" forKey:self->_nextWeightSampleTime];
  [v4 encodeDouble:@"HDDemoDataBodySampleGeneratorLastHeightInCmKey" forKey:self->_lastHeightInCm];
  [v4 encodeDouble:@"HDDemoDataBodySampleGeneratorLastWeightInKgKey" forKey:self->_lastWeightInKg];
  [v4 encodeDouble:@"HDDemoDataBodySampleGeneratorWeightAdultStartInKgKey" forKey:self->_weightAdultStartInKg];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HDDemoDataBodySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v31 setupWithDemoDataGenerator:v4];
  objc_super v5 = HDHealthDaemonFrameworkBundle();
  double v6 = [v5 pathForResource:@"CDCGrowthCurves50thPercentile" ofType:@"plist"];

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v6];
  double v8 = [v7 objectForKeyedSubscript:@"boysHeightBirthTo36MonthsGrowthCurve"];
  boysHeightBirthTo36MonthsGrowthCurve = self->_boysHeightBirthTo36MonthsGrowthCurve;
  self->_boysHeightBirthTo36MonthsGrowthCurve = v8;

  double v10 = [v7 objectForKeyedSubscript:@"boysHeight2To20YearsGrowthCurve"];
  boysHeight2To20YearsGrowthCurve = self->_boysHeight2To20YearsGrowthCurve;
  self->_boysHeight2To20YearsGrowthCurve = v10;

  objc_super v12 = [v7 objectForKeyedSubscript:@"boysWeightBirthTo36MonthsGrowthCurve"];
  boysWeightBirthTo36MonthsGrowthCurve = self->_boysWeightBirthTo36MonthsGrowthCurve;
  self->_boysWeightBirthTo36MonthsGrowthCurve = v12;

  v14 = [v7 objectForKeyedSubscript:@"boysWeight2To20YearsGrowthCurve"];
  boysWeight2To20YearsGrowthCurve = self->_boysWeight2To20YearsGrowthCurve;
  self->_boysWeight2To20YearsGrowthCurve = v14;

  v16 = [v7 objectForKeyedSubscript:@"girlsHeightBirthTo36MonthsGrowthCurve"];
  girlsHeightBirthTo36MonthsGrowthCurve = self->_girlsHeightBirthTo36MonthsGrowthCurve;
  self->_girlsHeightBirthTo36MonthsGrowthCurve = v16;

  v18 = [v7 objectForKeyedSubscript:@"girlsHeight2To20YearsGrowthCurve"];
  girlsHeight2To20YearsGrowthCurve = self->_girlsHeight2To20YearsGrowthCurve;
  self->_girlsHeight2To20YearsGrowthCurve = v18;

  v20 = [v7 objectForKeyedSubscript:@"girlsWeightBirthTo36MonthsGrowthCurve"];
  girlsWeightBirthTo36MonthsGrowthCurve = self->_girlsWeightBirthTo36MonthsGrowthCurve;
  self->_girlsWeightBirthTo36MonthsGrowthCurve = v20;

  v22 = [v7 objectForKeyedSubscript:@"girlsWeight2To20YearsGrowthCurve"];
  girlsWeight2To20YearsGrowthCurve = self->_girlsWeight2To20YearsGrowthCurve;
  self->_girlsWeight2To20YearsGrowthCurve = v22;

  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    v24 = [v4 demoPerson];
    v25 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v26 = [v25 currentDateFromCurrentTime:0.0];

    v27 = [v24 birthDateComponents];
    uint64_t v28 = HDDemoData_ageBetweenNSDateComponentsAndDate(v27, v26);

    if (v28 >= 21)
    {
      [v24 weightTargetInKg];
      self->_weightAdultStartInKg = v29;
      self->_lastWeightInKg = v29;
      [v24 heightTargetInCm];
      self->_lastHeightInCm = v30;
    }
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v160.receiver = self;
  v160.super_class = (Class)HDDemoDataBodySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v160 generateObjectsForDemoPerson:v11 fromTime:v12 toTime:v13 currentDate:a5 objectCollection:a5];
  if (qword_1EBA18D40 != -1) {
    dispatch_once(&qword_1EBA18D40, &__block_literal_global_146);
  }
  id v14 = v11;
  v15 = v14;
  if (!self)
  {

    id v154 = v15;
    v75 = 0;
    v159 = 0;
    goto LABEL_33;
  }
  if (self->_nextHeightSampleTime > a5)
  {
    v16 = 0;
    v17 = v14;
    goto LABEL_30;
  }
  v18 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v19 = [v18 currentDateFromCurrentTime:a5];

  v20 = [v15 birthDateComponents];
  uint64_t v21 = HDDemoData_ageBetweenNSDateComponentsAndDate(v20, v19);

  v22 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v23 = [v22 firstSampleDayOfYear];

  v24 = [v15 birthDateComponents];
  uint64_t v25 = HDDemoData_currentDayOfYearFromNSDateComponents(v24);

  double v26 = (double)(((uint64_t)a5 + v23 - v25 + 365) % 365) / 365.0;
  double v27 = v26 + (double)v21;
  if (v27 >= 0.0 && v27 < 20.0)
  {
    uint64_t v28 = [v15 biologicalSex];
    id v157 = v13;
    if (v27 >= 3.0)
    {
      if (v27 >= 21.0)
      {
        id v36 = v12;
        id v32 = 0;
        goto LABEL_18;
      }
      double v29 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeight2To20YearsGrowthCurve;
      if (v28 != 2) {
        double v29 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__girlsHeight2To20YearsGrowthCurve;
      }
    }
    else
    {
      double v29 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__girlsHeightBirthTo36MonthsGrowthCurve;
      if (v28 == 2) {
        double v29 = OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeightBirthTo36MonthsGrowthCurve;
      }
    }
    id v36 = v12;
    id v32 = *(id *)((char *)&self->super.super.isa + *v29);
LABEL_18:
    uint64_t v37 = [v15 biologicalSex];
    uint64_t v38 = 5;
    if (v37 == 2) {
      uint64_t v38 = 1;
    }
    id v33 = objc_retain(*(id *)((char *)&self->super.super.isa
                            + OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeightBirthTo36MonthsGrowthCurve[v38]));
    v39 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v40 = [v39 statisticsSampleGenerator];
    v41 = v40;
    if (v27 >= 3.0)
    {
      [v40 computeNoiseFromTime:a5 stdDev:15.0];
      double v35 = v47 + 30.0;

      double v45 = v26 + (double)(v21 - 2) + v26 + (double)(v21 - 2);
      double i = v26 + -0.5 + v26 + -0.5;
      if (v26 <= 0.5) {
        double v46 = 0.0;
      }
      else {
        double v46 = v26 + -0.5 + v26 + -0.5;
      }
    }
    else
    {
      [v40 computeNoiseFromTime:a5 stdDev:3.0];
      double v43 = v42;

      for (i = 4.0; v26 > 0.25; double v26 = v26 + -0.25)
        ;
      double v35 = v43 + 3.0;
      double v45 = v27 * 4.0;
      double v46 = v26 * 4.0;
    }
    uint64_t v48 = (uint64_t)v45;
    v49 = objc_msgSend(v32, "objectAtIndexedSubscript:", (uint64_t)v45, i);
    [v49 doubleValue];
    double v51 = v50;

    v52 = [v32 objectAtIndexedSubscript:v48 + 1];
    [v52 doubleValue];
    double v54 = v53;

    double v55 = v46 * v54 + v51 * (1.0 - v46);
    [v15 heightTargetInCm];
    double v57 = v56;
    v58 = [v33 lastObject];
    [v58 doubleValue];
    double v60 = v57 / v59;

    double v61 = fmin(v27 * v27 / 289.0, 1.0);
    double v62 = v55 * (1.0 - v61 + v60 * v61);
    v63 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v64 = [v63 statisticsSampleGenerator];
    [v15 heightSampleNoiseStdDev];
    double v66 = v65;
    v67 = [v33 lastObject];
    [v67 doubleValue];
    [v64 computeNoiseFromTime:a5 stdDev:v66 / v68];
    double v31 = v62 + v69;

    id v12 = v36;
    id v13 = v157;
    goto LABEL_28;
  }
  [v15 heightTargetInCm];
  double v31 = v30;
  id v32 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  id v33 = [v32 statisticsSampleGenerator];
  [v33 computeNoiseFromTime:a5 stdDev:6.0];
  double v35 = fabs(v34) + 90.0;
LABEL_28:

  self->_nextHeightSampleTime = v35 + self->_nextHeightSampleTime;
  self->_double lastHeightInCm = v31;
  v16 = [NSNumber numberWithDouble:v31];

  if (!v16) {
    goto LABEL_31;
  }
  v70 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v71 = _MergedGlobals_6;
  [v16 doubleValue];
  v17 = [v70 quantityWithUnit:v71 doubleValue:v72 * 0.01];
  v73 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18D18 quantity:v17 startDate:v12 endDate:v12];
  [v13 addObjectFromPhone:v73];

LABEL_30:
LABEL_31:
  v159 = v16;
  id v74 = v15;
  if (self->_nextWeightSampleTime > a5)
  {
    v75 = 0;
LABEL_33:
    v76 = v15;
    goto LABEL_58;
  }
  v77 = v74;
  v158 = v13;
  v78 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v79 = [v78 currentDateFromCurrentTime:a5];

  v80 = [v77 birthDateComponents];
  uint64_t v81 = HDDemoData_ageBetweenNSDateComponentsAndDate(v80, v79);

  v82 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v83 = [v82 firstSampleDayOfYear];

  v84 = [v77 birthDateComponents];
  uint64_t v85 = HDDemoData_currentDayOfYearFromNSDateComponents(v84);

  double v86 = (double)(((uint64_t)a5 + v83 - v85 + 365) % 365) / 365.0;
  double v87 = v86 + (double)v81;
  if (v87 >= 0.0 && v87 < 20.0)
  {
    uint64_t v88 = [v77 biologicalSex];
    if (v87 >= 3.0)
    {
      if (v87 >= 21.0)
      {
        id v90 = v12;
        id v92 = 0;
LABEL_45:
        uint64_t v96 = [v77 biologicalSex];
        uint64_t v97 = 7;
        if (v96 == 2) {
          uint64_t v97 = 3;
        }
        id v93 = objc_retain(*(id *)((char *)&self->super.super.isa
                                + OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeightBirthTo36MonthsGrowthCurve[v97]));
        v98 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v99 = [v98 statisticsSampleGenerator];
        [v99 computeNoiseFromTime:a5 stdDev:3.0];
        double v101 = fabs(v100);

        if (v87 >= 3.0)
        {
          double k = v101 + 30.0;
          for (j = v86 + (double)(v81 - 2); v86 > 0.08333333; double v86 = v86 + -0.08333333)
            ;
        }
        else
        {
          for (k = v101 + 3.0; v86 > 0.08333333; double v86 = v86 + -0.08333333)
            ;
          double j = v87;
        }
        double v103 = v86 * 12.0;
        uint64_t v104 = (uint64_t)(j * 12.0);
        v105 = [v92 objectAtIndexedSubscript:v104];
        [v105 doubleValue];
        double v107 = v106;

        v108 = [v92 objectAtIndexedSubscript:v104 + 1];
        [v108 doubleValue];
        double v110 = v109;

        double v111 = v103 * v110 + v107 * (1.0 - v103);
        [v77 weightTargetInKg];
        double v113 = v112;
        v114 = [v93 lastObject];
        [v114 doubleValue];
        double v116 = v113 / v115;

        double v117 = fmin(v87 * v87 / 289.0, 1.0);
        double v118 = v111 * (1.0 - v117 + v116 * v117);
        v119 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v120 = [v119 statisticsSampleGenerator];
        [v77 weightSampleNoiseStdDev];
        double v122 = v121;
        v123 = [v93 lastObject];
        [v123 doubleValue];
        [v120 computeNoiseFromTime:a5 stdDev:v122 / v124];
        double v91 = v118 + v125;

        self->_weightAdultStartInKg = v91;
        goto LABEL_54;
      }
      v89 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__boysWeight2To20YearsGrowthCurve;
    }
    else
    {
      v89 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__boysWeightBirthTo36MonthsGrowthCurve;
    }
    if (v88 != 2) {
      v89 += 4;
    }
    id v90 = v12;
    id v92 = *(id *)((char *)&self->super.super.isa + *v89);
    goto LABEL_45;
  }
  id v90 = v12;
  double v91 = -[HDDemoDataBodySampleGenerator weightChangeForDemoPerson:atTime:]((double *)self, v77, a5);
  id v92 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  id v93 = [v92 statisticsSampleGenerator];
  [v93 computeNoiseFromTime:a5 stdDev:1.0];
  double k = fabs(v94);
LABEL_54:

  self->_nextWeightSampleTime = k + a5;
  self->_lastWeightInKg = v91;
  v126 = NSNumber;
  double v127 = __exp10(1.0);
  v75 = [v126 numberWithDouble:(double)(uint64_t)(v91 * v127) / v127];

  id v13 = v158;
  if (!v75)
  {
    id v12 = v90;
    goto LABEL_59;
  }
  v156 = v15;
  [v75 doubleValue];
  double v129 = v128;
  v76 = objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", qword_1EBA18CF8);
  v155 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18D20 quantity:v76 startDate:v90 endDate:v90];
  objc_msgSend(v158, "addObjectFromPhone:");
  double lastHeightInCm = self->_lastHeightInCm;
  id v131 = v77;
  uint64_t v132 = [v131 biologicalSex];
  [v131 waistCircumferenceInInches];
  double v134 = v133;
  [v131 forearmCircumferenceInInches];
  double v136 = v135;
  [v131 wristCircumferenceInInches];
  double v138 = v137;
  [v131 hipCircumferenceInInches];
  double v140 = v139;

  +[HDDemoDataFormula computeLeanBodyMassFromWeight:v132 height:v129 sex:lastHeightInCm waistCircumference:v134 forearmCircumference:v136 wristCircumference:v138 hipCircumference:v140];
  double v142 = v141;
  v143 = objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", qword_1EBA18CF8);
  v144 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18D28 quantity:v143 startDate:v90 endDate:v90];
  [v158 addObjectFromPhone:v144];
  v145 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v146 = [v145 statisticsSampleGenerator];
  [v146 computeNoiseFromTime:a5 stdDev:0.33];
  double v148 = v142 + v147;

  +[HDDemoDataFormula computeBodyFatPercentageFromWeight:v129 leanBodyMass:v148];
  v149 = objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", qword_1EBA18D08);
  v150 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18D30 quantity:v149 startDate:v90 endDate:v90];
  [v158 addObjectFromPhone:v150];
  double v151 = 0.0;
  if (v129 != 0.0) {
    +[HDDemoDataFormula computeBodyMassIndexFromWeight:v129 height:self->_lastHeightInCm];
  }
  v152 = [MEMORY[0x1E4F2B370] quantityWithUnit:qword_1EBA18D10 doubleValue:v151];
  v153 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18D38 quantity:v152 startDate:v90 endDate:v90];
  id v13 = v158;
  [v158 addObjectFromPhone:v153];

  id v12 = v90;
  v15 = v156;
LABEL_58:

LABEL_59:
}

void __107__HDDemoDataBodySampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] meterUnit];
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:9];
  v3 = (void *)qword_1EBA18CF8;
  qword_1EBA18CF8 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B618] gramUnit];
  objc_super v5 = (void *)qword_1EBA18D00;
  qword_1EBA18D00 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2B618] percentUnit];
  double v7 = (void *)qword_1EBA18D08;
  qword_1EBA18D08 = v6;

  uint64_t v8 = [MEMORY[0x1E4F2B618] countUnit];
  double v9 = (void *)qword_1EBA18D10;
  qword_1EBA18D10 = v8;

  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A838]];
  id v11 = (void *)qword_1EBA18D18;
  qword_1EBA18D18 = v10;

  uint64_t v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A630]];
  id v13 = (void *)qword_1EBA18D20;
  qword_1EBA18D20 = v12;

  uint64_t v14 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A850]];
  v15 = (void *)qword_1EBA18D28;
  qword_1EBA18D28 = v14;

  uint64_t v16 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A628]];
  v17 = (void *)qword_1EBA18D30;
  qword_1EBA18D30 = v16;

  uint64_t v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A638]];
  v19 = (void *)qword_1EBA18D38;
  qword_1EBA18D38 = v18;
}

- (double)weightChangeForDemoPerson:(double)a3 atTime:
{
  id v5 = a2;
  [v5 genericSampleTimeNoiseStdDev];
  double v7 = v6;
  [v5 weightSampleTimeFrequency];
  double v9 = v8;
  uint64_t v10 = [a1 demoDataGenerator];
  id v11 = [v10 statisticsSampleGenerator];
  [v11 computeNoiseFromTime:a3 stdDev:v7];
  a1[13] = v9 + v12 + a1[13];

  double v13 = a1[15];
  uint64_t v14 = [a1 demoDataGenerator];
  v15 = [v14 statisticsSampleGenerator];
  [v5 weightSampleNoiseStdDev];
  [v15 computeNoiseFromTime:a3 stdDev:v16];
  double v18 = v17;

  v19 = [a1 demoDataGenerator];
  v20 = [v19 statisticsSampleGenerator];
  [v5 weightDailyChangeStdDev];
  [v20 computeNoiseFromTime:a3 stdDev:v21];
  double v23 = v22;

  if (v23 + (double)(arc4random_uniform(0xAu) & 1) == 0.0) {
    double v24 = v18;
  }
  else {
    double v24 = -v18;
  }
  a1[15] = a1[15] + v24;
  uint64_t v25 = [a1 demoDataGenerator];
  uint64_t v26 = ([v25 firstSampleDayOfYear] + (uint64_t)a3) % 365;

  double v27 = [v5 weightGainHolidayDaysInYear];
  uint64_t v28 = [NSNumber numberWithInteger:v26];
  char v29 = [v27 containsObject:v28];

  if (v29)
  {
    double v30 = [a1 demoDataGenerator];
    double v31 = [v30 statisticsSampleGenerator];
    [v5 weightDailyChangeStdDev];
    [v31 computeNoiseFromTime:a3 stdDev:v32];
    double v34 = v33;

    double v35 = fabs(v34) + a1[15];
    a1[15] = v35;
  }
  else
  {
    double v35 = a1[15];
  }
  double v36 = a1[16];
  [v5 weightChangePercentageMax];
  double v38 = v36 * (1.0 - v37);
  double v39 = a1[15];
  if (v35 >= v38)
  {
    double v41 = a1[16];
    [v5 weightChangePercentageMax];
    if (v39 <= v41 * (v42 + 1.0)) {
      goto LABEL_12;
    }
    double v40 = a1[15] + vabdd_f64(a1[15], v13) * -2.0;
  }
  else
  {
    double v40 = v39 + vabdd_f64(v13, v39) * 2.0;
  }
  a1[15] = v40;
LABEL_12:
  [v5 weightDailyMaxLoss];
  double v44 = a1[15];
  if (vabdd_f64(v44, v13) > v43)
  {
    if (v44 <= v13) {
      double v43 = -v43;
    }
    double v44 = v13 + v43;
    a1[15] = v13 + v43;
  }
  double v45 = __exp10(1.0);
  double v46 = (double)(uint64_t)(v44 * v45) / v45;

  return v46;
}

- (double)lastHeightInCm
{
  return self->_lastHeightInCm;
}

- (double)lastWeightInKg
{
  return self->_lastWeightInKg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_girlsWeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_girlsWeightBirthTo36MonthsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_girlsHeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_girlsHeightBirthTo36MonthsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysWeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysWeightBirthTo36MonthsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysHeight2To20YearsGrowthCurve, 0);

  objc_storeStrong((id *)&self->_boysHeightBirthTo36MonthsGrowthCurve, 0);
}

@end