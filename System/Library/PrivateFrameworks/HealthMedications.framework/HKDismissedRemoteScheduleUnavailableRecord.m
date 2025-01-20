@interface HKDismissedRemoteScheduleUnavailableRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKDismissedRemoteScheduleUnavailableRecord)init;
- (HKDismissedRemoteScheduleUnavailableRecord)initWithCoder:(id)a3;
- (NSArray)deviceIdentifiers;
- (NSDate)creationDate;
- (NSString)medicationIdentifier;
- (id)_initWithMedicationIdentifier:(id)a3 scheduleType:(int64_t)a4 scheduleCompatibilityVersion:(int64_t)a5 deviceIdentifiers:(id)a6 creationDate:(id)a7;
- (id)description;
- (id)deviceIdentifiersDatabaseString;
- (id)deviceIdentifiersDescriptionString;
- (int64_t)scheduleCompatibilityVersion;
- (int64_t)scheduleType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDismissedRemoteScheduleUnavailableRecord

- (HKDismissedRemoteScheduleUnavailableRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithMedicationIdentifier:(id)a3 scheduleType:(int64_t)a4 scheduleCompatibilityVersion:(int64_t)a5 deviceIdentifiers:(id)a6 creationDate:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (!v12)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HKDismissedRemoteScheduleUnavailableRecord.m", 37, @"Invalid parameter not satisfying: %@", @"medicationIdentifier != nil" object file lineNumber description];
  }
  v15 = HKAllMedicationScheduleTypes();
  v16 = [v15 firstObject];
  int64_t v17 = [v16 integerValue];

  v18 = HKAllMedicationScheduleTypes();
  v19 = [v18 lastObject];
  int64_t v20 = [v19 integerValue];

  if (v17 > a4)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HKDismissedRemoteScheduleUnavailableRecord.m", 40, @"Invalid parameter not satisfying: %@", @"scheduleType >= lowerScheduleTypeBound" object file lineNumber description];
  }
  if (v20 < a4)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HKDismissedRemoteScheduleUnavailableRecord.m", 41, @"Invalid parameter not satisfying: %@", @"scheduleType <= upperScheduleTypeBound" object file lineNumber description];
  }
  if (a5 > -2)
  {
    if (v13) {
      goto LABEL_9;
    }
LABEL_14:
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"HKDismissedRemoteScheduleUnavailableRecord.m", 43, @"Invalid parameter not satisfying: %@", @"deviceIdentifiers != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"HKDismissedRemoteScheduleUnavailableRecord.m", 42, @"Invalid parameter not satisfying: %@", @"scheduleCompatibilityVersion >= HKMedicationScheduleCompatibilityUnsupported" object file lineNumber description];

  if (!v13) {
    goto LABEL_14;
  }
LABEL_9:
  if (v14) {
    goto LABEL_10;
  }
LABEL_15:
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"HKDismissedRemoteScheduleUnavailableRecord.m", 44, @"Invalid parameter not satisfying: %@", @"creationDate != nil" object file lineNumber description];

LABEL_10:
  v36.receiver = self;
  v36.super_class = (Class)HKDismissedRemoteScheduleUnavailableRecord;
  v21 = [(HKDismissedRemoteScheduleUnavailableRecord *)&v36 init];
  if (v21)
  {
    uint64_t v22 = [v12 copy];
    medicationIdentifier = v21->_medicationIdentifier;
    v21->_medicationIdentifier = (NSString *)v22;

    v21->_scheduleType = a4;
    v21->_scheduleCompatibilityVersion = a5;
    uint64_t v24 = [v13 copy];
    deviceIdentifiers = v21->_deviceIdentifiers;
    v21->_deviceIdentifiers = (NSArray *)v24;

    uint64_t v26 = [v14 copy];
    creationDate = v21->_creationDate;
    v21->_creationDate = (NSDate *)v26;
  }
  return v21;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  medicationIdentifier = self->_medicationIdentifier;
  v6 = HKStringFromMedicationScheduleType(self->_scheduleType);
  v7 = [v3 stringWithFormat:@"<%@:%p (Medication: %ld, Schedule Type: %@, Schedule Compatibility Version: v%ld, Creation Date: %@, Devices: %@)>", v4, self, medicationIdentifier, v6, self->_scheduleCompatibilityVersion, self->_creationDate, self->_deviceIdentifiers];

  return v7;
}

- (id)deviceIdentifiersDatabaseString
{
  v2 = [(NSArray *)self->_deviceIdentifiers hk_map:&__block_literal_global_3];
  v3 = [v2 componentsJoinedByString:@"|$|"];

  return v3;
}

uint64_t __77__HKDismissedRemoteScheduleUnavailableRecord_deviceIdentifiersDatabaseString__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)deviceIdentifiersDescriptionString
{
  v2 = [(NSArray *)self->_deviceIdentifiers hk_map:&__block_literal_global_314];
  v3 = [v2 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
  uint64_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

uint64_t __80__HKDismissedRemoteScheduleUnavailableRecord_deviceIdentifiersDescriptionString__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_scheduleType ^ [(NSString *)self->_medicationIdentifier hash] ^ (self->_scheduleCompatibilityVersion << 16);
  uint64_t v4 = [(NSArray *)self->_deviceIdentifiers hash];
  return v3 ^ v4 ^ [(NSDate *)self->_creationDate hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKDismissedRemoteScheduleUnavailableRecord *)a3;
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
      medicationIdentifier = self->_medicationIdentifier;
      v7 = v5->_medicationIdentifier;
      if (medicationIdentifier != v7 && (!v7 || !-[NSString isEqual:](medicationIdentifier, "isEqual:"))) {
        goto LABEL_16;
      }
      if (self->_scheduleType != v5->_scheduleType) {
        goto LABEL_16;
      }
      if (self->_scheduleCompatibilityVersion != v5->_scheduleCompatibilityVersion) {
        goto LABEL_16;
      }
      deviceIdentifiers = self->_deviceIdentifiers;
      v9 = v5->_deviceIdentifiers;
      if (deviceIdentifiers != v9 && (!v9 || !-[NSArray isEqualToArray:](deviceIdentifiers, "isEqualToArray:"))) {
        goto LABEL_16;
      }
      creationDate = self->_creationDate;
      v11 = v5->_creationDate;
      if (creationDate == v11)
      {
        char v12 = 1;
        goto LABEL_17;
      }
      if (v11) {
        char v12 = -[NSDate isEqualToDate:](creationDate, "isEqualToDate:");
      }
      else {
LABEL_16:
      }
        char v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  medicationIdentifier = self->_medicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:medicationIdentifier forKey:@"MedicationIdentifier"];
  [v5 encodeInteger:self->_scheduleType forKey:@"ScheduleType"];
  [v5 encodeInteger:self->_scheduleCompatibilityVersion forKey:@"ScheduleCompatibilityVersion"];
  [v5 encodeObject:self->_deviceIdentifiers forKey:@"DeviceIdentifiers"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
}

- (HKDismissedRemoteScheduleUnavailableRecord)initWithCoder:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDismissedRemoteScheduleUnavailableRecord;
  v6 = [(HKDismissedRemoteScheduleUnavailableRecord *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationIdentifier"];
    medicationIdentifier = v6->_medicationIdentifier;
    v6->_medicationIdentifier = (NSString *)v7;

    v6->_scheduleType = [v5 decodeIntegerForKey:@"ScheduleType"];
    v6->_scheduleCompatibilityVersion = [v5 decodeIntegerForKey:@"ScheduleCompatibilityVersion"];
    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v10 = [v5 decodeObjectOfClasses:v9 forKey:@"DeviceIdentifiers"];
    deviceIdentifiers = v6->_deviceIdentifiers;
    v6->_deviceIdentifiers = (NSArray *)v10;

    uint64_t v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v12;

    if (!v6->_medicationIdentifier)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:v6 file:@"HKDismissedRemoteScheduleUnavailableRecord.m" lineNumber:148 description:@"Medication identifier should not be nil"];
    }
    if (!v6->_deviceIdentifiers)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:v6 file:@"HKDismissedRemoteScheduleUnavailableRecord.m" lineNumber:149 description:@"Device identifiers should not be nil"];
    }
    if (!v6->_creationDate)
    {
      int64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:v6 file:@"HKDismissedRemoteScheduleUnavailableRecord.m" lineNumber:150 description:@"Creation date should not be nil"];
    }
  }

  return v6;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (int64_t)scheduleCompatibilityVersion
{
  return self->_scheduleCompatibilityVersion;
}

- (NSArray)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);

  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
}

@end