@interface CRKDeviceGestalt
+ (BOOL)supportsSecureCoding;
- (CRKDeviceGestalt)initWithCoder:(id)a3;
- (CRKDeviceGestalt)initWithDevice:(id)a3;
- (CRKDeviceGestalt)initWithPlatform:(unint64_t)a3 systemVersion:(id)a4;
- (NSString)systemVersion;
- (unint64_t)platform;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKDeviceGestalt

- (CRKDeviceGestalt)initWithPlatform:(unint64_t)a3 systemVersion:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKDeviceGestalt;
  v7 = [(CRKDeviceGestalt *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_platform = a3;
    uint64_t v9 = [v6 copy];
    systemVersion = v8->_systemVersion;
    v8->_systemVersion = (NSString *)v9;
  }
  return v8;
}

- (CRKDeviceGestalt)initWithDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 platform];
  id v6 = [v4 systemVersion];

  v7 = [(CRKDeviceGestalt *)self initWithPlatform:v5 systemVersion:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[CRKDeviceGestalt platform](self, "platform"));
  [v5 encodeObject:v6 forKey:@"platform"];

  id v7 = [(CRKDeviceGestalt *)self systemVersion];
  [v5 encodeObject:v7 forKey:@"systemVersion"];
}

- (CRKDeviceGestalt)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKDeviceGestalt;
  id v5 = [(CRKDeviceGestalt *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
    v5->_platform = [v6 unsignedIntegerValue];

    id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"systemVersion"];
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v8;
  }
  return v5;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void).cxx_destruct
{
}

@end