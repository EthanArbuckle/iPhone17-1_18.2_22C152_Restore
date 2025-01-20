@interface HMDTargetButtonConfiguration
- (BOOL)isEqual:(id)a3;
- (HMDTargetButtonConfiguration)init;
- (HMDTargetButtonConfiguration)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5;
- (NSString)name;
- (id)buttonName;
- (id)description;
- (id)shortDescription;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)identifier;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation HMDTargetButtonConfiguration

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  int64_t v3 = [(HMDTargetButtonConfiguration *)self type];
  return [(HMDTargetButtonConfiguration *)self identifier] | (unint64_t)(v3 << 8);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDTargetButtonConfiguration *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      if (v7
        && (int v8 = [(HMDTargetButtonConfiguration *)self identifier],
            v8 == [(HMDTargetButtonConfiguration *)v7 identifier]))
      {
        int64_t v9 = [(HMDTargetButtonConfiguration *)self type];
        BOOL v10 = v9 == [(HMDTargetButtonConfiguration *)v7 type];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)shortDescription
{
  int64_t v3 = NSString;
  unsigned int v4 = [(HMDTargetButtonConfiguration *)self identifier];
  int64_t v5 = [(HMDTargetButtonConfiguration *)self type];
  if ((unint64_t)(v5 - 1) > 0xC) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_264A1B9E8[v5 - 1];
  }
  uint64_t v7 = v4;
  int v8 = v6;
  int64_t v9 = [v3 stringWithFormat:@"%lu/%@", v7, v8];

  return v9;
}

- (id)description
{
  int64_t v3 = NSString;
  unsigned int v4 = [(HMDTargetButtonConfiguration *)self identifier];
  int64_t v5 = [(HMDTargetButtonConfiguration *)self type];
  if ((unint64_t)(v5 - 1) > 0xC) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_264A1B9E8[v5 - 1];
  }
  uint64_t v7 = v4;
  int v8 = v6;
  int64_t v9 = [(HMDTargetButtonConfiguration *)self buttonName];
  BOOL v10 = [v3 stringWithFormat:@"(%lu, %@, %@)", v7, v8, v9];

  return v10;
}

- (id)buttonName
{
  if ((unint64_t)([(HMDTargetButtonConfiguration *)self type] - 1) > 0xC)
  {
    uint64_t v5 = [(HMDTargetButtonConfiguration *)self name];
    v6 = (void *)v5;
    uint64_t v7 = @"Undefined";
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    int v8 = v7;
  }
  else
  {
    int64_t v3 = [(HMDTargetButtonConfiguration *)self type];
    if ((unint64_t)(v3 - 1) > 0xC) {
      unsigned int v4 = @"Unknown";
    }
    else {
      unsigned int v4 = off_264A1B9E8[v3 - 1];
    }
    int v8 = v4;
  }
  return v8;
}

- (HMDTargetButtonConfiguration)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDTargetButtonConfiguration;
  BOOL v10 = [(HMDTargetButtonConfiguration *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_identifier = [v8 unsignedCharValue];
    uint64_t v12 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;
  }
  return v11;
}

- (HMDTargetButtonConfiguration)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  unsigned int v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end