@interface DMFFetchSecurityInformationRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (NSArray)allPlatformSecurityInfoKeys;
+ (NSArray)currentPlatformSecurityInfoKeys;
+ (NSArray)iOSSecurityInfoKeys;
+ (NSArray)macOSSecurityInfoKeys;
+ (NSArray)tvOSSecurityInfoKeys;
+ (NSArray)watchOSSecurityInfoKeys;
+ (id)permittedPlatforms;
- (DMFFetchSecurityInformationRequest)initWithCoder:(id)a3;
- (NSArray)infoKeys;
- (void)encodeWithCoder:(id)a3;
- (void)setInfoKeys:(id)a3;
@end

@implementation DMFFetchSecurityInformationRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB880;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchSecurityInformationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchSecurityInformationRequest;
  v5 = [(CATTaskRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"infoKeys"];
    infoKeys = v5->_infoKeys;
    v5->_infoKeys = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchSecurityInformationRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchSecurityInformationRequest *)self infoKeys];
  [v4 encodeObject:v5 forKey:@"infoKeys"];
}

+ (NSArray)currentPlatformSecurityInfoKeys
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [a1 allPlatformSecurityInfoKeys];
  v5 = [v3 arrayWithArray:v4];

  objc_super v6 = [a1 iOSSecurityInfoKeys];
  [v5 addObjectsFromArray:v6];

  return (NSArray *)v5;
}

+ (NSArray)allPlatformSecurityInfoKeys
{
  if (allPlatformSecurityInfoKeys_onceToken != -1) {
    dispatch_once(&allPlatformSecurityInfoKeys_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)allPlatformSecurityInfoKeys_result;

  return (NSArray *)v2;
}

void __65__DMFFetchSecurityInformationRequest_allPlatformSecurityInfoKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"DMFSecurityPasscodeIsSetKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)allPlatformSecurityInfoKeys_result;
  allPlatformSecurityInfoKeys_result = v0;
}

+ (NSArray)iOSSecurityInfoKeys
{
  if (iOSSecurityInfoKeys_onceToken != -1) {
    dispatch_once(&iOSSecurityInfoKeys_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)iOSSecurityInfoKeys_result;

  return (NSArray *)v2;
}

void __57__DMFFetchSecurityInformationRequest_iOSSecurityInfoKeys__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"DMFSecurityPasscodeIsCompliantWithGlobalRestrictionsKey";
  v2[1] = @"DMFSecurityPasscodeIsCompliantWithProfileRestrictionsKey";
  void v2[2] = @"DMFSecurityPasscodeLockGracePeriodEnforcedKey";
  v2[3] = @"DMFSecurityPasscodeLockGracePeriodKey";
  v2[4] = @"DMFSecuritySupportsBlockLevelEncryptionKey";
  v2[5] = @"DMFSecuirtySupportsFileLevelEncryptionKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)iOSSecurityInfoKeys_result;
  iOSSecurityInfoKeys_result = v0;
}

+ (NSArray)macOSSecurityInfoKeys
{
  if (macOSSecurityInfoKeys_onceToken != -1) {
    dispatch_once(&macOSSecurityInfoKeys_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)macOSSecurityInfoKeys_result;

  return (NSArray *)v2;
}

void __59__DMFFetchSecurityInformationRequest_macOSSecurityInfoKeys__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"DMFSecurityFirmwarePasswordStatusKey";
  v2[1] = @"DMFSecurityFirewallSettingsKey";
  void v2[2] = @"DMFSecurityFullDiskEncryptionEnabledKey";
  v2[3] = @"DMFSecurityFullDiskEncryptionHasInstitutionalRecoveryKey";
  v2[4] = @"DMFSecurityFullDiskEncryptionHasPersonalRecoveryKey";
  v2[5] = @"DMFSecuritySystemIntegrityProtectionEnabledKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)macOSSecurityInfoKeys_result;
  macOSSecurityInfoKeys_result = v0;
}

+ (NSArray)tvOSSecurityInfoKeys
{
  if (tvOSSecurityInfoKeys_onceToken != -1) {
    dispatch_once(&tvOSSecurityInfoKeys_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)tvOSSecurityInfoKeys_result;

  return (NSArray *)v2;
}

void __58__DMFFetchSecurityInformationRequest_tvOSSecurityInfoKeys__block_invoke()
{
  uint64_t v0 = (void *)tvOSSecurityInfoKeys_result;
  tvOSSecurityInfoKeys_result = MEMORY[0x1E4F1CBF0];
}

+ (NSArray)watchOSSecurityInfoKeys
{
  if (watchOSSecurityInfoKeys_onceToken != -1) {
    dispatch_once(&watchOSSecurityInfoKeys_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)watchOSSecurityInfoKeys_result;

  return (NSArray *)v2;
}

void __61__DMFFetchSecurityInformationRequest_watchOSSecurityInfoKeys__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"DMFSecurityPasscodeIsCompliantWithGlobalRestrictionsKey";
  v2[1] = @"DMFSecurityPasscodeIsCompliantWithProfileRestrictionsKey";
  void v2[2] = @"DMFSecurityPasscodeLockGracePeriodEnforcedKey";
  v2[3] = @"DMFSecurityPasscodeLockGracePeriodKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)watchOSSecurityInfoKeys_result;
  watchOSSecurityInfoKeys_result = v0;
}

- (NSArray)infoKeys
{
  return self->_infoKeys;
}

- (void)setInfoKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end