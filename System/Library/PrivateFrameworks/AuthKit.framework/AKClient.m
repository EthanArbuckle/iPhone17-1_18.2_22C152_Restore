@interface AKClient
+ (BOOL)isAppWithBundleIDForeground:(id)a3;
- (AKClient)initWithAuditToken:(id *)a3;
- (AKClient)initWithConnection:(id)a3;
- (BOOL)_BOOLValueForEntitlement:(id)a3;
- (BOOL)_hasApprovedSigningIdentifier;
- (BOOL)_isAppleBinary;
- (BOOL)_isOnInternalBuild;
- (BOOL)authorizationClientProvidesUI;
- (BOOL)authorizationRequiresRapport;
- (BOOL)hasBirthdayAccess;
- (BOOL)hasCompanionKeyEnvelopeAccess;
- (BOOL)hasInternalAccess;
- (BOOL)hasInternalEntitledAccess;
- (BOOL)hasInternalPrivateAccess;
- (BOOL)hasInternalPrivateEntitlementAccess;
- (BOOL)hasOwnerAccess;
- (BOOL)hasPrivateAccess;
- (BOOL)hasPrivateSignedAccess;
- (BOOL)hasPublicAccess;
- (BOOL)hasServerOnlyDeviceListAccess;
- (BOOL)hasSiwaAccountListAccess;
- (BOOL)hasSiwaDefaultEntitlementAccess;
- (BOOL)hasSiwaEntitlement;
- (BOOL)hasSiwaUnderageEntitlementAccess;
- (BOOL)hasWriteAccess;
- (BOOL)isExemptedFromMandatoryUISecurityUpgrade;
- (BOOL)isPermittedForInteractiveAuthOnLimitedContext;
- (BOOL)isPermittedToAccessBirthday;
- (BOOL)isPermittedToProxy;
- (BOOL)isPermittedToProxyAuthorizationBundleIdentifier;
- (BOOL)isPermittedToProxyInitialAuth;
- (NSData)auditTokenData;
- (NSString)appID;
- (NSString)authorizationAccessLevel;
- (NSString)bundleID;
- (NSString)fullName;
- (NSString)localizedAppName;
- (NSString)name;
- (NSString)teamID;
- (NSXPCConnection)xpcConnection;
- (id)_appIDForIOS;
- (id)_appIDForMacOS;
- (id)_approvedCodeSigningIdentifiers;
- (id)_arrayValueForEntitlement:(id)a3;
- (id)_authorizationAccessLevels;
- (id)_bundle;
- (id)_bundleNonPluginKit;
- (id)_codeSigningIdentifier;
- (id)_exemptedBundleIDsFromMandatoryUISecurityUpgrade;
- (id)_permitedProcessNamesToProxyInitialAuthWhiteList;
- (id)_permittedProcessNamesForInteractiveAuthOnLimitedContext;
- (id)_permittedProcessNamesToProxyAllowlist;
- (id)_stringValueForEntitlement:(id)a3;
- (id)description;
- (id)proxyWithErrorHandler:(id)a3;
@end

@implementation AKClient

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    int v4 = [(NSXPCConnection *)self->_connection processIdentifier];
    if (proc_name(v4, buffer, 0x20u) < 1)
    {
      *(void *)v11 = 0xE00000001;
      int v12 = 1;
      int v13 = v4;
      size_t v9 = 648;
      memset(v10, 0, 512);
      if (sysctl(v11, 4u, v10, &v9, 0, 0))
      {
        v6 = @"?";
        goto LABEL_7;
      }
      if (!BYTE3(v10[15]))
      {
        v6 = @"exited?";
        goto LABEL_7;
      }
      v5 = (char *)&v10[15] + 3;
    }
    else
    {
      v5 = buffer;
    }
    v6 = +[NSString stringWithUTF8String:v5];
LABEL_7:
    v7 = self->_name;
    self->_name = &v6->isa;

    name = self->_name;
  }

  return name;
}

- (AKClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKClient;
  v6 = [(AKClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)description
{
  description = self->_description;
  if (!description)
  {
    int v4 = [(AKClient *)self name];
    id v5 = +[NSNumber numberWithInt:[(NSXPCConnection *)self->_connection processIdentifier]];
    v6 = +[NSString stringWithFormat:@"%@ (%@)", v4, v5];
    v7 = self->_description;
    self->_description = v6;

    description = self->_description;
  }

  return description;
}

- (BOOL)hasInternalPrivateAccess
{
  if ([(AKClient *)self hasInternalPrivateEntitlementAccess]) {
    return 1;
  }

  return [(AKClient *)self hasPrivateSignedAccess];
}

- (BOOL)hasPrivateAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.client.private"];
}

- (BOOL)hasInternalPrivateEntitlementAccess
{
  if ([(AKClient *)self hasInternalAccess]) {
    return 1;
  }

  return [(AKClient *)self hasPrivateAccess];
}

- (BOOL)hasInternalAccess
{
  if ([(AKClient *)self hasOwnerAccess]) {
    return 1;
  }

  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.client.internal"];
}

- (BOOL)_BOOLValueForEntitlement:(id)a3
{
  id v4 = a3;
  auditToken = self->_auditToken;
  if (!auditToken) {
    auditToken = self->_connection;
  }
  v6 = [auditToken valueForEntitlement:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)hasOwnerAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.client.owner"];
}

- (BOOL)hasWriteAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.writer.internal"];
}

+ (BOOL)isAppWithBundleIDForeground:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  int v5 = [v4 applicationStateForApplication:v3];
  [v4 invalidate];
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10017AE04((uint64_t)v3, v5, v6);
  }

  BOOL v8 = v5 == 8 || v5 == 32;
  return v8;
}

- (AKClient)initWithAuditToken:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AKClient;
  id v4 = [(AKClient *)&v11 init];
  if (v4)
  {
    id v5 = sub_100016118();
    long long v6 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v6;
    uint64_t v7 = [v5 tokenFromAuditToken:v10];
    auditToken = v4->_auditToken;
    v4->_auditToken = (BSAuditToken *)v7;
  }
  return v4;
}

- (NSXPCConnection)xpcConnection
{
  return self->_connection;
}

- (BOOL)hasInternalEntitledAccess
{
  if ([(AKClient *)self hasInternalPrivateEntitlementAccess]) {
    return 1;
  }

  return [(AKClient *)self hasOwnerAccess];
}

- (BOOL)hasSiwaEntitlement
{
  v2 = [(AKClient *)self _authorizationAccessLevels];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasSiwaDefaultEntitlementAccess
{
  v2 = [(AKClient *)self _authorizationAccessLevels];
  unsigned __int8 v3 = [v2 containsObject:@"Default"];

  return v3;
}

- (BOOL)hasSiwaUnderageEntitlementAccess
{
  v2 = [(AKClient *)self _authorizationAccessLevels];
  unsigned __int8 v3 = [v2 containsObject:@"underage-users"];

  return v3;
}

- (BOOL)hasSiwaAccountListAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.siwa-list"];
}

- (BOOL)hasServerOnlyDeviceListAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.devicelist.server-only"];
}

- (BOOL)hasCompanionKeyEnvelopeAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.property.companion-key-envelope"];
}

- (BOOL)hasPublicAccess
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.client"];
}

- (BOOL)hasPrivateSignedAccess
{
  BOOL v3 = [(AKClient *)self _isAppleBinary];
  if (v3)
  {
    LOBYTE(v3) = [(AKClient *)self _hasApprovedSigningIdentifier];
  }
  return v3;
}

- (BOOL)hasBirthdayAccess
{
  BOOL v3 = [(AKClient *)self hasPrivateAccess];
  if (v3)
  {
    LOBYTE(v3) = [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.birthday"];
  }
  return v3;
}

- (BOOL)_hasApprovedSigningIdentifier
{
  BOOL v3 = [(AKClient *)self _codeSigningIdentifier];
  id v4 = [(AKClient *)self _approvedCodeSigningIdentifiers];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (id)_codeSigningIdentifier
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  BOOL v3 = SecTaskCreateWithAuditToken(0, &v7);
  if (v3)
  {
    id v4 = v3;
    unsigned __int8 v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0);
    CFRelease(v4);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_approvedCodeSigningIdentifiers
{
  return +[NSSet setWithObjects:@"com.apple.dt.Xcode", @"com.apple.dt.xcodebuild", @"com.apple.dt.xcscontrol", 0];
}

- (BOOL)_isAppleBinary
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  id v4 = SecTaskCreateWithAuditToken(0, &v8);
  if (v4)
  {
    unsigned __int8 v5 = v4;
    uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v4);
    CFRelease(v5);
    if ((CodeSignStatus & 0xC000001) == 0x4000001) {
      LOBYTE(v4) = 1;
    }
    else {
      LOBYTE(v4) = [(AKClient *)self _isOnInternalBuild];
    }
  }
  return (char)v4;
}

- (BOOL)_isOnInternalBuild
{
  return _os_variant_has_internal_content("com.apple.akd", a2);
}

- (id)_permittedProcessNamesToProxyAllowlist
{
  if (qword_100272238 != -1) {
    dispatch_once(&qword_100272238, &stru_100226E60);
  }
  v2 = (void *)qword_100272230;

  return v2;
}

- (BOOL)isPermittedToProxy
{
  BOOL v3 = [(AKClient *)self _permittedProcessNamesToProxyAllowlist];
  id v4 = [(AKClient *)self name];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_permitedProcessNamesToProxyInitialAuthWhiteList
{
  if (qword_100272248 != -1) {
    dispatch_once(&qword_100272248, &stru_100226E80);
  }
  v2 = (void *)qword_100272240;

  return v2;
}

- (BOOL)isPermittedToProxyInitialAuth
{
  BOOL v3 = [(AKClient *)self _permitedProcessNamesToProxyInitialAuthWhiteList];
  id v4 = [(AKClient *)self name];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_permittedProcessNamesForInteractiveAuthOnLimitedContext
{
  if (qword_100272258 != -1) {
    dispatch_once(&qword_100272258, &stru_100226EA0);
  }
  v2 = (void *)qword_100272250;

  return v2;
}

- (BOOL)isPermittedForInteractiveAuthOnLimitedContext
{
  BOOL v3 = [(AKClient *)self _permittedProcessNamesForInteractiveAuthOnLimitedContext];
  id v4 = [(AKClient *)self name];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_exemptedBundleIDsFromMandatoryUISecurityUpgrade
{
  if (qword_100272268 != -1) {
    dispatch_once(&qword_100272268, &stru_100226EC0);
  }
  v2 = (void *)qword_100272260;

  return v2;
}

- (BOOL)isExemptedFromMandatoryUISecurityUpgrade
{
  BOOL v3 = [(AKClient *)self _exemptedBundleIDsFromMandatoryUISecurityUpgrade];
  id v4 = [(AKClient *)self bundleID];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)isPermittedToProxyAuthorizationBundleIdentifier
{
  return [(AKClient *)self _BOOLValueForEntitlement:@"com.apple.authkit.authorization-bundle-identifier-proxy"];
}

- (BOOL)isPermittedToAccessBirthday
{
  BOOL v3 = +[NSArray arrayWithObjects:@"com.apple.WatchFacesWallpaperSupport.SnoopyPoster", @"com.apple.appleaccountd", @"com.apple.AKTester", 0];
  id v4 = [(AKClient *)self bundleID];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (NSData)auditTokenData
{
  auditToken = self->_auditToken;
  if (auditToken)
  {
    [(BSAuditToken *)auditToken realToken];
    id v4 = [objc_alloc((Class)NSData) initWithBytes:&v9 length:32];
  }
  else if (self->_connection)
  {
    unsigned __int8 v5 = [sub_100016118() tokenFromNSXPCConnection:self->_connection];
    long long v6 = v5;
    long long v9 = 0u;
    long long v10 = 0u;
    if (v5) {
      objc_msgSend(v5, "realToken", v9, v10);
    }
    id v4 = [objc_alloc((Class)NSData) initWithBytes:&v9 length:32];
  }
  else
  {
    audit_token_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10017AE8C((uint64_t)self, v7);
    }

    id v4 = 0;
  }

  return (NSData *)v4;
}

- (NSString)fullName
{
  fullName = self->_fullName;
  if (!fullName)
  {
    id v4 = [(AKClient *)self _bundle];
    unsigned __int8 v5 = [v4 objectForInfoDictionaryKey:kCFBundleNameKey];
    long long v6 = self->_fullName;
    self->_fullName = v5;

    fullName = self->_fullName;
    if (!fullName)
    {
      audit_token_t v7 = [(AKClient *)self name];
      audit_token_t v8 = self->_fullName;
      self->_fullName = v7;

      fullName = self->_fullName;
    }
  }

  return fullName;
}

- (NSString)localizedAppName
{
  v2 = [(AKClient *)self bundleID];
  BOOL v3 = +[LSApplicationProxy applicationProxyForIdentifier:v2];

  id v4 = [v3 localizedNameForContext:0];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 localizedName];
  }
  audit_token_t v7 = v6;

  return (NSString *)v7;
}

- (id)_bundleNonPluginKit
{
  id v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", buffer, proc_pidpath(-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), buffer, 0x1000u), 4);
  BOOL v3 = +[NSURL fileURLWithPath:v2];

  if (v3)
  {
    id v4 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    unsigned __int8 v5 = +[NSBundle bundleWithURL:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_bundle
{
  uint64_t v3 = [(NSXPCConnection *)self->_connection processIdentifier];
  if (!v3)
  {
    id v6 = 0;
LABEL_6:
    long long v9 = [(AKClient *)self _bundleNonPluginKit];
    goto LABEL_7;
  }
  uint64_t v4 = v3;
  unsigned __int8 v5 = +[PKManager defaultManager];
  id v6 = [v5 containingAppForPlugInWithPid:v4];

  if (!v6) {
    goto LABEL_6;
  }
  audit_token_t v7 = +[LSApplicationProxy applicationProxyForIdentifier:v6];
  audit_token_t v8 = [v7 bundleURL];
  long long v9 = +[NSBundle bundleWithURL:v8];

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (!connection)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "XPC connection is nil, couldn't create remote object.", v9, 2u);
    }

    connection = self->_connection;
  }
  audit_token_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];

  return v7;
}

- (NSString)bundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    id v4 = +[PKManager defaultManager];
    objc_msgSend(v4, "containingAppForPlugInWithPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
    unsigned __int8 v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_bundleID;
    self->_bundleID = v5;

    bundleID = self->_bundleID;
    if (!bundleID)
    {
      id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", buffer, proc_pidpath(-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), buffer, 0x1000u), 4);
      CFURLRef v8 = +[NSURL fileURLWithPath:v7];

      if (v8)
      {
        long long v9 = (void *)_CFBundleCopyBundleURLForExecutableURL();
        long long v10 = +[NSBundle bundleWithURL:v9];
        objc_super v11 = [v10 bundleIdentifier];
        int v12 = self->_bundleID;
        self->_bundleID = v11;

        if (!self->_bundleID)
        {
          int v13 = _AKLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_10017AF08((uint64_t)self, v13);
          }

          CFDictionaryRef v14 = CFBundleCopyInfoDictionaryForURL(v8);
          v15 = [(__CFDictionary *)v14 objectForKeyedSubscript:kCFBundleIdentifierKey];
          v16 = self->_bundleID;
          self->_bundleID = v15;
        }
      }

      bundleID = self->_bundleID;
    }
  }

  return bundleID;
}

- (NSString)appID
{
  uint64_t v3 = [(AKClient *)self _appIDForIOS];
  if (![v3 length])
  {
    uint64_t v4 = [(AKClient *)self _appIDForMacOS];

    uint64_t v3 = (void *)v4;
  }
  id v5 = v3;

  return (NSString *)v5;
}

- (id)_appIDForMacOS
{
  id v2 = [(AKClient *)self _stringValueForEntitlement:@"com.apple.application-identifier"];
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_appIDForIOS
{
  id v2 = [(AKClient *)self _stringValueForEntitlement:@"application-identifier"];
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSString)teamID
{
  id v2 = [(AKClient *)self _stringValueForEntitlement:@"com.apple.developer.team-identifier"];
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (id)_authorizationAccessLevels
{
  id v2 = [(AKClient *)self _arrayValueForEntitlement:@"com.apple.developer.applesignin"];
  if ([v2 count])
  {
    id v3 = +[NSSet setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)authorizationRequiresRapport
{
  return 0;
}

- (BOOL)authorizationClientProvidesUI
{
  return 0;
}

- (id)_arrayValueForEntitlement:(id)a3
{
  id v3 = [(NSXPCConnection *)self->_connection valueForEntitlement:a3];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_stringValueForEntitlement:(id)a3
{
  id v4 = a3;
  auditToken = self->_auditToken;
  if (!auditToken) {
    auditToken = self->_connection;
  }
  id v6 = [auditToken valueForEntitlement:v4];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (NSString)authorizationAccessLevel
{
  return self->_authorizationAccessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationAccessLevel, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end