@interface _HKFitnessMachineSessionConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)machineBrand;
- (NSString)machineName;
- (NSUUID)connectionUUID;
- (NSUUID)machineUUID;
- (NSUUID)sessionUUID;
- (_HKFitnessMachineSessionConfiguration)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)machineType;
- (void)_setConnectionUUID:(id)a3;
- (void)_setMachineBrand:(id)a3;
- (void)_setMachineName:(id)a3;
- (void)_setMachineType:(unint64_t)a3;
- (void)_setMachineUUID:(id)a3;
- (void)_setSessionUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKFitnessMachineSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKFitnessMachineSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKFitnessMachineSessionConfiguration;
  v5 = [(_HKFitnessMachineSessionConfiguration *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionUUID"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionUUID"];
    connectionUUID = v5->_connectionUUID;
    v5->_connectionUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineUUID"];
    machineUUID = v5->_machineUUID;
    v5->_machineUUID = (NSUUID *)v10;

    v5->_machineType = [v4 decodeIntegerForKey:@"machineType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineName"];
    machineName = v5->_machineName;
    v5->_machineName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineBrand"];
    machineBrand = v5->_machineBrand;
    v5->_machineBrand = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionUUID = self->_sessionUUID;
  id v5 = a3;
  [v5 encodeObject:sessionUUID forKey:@"sessionUUID"];
  [v5 encodeObject:self->_connectionUUID forKey:@"connectionUUID"];
  [v5 encodeObject:self->_machineUUID forKey:@"machineUUID"];
  [v5 encodeInteger:self->_machineType forKey:@"machineType"];
  [v5 encodeObject:self->_machineName forKey:@"machineName"];
  [v5 encodeObject:self->_machineBrand forKey:@"machineBrand"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSUUID *)self->_sessionUUID UUIDString];
  v7 = [(NSUUID *)self->_connectionUUID UUIDString];
  uint64_t v8 = [(NSUUID *)self->_machineUUID UUIDString];
  v9 = _HKStringForFitnessMachineType(self->_machineType);
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p> session %@ connection %@ machine %@ %@ %@ %@", v5, self, v6, v7, v8, v9, self->_machineName, self->_machineBrand];

  return v10;
}

- (void)_setSessionUUID:(id)a3
{
}

- (void)_setConnectionUUID:(id)a3
{
}

- (void)_setMachineUUID:(id)a3
{
}

- (void)_setMachineType:(unint64_t)a3
{
  self->_machineType = a3;
}

- (void)_setMachineName:(id)a3
{
}

- (void)_setMachineBrand:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (NSUUID)machineUUID
{
  return self->_machineUUID;
}

- (unint64_t)machineType
{
  return self->_machineType;
}

- (NSString)machineName
{
  return self->_machineName;
}

- (NSString)machineBrand
{
  return self->_machineBrand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineBrand, 0);
  objc_storeStrong((id *)&self->_machineName, 0);
  objc_storeStrong((id *)&self->_machineUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end