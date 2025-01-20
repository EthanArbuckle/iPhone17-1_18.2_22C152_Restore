@interface HKMedicationsAccountDevicesInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationsAccountDevicesInfo)initWithCoder:(id)a3;
- (HKMedicationsAccountDevicesInfo)initWithMedicationFeatureDevicesInfo:(id)a3 localDeviceInfo:(id)a4;
- (HKMedicationsDeviceInfo)localDeviceInfo;
- (NSArray)medicationFeatureDevicesInfo;
- (id)_unitTest_newAccountInfoWithAddedDevice:(id)a3;
- (id)deviceIdentifiers;
- (id)remoteDeviceIdentifiers;
- (id)remoteDevices;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationsAccountDevicesInfo

- (HKMedicationsAccountDevicesInfo)initWithMedicationFeatureDevicesInfo:(id)a3 localDeviceInfo:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKMedicationsAccountDevicesInfo.m", 22, @"Invalid parameter not satisfying: %@", @"medicationFeatureDevicesInfo != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HKMedicationsAccountDevicesInfo.m", 23, @"Invalid parameter not satisfying: %@", @"localDeviceInfo != nil" object file lineNumber description];

LABEL_3:
  if (([v10 isLocalDevice] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKMedicationsAccountDevicesInfo.m", 24, @"Invalid parameter not satisfying: %@", @"localDeviceInfo.isLocalDevice == YES" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationsAccountDevicesInfo;
  v11 = [(HKMedicationsAccountDevicesInfo *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_medicationFeatureDevicesInfo, a3);
    objc_storeStrong((id *)&v12->_localDeviceInfo, a4);
  }

  return v12;
}

- (id)deviceIdentifiers
{
  return (id)[(NSArray *)self->_medicationFeatureDevicesInfo hk_map:&__block_literal_global_6];
}

uint64_t __52__HKMedicationsAccountDevicesInfo_deviceIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hardwareIdentifier];
}

- (id)remoteDevices
{
  v3 = (void *)[(NSArray *)self->_medicationFeatureDevicesInfo mutableCopy];
  [v3 removeObjectIdenticalTo:self->_localDeviceInfo];

  return v3;
}

- (id)remoteDeviceIdentifiers
{
  v3 = (void *)[(NSArray *)self->_medicationFeatureDevicesInfo mutableCopy];
  [v3 removeObjectIdenticalTo:self->_localDeviceInfo];
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_294);

  return v4;
}

uint64_t __58__HKMedicationsAccountDevicesInfo_remoteDeviceIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hardwareIdentifier];
}

- (id)_unitTest_newAccountInfoWithAddedDevice:(id)a3
{
  medicationFeatureDevicesInfo = self->_medicationFeatureDevicesInfo;
  id v5 = a3;
  v6 = (void *)[(NSArray *)medicationFeatureDevicesInfo mutableCopy];
  v7 = [v6 arrayByAddingObject:v5];

  id v8 = [[HKMedicationsAccountDevicesInfo alloc] initWithMedicationFeatureDevicesInfo:v7 localDeviceInfo:self->_localDeviceInfo];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMedicationsAccountDevicesInfo *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      localDeviceInfo = self->_localDeviceInfo;
      v7 = v5->_localDeviceInfo;
      if (localDeviceInfo != v7 && (!v7 || !-[HKMedicationsDeviceInfo isEqual:](localDeviceInfo, "isEqual:"))) {
        goto LABEL_11;
      }
      medicationFeatureDevicesInfo = self->_medicationFeatureDevicesInfo;
      id v9 = v5->_medicationFeatureDevicesInfo;
      if (medicationFeatureDevicesInfo == v9)
      {
        char v10 = 1;
        goto LABEL_13;
      }
      if (v9) {
        char v10 = -[NSArray isEqualToArray:](medicationFeatureDevicesInfo, "isEqualToArray:");
      }
      else {
LABEL_11:
      }
        char v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMedicationsDeviceInfo *)self->_localDeviceInfo hash];
  return [(NSArray *)self->_medicationFeatureDevicesInfo hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  medicationFeatureDevicesInfo = self->_medicationFeatureDevicesInfo;
  id v5 = a3;
  [v5 encodeObject:medicationFeatureDevicesInfo forKey:@"MedicationFeatureDevices"];
  [v5 encodeObject:self->_localDeviceInfo forKey:@"LocalDevice"];
}

- (HKMedicationsAccountDevicesInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationsAccountDevicesInfo;
  id v5 = [(HKMedicationsAccountDevicesInfo *)&v12 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"MedicationFeatureDevices"];
    medicationFeatureDevicesInfo = v5->_medicationFeatureDevicesInfo;
    v5->_medicationFeatureDevicesInfo = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalDevice"];
    localDeviceInfo = v5->_localDeviceInfo;
    v5->_localDeviceInfo = (HKMedicationsDeviceInfo *)v9;
  }
  return v5;
}

- (NSArray)medicationFeatureDevicesInfo
{
  return self->_medicationFeatureDevicesInfo;
}

- (HKMedicationsDeviceInfo)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);

  objc_storeStrong((id *)&self->_medicationFeatureDevicesInfo, 0);
}

@end