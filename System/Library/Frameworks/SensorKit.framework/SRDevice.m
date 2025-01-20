@interface SRDevice
+ (BOOL)supportsSecureCoding;
+ (SRDevice)currentDevice;
- (BOOL)isEqual:(id)a3;
- (NSString)buildVersion;
- (NSString)deviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)productType;
- (NSString)systemName;
- (NSString)systemVersion;
- (SRDevice)initWithCoder:(id)a3;
- (SRDevice)initWithDeviceDetails:(id)a3;
- (id)_productType;
- (id)description;
- (id)sr_dictionaryRepresentation;
- (int64_t)deviceEnclosureMaterial;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceEnclosureMaterial:(int64_t)a3;
- (void)setDeviceIdentifier:(id)a3;
@end

@implementation SRDevice

- (SRDevice)initWithDeviceDetails:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRDevice;
  v4 = [(SRDevice *)&v6 init];
  if (v4)
  {
    v4->_name = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D169088];
    v4->_model = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D169028];
    v4->_systemName = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D169048];
    v4->_systemVersion = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D169068];
    v4->_buildVersion = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D1690A8];
    v4->_deviceIdentifier = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D169008];
    v4->_internalProductType = (NSString *)(id)[a3 objectForKeyedSubscript:0x26D1690E8];
    v4->_deviceEnclosureMaterial = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x26D169108), "integerValue");
  }
  return v4;
}

- (void)dealloc
{
  self->_name = 0;
  self->_model = 0;

  self->_systemName = 0;
  self->_systemVersion = 0;

  self->_buildVersion = 0;
  self->_internalProductType = 0;
  [(SRDevice *)self setDeviceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)SRDevice;
  [(SRDevice *)&v3 dealloc];
}

- (NSString)productType
{
  return self->_internalProductType;
}

- (id)_productType
{
  return self->_internalProductType;
}

+ (SRDevice)currentDevice
{
  if (qword_26AB1A098 != -1) {
    dispatch_once(&qword_26AB1A098, &__block_literal_global_1);
  }
  return (SRDevice *)_MergedGlobals_1;
}

SRDevice *__25__SRDevice_currentDevice__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v2[0] = objc_msgSend((id)objc_msgSend((id)getUIDeviceClass(), "currentDevice", 0x26D169088), "name");
  v1[1] = 0x26D169028;
  v2[1] = objc_msgSend((id)objc_msgSend((id)getUIDeviceClass(), "currentDevice"), "model");
  v1[2] = 0x26D169048;
  v2[2] = objc_msgSend((id)objc_msgSend((id)getUIDeviceClass(), "currentDevice"), "systemName");
  v1[3] = 0x26D169068;
  v2[3] = objc_msgSend((id)objc_msgSend((id)getUIDeviceClass(), "currentDevice"), "systemVersion");
  v1[4] = 0x26D1690A8;
  v2[4] = objc_msgSend((id)objc_msgSend((id)getUIDeviceClass(), "currentDevice"), "buildVersion");
  v1[5] = 0x26D1690E8;
  memset(&v3, 0, 512);
  uname(&v3);
  v2[5] = [NSString stringWithCString:v3.machine encoding:4];
  result = -[SRDevice initWithDeviceDetails:]([SRDevice alloc], "initWithDeviceDetails:", [NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:6]);
  _MergedGlobals_1 = (uint64_t)result;
  return result;
}

- (id)sr_dictionaryRepresentation
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = 0x26D169088;
  v5[0] = [(SRDevice *)self name];
  v4[1] = 0x26D169028;
  v5[1] = [(SRDevice *)self model];
  v4[2] = 0x26D169048;
  v5[2] = [(SRDevice *)self systemName];
  v4[3] = 0x26D169068;
  v5[3] = [(SRDevice *)self systemVersion];
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if (!self->_deviceIdentifier)
  {
    if (![a3 deviceIdentifier])
    {
      if (!self->_deviceIdentifier) {
        goto LABEL_12;
      }
      goto LABEL_4;
    }
LABEL_9:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_4:
  uint64_t v5 = [a3 deviceIdentifier];
  if (!v5) {
    return v5;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    goto LABEL_14;
  }
LABEL_12:
  if ([a3 deviceIdentifier])
  {
    deviceIdentifier = self->_deviceIdentifier;
LABEL_14:
    uint64_t v7 = [a3 deviceIdentifier];
    LOBYTE(v5) = [(NSString *)deviceIdentifier isEqualToString:v7];
    return v5;
  }
  LODWORD(v5) = -[NSString isEqualToString:](self->_name, "isEqualToString:", [a3 name]);
  if (v5)
  {
    LODWORD(v5) = -[NSString isEqualToString:](self->_model, "isEqualToString:", [a3 model]);
    if (v5)
    {
      LODWORD(v5) = -[NSString isEqualToString:](self->_systemName, "isEqualToString:", [a3 systemName]);
      if (v5)
      {
        LODWORD(v5) = -[NSString isEqualToString:](self->_systemVersion, "isEqualToString:", [a3 systemVersion]);
        if (v5)
        {
          LODWORD(v5) = -[NSString isEqualToString:](self->_buildVersion, "isEqualToString:", [a3 buildVersion]);
          if (v5)
          {
            LODWORD(v5) = -[NSString isEqualToString:](self->_internalProductType, "isEqualToString:", [a3 productType]);
            if (v5)
            {
              int64_t deviceEnclosureMaterial = self->_deviceEnclosureMaterial;
              LOBYTE(v5) = deviceEnclosureMaterial == [a3 deviceEnclosureMaterial];
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    return [(NSString *)deviceIdentifier hash];
  }
  else
  {
    NSUInteger v5 = [(NSString *)self->_name hash];
    NSUInteger v6 = v5 ^ (2 * [(NSString *)self->_model hash]);
    NSUInteger v7 = v6 ^ (4 * [(NSString *)self->_systemName hash]);
    NSUInteger v8 = v7 ^ (8 * [(NSString *)self->_systemVersion hash]);
    NSUInteger v9 = v8 ^ (16 * [(NSString *)self->_buildVersion hash]);
    NSUInteger v10 = v9 ^ (32 * [(NSString *)self->_internalProductType hash]);
    return v10 ^ (objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", self->_deviceEnclosureMaterial), "hash") << 6);
  }
}

- (id)description
{
  utsname v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@: \"%@\", %@, %@ %@", NSStringFromClass(v4), self->_name, self->_model, self->_systemName, self->_systemVersion];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name forKey:0x26D169088];
  [a3 encodeObject:self->_model forKey:0x26D169028];
  [a3 encodeObject:self->_systemName forKey:0x26D169048];
  [a3 encodeObject:self->_systemVersion forKey:0x26D169068];
  [a3 encodeObject:self->_buildVersion forKey:0x26D1690A8];
  [a3 encodeObject:self->_deviceIdentifier forKey:0x26D169008];
  [a3 encodeObject:self->_internalProductType forKey:0x26D1690E8];
  int64_t deviceEnclosureMaterial = self->_deviceEnclosureMaterial;

  [a3 encodeInteger:deviceEnclosureMaterial forKey:0x26D169108];
}

- (SRDevice)initWithCoder:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D169088), 0x26D169088);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D169028), 0x26D169028);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D169048), 0x26D169048);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D169068), 0x26D169068);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D1690A8), 0x26D1690A8);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D169008), 0x26D169008);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26D1690E8), 0x26D1690E8);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "decodeIntegerForKey:", 0x26D169108)), "stringValue"), 0x26D169108);
  NSUInteger v6 = [(SRDevice *)self initWithDeviceDetails:v5];

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)systemName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)systemVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (int64_t)deviceEnclosureMaterial
{
  return self->_deviceEnclosureMaterial;
}

- (void)setDeviceEnclosureMaterial:(int64_t)a3
{
  self->_int64_t deviceEnclosureMaterial = a3;
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBuildVersion:(id)a3
{
}

@end