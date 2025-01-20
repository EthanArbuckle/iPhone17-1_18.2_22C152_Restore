@interface HKMedicationDoseEvent
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_metadataWithSyncIdentifier:(id)a3 syncVersion:(id)a4 isLastScheduledDose:(BOOL)a5;
+ (id)_newMedicationDoseEventWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 logOrigin:(int64_t)a8 scheduleItemIdentifier:(id)a9 medicationUUID:(id)a10 medicationIdentifier:(id)a11 scheduledDoseQuantity:(id)a12 doseQuantity:(id)a13 scheduledDate:(id)a14 status:(int64_t)a15 config:(id)a16;
+ (id)medicationDoseEventWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 medicationIdentifier:(id)a5 scheduledDoseQuantity:(id)a6 doseQuantity:(id)a7 scheduledDate:(id)a8 startDate:(id)a9 status:(int64_t)a10 metadata:(id)a11;
+ (id)medicationDoseEventWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 logOrigin:(int64_t)a8 scheduleItemIdentifier:(id)a9 medicationIdentifier:(id)a10 scheduledDoseQuantity:(double)a11 doseQuantity:(double)a12 scheduledDate:(id)a13 status:(int64_t)a14 medicationUuid:(id)a15;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)isLastScheduledDose;
- (HKMedicationDoseEvent)init;
- (HKMedicationDoseEvent)initWithCoder:(id)a3;
- (NSDate)scheduledDate;
- (NSNumber)doseQuantity;
- (NSNumber)scheduledDoseQuantity;
- (NSString)medicationIdentifier;
- (NSString)scheduleItemIdentifier;
- (NSUUID)medicationUUID;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (int64_t)logOrigin;
- (int64_t)status;
- (void)_setDoseQuantity:(id)a3;
- (void)_setLogOrigin:(int64_t)a3;
- (void)_setMedicationIdentifier:(id)a3;
- (void)_setMedicationUUID:(id)a3;
- (void)_setScheduleItemIdentifier:(id)a3;
- (void)_setScheduledDate:(id)a3;
- (void)_setScheduledDoseQuantity:(id)a3;
- (void)_setStatus:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationDoseEvent

+ (id)medicationDoseEventWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 medicationIdentifier:(id)a5 scheduledDoseQuantity:(id)a6 doseQuantity:(id)a7 scheduledDate:(id)a8 startDate:(id)a9 status:(int64_t)a10 metadata:(id)a11
{
  id v17 = a11;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = +[HKMedicationDoseEventType medicationDoseEventType];
  v25 = (void *)[a1 _newMedicationDoseEventWithType:v24 startDate:v18 endDate:v18 device:0 metadata:v17 logOrigin:a3 scheduleItemIdentifier:v23 medicationUUID:0 medicationIdentifier:v22 scheduledDoseQuantity:v21 doseQuantity:v20 scheduledDate:v19 status:a10 config:0];

  return v25;
}

+ (id)_newMedicationDoseEventWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 logOrigin:(int64_t)a8 scheduleItemIdentifier:(id)a9 medicationUUID:(id)a10 medicationIdentifier:(id)a11 scheduledDoseQuantity:(id)a12 doseQuantity:(id)a13 scheduledDate:(id)a14 status:(int64_t)a15 config:(id)a16
{
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __223__HKMedicationDoseEvent__newMedicationDoseEventWithType_startDate_endDate_device_metadata_logOrigin_scheduleItemIdentifier_medicationUUID_medicationIdentifier_scheduledDoseQuantity_doseQuantity_scheduledDate_status_config___block_invoke;
  aBlock[3] = &unk_1E58C5CE0;
  id v47 = v19;
  id v48 = v18;
  id v49 = v20;
  id v50 = v21;
  id v51 = v22;
  id v52 = v23;
  int64_t v54 = a8;
  int64_t v55 = a15;
  id v53 = v24;
  id v44 = v24;
  id v43 = v23;
  id v42 = v22;
  id v41 = v21;
  id v25 = v20;
  id v26 = v18;
  id v27 = v19;
  id v28 = a7;
  id v29 = a6;
  id v30 = a5;
  id v31 = a4;
  id v32 = a3;
  v33 = _Block_copy(aBlock);
  v45.receiver = a1;
  v45.super_class = (Class)&OBJC_METACLASS___HKMedicationDoseEvent;
  id v34 = objc_msgSendSuper2(&v45, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v32, v31, v30, v29, v28, v33);

  return v34;
}

uint64_t __223__HKMedicationDoseEvent__newMedicationDoseEventWithType_startDate_endDate_device_metadata_logOrigin_scheduleItemIdentifier_medicationUUID_medicationIdentifier_scheduledDoseQuantity_doseQuantity_scheduledDate_status_config___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  *((void *)v14 + 12) = *(void *)(a1 + 88);
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)*((void *)v14 + 14);
  *((void *)v14 + 14) = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)*((void *)v14 + 13);
  *((void *)v14 + 13) = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)*((void *)v14 + 15);
  *((void *)v14 + 15) = v7;

  objc_storeStrong((id *)v14 + 16, *(id *)(a1 + 56));
  objc_storeStrong((id *)v14 + 17, *(id *)(a1 + 64));
  uint64_t v9 = [*(id *)(a1 + 72) copy];
  v10 = (void *)*((void *)v14 + 18);
  *((void *)v14 + 18) = v9;

  id v11 = v14;
  *((void *)v14 + 19) = *(void *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 80);
  if (v12)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t, id))(v12 + 16))(v12, v14);
    id v11 = v14;
  }

  return MEMORY[0x1F41817F8](v12, v11);
}

- (HKMedicationDoseEvent)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  id v11 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationDoseEvent;
  uint64_t v5 = [(HKSample *)&v12 description];
  int64_t logOrigin = self->_logOrigin;
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  uint64_t v7 = [(NSUUID *)self->_medicationUUID UUIDString];
  v8 = [v11 stringWithFormat:@"<%@:%p super=%@, int64_t logOrigin = %ld, scheduleItemIdentifier = %@, medicationUUID = %@, medicationIdentifier = %@, scheduledDoseQuantity = %@, doseQuantity = %@, scheduledDate = %@, status = %ld, isLastScheduledDose = %d>", v4, self, v5, logOrigin, scheduleItemIdentifier, v7, self->_medicationIdentifier, self->_scheduledDoseQuantity, self->_doseQuantity, self->_scheduledDate, self->_status, -[HKMedicationDoseEvent isLastScheduledDose](self, "isLastScheduledDose"), 0];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationDoseEvent;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_logOrigin, @"LogOrigin", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_scheduleItemIdentifier forKey:@"ScheduleItemIdentifier"];
  [v4 encodeObject:self->_medicationUUID forKey:@"MedicationUUID"];
  [v4 encodeObject:self->_medicationIdentifier forKey:@"MedicationIdentifier"];
  [v4 encodeObject:self->_scheduledDoseQuantity forKey:@"ScheduledDoseQuantity"];
  [v4 encodeObject:self->_doseQuantity forKey:@"DoseQuantity"];
  [v4 encodeObject:self->_scheduledDate forKey:@"ScheduledDate"];
  [v4 encodeInteger:self->_status forKey:@"Status"];
}

- (HKMedicationDoseEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationDoseEvent;
  objc_super v5 = [(HKSample *)&v19 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t logOrigin = [v4 decodeIntegerForKey:@"LogOrigin"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduleItemIdentifier"];
    scheduleItemIdentifier = v5->_scheduleItemIdentifier;
    v5->_scheduleItemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationUUID"];
    medicationUUID = v5->_medicationUUID;
    v5->_medicationUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationIdentifier"];
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduledDoseQuantity"];
    scheduledDoseQuantity = v5->_scheduledDoseQuantity;
    v5->_scheduledDoseQuantity = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DoseQuantity"];
    doseQuantity = v5->_doseQuantity;
    v5->_doseQuantity = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduledDate"];
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v16;

    v5->_status = [v4 decodeIntegerForKey:@"Status"];
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
    id v5 = v4;
    v43.receiver = self;
    v43.super_class = (Class)HKMedicationDoseEvent;
    if (![(HKSample *)&v43 isEquivalent:v5]) {
      goto LABEL_30;
    }
    int64_t v6 = [(HKMedicationDoseEvent *)self logOrigin];
    if (v6 != [v5 logOrigin]) {
      goto LABEL_30;
    }
    uint64_t v7 = [(HKMedicationDoseEvent *)self scheduleItemIdentifier];
    uint64_t v8 = [v5 scheduleItemIdentifier];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [v5 scheduleItemIdentifier];
      if (!v10) {
        goto LABEL_29;
      }
      id v11 = (void *)v10;
      uint64_t v12 = [(HKMedicationDoseEvent *)self scheduleItemIdentifier];
      v13 = [v5 scheduleItemIdentifier];
      int v14 = [v12 isEqualToString:v13];

      if (!v14) {
        goto LABEL_30;
      }
    }
    uint64_t v7 = [(HKMedicationDoseEvent *)self medicationIdentifier];
    uint64_t v16 = [v5 medicationIdentifier];
    if (v7 == (void *)v16)
    {
    }
    else
    {
      uint64_t v9 = (void *)v16;
      uint64_t v17 = [v5 medicationIdentifier];
      if (!v17) {
        goto LABEL_29;
      }
      id v18 = (void *)v17;
      objc_super v19 = [(HKMedicationDoseEvent *)self medicationIdentifier];
      id v20 = [v5 medicationIdentifier];
      int v21 = [v19 isEqualToString:v20];

      if (!v21) {
        goto LABEL_30;
      }
    }
    uint64_t v7 = [(HKMedicationDoseEvent *)self scheduledDoseQuantity];
    uint64_t v22 = [v5 scheduledDoseQuantity];
    if (v7 == (void *)v22)
    {
    }
    else
    {
      uint64_t v9 = (void *)v22;
      uint64_t v23 = [v5 scheduledDoseQuantity];
      if (!v23) {
        goto LABEL_29;
      }
      id v24 = (void *)v23;
      id v25 = [(HKMedicationDoseEvent *)self scheduledDoseQuantity];
      id v26 = [v5 scheduledDoseQuantity];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_30;
      }
    }
    uint64_t v7 = [(HKMedicationDoseEvent *)self doseQuantity];
    uint64_t v28 = [v5 doseQuantity];
    if (v7 == (void *)v28)
    {
    }
    else
    {
      uint64_t v9 = (void *)v28;
      uint64_t v29 = [v5 doseQuantity];
      if (!v29) {
        goto LABEL_29;
      }
      id v30 = (void *)v29;
      id v31 = [(HKMedicationDoseEvent *)self doseQuantity];
      id v32 = [v5 doseQuantity];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_30;
      }
    }
    uint64_t v7 = [(HKMedicationDoseEvent *)self scheduledDate];
    uint64_t v34 = [v5 scheduledDate];
    if (v7 == (void *)v34)
    {

LABEL_34:
      int64_t v41 = [(HKMedicationDoseEvent *)self status];
      if (v41 == [v5 status])
      {
        BOOL v42 = [(HKMedicationDoseEvent *)self isLastScheduledDose];
        int v15 = v42 ^ [v5 isLastScheduledDose] ^ 1;
        goto LABEL_31;
      }
LABEL_30:
      LOBYTE(v15) = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v9 = (void *)v34;
    uint64_t v35 = [v5 scheduledDate];
    if (v35)
    {
      v36 = (void *)v35;
      v37 = [(HKMedicationDoseEvent *)self scheduledDate];
      v38 = [v5 scheduledDate];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_30;
      }
      goto LABEL_34;
    }
LABEL_29:

    goto LABEL_30;
  }
  LOBYTE(v15) = 0;
LABEL_32:

  return v15;
}

- (int64_t)logOrigin
{
  return self->_logOrigin;
}

- (void)_setLogOrigin:(int64_t)a3
{
  self->_int64_t logOrigin = a3;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (void)_setScheduleItemIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  self->_scheduleItemIdentifier = v4;

  MEMORY[0x1F41817F8](v4, scheduleItemIdentifier);
}

- (void)_setMedicationUUID:(id)a3
{
  id v4 = (NSUUID *)[a3 copy];
  medicationUUID = self->_medicationUUID;
  self->_medicationUUID = v4;

  MEMORY[0x1F41817F8](v4, medicationUUID);
}

- (NSUUID)medicationUUID
{
  return self->_medicationUUID;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (void)_setMedicationIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  medicationIdentifier = self->_medicationIdentifier;
  self->_medicationIdentifier = v4;

  MEMORY[0x1F41817F8](v4, medicationIdentifier);
}

- (NSNumber)scheduledDoseQuantity
{
  return self->_scheduledDoseQuantity;
}

- (void)_setScheduledDoseQuantity:(id)a3
{
}

- (NSNumber)doseQuantity
{
  return self->_doseQuantity;
}

- (void)_setDoseQuantity:(id)a3
{
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)_setScheduledDate:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  scheduledDate = self->_scheduledDate;
  self->_scheduledDate = v4;

  MEMORY[0x1F41817F8](v4, scheduledDate);
}

- (int64_t)status
{
  return self->_status;
}

- (void)_setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isLastScheduledDose
{
  v2 = [(HKObject *)self metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"_HKPrivateMetadataKeyIsLastScheduledDose"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationDoseEvent;
  id v5 = -[HKSample _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  int64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  if (!self->_medicationIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: medicationIdentifier must not be nil"", self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

+ (id)_metadataWithSyncIdentifier:(id)a3 syncVersion:(id)a4 isLastScheduledDose:(BOOL)a5
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v15[0] = @"HKMetadataKeySyncIdentifier";
    v15[1] = @"HKMetadataKeySyncVersion";
    v16[0] = a3;
    v16[1] = a4;
    v15[2] = @"_HKPrivateMetadataKeyIsLastScheduledDose";
    int64_t v6 = NSNumber;
    id v7 = a4;
    id v8 = a3;
    id v9 = [v6 numberWithBool:1];
    v16[2] = v9;
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  }
  else
  {
    v13[0] = @"HKMetadataKeySyncIdentifier";
    v13[1] = @"HKMetadataKeySyncVersion";
    v14[0] = a3;
    v14[1] = a4;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = a4;
    id v9 = a3;
    objc_super v10 = [v11 dictionaryWithObjects:v14 forKeys:v13 count:2];
  }

  return v10;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_doseQuantity, 0);
  objc_storeStrong((id *)&self->_scheduledDoseQuantity, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_medicationUUID, 0);

  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
}

+ (id)medicationDoseEventWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 logOrigin:(int64_t)a8 scheduleItemIdentifier:(id)a9 medicationIdentifier:(id)a10 scheduledDoseQuantity:(double)a11 doseQuantity:(double)a12 scheduledDate:(id)a13 status:(int64_t)a14 medicationUuid:(id)a15
{
  id v20 = NSNumber;
  id v34 = a15;
  id v21 = a13;
  id v31 = a10;
  id v28 = a9;
  id v29 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  int v33 = [v20 numberWithDouble:a11];
  id v26 = [NSNumber numberWithDouble:a12];
  v37 = (void *)[a1 _newMedicationDoseEventWithType:v25 startDate:v24 endDate:v23 device:v22 metadata:v29 logOrigin:a8 scheduleItemIdentifier:v28 medicationUUID:v34 medicationIdentifier:v31 scheduledDoseQuantity:v33 doseQuantity:v26 scheduledDate:v21 status:a14 config:0];

  return v37;
}

@end