@interface HKMedicationScheduleIntervalData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationScheduleIntervalData)initWithCoder:(id)a3;
- (HKMedicationScheduleIntervalData)initWithStartTimeComponent:(id)a3 daysOfWeek:(unint64_t)a4 cycleIndex:(id)a5 cycleIntervalDays:(id)a6 dose:(id)a7;
- (NSDateComponents)startTimeComponent;
- (NSNumber)cycleIndex;
- (NSNumber)cycleIntervalDays;
- (NSNumber)dose;
- (id)description;
- (unint64_t)daysOfWeek;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationScheduleIntervalData

- (NSNumber)dose
{
  return self->_dose;
}

- (NSDateComponents)startTimeComponent
{
  return self->_startTimeComponent;
}

- (unint64_t)daysOfWeek
{
  return self->_daysOfWeek;
}

- (NSNumber)cycleIntervalDays
{
  return self->_cycleIntervalDays;
}

- (NSNumber)cycleIndex
{
  return self->_cycleIndex;
}

- (void)encodeWithCoder:(id)a3
{
  startTimeComponent = self->_startTimeComponent;
  id v5 = a3;
  [v5 encodeObject:startTimeComponent forKey:@"startTimeComponent"];
  [v5 encodeInteger:self->_daysOfWeek forKey:@"daysOfWeek"];
  [v5 encodeObject:self->_cycleIndex forKey:@"cycleIndex"];
  [v5 encodeObject:self->_cycleIntervalDays forKey:@"cycleIntervalDays"];
  [v5 encodeObject:self->_dose forKey:@"dose"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dose, 0);
  objc_storeStrong((id *)&self->_cycleIntervalDays, 0);
  objc_storeStrong((id *)&self->_cycleIndex, 0);

  objc_storeStrong((id *)&self->_startTimeComponent, 0);
}

- (HKMedicationScheduleIntervalData)initWithStartTimeComponent:(id)a3 daysOfWeek:(unint64_t)a4 cycleIndex:(id)a5 cycleIntervalDays:(id)a6 dose:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKMedicationScheduleIntervalData;
  v16 = [(HKMedicationScheduleIntervalData *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    startTimeComponent = v16->_startTimeComponent;
    v16->_startTimeComponent = (NSDateComponents *)v17;

    v16->_daysOfWeek = a4;
    uint64_t v19 = [v13 copy];
    cycleIndex = v16->_cycleIndex;
    v16->_cycleIndex = (NSNumber *)v19;

    uint64_t v21 = [v14 copy];
    cycleIntervalDays = v16->_cycleIntervalDays;
    v16->_cycleIntervalDays = (NSNumber *)v21;

    uint64_t v23 = [v15 copy];
    dose = v16->_dose;
    v16->_dose = (NSNumber *)v23;
  }
  return v16;
}

- (HKMedicationScheduleIntervalData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKMedicationScheduleIntervalData;
  id v5 = [(HKMedicationScheduleIntervalData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTimeComponent"];
    startTimeComponent = v5->_startTimeComponent;
    v5->_startTimeComponent = (NSDateComponents *)v6;

    v5->_daysOfWeek = [v4 decodeIntegerForKey:@"daysOfWeek"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cycleIndex"];
    cycleIndex = v5->_cycleIndex;
    v5->_cycleIndex = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cycleIntervalDays"];
    cycleIntervalDays = v5->_cycleIntervalDays;
    v5->_cycleIntervalDays = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dose"];
    dose = v5->_dose;
    v5->_dose = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicationScheduleIntervalData *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      startTimeComponent = self->_startTimeComponent;
      v7 = v5->_startTimeComponent;
      if (startTimeComponent != v7
        && (!v7 || !-[NSDateComponents isEqual:](startTimeComponent, "isEqual:")))
      {
        goto LABEL_18;
      }
      if (self->_daysOfWeek != v5->_daysOfWeek) {
        goto LABEL_18;
      }
      cycleIndex = self->_cycleIndex;
      v9 = v5->_cycleIndex;
      if (cycleIndex != v9 && (!v9 || !-[NSNumber isEqual:](cycleIndex, "isEqual:"))) {
        goto LABEL_18;
      }
      cycleIntervalDays = self->_cycleIntervalDays;
      v11 = v5->_cycleIntervalDays;
      if (cycleIntervalDays != v11 && (!v11 || !-[NSNumber isEqual:](cycleIntervalDays, "isEqual:"))) {
        goto LABEL_18;
      }
      dose = self->_dose;
      id v13 = v5->_dose;
      if (dose == v13)
      {
        char v14 = 1;
        goto LABEL_19;
      }
      if (v13) {
        char v14 = -[NSNumber isEqual:](dose, "isEqual:");
      }
      else {
LABEL_18:
      }
        char v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    char v14 = 0;
  }
LABEL_20:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_daysOfWeek ^ [(NSDateComponents *)self->_startTimeComponent hash];
  uint64_t v4 = [(NSNumber *)self->_cycleIndex hash];
  uint64_t v5 = v3 ^ v4 ^ [(NSNumber *)self->_cycleIntervalDays hash];
  return v5 ^ [(NSNumber *)self->_dose hash];
}

- (id)description
{
  unint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%02d:%02d:%02d", -[NSDateComponents hour](self->_startTimeComponent, "hour"), -[NSDateComponents minute](self->_startTimeComponent, "minute"), -[NSDateComponents second](self->_startTimeComponent, "second"));
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = HKStringFromReminderWeekdayOptions(self->_daysOfWeek);
  v7 = [v4 stringWithFormat:@"<%@: %p>: startTime: %@ daysOfWeek: %@ cycleIndex: %@ cycleIntervalDays: %@ dose: %@", v5, self, v3, v6, self->_cycleIndex, self->_cycleIntervalDays, self->_dose];

  return v7;
}

@end