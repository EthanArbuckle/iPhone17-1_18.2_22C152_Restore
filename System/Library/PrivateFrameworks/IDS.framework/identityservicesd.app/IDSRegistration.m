@interface IDSRegistration
- (BOOL)_keychain_isEqual:(id)a3;
- (BOOL)canRegister;
- (BOOL)canSendRegistration;
- (BOOL)didRegisterWithDeviceSignature;
- (BOOL)didRegisterWithKTAccountKey;
- (BOOL)hasSentinel;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsMigration;
- (BOOL)needsProvisioning;
- (BOOL)needsRenewal;
- (BOOL)removeFromKeychain;
- (BOOL)runningSimpleAuthentication;
- (BOOL)saveToKeychain;
- (BOOL)shouldAutoRegisterAllHandles;
- (BOOL)shouldRegisterUsingDSHandle;
- (BOOL)stopAtAuthentication;
- (FTPasswordManager)passwordManager;
- (IDSRegistration)init;
- (IDSRegistration)initWithDictionary:(id)a3;
- (IDSRegistration)initWithPasswordManager:(id)a3;
- (NSArray)adHocServiceNames;
- (NSArray)candidateEmails;
- (NSArray)confirmedEmails;
- (NSArray)dependentRegistrations;
- (NSArray)emailsToRegister;
- (NSArray)keyTransparencyEnrolledURIs;
- (NSArray)uris;
- (NSArray)vettedEmails;
- (NSData)authenticationCert;
- (NSData)pushToken;
- (NSData)registrationCert;
- (NSDate)dependentRegistrationsTTL;
- (NSDate)nextRegistrationDate;
- (NSDate)registrationDate;
- (NSDictionary)contextInfo;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)migrationContext;
- (NSDictionary)regionServerContext;
- (NSMutableArray)_candidateEmails;
- (NSNumber)IDSVersion;
- (NSNumber)applicationVersion;
- (NSNumber)dependentRegistrationAuthRetries;
- (NSNumber)dependentRegistrationResponseCode;
- (NSNumber)identityVersion;
- (NSNumber)isCDMA;
- (NSString)authenticationToken;
- (NSString)deviceName;
- (NSString)dsHandle;
- (NSString)email;
- (NSString)environment;
- (NSString)guid;
- (NSString)idsUserID;
- (NSString)keyPairSignature;
- (NSString)mainID;
- (NSString)phoneNumber;
- (NSString)profileID;
- (NSString)regionBasePhoneNumber;
- (NSString)regionID;
- (NSString)serviceIdentifier;
- (NSString)serviceType;
- (NSString)temporaryPhoneEmail;
- (NSString)userID;
- (NSString)userUniqueIdentifier;
- (id)_keychain_comparisonValue;
- (id)_user;
- (id)_userID;
- (id)_userStore;
- (id)debugDescription;
- (id)description;
- (int)absintheRetries;
- (int)registrationType;
- (int)retries;
- (int64_t)registrationStatus;
- (unint64_t)optedIntoKT;
- (void)addCandidateEmail:(id)a3;
- (void)removeCandidateEmail:(id)a3;
- (void)setAbsintheRetries:(int)a3;
- (void)setAdHocServiceNames:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAuthenticationCert:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setDSHandle:(id)a3;
- (void)setDependentRegistrationAuthRetries:(id)a3;
- (void)setDependentRegistrationResponseCode:(id)a3;
- (void)setDependentRegistrations:(id)a3;
- (void)setDependentRegistrationsTTL:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDidRegisterWithDeviceSignature:(BOOL)a3;
- (void)setDidRegisterWithKTAccountKey:(BOOL)a3;
- (void)setEmail:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setIDSVersion:(id)a3;
- (void)setIdentityVersion:(id)a3;
- (void)setIdsUserID:(id)a3;
- (void)setIsCDMA:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setKeyPairSignature:(id)a3;
- (void)setKeyTransparencyEnrolledURIs:(id)a3;
- (void)setMainID:(id)a3;
- (void)setMigrationContext:(id)a3;
- (void)setNeedsMigration:(BOOL)a3;
- (void)setNeedsProvisioning:(BOOL)a3;
- (void)setNeedsRenewal:(BOOL)a3;
- (void)setNextRegistrationDate:(id)a3;
- (void)setOptedIntoKT:(unint64_t)a3;
- (void)setPasswordManager:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRegionBasePhoneNumber:(id)a3;
- (void)setRegionID:(id)a3;
- (void)setRegionServerContext:(id)a3;
- (void)setRegistrationCert:(id)a3;
- (void)setRegistrationDate:(id)a3;
- (void)setRegistrationStatus:(int64_t)a3;
- (void)setRegistrationType:(int)a3;
- (void)setRetries:(int)a3;
- (void)setRunningSimpleAuthentication:(BOOL)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setShouldAutoRegisterAllHandles:(BOOL)a3;
- (void)setShouldRegisterUsingDSHandle:(BOOL)a3;
- (void)setTemporaryPhoneEmail:(id)a3;
- (void)setUris:(id)a3;
- (void)setUserUniqueIdentifier:(id)a3;
- (void)setVettedEmails:(id)a3;
- (void)set_candidateEmails:(id)a3;
- (void)voidAuthenticationTokenAllowingGracePeriod;
- (void)voidPassword;
@end

@implementation IDSRegistration

- (BOOL)_keychain_isEqual:(id)a3
{
  id v4 = a3;
  if (![(IDSRegistration *)self isEqual:v4])
  {
    v6 = [(IDSRegistration *)self serviceType];
    uint64_t v7 = [v4 serviceType];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(IDSRegistration *)self serviceType];
      v10 = [v4 serviceType];
      unsigned int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    unsigned int v12 = [(IDSRegistration *)self registrationType];
    if (v12 == [v4 registrationType])
    {
      v13 = [(IDSRegistration *)self _keychain_comparisonValue];
      v14 = objc_msgSend(v4, "_keychain_comparisonValue");
      unsigned __int8 v5 = [v13 isEqualToString:v14];

      goto LABEL_10;
    }
LABEL_9:
    unsigned __int8 v5 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v5 = 1;
LABEL_10:

  return v5;
}

- (id)_keychain_comparisonValue
{
  unsigned int v3 = [(IDSRegistration *)self registrationType];
  if (v3)
  {
    if (v3 == 2)
    {
      uint64_t v4 = [(IDSRegistration *)self userUniqueIdentifier];
      goto LABEL_9;
    }
    if (v3 == 1)
    {
      uint64_t v4 = [(IDSRegistration *)self email];
LABEL_9:
      v8 = (__CFString *)v4;
      goto LABEL_11;
    }
    v8 = 0;
  }
  else
  {
    uint64_t v5 = [(IDSRegistration *)self userUniqueIdentifier];
    v6 = (void *)v5;
    uint64_t v7 = @"phone-number-registration";
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    v8 = v7;
  }
LABEL_11:

  return v8;
}

- (IDSRegistration)initWithPasswordManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSRegistration;
  v6 = [(IDSRegistration *)&v10 init];
  if (v6)
  {
    uint64_t v7 = +[NSString stringGUID];
    guid = v6->_guid;
    v6->_guid = (NSString *)v7;

    objc_storeStrong((id *)&v6->_passwordManager, a3);
  }

  return v6;
}

- (IDSRegistration)init
{
  unsigned int v3 = +[FTPasswordManager sharedInstance];
  uint64_t v4 = [(IDSRegistration *)self initWithPasswordManager:v3];

  return v4;
}

- (IDSRegistration)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSRegistration *)self init];

  if (!v5) {
    goto LABEL_40;
  }
  if (!v4 || ![v4 count]) {
    goto LABEL_39;
  }
  id v6 = [v4 objectForKey:@"push-token"];
  if (_IDSRunningInDaemon() && v6)
  {
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1007220B8();
    }
  }
  else if (!v6)
  {
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  objc_storeStrong((id *)&v5->_pushToken, v6);

  id v6 = [v4 objectForKey:@"registration-date"];
  if (_IDSRunningInDaemon() && v6)
  {
    v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100722014();
    }
  }
  else if (!v6)
  {
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
LABEL_18:
  objc_storeStrong((id *)&v5->_registrationDate, v6);

  id v6 = [v4 objectForKey:@"next-registration-date"];
  if (_IDSRunningInDaemon() && v6)
  {
    v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100721F70();
    }
  }
  else if (!v6)
  {
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
LABEL_25:
  objc_storeStrong((id *)&v5->_nextRegistrationDate, v6);

  id v6 = [v4 objectForKey:@"needs-renewal"];
  if (_IDSRunningInDaemon() && v6)
  {
    objc_super v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100721ECC();
    }

LABEL_31:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_32;
    }
LABEL_37:
    int v13 = 1;
    goto LABEL_38;
  }
  if (v6) {
    goto LABEL_31;
  }
LABEL_32:
  id v6 = v6;

  -[IDSRegistration setNeedsRenewal:](v5, "setNeedsRenewal:", [v6 BOOLValue]);
  unsigned int v11 = [v4 objectForKey:@"invitation-version"];
  if (_IDSRunningInDaemon() && v11)
  {
    unsigned int v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100721E28();
    }
  }
  else if (!v11)
  {
    goto LABEL_193;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
  objc_storeStrong((id *)&v5->_applicationVersion, v11);

  unsigned int v11 = [v4 objectForKey:@"ids-version"];
  if (_IDSRunningInDaemon() && v11)
  {
    v16 = +[IMRGLog registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100721D84();
    }
  }
  else if (!v11)
  {
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_51:
  objc_storeStrong((id *)&v5->_IDSVersion, v11);

  unsigned int v11 = [v4 objectForKey:@"identity-version"];
  if (_IDSRunningInDaemon() && v11)
  {
    v17 = +[IMRGLog registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100721CE0();
    }
  }
  else if (!v11)
  {
    goto LABEL_58;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_58:
  objc_storeStrong((id *)&v5->_identityVersion, v11);

  unsigned int v11 = [v4 objectForKey:@"cdma"];
  if (_IDSRunningInDaemon() && v11)
  {
    v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100721C3C();
    }
  }
  else if (!v11)
  {
    goto LABEL_65;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_65:
  objc_storeStrong((id *)&v5->_isC2K, v11);

  unsigned int v11 = [v4 objectForKey:@"identity-rsa-pair-signature"];
  _IDSRunningInDaemon();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_193;
    }
  }
  objc_storeStrong((id *)&v5->_keyPairSignature, v11);

  unsigned int v11 = [v4 objectForKey:@"environment"];
  if (_IDSRunningInDaemon() && v11)
  {
    v19 = +[IMRGLog registration];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100721B98();
    }
  }
  else if (!v11)
  {
    goto LABEL_193;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
  objc_storeStrong((id *)&v5->_environment, v11);

  unsigned int v11 = [v4 objectForKey:@"main-id"];
  if (_IDSRunningInDaemon() && v11)
  {
    v20 = +[IMRGLog registration];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100721AF4();
    }
  }
  else if (!v11)
  {
    goto LABEL_193;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
  objc_storeStrong((id *)&v5->_mainID, v11);

  unsigned int v11 = [v4 objectForKey:@"temporary-phone-email"];
  if (_IDSRunningInDaemon() && v11)
  {
    v21 = +[IMRGLog registration];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100721A50();
    }
  }
  else if (!v11)
  {
    goto LABEL_88;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_88:
  objc_storeStrong((id *)&v5->_temporaryPhoneEmail, v11);

  unsigned int v11 = [v4 objectForKey:@"profile-id"];
  if (_IDSRunningInDaemon() && v11)
  {
    v22 = +[IMRGLog registration];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1007219AC();
    }
  }
  else if (!v11)
  {
    goto LABEL_95;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_95:
  objc_storeStrong((id *)&v5->_profileID, v11);

  unsigned int v11 = [v4 objectForKey:@"device-name"];
  if (_IDSRunningInDaemon() && v11)
  {
    v23 = +[IMRGLog registration];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100721908();
    }
  }
  else if (!v11)
  {
    goto LABEL_102;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_102:
  objc_storeStrong((id *)&v5->_deviceName, v11);

  unsigned int v11 = [v4 objectForKey:@"region-id"];
  if (_IDSRunningInDaemon() && v11)
  {
    v24 = +[IMRGLog registration];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100721864();
    }
  }
  else if (!v11)
  {
    goto LABEL_109;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_109:
  objc_storeStrong((id *)&v5->_regionID, v11);

  unsigned int v11 = [v4 objectForKey:@"region-base-phone-number"];
  if (_IDSRunningInDaemon() && v11)
  {
    v25 = +[IMRGLog registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1007217C0();
    }
  }
  else if (!v11)
  {
    goto LABEL_116;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_116:
  objc_storeStrong((id *)&v5->_regionBasePhoneNumber, v11);

  unsigned int v11 = [v4 objectForKey:@"region-server-context"];
  if (_IDSRunningInDaemon() && v11)
  {
    v26 = +[IMRGLog registration];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10072171C();
    }
  }
  else if (!v11)
  {
    goto LABEL_123;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_123:
  objc_storeStrong((id *)&v5->_regionServerContext, v11);

  unsigned int v11 = [v4 objectForKey:@"dependant-registrations"];
  _IDSRunningInDaemon();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_193;
    }
  }
  objc_storeStrong((id *)&v5->_dependentRegistrations, v11);

  unsigned int v11 = [v4 objectForKey:@"self-handle"];
  if (_IDSRunningInDaemon() && v11)
  {
    v27 = +[IMRGLog registration];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100721678();
    }
  }
  else if (!v11)
  {
    goto LABEL_132;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_132:
  objc_storeStrong((id *)&v5->_dsHandle, v11);

  unsigned int v11 = [v4 objectForKey:@"dependant-registrations-ttl"];
  if (_IDSRunningInDaemon() && v11)
  {
    v28 = +[IMRGLog registration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_1007215D4();
    }
  }
  else if (!v11)
  {
    goto LABEL_139;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_139:
  objc_storeStrong((id *)&v5->_dependentRegistrationsTTL, v11);

  unsigned int v11 = [v4 objectForKey:@"dependant-registrations-response-code"];
  if (_IDSRunningInDaemon() && v11)
  {
    v29 = +[IMRGLog registration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_100721530();
    }
  }
  else if (!v11)
  {
    goto LABEL_146;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_146:
  objc_storeStrong((id *)&v5->_dependentRegistrationResponseCode, v11);

  unsigned int v11 = [v4 objectForKey:@"dependant-registrations-auth-retries"];
  if (_IDSRunningInDaemon() && v11)
  {
    v30 = +[IMRGLog registration];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10072148C();
    }
  }
  else if (!v11)
  {
    goto LABEL_153;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_153:
  objc_storeStrong((id *)&v5->_dependentRegistrationAuthRetries, v11);

  unsigned int v11 = [v4 objectForKey:@"uris"];
  if (_IDSRunningInDaemon() && v11)
  {
    v31 = +[IMRGLog registration];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_1007213E8();
    }
  }
  else if (!v11)
  {
    goto LABEL_160;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_160:
  objc_storeStrong((id *)&v5->_uris, v11);

  unsigned int v11 = [v4 objectForKey:@"kt-uris"];
  if (_IDSRunningInDaemon() && v11)
  {
    v32 = +[IMRGLog registration];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_100721344();
    }
  }
  else if (!v11)
  {
    goto LABEL_167;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_167:
  objc_storeStrong((id *)&v5->_keyTransparencyEnrolledURIs, v11);

  unsigned int v11 = [v4 objectForKey:@"ids-user-id"];
  if (_IDSRunningInDaemon() && v11)
  {
    v33 = +[IMRGLog registration];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_1007212A0();
    }
  }
  else if (!v11)
  {
    goto LABEL_174;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_193;
  }
LABEL_174:
  objc_storeStrong((id *)&v5->_idsUserID, v11);

  unsigned int v11 = [v4 objectForKey:@"ids-registration-cert"];
  if (_IDSRunningInDaemon() && v11)
  {
    v34 = +[IMRGLog registration];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_1007211E0();
    }

LABEL_180:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_193;
    }
    goto LABEL_181;
  }
  if (v11) {
    goto LABEL_180;
  }
LABEL_181:
  p_registrationCert = (void **)&v5->_registrationCert;
  objc_storeStrong((id *)&v5->_registrationCert, v11);

  unsigned int v11 = [v4 objectForKey:@"ids-authentication-cert"];
  if (_IDSRunningInDaemon() && v11)
  {
    v35 = +[IMRGLog registration];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_100721120();
    }
  }
  else if (!v11)
  {
LABEL_188:
    id v36 = v11;

    v37 = [v4 objectForKey:@"auth-token"];
    if (_IDSRunningInDaemon() && v37)
    {
      v38 = +[IMRGLog registration];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        sub_10072107C();
      }
    }
    else if (!v37)
    {
      goto LABEL_197;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v13 = 1;
LABEL_226:

      unsigned int v11 = v6;
      id v6 = v36;
      goto LABEL_194;
    }
LABEL_197:
    id v39 = v37;

    v40 = [v4 objectForKey:@"user-unique-identifier"];
    if (_IDSRunningInDaemon() && v40)
    {
      v41 = +[IMRGLog registration];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_100720FD8();
      }
    }
    else if (!v40)
    {
      goto LABEL_205;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_224;
    }
LABEL_205:
    objc_storeStrong((id *)&v5->_userUniqueIdentifier, v40);

    v40 = [v4 objectForKey:@"context-info"];
    if (_IDSRunningInDaemon() && v40)
    {
      v42 = +[IMRGLog registration];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        sub_100720F34();
      }
    }
    else if (!v40)
    {
LABEL_212:
      objc_storeStrong((id *)&v5->_contextInfo, v40);

      v40 = [v4 objectForKey:@"type"];
      if (_IDSRunningInDaemon() && v40)
      {
        v43 = +[IMRGLog registration];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          sub_100720E90();
        }
      }
      else if (!v40)
      {
        goto LABEL_224;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v44 = v40;

        id v83 = v44;
        -[IDSRegistration setRegistrationType:](v5, "setRegistrationType:", [v44 intValue]);
        v45 = [v4 objectForKey:@"service"];
        if (_IDSRunningInDaemon() && v45)
        {
          v46 = +[IMRGLog registration];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            sub_100720DEC();
          }
        }
        else if (!v45)
        {
          goto LABEL_234;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v84 = v45;

          id obj = [v4 objectForKey:@"service-identifier"];
          if (_IDSRunningInDaemon() && obj)
          {
            v47 = +[IMRGLog registration];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              sub_100720D48();
            }
          }
          else if (!obj)
          {
LABEL_237:
            objc_storeStrong((id *)&v5->_serviceIdentifier, obj);

            id obj = [v4 objectForKey:@"did-reg-with-kt-account-key"];
            if (_IDSRunningInDaemon() && obj)
            {
              v48 = +[IMRGLog registration];
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
                sub_100720CA4();
              }
            }
            else if (!obj)
            {
LABEL_244:
              id v49 = obj;

              id obj = v49;
              -[IDSRegistration setDidRegisterWithKTAccountKey:](v5, "setDidRegisterWithKTAccountKey:", [v49 BOOLValue]);
              v82 = [v4 objectForKey:@"did-reg-with-kt-device-signature"];
              if (_IDSRunningInDaemon() && v82)
              {
                v50 = +[IMRGLog registration];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
                  sub_100720C00();
                }
              }
              else if (!v82)
              {
                goto LABEL_252;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                int v13 = 1;
LABEL_321:

                goto LABEL_322;
              }
LABEL_252:
              id v51 = v82;

              v82 = v51;
              -[IDSRegistration setDidRegisterWithDeviceSignature:](v5, "setDidRegisterWithDeviceSignature:", [v51 BOOLValue]);
              v81 = [v4 objectForKey:@"opted-into-kt"];
              if (_IDSRunningInDaemon() && v81)
              {
                v52 = +[IMRGLog registration];
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
                  sub_100720B5C();
                }
              }
              else if (!v81)
              {
                goto LABEL_260;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                int v13 = 1;
LABEL_320:

                goto LABEL_321;
              }
LABEL_260:
              id v53 = v81;

              v81 = v53;
              -[IDSRegistration setOptedIntoKT:](v5, "setOptedIntoKT:", (int)[v53 intValue]);
              v80 = _IDSRegistrationServiceTypeForString();
              -[IDSRegistration setServiceType:](v5, "setServiceType:");
              v54 = [(IDSRegistration *)v5 serviceIdentifier];
              if (![v54 length])
              {
                id v55 = [v80 length];

                if (!v55) {
                  goto LABEL_264;
                }
                v54 = _IDSRegistrationServiceIdentifierFromServiceType();
                [(IDSRegistration *)v5 setServiceIdentifier:v54];
              }

LABEL_264:
              if (![(NSArray *)v5->_uris count])
              {
                v56 = *p_registrationCert;
                *p_registrationCert = 0;
              }
              if (*p_registrationCert)
              {
                id v57 = 0;
                id v58 = 0;
                goto LABEL_268;
              }
              id v57 = [v4 objectForKey:@"bindings"];
              if (_IDSRunningInDaemon() && v57)
              {
                v65 = +[IMRGLog registration];
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
                  sub_100720A9C();
                }
              }
              else if (!v57)
              {
                goto LABEL_284;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                int v13 = 1;
LABEL_319:

                goto LABEL_320;
              }
LABEL_284:
              id v57 = v57;

              v87 = [v4 objectForKey:@"cert"];
              if (_IDSRunningInDaemon() && v87)
              {
                v66 = +[IMRGLog registration];
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
                  sub_1007209DC();
                }
              }
              else if (!v87)
              {
LABEL_292:
                id v58 = v87;

                if (!v58)
                {
                  v87 = v57;
                  id v57 = 0;
LABEL_270:
                  v88 = [(IDSRegistration *)v5 idsUserID];
                  if ([(IDSRegistration *)v5 registrationType])
                  {
LABEL_306:
                    v73 = +[IMRGLog registration];
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v90 = v36;
                      __int16 v91 = 2112;
                      id v92 = v88;
                      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Loaded auth cert: %@    ID: %@", buf, 0x16u);
                    }

                    if ([v36 length] && objc_msgSend(v88, "length"))
                    {
                      v74 = +[IDSRegistrationKeychainManager sharedInstance];
                      v75 = [v74 authenticationCertForID:v88];
                      id v79 = [v75 length];

                      v76 = +[IMRGLog registration];
                      BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
                      if (v79)
                      {
                        if (v77)
                        {
                          *(_DWORD *)buf = 138412290;
                          id v90 = v88;
                          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Not migrating cert for user ID, we already have one: %@", buf, 0xCu);
                        }
                      }
                      else
                      {
                        if (v77)
                        {
                          *(_DWORD *)buf = 138412290;
                          id v90 = v88;
                          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Migrating auth cert for IDS User ID: %@", buf, 0xCu);
                        }

                        v76 = +[IDSRegistrationKeychainManager sharedInstance];
                        [v76 setAuthenticationCert:v36 forID:v88];
                      }
                    }
                    int v13 = 0;
                    goto LABEL_318;
                  }
                  v59 = [(IDSRegistration *)v5 mainID];
                  if ([v39 length])
                  {
                    v60 = +[IDSRegistrationKeychainManager sharedInstance];
                    v61 = [v60 smsSignatureForID:v59];
                    id v62 = [v61 length];

                    if (!v62)
                    {
                      v63 = +[IMRGLog registration];
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        id v90 = v39;
                        __int16 v91 = 2112;
                        id v92 = v59;
                        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Migrating this SMS auth token: %@  mainID: %@", buf, 0x16u);
                      }

                      v64 = +[IDSRegistrationKeychainManager sharedInstance];
                      [v64 setSMSSignature:v39 mainID:v59];
LABEL_304:
                    }
                  }
                  else
                  {
                    if (!v59)
                    {
                      v69 = [(IDSRegistration *)v5 _user];
                      v59 = [v69 unprefixedIdentifier];

                      v70 = +[IDSRegistrationKeychainManager sharedInstance];
                      v64 = [v70 smsSignatureForID:v59];

                      v71 = +[IMRGLog registration];
                      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                      {
                        v78 = [v64 description];
                        IMTruncatedLoggingStringForString();
                        id v72 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        id v90 = v59;
                        __int16 v91 = 2112;
                        id v92 = v72;
                        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Using existing user mainID: %@   token: %@", buf, 0x16u);
                      }
                      [(IDSRegistration *)v5 setMainID:v59];
                      goto LABEL_304;
                    }
                    v67 = +[IDSRegistrationKeychainManager sharedInstance];
                    v68 = [v67 smsSignatureForID:v59];

                    if (!v68)
                    {
                      v64 = +[IMRGLog registration];
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "******** We're missing an SMS auth token, this will SMS migration register ******** ", buf, 2u);
                      }
                      goto LABEL_304;
                    }
                  }

                  goto LABEL_306;
                }
                if (![v57 count])
                {
LABEL_269:
                  v87 = v57;
                  id v57 = v58;
                  goto LABEL_270;
                }
                v5->_needsMigration = 1;
LABEL_268:
                [(IDSRegistration *)v5 setRegistrationStatus:8];
                goto LABEL_269;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                int v13 = 1;
LABEL_318:

                goto LABEL_319;
              }
              goto LABEL_292;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_244;
            }
LABEL_249:
            int v13 = 1;
LABEL_322:

            v45 = v6;
            id v6 = v36;
            goto LABEL_323;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_249;
          }
          goto LABEL_237;
        }
LABEL_234:
        int v13 = 1;
        id v84 = v36;
LABEL_323:

        v40 = v6;
        id v36 = v39;
        id v39 = v83;
        id v6 = v84;
        goto LABEL_225;
      }
LABEL_224:
      int v13 = 1;
LABEL_225:

      v37 = v6;
      id v6 = v36;
      id v36 = v39;
      goto LABEL_226;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_224;
    }
    goto LABEL_212;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_188;
  }
LABEL_193:
  int v13 = 1;
LABEL_194:

LABEL_38:
  if (!v13)
  {
LABEL_40:
    v14 = v5;
    goto LABEL_41;
  }
LABEL_39:
  v14 = 0;
LABEL_41:

  return v14;
}

- (BOOL)removeFromKeychain
{
  unsigned int v3 = +[IDSRegistrationKeychainManager sharedInstance];
  LOBYTE(self) = [v3 removeRegistration:self];

  return (char)self;
}

- (BOOL)saveToKeychain
{
  unsigned int v3 = +[IDSRegistrationKeychainManager sharedInstance];
  LOBYTE(self) = [v3 addRegistration:self];

  return (char)self;
}

- (NSArray)candidateEmails
{
  return (NSArray *)self->_candidateEmails;
}

- (void)addCandidateEmail:(id)a3
{
  id v4 = a3;
  if (IMStringIsPhoneNumber())
  {
    uint64_t v5 = IMCanonicalizeFormattedString();

    id v4 = (id)v5;
  }
  objc_msgSend(v4, "_im_normalizedURIString");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  candidateEmails = self->_candidateEmails;
  if (!candidateEmails)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8 = self->_candidateEmails;
    self->_candidateEmails = v7;

    candidateEmails = self->_candidateEmails;
  }
  if (([(NSMutableArray *)candidateEmails containsObject:v9] & 1) == 0) {
    [(NSMutableArray *)self->_candidateEmails addObject:v9];
  }
}

- (void)removeCandidateEmail:(id)a3
{
  id v4 = a3;
  if (IMStringIsPhoneNumber())
  {
    uint64_t v5 = IMCanonicalizeFormattedString();

    id v4 = (id)v5;
  }
  uint64_t v9 = objc_msgSend(v4, "_im_normalizedURIString");

  uint64_t v7 = v9;
  if (v9)
  {
    [(NSMutableArray *)self->_candidateEmails removeObject:v9];
    id v6 = [(NSMutableArray *)self->_candidateEmails count];
    uint64_t v7 = v9;
    if (!v6)
    {
      candidateEmails = self->_candidateEmails;
      self->_candidateEmails = 0;

      uint64_t v7 = v9;
    }
  }

  _objc_release_x1(v6, v7);
}

- (NSArray)confirmedEmails
{
  v2 = [(IDSRegistration *)self uris];
  unsigned int v3 = [v2 _IDsFromURIs];

  return (NSArray *)v3;
}

- (id)_userID
{
  if ([(IDSRegistration *)self registrationType]
    && [(IDSRegistration *)self registrationType] != 2
    || (unsigned int v3 = &self->_mainID, [(NSString *)self->_mainID _FZBestGuessFZIDType]))
  {
    if ([(IDSRegistration *)self registrationType] != 1
      || (mainID = self->_mainID,
          p_mainID = &self->_mainID,
          [(NSString *)mainID _FZBestGuessFZIDType] != (id)1))
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = 1;
    unsigned int v3 = p_mainID;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSString *)*v3 _IDFromFZIDType:v6];
LABEL_10:

  return v7;
}

- (NSString)userID
{
  return (NSString *)[(IDSRegistration *)self _userID];
}

- (NSString)email
{
  unsigned int v3 = [(IDSRegistration *)self registrationType];
  uint64_t v4 = 120;
  if (v3 == 2) {
    uint64_t v4 = 256;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);

  return (NSString *)v5;
}

- (void)setEmail:(id)a3
{
  id v4 = a3;
  if ([(IDSRegistration *)self registrationType] == 2) {
    [(IDSRegistration *)self setTemporaryPhoneEmail:v4];
  }
  else {
    [(IDSRegistration *)self setMainID:v4];
  }
}

- (NSString)phoneNumber
{
  return self->_mainID;
}

- (void)setRegistrationStatus:(int64_t)a3
{
  if (self->_registrationStatus != a3) {
    self->_registrationStatus = a3;
  }
}

- (void)setUserUniqueIdentifier:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_userUniqueIdentifier, a3);
  if (!self->_mainID)
  {
    uint64_t v5 = [(IDSRegistration *)self _user];
    uint64_t v6 = [v5 unprefixedIdentifier];
    mainID = self->_mainID;
    self->_mainID = v6;
  }
}

- (NSDictionary)dictionaryRepresentation
{
  unsigned int v3 = +[NSNumber numberWithInteger:self->_registrationType];
  id v4 = [(IDSRegistration *)self serviceType];
  uint64_t v5 = _StringForIDSRegistrationServiceType();

  uint64_t v6 = +[NSNumber numberWithBool:self->_didRegisterWithKTAccountKey];
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:self->_optedIntoKT];
  id v8 = +[NSNumber numberWithBool:self->_didRegisterWithDeviceSignature];
  if (!self->_registrationCert)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"ids-registration-cert";
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "keychainDictionary: nil %@", (uint8_t *)&v58, 0xCu);
    goto LABEL_34;
  }
  if (!self->_pushToken)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"push-token";
    goto LABEL_33;
  }
  if (!self->_mainID)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"main-id";
    goto LABEL_33;
  }
  if (!self->_registrationDate)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"registration-date";
    goto LABEL_33;
  }
  if (!self->_applicationVersion)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"invitation-version";
    goto LABEL_33;
  }
  if (!self->_IDSVersion)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"ids-version";
    goto LABEL_33;
  }
  if (!self->_identityVersion)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"identity-version";
    goto LABEL_33;
  }
  if (!self->_environment)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"environment";
    goto LABEL_33;
  }
  if (!v3)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v58 = 138412290;
    CFStringRef v59 = @"type";
    goto LABEL_33;
  }
  if (!v5)
  {
    unsigned int v11 = +[IMRGLog keychain];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v58 = 138412290;
      CFStringRef v59 = @"service";
      goto LABEL_33;
    }
LABEL_34:
    unsigned int v12 = 0;
    goto LABEL_35;
  }
  uint64_t v9 = +[NSMutableDictionary dictionary];
  objc_super v10 = self->_registrationCert;
  if (v10)
  {
    CFDictionarySetValue(v9, @"ids-registration-cert", v10);
  }
  else
  {
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100722514();
    }
  }
  v15 = self->_uris;
  if (v15) {
    CFDictionarySetValue(v9, @"uris", v15);
  }

  v16 = self->_keyTransparencyEnrolledURIs;
  if (v16) {
    CFDictionarySetValue(v9, @"kt-uris", v16);
  }

  v17 = self->_idsUserID;
  if (v17) {
    CFDictionarySetValue(v9, @"ids-user-id", v17);
  }

  v18 = +[NSNumber numberWithBool:self->_needsRenewal];
  if (v18) {
    CFDictionarySetValue(v9, @"needs-renewal", v18);
  }

  v19 = self->_mainID;
  if (v19)
  {
    CFDictionarySetValue(v9, @"main-id", v19);
  }
  else
  {
    id v20 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10072248C();
    }
  }
  v21 = self->_temporaryPhoneEmail;
  if (v21) {
    CFDictionarySetValue(v9, @"temporary-phone-email", v21);
  }

  v22 = self->_pushToken;
  if (v22)
  {
    CFDictionarySetValue(v9, @"push-token", v22);
  }
  else
  {
    id v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100722404();
    }
  }
  v24 = self->_registrationDate;
  if (v24)
  {
    CFDictionarySetValue(v9, @"registration-date", v24);
  }
  else
  {
    id v25 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10072237C();
    }
  }
  v26 = self->_applicationVersion;
  if (v26)
  {
    CFDictionarySetValue(v9, @"invitation-version", v26);
  }
  else
  {
    id v27 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1007222F4();
    }
  }
  v28 = self->_IDSVersion;
  if (v28)
  {
    CFDictionarySetValue(v9, @"ids-version", v28);
  }
  else
  {
    id v29 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10072226C();
    }
  }
  v30 = self->_environment;
  if (v30)
  {
    CFDictionarySetValue(v9, @"environment", v30);
  }
  else
  {
    id v31 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1007221E4();
    }
  }
  id v32 = v3;
  CFDictionarySetValue(v9, @"type", v32);

  id v33 = v5;
  CFDictionarySetValue(v9, @"service", v33);

  v34 = self->_serviceIdentifier;
  if (v34)
  {
    CFDictionarySetValue(v9, @"service-identifier", v34);
  }
  else
  {
    id v35 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10072215C();
    }
  }
  id v36 = self->_identityVersion;
  if (v36) {
    CFDictionarySetValue(v9, @"identity-version", v36);
  }

  v37 = self->_profileID;
  if (v37) {
    CFDictionarySetValue(v9, @"profile-id", v37);
  }

  v38 = self->_keyPairSignature;
  if (v38) {
    CFDictionarySetValue(v9, @"identity-rsa-pair-signature", v38);
  }

  id v39 = self->_nextRegistrationDate;
  if (v39) {
    CFDictionarySetValue(v9, @"next-registration-date", v39);
  }

  v40 = self->_dsHandle;
  if (v40) {
    CFDictionarySetValue(v9, @"self-handle", v40);
  }

  v41 = self->_dependentRegistrationsTTL;
  if (v41) {
    CFDictionarySetValue(v9, @"dependant-registrations-ttl", v41);
  }

  v42 = self->_dependentRegistrationResponseCode;
  if (v42) {
    CFDictionarySetValue(v9, @"dependant-registrations-response-code", v42);
  }

  v43 = self->_dependentRegistrationAuthRetries;
  if (v43) {
    CFDictionarySetValue(v9, @"dependant-registrations-auth-retries", v43);
  }

  id v44 = self->_userUniqueIdentifier;
  if (v44) {
    CFDictionarySetValue(v9, @"user-unique-identifier", v44);
  }

  v45 = self->_contextInfo;
  if (v45) {
    CFDictionarySetValue(v9, @"context-info", v45);
  }

  if (![(IDSRegistration *)self registrationType])
  {
    v46 = self->_isC2K;
    if (v46) {
      CFDictionarySetValue(v9, @"cdma", v46);
    }
  }
  v47 = self->_deviceName;
  if (v47) {
    CFDictionarySetValue(v9, @"device-name", v47);
  }

  v48 = self->_regionID;
  if (v48) {
    CFDictionarySetValue(v9, @"region-id", v48);
  }

  id v49 = self->_regionBasePhoneNumber;
  if (v49) {
    CFDictionarySetValue(v9, @"region-base-phone-number", v49);
  }

  v50 = self->_regionServerContext;
  if (v50) {
    CFDictionarySetValue(v9, @"region-server-context", v50);
  }

  id v51 = self->_dependentRegistrations;
  if (v51) {
    CFDictionarySetValue(v9, @"dependant-registrations", v51);
  }

  id v52 = v6;
  if (v52) {
    CFDictionarySetValue(v9, @"did-reg-with-kt-account-key", v52);
  }

  id v53 = v8;
  if (v53) {
    CFDictionarySetValue(v9, @"did-reg-with-kt-device-signature", v53);
  }

  id v54 = v7;
  if (v54) {
    CFDictionarySetValue(v9, @"opted-into-kt", v54);
  }

  if (!self->_deviceName)
  {
    id v55 = +[FTDeviceSupport sharedInstance];
    v56 = [v55 deviceName];
    deviceName = self->_deviceName;
    self->_deviceName = v56;
  }
  unsigned int v11 = v9;
  unsigned int v12 = v11;
LABEL_35:

  return (NSDictionary *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)IDSRegistration;
  if ([(IDSRegistration *)&v70 isEqual:v4])
  {
    unsigned __int8 v5 = 1;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  unsigned int v6 = [(IDSRegistration *)self registrationType];
  if (v6 != [v4 registrationType]) {
    goto LABEL_40;
  }
  uint64_t v7 = [(IDSRegistration *)self serviceType];
  uint64_t v8 = [v4 serviceType];
  if (v7 == (void *)v8)
  {
  }
  else
  {
    uint64_t v9 = (void *)v8;
    objc_super v10 = [(IDSRegistration *)self serviceType];
    unsigned int v11 = [v4 serviceType];
    unsigned int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_40;
    }
  }
  int v13 = [(IDSRegistration *)self pushToken];
  uint64_t v14 = [v4 pushToken];
  if (v13 == (void *)v14)
  {
  }
  else
  {
    v15 = (void *)v14;
    v16 = [(IDSRegistration *)self pushToken];
    v17 = [v4 pushToken];
    unsigned int v18 = [v16 isEqualToData:v17];

    if (!v18) {
      goto LABEL_40;
    }
  }
  v19 = [(IDSRegistration *)self environment];
  uint64_t v20 = [v4 environment];
  if (v19 == (void *)v20)
  {
  }
  else
  {
    v21 = (void *)v20;
    v22 = [(IDSRegistration *)self environment];
    id v23 = [v4 environment];
    unsigned int v24 = [v22 isEqualToString:v23];

    if (!v24) {
      goto LABEL_40;
    }
  }
  id v25 = [(IDSRegistration *)self deviceName];
  uint64_t v26 = [v4 deviceName];
  if (v25 == (void *)v26)
  {
  }
  else
  {
    id v27 = (void *)v26;
    v28 = [(IDSRegistration *)self deviceName];
    id v29 = [v4 deviceName];
    unsigned int v30 = [v28 isEqualToString:v29];

    if (!v30) {
      goto LABEL_40;
    }
  }
  id v31 = [(IDSRegistration *)self mainID];
  uint64_t v32 = [v4 mainID];
  if (v31 == (void *)v32)
  {
  }
  else
  {
    id v33 = (void *)v32;
    v34 = [(IDSRegistration *)self mainID];
    id v35 = [v4 mainID];
    unsigned int v36 = [v34 isEqualToString:v35];

    if (!v36) {
      goto LABEL_40;
    }
  }
  v37 = [(IDSRegistration *)self uris];
  uint64_t v38 = [v4 uris];
  if (v37 == (void *)v38)
  {
  }
  else
  {
    id v39 = (void *)v38;
    v40 = [(IDSRegistration *)self uris];
    v41 = [v4 uris];
    unsigned int v42 = [v40 isEqualToArray:v41];

    if (!v42) {
      goto LABEL_40;
    }
  }
  v43 = [(IDSRegistration *)self candidateEmails];
  uint64_t v44 = [v4 candidateEmails];
  if (v43 == (void *)v44)
  {
  }
  else
  {
    v45 = (void *)v44;
    v46 = [(IDSRegistration *)self candidateEmails];
    v47 = [v4 candidateEmails];
    unsigned int v48 = [v46 isEqualToArray:v47];

    if (!v48) {
      goto LABEL_40;
    }
  }
  id v49 = [(IDSRegistration *)self confirmedEmails];
  uint64_t v50 = [v4 confirmedEmails];
  if (v49 == (void *)v50)
  {
  }
  else
  {
    id v51 = (void *)v50;
    id v52 = [(IDSRegistration *)self confirmedEmails];
    id v53 = [v4 confirmedEmails];
    unsigned int v54 = [v52 isEqualToArray:v53];

    if (!v54) {
      goto LABEL_40;
    }
  }
  id v55 = [(IDSRegistration *)self isCDMA];
  unsigned int v56 = [v55 intValue];
  id v57 = [v4 isCDMA];
  unsigned int v58 = [v57 intValue];

  if (v56 != v58)
  {
LABEL_40:
    unsigned __int8 v5 = 0;
    goto LABEL_41;
  }
  CFStringRef v59 = [(IDSRegistration *)self registrationCert];
  uint64_t v60 = [v4 registrationCert];
  if (v59 == (void *)v60)
  {
  }
  else
  {
    v61 = (void *)v60;
    id v62 = [(IDSRegistration *)self registrationCert];
    v63 = [v4 registrationCert];
    unsigned int v64 = [v62 isEqualToData:v63];

    if (!v64) {
      goto LABEL_40;
    }
  }
  v66 = [(IDSRegistration *)self userUniqueIdentifier];
  v67 = [v4 userUniqueIdentifier];
  if (v66 == v67)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v68 = [(IDSRegistration *)self userUniqueIdentifier];
    v69 = [v4 userUniqueIdentifier];
    unsigned __int8 v5 = [v68 isEqualToString:v69];
  }
LABEL_41:

  return v5;
}

- (NSString)authenticationToken
{
  if ([(IDSRegistration *)self registrationType])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = sub_1003D97C4;
    uint64_t v20 = sub_1003D97D4;
    id v21 = 0;
    passwordManager = self->_passwordManager;
    id v4 = [(IDSRegistration *)self profileID];
    unsigned __int8 v5 = [(IDSRegistration *)self email];
    unsigned int v6 = [v5 lowercaseString];
    uint64_t v7 = [(IDSRegistration *)self serviceType];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003D97DC;
    v15[3] = &unk_10098B4E8;
    v15[4] = self;
    v15[5] = &v16;
    [(FTPasswordManager *)passwordManager fetchAuthTokenForProfileID:v4 username:v6 service:v7 outRequestID:0 completionBlock:v15];

    if ([(id)v17[5] length]) {
      uint64_t v8 = (void *)v17[5];
    }
    else {
      uint64_t v8 = 0;
    }
    id v12 = v8;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    uint64_t v9 = [(IDSRegistration *)self _userStore];
    objc_super v10 = [(IDSRegistration *)self _user];
    unsigned int v11 = [v9 credentialForUser:v10];

    if (v11 && ![v11 realm])
    {
      id v12 = [v11 smsSignature];
    }
    else
    {
      id v12 = 0;
    }
    int v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10072259C((uint64_t)v12, v13);
    }
  }

  return (NSString *)v12;
}

- (void)setAuthenticationToken:(id)a3
{
  id v4 = a3;
  if ([(IDSRegistration *)self registrationType])
  {
    unsigned int v5 = [(IDSRegistration *)self registrationType];
    if (v4 || v5 != 2)
    {
      unsigned int v6 = [(IDSRegistration *)self serviceType];
      passwordManager = self->_passwordManager;
      id v12 = [(IDSRegistration *)self profileID];
      int v13 = [(IDSRegistration *)self email];
      uint64_t v14 = IMStripLoginID();
      v15 = [v14 lowercaseString];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1003D9CF4;
      v16[3] = &unk_10098B510;
      id v17 = v4;
      [(FTPasswordManager *)passwordManager setAuthTokenForProfileID:v12 username:v15 service:v6 authToken:v17 selfHandle:0 accountStatus:&off_1009D2370 outRequestID:0 completionBlock:v16];
    }
    else
    {
      unsigned int v6 = +[IMRGLog registration];
      if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "** Not clearing auth token since this is a temporary registration", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(IDSRegistration *)self mainID];
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "** Updating SMS authentication token to mainID: %@  token: %@", buf, 0x16u);
    }
    unsigned int v6 = [[IDSPhoneUserCredential alloc] initWithSMSSignature:v4];
    uint64_t v9 = [(IDSRegistration *)self _userStore];
    objc_super v10 = [(IDSRegistration *)self _user];
    [v9 setCredential:v6 forUser:v10];
  }
}

- (void)voidAuthenticationTokenAllowingGracePeriod
{
  if ([(IDSRegistration *)self registrationType] == 1)
  {
    unsigned int v3 = +[FTPasswordManager sharedInstance];
    id v4 = [(IDSRegistration *)self profileID];
    unsigned int v5 = [(IDSRegistration *)self email];
    unsigned int v6 = [v5 lowercaseString];
    [v3 removeAuthTokenAllowingGracePeriodForProfileID:v4 username:v6];

    uint64_t v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(IDSRegistration *)self email];
      uint64_t v9 = [v8 lowercaseString];
      int v10 = 138412290;
      unsigned int v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Voided auth token for account (%@)", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)voidPassword
{
  if ([(IDSRegistration *)self registrationType] == 1)
  {
    id v7 = [(IDSRegistration *)self serviceType];
    unsigned int v3 = +[FTPasswordManager sharedInstance];
    id v4 = [(IDSRegistration *)self profileID];
    unsigned int v5 = [(IDSRegistration *)self email];
    unsigned int v6 = [v5 lowercaseString];
    [v3 setPasswordForProfileID:v4 username:v6 service:v7 password:0 outRequestID:0 completionBlock:&stru_10098B530];
  }
}

- (id)_user
{
  unsigned int v3 = [(IDSRegistration *)self _userStore];
  id v4 = [v3 userWithUniqueIdentifier:self->_userUniqueIdentifier];

  return v4;
}

- (id)_userStore
{
  v2 = +[IDSDaemon sharedInstance];
  unsigned int v3 = [v2 registrationConductor];
  id v4 = [v3 userStore];

  return v4;
}

- (id)description
{
  [(IDSRegistration *)self registrationStatus];
  unsigned int v30 = _StringForIDSDRegistrationStatus();
  id v27 = _StringForIDSRegistrationType([(IDSRegistration *)self registrationType]);
  id v29 = [(IDSRegistration *)self deviceName];
  unsigned int v24 = [(IDSRegistration *)self serviceType];
  v22 = _StringForIDSRegistrationServiceType();
  v28 = [(IDSRegistration *)self environment];
  __int16 v20 = [(IDSRegistration *)self mainID];
  uint64_t v26 = [(IDSRegistration *)self email];
  v19 = [(IDSRegistration *)self userID];
  id v23 = [(IDSRegistration *)self isCDMA];
  CFStringRef v3 = @"YES";
  if (!v23) {
    CFStringRef v3 = @"NO";
  }
  CFStringRef v17 = v3;
  id v25 = [(IDSRegistration *)self pushToken];
  id v4 = [(IDSRegistration *)self regionID];
  unsigned int v5 = [(IDSRegistration *)self regionBasePhoneNumber];
  id v21 = [(IDSRegistration *)self uris];
  unsigned int v6 = IMLoggingStringForArray();
  uint64_t v18 = [(IDSRegistration *)self candidateEmails];
  id v7 = IMLoggingStringForArray();
  uint64_t v8 = [(IDSRegistration *)self authenticationCert];
  uint64_t v9 = [(IDSRegistration *)self registrationCert];
  int v10 = [(IDSRegistration *)self profileID];
  unsigned int v11 = [(IDSRegistration *)self idsUserID];
  userUniqueIdentifier = self->_userUniqueIdentifier;
  unsigned int v13 = [(IDSRegistration *)self didRegisterWithKTAccountKey];
  CFStringRef v14 = @"YES";
  if (!v13) {
    CFStringRef v14 = @"NO";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Registration info (%p): [Status: %@] [Type: %@] [Device Name: %@] [Service Type: %@] [Env: %@] [Main ID: %@] [AppleID: %@] [UserID: %@] [C2K: %@] [Push Token: %@] [Region ID: %@] [Base Number: %@] [URIs: %@] [Candidates: %@] [Auth Cert: %p] [Reg Cert: %p] [Profile ID: %@] [Auth User ID: %@] [User Unique ID: %@] [Account Key: %@]", self, v30, v27, v29, v22, v28, v20, v26, v19, v17, v25, v4, v5, v6, v7, v8,
    v9,
    v10,
    v11,
    userUniqueIdentifier,
  v15 = v14);

  return v15;
}

- (id)debugDescription
{
  [(IDSRegistration *)self registrationStatus];
  id v33 = _StringForIDSDRegistrationStatus();
  unsigned int v30 = _StringForIDSRegistrationType([(IDSRegistration *)self registrationType]);
  uint64_t v32 = [(IDSRegistration *)self deviceName];
  id v25 = [(IDSRegistration *)self serviceType];
  id v29 = _StringForIDSRegistrationServiceType();
  id v31 = [(IDSRegistration *)self environment];
  id v21 = [(IDSRegistration *)self mainID];
  v28 = [(IDSRegistration *)self email];
  __int16 v20 = [(IDSRegistration *)self userID];
  unsigned int v24 = [(IDSRegistration *)self isCDMA];
  CFStringRef v3 = @"YES";
  if (!v24) {
    CFStringRef v3 = @"NO";
  }
  CFStringRef v18 = v3;
  id v23 = [(IDSRegistration *)self pushToken];
  id v27 = [v23 debugDescription];
  CFStringRef v17 = [(IDSRegistration *)self regionID];
  uint64_t v26 = [(IDSRegistration *)self regionBasePhoneNumber];
  v22 = [(IDSRegistration *)self uris];
  id v4 = IMLoggingStringForArray();
  v19 = [(IDSRegistration *)self candidateEmails];
  unsigned int v5 = IMLoggingStringForArray();
  unsigned int v6 = [(IDSRegistration *)self authenticationCert];
  id v7 = [(IDSRegistration *)self registrationCert];
  uint64_t v8 = [(IDSRegistration *)self profileID];
  uint64_t v9 = [(IDSRegistration *)self idsUserID];
  int v10 = [(IDSRegistration *)self registrationDate];
  unsigned int v11 = [(IDSRegistration *)self nextRegistrationDate];
  userUniqueIdentifier = self->_userUniqueIdentifier;
  unsigned int v13 = [(IDSRegistration *)self didRegisterWithKTAccountKey];
  CFStringRef v14 = @"YES";
  if (!v13) {
    CFStringRef v14 = @"NO";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Registration info (%p): [Status: %@] [Type: %@] [Device Name: %@] [Service Type: %@] [Env: %@] [Main ID: %@] [AppleID: %@] [UserID: %@] [C2K: %@] [Push Token: %@] [Region ID: %@] [Base Number: %@] [URIs: %@] [Candidates: %@] [Auth Cert: %p] [Reg Cert: %p] [Profile ID: %@] [Auth User ID: %@] [Registration Date: %@] [Heartbeat Date: %@] [User Unique ID: %@] [Account Key: %@]", self, v33, v30, v32, v29, v31, v21, v28, v20, v18, v27, v17, v26, v4, v5, v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    userUniqueIdentifier,
  v15 = v14);

  return v15;
}

- (NSArray)emailsToRegister
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  if ([(IDSRegistration *)self shouldRegisterUsingDSHandle])
  {
    id v4 = [(IDSRegistration *)self dsHandle];

    unsigned int v5 = +[IMRGLog registration];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        id v7 = [(IDSRegistration *)self idsUserID];
        uint64_t v8 = [(IDSRegistration *)self serviceType];
        *(_DWORD *)buf = 138412546;
        v85 = v7;
        __int16 v86 = 2112;
        id v87 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " ... finding emails to register for DS registration based account: %@:%@", buf, 0x16u);
      }
      uint64_t v9 = +[IMRGLog registration];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [(IDSRegistration *)self dsHandle];
        *(_DWORD *)buf = 138412290;
        v85 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " => Added self handle: %@ to URI set", buf, 0xCu);
      }
      unsigned int v5 = [(IDSRegistration *)self dsHandle];
      [v3 addObject:v5];
    }
    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v85 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => **** Missing self handle, not adding ****: %@", buf, 0xCu);
    }
LABEL_40:

    goto LABEL_41;
  }
  unsigned int v11 = [(IDSRegistration *)self shouldAutoRegisterAllHandles];
  id v12 = +[IMRGLog registration];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      CFStringRef v14 = [(IDSRegistration *)self idsUserID];
      v15 = [(IDSRegistration *)self serviceType];
      *(_DWORD *)buf = 138412546;
      v85 = v14;
      __int16 v86 = 2112;
      id v87 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " ... finding emails to register for auto register based account: %@:%@", buf, 0x16u);
    }
    uint64_t v16 = [(IDSRegistration *)self confirmedEmails];
    id v17 = [v16 count];

    if (v17)
    {
      CFStringRef v18 = [(IDSRegistration *)self confirmedEmails];
      [v3 addObjectsFromArray:v18];

      v19 = +[IMRGLog registration];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = [(IDSRegistration *)self confirmedEmails];
        IMLoggingStringForArray();
        id v21 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v85 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " => Auto adding confirmed emails: %@ to URI set", buf, 0xCu);
      }
    }
    else
    {
      v19 = +[IMRGLog registration];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " => No confirmed emails...", buf, 2u);
      }
    }

    id v35 = [(IDSRegistration *)self vettedEmails];
    id v36 = [v35 count];

    if (v36)
    {
      v37 = [(IDSRegistration *)self vettedEmails];
      [v3 addObjectsFromArray:v37];

      uint64_t v38 = +[IMRGLog registration];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = [(IDSRegistration *)self vettedEmails];
        IMLoggingStringForArray();
        v40 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v85 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, " => Auto adding vetted emails: %@ to URI set", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v38 = +[IMRGLog registration];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, " => No confirmed emails...", buf, 2u);
      }
    }

    v41 = [(IDSRegistration *)self candidateEmails];
    id v42 = [v41 count];

    if (v42)
    {
      v43 = [(IDSRegistration *)self candidateEmails];
      [v3 addObjectsFromArray:v43];

      uint64_t v44 = +[IMRGLog registration];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [(IDSRegistration *)self candidateEmails];
        IMLoggingStringForArray();
        v46 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v85 = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, " => Added candidate emails: %@ to URI set", buf, 0xCu);
      }
    }
    unsigned int v5 = [(IDSRegistration *)self dsHandle];
    if ([v5 length])
    {
      v47 = +[IMRGLog registration];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, " => Removing DS Handle", buf, 2u);
      }

      [v3 removeObject:v5];
    }
    goto LABEL_40;
  }
  if (v13)
  {
    v22 = [(IDSRegistration *)self idsUserID];
    id v23 = [(IDSRegistration *)self serviceType];
    *(_DWORD *)buf = 138412546;
    v85 = v22;
    __int16 v86 = 2112;
    id v87 = v23;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " ... finding emails to register for manual handle selection account: %@:%@", buf, 0x16u);
  }
  unsigned int v24 = [(IDSRegistration *)self confirmedEmails];
  id v25 = [v24 count];

  if (v25)
  {
    uint64_t v26 = [(IDSRegistration *)self confirmedEmails];
    [v3 addObjectsFromArray:v26];

    id v27 = +[IMRGLog registration];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(IDSRegistration *)self confirmedEmails];
      IMLoggingStringForArray();
      id v29 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v85 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " => Added confirmed emails: %@ to URI set", buf, 0xCu);
    }
  }
  unsigned int v30 = [(IDSRegistration *)self candidateEmails];
  id v31 = [v30 count];

  if (v31)
  {
    uint64_t v32 = [(IDSRegistration *)self candidateEmails];
    [v3 addObjectsFromArray:v32];

    unsigned int v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(IDSRegistration *)self candidateEmails];
      IMLoggingStringForArray();
      v34 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v85 = v34;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Added candidate emails: %@ to URI set", buf, 0xCu);
    }
    goto LABEL_40;
  }
LABEL_41:
  if (![v3 count])
  {

    id v3 = 0;
  }
  BOOL v77 = self;
  if (+[IDSRegistrationController systemSupportsPhoneNumberRegistration])
  {
    unsigned int v48 = +[IDSCTAdapter sharedInstance];
    id v83 = 0;
    id v49 = [v48 currentSIMsWithError:&v83];
    id v50 = v83;
    id v51 = objc_msgSend(v49, "__imArrayByApplyingBlock:", &stru_10098B550);
    id v52 = (IDSRegistration *)[v51 mutableCopy];

    id v53 = [(IDSRegistration *)self _userStore];
    unsigned int v54 = [v53 usersWithRealm:2];
    id v55 = objc_msgSend(v54, "__imArrayByApplyingBlock:", &stru_10098B570);
    [(IDSRegistration *)v52 addObjectsFromArray:v55];

    unsigned int v56 = +[IMRGLog registration];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v52;
      __int16 v86 = 2112;
      id v87 = v50;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "   Device numbers: %@, error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v52 = 0;
  }
  id v57 = v3;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v76 = [v3 mutableCopy];
  id obj = [v76 allObjects];
  id v58 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v80;
    uint64_t v61 = kIDSServiceDefaultsSentinelAlias;
    do
    {
      for (i = 0; i != v59; i = (char *)i + 1)
      {
        if (*(void *)v80 != v60) {
          objc_enumerationMutation(obj);
        }
        v63 = *(IDSRegistration **)(*((void *)&v79 + 1) + 8 * i);
        if (![(IDSRegistration *)v63 caseInsensitiveCompare:v61])
        {
          unsigned int v64 = +[IMRGLog registration];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, " => Found sentinel alias, stripping", buf, 2u);
          }

          [v57 removeObject:v63];
        }
        if ([(IDSRegistration *)v52 count])
        {
          v65 = [(IDSRegistration *)v63 lowercaseString];
          unsigned int v66 = [(IDSRegistration *)v52 containsObject:v65];

          if (v66)
          {
            v67 = +[IMRGLog registration];
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              v68 = [(IDSRegistration *)v77 serviceType];
              *(_DWORD *)buf = 138412546;
              v85 = v63;
              __int16 v86 = 2112;
              id v87 = v68;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Skipping device number: %@  for service: %@", buf, 0x16u);
            }
            [v57 removeObject:v63];
          }
        }
      }
      id v59 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v59);
  }

  v69 = v57;
  objc_super v70 = [v57 allObjects];
  v71 = +[IMRGLog registration];
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    IMLoggingStringForArray();
    id v72 = (IDSRegistration *)objc_claimAutoreleasedReturnValue();
    v73 = [(IDSRegistration *)v77 serviceType];
    v74 = [(IDSRegistration *)v77 idsUserID];
    *(_DWORD *)buf = 138412802;
    v85 = v72;
    __int16 v86 = 2112;
    id v87 = v73;
    __int16 v88 = 2112;
    v89 = v74;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, " => Final emails to register: %@    for service: %@  account: %@", buf, 0x20u);
  }

  return (NSArray *)v70;
}

- (BOOL)hasSentinel
{
  id v3 = +[FTDeviceSupport sharedInstance];
  unsigned int v4 = [v3 supportsSMS];

  if (!v4) {
    return 0;
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  BOOL v6 = [(IDSRegistration *)self confirmedEmails];
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(IDSRegistration *)self confirmedEmails];
    [v5 addObjectsFromArray:v8];
  }
  uint64_t v9 = [(IDSRegistration *)self candidateEmails];
  id v10 = [v9 count];

  if (v10)
  {
    unsigned int v11 = [(IDSRegistration *)self candidateEmails];
    [v5 addObjectsFromArray:v11];
  }
  if (![v5 count])
  {

    id v5 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    uint64_t v16 = kIDSServiceDefaultsSentinelAlias;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "caseInsensitiveCompare:", v16, (void)v20))
        {
          BOOL v18 = 1;
          goto LABEL_19;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_19:

  return v18;
}

- (BOOL)canRegister
{
  v2 = self;
  if ([(IDSRegistration *)self registrationType] == 1)
  {
    if (![(IDSRegistration *)v2 shouldAutoRegisterAllHandles]
      && ![(IDSRegistration *)v2 shouldRegisterUsingDSHandle])
    {
      id v3 = [(IDSRegistration *)v2 regionID];
      if (![v3 length])
      {
        LOBYTE(v2) = 0;
        goto LABEL_14;
      }
      unsigned int v4 = [(IDSRegistration *)v2 regionBasePhoneNumber];
      id v5 = [v4 length];

      if (!v5)
      {
        LOBYTE(v2) = 0;
        return (char)v2;
      }
      if (![(IDSRegistration *)v2 hasSentinel])
      {
        id v3 = [(IDSRegistration *)v2 emailsToRegister];
        LOBYTE(v2) = [v3 count] != 0;
LABEL_14:

        return (char)v2;
      }
    }
  }
  else if (![(IDSRegistration *)v2 registrationType])
  {
    id v3 = +[IDSCTAdapter sharedInstance];
    if ([v3 isAnySIMInserted])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      BOOL v6 = +[IMMobileNetworkManager sharedInstance];
      LODWORD(v2) = [v6 requiresSIMInserted] ^ 1;
    }
    goto LABEL_14;
  }
  LOBYTE(v2) = 1;
  return (char)v2;
}

- (BOOL)canSendRegistration
{
  v2 = self;
  if ([(IDSRegistration *)self registrationType] == 1)
  {
    if (![(IDSRegistration *)v2 shouldAutoRegisterAllHandles]
      || ([(IDSRegistration *)v2 emailsToRegister],
          id v3 = objc_claimAutoreleasedReturnValue(),
          id v4 = [v3 count],
          v3,
          !v4))
    {
      if (![(IDSRegistration *)v2 shouldRegisterUsingDSHandle])
      {
        id v5 = [(IDSRegistration *)v2 regionID];
        if (![v5 length])
        {
          LOBYTE(v2) = 0;
          goto LABEL_15;
        }
        BOOL v6 = [(IDSRegistration *)v2 regionBasePhoneNumber];
        id v7 = [v6 length];

        if (!v7)
        {
          LOBYTE(v2) = 0;
          return (char)v2;
        }
        if (![(IDSRegistration *)v2 hasSentinel])
        {
          id v5 = [(IDSRegistration *)v2 emailsToRegister];
          LOBYTE(v2) = [v5 count] != 0;
LABEL_15:

          return (char)v2;
        }
      }
    }
  }
  else if (![(IDSRegistration *)v2 registrationType])
  {
    id v5 = +[IDSCTAdapter sharedInstance];
    if ([v5 isAnySIMInserted])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      uint64_t v8 = +[IMMobileNetworkManager sharedInstance];
      LODWORD(v2) = [v8 requiresSIMInserted] ^ 1;
    }
    goto LABEL_15;
  }
  LOBYTE(v2) = 1;
  return (char)v2;
}

- (BOOL)stopAtAuthentication
{
  v2 = [(IDSRegistration *)self serviceType];
  char v3 = IDSIsStewieRegistrationServiceType();

  return v3;
}

- (void)setAuthenticationCert:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [(IDSRegistration *)self registrationType];
  unsigned int v5 = [(IDSRegistration *)self registrationType];
  unsigned int v6 = v5;
  if (!v4)
  {
    if (v5 != 1)
    {
LABEL_7:
      id v7 = [(IDSRegistration *)self _userStore];
      if (v10) {
        id v8 = [objc_alloc((Class)IDSAuthenticationCertificate) initWithDataRepresentation:v10];
      }
      else {
        id v8 = 0;
      }
      uint64_t v9 = [(IDSRegistration *)self _user];
      [v7 silentlySetAuthenticationCertificate:v8 forUser:v9];

      if (!v10) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_6:
    id v7 = +[IDSRegistrationKeychainManager sharedInstance];
    id v8 = [(IDSRegistration *)self idsUserID];
    [v7 setAuthenticationCert:v10 forID:v8];
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if ([(IDSRegistration *)self registrationType] == 1) {
    goto LABEL_6;
  }
  if (v6 == 2) {
    goto LABEL_7;
  }
LABEL_13:
}

- (NSData)authenticationCert
{
  unsigned int v3 = [(IDSRegistration *)self registrationType];
  if ([(IDSRegistration *)self registrationType])
  {
    if (v3 == 2)
    {
      unsigned int v4 = [(IDSRegistration *)self _user];
      unsigned int v5 = [(IDSRegistration *)self _userStore];
      unsigned int v6 = [v5 authenticationCertificateForUser:v4];
      id v7 = [v6 dataRepresentation];
    }
    else
    {
      unsigned int v4 = +[IDSRegistrationKeychainManager sharedInstance];
      unsigned int v5 = [(IDSRegistration *)self idsUserID];
      id v7 = [v4 authenticationCertForID:v5];
    }
  }
  else
  {
    unsigned int v4 = [(IDSRegistration *)self _user];
    id v8 = [(IDSRegistration *)self _userStore];
    uint64_t v9 = [v8 authenticationCertificateForUser:v4];
    id v7 = [v9 dataRepresentation];

    if (!v7)
    {
      id v10 = +[IDSRegistrationKeychainManager sharedInstance];
      unsigned int v11 = [(IDSRegistration *)self idsUserID];
      id v7 = [v10 authenticationCertForID:v11];

      if (v7)
      {
        if (v4)
        {
          id v12 = [(IDSRegistration *)self idsUserID];
          id v13 = [v12 _stripFZIDPrefix];

          id v14 = [v4 unprefixedIdentifier];
          uint64_t v15 = [v4 phoneUserWithUpdatedPhoneNumber:v13 phoneBookNumber:v14];

          uint64_t v16 = +[IMRGLog registration];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138412802;
            long long v20 = v4;
            __int16 v21 = 2112;
            long long v22 = v15;
            __int16 v23 = 2048;
            unsigned int v24 = self;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating user with correct phoneNumber {user: %@, updatedUser: %@, self: %p}", (uint8_t *)&v19, 0x20u);
          }

          id v17 = [(IDSRegistration *)self _userStore];
          [v17 updateUser:v15];
        }
      }
    }
  }

  return (NSData *)v7;
}

- (NSArray)vettedEmails
{
  return self->_vettedEmails;
}

- (void)setVettedEmails:(id)a3
{
}

- (NSString)dsHandle
{
  return self->_dsHandle;
}

- (void)setDSHandle:(id)a3
{
}

- (NSString)profileID
{
  return self->_profileID;
}

- (void)setProfileID:(id)a3
{
}

- (NSNumber)IDSVersion
{
  return self->_IDSVersion;
}

- (void)setIDSVersion:(id)a3
{
}

- (NSNumber)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (void)setRegistrationDate:(id)a3
{
}

- (NSDate)nextRegistrationDate
{
  return self->_nextRegistrationDate;
}

- (void)setNextRegistrationDate:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSNumber)isCDMA
{
  return self->_isC2K;
}

- (void)setIsCDMA:(id)a3
{
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (void)setNeedsMigration:(BOOL)a3
{
  self->_needsMigration = a3;
}

- (BOOL)needsProvisioning
{
  return self->_needsProvisioning;
}

- (void)setNeedsProvisioning:(BOOL)a3
{
  self->_needsProvisioning = a3;
}

- (BOOL)needsRenewal
{
  return self->_needsRenewal;
}

- (void)setNeedsRenewal:(BOOL)a3
{
  self->_needsRenewal = a3;
}

- (int64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (void)setRegistrationType:(int)a3
{
  self->_registrationType = a3;
}

- (int)retries
{
  return self->_retries;
}

- (void)setRetries:(int)a3
{
  self->_retries = a3;
}

- (int)absintheRetries
{
  return self->_absintheRetries;
}

- (void)setAbsintheRetries:(int)a3
{
  self->_absintheRetries = a3;
}

- (NSString)mainID
{
  return self->_mainID;
}

- (void)setMainID:(id)a3
{
}

- (NSArray)dependentRegistrations
{
  return self->_dependentRegistrations;
}

- (void)setDependentRegistrations:(id)a3
{
}

- (NSString)regionID
{
  return self->_regionID;
}

- (void)setRegionID:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)regionBasePhoneNumber
{
  return self->_regionBasePhoneNumber;
}

- (void)setRegionBasePhoneNumber:(id)a3
{
}

- (NSDictionary)regionServerContext
{
  return self->_regionServerContext;
}

- (void)setRegionServerContext:(id)a3
{
}

- (NSData)registrationCert
{
  return self->_registrationCert;
}

- (void)setRegistrationCert:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (NSMutableArray)_candidateEmails
{
  return self->_candidateEmails;
}

- (void)set_candidateEmails:(id)a3
{
}

- (NSDictionary)migrationContext
{
  return self->_migrationContext;
}

- (void)setMigrationContext:(id)a3
{
}

- (NSNumber)identityVersion
{
  return self->_identityVersion;
}

- (void)setIdentityVersion:(id)a3
{
}

- (BOOL)runningSimpleAuthentication
{
  return self->_runningSimpleAuthentication;
}

- (void)setRunningSimpleAuthentication:(BOOL)a3
{
  self->_runningSimpleAuthentication = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (NSString)keyPairSignature
{
  return self->_keyPairSignature;
}

- (void)setKeyPairSignature:(id)a3
{
}

- (NSString)idsUserID
{
  return self->_idsUserID;
}

- (void)setIdsUserID:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
}

- (BOOL)shouldRegisterUsingDSHandle
{
  return self->_shouldRegisterUsingDSHandle;
}

- (void)setShouldRegisterUsingDSHandle:(BOOL)a3
{
  self->_shouldRegisterUsingDSHandle = a3;
}

- (BOOL)shouldAutoRegisterAllHandles
{
  return self->_shouldAutoRegisterAllHandles;
}

- (void)setShouldAutoRegisterAllHandles:(BOOL)a3
{
  self->_shouldAutoRegisterAllHandles = a3;
}

- (NSArray)adHocServiceNames
{
  return self->_adHocServiceNames;
}

- (void)setAdHocServiceNames:(id)a3
{
}

- (NSString)temporaryPhoneEmail
{
  return self->_temporaryPhoneEmail;
}

- (void)setTemporaryPhoneEmail:(id)a3
{
}

- (NSDate)dependentRegistrationsTTL
{
  return self->_dependentRegistrationsTTL;
}

- (void)setDependentRegistrationsTTL:(id)a3
{
}

- (NSNumber)dependentRegistrationResponseCode
{
  return self->_dependentRegistrationResponseCode;
}

- (void)setDependentRegistrationResponseCode:(id)a3
{
}

- (NSNumber)dependentRegistrationAuthRetries
{
  return self->_dependentRegistrationAuthRetries;
}

- (void)setDependentRegistrationAuthRetries:(id)a3
{
}

- (NSArray)keyTransparencyEnrolledURIs
{
  return self->_keyTransparencyEnrolledURIs;
}

- (void)setKeyTransparencyEnrolledURIs:(id)a3
{
}

- (BOOL)didRegisterWithKTAccountKey
{
  return self->_didRegisterWithKTAccountKey;
}

- (void)setDidRegisterWithKTAccountKey:(BOOL)a3
{
  self->_didRegisterWithKTAccountKey = a3;
}

- (unint64_t)optedIntoKT
{
  return self->_optedIntoKT;
}

- (void)setOptedIntoKT:(unint64_t)a3
{
  self->_optedIntoKT = a3;
}

- (BOOL)didRegisterWithDeviceSignature
{
  return self->_didRegisterWithDeviceSignature;
}

- (void)setDidRegisterWithDeviceSignature:(BOOL)a3
{
  self->_didRegisterWithDeviceSignature = a3;
}

- (NSString)userUniqueIdentifier
{
  return self->_userUniqueIdentifier;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
}

- (FTPasswordManager)passwordManager
{
  return self->_passwordManager;
}

- (void)setPasswordManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordManager, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_userUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_keyTransparencyEnrolledURIs, 0);
  objc_storeStrong((id *)&self->_dependentRegistrationAuthRetries, 0);
  objc_storeStrong((id *)&self->_dependentRegistrationResponseCode, 0);
  objc_storeStrong((id *)&self->_dependentRegistrationsTTL, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneEmail, 0);
  objc_storeStrong((id *)&self->_adHocServiceNames, 0);
  objc_storeStrong((id *)&self->_uris, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsUserID, 0);
  objc_storeStrong((id *)&self->_keyPairSignature, 0);
  objc_storeStrong((id *)&self->_identityVersion, 0);
  objc_storeStrong((id *)&self->_migrationContext, 0);
  objc_storeStrong((id *)&self->_candidateEmails, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_registrationCert, 0);
  objc_storeStrong((id *)&self->_regionServerContext, 0);
  objc_storeStrong((id *)&self->_regionBasePhoneNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_regionID, 0);
  objc_storeStrong((id *)&self->_dependentRegistrations, 0);
  objc_storeStrong((id *)&self->_mainID, 0);
  objc_storeStrong((id *)&self->_isC2K, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_nextRegistrationDate, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_IDSVersion, 0);
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_dsHandle, 0);

  objc_storeStrong((id *)&self->_vettedEmails, 0);
}

@end