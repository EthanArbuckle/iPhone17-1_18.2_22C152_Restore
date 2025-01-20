@interface BLSAlwaysOnDateSpecifier
+ (BOOL)supportsSecureCoding;
- (BLSAlwaysOnDateSpecifier)initWithCoder:(id)a3;
- (BLSAlwaysOnDateSpecifier)initWithDate:(id)a3 fidelity:(int64_t)a4;
- (BLSAlwaysOnDateSpecifier)initWithDate:(id)a3 fidelity:(int64_t)a4 userObject:(id)a5;
- (BLSAlwaysOnDateSpecifier)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (id)bls_shortLoggingString;
- (id)newSpecifierWithMaxFidelity:(int64_t)a3;
- (id)userObject;
- (int64_t)compare:(id)a3;
- (int64_t)fidelity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSAlwaysOnDateSpecifier

- (BLSAlwaysOnDateSpecifier)initWithDate:(id)a3 fidelity:(int64_t)a4 userObject:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSAlwaysOnDateSpecifier;
  v11 = [(BLSAlwaysOnDateSpecifier *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    v12->_fidelity = a4;
    objc_storeStrong(&v12->_userObject, a5);
  }

  return v12;
}

- (BLSAlwaysOnDateSpecifier)initWithDate:(id)a3 fidelity:(int64_t)a4
{
  return [(BLSAlwaysOnDateSpecifier *)self initWithDate:a3 fidelity:a4 userObject:0];
}

- (id)newSpecifierWithMaxFidelity:(int64_t)a3
{
  v5 = [BLSAlwaysOnDateSpecifier alloc];
  date = self->_date;
  if (self->_fidelity >= a3) {
    int64_t fidelity = a3;
  }
  else {
    int64_t fidelity = self->_fidelity;
  }

  return [(BLSAlwaysOnDateSpecifier *)v5 initWithDate:date fidelity:fidelity];
}

- (id)bls_shortLoggingString
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __50__BLSAlwaysOnDateSpecifier_bls_shortLoggingString__block_invoke;
  id v10 = &unk_1E6106FA8;
  id v11 = v3;
  v12 = self;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

void __50__BLSAlwaysOnDateSpecifier_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "bls_shortLoggingString");
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(a1 + 40));
  [v2 appendString:v3 withName:v4];

  v5 = *(void **)(a1 + 32);
  v6 = NSStringFromBLSUpdateFidelity(*(void *)(*(void *)(a1 + 40) + 16));
  [v5 appendString:v6 withName:0 skipIfEmpty:1];

  if (*(void *)(*(void *)(a1 + 40) + 24))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "appendProem:block:");
  }
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSDate *)self->_date bls_shortLoggingString];
  [v3 appendString:v4 withName:@"date"];

  v5 = NSStringFromBLSUpdateFidelity(self->_fidelity);
  [v3 appendString:v5 withName:@"fidelity"];

  id userObject = self->_userObject;
  if (userObject)
  {
    uint64_t v7 = [NSString stringWithFormat:@"<%p:%@>", userObject, objc_opt_class()];
    [v3 appendString:v7 withName:@"userObject"];
  }
  uint64_t v8 = [v3 build];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_date];
  id v5 = (id)[v3 appendInteger:self->_fidelity];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  date = self->_date;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke;
  v18[3] = &unk_1E61073D8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:date counterpart:v18];
  int64_t fidelity = self->_fidelity;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke_2;
  v16 = &unk_1E6107400;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendInteger:fidelity counterpart:&v13];
  LOBYTE(fidelity) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return fidelity;
}

uint64_t __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) date];
}

uint64_t __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fidelity];
}

- (int64_t)compare:(id)a3
{
  date = self->_date;
  id v4 = [a3 date];
  int64_t v5 = [(NSDate *)date compare:v4];

  return v5;
}

- (BLSAlwaysOnDateSpecifier)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  double v5 = xpc_dictionary_get_double(v4, (const char *)[@"date" UTF8String]);
  int64_t int64 = xpc_dictionary_get_int64(v4, (const char *)[@"fidelity" UTF8String]);

  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v5];
  id v8 = [(BLSAlwaysOnDateSpecifier *)self initWithDate:v7 fidelity:int64];

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  double v5 = (const char *)[@"date" UTF8String];
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(xdict, v5, v6);
  xpc_dictionary_set_int64(xdict, (const char *)[@"fidelity" UTF8String], self->_fidelity);
  if (self->_userObject)
  {
    id v7 = [NSString stringWithFormat:@"User object is not sent over XPC: %@", self->_userObject];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(BLSAlwaysOnDateSpecifier *)a2 encodeWithXPCDictionary:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAlwaysOnDateSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  if (v5)
  {
    self = -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:](self, "initWithDate:fidelity:", v5, (int)[v4 decodeIntForKey:@"fidelity"]);
    double v6 = self;
  }
  else
  {
    id v7 = bls_backlight_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BLSAlwaysOnDateSpecifier initWithCoder:]((uint64_t)v4, v7);
    }

    double v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_date forKey:@"date"];
  [v6 encodeInteger:self->_fidelity forKey:@"fidelity"];
  if (self->_userObject)
  {
    double v5 = [NSString stringWithFormat:@"User object is not sent over XPC: %@", self->_userObject];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(BLSAlwaysOnDateSpecifier *)a2 encodeWithCoder:(uint64_t)v5];
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
  }
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)fidelity
{
  return self->_fidelity;
}

- (id)userObject
{
  return self->_userObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userObject, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (void)encodeWithXPCDictionary:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  double v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"BLSAlwaysOnDateSpecifier.m";
  __int16 v10 = 1024;
  int v11 = 110;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_FAULT, "invalid date from %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  double v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"BLSAlwaysOnDateSpecifier.m";
  __int16 v10 = 1024;
  int v11 = 133;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1B55DE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end