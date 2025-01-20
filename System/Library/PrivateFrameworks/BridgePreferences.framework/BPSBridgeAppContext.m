@interface BPSBridgeAppContext
+ (id)shared;
- (BOOL)inWatchSetupFlow;
- (BOOL)isInWatchSetupFlow;
- (BOOL)isRestoringToKnownDevice;
- (BOOL)isSyncTrapEnabled;
- (BOOL)isSyncTrapUIEnabled;
- (BOOL)syncTrapEnabled;
- (BOOL)syncTrapUIEnabled;
- (NRDevice)activeDevice;
- (NSDictionary)installedWatchkitApps;
- (NSMutableDictionary)watchAppInstallStates;
- (PBBridgeCompanionController)bridgeController;
- (void)setActiveDevice:(id)a3;
- (void)setBridgeController:(id)a3;
- (void)setInWatchSetupFlow:(BOOL)a3;
- (void)setInstalledWatchkitApps:(id)a3;
- (void)setSyncTrapUIEnabled:(BOOL)a3;
- (void)setWatchAppInstallStates:(id)a3;
- (void)tellWatchToSetSiriEnabled:(BOOL)a3;
- (void)updateIsRestoringToKnownDevice:(BOOL)a3;
@end

@implementation BPSBridgeAppContext

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)shared_sharedInstance;
  return v2;
}

- (NRDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setBridgeController:(id)a3
{
}

uint64_t __29__BPSBridgeAppContext_shared__block_invoke()
{
  shared_sharedInstance = objc_alloc_init(BPSBridgeAppContext);
  return MEMORY[0x270F9A758]();
}

- (void)tellWatchToSetSiriEnabled:(BOOL)a3
{
}

- (void)setInWatchSetupFlow:(BOOL)a3
{
  self->_inWatchSetupFlow = a3;
}

- (BOOL)isInWatchSetupFlow
{
  return self->_inWatchSetupFlow;
}

- (void)setSyncTrapUIEnabled:(BOOL)a3
{
  self->_syncTrapUIEnabled = a3;
}

- (BOOL)isSyncTrapUIEnabled
{
  return self->_syncTrapUIEnabled;
}

- (BOOL)isSyncTrapEnabled
{
  return self->_syncTrapUIEnabled;
}

- (void)updateIsRestoringToKnownDevice:(BOOL)a3
{
  self->_isRestoringToKnownDevice = a3;
}

- (NSDictionary)installedWatchkitApps
{
  return self->_installedWatchkitApps;
}

- (void)setInstalledWatchkitApps:(id)a3
{
}

- (NSMutableDictionary)watchAppInstallStates
{
  return self->_watchAppInstallStates;
}

- (void)setWatchAppInstallStates:(id)a3
{
}

- (void)setActiveDevice:(id)a3
{
}

- (BOOL)inWatchSetupFlow
{
  return self->_inWatchSetupFlow;
}

- (BOOL)syncTrapEnabled
{
  return self->_syncTrapEnabled;
}

- (BOOL)syncTrapUIEnabled
{
  return self->_syncTrapUIEnabled;
}

- (BOOL)isRestoringToKnownDevice
{
  return self->_isRestoringToKnownDevice;
}

- (PBBridgeCompanionController)bridgeController
{
  return self->_bridgeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeController, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_watchAppInstallStates, 0);
  objc_storeStrong((id *)&self->_installedWatchkitApps, 0);
}

@end