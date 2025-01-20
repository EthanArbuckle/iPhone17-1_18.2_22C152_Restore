@interface DBApplication
- (BOOL)isCarInternal;
- (BOOL)isCarPrototype;
- (BOOL)isCertificationApp;
- (BOOL)isFirstParty;
- (BOOL)isHidden;
- (BOOL)isInstalled;
- (BOOL)isInternal;
- (BOOL)isLockedOrHidden;
- (BOOL)isPlaceholder;
- (BOOL)isRestricted;
- (BOOL)presentsFullScreen;
- (BOOL)requiresBackgroundURLDelivery;
- (BOOL)supportsDashboardNavigation;
- (BOOL)supportsInstrumentClusterNavigation;
- (CRCarPlayAppPolicy)appPolicy;
- (DBApplication)initWithApplicationInfo:(id)a3;
- (DBApplicationInfo)info;
- (FBSApplicationPlaceholder)placeholder;
- (NSArray)requiredVehicleAccessories;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAppPolicy:(id)a3;
- (void)setLockedOrHidden:(BOOL)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation DBApplication

- (DBApplication)initWithApplicationInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBApplication;
  v6 = [(DBApplication *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appInfo, a3);
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(DBApplicationInfo *)self->_appInfo bundleIdentifier];
}

- (NSString)displayName
{
  return (NSString *)[(DBApplicationInfo *)self->_appInfo displayName];
}

- (BOOL)isFirstParty
{
  return [(DBApplicationInfo *)self->_appInfo isFirstParty];
}

- (BOOL)isInternal
{
  return [(DBApplicationInfo *)self->_appInfo isInternal];
}

- (BOOL)isCarInternal
{
  return [(DBApplicationInfo *)self->_appInfo isCarInternal];
}

- (BOOL)isHidden
{
  return [(DBApplicationInfo *)self->_appInfo isHidden];
}

- (BOOL)isRestricted
{
  return [(DBApplicationInfo *)self->_appInfo isRestricted];
}

- (BOOL)isInstalled
{
  return [(DBApplicationInfo *)self->_appInfo isInstalled];
}

- (BOOL)requiresBackgroundURLDelivery
{
  return [(DBApplicationInfo *)self->_appInfo requiresBackgroundURLDelivery];
}

- (BOOL)supportsDashboardNavigation
{
  return [(DBApplicationInfo *)self->_appInfo supportsDashboardNavigation];
}

- (BOOL)supportsInstrumentClusterNavigation
{
  return [(DBApplicationInfo *)self->_appInfo supportsInstrumentClusterNavigation];
}

- (BOOL)isCertificationApp
{
  return [(DBApplicationInfo *)self->_appInfo isCertificationApp];
}

- (BOOL)presentsFullScreen
{
  return [(DBApplicationInfo *)self->_appInfo presentsFullScreen];
}

- (NSArray)requiredVehicleAccessories
{
  return [(DBApplicationInfo *)self->_appInfo requiredVehicleAccessories];
}

- (BOOL)isPlaceholder
{
  v2 = [(DBApplication *)self placeholder];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  return (NSString *)[(DBApplication *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(DBApplication *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(DBApplication *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(DBApplication *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[DBApplication isLockedOrHidden](self, "isLockedOrHidden"), @"protected", 1);
  return v3;
}

- (DBApplicationInfo)info
{
  return self->_appInfo;
}

- (BOOL)isCarPrototype
{
  return self->_carPrototype;
}

- (CRCarPlayAppPolicy)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (FBSApplicationPlaceholder)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (BOOL)isLockedOrHidden
{
  return self->_lockedOrHidden;
}

- (void)setLockedOrHidden:(BOOL)a3
{
  self->_lockedOrHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
}

@end