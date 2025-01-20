@interface IRMiLoNearbyDeviceDO
+ (BOOL)supportsSecureCoding;
+ (id)miLoNearbyDeviceDOWithHasBleRssi:(BOOL)a3 deviceIdentifier:(id)a4;
- (BOOL)hasBleRssi;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3;
- (IRMiLoNearbyDeviceDO)initWithCoder:(id)a3;
- (IRMiLoNearbyDeviceDO)initWithHasBleRssi:(BOOL)a3 deviceIdentifier:(id)a4;
- (NSString)deviceIdentifier;
- (id)copyWithReplacementDeviceIdentifier:(id)a3;
- (id)copyWithReplacementHasBleRssi:(BOOL)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRMiLoNearbyDeviceDO

- (IRMiLoNearbyDeviceDO)initWithHasBleRssi:(BOOL)a3 deviceIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRMiLoNearbyDeviceDO;
  v8 = [(IRMiLoNearbyDeviceDO *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_hasBleRssi = a3;
    objc_storeStrong((id *)&v8->_deviceIdentifier, a4);
  }

  return v9;
}

+ (id)miLoNearbyDeviceDOWithHasBleRssi:(BOOL)a3 deviceIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithHasBleRssi:v4 deviceIdentifier:v6];

  return v7;
}

- (id)copyWithReplacementHasBleRssi:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  deviceIdentifier = self->_deviceIdentifier;

  return (id)[v5 initWithHasBleRssi:v3 deviceIdentifier:deviceIdentifier];
}

- (id)copyWithReplacementDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHasBleRssi:self->_hasBleRssi deviceIdentifier:v4];

  return v5;
}

- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (int hasBleRssi = self->_hasBleRssi, hasBleRssi == [v4 hasBleRssi])
    && (int v7 = self->_deviceIdentifier != 0,
        [v5 deviceIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    deviceIdentifier = self->_deviceIdentifier;
    if (deviceIdentifier)
    {
      objc_super v11 = [v5 deviceIdentifier];
      char v12 = [(NSString *)deviceIdentifier isEqual:v11];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRMiLoNearbyDeviceDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRMiLoNearbyDeviceDO *)self isEqualToMiLoNearbyDeviceDO:v5];

  return v6;
}

- (unint64_t)hash
{
  BOOL hasBleRssi = self->_hasBleRssi;
  return [(NSString *)self->_deviceIdentifier hash] - hasBleRssi + 32 * hasBleRssi;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiLoNearbyDeviceDO)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"hasBleRssi"];
  if (v5) {
    goto LABEL_2;
  }
  v14 = [v4 error];

  if (!v14)
  {
    if (([v4 containsValueForKey:@"hasBleRssi"] & 1) == 0)
    {
      uint64_t v20 = *MEMORY[0x263F08320];
      v21[0] = @"Missing serialized value for IRMiLoNearbyDeviceDO.hasBleRssi";
      BOOL v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiLoNearbyDeviceDOOCNTErrorDomain" code:1 userInfo:v6];
      [v4 failWithError:v8];
      goto LABEL_11;
    }
LABEL_2:
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        int v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        objc_super v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRMiLoNearbyDeviceDO key \"deviceIdentifier\" (expected %@, decoded %@)", v8, v10, 0];
        uint64_t v18 = *MEMORY[0x263F08320];
        v19 = v11;
        char v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiLoNearbyDeviceDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v13];

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      v16 = [v4 error];

      if (v16)
      {
LABEL_12:
        v15 = 0;
        goto LABEL_13;
      }
    }
    self = [(IRMiLoNearbyDeviceDO *)self initWithHasBleRssi:v5 != 0 deviceIdentifier:v6];
    v15 = self;
LABEL_13:

    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:self->_hasBleRssi forKey:@"hasBleRssi"];
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    [v5 encodeObject:deviceIdentifier forKey:@"deviceIdentifier"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithBool:self->_hasBleRssi];
  id v5 = (void *)[v3 initWithFormat:@"<IRMiLoNearbyDeviceDO | hasBleRssi:%@ deviceIdentifier:%@>", v4, self->_deviceIdentifier];

  return v5;
}

- (BOOL)hasBleRssi
{
  return self->_hasBleRssi;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
}

@end