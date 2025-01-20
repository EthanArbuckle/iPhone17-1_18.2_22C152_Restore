@interface HKMCDaySummary
+ (BOOL)supportsSecureCoding;
+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4;
+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14;
+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14 wristTemperature:(id)a15 menstrualFlowModificationDayIndex:(int64_t)a16 startOfCycleFromCycleTracking:(id)a17 startedCycleFactors:(id)a18 endedCycleFactors:(id)a19 sampleCountByType:(id)a20;
+ (id)daySummaryWithDayIndex:(int64_t)a3 ovulationTestResult:(int64_t)a4;
+ (id)emptyDaySummaryWithDayIndex:(int64_t)a3;
- (BOOL)_isBasalBodyTemperatureLogged;
- (BOOL)_isBleedingAfterPregnancyFlowLogged;
- (BOOL)_isBleedingInPregnancyFlowLogged;
- (BOOL)_isCervicalMucusQualityLogged;
- (BOOL)_isIntermenstrualBleedingLogged;
- (BOOL)_isMenstrualFlowLogged;
- (BOOL)_isOvulationTestResultLogged;
- (BOOL)_isPregnancyTestResultLogged;
- (BOOL)_isProgesteroneTestResultLogged;
- (BOOL)_isSexualActivityLogged;
- (BOOL)_isSymptomsLogged;
- (BOOL)hasConfirmedNoFlow;
- (BOOL)hasFlow;
- (BOOL)intermenstrualBleeding;
- (BOOL)isDataLogged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFetched;
- (BOOL)isSupplementaryDataLogged;
- (BOOL)isUserEnteredDataEqual:(id)a3;
- (HKMCDaySummary)initWithCoder:(id)a3;
- (HKMCWristTemperature)wristTemperature;
- (HKQuantity)basalBodyTemperature;
- (NSArray)endedCycleFactors;
- (NSArray)startedCycleFactors;
- (NSDictionary)sampleCountByType;
- (NSNumber)startOfCycleFromCycleTracking;
- (NSSet)loggedSupplementaryDisplayTypes;
- (NSString)hk_redactedDescription;
- (id)_daySummaryWithOverrideSourceIDBySourceID:(id)a3 ignoreCycleFactors:(BOOL)a4 ignoreOvulationTestResults:(BOOL)a5;
- (id)_initFromDaySummary:(id)a3;
- (id)_initWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14 wristTemperature:(id)a15 menstrualFlowModificationDayIndex:(int64_t)a16 startOfCycleFromCycleTracking:(id)a17 startedCycleFactors:(id)a18 endedCycleFactors:(id)a19 sampleCountByType:(id)a20;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)bleedingAfterPregnancyFlow;
- (int64_t)bleedingAfterPregnancyFlowSampleCount;
- (int64_t)bleedingInPregnancyFlow;
- (int64_t)bleedingInPregnancyFlowSampleCount;
- (int64_t)cervicalMucusQuality;
- (int64_t)cervicalMucusQualitySampleCount;
- (int64_t)dayIndex;
- (int64_t)menstrualFlow;
- (int64_t)menstrualFlowModificationDayIndex;
- (int64_t)menstrualFlowSampleCount;
- (int64_t)ovulationTestResult;
- (int64_t)ovulationTestResultSampleCount;
- (int64_t)pregnancyTestResult;
- (int64_t)pregnancyTestResultSampleCount;
- (int64_t)progesteroneTestResult;
- (int64_t)progesteroneTestResultSampleCount;
- (int64_t)sexualActivity;
- (int64_t)sexualActivitySampleCount;
- (unint64_t)hash;
- (unint64_t)symptoms;
- (void)encodeWithCoder:(id)a3;
- (void)setBasalBodyTemperature:(id)a3;
- (void)setBleedingAfterPregnancyFlow:(int64_t)a3;
- (void)setBleedingInPregnancyFlow:(int64_t)a3;
- (void)setCervicalMucusQuality:(int64_t)a3;
- (void)setIntermenstrualBleeding:(BOOL)a3;
- (void)setMenstrualFlow:(int64_t)a3;
- (void)setOvulationTestResult:(int64_t)a3;
- (void)setPregnancyTestResult:(int64_t)a3;
- (void)setProgesteroneTestResult:(int64_t)a3;
- (void)setSexualActivity:(int64_t)a3;
- (void)setStartOfCycleFromCycleTracking:(id)a3;
- (void)setSymptoms:(unint64_t)a3;
@end

@implementation HKMCDaySummary

- (void)encodeWithCoder:(id)a3
{
  int64_t dayIndex = self->_dayIndex;
  id v5 = a3;
  [v5 encodeInteger:dayIndex forKey:@"DayIndex"];
  [v5 encodeInteger:self->_menstrualFlow forKey:@"MenstrualFlow"];
  [v5 encodeInteger:self->_bleedingInPregnancyFlow forKey:@"BleedingInPregnancyFlow"];
  [v5 encodeInteger:self->_bleedingAfterPregnancyFlow forKey:@"BleedingAfterPregnancyFlow"];
  [v5 encodeBool:self->_intermenstrualBleeding forKey:@"IntermenstrualBleeding"];
  [v5 encodeInteger:self->_symptoms forKey:@"Symptoms"];
  [v5 encodeInteger:self->_sexualActivity forKey:@"SexualActivity"];
  [v5 encodeInteger:self->_ovulationTestResult forKey:@"OvulationTestResult"];
  [v5 encodeInteger:self->_pregnancyTestResult forKey:@"PregnancyTestResult"];
  [v5 encodeInteger:self->_progesteroneTestResult forKey:@"ProgesteroneTestResult"];
  [v5 encodeInteger:self->_cervicalMucusQuality forKey:@"CervicalMucusQuality"];
  [v5 encodeObject:self->_basalBodyTemperature forKey:@"BasalBodyTemperature"];
  [v5 encodeObject:self->_wristTemperature forKey:@"WristTemperature"];
  [v5 encodeInteger:self->_menstrualFlowModificationDayIndex forKey:@"MenstrualFlowModificationDayIndex"];
  [v5 encodeObject:self->_startOfCycleFromCycleTracking forKey:@"StartOfCycleFromCycleTracking"];
  [v5 encodeObject:self->_startedCycleFactors forKey:@"StartedCycleFactors"];
  [v5 encodeObject:self->_endedCycleFactors forKey:@"EndedCycleFactors"];
  [v5 encodeObject:self->_sampleCountByType forKey:@"SampleCountByType"];
}

- (id)_initWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14 wristTemperature:(id)a15 menstrualFlowModificationDayIndex:(int64_t)a16 startOfCycleFromCycleTracking:(id)a17 startedCycleFactors:(id)a18 endedCycleFactors:(id)a19 sampleCountByType:(id)a20
{
  id v45 = a14;
  id v44 = a15;
  id v25 = a17;
  id v26 = a18;
  id v27 = a19;
  id v28 = a20;
  v46.receiver = self;
  v46.super_class = (Class)HKMCDaySummary;
  v29 = [(HKMCDaySummary *)&v46 init];
  v30 = v29;
  if (v29)
  {
    v29->_int64_t dayIndex = a3;
    v29->_menstrualFlow = a4;
    v29->_bleedingInPregnancyFlow = a5;
    v29->_bleedingAfterPregnancyFlow = a6;
    v29->_intermenstrualBleeding = a7;
    v29->_symptoms = a8;
    v29->_sexualActivity = a9;
    v29->_ovulationTestResult = a10;
    v29->_pregnancyTestResult = a11;
    v29->_progesteroneTestResult = a12;
    v29->_cervicalMucusQuality = a13;
    uint64_t v31 = [v45 copy];
    basalBodyTemperature = v30->_basalBodyTemperature;
    v30->_basalBodyTemperature = (HKQuantity *)v31;

    uint64_t v33 = [v44 copy];
    wristTemperature = v30->_wristTemperature;
    v30->_wristTemperature = (HKMCWristTemperature *)v33;

    v30->_menstrualFlowModificationDayIndex = a16;
    objc_storeStrong((id *)&v30->_startOfCycleFromCycleTracking, a17);
    uint64_t v35 = [v26 copy];
    startedCycleFactors = v30->_startedCycleFactors;
    v30->_startedCycleFactors = (NSArray *)v35;

    uint64_t v37 = [v27 copy];
    endedCycleFactors = v30->_endedCycleFactors;
    v30->_endedCycleFactors = (NSArray *)v37;

    uint64_t v39 = [v28 copy];
    sampleCountByType = v30->_sampleCountByType;
    v30->_sampleCountByType = (NSDictionary *)v39;
  }
  return v30;
}

- (HKMCDaySummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKMCDaySummary;
  id v5 = [(HKMCDaySummary *)&v24 init];
  if (v5)
  {
    v5->_int64_t dayIndex = [v4 decodeIntegerForKey:@"DayIndex"];
    v5->_menstrualFlow = [v4 decodeIntegerForKey:@"MenstrualFlow"];
    v5->_bleedingInPregnancyFlow = [v4 decodeIntegerForKey:@"BleedingInPregnancyFlow"];
    v5->_bleedingAfterPregnancyFlow = [v4 decodeIntegerForKey:@"BleedingAfterPregnancyFlow"];
    v5->_intermenstrualBleeding = [v4 decodeBoolForKey:@"IntermenstrualBleeding"];
    v5->_symptoms = [v4 decodeIntegerForKey:@"Symptoms"];
    v5->_sexualActivity = [v4 decodeIntegerForKey:@"SexualActivity"];
    v5->_ovulationTestResult = [v4 decodeIntegerForKey:@"OvulationTestResult"];
    v5->_pregnancyTestResult = [v4 decodeIntegerForKey:@"PregnancyTestResult"];
    v5->_progesteroneTestResult = [v4 decodeIntegerForKey:@"ProgesteroneTestResult"];
    v5->_cervicalMucusQuality = [v4 decodeIntegerForKey:@"CervicalMucusQuality"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BasalBodyTemperature"];
    basalBodyTemperature = v5->_basalBodyTemperature;
    v5->_basalBodyTemperature = (HKQuantity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WristTemperature"];
    wristTemperature = v5->_wristTemperature;
    v5->_wristTemperature = (HKMCWristTemperature *)v8;

    v5->_menstrualFlowModificationDayIndex = [v4 decodeIntegerForKey:@"MenstrualFlowModificationDayIndex"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartOfCycleFromCycleTracking"];
    startOfCycleFromCycleTracking = v5->_startOfCycleFromCycleTracking;
    v5->_startOfCycleFromCycleTracking = (NSNumber *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"StartedCycleFactors"];
    startedCycleFactors = v5->_startedCycleFactors;
    v5->_startedCycleFactors = (NSArray *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"EndedCycleFactors"];
    endedCycleFactors = v5->_endedCycleFactors;
    v5->_endedCycleFactors = (NSArray *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "hk_typesForDictionaryMapping:to:", v19, objc_opt_class());
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"SampleCountByType"];
    sampleCountByType = v5->_sampleCountByType;
    v5->_sampleCountByType = (NSDictionary *)v21;
  }
  return v5;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [NSNumber numberWithInteger:self->_dayIndex];
  v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6, 0];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCountByType, 0);
  objc_storeStrong((id *)&self->_endedCycleFactors, 0);
  objc_storeStrong((id *)&self->_startedCycleFactors, 0);
  objc_storeStrong((id *)&self->_startOfCycleFromCycleTracking, 0);
  objc_storeStrong((id *)&self->_wristTemperature, 0);
  objc_storeStrong((id *)&self->_basalBodyTemperature, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14 wristTemperature:(id)a15 menstrualFlowModificationDayIndex:(int64_t)a16 startOfCycleFromCycleTracking:(id)a17 startedCycleFactors:(id)a18 endedCycleFactors:(id)a19 sampleCountByType:(id)a20
{
  BOOL v33 = a7;
  id v22 = a20;
  id v23 = a19;
  id v24 = a18;
  id v25 = a17;
  id v26 = a15;
  id v27 = a14;
  id v28 = objc_msgSend(objc_alloc((Class)a1), "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, a4, a5, a6, v33, a8, a9, a10, a11, a12, a13, v27, v26, a16,
                  v25,
                  v24,
                  v23,
                  v22);

  return v28;
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 bleedingInPregnancyFlow:(int64_t)a5 bleedingAfterPregnancyFlow:(int64_t)a6 intermenstrualBleeding:(BOOL)a7 symptoms:(unint64_t)a8 sexualActivity:(int64_t)a9 ovulationTestResult:(int64_t)a10 pregnancyTestResult:(int64_t)a11 progesteroneTestResult:(int64_t)a12 cervicalMucusQuality:(int64_t)a13 basalBodyTemperature:(id)a14
{
  BOOL v15 = a7;
  id v21 = a14;
  id v22 = objc_msgSend(objc_alloc((Class)a1), "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, a4, a5, a6, v15, a8, a9, a10, a11, a12, a13, v21, 0, 0,
                  0,
                  0,
                  0,
                  0);

  return v22;
}

+ (id)emptyDaySummaryWithDayIndex:(int64_t)a3
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 0);
  return v3;
}

- (id)description
{
  uint64_t v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  BOOL v15 = NSStringFromClass(v3);
  uint64_t v19 = [NSNumber numberWithInteger:self->_dayIndex];
  v18 = [NSNumber numberWithInteger:self->_menstrualFlow];
  startOfCycleFromCycleTracking = self->_startOfCycleFromCycleTracking;
  v17 = [NSNumber numberWithInteger:self->_bleedingInPregnancyFlow];
  id v4 = [NSNumber numberWithInteger:self->_bleedingAfterPregnancyFlow];
  id v5 = [NSNumber numberWithBool:self->_intermenstrualBleeding];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_symptoms];
  v7 = [NSNumber numberWithInteger:self->_sexualActivity];
  uint64_t v8 = [NSNumber numberWithInteger:self->_ovulationTestResult];
  v9 = [NSNumber numberWithInteger:self->_pregnancyTestResult];
  uint64_t v10 = [NSNumber numberWithInteger:self->_progesteroneTestResult];
  v11 = [NSNumber numberWithInteger:self->_cervicalMucusQuality];
  v12 = [v16 stringWithFormat:@"<%@:%p %@, menstrual flow = %@ (SOC: %@), BIP flow = %@, BAP flow = %@, spotting = %@, symptoms = %@, sex = %@, OPK = %@, PTR = %@, PDG = %@, CMQ = %@, BBT = %@, WT = %@>", v15, self, v19, v18, startOfCycleFromCycleTracking, v17, v4, v5, v6, v7, v8, v9, v10, v11, self->_basalBodyTemperature, self->_wristTemperature];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v9 = a3;
  if ([(HKMCDaySummary *)self isUserEnteredDataEqual:v9])
  {
    uint64_t v10 = [(HKMCDaySummary *)self wristTemperature];
    v11 = [v9 wristTemperature];
    if (v10 != v11)
    {
      uint64_t v12 = [v9 wristTemperature];
      if (!v12)
      {
        char v13 = 0;
        goto LABEL_26;
      }
      v3 = (void *)v12;
      id v5 = [(HKMCDaySummary *)self wristTemperature];
      id v4 = [v9 wristTemperature];
      if (![v5 isEqual:v4])
      {
        char v13 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    int64_t v14 = [(HKMCDaySummary *)self menstrualFlowModificationDayIndex];
    if (v14 == [v9 menstrualFlowModificationDayIndex])
    {
      BOOL v15 = [(HKMCDaySummary *)self startOfCycleFromCycleTracking];
      v57 = [v9 startOfCycleFromCycleTracking];
      if (v15 == v57)
      {
        v54 = v4;
LABEL_14:
        uint64_t v17 = [(HKMCDaySummary *)self startedCycleFactors];
        v55 = [v9 startedCycleFactors];
        v56 = (void *)v17;
        if ((void *)v17 != v55)
        {
          uint64_t v18 = [v9 startedCycleFactors];
          if (!v18)
          {
            v52 = v7;
            char v13 = 0;
            id v25 = v51;
            id v26 = v57;
            goto LABEL_55;
          }
          v48 = (void *)v18;
          uint64_t v6 = [(HKMCDaySummary *)self startedCycleFactors];
          uint64_t v19 = [v9 startedCycleFactors];
          if (([v6 isEqual:v19] & 1) == 0)
          {

            if (v15 == v57)
            {
            }
            else
            {
            }
            char v13 = 0;
LABEL_60:
            id v4 = v54;
            if (v10 == v11) {
              goto LABEL_26;
            }
            goto LABEL_25;
          }
          id v44 = v19;
        }
        uint64_t v20 = [(HKMCDaySummary *)self endedCycleFactors];
        [v9 endedCycleFactors];
        v50 = v49 = (void *)v20;
        v52 = v7;
        v47 = v6;
        if ((void *)v20 == v50)
        {
          id v45 = v15;
          objc_super v46 = v5;
        }
        else
        {
          uint64_t v21 = [v9 endedCycleFactors];
          if (!v21)
          {
            v34 = (void *)v20;
            char v13 = 0;
            goto LABEL_42;
          }
          v43 = (void *)v21;
          id v22 = [(HKMCDaySummary *)self endedCycleFactors];
          id v23 = [v9 endedCycleFactors];
          if (([v22 isEqual:v23] & 1) == 0)
          {

            char v13 = 0;
            uint64_t v35 = v55;
            v36 = v56;
            BOOL v37 = v56 == v55;
LABEL_53:
            id v25 = v51;
            id v26 = v57;
            if (v37)
            {

              goto LABEL_56;
            }

LABEL_55:
LABEL_56:
            if (v15 != v26)
            {
            }
LABEL_59:

            goto LABEL_60;
          }
          v41 = v23;
          v42 = v22;
          id v45 = v15;
          objc_super v46 = v5;
        }
        id v27 = [(HKMCDaySummary *)self sampleCountByType];
        uint64_t v28 = [v9 sampleCountByType];
        char v13 = v27 == (void *)v28;
        if (v27 == (void *)v28)
        {
        }
        else
        {
          v29 = (void *)v28;
          uint64_t v30 = [v9 sampleCountByType];
          if (v30)
          {
            uint64_t v31 = (void *)v30;
            v32 = [(HKMCDaySummary *)self sampleCountByType];
            BOOL v33 = [v9 sampleCountByType];
            char v13 = [v32 isEqual:v33];

            if (v49 == v50)
            {
            }
            else
            {
            }
            uint64_t v35 = v55;
            v36 = v56;
            BOOL v37 = v56 == v55;
            BOOL v15 = v45;
            id v5 = v46;
            goto LABEL_53;
          }
        }
        v34 = v49;
        if (v49 == v50)
        {

          v40 = v55;
          BOOL v15 = v45;
          id v5 = v46;
          v38 = v51;
          uint64_t v39 = v57;
          if (v56 == v55) {
            goto LABEL_44;
          }
          goto LABEL_43;
        }

        BOOL v15 = v45;
        id v5 = v46;
LABEL_42:
        v38 = v51;
        uint64_t v39 = v57;

        v40 = v55;
        if (v56 == v55)
        {
LABEL_44:

          if (v15 != v39)
          {
          }
          goto LABEL_59;
        }
LABEL_43:

        goto LABEL_44;
      }
      uint64_t v16 = [v9 startOfCycleFromCycleTracking];
      if (v16)
      {
        v53 = (void *)v16;
        v7 = [(HKMCDaySummary *)self startOfCycleFromCycleTracking];
        uint64_t v6 = [v9 startOfCycleFromCycleTracking];
        if ([v7 isEqual:v6])
        {
          v54 = v4;
          v51 = v6;
          goto LABEL_14;
        }
      }
    }
    char v13 = 0;
    if (v10 != v11) {
      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_27;
  }
  char v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)isUserEnteredDataEqual:(id)a3
{
  id v4 = (HKMCDaySummary *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    int64_t v5 = [(HKMCDaySummary *)self dayIndex];
    if (v5 != [(HKMCDaySummary *)v4 dayIndex]) {
      goto LABEL_17;
    }
    int64_t v6 = [(HKMCDaySummary *)self menstrualFlow];
    if (v6 != [(HKMCDaySummary *)v4 menstrualFlow]) {
      goto LABEL_17;
    }
    int64_t v7 = [(HKMCDaySummary *)self bleedingInPregnancyFlow];
    if (v7 != [(HKMCDaySummary *)v4 bleedingInPregnancyFlow]) {
      goto LABEL_17;
    }
    int64_t v8 = [(HKMCDaySummary *)self bleedingAfterPregnancyFlow];
    if (v8 != [(HKMCDaySummary *)v4 bleedingAfterPregnancyFlow]) {
      goto LABEL_17;
    }
    BOOL v9 = [(HKMCDaySummary *)self intermenstrualBleeding];
    if (v9 == [(HKMCDaySummary *)v4 intermenstrualBleeding]
      && (unint64_t v10 = [(HKMCDaySummary *)self symptoms], v10 == [(HKMCDaySummary *)v4 symptoms])
      && (int64_t v11 = [(HKMCDaySummary *)self sexualActivity],
          v11 == [(HKMCDaySummary *)v4 sexualActivity])
      && (int64_t v12 = [(HKMCDaySummary *)self ovulationTestResult],
          v12 == [(HKMCDaySummary *)v4 ovulationTestResult])
      && (int64_t v13 = [(HKMCDaySummary *)self pregnancyTestResult],
          v13 == [(HKMCDaySummary *)v4 pregnancyTestResult])
      && (int64_t v14 = [(HKMCDaySummary *)self progesteroneTestResult],
          v14 == [(HKMCDaySummary *)v4 progesteroneTestResult])
      && (int64_t v15 = [(HKMCDaySummary *)self cervicalMucusQuality],
          v15 == [(HKMCDaySummary *)v4 cervicalMucusQuality]))
    {
      uint64_t v16 = [(HKMCDaySummary *)self basalBodyTemperature];
      uint64_t v17 = [(HKMCDaySummary *)v4 basalBodyTemperature];
      if (v16 == v17)
      {
        char v21 = 1;
      }
      else
      {
        uint64_t v18 = [(HKMCDaySummary *)v4 basalBodyTemperature];
        if (v18)
        {
          uint64_t v19 = [(HKMCDaySummary *)self basalBodyTemperature];
          uint64_t v20 = [(HKMCDaySummary *)v4 basalBodyTemperature];
          char v21 = [v19 isEqual:v20];
        }
        else
        {
          char v21 = 0;
        }
      }
    }
    else
    {
LABEL_17:
      char v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  v32 = [NSNumber numberWithInteger:self->_dayIndex];
  uint64_t v3 = [v32 hash];
  uint64_t v31 = [NSNumber numberWithInteger:self->_menstrualFlow];
  uint64_t v4 = [v31 hash] ^ v3;
  uint64_t v30 = [NSNumber numberWithInteger:self->_bleedingInPregnancyFlow];
  uint64_t v5 = [v30 hash];
  v29 = [NSNumber numberWithInteger:self->_bleedingAfterPregnancyFlow];
  uint64_t v6 = v4 ^ v5 ^ [v29 hash];
  BOOL intermenstrualBleeding = self->_intermenstrualBleeding;
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:self->_symptoms];
  uint64_t v8 = intermenstrualBleeding ^ [v28 hash];
  BOOL v9 = [NSNumber numberWithInteger:self->_sexualActivity];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int64_t v11 = [NSNumber numberWithInteger:self->_ovulationTestResult];
  uint64_t v12 = [v11 hash];
  int64_t v13 = [NSNumber numberWithInteger:self->_pregnancyTestResult];
  uint64_t v14 = v12 ^ [v13 hash];
  int64_t v15 = [NSNumber numberWithInteger:self->_progesteroneTestResult];
  uint64_t v16 = v14 ^ [v15 hash];
  uint64_t v17 = [NSNumber numberWithInteger:self->_cervicalMucusQuality];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  uint64_t v19 = [(HKQuantity *)self->_basalBodyTemperature hash];
  unint64_t v20 = v19 ^ [(HKMCWristTemperature *)self->_wristTemperature hash];
  char v21 = [NSNumber numberWithInteger:self->_menstrualFlowModificationDayIndex];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = v22 ^ [(NSNumber *)self->_startOfCycleFromCycleTracking hash];
  uint64_t v24 = v23 ^ [(NSArray *)self->_startedCycleFactors hash];
  uint64_t v25 = v18 ^ v24 ^ [(NSArray *)self->_endedCycleFactors hash];
  unint64_t v26 = v25 ^ [(NSDictionary *)self->_sampleCountByType hash];

  return v26;
}

- (id)_initFromDaySummary:(id)a3
{
  id v3 = a3;
  uint64_t v23 = [v3 dayIndex];
  uint64_t v22 = [v3 menstrualFlow];
  uint64_t v21 = [v3 bleedingInPregnancyFlow];
  uint64_t v20 = [v3 bleedingAfterPregnancyFlow];
  unsigned int v19 = [v3 intermenstrualBleeding];
  uint64_t v18 = [v3 symptoms];
  uint64_t v17 = [v3 sexualActivity];
  uint64_t v16 = [v3 ovulationTestResult];
  uint64_t v15 = [v3 pregnancyTestResult];
  uint64_t v4 = [v3 progesteroneTestResult];
  uint64_t v5 = [v3 cervicalMucusQuality];
  uint64_t v6 = [v3 basalBodyTemperature];
  int64_t v7 = [v3 wristTemperature];
  uint64_t v8 = [v3 menstrualFlowModificationDayIndex];
  BOOL v9 = [v3 startOfCycleFromCycleTracking];
  uint64_t v10 = [v3 startedCycleFactors];
  int64_t v11 = [v3 endedCycleFactors];
  uint64_t v12 = [v3 sampleCountByType];

  id v13 = -[HKMCDaySummary _initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](self, "_initWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", v23, v22, v21, v20, v19, v18, v17, v16, v15, v4, v5, v6, v7, v8,
          v9,
          v10,
          v11,
          v12);

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [HKMCMutableDaySummary alloc];
  return [(HKMCDaySummary *)v4 _initFromDaySummary:self];
}

- (BOOL)_isMenstrualFlowLogged
{
  return self->_menstrualFlow != 0;
}

- (BOOL)_isBleedingInPregnancyFlowLogged
{
  return self->_bleedingInPregnancyFlow != 0;
}

- (BOOL)_isBleedingAfterPregnancyFlowLogged
{
  return self->_bleedingAfterPregnancyFlow != 0;
}

- (BOOL)_isIntermenstrualBleedingLogged
{
  return self->_intermenstrualBleeding;
}

- (BOOL)_isSymptomsLogged
{
  return self->_symptoms != 0;
}

- (BOOL)_isSexualActivityLogged
{
  return self->_sexualActivity != 0;
}

- (BOOL)_isOvulationTestResultLogged
{
  return self->_ovulationTestResult != 0;
}

- (BOOL)_isPregnancyTestResultLogged
{
  return self->_pregnancyTestResult != 0;
}

- (BOOL)_isProgesteroneTestResultLogged
{
  return self->_progesteroneTestResult != 0;
}

- (BOOL)_isCervicalMucusQualityLogged
{
  return self->_cervicalMucusQuality != 0;
}

- (BOOL)_isBasalBodyTemperatureLogged
{
  return self->_basalBodyTemperature != 0;
}

- (BOOL)isDataLogged
{
  if ([(HKMCDaySummary *)self _isMenstrualFlowLogged]
    || [(HKMCDaySummary *)self _isBleedingInPregnancyFlowLogged]
    || [(HKMCDaySummary *)self _isBleedingAfterPregnancyFlowLogged]
    || [(HKMCDaySummary *)self _isIntermenstrualBleedingLogged]
    || [(HKMCDaySummary *)self _isSymptomsLogged]
    || [(HKMCDaySummary *)self _isSexualActivityLogged]
    || [(HKMCDaySummary *)self _isOvulationTestResultLogged]
    || [(HKMCDaySummary *)self _isPregnancyTestResultLogged]
    || [(HKMCDaySummary *)self _isProgesteroneTestResultLogged]
    || [(HKMCDaySummary *)self _isCervicalMucusQualityLogged])
  {
    return 1;
  }
  return [(HKMCDaySummary *)self _isBasalBodyTemperatureLogged];
}

- (BOOL)isSupplementaryDataLogged
{
  if ([(HKMCDaySummary *)self _isIntermenstrualBleedingLogged]
    || [(HKMCDaySummary *)self _isSymptomsLogged]
    || [(HKMCDaySummary *)self _isSexualActivityLogged]
    || [(HKMCDaySummary *)self _isOvulationTestResultLogged]
    || [(HKMCDaySummary *)self _isPregnancyTestResultLogged]
    || [(HKMCDaySummary *)self _isProgesteroneTestResultLogged]
    || [(HKMCDaySummary *)self _isCervicalMucusQualityLogged])
  {
    return 1;
  }
  return [(HKMCDaySummary *)self _isBasalBodyTemperatureLogged];
}

- (NSSet)loggedSupplementaryDisplayTypes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([(HKMCDaySummary *)self _isIntermenstrualBleedingLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierIntermenstrualBleeding"];
  }
  if ([(HKMCDaySummary *)self _isSymptomsLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierSymptoms"];
  }
  if ([(HKMCDaySummary *)self _isSexualActivityLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierSexualActivity"];
  }
  if ([(HKMCDaySummary *)self _isOvulationTestResultLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierOvulationTestResult"];
  }
  if ([(HKMCDaySummary *)self _isPregnancyTestResultLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierPregnancyTestResult"];
  }
  if ([(HKMCDaySummary *)self _isProgesteroneTestResultLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierProgesteroneTestResult"];
  }
  if ([(HKMCDaySummary *)self _isCervicalMucusQualityLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierCervicalMucusQuality"];
  }
  if ([(HKMCDaySummary *)self _isBasalBodyTemperatureLogged]) {
    [v3 addObject:@"DisplayTypeIdentifierBasalBodyTemperature"];
  }
  uint64_t v4 = (void *)[v3 copy];

  return (NSSet *)v4;
}

- (int64_t)menstrualFlowSampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:95];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)bleedingInPregnancyFlowSampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:313];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)bleedingAfterPregnancyFlowSampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:314];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)sexualActivitySampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:97];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)ovulationTestResultSampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:92];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)pregnancyTestResultSampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:243];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)progesteroneTestResultSampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:244];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)cervicalMucusQualitySampleCount
{
  sampleCountByType = self->_sampleCountByType;
  id v3 = [MEMORY[0x263F0A6E8] dataTypeWithCode:91];
  uint64_t v4 = [(NSDictionary *)sampleCountByType objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (id)_daySummaryWithOverrideSourceIDBySourceID:(id)a3 ignoreCycleFactors:(BOOL)a4 ignoreOvulationTestResults:(BOOL)a5
{
  id v8 = a3;
  BOOL v9 = self->_wristTemperature;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    int64_t v11 = [(HKMCWristTemperature *)v9 watchBundleIdentifier];
    uint64_t v12 = [v8 objectForKeyedSubscript:v11];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v10 watchBundleIdentifier];
    }
    uint64_t v15 = v14;

    uint64_t v16 = [HKMCWristTemperature alloc];
    uint64_t v17 = [v10 quantity];
    uint64_t v18 = [(HKMCWristTemperature *)v16 initWithQuantity:v17 watchBundleIdentifier:v15];

    uint64_t v10 = (void *)v18;
  }
  if (a5) {
    int64_t ovulationTestResult = 0;
  }
  else {
    int64_t ovulationTestResult = self->_ovulationTestResult;
  }
  if (a4)
  {
    startedCycleFactors = (NSArray *)MEMORY[0x263EFFA68];
    endedCycleFactors = (NSArray *)MEMORY[0x263EFFA68];
  }
  else
  {
    startedCycleFactors = self->_startedCycleFactors;
    endedCycleFactors = self->_endedCycleFactors;
  }
  +[HKMCDaySummary daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](HKMCDaySummary, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", self->_dayIndex, self->_menstrualFlow, self->_bleedingInPregnancyFlow, self->_bleedingAfterPregnancyFlow, self->_intermenstrualBleeding, self->_symptoms, self->_sexualActivity, ovulationTestResult, self->_pregnancyTestResult, self->_progesteroneTestResult, self->_cervicalMucusQuality, self->_basalBodyTemperature, v10, self->_menstrualFlowModificationDayIndex,
    self->_startOfCycleFromCycleTracking,
    startedCycleFactors,
    endedCycleFactors,
  uint64_t v22 = self->_sampleCountByType);

  return v22;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (int64_t)menstrualFlow
{
  return self->_menstrualFlow;
}

- (void)setMenstrualFlow:(int64_t)a3
{
  self->_menstrualFlow = a3;
}

- (int64_t)bleedingInPregnancyFlow
{
  return self->_bleedingInPregnancyFlow;
}

- (void)setBleedingInPregnancyFlow:(int64_t)a3
{
  self->_bleedingInPregnancyFlow = a3;
}

- (int64_t)bleedingAfterPregnancyFlow
{
  return self->_bleedingAfterPregnancyFlow;
}

- (void)setBleedingAfterPregnancyFlow:(int64_t)a3
{
  self->_bleedingAfterPregnancyFlow = a3;
}

- (BOOL)intermenstrualBleeding
{
  return self->_intermenstrualBleeding;
}

- (void)setIntermenstrualBleeding:(BOOL)a3
{
  self->_BOOL intermenstrualBleeding = a3;
}

- (unint64_t)symptoms
{
  return self->_symptoms;
}

- (void)setSymptoms:(unint64_t)a3
{
  self->_symptoms = a3;
}

- (int64_t)sexualActivity
{
  return self->_sexualActivity;
}

- (void)setSexualActivity:(int64_t)a3
{
  self->_sexualActivity = a3;
}

- (int64_t)ovulationTestResult
{
  return self->_ovulationTestResult;
}

- (void)setOvulationTestResult:(int64_t)a3
{
  self->_int64_t ovulationTestResult = a3;
}

- (int64_t)pregnancyTestResult
{
  return self->_pregnancyTestResult;
}

- (void)setPregnancyTestResult:(int64_t)a3
{
  self->_pregnancyTestResult = a3;
}

- (int64_t)progesteroneTestResult
{
  return self->_progesteroneTestResult;
}

- (void)setProgesteroneTestResult:(int64_t)a3
{
  self->_progesteroneTestResult = a3;
}

- (int64_t)cervicalMucusQuality
{
  return self->_cervicalMucusQuality;
}

- (void)setCervicalMucusQuality:(int64_t)a3
{
  self->_cervicalMucusQuality = a3;
}

- (HKQuantity)basalBodyTemperature
{
  return self->_basalBodyTemperature;
}

- (void)setBasalBodyTemperature:(id)a3
{
}

- (HKMCWristTemperature)wristTemperature
{
  return self->_wristTemperature;
}

- (int64_t)menstrualFlowModificationDayIndex
{
  return self->_menstrualFlowModificationDayIndex;
}

- (NSNumber)startOfCycleFromCycleTracking
{
  return self->_startOfCycleFromCycleTracking;
}

- (void)setStartOfCycleFromCycleTracking:(id)a3
{
}

- (NSArray)startedCycleFactors
{
  return self->_startedCycleFactors;
}

- (NSArray)endedCycleFactors
{
  return self->_endedCycleFactors;
}

- (NSDictionary)sampleCountByType
{
  return self->_sampleCountByType;
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4
{
  return +[HKMCDaySummary daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](HKMCDaySummary, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0);
}

+ (id)daySummaryWithDayIndex:(int64_t)a3 ovulationTestResult:(int64_t)a4
{
  return +[HKMCDaySummary daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:](HKMCDaySummary, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", a3, 0, 0, 0, 0, 0, 0, a4, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0);
}

- (BOOL)isFetched
{
  return 1;
}

- (BOOL)hasConfirmedNoFlow
{
  return [(HKMCDaySummary *)self menstrualFlow] == 1;
}

- (BOOL)hasFlow
{
  uint64_t v2 = [(HKMCDaySummary *)self menstrualFlow];
  return HKMCDaySummaryBleedingFlowHasFlow(v2);
}

@end