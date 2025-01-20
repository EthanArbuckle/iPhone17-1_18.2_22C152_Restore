@interface HKRemoteScheduleUnavailableRecord
+ (BOOL)supportsSecureCoding;
+ (id)_createDevicesByIdentifier:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (HKMedicationSchedule)schedule;
- (HKMedicationUserDomainConcept)medication;
- (HKRemoteScheduleUnavailableRecord)init;
- (HKRemoteScheduleUnavailableRecord)initWithCoder:(id)a3;
- (HKRemoteScheduleUnavailableRecord)initWithMedication:(id)a3 schedule:(id)a4 devices:(id)a5;
- (NSArray)devices;
- (id)description;
- (id)deviceForIdentifier:(id)a3;
- (id)dismissedRecord;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDevices:(id)a3;
- (void)setMedication:(id)a3;
- (void)setSchedule:(id)a3;
@end

@implementation HKRemoteScheduleUnavailableRecord

- (HKRemoteScheduleUnavailableRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKRemoteScheduleUnavailableRecord)initWithMedication:(id)a3 schedule:(id)a4 devices:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKRemoteScheduleUnavailableRecord.m", 40, @"Invalid parameter not satisfying: %@", @"schedule != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HKRemoteScheduleUnavailableRecord.m", 39, @"Invalid parameter not satisfying: %@", @"medication != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HKRemoteScheduleUnavailableRecord.m", 41, @"Invalid parameter not satisfying: %@", @"devices != nil" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)HKRemoteScheduleUnavailableRecord;
  v13 = [(HKRemoteScheduleUnavailableRecord *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_medication, a3);
    objc_storeStrong((id *)&v14->_schedule, a4);
    objc_storeStrong((id *)&v14->_devices, a5);
    uint64_t v15 = +[HKRemoteScheduleUnavailableRecord _createDevicesByIdentifier:]((uint64_t)HKRemoteScheduleUnavailableRecord, v12);
    devicesByIdentifier = v14->_devicesByIdentifier;
    v14->_devicesByIdentifier = (NSDictionary *)v15;
  }
  return v14;
}

+ (id)_createDevicesByIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_msgSend(v2, "hk_mapToDictionary:", &__block_literal_global_306);

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKMedicationUserDomainConcept *)self->_medication firstConceptIdentifier];
  uint64_t v6 = [v5 rawIdentifier];
  v7 = HKStringFromMedicationScheduleType([(HKMedicationSchedule *)self->_schedule scheduleType]);
  v8 = [v3 stringWithFormat:@"<%@:%p (Concept ID: %ld, Schedule Type: %@, Schedule Compatibility Version: v%ld, Devices: %@)>", v4, self, v6, v7, -[HKMedicationSchedule compatibilityRange](self->_schedule, "compatibilityRange"), self->_devices];

  return v8;
}

- (id)dismissedRecord
{
  v3 = [(NSArray *)self->_devices hk_map:&__block_literal_global_5];
  uint64_t v4 = [HKDismissedRemoteScheduleUnavailableRecord alloc];
  v5 = [(HKMedicationUserDomainConcept *)self->_medication semanticIdentifier];
  uint64_t v6 = [v5 stringValue];
  int64_t v7 = [(HKMedicationSchedule *)self->_schedule scheduleType];
  uint64_t v8 = [(HKMedicationSchedule *)self->_schedule compatibilityRange];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [(HKDismissedRemoteScheduleUnavailableRecord *)v4 _initWithMedicationIdentifier:v6 scheduleType:v7 scheduleCompatibilityVersion:v8 deviceIdentifiers:v3 creationDate:v9];

  return v10;
}

uint64_t __52__HKRemoteScheduleUnavailableRecord_dismissedRecord__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hardwareIdentifier];
}

- (id)deviceForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_devicesByIdentifier objectForKeyedSubscript:a3];
}

void __64__HKRemoteScheduleUnavailableRecord__createDevicesByIdentifier___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  v5 = a3;
  id v6 = a2;
  id v7 = [v6 hardwareIdentifier];
  ((void (**)(void, id, id))a3)[2](v5, v7, v6);
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKMedicationUserDomainConcept *)self->_medication hash];
  unint64_t v4 = [(HKMedicationSchedule *)self->_schedule hash] ^ v3;
  return v4 ^ [(NSArray *)self->_devices hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKRemoteScheduleUnavailableRecord *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      medication = self->_medication;
      id v7 = v5->_medication;
      if (medication != v7 && (!v7 || !-[HKMedicationUserDomainConcept isEqual:](medication, "isEqual:"))) {
        goto LABEL_14;
      }
      schedule = self->_schedule;
      v9 = v5->_schedule;
      if (schedule != v9 && (!v9 || !-[HKMedicationSchedule isEqual:](schedule, "isEqual:"))) {
        goto LABEL_14;
      }
      devices = self->_devices;
      id v11 = v5->_devices;
      if (devices == v11)
      {
        char v12 = 1;
        goto LABEL_15;
      }
      if (v11) {
        char v12 = -[NSArray isEqualToArray:](devices, "isEqualToArray:");
      }
      else {
LABEL_14:
      }
        char v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    char v12 = 0;
  }
LABEL_16:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  medication = self->_medication;
  id v5 = a3;
  [v5 encodeObject:medication forKey:@"Medication"];
  [v5 encodeObject:self->_schedule forKey:@"Schedule"];
  [v5 encodeObject:self->_devices forKey:@"Devices"];
}

- (HKRemoteScheduleUnavailableRecord)initWithCoder:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKRemoteScheduleUnavailableRecord;
  id v6 = [(HKRemoteScheduleUnavailableRecord *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Medication"];
    medication = v6->_medication;
    v6->_medication = (HKMedicationUserDomainConcept *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Schedule"];
    schedule = v6->_schedule;
    v6->_schedule = (HKMedicationSchedule *)v9;

    uint64_t v11 = [v5 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"Devices"];
    devices = v6->_devices;
    v6->_devices = (NSArray *)v11;

    if (!v6->_medication)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:v6 file:@"HKRemoteScheduleUnavailableRecord.m" lineNumber:137 description:@"Medication should not be nil"];
    }
    if (!v6->_schedule)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:v6 file:@"HKRemoteScheduleUnavailableRecord.m" lineNumber:138 description:@"Schedule should not be nil"];
    }
    if (!v6->_devices)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:v6 file:@"HKRemoteScheduleUnavailableRecord.m" lineNumber:139 description:@"Devices should not be nil"];
    }
  }

  return v6;
}

- (HKMedicationUserDomainConcept)medication
{
  return self->_medication;
}

- (void)setMedication:(id)a3
{
}

- (HKMedicationSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_medication, 0);

  objc_storeStrong((id *)&self->_devicesByIdentifier, 0);
}

@end