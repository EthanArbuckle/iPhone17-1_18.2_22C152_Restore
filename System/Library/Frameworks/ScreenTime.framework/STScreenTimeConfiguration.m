@interface STScreenTimeConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)enforcesChildRestrictions;
- (STScreenTimeConfiguration)initWithCoder:(id)a3;
- (STScreenTimeConfiguration)initWithEnforcesChildRestrictions:(BOOL)a3;
- (id)description;
- (void)_stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnforcesChildRestrictions:(BOOL)a3;
@end

@implementation STScreenTimeConfiguration

- (STScreenTimeConfiguration)initWithEnforcesChildRestrictions:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)STScreenTimeConfiguration;
  v4 = [(STScreenTimeConfiguration *)&v6 init];
  [(STScreenTimeConfiguration *)v4 _stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:v3];
  return v4;
}

- (void)_stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:(BOOL)a3
{
  self->_enforcesChildRestrictions = a3;
}

- (STScreenTimeConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"EnforcesChildRestrictions"])
  {
    v15.receiver = self;
    v15.super_class = (Class)STScreenTimeConfiguration;
    v5 = [(STScreenTimeConfiguration *)&v15 init];
    -[STScreenTimeConfiguration _stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:](v5, "_stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:", [v4 decodeBoolForKey:@"EnforcesChildRestrictions"]);
  }
  else
  {

    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v6) {
      -[STScreenTimeConfiguration initWithCoder:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  BOOL v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)STScreenTimeConfiguration;
  id v4 = [(STScreenTimeConfiguration *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ enforcesChildRestrictions: %d", v4, -[STScreenTimeConfiguration enforcesChildRestrictions](self, "enforcesChildRestrictions")];

  return v5;
}

- (BOOL)enforcesChildRestrictions
{
  return self->_enforcesChildRestrictions;
}

- (void)setEnforcesChildRestrictions:(BOOL)a3
{
  self->_enforcesChildRestrictions = a3;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end