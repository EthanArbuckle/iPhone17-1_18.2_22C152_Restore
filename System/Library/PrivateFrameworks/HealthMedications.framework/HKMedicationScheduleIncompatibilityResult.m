@interface HKMedicationScheduleIncompatibilityResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationSchedule)schedule;
- (HKMedicationScheduleIncompatibilityResult)init;
- (HKMedicationScheduleIncompatibilityResult)initWithCoder:(id)a3;
- (HKMedicationScheduleIncompatibilityResult)initWithSchedule:(id)a3 incompatibleDevices:(id)a4;
- (NSArray)incompatibleDevices;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIncompatibleDevices:(id)a3;
- (void)setSchedule:(id)a3;
@end

@implementation HKMedicationScheduleIncompatibilityResult

- (HKMedicationScheduleIncompatibilityResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationScheduleIncompatibilityResult)initWithSchedule:(id)a3 incompatibleDevices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationScheduleIncompatibilityResult;
  v9 = [(HKMedicationScheduleIncompatibilityResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schedule, a3);
    objc_storeStrong((id *)&v10->_incompatibleDevices, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationScheduleIncompatibilityResult *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HKMedicationSchedule *)self->_schedule medicationIdentifier];
      id v7 = [(HKMedicationSchedule *)v5->_schedule medicationIdentifier];
      if (v6 == v7)
      {
        incompatibleDevices = self->_incompatibleDevices;
        v15 = v5->_incompatibleDevices;
        char v13 = incompatibleDevices == v15;
        if (incompatibleDevices != v15 && v15) {
          char v13 = -[NSArray isEqualToArray:](incompatibleDevices, "isEqualToArray:");
        }
      }
      else
      {
        id v8 = [(HKMedicationSchedule *)v5->_schedule medicationIdentifier];
        if (v8)
        {
          v9 = [(HKMedicationSchedule *)self->_schedule medicationIdentifier];
          v10 = [(HKMedicationSchedule *)v5->_schedule medicationIdentifier];
          if ([v9 isEqual:v10])
          {
            v11 = self->_incompatibleDevices;
            objc_super v12 = v5->_incompatibleDevices;
            char v13 = v11 == v12;
            if (v11 != v12 && v12) {
              char v13 = -[NSArray isEqualToArray:](v11, "isEqualToArray:");
            }
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMedicationSchedule *)self->_schedule hash];
  return [(NSArray *)self->_incompatibleDevices hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  schedule = self->_schedule;
  id v5 = a3;
  [v5 encodeObject:schedule forKey:@"Schedule"];
  [v5 encodeObject:self->_incompatibleDevices forKey:@"IncompatibleDevices"];
}

- (HKMedicationScheduleIncompatibilityResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationScheduleIncompatibilityResult;
  id v5 = [(HKMedicationScheduleIncompatibilityResult *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Schedule"];
    [(HKMedicationScheduleIncompatibilityResult *)v5 setSchedule:v6];

    id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"IncompatibleDevices"];
    [(HKMedicationScheduleIncompatibilityResult *)v5 setIncompatibleDevices:v8];
  }
  return v5;
}

- (HKMedicationSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (NSArray)incompatibleDevices
{
  return self->_incompatibleDevices;
}

- (void)setIncompatibleDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incompatibleDevices, 0);

  objc_storeStrong((id *)&self->_schedule, 0);
}

@end