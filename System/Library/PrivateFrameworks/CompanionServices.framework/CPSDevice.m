@interface CPSDevice
+ (BOOL)supportsSecureCoding;
+ (CPSDevice)currentDevice;
- (CPSDevice)initWithCoder:(id)a3;
- (NSString)buildVersion;
- (NSString)model;
- (NSString)name;
- (id)_initCurrentDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CPSDevice

- (id)_initCurrentDevice
{
  v17.receiver = self;
  v17.super_class = (Class)CPSDevice;
  v2 = [(CPSDevice *)&v17 init];
  if (v2)
  {
    uint64_t v3 = GestaltCopyAnswer();
    name = v2->_name;
    v2->_name = (NSString *)v3;

    uint64_t v5 = GestaltCopyAnswer();
    model = v2->_model;
    v2->_model = (NSString *)v5;

    BOOL v7 = GestaltGetBoolean() != 0;
    if (GestaltGetBoolean()) {
      uint64_t v8 = v7 | 2;
    }
    else {
      uint64_t v8 = v7;
    }
    v9 = [MEMORY[0x263F29CA0] sharedInstance];
    unint64_t v10 = [v9 homeButtonType];

    if (v10 >= 2) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = v8 | 4;
    }
    int v12 = SBSIsSystemApertureAvailable();
    uint64_t v13 = v11 | 8;
    if (!v12) {
      uint64_t v13 = v11;
    }
    v2->_flags = v13;
    uint64_t v14 = GestaltCopyAnswer();
    buildVersion = v2->_buildVersion;
    v2->_buildVersion = (NSString *)v14;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = CUPrintFlags64();
  [v3 appendString:v4 withName:@"flags"];

  [v3 appendString:self->_model withName:@"model" skipIfEmpty:1];
  [v3 appendString:self->_name withName:@"name" skipIfEmpty:1];
  [v3 appendString:self->_buildVersion withName:@"buildVersion" skipIfEmpty:1];
  uint64_t v5 = [v3 build];

  return v5;
}

+ (CPSDevice)currentDevice
{
  id v2 = [[CPSDevice alloc] _initCurrentDevice];
  return (CPSDevice *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSDevice;
  uint64_t v5 = [(CPSDevice *)&v16 init];
  if (v5)
  {
    v5->_flags = [v4 decodeIntegerForKey:@"flags"];
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    int v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"buildVersion"];
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t flags = self->_flags;
  id v5 = a3;
  [v5 encodeInteger:flags forKey:@"flags"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_buildVersion forKey:@"buildVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CPSDevice);
  v4->_unint64_t flags = self->_flags;
  uint64_t v5 = [(NSString *)self->_model copy];
  model = v4->_model;
  v4->_model = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_name copy];
  name = v4->_name;
  v4->_name = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_buildVersion copy];
  buildVersion = v4->_buildVersion;
  v4->_buildVersion = (NSString *)v9;

  return v4;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_unint64_t flags = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end