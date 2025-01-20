@interface HKMedicationExposableDoseEvent
+ (BOOL)supportsSecureCoding;
+ (id)asNeededExposableDoseEventForMedication:(id)a3 doseQuantity:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKMedicationExposableDoseEvent)initWithCoder:(id)a3;
- (HKMedicationExposableDoseEvent)initWithDoseEvent:(id)a3;
- (HKMedicationIdentifier)medicationIdentifier;
- (NSDate)scheduledDate;
- (NSDate)startDate;
- (NSNumber)doseQuantity;
- (NSNumber)scheduledDoseQuantity;
- (NSString)scheduleItemIdentifier;
- (NSString)semanticIdentifier;
- (NSUUID)persistedUUID;
- (id)_initWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 semanticIdentifier:(id)a5 medicationIdentifier:(id)a6 scheduledDoseQuantity:(id)a7 doseQuantity:(id)a8 scheduledDate:(id)a9 startDate:(id)a10 status:(int64_t)a11 persistedUUID:(id)a12;
- (id)_updateForNewStatus:(void *)a3 doseQuantity:(void *)a4 startDate:(void *)a5 semanticIdentifier:;
- (id)updateForNewDoseQuantity:(id)a3;
- (id)updateForNewStartDate:(id)a3;
- (id)updateForNewStatus:(int64_t)a3;
- (id)updateForSemanticIdentifier:(id)a3;
- (int64_t)logOrigin;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationExposableDoseEvent

+ (id)asNeededExposableDoseEventForMedication:(id)a3 doseQuantity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [HKMedicationExposableDoseEvent alloc];
  v8 = [v6 medication];

  v9 = [v8 identifier];
  v10 = [MEMORY[0x1E4F1C9C8] now];
  id v11 = [(HKMedicationExposableDoseEvent *)v7 _initWithLogOrigin:1 scheduleItemIdentifier:0 semanticIdentifier:0 medicationIdentifier:v9 scheduledDoseQuantity:0 doseQuantity:v5 scheduledDate:0 startDate:v10 status:2 persistedUUID:0];

  return v11;
}

- (HKMedicationExposableDoseEvent)initWithDoseEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKMedicationExposableDoseEvent.m", 37, @"Invalid parameter not satisfying: %@", @"doseEvent" object file lineNumber description];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F2B200]);
  v7 = [v5 medicationIdentifier];
  v20 = (void *)[v6 initWithSemanticIdentifierString:v7];

  uint64_t v19 = [v5 logOrigin];
  v8 = [v5 scheduleItemIdentifier];
  v9 = [v5 medicationIdentifier];
  v10 = [v5 scheduledDoseQuantity];
  id v11 = [v5 doseQuantity];
  v12 = [v5 scheduledDate];
  v13 = [v5 startDate];
  uint64_t v14 = [v5 status];
  v15 = [v5 UUID];
  v16 = [(HKMedicationExposableDoseEvent *)self _initWithLogOrigin:v19 scheduleItemIdentifier:v8 semanticIdentifier:v9 medicationIdentifier:v20 scheduledDoseQuantity:v10 doseQuantity:v11 scheduledDate:v12 startDate:v13 status:v14 persistedUUID:v15];

  return v16;
}

- (id)_initWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 semanticIdentifier:(id)a5 medicationIdentifier:(id)a6 scheduledDoseQuantity:(id)a7 doseQuantity:(id)a8 scheduledDate:(id)a9 startDate:(id)a10 status:(int64_t)a11 persistedUUID:(id)a12
{
  v18 = (NSNumber *)a7;
  v44.receiver = self;
  v44.super_class = (Class)HKMedicationExposableDoseEvent;
  id v43 = a12;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = [(HKMedicationExposableDoseEvent *)&v44 init];
  v25->_logOrigin = a3;
  uint64_t v26 = [v24 copy];

  scheduleItemIdentifier = v25->_scheduleItemIdentifier;
  v25->_scheduleItemIdentifier = (NSString *)v26;

  uint64_t v28 = [v23 copy];
  semanticIdentifier = v25->_semanticIdentifier;
  v25->_semanticIdentifier = (NSString *)v28;

  uint64_t v30 = [v22 copy];
  medicationIdentifier = v25->_medicationIdentifier;
  v25->_medicationIdentifier = (HKMedicationIdentifier *)v30;

  scheduledDoseQuantity = v25->_scheduledDoseQuantity;
  v25->_scheduledDoseQuantity = v18;
  v33 = v18;

  uint64_t v34 = [v21 copy];
  doseQuantity = v25->_doseQuantity;
  v25->_doseQuantity = (NSNumber *)v34;

  uint64_t v36 = [v20 copy];
  scheduledDate = v25->_scheduledDate;
  v25->_scheduledDate = (NSDate *)v36;

  uint64_t v38 = [v19 copy];
  startDate = v25->_startDate;
  v25->_startDate = (NSDate *)v38;

  v25->_status = a11;
  uint64_t v40 = [v43 copy];

  persistedUUID = v25->_persistedUUID;
  v25->_persistedUUID = (NSUUID *)v40;

  return v25;
}

- (id)updateForNewStatus:(int64_t)a3
{
  return -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, a3, 0, 0, 0);
}

- (id)_updateForNewStatus:(void *)a3 doseQuantity:(void *)a4 startDate:(void *)a5 semanticIdentifier:
{
  if (a1)
  {
    v10 = a3;
    if (!a3) {
      v10 = (void *)a1[5];
    }
    id v11 = a4;
    if (!a4) {
      id v11 = (void *)a1[7];
    }
    v12 = a5;
    if (!a5) {
      v12 = (void *)a1[10];
    }
    id v13 = v12;
    id v14 = v11;
    id v15 = v10;
    id v16 = a5;
    id v17 = a4;
    id v18 = a3;
    id v19 = [[HKMedicationExposableDoseEvent alloc] _initWithLogOrigin:a1[1] scheduleItemIdentifier:a1[2] semanticIdentifier:v13 medicationIdentifier:a1[3] scheduledDoseQuantity:a1[4] doseQuantity:v15 scheduledDate:a1[6] startDate:v14 status:a2 persistedUUID:a1[9]];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)updateForNewDoseQuantity:(id)a3
{
  id v4 = a3;
  id v5 = -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, [(HKMedicationExposableDoseEvent *)self status], v4, 0, 0);

  return v5;
}

- (id)updateForNewStartDate:(id)a3
{
  id v4 = a3;
  id v5 = -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, [(HKMedicationExposableDoseEvent *)self status], 0, v4, 0);

  return v5;
}

- (id)updateForSemanticIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, [(HKMedicationExposableDoseEvent *)self status], 0, 0, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicationExposableDoseEvent *)a3;
  if (self == v4)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      medicationIdentifier = v5->_medicationIdentifier;
      v7 = self->_medicationIdentifier;
      if (medicationIdentifier != v7
        && (!v7 || !-[HKMedicationIdentifier isEqual:](medicationIdentifier, "isEqual:")))
      {
        goto LABEL_32;
      }
      semanticIdentifier = v5->_semanticIdentifier;
      v9 = self->_semanticIdentifier;
      if (semanticIdentifier != v9 && (!v9 || !-[NSString isEqual:](semanticIdentifier, "isEqual:"))) {
        goto LABEL_32;
      }
      scheduledDoseQuantity = v5->_scheduledDoseQuantity;
      id v11 = self->_scheduledDoseQuantity;
      if (scheduledDoseQuantity != v11
        && (!v11 || !-[NSNumber isEqual:](scheduledDoseQuantity, "isEqual:")))
      {
        goto LABEL_32;
      }
      doseQuantity = v5->_doseQuantity;
      id v13 = self->_doseQuantity;
      if (doseQuantity != v13 && (!v13 || !-[NSNumber isEqual:](doseQuantity, "isEqual:"))) {
        goto LABEL_32;
      }
      scheduleItemIdentifier = v5->_scheduleItemIdentifier;
      id v15 = self->_scheduleItemIdentifier;
      if (scheduleItemIdentifier != v15
        && (!v15 || !-[NSString isEqual:](scheduleItemIdentifier, "isEqual:")))
      {
        goto LABEL_32;
      }
      if (((scheduledDate = v5->_scheduledDate, id v17 = self->_scheduledDate, scheduledDate == v17)
         || v17 && -[NSDate isEqual:](scheduledDate, "isEqual:"))
        && ((startDate = v5->_startDate, id v19 = self->_startDate, startDate == v19)
         || v19 && -[NSDate isEqual:](startDate, "isEqual:"))
        && v5->_status == self->_status
        && v5->_logOrigin == self->_logOrigin
        && ((persistedUUID = v5->_persistedUUID, id v21 = self->_persistedUUID, persistedUUID == v21)
         || v21 && -[NSUUID isEqual:](persistedUUID, "isEqual:")))
      {
        BOOL v22 = 1;
      }
      else
      {
LABEL_32:
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t logOrigin = self->_logOrigin;
  id v5 = a3;
  [v5 encodeInteger:logOrigin forKey:@"LogOrigin"];
  [v5 encodeObject:self->_scheduleItemIdentifier forKey:@"ScheduleItemIdentifier"];
  [v5 encodeObject:self->_semanticIdentifier forKey:@"SemanticIdentifier"];
  [v5 encodeObject:self->_medicationIdentifier forKey:@"MedicationIdentifier"];
  [v5 encodeObject:self->_scheduledDoseQuantity forKey:@"ScheduledDoseQuantity"];
  [v5 encodeObject:self->_doseQuantity forKey:@"DoseQuantity"];
  [v5 encodeObject:self->_scheduledDate forKey:@"ScheduledDate"];
  [v5 encodeObject:self->_startDate forKey:@"StartDate"];
  [v5 encodeInteger:self->_status forKey:@"Status"];
  [v5 encodeObject:self->_persistedUUID forKey:@"PersistedUUID"];
}

- (HKMedicationExposableDoseEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKMedicationExposableDoseEvent;
  id v5 = [(HKMedicationExposableDoseEvent *)&v23 init];
  if (v5)
  {
    v5->_int64_t logOrigin = [v4 decodeIntegerForKey:@"LogOrigin"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduleItemIdentifier"];
    scheduleItemIdentifier = v5->_scheduleItemIdentifier;
    v5->_scheduleItemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SemanticIdentifier"];
    semanticIdentifier = v5->_semanticIdentifier;
    v5->_semanticIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationIdentifier"];
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (HKMedicationIdentifier *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduledDoseQuantity"];
    scheduledDoseQuantity = v5->_scheduledDoseQuantity;
    v5->_scheduledDoseQuantity = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DoseQuantity"];
    doseQuantity = v5->_doseQuantity;
    v5->_doseQuantity = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduledDate"];
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v18;

    v5->_status = [v4 decodeIntegerForKey:@"Status"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersistedUUID"];
    persistedUUID = v5->_persistedUUID;
    v5->_persistedUUID = (NSUUID *)v20;
  }
  return v5;
}

- (int64_t)logOrigin
{
  return self->_logOrigin;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (HKMedicationIdentifier)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (NSNumber)scheduledDoseQuantity
{
  return self->_scheduledDoseQuantity;
}

- (NSNumber)doseQuantity
{
  return self->_doseQuantity;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)status
{
  return self->_status;
}

- (NSUUID)persistedUUID
{
  return self->_persistedUUID;
}

- (NSString)semanticIdentifier
{
  return self->_semanticIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticIdentifier, 0);
  objc_storeStrong((id *)&self->_persistedUUID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_doseQuantity, 0);
  objc_storeStrong((id *)&self->_scheduledDoseQuantity, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);

  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
}

@end