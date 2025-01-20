@interface SOAuthorizationRequestParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)canShowOnCoverScreen;
- (BOOL)isCFNetworkInterception;
- (BOOL)isCallerManaged;
- (BOOL)isUserInteractionEnabled;
- (BOOL)useInternalExtensions;
- (NSData)auditTokenData;
- (NSData)httpBody;
- (NSDictionary)authorizationOptions;
- (NSDictionary)extensionData;
- (NSDictionary)httpHeaders;
- (NSString)callerBundleIdentifier;
- (NSString)callerTeamIdentifier;
- (NSString)identifier;
- (NSString)impersonationBundleIdentifier;
- (NSString)localizedCallerDisplayName;
- (NSString)realm;
- (NSString)requestedOperation;
- (NSURL)url;
- (SOAuthorizationRequestParameters)initWithAuthorizationRequestParametersCore:(id)a3;
- (SOAuthorizationRequestParameters)initWithCoder:(id)a3;
- (id)description;
- (int64_t)pssoAuthenticationMethod;
- (int64_t)responseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditTokenData:(id)a3;
- (void)setAuthorizationOptions:(id)a3;
- (void)setCallerBundleIdentifier:(id)a3;
- (void)setCallerManaged:(BOOL)a3;
- (void)setCallerTeamIdentifier:(id)a3;
- (void)setCfNetworkInterception:(BOOL)a3;
- (void)setEnableUserInteraction:(BOOL)a3;
- (void)setExtensionData:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpersonationBundleIdentifier:(id)a3;
- (void)setLocalizedCallerDisplayName:(id)a3;
- (void)setPssoAuthenticationMethod:(int64_t)a3;
- (void)setRealm:(id)a3;
- (void)setRequestedOperation:(id)a3;
- (void)setResponseCode:(int64_t)a3;
- (void)setShowOnCoverScreen:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUseInternalExtensions:(BOOL)a3;
@end

@implementation SOAuthorizationRequestParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOAuthorizationRequestParameters)initWithAuthorizationRequestParametersCore:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SOAuthorizationRequestParameters;
  v5 = [(SOAuthorizationRequestParameters *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 url];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    uint64_t v10 = [v4 httpHeaders];
    httpHeaders = v5->_httpHeaders;
    v5->_httpHeaders = (NSDictionary *)v10;

    uint64_t v12 = [v4 httpBody];
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v12;

    uint64_t v14 = [v4 requestedOperation];
    requestedOperation = v5->_requestedOperation;
    v5->_requestedOperation = (NSString *)v14;

    uint64_t v16 = [v4 auditTokenData];
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v16;

    uint64_t v18 = [v4 authorizationOptions];
    authorizationOptions = v5->_authorizationOptions;
    v5->_authorizationOptions = (NSDictionary *)v18;

    v5->_useInternalExtensions = [v4 useInternalExtensions];
    uint64_t v20 = [v4 realm];
    realm = v5->_realm;
    v5->_realm = (NSString *)v20;

    uint64_t v22 = [v4 extensionData];
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSDictionary *)v22;

    uint64_t v24 = [v4 callerBundleIdentifier];
    callerBundleIdentifier = v5->_callerBundleIdentifier;
    v5->_callerBundleIdentifier = (NSString *)v24;

    v5->_responseCode = [v4 responseCode];
    v5->_cfNetworkInterception = [v4 isCFNetworkInterception];
    v5->_callerManaged = [v4 isCallerManaged];
    uint64_t v26 = [v4 callerTeamIdentifier];
    callerTeamIdentifier = v5->_callerTeamIdentifier;
    v5->_callerTeamIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 localizedCallerDisplayName];
    localizedCallerDisplayName = v5->_localizedCallerDisplayName;
    v5->_localizedCallerDisplayName = (NSString *)v28;

    v5->_enableUserInteraction = [v4 isUserInteractionEnabled];
    uint64_t v30 = [v4 impersonationBundleIdentifier];
    impersonationBundleIdentifier = v5->_impersonationBundleIdentifier;
    v5->_impersonationBundleIdentifier = (NSString *)v30;

    v5->_showOnCoverScreen = [v4 canShowOnCoverScreen];
  }

  return v5;
}

- (SOAuthorizationRequestParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)SOAuthorizationRequestParameters;
  v5 = [(SOAuthorizationRequestParameters *)&v94 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_identifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("url");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    url = v5->_url;
    v5->_url = (NSURL *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_requestedOperation);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    requestedOperation = v5->_requestedOperation;
    v5->_requestedOperation = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v21 = NSStringFromSelector(sel_httpHeaders);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    httpHeaders = v5->_httpHeaders;
    v5->_httpHeaders = (NSDictionary *)v22;

    uint64_t v24 = objc_opt_class();
    v25 = NSStringFromSelector(sel_httpBody);
    uint64_t v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v26;

    uint64_t v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, objc_opt_class(), 0);
    v35 = NSStringFromSelector(sel_extensionData);
    uint64_t v36 = [v4 decodeObjectOfClasses:v34 forKey:v35];
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSDictionary *)v36;

    uint64_t v38 = objc_opt_class();
    v39 = NSStringFromSelector(sel_callerBundleIdentifier);
    uint64_t v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    callerBundleIdentifier = v5->_callerBundleIdentifier;
    v5->_callerBundleIdentifier = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector(sel_auditTokenData);
    uint64_t v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v44;

    uint64_t v46 = objc_opt_class();
    v47 = NSStringFromSelector(sel_realm);
    uint64_t v48 = [v4 decodeObjectOfClass:v46 forKey:v47];
    realm = v5->_realm;
    v5->_realm = (NSString *)v48;

    v50 = (void *)MEMORY[0x263EFFA08];
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    v56 = objc_msgSend(v50, "setWithObjects:", v51, v52, v53, v54, v55, objc_opt_class(), 0);
    v57 = NSStringFromSelector(sel_authorizationOptions);
    uint64_t v58 = [v4 decodeObjectOfClasses:v56 forKey:v57];
    authorizationOptions = v5->_authorizationOptions;
    v5->_authorizationOptions = (NSDictionary *)v58;

    uint64_t v60 = objc_opt_class();
    v61 = NSStringFromSelector(sel_useInternalExtensions);
    v62 = [v4 decodeObjectOfClass:v60 forKey:v61];
    v5->_useInternalExtensions = [v62 BOOLValue];

    uint64_t v63 = objc_opt_class();
    v64 = NSStringFromSelector(sel_responseCode);
    v65 = [v4 decodeObjectOfClass:v63 forKey:v64];
    v5->_responseCode = [v65 integerValue];

    uint64_t v66 = objc_opt_class();
    v67 = NSStringFromSelector(sel_isCFNetworkInterception);
    v68 = [v4 decodeObjectOfClass:v66 forKey:v67];
    v5->_cfNetworkInterception = [v68 BOOLValue];

    uint64_t v69 = objc_opt_class();
    v70 = NSStringFromSelector(sel_isCallerManaged);
    v71 = [v4 decodeObjectOfClass:v69 forKey:v70];
    v5->_callerManaged = [v71 BOOLValue];

    uint64_t v72 = objc_opt_class();
    v73 = NSStringFromSelector(sel_callerTeamIdentifier);
    uint64_t v74 = [v4 decodeObjectOfClass:v72 forKey:v73];
    callerTeamIdentifier = v5->_callerTeamIdentifier;
    v5->_callerTeamIdentifier = (NSString *)v74;

    uint64_t v76 = objc_opt_class();
    v77 = NSStringFromSelector(sel_localizedCallerDisplayName);
    uint64_t v78 = [v4 decodeObjectOfClass:v76 forKey:v77];
    localizedCallerDisplayName = v5->_localizedCallerDisplayName;
    v5->_localizedCallerDisplayName = (NSString *)v78;

    uint64_t v80 = objc_opt_class();
    v81 = NSStringFromSelector(sel_isUserInteractionEnabled);
    v82 = [v4 decodeObjectOfClass:v80 forKey:v81];
    v5->_enableUserInteraction = [v82 BOOLValue];

    uint64_t v83 = objc_opt_class();
    v84 = NSStringFromSelector(sel_impersonationBundleIdentifier);
    uint64_t v85 = [v4 decodeObjectOfClass:v83 forKey:v84];
    impersonationBundleIdentifier = v5->_impersonationBundleIdentifier;
    v5->_impersonationBundleIdentifier = (NSString *)v85;

    uint64_t v87 = objc_opt_class();
    v88 = NSStringFromSelector(sel_pssoAuthenticationMethod);
    v89 = [v4 decodeObjectOfClass:v87 forKey:v88];
    v5->_pssoAuthenticationMethod = [v89 integerValue];

    uint64_t v90 = objc_opt_class();
    v91 = NSStringFromSelector(sel_canShowOnCoverScreen);
    v92 = [v4 decodeObjectOfClass:v90 forKey:v91];
    v5->_showOnCoverScreen = [v92 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v6];

  url = self->_url;
  uint64_t v8 = NSStringFromSelector("url");
  [v5 encodeObject:url forKey:v8];

  requestedOperation = self->_requestedOperation;
  uint64_t v10 = NSStringFromSelector(sel_requestedOperation);
  [v5 encodeObject:requestedOperation forKey:v10];

  httpHeaders = self->_httpHeaders;
  uint64_t v12 = NSStringFromSelector(sel_httpHeaders);
  [v5 encodeObject:httpHeaders forKey:v12];

  httpBody = self->_httpBody;
  uint64_t v14 = NSStringFromSelector(sel_httpBody);
  [v5 encodeObject:httpBody forKey:v14];

  extensionData = self->_extensionData;
  uint64_t v16 = NSStringFromSelector(sel_extensionData);
  [v5 encodeObject:extensionData forKey:v16];

  callerBundleIdentifier = self->_callerBundleIdentifier;
  uint64_t v18 = NSStringFromSelector(sel_callerBundleIdentifier);
  [v5 encodeObject:callerBundleIdentifier forKey:v18];

  auditTokenData = self->_auditTokenData;
  uint64_t v20 = NSStringFromSelector(sel_auditTokenData);
  [v5 encodeObject:auditTokenData forKey:v20];

  realm = self->_realm;
  uint64_t v22 = NSStringFromSelector(sel_realm);
  [v5 encodeObject:realm forKey:v22];

  authorizationOptions = self->_authorizationOptions;
  uint64_t v24 = NSStringFromSelector(sel_authorizationOptions);
  [v5 encodeObject:authorizationOptions forKey:v24];

  v25 = [NSNumber numberWithBool:self->_useInternalExtensions];
  uint64_t v26 = NSStringFromSelector(sel_useInternalExtensions);
  [v5 encodeObject:v25 forKey:v26];

  v27 = [NSNumber numberWithInteger:self->_responseCode];
  uint64_t v28 = NSStringFromSelector(sel_responseCode);
  [v5 encodeObject:v27 forKey:v28];

  uint64_t v29 = [NSNumber numberWithBool:self->_cfNetworkInterception];
  uint64_t v30 = NSStringFromSelector(sel_isCFNetworkInterception);
  [v5 encodeObject:v29 forKey:v30];

  uint64_t v31 = [NSNumber numberWithBool:self->_callerManaged];
  uint64_t v32 = NSStringFromSelector(sel_isCallerManaged);
  [v5 encodeObject:v31 forKey:v32];

  callerTeamIdentifier = self->_callerTeamIdentifier;
  v34 = NSStringFromSelector(sel_callerTeamIdentifier);
  [v5 encodeObject:callerTeamIdentifier forKey:v34];

  localizedCallerDisplayName = self->_localizedCallerDisplayName;
  uint64_t v36 = NSStringFromSelector(sel_localizedCallerDisplayName);
  [v5 encodeObject:localizedCallerDisplayName forKey:v36];

  v37 = [NSNumber numberWithBool:self->_enableUserInteraction];
  uint64_t v38 = NSStringFromSelector(sel_isUserInteractionEnabled);
  [v5 encodeObject:v37 forKey:v38];

  impersonationBundleIdentifier = self->_impersonationBundleIdentifier;
  uint64_t v40 = NSStringFromSelector(sel_impersonationBundleIdentifier);
  [v5 encodeObject:impersonationBundleIdentifier forKey:v40];

  v41 = [NSNumber numberWithInteger:self->_pssoAuthenticationMethod];
  uint64_t v42 = NSStringFromSelector(sel_pssoAuthenticationMethod);
  [v5 encodeObject:v41 forKey:v42];

  id v44 = [NSNumber numberWithBool:self->_showOnCoverScreen];
  v43 = NSStringFromSelector(sel_canShowOnCoverScreen);
  [v5 encodeObject:v44 forKey:v43];
}

- (id)description
{
  v26[14] = *MEMORY[0x263EF8340];
  identifier = (__CFString *)self->_identifier;
  url = self->_url;
  if (!identifier) {
    identifier = @"(null)";
  }
  v25[0] = @"Identifier";
  v25[1] = @"URL";
  if (url) {
    id v5 = (__CFString *)url;
  }
  else {
    id v5 = @"(null)";
  }
  v26[0] = identifier;
  v26[1] = v5;
  requestedOperation = (__CFString *)self->_requestedOperation;
  if (!requestedOperation) {
    requestedOperation = @"(null)";
  }
  v25[2] = @"RequestedOperation";
  v25[3] = @"Realm";
  realm = (__CFString *)self->_realm;
  if (!realm) {
    realm = @"(null)";
  }
  v26[2] = requestedOperation;
  v26[3] = realm;
  authorizationOptions = self->_authorizationOptions;
  int64_t responseCode = self->_responseCode;
  if (!authorizationOptions) {
    authorizationOptions = (NSDictionary *)@"(null)";
  }
  v25[4] = @"AuthorizationOptions";
  v25[5] = @"UseInternalExtensions";
  if (self->_useInternalExtensions) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v26[4] = authorizationOptions;
  v26[5] = v10;
  v25[6] = @"ResponseCode";
  uint64_t v11 = [NSNumber numberWithInteger:responseCode];
  uint64_t v12 = (void *)v11;
  if (self->_cfNetworkInterception) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v26[6] = v11;
  v26[7] = v13;
  v25[7] = @"CFNetworkInterception";
  v25[8] = @"CallerManaged";
  if (self->_callerManaged) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  callerTeamIdentifier = (__CFString *)self->_callerTeamIdentifier;
  localizedCallerDisplayName = self->_localizedCallerDisplayName;
  if (!callerTeamIdentifier) {
    callerTeamIdentifier = @"(null)";
  }
  v26[8] = v14;
  v26[9] = callerTeamIdentifier;
  v25[9] = @"CallerTeamIdentifier";
  v25[10] = @"LocalizedCallerDisplayName";
  if (localizedCallerDisplayName) {
    v17 = (__CFString *)localizedCallerDisplayName;
  }
  else {
    v17 = @"(null)";
  }
  if (self->_enableUserInteraction) {
    uint64_t v18 = @"YES";
  }
  else {
    uint64_t v18 = @"NO";
  }
  v26[10] = v17;
  v26[11] = v18;
  v25[11] = @"EnableUserInteraction";
  v25[12] = @"ImpersonationBundleIdentifier";
  impersonationBundleIdentifier = (__CFString *)self->_impersonationBundleIdentifier;
  int64_t pssoAuthenticationMethod = self->_pssoAuthenticationMethod;
  if (!impersonationBundleIdentifier) {
    impersonationBundleIdentifier = @"(null)";
  }
  v26[12] = impersonationBundleIdentifier;
  v25[13] = @"AuthenticationMethod";
  v21 = [NSNumber numberWithInteger:pssoAuthenticationMethod];
  v26[13] = v21;
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:14];
  v23 = [v22 description];

  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)requestedOperation
{
  return self->_requestedOperation;
}

- (void)setRequestedOperation:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (void)setHttpBody:(id)a3
{
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void)setAuditTokenData:(id)a3
{
}

- (NSString)callerBundleIdentifier
{
  return self->_callerBundleIdentifier;
}

- (void)setCallerBundleIdentifier:(id)a3
{
}

- (NSDictionary)authorizationOptions
{
  return self->_authorizationOptions;
}

- (void)setAuthorizationOptions:(id)a3
{
}

- (BOOL)useInternalExtensions
{
  return self->_useInternalExtensions;
}

- (void)setUseInternalExtensions:(BOOL)a3
{
  self->_useInternalExtensions = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_int64_t responseCode = a3;
}

- (BOOL)isCFNetworkInterception
{
  return self->_cfNetworkInterception;
}

- (void)setCfNetworkInterception:(BOOL)a3
{
  self->_cfNetworkInterception = a3;
}

- (BOOL)isCallerManaged
{
  return self->_callerManaged;
}

- (void)setCallerManaged:(BOOL)a3
{
  self->_callerManaged = a3;
}

- (NSString)callerTeamIdentifier
{
  return self->_callerTeamIdentifier;
}

- (void)setCallerTeamIdentifier:(id)a3
{
}

- (NSString)localizedCallerDisplayName
{
  return self->_localizedCallerDisplayName;
}

- (void)setLocalizedCallerDisplayName:(id)a3
{
}

- (BOOL)isUserInteractionEnabled
{
  return self->_enableUserInteraction;
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  self->_enableUserInteraction = a3;
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
}

- (int64_t)pssoAuthenticationMethod
{
  return self->_pssoAuthenticationMethod;
}

- (void)setPssoAuthenticationMethod:(int64_t)a3
{
  self->_int64_t pssoAuthenticationMethod = a3;
}

- (BOOL)canShowOnCoverScreen
{
  return self->_showOnCoverScreen;
}

- (void)setShowOnCoverScreen:(BOOL)a3
{
  self->_showOnCoverScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedCallerDisplayName, 0);
  objc_storeStrong((id *)&self->_callerTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationOptions, 0);
  objc_storeStrong((id *)&self->_callerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_requestedOperation, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end