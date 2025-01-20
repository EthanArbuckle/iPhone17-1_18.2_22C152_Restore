@interface AKProxiedClientContext
- (BOOL)isRapportLogin;
- (BOOL)shouldSkipAuthorizationUI;
- (NSArray)associatedDomains;
- (NSString)appID;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)deviceClass;
- (NSString)deviceName;
- (NSString)teamID;
- (void)setAppID:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIsRapportLogin:(BOOL)a3;
- (void)setShouldSkipAuthorizationUI:(BOOL)a3;
- (void)setTeamID:(id)a3;
@end

@implementation AKProxiedClientContext

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)isRapportLogin
{
  return self->_isRapportLogin;
}

- (void)setIsRapportLogin:(BOOL)a3
{
  self->_isRapportLogin = a3;
}

- (BOOL)shouldSkipAuthorizationUI
{
  return self->_shouldSkipAuthorizationUI;
}

- (void)setShouldSkipAuthorizationUI:(BOOL)a3
{
  self->_shouldSkipAuthorizationUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_teamID, 0);
}

@end