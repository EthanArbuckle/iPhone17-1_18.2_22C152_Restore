@interface IRNearbyDeviceContainerDO
+ (BOOL)supportsSecureCoding;
+ (id)miLoNearbyDeviceDOWithFreezeDateNIHomeDevice:(id)a3 nearbyDevices:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3;
- (IRNearbyDeviceContainerDO)initWithCoder:(id)a3;
- (IRNearbyDeviceContainerDO)initWithFreezeDateNIHomeDevice:(id)a3 nearbyDevices:(id)a4;
- (NSDate)freezeDateNIHomeDevice;
- (NSSet)nearbyDevices;
- (id)copyWithReplacementFreezeDateNIHomeDevice:(id)a3;
- (id)copyWithReplacementNearbyDevices:(id)a3;
- (id)description;
- (id)exportAsArray;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRNearbyDeviceContainerDO

- (NSDate)freezeDateNIHomeDevice
{
  return self->_freezeDateNIHomeDevice;
}

- (NSSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_freezeDateNIHomeDevice hash];
  return [(NSSet *)self->_nearbyDevices hash] - v3 + 32 * v3;
}

- (id)exportAsArray
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(IRNearbyDeviceContainerDO *)self nearbyDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) exportAsDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (IRNearbyDeviceContainerDO)initWithFreezeDateNIHomeDevice:(id)a3 nearbyDevices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IRNearbyDeviceContainerDO;
  v9 = [(IRNearbyDeviceContainerDO *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_freezeDateNIHomeDevice, a3);
    objc_storeStrong((id *)&v10->_nearbyDevices, a4);
  }

  return v10;
}

+ (id)miLoNearbyDeviceDOWithFreezeDateNIHomeDevice:(id)a3 nearbyDevices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithFreezeDateNIHomeDevice:v7 nearbyDevices:v6];

  return v8;
}

- (id)copyWithReplacementFreezeDateNIHomeDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFreezeDateNIHomeDevice:v4 nearbyDevices:self->_nearbyDevices];

  return v5;
}

- (id)copyWithReplacementNearbyDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFreezeDateNIHomeDevice:self->_freezeDateNIHomeDevice nearbyDevices:v4];

  return v5;
}

- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_freezeDateNIHomeDevice != 0;
  id v7 = [v4 freezeDateNIHomeDevice];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  freezeDateNIHomeDevice = self->_freezeDateNIHomeDevice;
  if (freezeDateNIHomeDevice)
  {
    v10 = [v5 freezeDateNIHomeDevice];
    int v11 = [(NSDate *)freezeDateNIHomeDevice isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_nearbyDevices != 0;
  long long v13 = [v5 nearbyDevices];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    nearbyDevices = self->_nearbyDevices;
    if (nearbyDevices)
    {
      uint64_t v16 = [v5 nearbyDevices];
      char v17 = [(NSSet *)nearbyDevices isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRNearbyDeviceContainerDO *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRNearbyDeviceContainerDO *)self isEqualToMiLoNearbyDeviceDO:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRNearbyDeviceContainerDO)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"freezeDateNIHomeDevice"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNearbyDeviceContainerDO key \"freezeDateNIHomeDevice\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v21 = *MEMORY[0x263F08320];
      v22[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNearbyDeviceContainerDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];

LABEL_5:
      int v14 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    long long v13 = [v4 error];

    if (v13) {
      goto LABEL_5;
    }
  }
  id v15 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v16 = objc_opt_class();
  char v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"nearbyDevices"];

  if (v18 || ([v4 error], v19 = objc_claimAutoreleasedReturnValue(), v19, !v19))
  {
    self = [(IRNearbyDeviceContainerDO *)self initWithFreezeDateNIHomeDevice:v5 nearbyDevices:v18];
    int v14 = self;
  }
  else
  {
    int v14 = 0;
  }

LABEL_11:
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  freezeDateNIHomeDevice = self->_freezeDateNIHomeDevice;
  id v7 = v4;
  if (freezeDateNIHomeDevice)
  {
    [v4 encodeObject:freezeDateNIHomeDevice forKey:@"freezeDateNIHomeDevice"];
    id v4 = v7;
  }
  nearbyDevices = self->_nearbyDevices;
  if (nearbyDevices)
  {
    [v7 encodeObject:nearbyDevices forKey:@"nearbyDevices"];
    id v4 = v7;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRNearbyDeviceContainerDO | freezeDateNIHomeDevice:%@ nearbyDevices:%@>", self->_freezeDateNIHomeDevice, self->_nearbyDevices];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);

  objc_storeStrong((id *)&self->_freezeDateNIHomeDevice, 0);
}

@end