@interface DACDeviceRole
+ (BOOL)supportsSecureCoding;
+ (id)unknownRole;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (BOOL)isUnknown;
- (BOOL)satisfiesRole:(id)a3;
- (DACDeviceRole)initWithCoder:(id)a3;
- (id)_initWithRoleFlags:(unint64_t)a3;
- (id)description;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACDeviceRole

+ (id)unknownRole
{
  id v2 = [[DACDeviceRole alloc] _initWithRoleFlags:0];

  return v2;
}

- (id)_initWithRoleFlags:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)DACDeviceRole;
  v4 = [(DACDeviceRole *)&v8 init];
  v5 = v4;
  if (v4) {
    v4->_flags = a3;
  }
  v6 = DACLogForCategory(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v5;
    _os_log_debug_impl(&dword_2330F4000, v6, OS_LOG_TYPE_DEBUG, "%p created role %{public}@", buf, 0x16u);
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = [(DACDeviceRole *)self flags];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  if ((v3 & 2) != 0) {
    uint64_t v8 = 70;
  }
  else {
    uint64_t v8 = 95;
  }
  uint64_t v9 = 76;
  if ((v3 & 1) == 0) {
    uint64_t v9 = 95;
  }
  v10 = [v4 stringWithFormat:@"<%@: %p, flags(%#lx) [%c%c]>", v6, self, v3, v9, v8];

  return v10;
}

- (DACDeviceRole)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flags"];
    uint64_t v6 = [(DACDeviceRole *)self _initWithRoleFlags:[(DACDeviceRole *)v5 unsignedIntegerValue]];
    self = v5;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACDeviceRole flags](self, "flags"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"flags"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DACDeviceRole *)a3;
  id v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v7 = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      BOOL v7 = 0;
      if (self && (isKindOfClass & 1) != 0)
      {
        uint64_t v8 = v5;
        unint64_t v9 = [(DACDeviceRole *)self flags];
        uint64_t v10 = [(DACDeviceRole *)v8 flags];

        BOOL v7 = v9 == v10;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isPrimary
{
  if ([(DACDeviceRole *)self flags]) {
    return 1;
  }

  return [(DACDeviceRole *)self isUnknown];
}

- (BOOL)isUnknown
{
  return [(DACDeviceRole *)self flags] == 0;
}

- (BOOL)satisfiesRole:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DACDeviceRole *)self flags];
  uint64_t v6 = [v4 flags] & v5;
  uint64_t v7 = [v4 flags];

  return v6 == v7;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end