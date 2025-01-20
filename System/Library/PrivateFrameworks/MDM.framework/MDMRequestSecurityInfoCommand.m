@interface MDMRequestSecurityInfoCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestSecurityInfoCommand

+ (id)requestType
{
  return @"SecurityInfo";
}

+ (unint64_t)requiredAccessRights
{
  return 1024;
}

+ (id)request
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  v3 = objc_opt_new();
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDMRequestSecurityInfoCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  objc_super v4 = (void (**)(id, void *))a4;
  v5 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  v6 = [MEMORY[0x263F53BC0] currentDevice];
  v7 = [MEMORY[0x263F53C50] sharedConnection];
  v8 = objc_opt_new();
  unsigned int v9 = [v6 supportsBlockLevelEncryption];
  if ([v6 supportsFileLevelEncryption]) {
    uint64_t v10 = v9 | 2;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = [NSNumber numberWithInt:v10];
  [v8 setObject:v11 forKey:@"HardwareEncryptionCaps"];

  v12 = [MEMORY[0x263F52810] sharedConfiguration];
  uint64_t v13 = [v12 isUserEnrollment];

  v27 = @"IsUserEnrollment";
  v14 = [NSNumber numberWithBool:v13];
  v28[0] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [v8 setObject:v15 forKey:@"ManagementStatus"];

  v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "currentPasscodeIsCompliantWithGlobalRestrictionsOutError:", 0));
  [v8 setObject:v16 forKey:@"PasscodeCompliant"];

  if ((v13 & 1) == 0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isPasscodeSet"));
    [v8 setObject:v17 forKey:@"PasscodePresent"];

    v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "currentPasscodeIsCompliantWithProfileRestrictionsOutError:", 0));
    [v8 setObject:v18 forKey:@"PasscodeCompliantWithProfiles"];

    v19 = NSNumber;
    uint64_t v20 = *MEMORY[0x263F539E0];
    v21 = [v7 effectiveValueForSetting:*MEMORY[0x263F539E0]];
    v22 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue"));
    [v8 setObject:v22 forKey:@"PasscodeLockGracePeriodEnforced"];

    v23 = NSNumber;
    v24 = [v7 userValueForSetting:v20];
    v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "unsignedIntegerValue"));
    [v8 setObject:v25 forKey:@"PasscodeLockGracePeriod"];

    if ([MEMORY[0x263F38BA0] isSharediPad])
    {
      v26 = [v7 effectiveValueForSetting:*MEMORY[0x263F53798]];
      [v8 setObject:v26 forKey:@"AutoLockTime"];
    }
  }
  [v5 setObject:v8 forKey:@"SecurityInfo"];
  v4[2](v4, v5);
}

@end