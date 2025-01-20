@interface ATXGuardedActionBlacklist
@end

@implementation ATXGuardedActionBlacklist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefsBlacklistedApp, 0);
  objc_storeStrong((id *)&self->_blacklistedAppActionForPrimaryShortcuts, 0);
  objc_storeStrong((id *)&self->_blacklistedActionForPrimaryShortcuts, 0);
  objc_storeStrong((id *)&self->_blacklistedAppForPrimaryShortcuts, 0);
  objc_storeStrong((id *)&self->_blacklistedAppActionForShortcuts, 0);
  objc_storeStrong((id *)&self->_blacklistedActionForShortcuts, 0);
  objc_storeStrong((id *)&self->_blacklistedAppForShortcuts, 0);
  objc_storeStrong((id *)&self->_blacklistedAppAction, 0);
  objc_storeStrong((id *)&self->_blacklistedAction, 0);
  objc_storeStrong((id *)&self->_blacklistedApp, 0);
}

@end