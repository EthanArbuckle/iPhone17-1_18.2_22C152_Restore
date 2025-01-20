@interface AKAuthorizationContext
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationContext)initWithCoder:(id)a3;
- (AKAuthorizationContext)initWithRequest:(id)a3;
- (AKAuthorizationRequest)request;
- (AKAuthorizationScopesUserSelection)userSelection;
- (AKCompanionKeyEnvelope)companionKeyEnvelope;
- (AKDevice)companionDevice;
- (AKDevice)proxiedDevice;
- (BOOL)_clientAuthenticatedExternallyWithPassword;
- (BOOL)_hasApplicationMetaData;
- (BOOL)_isAuthorizingForSharedSIWAAccount;
- (BOOL)_shouldRequestToArmDeviceToAllowPCSKeyUpload;
- (BOOL)isMDMInformationRequired;
- (NSDictionary)appProvidedData;
- (NSString)_externalAuthToken;
- (NSString)_proxiedAppName;
- (NSString)_sharedSIWAAccountGroupID;
- (NSString)_sharedSIWAAccountShareToken;
- (NSString)altDSID;
- (NSString)appProvidedContext;
- (NSString)clientID;
- (NSString)description;
- (NSString)realUserVerificationData;
- (NSString)teamID;
- (NSString)username;
- (NSUUID)_identifier;
- (int64_t)serviceType;
- (unint64_t)authenticationMode;
- (unint64_t)authenticationType;
- (void)_setProxiedAppName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppProvidedContext:(id)a3;
- (void)setAppProvidedData:(id)a3;
- (void)setAuthenticationMode:(unint64_t)a3;
- (void)setAuthenticationType:(unint64_t)a3;
- (void)setClientID:(id)a3;
- (void)setCompanionDevice:(id)a3;
- (void)setCompanionKeyEnvelope:(id)a3;
- (void)setIsMDMInformationRequired:(BOOL)a3;
- (void)setProxiedDevice:(id)a3;
- (void)setRealUserVerificationData:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setTeamID:(id)a3;
- (void)setUserSelection:(id)a3;
- (void)setUsername:(id)a3;
- (void)set_clientAuthenticatedExternallyWithPassword:(BOOL)a3;
- (void)set_externalAuthToken:(id)a3;
- (void)set_isAuthorizingForSharedSIWAAccount:(BOOL)a3;
- (void)set_sharedSIWAAccountGroupID:(id)a3;
- (void)set_sharedSIWAAccountShareToken:(id)a3;
- (void)set_shouldRequestToArmDeviceToAllowPCSKeyUpload:(BOOL)a3;
@end

@implementation AKAuthorizationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AKAuthorizationContext;
  v5 = [(AKAuthorizationContext *)&v40 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceType"];
    v5->_serviceType = [v6 integerValue];

    v5->_authenticationMode = [v4 decodeIntegerForKey:@"_authenticationMode"];
    v5->_authenticationType = [v4 decodeIntegerForKey:@"_authenticationType"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_appProvidedData"];
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedAppName"];
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_proxiedDevice"];
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_companionDevice"];
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_request"];
    request = v5->_request;
    v5->_request = (AKAuthorizationRequest *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appProvidedContext"];
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userSelection"];
    userSelection = v5->_userSelection;
    v5->_userSelection = (AKAuthorizationScopesUserSelection *)v31;

    v5->_clientAuthenticatedExternallyWithPassword = [v4 decodeBoolForKey:@"AKClientAuthenticatedExternallyWithPassword"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKExternalAuthToken"];
    externalAuthToken = v5->_externalAuthToken;
    v5->_externalAuthToken = (NSString *)v33;

    v5->_isMDMInformationRequired = [v4 decodeBoolForKey:@"_isMDMInformationRequired"];
    v5->_isAuthorizingForSharedSIWAAccount = [v4 decodeBoolForKey:@"isAuthorizingForSharedSIWAAccount"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSIWAAccountShareTokenKey"];
    sharedSIWAAccountShareToken = v5->_sharedSIWAAccountShareToken;
    v5->_sharedSIWAAccountShareToken = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSIWAAccountGroupID"];
    sharedSIWAAccountGroupID = v5->_sharedSIWAAccountGroupID;
    v5->_sharedSIWAAccountGroupID = (NSString *)v37;

    v5->_shouldRequestToArmDeviceToAllowPCSKeyUpload = [v4 decodeBoolForKey:@"ShouldRequestToArmDeviceToAllowPCSKeyUpload"];
  }

  return v5;
}

- (AKAuthorizationContext)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationContext;
  v6 = [(AKAuthorizationContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v6 = a3;
  [v6 encodeObject:altDSID forKey:@"_altDSID"];
  [v6 encodeObject:self->_proxiedAppName forKey:@"_proxiedAppName"];
  id v5 = [NSNumber numberWithInteger:self->_serviceType];
  [v6 encodeObject:v5 forKey:@"_serviceType"];

  [v6 encodeInteger:self->_authenticationMode forKey:@"_authenticationMode"];
  [v6 encodeInteger:self->_authenticationType forKey:@"_authenticationType"];
  [v6 encodeObject:self->_proxiedDevice forKey:@"_proxiedDevice"];
  [v6 encodeObject:self->_companionDevice forKey:@"_companionDevice"];
  [v6 encodeObject:self->_appProvidedData forKey:@"_appProvidedData"];
  [v6 encodeObject:self->_teamID forKey:@"_teamID"];
  [v6 encodeObject:self->_clientID forKey:@"_clientID"];
  [v6 encodeObject:self->_request forKey:@"_request"];
  [v6 encodeObject:self->_appProvidedContext forKey:@"_appProvidedContext"];
  [v6 encodeObject:self->_userSelection forKey:@"_userSelection"];
  [v6 encodeBool:self->_clientAuthenticatedExternallyWithPassword forKey:@"AKClientAuthenticatedExternallyWithPassword"];
  [v6 encodeObject:self->_externalAuthToken forKey:@"AKExternalAuthToken"];
  [v6 encodeBool:self->_isMDMInformationRequired forKey:@"_isMDMInformationRequired"];
  [v6 encodeBool:self->_isAuthorizingForSharedSIWAAccount forKey:@"isAuthorizingForSharedSIWAAccount"];
  [v6 encodeObject:self->_sharedSIWAAccountShareToken forKey:@"SharedSIWAAccountShareTokenKey"];
  [v6 encodeObject:self->_sharedSIWAAccountGroupID forKey:@"SharedSIWAAccountGroupID"];
  [v6 encodeBool:self->_shouldRequestToArmDeviceToAllowPCSKeyUpload forKey:@"ShouldRequestToArmDeviceToAllowPCSKeyUpload"];
}

- (BOOL)_hasApplicationMetaData
{
  return self->_clientID && self->_teamID != 0;
}

- (NSString)description
{
  uint64_t v21 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  altDSID = self->_altDSID;
  proxiedAppName = self->_proxiedAppName;
  id v5 = [NSNumber numberWithInteger:self->_serviceType];
  long long v18 = *(_OWORD *)&self->_proxiedDevice;
  teamID = self->_teamID;
  clientID = self->_clientID;
  appProvidedData = self->_appProvidedData;
  appProvidedContext = self->_appProvidedContext;
  request = self->_request;
  userSelection = self->_userSelection;
  uint64_t v12 = [NSNumber numberWithBool:self->_clientAuthenticatedExternallyWithPassword];
  uint64_t v13 = (void *)v12;
  v14 = @"YES";
  if (self->_isAuthorizingForSharedSIWAAccount) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if (!self->_shouldRequestToArmDeviceToAllowPCSKeyUpload) {
    v14 = @"NO";
  }
  v16 = [v21 stringWithFormat:@"<%@: %p {\n\taltDSID: %@,\n\tproxiedAppName: %@,\n\tserviceType: %@,\n\tproxiedDevice: %@,\n\tcompanionDevice: %@,\n\tappProvidedData: %@,\n\tteamID: %@,\n\tappID: %@,\n\trequest: %@,\n\tappProvidedContext: %@,\n\tuserSelection: %@,\n\tclientAuthenticatedExternallyWithPassword: %@,\n\tisAuthorizingForSharedSIWAAccount: %@,\n\t_shouldRequestToArmDeviceToAllowPCSKeyUpload: %@,\n}>", v4, self, altDSID, proxiedAppName, v5, v18, appProvidedData, teamID, clientID, request, appProvidedContext, userSelection, v12, v15, v14];

  return (NSString *)v16;
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (unint64_t)authenticationMode
{
  return self->_authenticationMode;
}

- (void)setAuthenticationMode:(unint64_t)a3
{
  self->_authenticationMode = a3;
}

- (NSString)_proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)_setProxiedAppName:(id)a3
{
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
}

- (AKDevice)companionDevice
{
  return self->_companionDevice;
}

- (void)setCompanionDevice:(id)a3
{
}

- (NSString)_externalAuthToken
{
  return self->_externalAuthToken;
}

- (void)set_externalAuthToken:(id)a3
{
}

- (BOOL)_clientAuthenticatedExternallyWithPassword
{
  return self->_clientAuthenticatedExternallyWithPassword;
}

- (void)set_clientAuthenticatedExternallyWithPassword:(BOOL)a3
{
  self->_clientAuthenticatedExternallyWithPassword = a3;
}

- (BOOL)isMDMInformationRequired
{
  return self->_isMDMInformationRequired;
}

- (void)setIsMDMInformationRequired:(BOOL)a3
{
  self->_isMDMInformationRequired = a3;
}

- (AKCompanionKeyEnvelope)companionKeyEnvelope
{
  return self->_companionKeyEnvelope;
}

- (void)setCompanionKeyEnvelope:(id)a3
{
}

- (BOOL)_isAuthorizingForSharedSIWAAccount
{
  return self->_isAuthorizingForSharedSIWAAccount;
}

- (void)set_isAuthorizingForSharedSIWAAccount:(BOOL)a3
{
  self->_isAuthorizingForSharedSIWAAccount = a3;
}

- (NSString)_sharedSIWAAccountShareToken
{
  return self->_sharedSIWAAccountShareToken;
}

- (void)set_sharedSIWAAccountShareToken:(id)a3
{
}

- (NSString)_sharedSIWAAccountGroupID
{
  return self->_sharedSIWAAccountGroupID;
}

- (void)set_sharedSIWAAccountGroupID:(id)a3
{
}

- (BOOL)_shouldRequestToArmDeviceToAllowPCSKeyUpload
{
  return self->_shouldRequestToArmDeviceToAllowPCSKeyUpload;
}

- (void)set_shouldRequestToArmDeviceToAllowPCSKeyUpload:(BOOL)a3
{
  self->_shouldRequestToArmDeviceToAllowPCSKeyUpload = a3;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (AKAuthorizationRequest)request
{
  return self->_request;
}

- (AKAuthorizationScopesUserSelection)userSelection
{
  return self->_userSelection;
}

- (void)setUserSelection:(id)a3
{
}

- (NSString)realUserVerificationData
{
  return self->_realUserVerificationData;
}

- (void)setRealUserVerificationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realUserVerificationData, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_sharedSIWAAccountGroupID, 0);
  objc_storeStrong((id *)&self->_sharedSIWAAccountShareToken, 0);
  objc_storeStrong((id *)&self->_companionKeyEnvelope, 0);
  objc_storeStrong((id *)&self->_externalAuthToken, 0);
  objc_storeStrong((id *)&self->_companionDevice, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end