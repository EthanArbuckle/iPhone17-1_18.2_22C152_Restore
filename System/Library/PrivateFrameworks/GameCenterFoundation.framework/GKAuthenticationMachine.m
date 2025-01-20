@interface GKAuthenticationMachine
+ (BOOL)supportsSecureCoding;
+ (id)authMachineForEnvironment:(int64_t)a3;
+ (void)migratePreBlacktailAccountInformation;
+ (void)migratePreSundanceAccountInformation;
- (GKAuthenticationMachine)initWithCoder:(id)a3;
- (NSString)accountName;
- (int64_t)serverEnvironment;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setServerEnvironment:(int64_t)a3;
@end

@implementation GKAuthenticationMachine

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)authMachineForEnvironment:(int64_t)a3
{
  return 0;
}

- (GKAuthenticationMachine)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKAuthenticationMachine;
  v5 = [(GKAuthenticationMachine *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountName"];
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v6;

    v5->_serverEnvironment = (int)[v4 decodeInt32ForKey:@"serverEnvironment"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(GKAuthenticationMachine *)self accountName];
  if (v4) {
    [v5 encodeObject:v4 forKey:@"accountName"];
  }
  objc_msgSend(v5, "encodeInt32:forKey:", -[GKAuthenticationMachine serverEnvironment](self, "serverEnvironment"), @"serverEnvironment");
}

+ (void)migratePreBlacktailAccountInformation
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_ERROR, "error while decoding GKProductionMachine archive:%@", v1, 0xCu);
}

+ (void)migratePreSundanceAccountInformation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_DEBUG, "--> INCOMPLETE TRANSFER PRE-SUNDANCE playerID:%@ token:%@", v2, 0x16u);
}

void __63__GKAuthenticationMachine_migratePreSundanceAccountInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __63__GKAuthenticationMachine_migratePreSundanceAccountInformation__block_invoke_cold_1();
    }
  }
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (int64_t)serverEnvironment
{
  return self->_serverEnvironment;
}

- (void)setServerEnvironment:(int64_t)a3
{
  self->_serverEnvironment = a3;
}

- (void).cxx_destruct
{
}

void __63__GKAuthenticationMachine_migratePreSundanceAccountInformation__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_ERROR, "TRANSFER PRE-SUNDANCE: failed to set credential: %@", v1, 0xCu);
}

@end