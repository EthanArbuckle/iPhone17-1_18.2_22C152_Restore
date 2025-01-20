@interface BLSAttribute
+ (BOOL)supportsSecureCoding;
- (BLSAttribute)init;
- (BLSAttribute)initWithCoder:(id)a3;
- (BLSAttribute)initWithXPCDictionary:(id)a3;
- (BOOL)canBePaused;
- (BOOL)checkEntitlementSource:(id)a3 forSingleEntitlement:(id)a4 error:(id *)a5;
- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)errorForMissingEntitlement:(id)a3 inSource:(id)a4;
- (unint64_t)hash;
@end

@implementation BLSAttribute

- (BLSAttribute)init
{
  v3.receiver = self;
  v3.super_class = (Class)BLSAttribute;
  return [(BLSAttribute *)&v3 init];
}

- (BOOL)canBePaused
{
  return 1;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)checkEntitlementSource:(id)a3 forSingleEntitlement:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [v8 hasEntitlement:v9];
  BOOL v11 = v10;
  if (a5 && (v10 & 1) == 0)
  {
    v12 = [v8 description];
    *a5 = [(BLSAttribute *)self errorForMissingEntitlement:v9 inSource:v12];
  }
  return v11;
}

- (id)errorForMissingEntitlement:(id)a3 inSource:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v5 = [NSString stringWithFormat:@"%@ missing entitlement:%@", a4, a3];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:@"com.apple.BacklightServices" code:21 userInfo:v6];

  return v7;
}

- (BLSAttribute)initWithXPCDictionary:(id)a3
{
  id v3 = self;
  if ([(BLSAttribute *)self isMemberOfClass:objc_opt_class()])
  {
    uint64_t v4 = bls_assertions_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BLSAttribute initWithXPCDictionary:](v4);
    }

    uint64_t v5 = 0;
  }
  else
  {
    id v3 = [(BLSAttribute *)v3 init];
    uint64_t v5 = v3;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAttribute)initWithCoder:(id)a3
{
  id v3 = self;
  if ([(BLSAttribute *)self isMemberOfClass:objc_opt_class()])
  {
    uint64_t v4 = bls_assertions_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BLSAttribute initWithXPCDictionary:](v4);
    }

    uint64_t v5 = 0;
  }
  else
  {
    id v3 = [(BLSAttribute *)v3 init];
    uint64_t v5 = v3;
  }

  return v5;
}

- (void)initWithXPCDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "BLSAttribute initialized without valid subclass", v1, 2u);
}

@end