@interface HealthSample
+ (BOOL)getIsICDPEnabledForDSIDWithAccountStore:(id)a3;
+ (BOOL)getPasscodeEnabled;
+ (BOOL)supportsSecureCoding;
+ (BOOL)testAccount;
+ (id)current;
+ (int)getSOSStatusWithError:(id *)a3;
+ (int64_t)getOTCliqueStatusWithContext:(id)a3 error:(id *)a4;
+ (int64_t)getWStatusWithController:(id)a3 error:(id *)a4;
+ (unint64_t)getAccountTypeWithAccountStore:(id)a3 accountManager:(id)a4;
- (BOOL)iCDPEnabledForDSID;
- (BOOL)internal;
- (BOOL)isNewerThanHealthSample:(id)a3;
- (BOOL)passcodeEnabled;
- (BOOL)sameValueAndErrorAsHealthSample:(id)a3 forType:(unint64_t)a4;
- (BOOL)testAccount;
- (HealthSample)initWithAuthKitManager:(id)a3 accountStore:(id)a4 wController:(id)a5 otConfigurationContext:(id)a6;
- (HealthSample)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSError)otCliqueStatusError;
- (NSError)sosStatusError;
- (NSError)wAvailableError;
- (NSString)build;
- (id)errorForType:(unint64_t)a3;
- (id)stateForType:(unint64_t)a3;
- (int)sosStatus;
- (int64_t)otCliqueStatus;
- (int64_t)wAvailable;
- (unint64_t)accountSecurityLevel;
- (void)encodeWithCoder:(id)a3;
- (void)logErrors;
- (void)setAccountSecurityLevel:(unint64_t)a3;
- (void)setBuild:(id)a3;
- (void)setICDPEnabledForDSID:(BOOL)a3;
- (void)setInternal:(BOOL)a3;
- (void)setOtCliqueStatus:(int64_t)a3;
- (void)setOtCliqueStatusError:(id)a3;
- (void)setPasscodeEnabled:(BOOL)a3;
- (void)setSosStatus:(int)a3;
- (void)setSosStatusError:(id)a3;
- (void)setTestAccount:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setWAvailable:(int64_t)a3;
- (void)setWAvailableError:(id)a3;
@end

@implementation HealthSample

+ (unint64_t)getAccountTypeWithAccountStore:(id)a3 accountManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_class() && objc_opt_class())
  {
    v8 = objc_msgSend(v5, "aa_primaryAppleAccount");
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "aa_altDSID");
      if (v10)
      {
        id v16 = 0;
        v11 = [v6 authKitAccountWithAltDSID:v10 error:&v16];
        id v12 = v16;
        if (v11)
        {
          id v13 = [v6 securityLevelForAccount:v11];
        }
        else
        {
          v14 = CloudServicesLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_10000A6E8((uint64_t)v12, v14);
          }

          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return (unint64_t)v13;
}

+ (int64_t)getWStatusWithController:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v5 = [a3 walrusStatus:&v10];
  id v6 = v10;
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }
  if (v7) {
    int64_t v8 = -1;
  }
  else {
    int64_t v8 = v5 == (id)1;
  }

  return v8;
}

+ (int64_t)getOTCliqueStatusWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)OTClique) initWithContextData:v5];

  id v7 = [v6 fetchCliqueStatus:a4];
  return (int64_t)v7;
}

+ (int)getSOSStatusWithError:(id *)a3
{
  int v4 = SOSCCThisDeviceIsInCircle();
  *a3 = 0;
  return v4;
}

+ (BOOL)testAccount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"_AKAddTestAccountHeader"];

  return v3;
}

+ (BOOL)getIsICDPEnabledForDSIDWithAccountStore:(id)a3
{
  unsigned __int8 v3 = objc_msgSend(a3, "aa_primaryAppleAccount");
  int v4 = [v3 accountProperties];
  id v5 = [v4 objectForKeyedSubscript:@"personID"];

  LOBYTE(v4) = +[CDPAccount isICDPEnabledForDSID:v5];
  return (char)v4;
}

+ (BOOL)getPasscodeEnabled
{
  v2 = (void *)MGCopyAnswer();
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (HealthSample)initWithAuthKitManager:(id)a3 accountStore:(id)a4 wController:(id)a5 otConfigurationContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)HealthSample;
  v14 = [(HealthSample *)&v30 init];
  if (v14)
  {
    uint64_t v15 = +[NSDate date];
    timestamp = v14->_timestamp;
    v14->_timestamp = (NSDate *)v15;

    v14->_internal = os_variant_has_internal_diagnostics();
    v17 = (void *)_CFCopySystemVersionDictionary();
    uint64_t v18 = [v17 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
    build = v14->_build;
    v14->_build = (NSString *)v18;

    v14->_accountSecurityLevel = +[HealthSample getAccountTypeWithAccountStore:v11 accountManager:v10];
    v14->_wAvailable = -1;
    id obj = 0;
    int64_t v20 = +[HealthSample getWStatusWithController:v12 error:&obj];
    id v21 = obj;
    v14->_wAvailable = v20;
    objc_storeStrong((id *)&v14->_wAvailableError, v21);
    id v28 = 0;
    int64_t v22 = +[HealthSample getOTCliqueStatusWithContext:v13 error:&v28];
    id v23 = v28;
    v14->_otCliqueStatus = v22;
    objc_storeStrong((id *)&v14->_otCliqueStatusError, v23);
    id v27 = 0;
    unsigned int v24 = +[HealthSample getSOSStatusWithError:&v27];
    id v25 = v27;
    v14->_sosStatus = v24;
    objc_storeStrong((id *)&v14->_sosStatusError, v25);
    v14->_testAccount = +[HealthSample testAccount];
    v14->_iCDPEnabledForDSID = +[HealthSample getIsICDPEnabledForDSIDWithAccountStore:v11];
    v14->_passcodeEnabled = +[HealthSample getPasscodeEnabled];
  }
  return v14;
}

- (void)logErrors
{
  unsigned __int8 v3 = +[CloudServicesAnalytics logger];
  int v4 = [(HealthSample *)self wAvailableError];
  [v3 logResultForEvent:@"WAvailable" hardFailure:1 result:v4 withAttributes:0];

  id v5 = +[CloudServicesAnalytics logger];
  id v6 = [(HealthSample *)self otCliqueStatusError];
  [v5 logResultForEvent:@"OTCliqueStatus" hardFailure:1 result:v6 withAttributes:0];

  id v8 = +[CloudServicesAnalytics logger];
  id v7 = [(HealthSample *)self sosStatusError];
  [v8 logResultForEvent:@"SOSStatus" hardFailure:1 result:v7 withAttributes:0];
}

+ (id)current
{
  v2 = [HealthSample alloc];
  unsigned __int8 v3 = +[AKAccountManager sharedInstance];
  int v4 = +[ACAccountStore defaultStore];
  id v5 = objc_alloc_init((Class)CDPWalrusStateController);
  id v6 = objc_alloc_init((Class)OTConfigurationContext);
  id v7 = [(HealthSample *)v2 initWithAuthKitManager:v3 accountStore:v4 wController:v5 otConfigurationContext:v6];

  return v7;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)internal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (unint64_t)accountSecurityLevel
{
  return self->_accountSecurityLevel;
}

- (void)setAccountSecurityLevel:(unint64_t)a3
{
  self->_accountSecurityLevel = a3;
}

- (int64_t)wAvailable
{
  return self->_wAvailable;
}

- (void)setWAvailable:(int64_t)a3
{
  self->_wAvailable = a3;
}

- (NSError)wAvailableError
{
  return self->_wAvailableError;
}

- (void)setWAvailableError:(id)a3
{
}

- (int64_t)otCliqueStatus
{
  return self->_otCliqueStatus;
}

- (void)setOtCliqueStatus:(int64_t)a3
{
  self->_otCliqueStatus = a3;
}

- (NSError)otCliqueStatusError
{
  return self->_otCliqueStatusError;
}

- (void)setOtCliqueStatusError:(id)a3
{
}

- (int)sosStatus
{
  return self->_sosStatus;
}

- (void)setSosStatus:(int)a3
{
  self->_sosStatus = a3;
}

- (NSError)sosStatusError
{
  return self->_sosStatusError;
}

- (void)setSosStatusError:(id)a3
{
}

- (BOOL)testAccount
{
  return self->_testAccount;
}

- (void)setTestAccount:(BOOL)a3
{
  self->_testAccount = a3;
}

- (BOOL)iCDPEnabledForDSID
{
  return self->_iCDPEnabledForDSID;
}

- (void)setICDPEnabledForDSID:(BOOL)a3
{
  self->_iCDPEnabledForDSID = a3;
}

- (BOOL)passcodeEnabled
{
  return self->_passcodeEnabled;
}

- (void)setPasscodeEnabled:(BOOL)a3
{
  self->_passcodeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosStatusError, 0);
  objc_storeStrong((id *)&self->_otCliqueStatusError, 0);
  objc_storeStrong((id *)&self->_wAvailableError, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HealthSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HealthSample;
  id v5 = [(HealthSample *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v5->_internal = [v4 decodeBoolForKey:@"internal"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    build = v5->_build;
    v5->_build = (NSString *)v8;

    v5->_accountSecurityLevel = (unint64_t)[v4 decodeIntegerForKey:@"accountSecurityLevel"];
    v5->_wAvailable = (int64_t)[v4 decodeIntegerForKey:@"wAvailable"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wAvailableError"];
    wAvailableError = v5->_wAvailableError;
    v5->_wAvailableError = (NSError *)v10;

    v5->_otCliqueStatus = (int64_t)[v4 decodeIntegerForKey:@"otCliqueStatus"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otCliqueStatusError"];
    otCliqueStatusError = v5->_otCliqueStatusError;
    v5->_otCliqueStatusError = (NSError *)v12;

    v5->_sosStatus = [v4 decodeIntForKey:@"sosStatus"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sosStatusError"];
    sosStatusError = v5->_sosStatusError;
    v5->_sosStatusError = (NSError *)v14;

    v5->_testAccount = [v4 decodeBoolForKey:@"testAccount"];
    v5->_iCDPEnabledForDSID = [v4 decodeBoolForKey:@"iCDPEnabledForDSID"];
    v5->_passcodeEnabled = [v4 decodeBoolForKey:@"passcodeEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(HealthSample *)self timestamp];
  [v9 encodeObject:v4 forKey:@"timestamp"];

  objc_msgSend(v9, "encodeBool:forKey:", -[HealthSample internal](self, "internal"), @"internal");
  id v5 = [(HealthSample *)self build];
  [v9 encodeObject:v5 forKey:@"build"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[HealthSample accountSecurityLevel](self, "accountSecurityLevel"), @"accountSecurityLevel");
  objc_msgSend(v9, "encodeInteger:forKey:", -[HealthSample wAvailable](self, "wAvailable"), @"wAvailable");
  uint64_t v6 = [(HealthSample *)self wAvailableError];
  [v9 encodeObject:v6 forKey:@"wAvailableError"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[HealthSample otCliqueStatus](self, "otCliqueStatus"), @"otCliqueStatus");
  id v7 = [(HealthSample *)self otCliqueStatusError];
  [v9 encodeObject:v7 forKey:@"otCliqueStatusError"];

  objc_msgSend(v9, "encodeInt:forKey:", -[HealthSample sosStatus](self, "sosStatus"), @"sosStatus");
  uint64_t v8 = [(HealthSample *)self sosStatusError];
  [v9 encodeObject:v8 forKey:@"sosStatusError"];

  objc_msgSend(v9, "encodeBool:forKey:", -[HealthSample testAccount](self, "testAccount"), @"testAccount");
  objc_msgSend(v9, "encodeBool:forKey:", -[HealthSample iCDPEnabledForDSID](self, "iCDPEnabledForDSID"), @"iCDPEnabledForDSID");
  objc_msgSend(v9, "encodeBool:forKey:", -[HealthSample passcodeEnabled](self, "passcodeEnabled"), @"passcodeEnabled");
}

- (id)stateForType:(unint64_t)a3
{
  if (a3 - 3 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_1000107A0 + a3 - 3);
  }
  return [(HealthSample *)self valueForKeyPath:v3];
}

- (id)errorForType:(unint64_t)a3
{
  id v4 = sub_1000088B4(a3);
  id v5 = [(HealthSample *)self valueForKeyPath:v4];

  return v5;
}

- (BOOL)sameValueAndErrorAsHealthSample:(id)a3 forType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(HealthSample *)self stateForType:a4];
  uint64_t v8 = [v6 stateForType:a4];
  unsigned __int8 v20 = [v7 isEqualToNumber:v8];
  id v9 = [(HealthSample *)self errorForType:a4];
  uint64_t v10 = [v6 errorForType:a4];

  id v11 = [v9 code];
  id v12 = [v10 code];
  id v13 = [v9 domain];
  id v14 = [v13 hash];
  uint64_t v15 = [v10 domain];
  id v16 = [v15 hash];

  unsigned __int8 v17 = v20;
  if (v11 != v12) {
    unsigned __int8 v17 = 0;
  }
  if (v14 == v16) {
    BOOL v18 = v17;
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isNewerThanHealthSample:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  id v5 = [(HealthSample *)self timestamp];
  id v6 = [v4 timestamp];

  id v7 = [v5 compare:v6];
  return v7 != (id)-1;
}

@end