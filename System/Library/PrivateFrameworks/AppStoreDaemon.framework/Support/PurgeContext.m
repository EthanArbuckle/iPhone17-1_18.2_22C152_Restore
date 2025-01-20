@interface PurgeContext
@end

@implementation PurgeContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowCutoffDate, 0);
  objc_storeStrong((id *)&self->_windowApps, 0);
  objc_storeStrong((id *)&self->_watchBundles, 0);
  objc_storeStrong((id *)&self->_pluginProtocolDenyList, 0);
  objc_storeStrong((id *)&self->_pluginDenyList, 0);
  objc_storeStrong((id *)&self->_managedBundleIDs, 0);
  objc_storeStrong((id *)&self->_ledgerMap, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_defaultApps, 0);
  objc_storeStrong((id *)&self->_cutoffDate, 0);
  objc_storeStrong((id *)&self->_denyList, 0);
}

@end