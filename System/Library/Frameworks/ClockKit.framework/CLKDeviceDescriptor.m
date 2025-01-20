@interface CLKDeviceDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLKDeviceDescriptor)initWithCoder:(id)a3;
- (CLKDeviceDescriptor)initWithNRDevice:(id)a3;
- (CLKDeviceDescriptor)initWithNRDeviceUUID:(id)a3;
- (NSUUID)nrDeviceUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKDeviceDescriptor

- (CLKDeviceDescriptor)initWithNRDeviceUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKDeviceDescriptor;
  v6 = [(CLKDeviceDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nrDeviceUUID, a3);
  }

  return v7;
}

- (CLKDeviceDescriptor)initWithNRDevice:(id)a3
{
  v4 = [a3 pairingID];
  id v5 = [(CLKDeviceDescriptor *)self initWithNRDeviceUUID:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  nrDeviceUUID = self->_nrDeviceUUID;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__CLKDeviceDescriptor_isEqual___block_invoke;
  v10[3] = &unk_26440E508;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:nrDeviceUUID counterpart:v10];
  LOBYTE(nrDeviceUUID) = [v5 isEqual];

  return (char)nrDeviceUUID;
}

id __31__CLKDeviceDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_nrDeviceUUID hash];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NSUUID *)self->_nrDeviceUUID UUIDString];
  [v3 appendString:v4 withName:@"nrDeviceUUID"];

  id v5 = [v3 build];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CLKDeviceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nrDeviceUUID"];

  v6 = [(CLKDeviceDescriptor *)self initWithNRDeviceUUID:v5];
  return v6;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

- (void).cxx_destruct
{
}

@end