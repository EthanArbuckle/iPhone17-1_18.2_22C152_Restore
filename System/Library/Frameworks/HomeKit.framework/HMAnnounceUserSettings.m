@interface HMAnnounceUserSettings
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAnnounceUserSettings)initWithCoder:(id)a3;
- (HMAnnounceUserSettings)initWithDeviceNotificationMode:(unint64_t)a3;
- (id)attributeDescriptions;
- (id)shortDescription;
- (unint64_t)deviceNotificationMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAnnounceUserSettings

- (unint64_t)deviceNotificationMode
{
  return self->_deviceNotificationMode;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAnnounceUserSettings deviceNotificationMode](self, "deviceNotificationMode"));
  v5 = (void *)[v3 initWithName:@"deviceNotificationMode" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAnnounceUserSettings *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(HMAnnounceUserSettings *)v6 deviceNotificationMode];
      BOOL v9 = v8 == [(HMAnnounceUserSettings *)self deviceNotificationMode];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[HMAnnounceUserSettings deviceNotificationMode](self, "deviceNotificationMode"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"HMD.Announce.DeviceNotificationModeKey"];
}

- (HMAnnounceUserSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.Announce.DeviceNotificationModeKey"];

  id v6 = -[HMAnnounceUserSettings initWithDeviceNotificationMode:](self, "initWithDeviceNotificationMode:", [v5 unsignedIntegerValue]);
  return v6;
}

- (HMAnnounceUserSettings)initWithDeviceNotificationMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMAnnounceUserSettings;
  result = [(HMAnnounceUserSettings *)&v5 init];
  if (result) {
    result->_deviceNotificationMode = a3;
  }
  return result;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end