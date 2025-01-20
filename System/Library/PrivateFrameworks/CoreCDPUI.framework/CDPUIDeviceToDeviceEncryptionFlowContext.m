@interface CDPUIDeviceToDeviceEncryptionFlowContext
- (BOOL)forceInlinePresentation;
- (BOOL)isDemoDevice;
- (BOOL)requiresSynchronousRepair;
- (BOOL)shouldSuppressPasscodeCreationCancelPrompt;
- (CDPContext)cdpContext;
- (CDPContext)repairContext;
- (CDPLocalSecret)cachedLocalSecret;
- (CDPUIDeviceToDeviceEncryptionFlowContext)initWithAltDSID:(id)a3;
- (CDPUIDeviceToDeviceEncryptionFlowContext)initWithCDPContext:(id)a3;
- (NSString)altDSID;
- (NSString)featureName;
- (NSString)securityUpgradeContext;
- (NSString)telemetryFlowID;
- (UIViewController)presentingViewController;
- (int64_t)deviceToDeviceEncryptionUpgradeType;
- (int64_t)deviceToDeviceEncryptionUpgradeUIStyle;
- (void)setCachedLocalSecret:(id)a3;
- (void)setDeviceToDeviceEncryptionUpgradeType:(int64_t)a3;
- (void)setDeviceToDeviceEncryptionUpgradeUIStyle:(int64_t)a3;
- (void)setFeatureName:(id)a3;
- (void)setForceInlinePresentation:(BOOL)a3;
- (void)setIsDemoDevice:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRepairContext:(id)a3;
- (void)setRequiresSynchronousRepair:(BOOL)a3;
- (void)setSecurityUpgradeContext:(id)a3;
- (void)setShouldSuppressPasscodeCreationCancelPrompt:(BOOL)a3;
- (void)setTelemetryFlowID:(id)a3;
@end

@implementation CDPUIDeviceToDeviceEncryptionFlowContext

- (CDPUIDeviceToDeviceEncryptionFlowContext)initWithAltDSID:(id)a3
{
  v4 = [MEMORY[0x263F34350] contextForAccountWithAltDSID:a3];
  v5 = [(CDPUIDeviceToDeviceEncryptionFlowContext *)self initWithCDPContext:v4];

  return v5;
}

- (CDPUIDeviceToDeviceEncryptionFlowContext)initWithCDPContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPUIDeviceToDeviceEncryptionFlowContext;
  v6 = [(CDPUIDeviceToDeviceEncryptionFlowContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cdpContext, a3);
    objc_storeStrong((id *)&v7->_securityUpgradeContext, (id)*MEMORY[0x263F290A0]);
    v7->_isDemoDevice = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0) != 0;
  }

  return v7;
}

- (NSString)altDSID
{
  v2 = [(CDPUIDeviceToDeviceEncryptionFlowContext *)self cdpContext];
  v3 = [v2 altDSID];

  return (NSString *)v3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (int64_t)deviceToDeviceEncryptionUpgradeUIStyle
{
  return self->_deviceToDeviceEncryptionUpgradeUIStyle;
}

- (void)setDeviceToDeviceEncryptionUpgradeUIStyle:(int64_t)a3
{
  self->_deviceToDeviceEncryptionUpgradeUIStyle = a3;
}

- (int64_t)deviceToDeviceEncryptionUpgradeType
{
  return self->_deviceToDeviceEncryptionUpgradeType;
}

- (void)setDeviceToDeviceEncryptionUpgradeType:(int64_t)a3
{
  self->_deviceToDeviceEncryptionUpgradeType = a3;
}

- (NSString)securityUpgradeContext
{
  return self->_securityUpgradeContext;
}

- (void)setSecurityUpgradeContext:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (CDPLocalSecret)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (void)setCachedLocalSecret:(id)a3
{
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (BOOL)requiresSynchronousRepair
{
  return self->_requiresSynchronousRepair;
}

- (void)setRequiresSynchronousRepair:(BOOL)a3
{
  self->_requiresSynchronousRepair = a3;
}

- (CDPContext)repairContext
{
  return self->_repairContext;
}

- (void)setRepairContext:(id)a3
{
}

- (BOOL)shouldSuppressPasscodeCreationCancelPrompt
{
  return self->_shouldSuppressPasscodeCreationCancelPrompt;
}

- (void)setShouldSuppressPasscodeCreationCancelPrompt:(BOOL)a3
{
  self->_shouldSuppressPasscodeCreationCancelPrompt = a3;
}

- (BOOL)isDemoDevice
{
  return self->_isDemoDevice;
}

- (void)setIsDemoDevice:(BOOL)a3
{
  self->_isDemoDevice = a3;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_repairContext, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_securityUpgradeContext, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end