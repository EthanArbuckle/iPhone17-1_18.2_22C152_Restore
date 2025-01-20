@interface BLSDurationAttribute
+ (BOOL)supportsSecureCoding;
+ (id)cancelAfterInterval:(double)a3;
+ (id)timeoutAfterInterval:(double)a3;
+ (id)warnAfterInterval:(double)a3;
- (BLSDurationAttribute)initWithCoder:(id)a3;
- (BLSDurationAttribute)initWithDuration:(double)a3;
- (BLSDurationAttribute)initWithXPCDictionary:(id)a3;
- (BOOL)canBePaused;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSDurationAttribute

+ (id)cancelAfterInterval:(double)a3
{
  v3 = [(BLSDurationAttribute *)[BLSInvalidationDurationAttribute alloc] initWithDuration:a3];

  return v3;
}

+ (id)warnAfterInterval:(double)a3
{
  v3 = [(BLSDurationAttribute *)[BLSWarningDurationAttribute alloc] initWithDuration:a3];

  return v3;
}

+ (id)timeoutAfterInterval:(double)a3
{
  v3 = [(BLSDurationAttribute *)[BLSTimeoutDurationAttribute alloc] initWithDuration:a3];

  return v3;
}

- (BLSDurationAttribute)initWithDuration:(double)a3
{
  v4 = self;
  if ([(BLSDurationAttribute *)self isMemberOfClass:objc_opt_class()])
  {
    v5 = bls_assertions_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BLSDurationAttribute initWithDuration:](v5);
    }

    v6 = 0;
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = (Class)BLSDurationAttribute;
    v7 = [(BLSAttribute *)&v9 init];
    if (v7) {
      v7->_duration = a3;
    }
    v4 = v7;
    v6 = v4;
  }

  return v6;
}

- (BOOL)canBePaused
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendTimeInterval:@"duration" withName:1 decomposeUnits:self->_duration];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendDouble:self->_duration];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSDurationAttribute *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      double duration = self->_duration;
      [(BLSDurationAttribute *)v5 duration];
      if (duration == v7)
      {
        uint64_t v8 = objc_opt_class();
        BOOL v9 = v8 == objc_opt_class();
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BLSDurationAttribute)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  double v5 = xpc_dictionary_get_double(v4, (const char *)[@"duration" UTF8String]);

  return [(BLSDurationAttribute *)self initWithDuration:v5];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_double(xdict, (const char *)[@"duration" UTF8String], self->_duration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDurationAttribute)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"duration"];

  return -[BLSDurationAttribute initWithDuration:](self, "initWithDuration:");
}

- (void)encodeWithCoder:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)initWithDuration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "BLSDurationAttribute initialized without valid subclass", v1, 2u);
}

@end