@interface FMDRepairDeviceResult
+ (BOOL)supportsSecureCoding;
- (FMDRepairDeviceResult)initWithCoder:(id)a3;
- (FMDRepairDeviceResult)initWithEligibleDevices:(id)a3 devicesInRepairMode:(id)a4;
- (NSArray)devicesInRepairMode;
- (NSArray)eligibleDevices;
- (void)encodeWithCoder:(id)a3;
- (void)setDevicesInRepairMode:(id)a3;
- (void)setEligibleDevices:(id)a3;
@end

@implementation FMDRepairDeviceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDRepairDeviceResult)initWithEligibleDevices:(id)a3 devicesInRepairMode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDRepairDeviceResult;
  v9 = [(FMDRepairDeviceResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eligibleDevices, a3);
    objc_storeStrong((id *)&v10->_devicesInRepairMode, a4);
  }

  return v10;
}

- (FMDRepairDeviceResult)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDRepairDeviceResult;
  v5 = [(FMDRepairDeviceResult *)&v17 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"eligibleDevices"];
    eligibleDevices = v5->_eligibleDevices;
    v5->_eligibleDevices = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"devicesInRepairMode"];
    devicesInRepairMode = v5->_devicesInRepairMode;
    v5->_devicesInRepairMode = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  eligibleDevices = self->_eligibleDevices;
  id v5 = a3;
  [v5 encodeObject:eligibleDevices forKey:@"eligibleDevices"];
  [v5 encodeObject:self->_devicesInRepairMode forKey:@"devicesInRepairMode"];
}

- (NSArray)eligibleDevices
{
  return self->_eligibleDevices;
}

- (void)setEligibleDevices:(id)a3
{
}

- (NSArray)devicesInRepairMode
{
  return self->_devicesInRepairMode;
}

- (void)setDevicesInRepairMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesInRepairMode, 0);

  objc_storeStrong((id *)&self->_eligibleDevices, 0);
}

@end