@interface HKActivityGoalSchedule
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)activityGoalScheduleWithDate:(id)a3 goalType:(int64_t)a4 goal:(id)a5 device:(id)a6 metadata:(id)a7;
+ (id)activityGoalScheduleWithDate:(id)a3 goalType:(int64_t)a4 mondayGoal:(id)a5 tuesdayGoal:(id)a6 wednesdayGoal:(id)a7 thursdayGoal:(id)a8 fridayGoal:(id)a9 saturdayGoal:(id)a10 sundayGoal:(id)a11 device:(id)a12 metadata:(id)a13;
- (BOOL)isEquivalent:(id)a3;
- (HKActivityGoalSchedule)initWithCoder:(id)a3;
- (HKQuantity)fridayGoal;
- (HKQuantity)mondayGoal;
- (HKQuantity)saturdayGoal;
- (HKQuantity)sundayGoal;
- (HKQuantity)thursdayGoal;
- (HKQuantity)tuesdayGoal;
- (HKQuantity)wednesdayGoal;
- (int64_t)goalType;
- (void)encodeWithCoder:(id)a3;
- (void)setFridayGoal:(id)a3;
- (void)setGoalType:(int64_t)a3;
- (void)setMondayGoal:(id)a3;
- (void)setSaturdayGoal:(id)a3;
- (void)setSundayGoal:(id)a3;
- (void)setThursdayGoal:(id)a3;
- (void)setTuesdayGoal:(id)a3;
- (void)setWednesdayGoal:(id)a3;
@end

@implementation HKActivityGoalSchedule

+ (id)activityGoalScheduleWithDate:(id)a3 goalType:(int64_t)a4 mondayGoal:(id)a5 tuesdayGoal:(id)a6 wednesdayGoal:(id)a7 thursdayGoal:(id)a8 fridayGoal:(id)a9 saturdayGoal:(id)a10 sundayGoal:(id)a11 device:(id)a12 metadata:(id)a13
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __165__HKActivityGoalSchedule_activityGoalScheduleWithDate_goalType_mondayGoal_tuesdayGoal_wednesdayGoal_thursdayGoal_fridayGoal_saturdayGoal_sundayGoal_device_metadata___block_invoke;
  aBlock[3] = &unk_1E58C7808;
  id v42 = v17;
  id v43 = v18;
  id v44 = v19;
  id v45 = v20;
  id v46 = v21;
  id v47 = v22;
  id v48 = v23;
  int64_t v49 = a4;
  id v39 = v23;
  id v38 = v22;
  id v37 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = a13;
  id v29 = a12;
  id v30 = a3;
  v31 = _Block_copy(aBlock);
  v32 = +[HKObjectType activityGoalScheduleType];
  v40.receiver = a1;
  v40.super_class = (Class)&OBJC_METACLASS___HKActivityGoalSchedule;
  id v33 = objc_msgSendSuper2(&v40, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v32, v30, v30, v29, v28, v31);

  return v33;
}

void __165__HKActivityGoalSchedule_activityGoalScheduleWithDate_goalType_mondayGoal_tuesdayGoal_wednesdayGoal_thursdayGoal_fridayGoal_saturdayGoal_sundayGoal_device_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 96) = *(void *)(a1 + 88);
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  v4 = (id *)(id)a2;
  objc_storeStrong(v4 + 14, *(id *)(a1 + 40));
  objc_storeStrong(v4 + 15, *(id *)(a1 + 48));
  objc_storeStrong(v4 + 16, *(id *)(a1 + 56));
  objc_storeStrong(v4 + 17, *(id *)(a1 + 64));
  objc_storeStrong(v4 + 18, *(id *)(a1 + 72));
  objc_storeStrong(v4 + 19, *(id *)(a1 + 80));
}

+ (id)activityGoalScheduleWithDate:(id)a3 goalType:(int64_t)a4 goal:(id)a5 device:(id)a6 metadata:(id)a7
{
  return (id)[a1 activityGoalScheduleWithDate:a3 goalType:a4 mondayGoal:a5 tuesdayGoal:a5 wednesdayGoal:a5 thursdayGoal:a5 fridayGoal:a5 saturdayGoal:a5 sundayGoal:a5 device:a6 metadata:a7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKActivityGoalSchedule;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goalType, @"GoalType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_mondayGoal forKey:@"MondayGoal"];
  [v4 encodeObject:self->_tuesdayGoal forKey:@"TuesdayGoal"];
  [v4 encodeObject:self->_wednesdayGoal forKey:@"WednesdayGoal"];
  [v4 encodeObject:self->_thursdayGoal forKey:@"ThursdayGoal"];
  [v4 encodeObject:self->_fridayGoal forKey:@"FridayGoal"];
  [v4 encodeObject:self->_saturdayGoal forKey:@"SaturdayGoal"];
  [v4 encodeObject:self->_sundayGoal forKey:@"SundayGoal"];
}

- (HKActivityGoalSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKActivityGoalSchedule;
  objc_super v5 = [(HKSample *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v5->_goalType = [v4 decodeIntegerForKey:@"GoalType"];
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"MondayGoal"];
    mondayGoal = v5->_mondayGoal;
    v5->_mondayGoal = (HKQuantity *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"TuesdayGoal"];
    tuesdayGoal = v5->_tuesdayGoal;
    v5->_tuesdayGoal = (HKQuantity *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"WednesdayGoal"];
    wednesdayGoal = v5->_wednesdayGoal;
    v5->_wednesdayGoal = (HKQuantity *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:v6 forKey:@"ThursdayGoal"];
    thursdayGoal = v5->_thursdayGoal;
    v5->_thursdayGoal = (HKQuantity *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:v6 forKey:@"FridayGoal"];
    fridayGoal = v5->_fridayGoal;
    v5->_fridayGoal = (HKQuantity *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:v6 forKey:@"SaturdayGoal"];
    saturdayGoal = v5->_saturdayGoal;
    v5->_saturdayGoal = (HKQuantity *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:v6 forKey:@"SundayGoal"];
    sundayGoal = v5->_sundayGoal;
    v5->_sundayGoal = (HKQuantity *)v19;
  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v53.receiver = self;
    v53.super_class = (Class)HKActivityGoalSchedule;
    if ([(HKSample *)&v53 isEquivalent:v4])
    {
      id v5 = v4;
      int64_t v6 = [(HKActivityGoalSchedule *)self goalType];
      if (v6 != [v5 goalType]) {
        goto LABEL_40;
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self mondayGoal];
      uint64_t v8 = [v5 mondayGoal];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [v5 mondayGoal];
        if (!v10) {
          goto LABEL_39;
        }
        uint64_t v11 = (void *)v10;
        v12 = [(HKActivityGoalSchedule *)self mondayGoal];
        uint64_t v13 = [v5 mondayGoal];
        int v14 = [v12 isEqual:v13];

        if (!v14) {
          goto LABEL_40;
        }
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self tuesdayGoal];
      uint64_t v16 = [v5 tuesdayGoal];
      if (v7 == (void *)v16)
      {
      }
      else
      {
        uint64_t v9 = (void *)v16;
        uint64_t v17 = [v5 tuesdayGoal];
        if (!v17) {
          goto LABEL_39;
        }
        id v18 = (void *)v17;
        uint64_t v19 = [(HKActivityGoalSchedule *)self tuesdayGoal];
        id v20 = [v5 tuesdayGoal];
        int v21 = [v19 isEqual:v20];

        if (!v21) {
          goto LABEL_40;
        }
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self wednesdayGoal];
      uint64_t v22 = [v5 wednesdayGoal];
      if (v7 == (void *)v22)
      {
      }
      else
      {
        uint64_t v9 = (void *)v22;
        uint64_t v23 = [v5 wednesdayGoal];
        if (!v23) {
          goto LABEL_39;
        }
        id v24 = (void *)v23;
        id v25 = [(HKActivityGoalSchedule *)self wednesdayGoal];
        id v26 = [v5 wednesdayGoal];
        int v27 = [v25 isEqual:v26];

        if (!v27) {
          goto LABEL_40;
        }
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self thursdayGoal];
      uint64_t v28 = [v5 thursdayGoal];
      if (v7 == (void *)v28)
      {
      }
      else
      {
        uint64_t v9 = (void *)v28;
        uint64_t v29 = [v5 thursdayGoal];
        if (!v29) {
          goto LABEL_39;
        }
        id v30 = (void *)v29;
        v31 = [(HKActivityGoalSchedule *)self thursdayGoal];
        v32 = [v5 thursdayGoal];
        int v33 = [v31 isEqual:v32];

        if (!v33) {
          goto LABEL_40;
        }
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self fridayGoal];
      uint64_t v34 = [v5 fridayGoal];
      if (v7 == (void *)v34)
      {
      }
      else
      {
        uint64_t v9 = (void *)v34;
        uint64_t v35 = [v5 fridayGoal];
        if (!v35) {
          goto LABEL_39;
        }
        v36 = (void *)v35;
        id v37 = [(HKActivityGoalSchedule *)self fridayGoal];
        id v38 = [v5 fridayGoal];
        int v39 = [v37 isEqual:v38];

        if (!v39) {
          goto LABEL_40;
        }
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self saturdayGoal];
      uint64_t v40 = [v5 saturdayGoal];
      if (v7 == (void *)v40)
      {
      }
      else
      {
        uint64_t v9 = (void *)v40;
        uint64_t v41 = [v5 saturdayGoal];
        if (!v41) {
          goto LABEL_39;
        }
        id v42 = (void *)v41;
        id v43 = [(HKActivityGoalSchedule *)self saturdayGoal];
        id v44 = [v5 saturdayGoal];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_40;
        }
      }
      uint64_t v7 = [(HKActivityGoalSchedule *)self sundayGoal];
      uint64_t v46 = [v5 sundayGoal];
      if (v7 == (void *)v46)
      {

LABEL_44:
        BOOL v15 = 1;
        goto LABEL_41;
      }
      uint64_t v9 = (void *)v46;
      uint64_t v47 = [v5 sundayGoal];
      if (v47)
      {
        id v48 = (void *)v47;
        int64_t v49 = [(HKActivityGoalSchedule *)self sundayGoal];
        v50 = [v5 sundayGoal];
        char v51 = [v49 isEqual:v50];

        if (v51) {
          goto LABEL_44;
        }
LABEL_40:
        BOOL v15 = 0;
LABEL_41:

        goto LABEL_42;
      }
LABEL_39:

      goto LABEL_40;
    }
  }
  BOOL v15 = 0;
LABEL_42:

  return v15;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(int64_t)a3
{
  self->_goalType = a3;
}

- (HKQuantity)mondayGoal
{
  return self->_mondayGoal;
}

- (void)setMondayGoal:(id)a3
{
}

- (HKQuantity)tuesdayGoal
{
  return self->_tuesdayGoal;
}

- (void)setTuesdayGoal:(id)a3
{
}

- (HKQuantity)wednesdayGoal
{
  return self->_wednesdayGoal;
}

- (void)setWednesdayGoal:(id)a3
{
}

- (HKQuantity)thursdayGoal
{
  return self->_thursdayGoal;
}

- (void)setThursdayGoal:(id)a3
{
}

- (HKQuantity)fridayGoal
{
  return self->_fridayGoal;
}

- (void)setFridayGoal:(id)a3
{
}

- (HKQuantity)saturdayGoal
{
  return self->_saturdayGoal;
}

- (void)setSaturdayGoal:(id)a3
{
}

- (HKQuantity)sundayGoal
{
  return self->_sundayGoal;
}

- (void)setSundayGoal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sundayGoal, 0);
  objc_storeStrong((id *)&self->_saturdayGoal, 0);
  objc_storeStrong((id *)&self->_fridayGoal, 0);
  objc_storeStrong((id *)&self->_thursdayGoal, 0);
  objc_storeStrong((id *)&self->_wednesdayGoal, 0);
  objc_storeStrong((id *)&self->_tuesdayGoal, 0);

  objc_storeStrong((id *)&self->_mondayGoal, 0);
}

@end