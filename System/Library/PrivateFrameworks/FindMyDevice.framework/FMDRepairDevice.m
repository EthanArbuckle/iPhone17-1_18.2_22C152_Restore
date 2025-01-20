@interface FMDRepairDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isThisDevice;
- (FMDRepairDevice)initWithClientIdentifier:(id)a3 isThisDevice:(BOOL)a4;
- (FMDRepairDevice)initWithCoder:(id)a3;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FMDRepairDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDRepairDevice)initWithClientIdentifier:(id)a3 isThisDevice:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDRepairDevice;
  v8 = [(FMDRepairDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_isThisDevice = a4;
  }

  return v9;
}

- (FMDRepairDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDRepairDevice;
  v5 = [(FMDRepairDevice *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isThisDevice = [v4 decodeBoolForKey:@"isThisDevice"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeBool:self->_isThisDevice forKey:@"isThisDevice"];
}

- (BOOL)isThisDevice
{
  return self->_isThisDevice;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end