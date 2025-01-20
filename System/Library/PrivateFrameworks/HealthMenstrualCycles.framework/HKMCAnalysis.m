@interface HKMCAnalysis
+ (BOOL)supportsSecureCoding;
- (BOOL)fertileWindowProjectionsEnabled;
- (BOOL)hasHealthAppDevicesWithHigherAlgorithmVersions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPeriodLogLate;
- (BOOL)menstruationProjectionsEnabled;
- (HKMCAnalysis)initWithCoder:(id)a3;
- (HKMCAnalysis)initWithStatistics:(id)a3 menstruationProjections:(id)a4 fertileWindowProjections:(id)a5 menstruationProjectionsEnabled:(BOOL)a6 fertileWindowProjectionsEnabled:(BOOL)a7 cycles:(id)a8 deviations:(id)a9 recentSymptoms:(unint64_t)a10 recentBasalBodyTemperature:(id)a11 lastLoggedDayIndex:(id)a12 lastMenstrualFlowDayIndex:(id)a13 isPeriodLogLate:(BOOL)a14 ongoingCycleFactors:(id)a15 numberOfDailySleepHeartRateStatisticsForPast100Days:(int64_t)a16 numberOfDailyAwakeHeartRateStatisticsForPast100Days:(int64_t)a17 hasHealthAppDevicesWithHigherAlgorithmVersions:(BOOL)a18;
- (HKMCRecentBasalBodyTemperature)recentBasalBodyTemperature;
- (HKMCSampleInfo)latestSampleInfo;
- (HKMCStatistics)statistics;
- (NSArray)cycles;
- (NSArray)deviations;
- (NSArray)fertileWindowProjections;
- (NSArray)menstruationProjections;
- (NSArray)ongoingCycleFactors;
- (NSNumber)lastLoggedDayIndex;
- (NSNumber)lastMenstrualFlowDayIndex;
- (NSString)hk_redactedDescription;
- (id)description;
- (int64_t)numberOfDailyAwakeHeartRateStatisticsForPast100Days;
- (int64_t)numberOfDailySleepHeartRateStatisticsForPast100Days;
- (unint64_t)hash;
- (unint64_t)recentSymptoms;
- (void)encodeWithCoder:(id)a3;
- (void)setLatestSampleInfo:(id)a3;
@end

@implementation HKMCAnalysis

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_menstruationProjections, "count"));
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_fertileWindowProjections, "count"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_cycles, "count"));
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_ongoingCycleFactors, "count"));
  v9 = HKSensitiveLogItem();
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_deviations, "count"));
  v11 = [NSNumber numberWithBool:self->_hasHealthAppDevicesWithHigherAlgorithmVersions];
  v12 = [v3 stringWithFormat:@"<%@:%p %@ menstruation projections, %@ fertility projections, %@ cycles, %@ factors, %@ deviations, mismatch: %@, sample:%@>", v4, self, v5, v6, v7, v9, v10, v11, self->_latestSampleInfo];

  return (NSString *)v12;
}

- (void)encodeWithCoder:(id)a3
{
  statistics = self->_statistics;
  id v5 = a3;
  [v5 encodeObject:statistics forKey:@"Statistics"];
  [v5 encodeObject:self->_menstruationProjections forKey:@"MenstruationProjections"];
  [v5 encodeObject:self->_fertileWindowProjections forKey:@"FertileWindowProjections"];
  [v5 encodeBool:self->_menstruationProjectionsEnabled forKey:@"MenstruationProjectionsEnabled"];
  [v5 encodeBool:self->_fertileWindowProjectionsEnabled forKey:@"FertileWindowProjectionsEnabled"];
  [v5 encodeObject:self->_cycles forKey:@"Cycles"];
  [v5 encodeObject:self->_deviations forKey:@"Deviations"];
  [v5 encodeInteger:self->_recentSymptoms forKey:@"RecentSymptoms"];
  [v5 encodeObject:self->_recentBasalBodyTemperature forKey:@"RecentBasalBodyTemperature"];
  [v5 encodeObject:self->_lastLoggedDayIndex forKey:@"LastLoggedDayIndex"];
  [v5 encodeObject:self->_lastMenstrualFlowDayIndex forKey:@"LastMenstrualFlowDayIndex"];
  [v5 encodeBool:self->_isPeriodLogLate forKey:@"IsPeriodLogLate"];
  [v5 encodeObject:self->_ongoingCycleFactors forKey:@"OngoingCycleFactors"];
  [v5 encodeInteger:self->_numberOfDailySleepHeartRateStatisticsForPast100Days forKey:@"NumberOfDailySleepHeartRateStatisticsForPast100Days"];
  [v5 encodeInteger:self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days forKey:@"NumberOfDailyAwakeHeartRateStatisticsForPast100Days"];
  [v5 encodeBool:self->_hasHealthAppDevicesWithHigherAlgorithmVersions forKey:@"HasHealthAppDevicesWithHigherAlgorithmVersions"];
  [v5 encodeObject:self->_latestSampleInfo forKey:@"LatestSampleInfo"];
}

- (HKMCAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HKMCAnalysis;
  id v5 = [(HKMCAnalysis *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Statistics"];
    statistics = v5->_statistics;
    v5->_statistics = (HKMCStatistics *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"MenstruationProjections"];
    menstruationProjections = v5->_menstruationProjections;
    v5->_menstruationProjections = (NSArray *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"FertileWindowProjections"];
    fertileWindowProjections = v5->_fertileWindowProjections;
    v5->_fertileWindowProjections = (NSArray *)v16;

    v5->_menstruationProjectionsEnabled = [v4 decodeBoolForKey:@"MenstruationProjectionsEnabled"];
    v5->_fertileWindowProjectionsEnabled = [v4 decodeBoolForKey:@"FertileWindowProjectionsEnabled"];
    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"Cycles"];
    cycles = v5->_cycles;
    v5->_cycles = (NSArray *)v21;

    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"Deviations"];
    deviations = v5->_deviations;
    v5->_deviations = (NSArray *)v26;

    v5->_recentSymptoms = [v4 decodeIntegerForKey:@"RecentSymptoms"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecentBasalBodyTemperature"];
    recentBasalBodyTemperature = v5->_recentBasalBodyTemperature;
    v5->_recentBasalBodyTemperature = (HKMCRecentBasalBodyTemperature *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastLoggedDayIndex"];
    lastLoggedDayIndex = v5->_lastLoggedDayIndex;
    v5->_lastLoggedDayIndex = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastMenstrualFlowDayIndex"];
    lastMenstrualFlowDayIndex = v5->_lastMenstrualFlowDayIndex;
    v5->_lastMenstrualFlowDayIndex = (NSNumber *)v32;

    v5->_isPeriodLogLate = [v4 decodeBoolForKey:@"IsPeriodLogLate"];
    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"OngoingCycleFactors"];
    v38 = (void *)v37;
    if (v37) {
      v39 = (void *)v37;
    }
    else {
      v39 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v5->_ongoingCycleFactors, v39);

    v5->_numberOfDailySleepHeartRateStatisticsForPast100Days = [v4 decodeIntegerForKey:@"NumberOfDailySleepHeartRateStatisticsForPast100Days"];
    v5->_numberOfDailyAwakeHeartRateStatisticsForPast100Days = [v4 decodeIntegerForKey:@"NumberOfDailyAwakeHeartRateStatisticsForPast100Days"];
    v5->_hasHealthAppDevicesWithHigherAlgorithmVersions = [v4 decodeBoolForKey:@"HasHealthAppDevicesWithHigherAlgorithmVersions"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatestSampleInfo"];
    latestSampleInfo = v5->_latestSampleInfo;
    v5->_latestSampleInfo = (HKMCSampleInfo *)v40;
  }
  return v5;
}

- (NSArray)cycles
{
  return self->_cycles;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)menstruationProjections
{
  return self->_menstruationProjections;
}

- (NSArray)fertileWindowProjections
{
  return self->_fertileWindowProjections;
}

- (HKMCAnalysis)initWithStatistics:(id)a3 menstruationProjections:(id)a4 fertileWindowProjections:(id)a5 menstruationProjectionsEnabled:(BOOL)a6 fertileWindowProjectionsEnabled:(BOOL)a7 cycles:(id)a8 deviations:(id)a9 recentSymptoms:(unint64_t)a10 recentBasalBodyTemperature:(id)a11 lastLoggedDayIndex:(id)a12 lastMenstrualFlowDayIndex:(id)a13 isPeriodLogLate:(BOOL)a14 ongoingCycleFactors:(id)a15 numberOfDailySleepHeartRateStatisticsForPast100Days:(int64_t)a16 numberOfDailyAwakeHeartRateStatisticsForPast100Days:(int64_t)a17 hasHealthAppDevicesWithHigherAlgorithmVersions:(BOOL)a18
{
  id v48 = a3;
  id v47 = a4;
  id v46 = a5;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a15;
  v49.receiver = self;
  v49.super_class = (Class)HKMCAnalysis;
  uint64_t v28 = [(HKMCAnalysis *)&v49 init];
  if (v28)
  {
    uint64_t v29 = [v48 copy];
    statistics = v28->_statistics;
    v28->_statistics = (HKMCStatistics *)v29;

    uint64_t v31 = [v47 copy];
    menstruationProjections = v28->_menstruationProjections;
    v28->_menstruationProjections = (NSArray *)v31;

    uint64_t v33 = [v46 copy];
    fertileWindowProjections = v28->_fertileWindowProjections;
    v28->_fertileWindowProjections = (NSArray *)v33;

    v28->_menstruationProjectionsEnabled = a6;
    v28->_fertileWindowProjectionsEnabled = a7;
    uint64_t v35 = [v22 copy];
    cycles = v28->_cycles;
    v28->_cycles = (NSArray *)v35;

    uint64_t v37 = [v23 copy];
    deviations = v28->_deviations;
    v28->_deviations = (NSArray *)v37;

    v28->_recentSymptoms = a10;
    uint64_t v39 = [v24 copy];
    recentBasalBodyTemperature = v28->_recentBasalBodyTemperature;
    v28->_recentBasalBodyTemperature = (HKMCRecentBasalBodyTemperature *)v39;

    objc_storeStrong((id *)&v28->_lastLoggedDayIndex, a12);
    objc_storeStrong((id *)&v28->_lastMenstrualFlowDayIndex, a13);
    v28->_isPeriodLogLate = a14;
    uint64_t v41 = [v27 copy];
    ongoingCycleFactors = v28->_ongoingCycleFactors;
    v28->_ongoingCycleFactors = (NSArray *)v41;

    v28->_numberOfDailySleepHeartRateStatisticsForPast100Days = a16;
    v28->_numberOfDailyAwakeHeartRateStatisticsForPast100Days = a17;
    v28->_hasHealthAppDevicesWithHigherAlgorithmVersions = a18;
  }

  return v28;
}

- (id)description
{
  uint64_t v19 = NSString;
  uint64_t v3 = objc_opt_class();
  statistics = self->_statistics;
  uint64_t v18 = v3;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_recentSymptoms];
  id v5 = [(HKMCRecentBasalBodyTemperature *)self->_recentBasalBodyTemperature shortDescription];
  if (self->_menstruationProjectionsEnabled) {
    menstruationProjections = self->_menstruationProjections;
  }
  else {
    menstruationProjections = (NSArray *)@"OFF";
  }
  uint64_t v16 = menstruationProjections;
  lastLoggedDayIndex = self->_lastLoggedDayIndex;
  lastMenstrualFlowDayIndex = self->_lastMenstrualFlowDayIndex;
  if (self->_fertileWindowProjectionsEnabled) {
    fertileWindowProjections = self->_fertileWindowProjections;
  }
  else {
    fertileWindowProjections = (NSArray *)@"OFF";
  }
  ongoingCycleFactors = self->_ongoingCycleFactors;
  cycles = self->_cycles;
  deviations = self->_deviations;
  v13 = [NSNumber numberWithBool:self->_hasHealthAppDevicesWithHigherAlgorithmVersions];
  uint64_t v14 = [v19 stringWithFormat:@"<%@:%p statistics:%@ symptoms:%@ bbt:%@ last log:%@ last flow:%@ menses:%@ fertility:%@ cycles:%@ factors:%@ deviations:%@ mismatch:%@ sample:%@>", v18, self, statistics, v4, v5, lastLoggedDayIndex, lastMenstrualFlowDayIndex, v16, fertileWindowProjections, cycles, ongoingCycleFactors, deviations, v13, self->_latestSampleInfo];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMCAnalysis *)a3;
  if (self == v4)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(HKMCAnalysis *)self ongoingCycleFactors];
      uint64_t v7 = [v6 count];
      v8 = [v5 ongoingCycleFactors];
      uint64_t v9 = [v8 count];

      if (v7 == v9)
      {
        v10 = [(HKMCAnalysis *)self ongoingCycleFactors];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          unint64_t v12 = 0;
          do
          {
            v8 = [(HKMCAnalysis *)self ongoingCycleFactors];
            v13 = [v8 objectAtIndexedSubscript:v12];
            uint64_t v14 = [v5 ongoingCycleFactors];
            v15 = [v14 objectAtIndexedSubscript:v12];
            int v16 = [v13 isEquivalent:v15];

            if ((v16 & 1) == 0) {
              break;
            }
            ++v12;
            v8 = [(HKMCAnalysis *)self ongoingCycleFactors];
            unint64_t v17 = [v8 count];
          }
          while (v12 < v17);
          int v18 = v16 ^ 1;
        }
        else
        {
          int v18 = 0;
        }
      }
      else
      {
        int v18 = 1;
      }
      v20 = [(HKMCAnalysis *)self statistics];
      uint64_t v21 = [v5 statistics];
      if (v20 != v21)
      {
        v8 = [v5 statistics];
        if (!v8)
        {
          BOOL v19 = 0;
LABEL_73:

          goto LABEL_74;
        }
        id v22 = [(HKMCAnalysis *)self statistics];
        id v23 = [v5 statistics];
        if (![v22 isEqual:v23])
        {
          BOOL v19 = 0;
LABEL_45:

          goto LABEL_73;
        }
        v118 = v23;
        v119 = v22;
      }
      id v24 = [(HKMCAnalysis *)self menstruationProjections];
      id v25 = [v5 menstruationProjections];
      if (v24 == v25)
      {
        BOOL v120 = 0;
      }
      else
      {
        uint64_t v26 = [v5 menstruationProjections];
        if (!v26)
        {

          BOOL v19 = 0;
          goto LABEL_71;
        }
        int v112 = v18;
        BOOL v120 = v24 != v25;
        v111 = (void *)v26;
        id v27 = [(HKMCAnalysis *)self menstruationProjections];
        uint64_t v28 = [v5 menstruationProjections];
        v117 = v27;
        if (![v27 isEqual:v28])
        {
          BOOL v19 = 0;
LABEL_44:

          id v23 = v118;
          id v22 = v119;
          if (v20 == v21) {
            goto LABEL_74;
          }
          goto LABEL_45;
        }
        v110 = v28;
        int v18 = v112;
      }
      uint64_t v29 = [(HKMCAnalysis *)self fertileWindowProjections];
      [v5 fertileWindowProjections];
      v122 = v121 = (void *)v29;
      BOOL v30 = v29 == (void)v122;
      BOOL v31 = v29 != (void)v122;
      if (!v30)
      {
        uint64_t v32 = [v5 fertileWindowProjections];
        if (!v32)
        {

          BOOL v19 = 0;
          if (v24 != v25)
          {
            LOBYTE(v43) = 1;
            goto LABEL_68;
          }
          BOOL v43 = 0;
LABEL_76:
          if (!v43) {
            goto LABEL_70;
          }
          goto LABEL_69;
        }
        int v113 = v18;
        BOOL v33 = v31;
        v108 = (void *)v32;
        uint64_t v34 = [(HKMCAnalysis *)self fertileWindowProjections];
        uint64_t v35 = [v5 fertileWindowProjections];
        v109 = (void *)v34;
        v36 = (void *)v34;
        uint64_t v37 = (void *)v35;
        if (![v36 isEqual:v35])
        {
          BOOL v19 = 0;
          v42 = v121;
LABEL_43:

          uint64_t v28 = v110;
          if (v24 == v25) {
            goto LABEL_70;
          }
          goto LABEL_44;
        }
        v107 = v37;
        BOOL v31 = v33;
        int v18 = v113;
      }
      if (self->_menstruationProjectionsEnabled != v5[8] || self->_fertileWindowProjectionsEnabled != v5[9])
      {
        BOOL v19 = 0;
        v42 = v121;
        goto LABEL_36;
      }
      BOOL v104 = v31;
      uint64_t v38 = [(HKMCAnalysis *)self cycles];
      v105 = [v5 cycles];
      v106 = (void *)v38;
      BOOL v30 = v38 == (void)v105;
      BOOL v39 = v38 != (void)v105;
      if (v30)
      {
        BOOL v101 = v39;
      }
      else
      {
        uint64_t v40 = [v5 cycles];
        if (!v40)
        {

          BOOL v19 = 0;
          v42 = v121;
          if (v121 != v122)
          {
            LOBYTE(v31) = 1;
LABEL_37:

            if (!v31) {
              goto LABEL_67;
            }
LABEL_66:

            goto LABEL_67;
          }
          BOOL v31 = 0;
LABEL_65:
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_66;
        }
        BOOL v101 = v39;
        v98 = (void *)v40;
        uint64_t v41 = [(HKMCAnalysis *)self cycles];
        v99 = [v5 cycles];
        v100 = v41;
        if (!objc_msgSend(v41, "isEqual:"))
        {
          BOOL v19 = 0;
          v42 = v121;
          goto LABEL_118;
        }
      }
      uint64_t v44 = [(HKMCAnalysis *)self deviations];
      v102 = [v5 deviations];
      v103 = (void *)v44;
      BOOL v30 = v44 == (void)v102;
      BOOL v97 = v44 != (void)v102;
      BOOL v31 = v104;
      if (!v30)
      {
        uint64_t v45 = [v5 deviations];
        if (!v45)
        {

          BOOL v19 = 0;
          v42 = v121;
          if (v106 != v105)
          {
            LOBYTE(v101) = 1;
            goto LABEL_137;
          }
          BOOL v101 = 0;
LABEL_140:
          if (!v101) {
            goto LABEL_139;
          }
          goto LABEL_138;
        }
        v114 = v21;
        id v46 = v20;
        int v47 = v18;
        v94 = (void *)v45;
        id v48 = [(HKMCAnalysis *)self deviations];
        v95 = [v5 deviations];
        v96 = v48;
        if (!objc_msgSend(v48, "isEqual:"))
        {
          BOOL v19 = 0;
          v42 = v121;
          v20 = v46;
          uint64_t v21 = v114;
          goto LABEL_117;
        }
        int v18 = v47;
        v20 = v46;
        uint64_t v21 = v114;
      }
      unint64_t v49 = [(HKMCAnalysis *)self recentSymptoms];
      if (v49 != [v5 recentSymptoms])
      {
        BOOL v19 = 0;
        v42 = v121;
        BOOL v31 = v104;
        if (v103 != v102) {
          goto LABEL_134;
        }
        goto LABEL_142;
      }
      int v115 = v18;
      uint64_t v50 = [(HKMCAnalysis *)self recentBasalBodyTemperature];
      v92 = [v5 recentBasalBodyTemperature];
      v93 = (void *)v50;
      BOOL v30 = v50 == (void)v92;
      BOOL v51 = v50 != (void)v92;
      BOOL v31 = v104;
      if (v30)
      {
        BOOL v89 = v51;
      }
      else
      {
        uint64_t v52 = [v5 recentBasalBodyTemperature];
        if (!v52)
        {

          BOOL v19 = 0;
          v42 = v121;
          if (v103 != v102)
          {
            LOBYTE(v97) = 1;
            goto LABEL_134;
          }
          BOOL v97 = 0;
LABEL_142:
          if (!v97) {
            goto LABEL_136;
          }
LABEL_135:

          goto LABEL_136;
        }
        BOOL v89 = v51;
        v86 = (void *)v52;
        v53 = [(HKMCAnalysis *)self recentBasalBodyTemperature];
        v87 = [v5 recentBasalBodyTemperature];
        v88 = v53;
        if (!objc_msgSend(v53, "isEqual:"))
        {
          BOOL v19 = 0;
          v42 = v121;
          goto LABEL_116;
        }
      }
      uint64_t v55 = [(HKMCAnalysis *)self lastLoggedDayIndex];
      v90 = [v5 lastLoggedDayIndex];
      v91 = (void *)v55;
      BOOL v30 = v55 == (void)v90;
      BOOL v56 = v55 != (void)v90;
      if (v30)
      {
        BOOL v84 = v56;
      }
      else
      {
        uint64_t v57 = [v5 lastLoggedDayIndex];
        if (!v57)
        {

          BOOL v19 = 0;
          v42 = v121;
          if (v93 != v92)
          {
            LOBYTE(v89) = 1;
            goto LABEL_131;
          }
          BOOL v89 = 0;
LABEL_144:
          if (!v89) {
            goto LABEL_133;
          }
LABEL_132:

          goto LABEL_133;
        }
        BOOL v84 = v56;
        v80 = (void *)v57;
        v58 = [(HKMCAnalysis *)self lastLoggedDayIndex];
        v81 = [v5 lastLoggedDayIndex];
        v82 = v58;
        if (!objc_msgSend(v58, "isEqual:"))
        {
          BOOL v19 = 0;
          v42 = v121;
          goto LABEL_115;
        }
      }
      v59 = [(HKMCAnalysis *)self lastMenstrualFlowDayIndex];
      v85 = [v5 lastMenstrualFlowDayIndex];
      if (v59 != v85)
      {
        uint64_t v60 = [v5 lastMenstrualFlowDayIndex];
        if (!v60)
        {

          BOOL v19 = 0;
          v42 = v121;
          if (v91 != v90)
          {
            LOBYTE(v84) = 1;
            goto LABEL_128;
          }
          BOOL v84 = 0;
          goto LABEL_146;
        }
        v83 = v59;
        v79 = (void *)v60;
        v61 = [(HKMCAnalysis *)self lastMenstrualFlowDayIndex];
        v77 = [v5 lastMenstrualFlowDayIndex];
        v78 = v61;
        if (!objc_msgSend(v61, "isEqual:"))
        {
          BOOL v19 = 0;
          v42 = v121;
          goto LABEL_114;
        }
        v59 = v83;
      }
      BOOL v62 = [(HKMCAnalysis *)self isPeriodLogLate];
      if ((v62 ^ [v5 isPeriodLogLate] | v115))
      {
        v63 = v85;
        BOOL v30 = v59 == v85;
        v64 = v59;
        v42 = v121;
        BOOL v31 = v104;
        if (!v30)
        {

          BOOL v19 = 0;
          goto LABEL_127;
        }
        v83 = v64;
        BOOL v19 = 0;
LABEL_126:

LABEL_127:
        if (v91 != v90)
        {
LABEL_128:

          if (!v84) {
            goto LABEL_130;
          }
          goto LABEL_129;
        }
LABEL_146:
        if (v84) {
LABEL_129:
        }

LABEL_130:
        if (v93 != v92)
        {
LABEL_131:

          if (!v89) {
            goto LABEL_133;
          }
          goto LABEL_132;
        }
        goto LABEL_144;
      }
      v83 = v59;
      v65 = [(HKMCAnalysis *)self latestSampleInfo];
      uint64_t v66 = [v5 latestSampleInfo];
      v67 = (void *)v66;
      v116 = v65;
      if (v65 == (void *)v66)
      {
        v74 = (void *)v66;
        v69 = v65;
        v75 = v8;
        v76 = v4;
      }
      else
      {
        v73 = [v5 latestSampleInfo];
        if (!v73) {
          goto LABEL_113;
        }
        v74 = v67;
        v75 = v8;
        v76 = v4;
        v68 = [(HKMCAnalysis *)self latestSampleInfo];
        [v5 latestSampleInfo];
        v8 = v68;
        id v4 = (HKMCAnalysis *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v68, "isEqual:"))
        {
          BOOL v19 = 0;
          v67 = v74;
LABEL_122:

          if (v83 == v85)
          {
          }
          else
          {
          }
          if (v91 != v90)
          {
          }
          if (v93 != v92)
          {
          }
          if (v103 != v102)
          {
          }
          if (v106 != v105)
          {
          }
          if (v121 != v122)
          {
          }
          if (v24 != v25)
          {
          }
          id v23 = v118;
          id v22 = v119;
          v8 = v75;
          id v4 = v76;
          if (v20 == v21) {
            goto LABEL_74;
          }
          goto LABEL_45;
        }
        v69 = v65;
      }
      int64_t v70 = [(HKMCAnalysis *)self numberOfDailySleepHeartRateStatisticsForPast100Days];
      if (v70 == [v5 numberOfDailySleepHeartRateStatisticsForPast100Days])
      {
        int64_t v71 = [(HKMCAnalysis *)self numberOfDailyAwakeHeartRateStatisticsForPast100Days];
        if (v71 == [v5 numberOfDailyAwakeHeartRateStatisticsForPast100Days])
        {
          BOOL v19 = self->_hasHealthAppDevicesWithHigherAlgorithmVersions == v5[11];
          v65 = v69;
          v67 = v74;
          if (v65 == v74)
          {
LABEL_125:

            v63 = v83;
            v42 = v121;
            BOOL v31 = v104;
            v8 = v75;
            id v4 = v76;
            if (v83 == v85) {
              goto LABEL_126;
            }
            goto LABEL_114;
          }
          goto LABEL_122;
        }
      }
      v72 = v69;
      v67 = v74;
      if (v72 == v74)
      {
        BOOL v19 = 0;
        v65 = v116;
        goto LABEL_125;
      }

      v8 = v75;
      id v4 = v76;
LABEL_113:

      BOOL v19 = 0;
      v63 = v83;
      v42 = v121;
      BOOL v31 = v104;
      if (v83 == v85) {
        goto LABEL_126;
      }
LABEL_114:

      if (v91 != v90)
      {
LABEL_115:

        if (v93 != v92)
        {
LABEL_116:

          if (v103 != v102)
          {
LABEL_117:

            if (v106 != v105)
            {
LABEL_118:

              uint64_t v37 = v107;
              if (v42 == v122)
              {
LABEL_67:

                BOOL v43 = v120;
                if (v24 != v25)
                {
LABEL_68:

                  if (v43) {
LABEL_69:
                  }

LABEL_70:
LABEL_71:
                  if (v20 != v21)
                  {

                    goto LABEL_73;
                  }
LABEL_74:

                  goto LABEL_75;
                }
                goto LABEL_76;
              }
              goto LABEL_43;
            }
            goto LABEL_139;
          }
LABEL_136:

          if (v106 != v105)
          {
LABEL_137:

            if (!v101)
            {
LABEL_139:

LABEL_36:
              if (v42 != v122) {
                goto LABEL_37;
              }
              goto LABEL_65;
            }
LABEL_138:

            goto LABEL_139;
          }
          goto LABEL_140;
        }
LABEL_133:

        if (v103 != v102)
        {
LABEL_134:

          if (!v97) {
            goto LABEL_136;
          }
          goto LABEL_135;
        }
        goto LABEL_142;
      }
      goto LABEL_130;
    }
    BOOL v19 = 0;
  }
LABEL_75:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v28 = [(HKMCAnalysis *)self statistics];
  uint64_t v3 = [v28 hash];
  id v27 = [(HKMCAnalysis *)self menstruationProjections];
  uint64_t v4 = [v27 hash] ^ v3;
  uint64_t v26 = [(HKMCAnalysis *)self fertileWindowProjections];
  uint64_t v5 = v4 ^ [v26 hash] ^ self->_menstruationProjectionsEnabled;
  BOOL fertileWindowProjectionsEnabled = self->_fertileWindowProjectionsEnabled;
  uint64_t v7 = [(HKMCAnalysis *)self cycles];
  uint64_t v8 = v5 ^ fertileWindowProjectionsEnabled ^ [v7 hash];
  uint64_t v9 = [(HKMCAnalysis *)self deviations];
  uint64_t v10 = [v9 hash];
  unint64_t v11 = v10 ^ [(HKMCAnalysis *)self recentSymptoms];
  unint64_t v12 = [(HKMCAnalysis *)self recentBasalBodyTemperature];
  uint64_t v13 = v11 ^ [v12 hash];
  uint64_t v14 = [(HKMCAnalysis *)self lastLoggedDayIndex];
  uint64_t v15 = v13 ^ [v14 hash];
  int v16 = [(HKMCAnalysis *)self lastMenstrualFlowDayIndex];
  uint64_t v17 = v8 ^ v15 ^ [v16 hash];
  uint64_t v18 = [(HKMCAnalysis *)self isPeriodLogLate];
  BOOL v19 = [(HKMCAnalysis *)self ongoingCycleFactors];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = [(HKMCAnalysis *)self latestSampleInfo];
  uint64_t v22 = v20 ^ [v21 hash];
  int64_t v23 = v22 ^ [(HKMCAnalysis *)self numberOfDailySleepHeartRateStatisticsForPast100Days];
  unint64_t v24 = v17 ^ v23 ^ [(HKMCAnalysis *)self numberOfDailyAwakeHeartRateStatisticsForPast100Days] ^ self->_hasHealthAppDevicesWithHigherAlgorithmVersions;

  return v24;
}

- (HKMCStatistics)statistics
{
  return self->_statistics;
}

- (BOOL)menstruationProjectionsEnabled
{
  return self->_menstruationProjectionsEnabled;
}

- (BOOL)fertileWindowProjectionsEnabled
{
  return self->_fertileWindowProjectionsEnabled;
}

- (NSArray)deviations
{
  return self->_deviations;
}

- (unint64_t)recentSymptoms
{
  return self->_recentSymptoms;
}

- (HKMCRecentBasalBodyTemperature)recentBasalBodyTemperature
{
  return self->_recentBasalBodyTemperature;
}

- (NSNumber)lastLoggedDayIndex
{
  return self->_lastLoggedDayIndex;
}

- (NSNumber)lastMenstrualFlowDayIndex
{
  return self->_lastMenstrualFlowDayIndex;
}

- (BOOL)isPeriodLogLate
{
  return self->_isPeriodLogLate;
}

- (NSArray)ongoingCycleFactors
{
  return self->_ongoingCycleFactors;
}

- (BOOL)hasHealthAppDevicesWithHigherAlgorithmVersions
{
  return self->_hasHealthAppDevicesWithHigherAlgorithmVersions;
}

- (HKMCSampleInfo)latestSampleInfo
{
  return self->_latestSampleInfo;
}

- (void)setLatestSampleInfo:(id)a3
{
}

- (int64_t)numberOfDailySleepHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailySleepHeartRateStatisticsForPast100Days;
}

- (int64_t)numberOfDailyAwakeHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleInfo, 0);
  objc_storeStrong((id *)&self->_ongoingCycleFactors, 0);
  objc_storeStrong((id *)&self->_lastMenstrualFlowDayIndex, 0);
  objc_storeStrong((id *)&self->_lastLoggedDayIndex, 0);
  objc_storeStrong((id *)&self->_recentBasalBodyTemperature, 0);
  objc_storeStrong((id *)&self->_deviations, 0);
  objc_storeStrong((id *)&self->_cycles, 0);
  objc_storeStrong((id *)&self->_fertileWindowProjections, 0);
  objc_storeStrong((id *)&self->_menstruationProjections, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end