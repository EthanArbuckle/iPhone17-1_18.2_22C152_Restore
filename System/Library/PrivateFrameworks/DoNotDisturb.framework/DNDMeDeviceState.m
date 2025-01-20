@interface DNDMeDeviceState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDMeDeviceState)initWithCoder:(id)a3;
- (DNDMeDeviceState)initWithStatus:(unint64_t)a3 name:(id)a4;
- (NSString)meDeviceName;
- (id)description;
- (unint64_t)hash;
- (unint64_t)meDeviceStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDMeDeviceState

- (DNDMeDeviceState)initWithStatus:(unint64_t)a3 name:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDMeDeviceState;
  v7 = [(DNDMeDeviceState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_meDeviceStatus = a3;
    uint64_t v9 = [v6 copy];
    meDeviceName = v8->_meDeviceName;
    v8->_meDeviceName = (NSString *)v9;
  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDMeDeviceState *)self meDeviceStatus];
  v4 = [(DNDMeDeviceState *)self meDeviceName];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDMeDeviceState *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(DNDMeDeviceState *)self meDeviceStatus];
      if (v6 == [(DNDMeDeviceState *)v5 meDeviceStatus])
      {
        v7 = [(DNDMeDeviceState *)self meDeviceName];
        v8 = [(DNDMeDeviceState *)v5 meDeviceName];
        if (v7 == v8)
        {
          char v13 = 1;
        }
        else
        {
          uint64_t v9 = [(DNDMeDeviceState *)self meDeviceName];
          if (v9)
          {
            v10 = [(DNDMeDeviceState *)v5 meDeviceName];
            if (v10)
            {
              v11 = [(DNDMeDeviceState *)self meDeviceName];
              objc_super v12 = [(DNDMeDeviceState *)v5 meDeviceName];
              char v13 = [v11 isEqual:v12];
            }
            else
            {
              char v13 = 0;
            }
          }
          else
          {
            char v13 = 0;
          }
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDMeDeviceState *)self meDeviceStatus] - 1;
  if (v5 > 2) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E5911278[v5];
  }
  v7 = [(DNDMeDeviceState *)self meDeviceName];
  v8 = [v3 stringWithFormat:@"<%@: %p; meDeviceStatus: %@; meDeviceName: %@>", v4, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDMeDeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"meDeviceStatus"]) {
    uint64_t v5 = [v4 decodeIntegerForKey:@"meDeviceStatus"];
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"meDeviceName"];
  v7 = [(DNDMeDeviceState *)self initWithStatus:v5 name:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDMeDeviceState meDeviceStatus](self, "meDeviceStatus"), @"meDeviceStatus");
  id v5 = [(DNDMeDeviceState *)self meDeviceName];
  [v4 encodeObject:v5 forKey:@"meDeviceName"];
}

- (unint64_t)meDeviceStatus
{
  return self->_meDeviceStatus;
}

- (NSString)meDeviceName
{
  return self->_meDeviceName;
}

- (void).cxx_destruct
{
}

@end