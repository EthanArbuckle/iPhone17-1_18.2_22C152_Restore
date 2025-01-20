@interface HKMedicationScheduleItemDose
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLastScheduledDose;
- (HKMedicationScheduleItemDose)initWithCoder:(id)a3;
- (HKMedicationScheduleItemDose)initWithScheduleUUID:(id)a3 dose:(id)a4 medicationIdentifier:(id)a5;
- (HKMedicationScheduleItemDose)initWithScheduleUUID:(id)a3 dose:(id)a4 medicationIdentifier:(id)a5 isLastScheduledDose:(BOOL)a6;
- (NSNumber)dose;
- (NSString)medicationIdentifier;
- (NSUUID)scheduleUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationScheduleItemDose

- (HKMedicationScheduleItemDose)initWithScheduleUUID:(id)a3 dose:(id)a4 medicationIdentifier:(id)a5 isLastScheduledDose:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationScheduleItemDose;
  v14 = [(HKMedicationScheduleItemDose *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scheduleUUID, a3);
    objc_storeStrong((id *)&v15->_dose, a4);
    objc_storeStrong((id *)&v15->_medicationIdentifier, a5);
    v15->_isLastScheduledDose = a6;
  }

  return v15;
}

- (HKMedicationScheduleItemDose)initWithScheduleUUID:(id)a3 dose:(id)a4 medicationIdentifier:(id)a5
{
  return [(HKMedicationScheduleItemDose *)self initWithScheduleUUID:a3 dose:a4 medicationIdentifier:a5 isLastScheduledDose:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMedicationScheduleItemDose *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(NSUUID *)v5->_scheduleUUID isEqual:self->_scheduleUUID]
        && [(NSString *)v5->_medicationIdentifier isEqual:self->_medicationIdentifier]
        && [(NSNumber *)v5->_dose isEqualToNumber:self->_dose]
        && v5->_isLastScheduledDose == self->_isLastScheduledDose;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_scheduleUUID hash];
  NSUInteger v4 = [(NSString *)self->_medicationIdentifier hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_dose hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dose = self->_dose;
  id v5 = a3;
  [v5 encodeObject:dose forKey:@"dose"];
  [v5 encodeObject:self->_scheduleUUID forKey:@"scheduleUuid"];
  [v5 encodeObject:self->_medicationIdentifier forKey:@"medicationIdentifier"];
  [v5 encodeBool:self->_isLastScheduledDose forKey:@"isLastScheduledDose"];
}

- (HKMedicationScheduleItemDose)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationScheduleItemDose;
  id v5 = [(HKMedicationScheduleItemDose *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dose"];
    dose = v5->_dose;
    v5->_dose = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduleUuid"];
    scheduleUUID = v5->_scheduleUUID;
    v5->_scheduleUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"medicationIdentifier"];
    if (!v10)
    {
      id v12 = 0;
      goto LABEL_6;
    }
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (NSString *)v10;

    v5->_isLastScheduledDose = [v4 decodeBoolForKey:@"isLastScheduledDose"];
  }
  id v12 = v5;
LABEL_6:

  return v12;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKMedicationScheduleItemDose *)self scheduleUUID];
  uint64_t v6 = [(HKMedicationScheduleItemDose *)self dose];
  v7 = [v3 stringWithFormat:@"<%@: %p>: scheduleUUID: %@ dose: %@ isLastScheduledDose: %d", v4, self, v5, v6, -[HKMedicationScheduleItemDose isLastScheduledDose](self, "isLastScheduledDose")];

  return v7;
}

- (NSUUID)scheduleUUID
{
  return self->_scheduleUUID;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (NSNumber)dose
{
  return self->_dose;
}

- (BOOL)isLastScheduledDose
{
  return self->_isLastScheduledDose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dose, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);

  objc_storeStrong((id *)&self->_scheduleUUID, 0);
}

@end