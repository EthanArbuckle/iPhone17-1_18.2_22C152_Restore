@interface HKMCCycle
+ (BOOL)supportsSecureCoding;
+ (id)_cycleWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5;
+ (id)_cycleWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5 ovulationConfirmationType:(int64_t)a6 ovulationConfirmationFailure:(int64_t)a7 dailyEligibleWristTemperatureCount:(int64_t)a8 cycleFactors:(id)a9;
- (BOOL)isEqual:(id)a3;
- (HKMCCycle)initWithCoder:(id)a3;
- (HKMCCycleSegment)fertileWindowSegment;
- (HKMCCycleSegment)menstruationSegment;
- (NSArray)cycleFactors;
- (NSNumber)lastDayIndex;
- (NSString)hk_redactedDescription;
- (id)_initWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5 ovulationConfirmationType:(int64_t)a6 ovulationConfirmationFailure:(int64_t)a7 dailyEligibleWristTemperatureCount:(int64_t)a8 cycleFactors:(id)a9;
- (id)description;
- (int64_t)dailyEligibleWristTemperatureCount;
- (int64_t)ovulationConfirmationFailure;
- (int64_t)ovulationConfirmationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCCycle

- (void)encodeWithCoder:(id)a3
{
  menstruationSegment = self->_menstruationSegment;
  id v5 = a3;
  [v5 encodeObject:menstruationSegment forKey:@"MenstruationSegment"];
  [v5 encodeObject:self->_fertileWindowSegment forKey:@"FertileWindowSegment"];
  [v5 encodeObject:self->_lastDayIndex forKey:@"LastDayIndex"];
  [v5 encodeInteger:self->_ovulationConfirmationType forKey:@"OvulationConfirmationType"];
  [v5 encodeInteger:self->_ovulationConfirmationFailure forKey:@"OvulationConfirmationFailure"];
  [v5 encodeInteger:self->_dailyEligibleWristTemperatureCount forKey:@"DailyEligibleWristTemperatureCount"];
  [v5 encodeObject:self->_cycleFactors forKey:@"CycleFactors"];
}

- (HKMCCycle)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMCCycle;
  id v5 = [(HKMCCycle *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MenstruationSegment"];
    menstruationSegment = v5->_menstruationSegment;
    v5->_menstruationSegment = (HKMCCycleSegment *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FertileWindowSegment"];
    fertileWindowSegment = v5->_fertileWindowSegment;
    v5->_fertileWindowSegment = (HKMCCycleSegment *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastDayIndex"];
    lastDayIndex = v5->_lastDayIndex;
    v5->_lastDayIndex = (NSNumber *)v10;

    v5->_ovulationConfirmationType = [v4 decodeIntegerForKey:@"OvulationConfirmationType"];
    v5->_ovulationConfirmationFailure = [v4 decodeIntegerForKey:@"OvulationConfirmationFailure"];
    v5->_dailyEligibleWristTemperatureCount = [v4 decodeIntegerForKey:@"DailyEligibleWristTemperatureCount"];
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"CycleFactors"];
    cycleFactors = v5->_cycleFactors;
    v5->_cycleFactors = (NSArray *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_cycleWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = (void *)[v11 _initWithMenstruationSegment:v10 fertileWindowSegment:v9 lastDayIndex:v8 ovulationConfirmationType:0 ovulationConfirmationFailure:0 dailyEligibleWristTemperatureCount:0 cycleFactors:MEMORY[0x263EFFA68]];

  return v12;
}

+ (id)_cycleWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5 ovulationConfirmationType:(int64_t)a6 ovulationConfirmationFailure:(int64_t)a7 dailyEligibleWristTemperatureCount:(int64_t)a8 cycleFactors:(id)a9
{
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) _initWithMenstruationSegment:v19 fertileWindowSegment:v18 lastDayIndex:v17 ovulationConfirmationType:a6 ovulationConfirmationFailure:a7 dailyEligibleWristTemperatureCount:a8 cycleFactors:v16];

  return v20;
}

- (id)_initWithMenstruationSegment:(id)a3 fertileWindowSegment:(id)a4 lastDayIndex:(id)a5 ovulationConfirmationType:(int64_t)a6 ovulationConfirmationFailure:(int64_t)a7 dailyEligibleWristTemperatureCount:(int64_t)a8 cycleFactors:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HKMCCycle;
  id v19 = [(HKMCCycle *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_menstruationSegment, a3);
    objc_storeStrong((id *)&v20->_fertileWindowSegment, a4);
    objc_storeStrong((id *)&v20->_lastDayIndex, a5);
    v20->_ovulationConfirmationType = a6;
    v20->_ovulationConfirmationFailure = a7;
    v20->_dailyEligibleWristTemperatureCount = a8;
    uint64_t v21 = [v18 copy];
    cycleFactors = v20->_cycleFactors;
    v20->_cycleFactors = (NSArray *)v21;
  }
  return v20;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v12 = *(_OWORD *)&self->_menstruationSegment;
  lastDayIndex = self->_lastDayIndex;
  uint64_t v6 = [NSNumber numberWithInteger:self->_ovulationConfirmationType];
  v7 = [NSNumber numberWithInteger:self->_ovulationConfirmationFailure];
  id v8 = [NSNumber numberWithInteger:self->_dailyEligibleWristTemperatureCount];
  id v9 = NSStringFromCycleFactors(self->_cycleFactors);
  id v10 = [v3 stringWithFormat:@"<%@:%p menstruation:%@ fertile window:%@ last day:%@ ovulation confirmation type:%@, ovulation confirmation failure:%@, daily eligible wrist temperature count:%@, cycle factors:%@>", v4, self, v12, lastDayIndex, v6, v7, v8, v9];

  return v10;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCCycle *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HKMCCycle *)self cycleFactors];
      uint64_t v6 = [v5 count];
      v7 = [(HKMCCycle *)v4 cycleFactors];
      uint64_t v8 = [v7 count];

      if (v6 == v8)
      {
        id v9 = [(HKMCCycle *)self cycleFactors];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          unint64_t v11 = 0;
          do
          {
            long long v12 = [(HKMCCycle *)self cycleFactors];
            v7 = [v12 objectAtIndexedSubscript:v11];
            uint64_t v13 = [(HKMCCycle *)v4 cycleFactors];
            v14 = [v13 objectAtIndexedSubscript:v11];
            int v15 = [v7 isEqual:v14];

            if ((v15 & 1) == 0) {
              break;
            }
            ++v11;
            id v16 = [(HKMCCycle *)self cycleFactors];
            v7 = (void *)[v16 count];
          }
          while (v11 < (unint64_t)v7);
        }
        else
        {
          int v15 = 1;
        }
      }
      else
      {
        int v15 = 0;
      }
      id v18 = [(HKMCCycle *)self menstruationSegment];
      id v19 = [(HKMCCycle *)v4 menstruationSegment];
      if (v18 != v19)
      {
        uint64_t v20 = [(HKMCCycle *)v4 menstruationSegment];
        if (!v20)
        {
          BOOL v17 = 0;
          goto LABEL_47;
        }
        v7 = (void *)v20;
        uint64_t v21 = [(HKMCCycle *)self menstruationSegment];
        v22 = [(HKMCCycle *)v4 menstruationSegment];
        if (![v21 isEqual:v22])
        {
          BOOL v17 = 0;
LABEL_46:

          goto LABEL_47;
        }
        v44 = v7;
        v45 = v22;
        v46 = v21;
      }
      v23 = [(HKMCCycle *)self fertileWindowSegment];
      v24 = [(HKMCCycle *)v4 fertileWindowSegment];
      if (v23 != v24)
      {
        uint64_t v25 = [(HKMCCycle *)v4 fertileWindowSegment];
        if (!v25)
        {
          BOOL v17 = 0;
          goto LABEL_43;
        }
        v26 = (void *)v25;
        v27 = [(HKMCCycle *)self fertileWindowSegment];
        v7 = [(HKMCCycle *)v4 fertileWindowSegment];
        if (([v27 isEqual:v7] & 1) == 0)
        {

          BOOL v17 = 0;
          goto LABEL_45;
        }
        v41 = v7;
        v42 = v27;
        v43 = v26;
      }
      v28 = [(HKMCCycle *)self lastDayIndex];
      v29 = [(HKMCCycle *)v4 lastDayIndex];
      if (v28 != v29)
      {
        uint64_t v30 = [(HKMCCycle *)v4 lastDayIndex];
        if (!v30) {
          goto LABEL_37;
        }
        v40 = (void *)v30;
        uint64_t v31 = [(HKMCCycle *)self lastDayIndex];
        uint64_t v32 = [(HKMCCycle *)v4 lastDayIndex];
        v39 = (void *)v31;
        v33 = (void *)v31;
        v7 = (void *)v32;
        if (![v33 isEqual:v32])
        {
          BOOL v17 = 0;
LABEL_26:

          if (v23 == v24)
          {

            goto LABEL_44;
          }

LABEL_43:
LABEL_44:

LABEL_45:
          v22 = v45;
          uint64_t v21 = v46;
          v7 = v44;
          if (v18 != v19) {
            goto LABEL_46;
          }
LABEL_47:

          goto LABEL_48;
        }
      }
      if (v15)
      {
        int64_t v34 = [(HKMCCycle *)self ovulationConfirmationType];
        if (v34 == [(HKMCCycle *)v4 ovulationConfirmationType])
        {
          int64_t v35 = [(HKMCCycle *)self ovulationConfirmationFailure];
          if (v35 == [(HKMCCycle *)v4 ovulationConfirmationFailure])
          {
            int64_t v36 = [(HKMCCycle *)self dailyEligibleWristTemperatureCount];
            BOOL v17 = v36 == [(HKMCCycle *)v4 dailyEligibleWristTemperatureCount];
            BOOL v37 = v17;
            if (v28 != v29) {
              goto LABEL_26;
            }
            goto LABEL_40;
          }
        }
      }
      if (v28 == v29)
      {
        BOOL v37 = 0;
        BOOL v17 = 0;
LABEL_40:

LABEL_41:
        if (v23 != v24)
        {

          BOOL v17 = v37;
        }
        goto LABEL_43;
      }

LABEL_37:
      BOOL v37 = 0;
      BOOL v17 = 0;
      goto LABEL_41;
    }
    BOOL v17 = 0;
  }
LABEL_48:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMCCycleSegment *)self->_menstruationSegment hash];
  unint64_t v4 = [(HKMCCycleSegment *)self->_fertileWindowSegment hash] ^ v3;
  NSInteger v5 = [(NSNumber *)self->_lastDayIndex integerValue];
  return v4 ^ v5 ^ [(NSArray *)self->_cycleFactors hash] ^ self->_ovulationConfirmationType ^ self->_ovulationConfirmationFailure ^ self->_dailyEligibleWristTemperatureCount;
}

- (HKMCCycleSegment)menstruationSegment
{
  return self->_menstruationSegment;
}

- (HKMCCycleSegment)fertileWindowSegment
{
  return self->_fertileWindowSegment;
}

- (int64_t)ovulationConfirmationType
{
  return self->_ovulationConfirmationType;
}

- (int64_t)ovulationConfirmationFailure
{
  return self->_ovulationConfirmationFailure;
}

- (int64_t)dailyEligibleWristTemperatureCount
{
  return self->_dailyEligibleWristTemperatureCount;
}

- (NSNumber)lastDayIndex
{
  return self->_lastDayIndex;
}

- (NSArray)cycleFactors
{
  return self->_cycleFactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_lastDayIndex, 0);
  objc_storeStrong((id *)&self->_fertileWindowSegment, 0);
  objc_storeStrong((id *)&self->_menstruationSegment, 0);
}

@end