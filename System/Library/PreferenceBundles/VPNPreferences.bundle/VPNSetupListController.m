@interface VPNSetupListController
- (BOOL)alwaysPrompt;
- (BOOL)deleteConfiguration:(id)a3;
- (BOOL)dirty;
- (BOOL)editMode;
- (BOOL)haveEnoughValues;
- (BOOL)onDemandEnabled;
- (BOOL)onDemandService;
- (BOOL)overviewMode;
- (BOOL)passwordEditOnly;
- (BOOL)passwordRequired;
- (BOOL)pptpWarningAccepted;
- (BOOL)profileBacked;
- (BOOL)proxyAuthenticated;
- (BOOL)saveConfigurationSettings;
- (BOOL)sendAllTraffic;
- (BOOL)useRSASecurID;
- (BOOL)userCreated;
- (BOOL)usesCertificates;
- (NSArray)certificateIDs;
- (NSArray)certificateObjects;
- (NSArray)excludeDomains;
- (NSArray)manualProxySpecifiers;
- (NSArray)matchDomains;
- (NSArray)pacSpecifiers;
- (NSArray)proxyAuthSpecifiers;
- (NSArray)proxyGroupSpecifiers;
- (NSArray)typeTabSpecifiers;
- (NSDictionary)includedBundleIDs;
- (NSMutableArray)timeSpecifierArray;
- (NSObject)certificateID;
- (NSString)account;
- (NSString)appName;
- (NSString)displayName;
- (NSString)groupDisplayName;
- (NSString)localIdentifier;
- (NSString)password;
- (NSString)proxyPACFile;
- (NSString)proxyPassword;
- (NSString)proxyPort;
- (NSString)proxyServer;
- (NSString)proxyUsername;
- (NSString)remoteIdentifier;
- (NSString)server;
- (NSString)sharedSecret;
- (NSUUID)serviceID;
- (PSSpecifier)accountSpecifier;
- (PSSpecifier)authTypeSpecifier;
- (PSSpecifier)certificateListSpecifier;
- (PSSpecifier)ciscoImageSpecifier;
- (PSSpecifier)connectSpecifier;
- (PSSpecifier)displayNameSpecifier;
- (PSSpecifier)eapTypeSpecifier;
- (PSSpecifier)editButton;
- (PSSpecifier)editServerSpecifier;
- (PSSpecifier)enableButton;
- (PSSpecifier)encryptionTypeSpecifier;
- (PSSpecifier)groupNameSpecifier;
- (PSSpecifier)localIdentifierSpecifier;
- (PSSpecifier)passwordSpecifier;
- (PSSpecifier)proxyLabelSpecifier;
- (PSSpecifier)remoteIdentifierSpecifier;
- (PSSpecifier)rsaSpecifier;
- (PSSpecifier)sendAllTrafficSpecifier;
- (PSSpecifier)serverAddressSpecifier;
- (PSSpecifier)serverSpecifier;
- (PSSpecifier)sharedSecretSpecifier;
- (PSSpecifier)timeSpecifier;
- (PSSpecifier)useCertificateSwitchSpecifier;
- (PSSpecifier)vpnGradeStaticSpecifier;
- (UIBarButtonItem)backButton;
- (VPNSetupListController)init;
- (__CFString)vpnTypeForSpecifier:(id)a3;
- (id)authTypeForSpecifier:(id)a3;
- (id)bundle;
- (id)certificateObjectForSpecifier:(id)a3;
- (id)connection;
- (id)eapTypeForSpecifier:(id)a3;
- (id)getConnectionStateForSpecifier:(id)a3;
- (id)getDescriptionForApp:(id)a3;
- (id)interfaceTypeForConnection:(id)a3;
- (id)localIP2ForSpecifier:(id)a3;
- (id)localIPForSpecifier:(id)a3;
- (id)onDemand:(id)a3;
- (id)pacFile:(id)a3;
- (id)pptpEncryptionLevelForSpecifier:(id)a3;
- (id)proxyPassword:(id)a3;
- (id)proxyServer:(id)a3;
- (id)proxyServerPort:(id)a3;
- (id)proxyType:(id)a3;
- (id)proxyUsername:(id)a3;
- (id)proxyUsesAuthentication:(id)a3;
- (id)remoteIPForSpecifier:(id)a3;
- (id)sendAllTraffic:(id)a3;
- (id)serverForConnection:(id)a3;
- (id)specifiers;
- (id)statusForConnection:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)timeConnectedForSpecifier:(id)a3;
- (id)tunnelType:(id)a3;
- (id)typeForConnection:(id)a3;
- (id)useRSASecurIDForSpecifier:(id)a3;
- (id)usernameForConnection:(id)a3;
- (id)usesCertificatesForSpecifier:(id)a3;
- (id)vpnGradeForSpecifier:(id)a3;
- (id)vpnGradeNameForSpecifier:(id)a3;
- (int64_t)tableViewStyle;
- (unint64_t)authType;
- (unint64_t)currentVPNType;
- (unint64_t)eapType;
- (unint64_t)encryptionType;
- (unint64_t)originalVPNType;
- (unint64_t)proxyType;
- (unint64_t)vpnGrade;
- (void)appWillEnterForeground:(id)a3;
- (void)cancelButtonClicked:(id)a3;
- (void)dealloc;
- (void)deleteConfirm:(id)a3;
- (void)deleteVPNConfiguration:(id)a3;
- (void)disableButtonTapped:(id)a3;
- (void)displayAlertWithTitle:(id)a3 message:(id)a4 cancel:(id)a5;
- (void)enableButtonTapped:(id)a3;
- (void)enterEditMode;
- (void)leaveEditMode;
- (void)loadView;
- (void)renewCertificate:(id)a3;
- (void)saveButtonClicked:(id)a3;
- (void)saveButtonTapped:(id)a3;
- (void)scrollToSpecifier:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountSpecifier:(id)a3;
- (void)setAlwaysPrompt:(BOOL)a3;
- (void)setAppName:(id)a3;
- (void)setAuthType:(id)a3 forSpecifier:(id)a4;
- (void)setAuthType:(unint64_t)a3;
- (void)setAuthTypeSpecifier:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setCertificateID:(id)a3;
- (void)setCertificateIDs:(id)a3;
- (void)setCertificateListSpecifier:(id)a3;
- (void)setCertificateObject:(id)a3 forSpecifier:(id)a4;
- (void)setCertificateObjects:(id)a3;
- (void)setCiscoImageSpecifier:(id)a3;
- (void)setConnectSpecifier:(id)a3;
- (void)setConnectionState:(id)a3 forSpecifier:(id)a4;
- (void)setCurrentVPNType:(unint64_t)a3;
- (void)setDirty:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayName:(id)a3 forSpecifier:(id)a4;
- (void)setDisplayNameSpecifier:(id)a3;
- (void)setEAPType:(id)a3 forSpecifier:(id)a4;
- (void)setEapType:(unint64_t)a3;
- (void)setEapTypeSpecifier:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setEditMode:(BOOL)a3;
- (void)setEditServerSpecifier:(id)a3;
- (void)setEnableButton:(id)a3;
- (void)setEncryptionType:(unint64_t)a3;
- (void)setEncryptionTypeSpecifier:(id)a3;
- (void)setExcludeDomains:(id)a3;
- (void)setGroupDisplayName:(id)a3;
- (void)setGroupDisplayName:(id)a3 forSpecifier:(id)a4;
- (void)setGroupNameSpecifier:(id)a3;
- (void)setIncludedBundleIDs:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setLocalIdentifier:(id)a3 forSpecifier:(id)a4;
- (void)setLocalIdentifierSpecifier:(id)a3;
- (void)setManualProxySpecifiers:(id)a3;
- (void)setMatchDomains:(id)a3;
- (void)setOnDemand:(id)a3 forSpecifier:(id)a4;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandService:(BOOL)a3;
- (void)setOnDemandService:(id)a3 forSpecifier:(id)a4;
- (void)setOriginalVPNType:(unint64_t)a3;
- (void)setOverviewMode:(BOOL)a3;
- (void)setPPTPEncryptionLevel:(id)a3 forSpecifier:(id)a4;
- (void)setPacFile:(id)a3 specifier:(id)a4;
- (void)setPacSpecifiers:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPassword:(id)a3 forSpecifier:(id)a4;
- (void)setPasswordEditOnly:(BOOL)a3;
- (void)setPasswordRequired:(BOOL)a3;
- (void)setPasswordRequired:(id)a3 forSpecifier:(id)a4;
- (void)setPasswordSpecifier:(id)a3;
- (void)setPptpWarningAccepted:(BOOL)a3;
- (void)setProfileBacked:(BOOL)a3;
- (void)setProxyAuthSpecifiers:(id)a3;
- (void)setProxyAuthenticated:(BOOL)a3;
- (void)setProxyGroupSpecifiers:(id)a3;
- (void)setProxyLabelSpecifier:(id)a3;
- (void)setProxyPACFile:(id)a3;
- (void)setProxyPassword:(id)a3;
- (void)setProxyPassword:(id)a3 specifier:(id)a4;
- (void)setProxyPort:(id)a3;
- (void)setProxyServer:(id)a3;
- (void)setProxyServer:(id)a3 specifier:(id)a4;
- (void)setProxyServerPort:(id)a3 specifier:(id)a4;
- (void)setProxyType:(id)a3 specifier:(id)a4;
- (void)setProxyType:(unint64_t)a3;
- (void)setProxyUsername:(id)a3;
- (void)setProxyUsername:(id)a3 specifier:(id)a4;
- (void)setProxyUsesAuthentication:(id)a3 specifier:(id)a4;
- (void)setRemoteIdentifier:(id)a3;
- (void)setRemoteIdentifier:(id)a3 forSpecifier:(id)a4;
- (void)setRemoteIdentifierSpecifier:(id)a3;
- (void)setRsaSpecifier:(id)a3;
- (void)setSendAllTraffic:(BOOL)a3;
- (void)setSendAllTraffic:(id)a3 forSpecifier:(id)a4;
- (void)setSendAllTrafficSpecifier:(id)a3;
- (void)setServer:(id)a3;
- (void)setServer:(id)a3 forSpecifier:(id)a4;
- (void)setServerAddressSpecifier:(id)a3;
- (void)setServerSpecifier:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setSharedSecret:(id)a3;
- (void)setSharedSecret:(id)a3 forSpecifier:(id)a4;
- (void)setSharedSecretSpecifier:(id)a3;
- (void)setStateForServiceID:(id)a3;
- (void)setTimeSpecifier:(id)a3;
- (void)setTimeSpecifierArray:(id)a3;
- (void)setTypeTabSpecifiers:(id)a3;
- (void)setUseCertificateSwitchSpecifier:(id)a3;
- (void)setUseRSASecurID:(BOOL)a3;
- (void)setUseRSASecurID:(id)a3 forSpecifier:(id)a4;
- (void)setUserCreated:(BOOL)a3;
- (void)setUsername:(id)a3 forSpecifier:(id)a4;
- (void)setUsesCertificates:(BOOL)a3;
- (void)setUsesCertificates:(id)a3 forSpecifier:(id)a4;
- (void)setVPNGrade:(id)a3 forSpecifier:(id)a4;
- (void)setVPNType:(__CFString *)a3 forSpecifier:(id)a4;
- (void)setVpnGrade:(unint64_t)a3;
- (void)setVpnGradeStaticSpecifier:(id)a3;
- (void)timerUpdated:(id)a3;
- (void)updateDoneButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)vpnConfigurationChanged:(id)a3;
- (void)warnForPPTP;
@end

@implementation VPNSetupListController

- (void)vpnConfigurationChanged:(id)a3
{
  if ([(VPNSetupListController *)self overviewMode])
  {
    [(VPNSetupListController *)self reloadSpecifiers];
  }
}

- (void)appWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v5 objectForKeyedSubscript:@"vpn-service-id"];
  v8 = objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  objc_initWeak(&location, v8);

  id v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  objc_destroyWeak(&location);
}

- (void)timerUpdated:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(VPNSetupListController *)self timeSpecifierArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(VPNSetupListController *)self reloadSpecifier:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [(VPNSetupListController *)self timeSpecifier];
  [(VPNSetupListController *)self reloadSpecifier:v9];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:kNotificationVPNConnectionStatusChanged object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:kNotificationVPNConnectionTimerFired object:0];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"VPNNEConfigurationChangedNotification" object:0];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];

  v7.receiver = self;
  v7.super_class = (Class)VPNSetupListController;
  [(VPNSetupListController *)&v7 dealloc];
}

- (VPNSetupListController)init
{
  v8.receiver = self;
  v8.super_class = (Class)VPNSetupListController;
  v2 = [(VPNSetupListController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_vpnStatusChanged_ name:kNotificationVPNConnectionStatusChanged object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_timerUpdated_ name:kNotificationVPNConnectionTimerFired object:0];

    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_vpnConfigurationChanged_ name:@"VPNNEConfigurationChangedNotification" object:0];

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_appWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v2;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)proxyServer:(id)a3
{
  id v4 = [(VPNSetupListController *)self proxyServer];
  if (v4)
  {
    uint64_t v5 = [(VPNSetupListController *)self proxyServer];
  }
  else
  {
    uint64_t v5 = &stru_26E7C6230;
  }

  return v5;
}

- (void)setProxyServer:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self proxyServer];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setProxyServer:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (id)proxyServerPort:(id)a3
{
  id v4 = [(VPNSetupListController *)self proxyPort];
  if (v4)
  {
    uint64_t v5 = [(VPNSetupListController *)self proxyPort];
  }
  else
  {
    uint64_t v5 = &stru_26E7C6230;
  }

  return v5;
}

- (void)setProxyServerPort:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self proxyPort];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setProxyPort:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (id)proxyUsername:(id)a3
{
  id v4 = [(VPNSetupListController *)self proxyUsername];
  if (v4)
  {
    uint64_t v5 = [(VPNSetupListController *)self proxyUsername];
  }
  else
  {
    uint64_t v5 = &stru_26E7C6230;
  }

  return v5;
}

- (void)setProxyUsername:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self proxyUsername];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setProxyUsername:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (id)proxyPassword:(id)a3
{
  id v4 = [(VPNSetupListController *)self proxyPassword];
  if (v4)
  {
    uint64_t v5 = [(VPNSetupListController *)self proxyPassword];
  }
  else
  {
    uint64_t v5 = &stru_26E7C6230;
  }

  return v5;
}

- (void)setProxyPassword:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self proxyPassword];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setProxyPassword:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setProxyUsesAuthentication:(id)a3 specifier:(id)a4
{
  id v11 = a3;
  int v5 = [v11 BOOLValue];
  BOOL v6 = v5 == [(VPNSetupListController *)self proxyAuthenticated];
  id v7 = v11;
  if (!v6)
  {
    -[VPNSetupListController setProxyAuthenticated:](self, "setProxyAuthenticated:", [v11 BOOLValue]);
    if (v5)
    {
      [(VPNSetupListController *)self setProxyUsername:0];
      [(VPNSetupListController *)self setProxyPassword:0];
      objc_super v8 = [(VPNSetupListController *)self proxyAuthSpecifiers];
      [(VPNSetupListController *)self insertContiguousSpecifiers:v8 afterSpecifierID:@"PROXY_AUTHENTICATION" animated:1];

      id v9 = [(VPNSetupListController *)self proxyAuthSpecifiers];
      long long v10 = [v9 lastObject];
      [(VPNSetupListController *)self performSelector:sel_scrollToSpecifier_ withObject:v10 afterDelay:0.3];
    }
    else
    {
      id v9 = [(VPNSetupListController *)self proxyAuthSpecifiers];
      [(VPNSetupListController *)self removeContiguousSpecifiers:v9 animated:1];
    }

    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
    id v7 = v11;
  }
}

- (id)proxyUsesAuthentication:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(VPNSetupListController *)self proxyAuthenticated];

  return (id)[v3 numberWithBool:v4];
}

- (id)proxyType:(id)a3
{
  v3 = NSNumber;
  unint64_t v4 = [(VPNSetupListController *)self proxyType];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (void)setProxyType:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [(VPNSetupListController *)self proxyType:a4];
  int v8 = [v7 intValue];

  int v9 = [v6 intValue];
  uint64_t v10 = [v6 unsignedIntegerValue];

  [(VPNSetupListController *)self setProxyType:v10];
  [(VPNSetupListController *)self loseFocus];
  id v11 = (void *)MEMORY[0x263EFF980];
  long long v12 = [(VPNSetupListController *)self manualProxySpecifiers];
  id v36 = [v11 arrayWithArray:v12];

  long long v13 = [(VPNSetupListController *)self proxyUsesAuthentication:0];
  LODWORD(v12) = [v13 BOOLValue];

  if (v12)
  {
    v14 = [(VPNSetupListController *)self proxyAuthSpecifiers];
    [v36 addObjectsFromArray:v14];
  }
  if (!v8 && v9 == 1)
  {
    [(VPNSetupListController *)self insertContiguousSpecifiers:v36 afterSpecifierID:@"PROXY_TYPE" animated:1];
    uint64_t v15 = [v36 lastObject];
    [(VPNSetupListController *)self performSelector:sel_scrollToSpecifier_ withObject:v15 afterDelay:0.3];

    [(VPNSetupListController *)self setDirty:1];
    goto LABEL_14;
  }
  if (!v8 && v9 == 2)
  {
    v16 = [(VPNSetupListController *)self pacSpecifiers];
    [(VPNSetupListController *)self insertContiguousSpecifiers:v16 afterSpecifierID:@"PROXY_TYPE" animated:1];

    v17 = [(VPNSetupListController *)self pacSpecifiers];
    v18 = [v17 lastObject];
    [(VPNSetupListController *)self performSelector:sel_scrollToSpecifier_ withObject:v18 afterDelay:0.3];

LABEL_12:
    [(VPNSetupListController *)self setDirty:1];
LABEL_13:
    [(VPNSetupListController *)self updateDoneButton];
    goto LABEL_14;
  }
  if (v8 == 1 && !v9)
  {
    [(VPNSetupListController *)self removeContiguousSpecifiers:v36 animated:1];
    goto LABEL_12;
  }
  if (v8 == 1 && v9 == 2)
  {
    uint64_t v19 = [v36 count] - 1;
    v20 = [(VPNSetupListController *)self pacSpecifiers];
    uint64_t v21 = [v20 count] - 1;

    v22 = objc_msgSend(v36, "subarrayWithRange:", 1, v19);
    v23 = [(VPNSetupListController *)self pacSpecifiers];
    v24 = objc_msgSend(v23, "subarrayWithRange:", 1, v21);

    [(VPNSetupListController *)self replaceContiguousSpecifiers:v22 withSpecifiers:v24 animated:1];
    v25 = [(VPNSetupListController *)self pacSpecifiers];
    v26 = [v25 lastObject];
    [(VPNSetupListController *)self performSelector:sel_scrollToSpecifier_ withObject:v26 afterDelay:0.3];

LABEL_26:
    goto LABEL_27;
  }
  if (v8 == 2 && !v9)
  {
    v27 = [(VPNSetupListController *)self pacSpecifiers];
    [(VPNSetupListController *)self removeContiguousSpecifiers:v27 animated:1];

    goto LABEL_12;
  }
  if (v8 == 2 && v9 == 1)
  {
    uint64_t v28 = [v36 count] - 1;
    v29 = [(VPNSetupListController *)self pacSpecifiers];
    uint64_t v30 = [v29 count] - 1;

    v22 = objc_msgSend(v36, "subarrayWithRange:", 1, v28);
    v31 = [(VPNSetupListController *)self pacSpecifiers];
    v24 = objc_msgSend(v31, "subarrayWithRange:", 1, v30);

    [(VPNSetupListController *)self replaceContiguousSpecifiers:v24 withSpecifiers:v22 animated:1];
    v25 = [v36 lastObject];
    [(VPNSetupListController *)self performSelector:sel_scrollToSpecifier_ withObject:v25 afterDelay:0.3];
    goto LABEL_26;
  }
LABEL_27:
  if (v9 && v8)
  {
    uint64_t v32 = [(VPNSetupListController *)self indexOfGroup:3];
    v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
    v34 = [(VPNSetupListController *)self indexPathForIndex:v32 + 1];
    v35 = [v33 cellForRowAtIndexPath:v34];

    [v35 becomeFirstResponder];
  }
  [(VPNSetupListController *)self setDirty:1];
  if (v9 != 1) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)scrollToSpecifier:(id)a3
{
  uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) indexOfObject:a3];
  int v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
  id v6 = [(VPNSetupListController *)self indexPathForIndex:v4];
  [v5 scrollToRowAtIndexPath:v6 atScrollPosition:2 animated:1];
}

- (id)pacFile:(id)a3
{
  uint64_t v4 = [(VPNSetupListController *)self proxyPACFile];
  if (v4)
  {
    int v5 = [(VPNSetupListController *)self proxyPACFile];
  }
  else
  {
    int v5 = &stru_26E7C6230;
  }

  return v5;
}

- (void)setPacFile:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  int v5 = [(VPNSetupListController *)self proxyPACFile];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setProxyPACFile:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setUseRSASecurID:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  if (v5 == [(VPNSetupListController *)self useRSASecurID]) {
    return;
  }
  [(VPNSetupListController *)self setUseRSASecurID:v5];
  char v6 = [(VPNSetupListController *)self passwordSpecifier];
  uint64_t v7 = [(VPNSetupListController *)self indexOfSpecifier:v6];

  if (![(VPNSetupListController *)self useRSASecurID] && v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [(VPNSetupListController *)self passwordSpecifier];
    [(VPNSetupListController *)self insertSpecifier:v8 afterSpecifierID:@"EAP_RSA" animated:1];
LABEL_9:

    goto LABEL_10;
  }
  if ([(VPNSetupListController *)self useRSASecurID] && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [(VPNSetupListController *)self passwordSpecifier];
    [(VPNSetupListController *)self removeSpecifier:v8 animated:1];
    goto LABEL_9;
  }
LABEL_10:
  [(VPNSetupListController *)self setDirty:1];

  [(VPNSetupListController *)self updateDoneButton];
}

- (id)useRSASecurIDForSpecifier:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(VPNSetupListController *)self useRSASecurID];

  return (id)[v3 numberWithBool:v4];
}

- (void)setSendAllTraffic:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  if (v5 != [(VPNSetupListController *)self sendAllTraffic])
  {
    [(VPNSetupListController *)self setSendAllTraffic:v5];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (id)sendAllTraffic:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(VPNSetupListController *)self sendAllTraffic];

  return (id)[v3 numberWithBool:v4];
}

- (void)setOnDemand:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  if (v5 != [(VPNSetupListController *)self onDemandEnabled])
  {
    [(VPNSetupListController *)self setOnDemandEnabled:v5];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self saveButtonTapped:0];
  }
}

- (id)onDemand:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(VPNSetupListController *)self onDemandEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setOnDemandService:(id)a3 forSpecifier:(id)a4
{
  if (a3) {
    a3 = (id)[a3 BOOLValue];
  }

  -[VPNSetupListController setOnDemandService:](self, "setOnDemandService:", a3, a4);
}

- (BOOL)haveEnoughValues
{
  unint64_t v3 = [(VPNSetupListController *)self currentVPNType];
  BOOL v4 = [(VPNSetupListController *)self dirty];
  if (v3 == 4)
  {
    if (v4)
    {
      uint64_t v5 = [(VPNSetupListController *)self server];
      if ([v5 length])
      {
        char v6 = [(VPNSetupListController *)self displayName];
        if ([v6 length])
        {
          uint64_t v7 = [(VPNSetupListController *)self remoteIdentifier];
          if ([v7 length])
          {
            int v8 = [(VPNSetupListController *)self account];
            if ([v8 length])
            {
              BOOL v9 = 1;
            }
            else
            {
              uint64_t v10 = [(VPNSetupListController *)self sharedSecret];
              if ([v10 length])
              {
                BOOL v9 = 1;
              }
              else
              {
                id v11 = [(VPNSetupListController *)self certificateID];
                BOOL v9 = v11 != 0;
              }
            }
            goto LABEL_23;
          }
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if (v4)
  {
    uint64_t v5 = [(VPNSetupListController *)self server];
    if ([v5 length])
    {
      char v6 = [(VPNSetupListController *)self displayName];
      if ([v6 length])
      {
        uint64_t v7 = [(VPNSetupListController *)self account];
        if ([v7 length])
        {
          BOOL v9 = 1;
LABEL_24:

          goto LABEL_25;
        }
        if ([(VPNSetupListController *)self usesCertificates])
        {
          int v8 = [(VPNSetupListController *)self certificateID];
          BOOL v9 = v8 != 0;
LABEL_23:

          goto LABEL_24;
        }
LABEL_18:
        BOOL v9 = 0;
        goto LABEL_24;
      }
LABEL_15:
      BOOL v9 = 0;
LABEL_25:

      goto LABEL_26;
    }
LABEL_14:
    BOOL v9 = 0;
LABEL_26:

    return v9;
  }
  return 0;
}

- (BOOL)saveConfigurationSettings
{
  if ([(VPNSetupListController *)self onDemandService]
    && [(VPNSetupListController *)self dirty])
  {
    unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController currentVPNType](self, "currentVPNType"));
    [v3 setObject:v4 forKey:@"VPNType"];

    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    [v3 setObject:v5 forKey:@"VPNGrade"];

    char v6 = NSNumber;
    uint64_t v7 = [(VPNSetupListController *)self onDemand:0];
    int v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue"));

    [v3 setValue:v8 forKey:@"VPNOnDemandEnabled"];
    BOOL v9 = +[VPNConnectionStore sharedInstance];
    uint64_t v10 = [(VPNSetupListController *)self serviceID];
    id v11 = objc_msgSend(v9, "connectionWithServiceID:withGrade:", v10, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

    uint64_t v12 = [v11 status];
    if (v11 && (v12 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [v11 disconnect];
    }
    long long v13 = [(VPNSetupListController *)self serviceID];
    char v14 = [v9 updateVPNWithServiceID:v13 withOptions:v3];

    goto LABEL_74;
  }
  if (![(VPNSetupListController *)self haveEnoughValues]) {
    return 0;
  }
  if ([(VPNSetupListController *)self dirty])
  {
    unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController currentVPNType](self, "currentVPNType"));
    [v3 setObject:v15 forKey:@"VPNType"];

    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    [v3 setObject:v16 forKey:@"VPNGrade"];

    v17 = [(VPNSetupListController *)self displayName];
    if ([v17 length])
    {
      v18 = [(VPNSetupListController *)self displayName];
      [v3 setObject:v18 forKey:@"dispName"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"dispName"];
    }

    uint64_t v19 = [(VPNSetupListController *)self account];
    if ([v19 length])
    {
      v20 = [(VPNSetupListController *)self account];
      [v3 setObject:v20 forKey:@"authorization"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"authorization"];
    }

    uint64_t v21 = [(VPNSetupListController *)self server];
    if ([v21 length])
    {
      v22 = [(VPNSetupListController *)self server];
      [v3 setObject:v22 forKey:@"server"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"server"];
    }

    v23 = [(VPNSetupListController *)self sharedSecret];
    if ([v23 length])
    {
      v24 = [(VPNSetupListController *)self sharedSecret];
      [v3 setObject:v24 forKey:@"secret"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"secret"];
    }

    v25 = [(VPNSetupListController *)self useRSASecurIDForSpecifier:0];
    [v3 setValue:v25 forKey:@"securID"];

    v26 = [(VPNSetupListController *)self sendAllTraffic:0];
    [v3 setValue:v26 forKey:@"VPNSendAllTraffic"];

    v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController encryptionType](self, "encryptionType"));
    [v3 setValue:v27 forKey:@"encrypLevel"];

    uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController eapType](self, "eapType"));
    [v3 setValue:v28 forKey:@"eapType"];

    v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VPNSetupListController authType](self, "authType"));
    [v3 setValue:v29 forKey:@"authType"];

    uint64_t v30 = [(VPNSetupListController *)self groupDisplayName];
    if ([v30 length])
    {
      v31 = [(VPNSetupListController *)self groupDisplayName];
      [v3 setObject:v31 forKey:@"group"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"group"];
    }

    uint64_t v32 = [(VPNSetupListController *)self password];
    if ([v32 length])
    {
      v33 = [(VPNSetupListController *)self password];
      [v3 setObject:v33 forKey:@"password"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"password"];
    }

    v34 = [(VPNSetupListController *)self localIdentifier];
    if ([v34 length])
    {
      v35 = [(VPNSetupListController *)self localIdentifier];
      [v3 setObject:v35 forKey:@"VPNLocalIdentifier"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"VPNLocalIdentifier"];
    }

    id v36 = [(VPNSetupListController *)self remoteIdentifier];
    if ([v36 length])
    {
      v37 = [(VPNSetupListController *)self remoteIdentifier];
      [v3 setObject:v37 forKey:@"VPNRemoteIdentifier"];
    }
    else
    {
      [v3 setObject:&stru_26E7C6230 forKey:@"VPNRemoteIdentifier"];
    }

    if (![(VPNSetupListController *)self proxyType])
    {
LABEL_59:
      if ([(VPNSetupListController *)self usesCertificates])
      {
        v49 = [(VPNSetupListController *)self certificateID];

        if (v49)
        {
          v50 = [(VPNSetupListController *)self certificateID];
          [v3 setObject:v50 forKey:@"VPNCertificate"];
        }
      }
      v51 = [(VPNSetupListController *)self serviceID];

      if (v51)
      {
        if (![(VPNSetupListController *)self originalVPNType]
          || (unint64_t v52 = [(VPNSetupListController *)self currentVPNType],
              v52 == [(VPNSetupListController *)self originalVPNType]))
        {
          v53 = +[VPNConnectionStore sharedInstance];
          v54 = [(VPNSetupListController *)self serviceID];
          v55 = objc_msgSend(v53, "connectionWithServiceID:withGrade:", v54, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

          uint64_t v56 = [v55 status];
          if (v55 && (v56 & 0xFFFFFFFFFFFFFFFELL) == 2) {
            [v55 disconnect];
          }
          v57 = [(VPNSetupListController *)self serviceID];
          char v14 = [v53 updateVPNWithServiceID:v57 withOptions:v3];

          goto LABEL_72;
        }
        v58 = +[VPNConnectionStore sharedInstance];
        v59 = [(VPNSetupListController *)self serviceID];
        int v60 = [v58 deleteVPNWithServiceID:v59];

        if (!v60)
        {
          char v14 = 0;
          goto LABEL_73;
        }
      }
      v53 = +[VPNConnectionStore sharedInstance];
      char v14 = [v53 createVPNWithOptions:v3];
LABEL_72:

LABEL_73:
      [(VPNSetupListController *)self setOriginalVPNType:[(VPNSetupListController *)self currentVPNType]];
LABEL_74:

      return v14;
    }
    v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[VPNSetupListController proxyType](self, "proxyType"));
    [v3 setObject:v38 forKey:@"VPNProxyType"];
    if ([(VPNSetupListController *)self proxyType] == 1)
    {
      v39 = [(VPNSetupListController *)self proxyServer];
      if ([v39 length])
      {
        v40 = [(VPNSetupListController *)self proxyServer];
        [v3 setObject:v40 forKey:@"VPNProxyServer"];
      }
      else
      {
        [v3 setObject:&stru_26E7C6230 forKey:@"VPNProxyServer"];
      }

      v44 = [(VPNSetupListController *)self proxyPort];
      if ([v44 length])
      {
        v45 = [(VPNSetupListController *)self proxyPort];
        [v3 setObject:v45 forKey:@"VPNProxyPort"];
      }
      else
      {
        [v3 setObject:&stru_26E7C6230 forKey:@"VPNProxyPort"];
      }

      if ([(VPNSetupListController *)self proxyAuthenticated])
      {
        [v3 setObject:&unk_26E7CB9A0 forKey:@"VPNProxyAuthenticate"];
        v46 = [(VPNSetupListController *)self proxyUsername];
        if ([v46 length])
        {
          v47 = [(VPNSetupListController *)self proxyUsername];
          [v3 setObject:v47 forKey:@"VPNProxyUsername"];
        }
        else
        {
          [v3 setObject:&stru_26E7C6230 forKey:@"VPNProxyUsername"];
        }

        v41 = [(VPNSetupListController *)self proxyPassword];
        if ([v41 length])
        {
          v42 = [(VPNSetupListController *)self proxyPassword];
          v43 = VPNProxyPassword;
          goto LABEL_54;
        }
        v48 = VPNProxyPassword;
        goto LABEL_56;
      }
      [v3 setObject:&unk_26E7CB9B8 forKey:@"VPNProxyAuthenticate"];
    }
    else if ([(VPNSetupListController *)self proxyType] == 2)
    {
      v41 = [(VPNSetupListController *)self proxyPACFile];
      if ([v41 length])
      {
        v42 = [(VPNSetupListController *)self proxyPACFile];
        v43 = VPNProxyPacFile;
LABEL_54:
        [v3 setObject:v42 forKey:*v43];

LABEL_57:
        goto LABEL_58;
      }
      v48 = VPNProxyPacFile;
LABEL_56:
      [v3 setObject:&stru_26E7C6230 forKey:*v48];
      goto LABEL_57;
    }
LABEL_58:

    goto LABEL_59;
  }
  return 1;
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4 cancel:(id)a5
{
  int v8 = (void *)MEMORY[0x263F1C3F8];
  id v9 = a5;
  id v11 = [v8 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  uint64_t v10 = [MEMORY[0x263F1C3F0] actionWithTitle:v9 style:1 handler:0];

  [v11 addAction:v10];
  [(VPNSetupListController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)saveButtonTapped:(id)a3
{
  [(VPNSetupListController *)self loseFocus];
  if ([(VPNSetupListController *)self saveConfigurationSettings])
  {
    [(VPNSetupListController *)self setDirty:0];
    [(VPNSetupListController *)self updateDoneButton];
    [(VPNSetupListController *)self reload];
  }
  else
  {
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v4 = [v9 localizedStringForKey:@"VPN_ERROR" value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v6 = [v5 localizedStringForKey:@"VPN_SAVE_FAILURE_GENERIC" value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"OK" value:&stru_26E7C6230 table:@"MobileVPN"];
    [(VPNSetupListController *)self displayAlertWithTitle:v4 message:v6 cancel:v8];
  }
}

- (void)enableButtonTapped:(id)a3
{
  [(VPNSetupListController *)self loseFocus];
  id v16 = +[VPNConnectionStore sharedInstance];
  BOOL v4 = [(VPNSetupListController *)self serviceID];
  uint64_t v5 = objc_msgSend(v16, "connectionWithServiceID:withGrade:", v4, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  char v6 = [v5 serviceID];
  char v7 = objc_msgSend(v16, "isEnabledWithServiceID:withGrade:", v6, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  if ((v7 & 1) != 0
    || ([v5 serviceID],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_msgSend(v16, "enable:serviceID:withGrade:", 1, v8, -[VPNSetupListController vpnGrade](self, "vpnGrade")), v8, (v9 & 1) == 0))
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"VPN_ERROR" value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v13 = [v12 localizedStringForKey:@"VPN_SAVE_FAILURE_GENERIC" value:&stru_26E7C6230 table:@"MobileVPN"];
    char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"OK" value:&stru_26E7C6230 table:@"MobileVPN"];
    [(VPNSetupListController *)self displayAlertWithTitle:v11 message:v13 cancel:v15];
  }
  else
  {
    [(VPNSetupListController *)self setDirty:0];
    [(VPNSetupListController *)self reloadSpecifiers];
  }
}

- (void)disableButtonTapped:(id)a3
{
  [(VPNSetupListController *)self loseFocus];
  id v16 = +[VPNConnectionStore sharedInstance];
  BOOL v4 = [(VPNSetupListController *)self serviceID];
  uint64_t v5 = objc_msgSend(v16, "connectionWithServiceID:withGrade:", v4, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  char v6 = [v5 serviceID];
  int v7 = objc_msgSend(v16, "isEnabledWithServiceID:withGrade:", v6, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  if (v7
    && ([v5 serviceID],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_msgSend(v16, "enable:serviceID:withGrade:", 0, v8, -[VPNSetupListController vpnGrade](self, "vpnGrade")), v8, (v9 & 1) != 0))
  {
    [(VPNSetupListController *)self setDirty:0];
    [(VPNSetupListController *)self reloadSpecifiers];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"VPN_ERROR" value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v13 = [v12 localizedStringForKey:@"VPN_SAVE_FAILURE_GENERIC" value:&stru_26E7C6230 table:@"MobileVPN"];
    char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"OK" value:&stru_26E7C6230 table:@"MobileVPN"];
    [(VPNSetupListController *)self displayAlertWithTitle:v11 message:v13 cancel:v15];
  }
}

- (void)saveButtonClicked:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  BOOL v4 = [(VPNSetupListController *)self serviceID];

  if (!v4)
  {
    char v6 = +[VPNConnectionStore sharedInstance];
    int v7 = objc_msgSend(v6, "vpnServicesForCurrentSetWithGrade:", -[VPNSetupListController vpnGrade](self, "vpnGrade"));

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
          char v14 = +[VPNConnectionStore sharedInstance];
          uint64_t v15 = objc_msgSend(v14, "connectionWithServiceID:withGrade:", v13, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

          id v16 = [v15 displayName];
          v17 = [(VPNSetupListController *)self displayName];
          int v18 = [v17 isEqualToString:v16];

          if (v18)
          {
            uint64_t v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v24 = [v30 localizedStringForKey:@"VPN_ERROR" value:&stru_26E7C6230 table:@"MobileVPN"];
            v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v26 = [v25 localizedStringForKey:@"VPN_SAVE_FAILURE_NAME_CONFLICT" value:&stru_26E7C6230 table:@"MobileVPN"];
            v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v28 = [v27 localizedStringForKey:@"OK" value:&stru_26E7C6230 table:@"MobileVPN"];
            [(VPNSetupListController *)self displayAlertWithTitle:v24 message:v26 cancel:v28];

            goto LABEL_18;
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  if ([(VPNSetupListController *)self currentVPNType] == 1
    && ![(VPNSetupListController *)self pptpWarningAccepted])
  {
    [(VPNSetupListController *)self warnForPPTP];
  }
  else
  {
    [(VPNSetupListController *)self loseFocus];
    BOOL v5 = [(VPNSetupListController *)self saveConfigurationSettings];
    [(VPNSetupListController *)self setPptpWarningAccepted:0];
    if (v5)
    {
      if ([(VPNSetupListController *)self editMode])
      {
        [(VPNSetupListController *)self leaveEditMode];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x263F5FE78]));
        [WeakRetained dismiss];
      }
    }
    else
    {
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v19 = [v8 localizedStringForKey:@"VPN_ERROR" value:&stru_26E7C6230 table:@"MobileVPN"];
      v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v21 = [v20 localizedStringForKey:@"VPN_SAVE_FAILURE_GENERIC" value:&stru_26E7C6230 table:@"MobileVPN"];
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"OK" value:&stru_26E7C6230 table:@"MobileVPN"];
      [(VPNSetupListController *)self displayAlertWithTitle:v19 message:v21 cancel:v23];

LABEL_18:
    }
  }
}

- (void)leaveEditMode
{
  id v5 = [(VPNSetupListController *)self navigationItem];
  unint64_t v3 = [(VPNSetupListController *)self backButton];
  [v5 setLeftBarButtonItem:v3];

  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:2 target:self action:sel_editButtonTapped_];
  [v5 setRightBarButtonItem:v4];

  [(VPNSetupListController *)self setBackButton:0];
  [(VPNSetupListController *)self setOverviewMode:1];
  [(VPNSetupListController *)self setEditMode:0];
  [(VPNSetupListController *)self reloadSpecifiers];
}

- (void)enterEditMode
{
  id v6 = [(VPNSetupListController *)self navigationItem];
  unint64_t v3 = [v6 leftBarButtonItem];
  [(VPNSetupListController *)self setBackButton:v3];

  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonClicked_];
  [v6 setLeftBarButtonItem:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_saveButtonClicked_];
  [v6 setRightBarButtonItem:v5];

  [(VPNSetupListController *)self setOverviewMode:0];
  [(VPNSetupListController *)self setEditMode:1];
  [(VPNSetupListController *)self updateDoneButton];
  [(VPNSetupListController *)self reloadSpecifiers];
}

- (BOOL)deleteConfiguration:(id)a3
{
  BOOL v4 = +[VPNConnectionStore sharedInstance];
  id v5 = [(VPNSetupListController *)self serviceID];
  char v6 = [v4 deleteVPNWithServiceID:v5];

  return v6;
}

- (void)deleteVPNConfiguration:(id)a3
{
  if ([(VPNSetupListController *)self deleteConfiguration:0])
  {
    id v5 = [(VPNSetupListController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (void)deleteConfirm:(id)a3
{
  if ([(VPNSetupListController *)self vpnGrade] == 7
    || [(VPNSetupListController *)self vpnGrade] == 8)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    char v6 = @"DELETE_RELAY?";
  }
  else
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    char v6 = @"DELETE_VPN?";
  }
  int v7 = [v4 localizedStringForKey:v6 value:&stru_26E7C6230 table:@"MobileVPN"];

  id v8 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v7 message:0 preferredStyle:1];
  uint64_t v9 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"DELETE_CONFIRMATION" value:&stru_26E7C6230 table:@"MobileVPN"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__VPNSetupListController_deleteConfirm___block_invoke;
  v17[3] = &unk_264C06998;
  v17[4] = self;
  uint64_t v12 = [v9 actionWithTitle:v11 style:0 handler:v17];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F1C3F0];
  char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_26E7C6230 table:@"MobileVPN"];
  id v16 = [v13 actionWithTitle:v15 style:1 handler:0];
  [v8 addAction:v16];

  [(VPNSetupListController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __40__VPNSetupListController_deleteConfirm___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteVPNConfiguration:0];
}

- (void)warnForPPTP
{
  unint64_t v3 = (void *)MEMORY[0x263F1C3F8];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"PPTP_WARNING_TITLE?" value:&stru_26E7C6230 table:@"MobileVPN"];
  char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"PPTP_WARNING" value:&stru_26E7C6230 table:@"MobileVPN"];
  id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  uint64_t v9 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"PPTP_CANCEL" value:&stru_26E7C6230 table:@"MobileVPN"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __37__VPNSetupListController_warnForPPTP__block_invoke;
  v18[3] = &unk_264C06998;
  v18[4] = self;
  uint64_t v12 = [v9 actionWithTitle:v11 style:1 handler:v18];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F1C3F0];
  char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"PPTP_SAVE" value:&stru_26E7C6230 table:@"MobileVPN"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37__VPNSetupListController_warnForPPTP__block_invoke_2;
  v17[3] = &unk_264C06998;
  v17[4] = self;
  id v16 = [v13 actionWithTitle:v15 style:0 handler:v17];
  [v8 addAction:v16];

  [(VPNSetupListController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __37__VPNSetupListController_warnForPPTP__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) editMode];
  if (result)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 cancelButtonClicked:0];
  }
  return result;
}

uint64_t __37__VPNSetupListController_warnForPPTP__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPptpWarningAccepted:1];
  v2 = *(void **)(a1 + 32);

  return [v2 saveButtonClicked:0];
}

- (void)updateDoneButton
{
  if ([(VPNSetupListController *)self editMode])
  {
    BOOL v3 = [(VPNSetupListController *)self haveEnoughValues];
    id v5 = [(VPNSetupListController *)self navigationItem];
    id v4 = [v5 rightBarButtonItem];
    [v4 setEnabled:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  char v6 = +[VPNConnectionStore sharedInstance];
  int v7 = [v5 objectForKeyedSubscript:@"vpn-service-id"];
  id v8 = objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  objc_initWeak(&location, v8);

  id v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  v10.receiver = self;
  v10.super_class = (Class)VPNSetupListController;
  [(VPNSetupListController *)&v10 viewWillAppear:v3];
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(VPNSetupListController *)self updateDoneButton];
  v5.receiver = self;
  v5.super_class = (Class)VPNSetupListController;
  [(VPNSetupListController *)&v5 viewDidAppear:v3];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)VPNSetupListController;
  id v6 = a4;
  int v7 = [(VPNSetupListController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[VPNSetupListController indexForIndexPath:](self, "indexForIndexPath:", v6, v18.receiver, v18.super_class);

  id v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  objc_super v10 = [(VPNSetupListController *)self certificateListSpecifier];

  if (v9 == v10)
  {
    uint64_t v11 = [(VPNSetupListController *)self certificateID];

    if (v11)
    {
      uint64_t v12 = [(VPNSetupListController *)self certificateID];
      uint64_t v11 = (void *)VPNCopyDisplayNameForCertificateWithPersistentID(v12);
    }
    [v7 setValue:v11];
  }
  uint64_t v13 = [(VPNSetupListController *)self connectSpecifier];

  if (v9 == v13)
  {
    char v14 = [(VPNSetupListController *)self connection];
    uint64_t v15 = [v14 statusText];
    id v16 = [v7 detailTextLabel];
    [v16 setText:v15];
  }

  return v7;
}

- (id)bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)setPPTPEncryptionLevel:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 unsignedIntegerValue];
  if (v5 != [(VPNSetupListController *)self encryptionType])
  {
    [(VPNSetupListController *)self setEncryptionType:v5];
    [(VPNSetupListController *)self setDirty:1];
  }
}

- (id)pptpEncryptionLevelForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  unint64_t v4 = [(VPNSetupListController *)self encryptionType];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (void)setEAPType:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 unsignedIntegerValue];
  if (v5 != [(VPNSetupListController *)self eapType])
  {
    [(VPNSetupListController *)self setEapType:v5];
    if ([(VPNSetupListController *)self eapType]) {
      [(VPNSetupListController *)self setAuthType:1];
    }
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self reloadSpecifiers];
  }
}

- (id)eapTypeForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  unint64_t v4 = [(VPNSetupListController *)self eapType];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (void)setAuthType:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 unsignedIntegerValue];
  if (v5 != [(VPNSetupListController *)self authType])
  {
    [(VPNSetupListController *)self setAuthType:v5];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self reloadSpecifiers];
  }
}

- (id)authTypeForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  unint64_t v4 = [(VPNSetupListController *)self authType];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (void)setVPNGrade:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 unsignedIntegerValue];
  if (v5 != [(VPNSetupListController *)self vpnGrade])
  {
    [(VPNSetupListController *)self setVpnGrade:v5];
    [(VPNSetupListController *)self setDirty:1];
  }
}

- (id)vpnGradeForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  unint64_t v4 = [(VPNSetupListController *)self vpnGrade];

  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (id)vpnGradeNameForSpecifier:(id)a3
{
  if (![(VPNSetupListController *)self vpnGrade]
    || [(VPNSetupListController *)self vpnGrade] == 1)
  {
    if (![(VPNSetupListController *)self currentVPNType])
    {
      unint64_t v4 = @"L2TP";
      goto LABEL_20;
    }
    if ([(VPNSetupListController *)self currentVPNType] == 1)
    {
      unint64_t v4 = @"PPTP";
      goto LABEL_20;
    }
LABEL_7:
    if ([(VPNSetupListController *)self currentVPNType] == 2)
    {
      unint64_t v4 = @"IPsec";
      goto LABEL_20;
    }
    if ([(VPNSetupListController *)self currentVPNType] == 4)
    {
      unint64_t v4 = @"IKEv2";
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if ([(VPNSetupListController *)self vpnGrade] == 2) {
    goto LABEL_7;
  }
  if ([(VPNSetupListController *)self vpnGrade] == 3)
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    int v7 = @"ALWAYSON";
  }
  else
  {
    if ([(VPNSetupListController *)self vpnGrade] != 7
      && [(VPNSetupListController *)self vpnGrade] != 8)
    {
LABEL_18:
      id v6 = +[VPNConnectionStore sharedInstance];
      uint64_t v8 = [(VPNSetupListController *)self serviceID];
      objc_msgSend(v6, "appNameForServiceID:withGrade:", v8, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
      unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    int v7 = @"RELAY";
  }
  unint64_t v4 = [v5 localizedStringForKey:v7 value:&stru_26E7C6230 table:@"MobileVPN"];
LABEL_19:

LABEL_20:

  return v4;
}

- (void)setVPNType:(__CFString *)a3 forSpecifier:(id)a4
{
  unint64_t v5 = +[VPNConnectionStore connectionTypeFromVPNType:](VPNConnectionStore, "connectionTypeFromVPNType:", a3, a4);
  if (v5 != [(VPNSetupListController *)self currentVPNType])
  {
    [(VPNSetupListController *)self setCurrentVPNType:v5];
    [(VPNSetupListController *)self loseFocus];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self reloadSpecifiers];
  }
}

- (__CFString)vpnTypeForSpecifier:(id)a3
{
  unint64_t v3 = [(VPNSetupListController *)self currentVPNType];

  return +[VPNConnectionStore vpnTypeFromConnectionType:v3];
}

- (id)usesCertificatesForSpecifier:(id)a3
{
  unint64_t v3 = NSNumber;
  BOOL v4 = [(VPNSetupListController *)self usesCertificates];

  return (id)[v3 numberWithBool:v4];
}

- (void)setUsername:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  unint64_t v5 = [(VPNSetupListController *)self account];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setAccount:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setDisplayName:(id)a3 forSpecifier:(id)a4
{
  id v8 = a3;
  unint64_t v5 = [(VPNSetupListController *)self displayName];
  char v6 = [v8 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setDisplayName:v8];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
    id v7 = [(VPNSetupListController *)self serviceID];

    if (v7) {
      [(VPNSetupListController *)self setTitle:v8];
    }
  }
}

- (void)setServer:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  unint64_t v5 = [(VPNSetupListController *)self server];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setServer:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setPassword:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  unint64_t v5 = [(VPNSetupListController *)self password];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v8 = [v9 stringByTrimmingCharactersInSet:v7];

    [(VPNSetupListController *)self setPassword:v8];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setPasswordRequired:(id)a3 forSpecifier:(id)a4
{
  -[VPNSetupListController setPasswordRequired:](self, "setPasswordRequired:", [a3 BOOLValue]);
  BOOL v5 = [(VPNSetupListController *)self passwordRequired];
  char v6 = [(VPNSetupListController *)self passwordSpecifier];
  id v7 = [NSNumber numberWithBool:!v5];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

  [(VPNSetupListController *)self setDirty:1];

  [(VPNSetupListController *)self updateDoneButton];
}

- (void)setUsesCertificates:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  if (v5 != [(VPNSetupListController *)self usesCertificates])
  {
    [(VPNSetupListController *)self setUsesCertificates:v5];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self reloadSpecifiers];
  }
}

- (void)setSharedSecret:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  uint64_t v5 = [(VPNSetupListController *)self sharedSecret];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v8 = [v9 stringByTrimmingCharactersInSet:v7];

    [(VPNSetupListController *)self setSharedSecret:v8];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (id)certificateObjectForSpecifier:(id)a3
{
  BOOL v4 = [(VPNSetupListController *)self certificateID];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [(VPNSetupListController *)self certificateIDs];
  char v6 = [(VPNSetupListController *)self certificateID];
  int v7 = [v5 containsObject:v6];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [(VPNSetupListController *)self certificateIDs];
  id v9 = [(VPNSetupListController *)self certificateID];
  unint64_t v10 = [v8 indexOfObject:v9];

  uint64_t v11 = [(VPNSetupListController *)self certificateObjects];
  unint64_t v12 = [v11 count];

  if (v10 < v12)
  {
    uint64_t v13 = [(VPNSetupListController *)self certificateObjects];
    char v14 = [v13 objectAtIndexedSubscript:v10];
  }
  else
  {
LABEL_5:
    char v14 = 0;
  }

  return v14;
}

- (void)setCertificateObject:(id)a3 forSpecifier:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (v26)
  {
    int v7 = [(VPNSetupListController *)self certificateObjects];
    int v8 = [v7 containsObject:v26];

    if (v8)
    {
      id v9 = [(VPNSetupListController *)self certificateObjects];
      unint64_t v10 = [v9 indexOfObject:v26];

      uint64_t v11 = [(VPNSetupListController *)self certificateID];
      if (!v11) {
        goto LABEL_6;
      }
      unint64_t v12 = (void *)v11;
      uint64_t v13 = [(VPNSetupListController *)self certificateIDs];
      char v14 = [(VPNSetupListController *)self certificateID];
      int v15 = [v13 containsObject:v14];

      if (!v15
        || ([(VPNSetupListController *)self certificateIDs],
            id v16 = objc_claimAutoreleasedReturnValue(),
            [(VPNSetupListController *)self certificateID],
            v17 = objc_claimAutoreleasedReturnValue(),
            uint64_t v18 = [v16 indexOfObject:v17],
            v17,
            v16,
            v10 != v18))
      {
LABEL_6:
        uint64_t v19 = [(VPNSetupListController *)self certificateIDs];
        unint64_t v20 = [v19 count];

        if (v10 < v20)
        {
          uint64_t v21 = [(VPNSetupListController *)self certificateIDs];
          v22 = [v21 objectAtIndexedSubscript:v10];
          [(VPNSetupListController *)self setCertificateID:v22];
        }
        [(VPNSetupListController *)self setDirty:1];
        v23 = NSNumber;
        v24 = [(VPNSetupListController *)self certificateID];
        v25 = [v23 numberWithBool:v24 != 0];

        [(VPNSetupListController *)self setUsesCertificates:v25 forSpecifier:v6];
        [(VPNSetupListController *)self updateDoneButton];
        [(VPNSetupListController *)self reloadSpecifiers];
      }
    }
  }
}

- (void)setGroupDisplayName:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self groupDisplayName];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setGroupDisplayName:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setLocalIdentifier:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self localIdentifier];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setLocalIdentifier:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setRemoteIdentifier:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [(VPNSetupListController *)self remoteIdentifier];
  char v6 = [v7 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(VPNSetupListController *)self setRemoteIdentifier:v7];
    [(VPNSetupListController *)self setDirty:1];
    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (void)setStateForServiceID:(id)a3
{
  id v41 = a3;
  BOOL v4 = (void *)[v41 copy];
  [(VPNSetupListController *)self setServiceID:v4];

  if (!v41)
  {
    [(VPNSetupListController *)self setCurrentVPNType:4];
    [(VPNSetupListController *)self setEncryptionType:1];
    [(VPNSetupListController *)self setEapType:1];
    [(VPNSetupListController *)self setAuthType:1];
    [(VPNSetupListController *)self setSendAllTraffic:1];
    [(VPNSetupListController *)self setUseRSASecurID:0];
    [(VPNSetupListController *)self setOnDemandService:0];
    [(VPNSetupListController *)self setVpnGrade:0];
    goto LABEL_13;
  }
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  char v6 = [v5 objectForKey:@"service-grade"];
  -[VPNSetupListController setVpnGrade:](self, "setVpnGrade:", [v6 unsignedIntegerValue]);

  id v7 = +[VPNConnectionStore sharedInstance];
  int v8 = objc_msgSend(v7, "optionsForServiceID:withGrade:", v41, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  if (!v8) {
    goto LABEL_13;
  }
  id v9 = [v8 objectForKey:@"VPNOnDemandCapable"];
  [(VPNSetupListController *)self setOnDemandService:v9 forSpecifier:0];

  if ([(VPNSetupListController *)self onDemandService])
  {
    unint64_t v10 = [v8 objectForKey:@"VPNOnDemandEnabled"];
    -[VPNSetupListController setOnDemandEnabled:](self, "setOnDemandEnabled:", [v10 BOOLValue]);
  }
  uint64_t v11 = [v8 objectForKey:@"VPNType"];
  -[VPNSetupListController setCurrentVPNType:](self, "setCurrentVPNType:", [v11 unsignedIntegerValue]);

  unint64_t v12 = [v8 objectForKey:@"dispName"];
  [(VPNSetupListController *)self setDisplayName:v12 forSpecifier:0];

  uint64_t v13 = [v8 objectForKey:@"authorization"];
  [(VPNSetupListController *)self setUsername:v13 forSpecifier:0];

  char v14 = [v8 objectForKey:@"server"];
  [(VPNSetupListController *)self setServer:v14 forSpecifier:0];

  int v15 = [v8 objectForKey:@"secret"];
  [(VPNSetupListController *)self setSharedSecret:v15 forSpecifier:0];

  id v16 = [v8 objectForKey:@"VPNCertificate"];
  [(VPNSetupListController *)self setCertificateID:v16];

  v17 = NSNumber;
  uint64_t v18 = [(VPNSetupListController *)self certificateID];
  uint64_t v19 = [v17 numberWithBool:v18 != 0];
  [(VPNSetupListController *)self setUsesCertificates:v19 forSpecifier:0];

  unint64_t v20 = [v8 objectForKey:@"securID"];
  [(VPNSetupListController *)self setUseRSASecurID:v20 forSpecifier:0];

  uint64_t v21 = [v8 objectForKey:@"VPNSendAllTraffic"];
  [(VPNSetupListController *)self setSendAllTraffic:v21 forSpecifier:0];

  v22 = [v8 objectForKey:@"encrypLevel"];
  [(VPNSetupListController *)self setPPTPEncryptionLevel:v22 forSpecifier:0];

  v23 = [v8 objectForKey:@"eapType"];
  [(VPNSetupListController *)self setEAPType:v23 forSpecifier:0];

  v24 = [v8 objectForKey:@"authType"];
  [(VPNSetupListController *)self setAuthType:v24 forSpecifier:0];

  v25 = [v8 objectForKey:@"group"];
  [(VPNSetupListController *)self setGroupDisplayName:v25 forSpecifier:0];

  id v26 = [v8 objectForKey:@"password"];
  [(VPNSetupListController *)self setPassword:v26 forSpecifier:0];

  v27 = [v8 objectForKey:@"VPNPasswordRequired"];
  [(VPNSetupListController *)self setPasswordRequired:v27 forSpecifier:0];

  uint64_t v28 = [v8 objectForKey:@"VPNLocalIdentifier"];
  [(VPNSetupListController *)self setLocalIdentifier:v28 forSpecifier:0];

  v29 = [v8 objectForKey:@"VPNRemoteIdentifier"];
  [(VPNSetupListController *)self setRemoteIdentifier:v29 forSpecifier:0];

  uint64_t v30 = [v8 objectForKey:@"VPNProxyType"];
  [(VPNSetupListController *)self setProxyType:v30 specifier:0];

  if ([(VPNSetupListController *)self proxyType] == 1)
  {
    long long v31 = [v8 objectForKey:@"VPNProxyServer"];
    [(VPNSetupListController *)self setProxyServer:v31 specifier:0];

    long long v32 = [v8 objectForKey:@"VPNProxyPort"];
    [(VPNSetupListController *)self setProxyServerPort:v32 specifier:0];

    long long v33 = [v8 objectForKey:@"VPNProxyAuthenticate"];
    [(VPNSetupListController *)self setProxyUsesAuthentication:v33 specifier:0];

    if ([(VPNSetupListController *)self proxyAuthenticated])
    {
      long long v34 = [v8 objectForKey:@"VPNProxyUsername"];
      [(VPNSetupListController *)self setProxyUsername:v34 specifier:0];

      v35 = [v8 objectForKey:@"VPNProxyPassword"];
      [(VPNSetupListController *)self setProxyPassword:v35 specifier:0];
LABEL_11:
    }
  }
  else if ([(VPNSetupListController *)self proxyType] == 2)
  {
    v35 = [v8 objectForKey:@"VPNProxyPacFile"];
    [(VPNSetupListController *)self setPacFile:v35 specifier:0];
    goto LABEL_11;
  }
  uint64_t v36 = [v8 objectForKey:@"VPNAlwaysPrompt"];
  -[VPNSetupListController setAlwaysPrompt:](self, "setAlwaysPrompt:", [v36 BOOLValue]);

  v37 = [v8 objectForKey:@"VPNApplicationName"];
  [(VPNSetupListController *)self setAppName:v37];

  v38 = [v8 objectForKeyedSubscript:@"VPNIncludedBundleIDs"];
  [(VPNSetupListController *)self setIncludedBundleIDs:v38];

  v39 = [v8 objectForKeyedSubscript:@"VPNMatchDomains"];
  [(VPNSetupListController *)self setMatchDomains:v39];

  v40 = [v8 objectForKeyedSubscript:@"VPNExcludeDomains"];
  [(VPNSetupListController *)self setExcludeDomains:v40];

  [(VPNSetupListController *)self setDirty:0];
  [(VPNSetupListController *)self setOriginalVPNType:[(VPNSetupListController *)self currentVPNType]];

LABEL_13:
}

- (void)cancelButtonClicked:(id)a3
{
  if ([(VPNSetupListController *)self editMode])
  {
    BOOL v4 = [(VPNSetupListController *)self serviceID];
    [(VPNSetupListController *)self setStateForServiceID:v4];

    [(VPNSetupListController *)self leaveEditMode];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE78]));
    [WeakRetained dismiss];
  }
}

- (void)loadView
{
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  BOOL v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"overview-mode"];
  -[VPNSetupListController setOverviewMode:](self, "setOverviewMode:", [v5 BOOLValue]);

  v11.receiver = self;
  v11.super_class = (Class)VPNSetupListController;
  [(VPNSetupListController *)&v11 loadView];
  char v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) userInfo];
  id v7 = [v6 objectForKey:@"vpn-service-id"];
  [(VPNSetupListController *)self setStateForServiceID:v7];

  if (![(VPNSetupListController *)self overviewMode])
  {
    int v8 = [(VPNSetupListController *)self navigationItem];
    id v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonClicked_];
    [v8 setLeftBarButtonItem:v9];

    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_saveButtonClicked_];
    [v8 setRightBarButtonItem:v10];

    [(VPNSetupListController *)self updateDoneButton];
  }
}

- (id)connection
{
  uint64_t v3 = +[VPNConnectionStore sharedInstance];
  BOOL v4 = [(VPNSetupListController *)self serviceID];
  uint64_t v5 = objc_msgSend(v3, "connectionWithServiceID:withGrade:", v4, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  return v5;
}

- (id)statusForConnection:(id)a3
{
  uint64_t v3 = [(VPNSetupListController *)self connection];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 statusText];
  }
  else
  {
    char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v6 localizedStringForKey:@"NOT_CONFIGURED" value:&stru_26E7C6230 table:@"MobileVPN"];
  }

  return v5;
}

- (id)interfaceTypeForConnection:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"VPNSubConnectionIndex"];
  if (v4)
  {
    uint64_t v5 = [(VPNSetupListController *)self connection];
    objc_msgSend(v5, "interfaceTypeForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
    char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = &stru_26E7C6230;
  }

  return v6;
}

- (id)serverForConnection:(id)a3
{
  uint64_t v3 = [(VPNSetupListController *)self connection];
  BOOL v4 = [v3 server];

  return v4;
}

- (id)usernameForConnection:(id)a3
{
  uint64_t v3 = [(VPNSetupListController *)self connection];
  BOOL v4 = [v3 accountName];

  return v4;
}

- (id)typeForConnection:(id)a3
{
  uint64_t v3 = [(VPNSetupListController *)self connection];
  BOOL v4 = [v3 vpnTypeLocalizedString];

  return v4;
}

- (id)localIPForSpecifier:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"VPNSubConnectionIndex"];
  uint64_t v5 = [(VPNSetupListController *)self connection];
  char v6 = v5;
  if (v4) {
    objc_msgSend(v5, "ipAddressesForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else {
  id v7 = [v5 ipAddresses];
  }

  if ([v7 count])
  {
    int v8 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    int v8 = &stru_26E7C6230;
  }

  return v8;
}

- (id)localIP2ForSpecifier:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"VPNSubConnectionIndex"];
  uint64_t v5 = [(VPNSetupListController *)self connection];
  char v6 = v5;
  if (v4) {
    objc_msgSend(v5, "ipAddressesForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else {
  id v7 = [v5 ipAddresses];
  }

  if ((unint64_t)[v7 count] < 2)
  {
    int v8 = &stru_26E7C6230;
  }
  else
  {
    int v8 = [v7 objectAtIndexedSubscript:1];
  }

  return v8;
}

- (id)remoteIPForSpecifier:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"VPNSubConnectionIndex"];
  uint64_t v5 = [(VPNSetupListController *)self connection];
  char v6 = v5;
  if (v4)
  {
    id v7 = objc_msgSend(v5, "remoteAddressForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else
  {
    int v8 = [v5 remoteAddress];

    id v9 = [(VPNSetupListController *)self connection];
    unint64_t v10 = [v9 server];
    int v11 = [v8 isEqualToString:v10];

    if (v11)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__VPNSetupListController_remoteIPForSpecifier___block_invoke;
      block[3] = &unk_264C065A8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    unint64_t v12 = [(VPNSetupListController *)self connection];
    id v7 = [v12 remoteAddress];
  }

  return v7;
}

void __47__VPNSetupListController_remoteIPForSpecifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 serverAddressSpecifier];
  [v1 removeSpecifier:v2];
}

- (id)timeConnectedForSpecifier:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"VPNSubConnectionIndex"];
  uint64_t v5 = [(VPNSetupListController *)self connection];
  char v6 = v5;
  if (v4) {
    objc_msgSend(v5, "elapsedTimeLocalizedStringForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else {
  id v7 = [v5 elapsedTimeLocalizedString];
  }

  return v7;
}

- (id)tunnelType:(id)a3
{
  uint64_t v3 = [(VPNSetupListController *)self connection];
  BOOL v4 = [v3 tunnelType];

  return v4;
}

- (id)getDescriptionForApp:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"AppDescription"];
  BOOL v4 = v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = &stru_26E7C6230;
  }

  return v5;
}

- (void)setConnectionState:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  uint64_t v5 = [(VPNSetupListController *)self connection];
  if (v5)
  {
    if ([v6 BOOLValue]) {
      [v5 connect];
    }
    else {
      [v5 disconnect];
    }
  }
}

- (id)getConnectionStateForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = [(VPNSetupListController *)self connection];
  uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "notDisconnectedOrDisconnecting"));

  return v5;
}

- (id)specifiers
{
  id v2 = self;
  uint64_t v468 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v38 = [(VPNSetupListController *)v2 navigationController];
    id v39 = (id)[v38 popViewControllerAnimated:1];

    id v40 = 0;
    goto LABEL_208;
  }
  uint64_t v5 = [v4 userInfo];
  id v6 = +[VPNConnectionStore sharedInstance];
  id v7 = (void *)VPNCopyAvailableCertificateIDs();
  [(VPNSetupListController *)v2 setCertificateIDs:v7];

  int v8 = (void *)VPNCopyAvailableCertificateObjects();
  [(VPNSetupListController *)v2 setCertificateObjects:v8];

  id v9 = (void *)MEMORY[0x263EFF980];
  unint64_t v10 = [(VPNSetupListController *)v2 loadSpecifiersFromPlistName:@"VPN" target:v2];
  v428 = [v9 arrayWithArray:v10];

  v441 = v2;
  if ([(VPNSetupListController *)v2 overviewMode])
  {
    int v11 = [*(id *)((char *)&v2->super.super.super.super.super.isa + v3) name];
    [(VPNSetupListController *)v2 setTitle:v11];

    unint64_t v12 = objc_msgSend(v5, "objectForKeyedSubscript:");
    uint64_t v13 = objc_msgSend(v6, "connectionWithServiceID:withGrade:", v12, -[VPNSetupListController vpnGrade](v2, "vpnGrade"));

    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v15 = v6;
    v426 = v13;
    v427 = v14;
    if ([v13 grade] == 7 || objc_msgSend(v13, "grade") == 8)
    {
      id v16 = [v13 server];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        uint64_t v18 = (void *)MEMORY[0x263F5FC40];
        uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        unint64_t v20 = [v19 localizedStringForKey:@"SERVER" value:&stru_26E7C6230 table:@"MobileVPN"];
        uint64_t v21 = [v18 preferenceSpecifierNamed:v20 target:v2 set:0 get:sel_serverForConnection_ detail:0 cell:4 edit:0];
        [(VPNSetupListController *)v2 setServerSpecifier:v21];

        v22 = [(VPNSetupListController *)v2 serverSpecifier];
        [v14 addObject:v22];
      }
      v23 = v2;
      v24 = v5;
      v25 = [(VPNSetupListController *)v23 matchDomains];
      uint64_t v26 = [v25 count];

      if (v26)
      {
        id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v28 = (void *)MEMORY[0x263F5FC40];
        v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v30 = [v29 localizedStringForKey:@"MATCH_DOMAINS" value:&stru_26E7C6230 table:@"MobileVPN"];
        long long v31 = [v28 groupSpecifierWithName:v30];

        v438 = v27;
        [v27 addObject:v31];
        long long v457 = 0u;
        long long v458 = 0u;
        long long v455 = 0u;
        long long v456 = 0u;
        long long v32 = [(VPNSetupListController *)v23 matchDomains];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v455 objects:v467 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v456;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v456 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:*(void *)(*((void *)&v455 + 1) + 8 * i) target:v441 set:0 get:0 detail:0 cell:4 edit:0];
              [v438 addObject:v37];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v455 objects:v467 count:16];
          }
          while (v34);
        }
      }
      else
      {
        v438 = 0;
      }
      v80 = [(VPNSetupListController *)v441 excludeDomains];
      uint64_t v81 = [v80 count];

      if (!v81)
      {
        v425 = 0;
        v437 = 0;
        uint64_t v5 = v24;
        id v2 = v441;
        goto LABEL_38;
      }
      id v82 = objc_alloc_init(MEMORY[0x263EFF980]);
      v83 = (void *)MEMORY[0x263F5FC40];
      v84 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v85 = [v84 localizedStringForKey:@"EXCLUDE_DOMAINS" value:&stru_26E7C6230 table:@"MobileVPN"];
      v86 = [v83 groupSpecifierWithName:v85];

      v437 = v82;
      [v82 addObject:v86];
      long long v453 = 0u;
      long long v454 = 0u;
      long long v451 = 0u;
      long long v452 = 0u;
      v87 = [(VPNSetupListController *)v441 excludeDomains];
      uint64_t v88 = [v87 countByEnumeratingWithState:&v451 objects:v466 count:16];
      uint64_t v5 = v24;
      id v2 = v441;
      if (v88)
      {
        uint64_t v89 = v88;
        uint64_t v90 = *(void *)v452;
        do
        {
          for (uint64_t j = 0; j != v89; ++j)
          {
            if (*(void *)v452 != v90) {
              objc_enumerationMutation(v87);
            }
            v92 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:*(void *)(*((void *)&v451 + 1) + 8 * j) target:v441 set:0 get:0 detail:0 cell:4 edit:0];
            [v437 addObject:v92];
          }
          uint64_t v89 = [v87 countByEnumeratingWithState:&v451 objects:v466 count:16];
        }
        while (v89);
      }

      v425 = 0;
LABEL_36:
      id v14 = v427;
LABEL_38:
      uint64_t v13 = v426;
      goto LABEL_39;
    }
    int v142 = [v13 connected];
    uint64_t v143 = [(VPNSetupListController *)v2 vpnGrade];
    if (v142)
    {
      if (v143 != 3)
      {
        v342 = [v13 server];
        uint64_t v343 = [v342 length];

        if (v343)
        {
          v344 = (void *)MEMORY[0x263F5FC40];
          v345 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v346 = [v345 localizedStringForKey:@"SERVER" value:&stru_26E7C6230 table:@"MobileVPN"];
          v347 = [v344 preferenceSpecifierNamed:v346 target:v2 set:0 get:sel_serverForConnection_ detail:0 cell:4 edit:0];
          [(VPNSetupListController *)v2 setServerSpecifier:v347];

          v348 = [(VPNSetupListController *)v2 serverSpecifier];
          [v14 addObject:v348];
        }
        v349 = [v13 accountName];
        uint64_t v350 = [v349 length];

        if (v350)
        {
          v351 = (void *)MEMORY[0x263F5FC40];
          v352 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v353 = [v352 localizedStringForKey:@"ACCOUNT_NAME" value:&stru_26E7C6230 table:@"MobileVPN"];
          v354 = [v351 preferenceSpecifierNamed:v353 target:v2 set:0 get:sel_usernameForConnection_ detail:0 cell:4 edit:0];
          [(VPNSetupListController *)v2 setAccountSpecifier:v354];

          v355 = [(VPNSetupListController *)v2 accountSpecifier];
          [v14 addObject:v355];
        }
        v356 = [v13 remoteAddress];
        uint64_t v357 = [v356 length];

        if (v357)
        {
          v358 = (void *)MEMORY[0x263F5FC40];
          v359 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v360 = [v359 localizedStringForKey:@"REMOTE_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
          v361 = [v358 preferenceSpecifierNamed:v360 target:v2 set:0 get:sel_remoteIPForSpecifier_ detail:0 cell:4 edit:0];
          [(VPNSetupListController *)v2 setServerAddressSpecifier:v361];

          v362 = [(VPNSetupListController *)v2 serverAddressSpecifier];
          [v14 addObject:v362];
        }
        v363 = [v13 ipAddresses];
        if ([v363 count])
        {
          v364 = [v13 ipAddresses];
          v365 = [v364 objectAtIndexedSubscript:0];
          uint64_t v366 = [v365 length];

          if (v366)
          {
            v367 = (void *)MEMORY[0x263F5FC40];
            v368 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v369 = [v368 localizedStringForKey:@"LOCAL_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
            v370 = [v367 preferenceSpecifierNamed:v369 target:v2 set:0 get:sel_localIPForSpecifier_ detail:0 cell:4 edit:0];

            [v14 addObject:v370];
          }
          else
          {
            v370 = 0;
          }
          uint64_t v13 = v426;
        }
        else
        {

          v370 = 0;
        }
        v389 = [v13 ipAddresses];
        if ((unint64_t)[v389 count] <= 1)
        {
        }
        else
        {
          v390 = [v13 ipAddresses];
          v391 = [v390 objectAtIndexedSubscript:1];
          uint64_t v392 = [v391 length];

          if (v392)
          {
            v393 = (void *)MEMORY[0x263F5FC40];
            v394 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v395 = [v394 localizedStringForKey:@"LOCAL_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
            uint64_t v396 = [v393 preferenceSpecifierNamed:v395 target:v2 set:0 get:sel_localIP2ForSpecifier_ detail:0 cell:4 edit:0];

            [v14 addObject:v396];
            v370 = (void *)v396;
          }
        }
        v397 = (void *)MEMORY[0x263F5FC40];
        v398 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v399 = [v398 localizedStringForKey:@"CONNECT_TIME" value:&stru_26E7C6230 table:@"MobileVPN"];
        v400 = [v397 preferenceSpecifierNamed:v399 target:v2 set:0 get:sel_timeConnectedForSpecifier_ detail:0 cell:4 edit:0];
        [(VPNSetupListController *)v2 setTimeSpecifier:v400];

        v401 = [(VPNSetupListController *)v2 timeSpecifier];
        [v14 addObject:v401];

        if (!os_variant_has_internal_ui())
        {
          v425 = v370;
          v437 = 0;
          v438 = 0;
          goto LABEL_36;
        }
        if ([(VPNSetupListController *)v2 currentVPNType] != 4
          || [(VPNSetupListController *)v2 vpnGrade] != 1
          && [(VPNSetupListController *)v2 vpnGrade])
        {
          v437 = 0;
          v438 = 0;
          v425 = v370;
          goto LABEL_36;
        }
        v403 = (void *)MEMORY[0x263F5FC40];
        v404 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v405 = [v404 localizedStringForKey:@"TUNNEL_TYPE" value:&stru_26E7C6230 table:@"MobileVPN"];
        uint64_t v406 = [v403 preferenceSpecifierNamed:v405 target:v2 set:0 get:sel_tunnelType_ detail:0 cell:4 edit:0];

        v425 = (void *)v406;
        [v14 addObject:v406];
        uint64_t v13 = v426;
        if (([v426 isPrimary] & 1) == 0)
        {
          v407 = [v426 matchDomains];
          uint64_t v408 = [v407 count];

          if (v408)
          {
            id v409 = objc_alloc_init(MEMORY[0x263EFF980]);
            v440 = (void *)MEMORY[0x263F5FC40];
            v410 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v411 = [v410 localizedStringForKey:@"MATCH_DOMAINS" value:&stru_26E7C6230 table:@"MobileVPN"];
            uint64_t v412 = [v440 groupSpecifierWithName:v411];

            v438 = v409;
            v413 = v409;
            v414 = (void *)v412;
            [v413 addObject:v412];
            long long v449 = 0u;
            long long v450 = 0u;
            long long v447 = 0u;
            long long v448 = 0u;
            v415 = [v426 matchDomains];
            uint64_t v416 = [v415 countByEnumeratingWithState:&v447 objects:v465 count:16];
            if (v416)
            {
              uint64_t v417 = v416;
              uint64_t v418 = *(void *)v448;
              do
              {
                for (uint64_t k = 0; k != v417; ++k)
                {
                  if (*(void *)v448 != v418) {
                    objc_enumerationMutation(v415);
                  }
                  v420 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:*(void *)(*((void *)&v447 + 1) + 8 * k) target:v2 set:0 get:0 detail:0 cell:4 edit:0];
                  [v438 addObject:v420];
                }
                uint64_t v417 = [v415 countByEnumeratingWithState:&v447 objects:v465 count:16];
              }
              while (v417);
            }

            v437 = 0;
            goto LABEL_36;
          }
        }
        v437 = 0;
        v438 = 0;
LABEL_39:
        id v93 = objc_alloc_init(MEMORY[0x263EFF980]);
        v424 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        objc_msgSend(v93, "addObject:");
        v94 = [v428 specifierForID:@"VPN_GRADE"];
        [v93 addObject:v94];

        if (v14) {
          [v93 addObjectsFromArray:v14];
        }
        v433 = v93;
        v95 = [(VPNSetupListController *)v2 appName];
        if ([v95 length])
        {
          v96 = v93;
        }
        else
        {
          v96 = v93;
          if ([(VPNSetupListController *)v2 vpnGrade] == 2)
          {
            uint64_t v97 = [(VPNSetupListController *)v2 currentVPNType];

            if (v97 == 3 || !v13)
            {
LABEL_48:
              v102 = [(VPNSetupListController *)v2 appName];
              uint64_t v103 = [v102 length];

              if (v103)
              {
                v104 = NSString;
                v105 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v106 = [v105 localizedStringForKey:@"APP_CONFIG_MESSAGE" value:&stru_26E7C6230 table:@"MobileVPN"];
                v107 = [(VPNSetupListController *)v2 displayName];
                v108 = [(VPNSetupListController *)v2 appName];
                v109 = objc_msgSend(v104, "stringWithFormat:", v106, v107, v108);

                uint64_t v13 = v426;
                [v424 setProperty:v109 forKey:*MEMORY[0x263F600F8]];
              }
              if ([(VPNSetupListController *)v2 onDemandService])
              {
                v110 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
                [v96 addObject:v110];

                v111 = [v428 specifierForID:@"ON_DEMAND"];
                uint64_t v461 = *MEMORY[0x263F600A8];
                v112 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "onDemandUserOverrideDisabled") ^ 1);
                v462 = v112;
                v113 = [NSDictionary dictionaryWithObjects:&v462 forKeys:&v461 count:1];
                [v111 setProperties:v113];

                [v96 addObject:v111];
              }
              if ([v438 count]) {
                [v96 addObjectsFromArray:v438];
              }
              if ([v437 count]) {
                [v96 addObjectsFromArray:v437];
              }
              v114 = [v5 objectForKeyedSubscript:@"vpn-service-id"];
              v115 = (void *)[v114 copy];
              [(VPNSetupListController *)v2 setServiceID:v115];

              v116 = [v5 objectForKeyedSubscript:@"vpn-user-created"];
              -[VPNSetupListController setUserCreated:](v2, "setUserCreated:", [v116 BOOLValue]);

              v117 = [v5 objectForKeyedSubscript:@"vpn-profile-backed"];
              -[VPNSetupListController setProfileBacked:](v2, "setProfileBacked:", [v117 BOOLValue]);

              v118 = +[VPNConnectionStore sharedInstance];
              v119 = [(VPNSetupListController *)v2 serviceID];
              char v120 = objc_msgSend(v118, "isEnabledWithServiceID:withGrade:", v119, -[VPNSetupListController vpnGrade](v2, "vpnGrade"));

              uint64_t v121 = [(VPNSetupListController *)v2 vpnGrade];
              if (v120)
              {
                if (v121 == 8 || [(VPNSetupListController *)v2 vpnGrade] == 7)
                {
                  v122 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
                  [v96 addObject:v122];

                  v123 = (void *)MEMORY[0x263F5FC40];
                  v124 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  v125 = [v124 localizedStringForKey:@"DEACTIVATE_CONFIGURATION" value:&stru_26E7C6230 table:@"MobileVPN"];
                  v126 = [v123 preferenceSpecifierNamed:v125 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
                  [(VPNSetupListController *)v2 setEnableButton:v126];

                  v127 = sel_disableButtonTapped_;
LABEL_64:
                  v133 = [(VPNSetupListController *)v2 enableButton];
                  [v133 setButtonAction:v127];

                  v134 = [(VPNSetupListController *)v2 enableButton];
                  [v96 addObject:v134];
                }
              }
              else if (v121 == 2 {
                     || [(VPNSetupListController *)v2 vpnGrade] == 8
              }
                     || [(VPNSetupListController *)v2 vpnGrade] == 7)
              {
                v128 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
                [v96 addObject:v128];

                v129 = (void *)MEMORY[0x263F5FC40];
                v130 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v131 = [v130 localizedStringForKey:@"ACTIVATE_CONFIGURATION" value:&stru_26E7C6230 table:@"MobileVPN"];
                v132 = [v129 preferenceSpecifierNamed:v131 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
                [(VPNSetupListController *)v2 setEnableButton:v132];

                v127 = sel_enableButtonTapped_;
                goto LABEL_64;
              }
              if ([(VPNSetupListController *)v2 userCreated])
              {
                v135 = [(VPNSetupListController *)v2 serviceID];
                BOOL v136 = v135 != 0;
              }
              else
              {
                BOOL v136 = 0;
              }
              if ([(VPNSetupListController *)v2 onDemandService])
              {
                BOOL v137 = 0;
LABEL_116:
                if (v136 || v137)
                {
                  [(VPNSetupListController *)v2 setPasswordEditOnly:!v136];
                  v258 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:2 target:v2 action:sel_editButtonTapped_];
                  v259 = [(VPNSetupListController *)v2 navigationItem];
                  [v259 setRightBarButtonItem:v258];
                }
                v199 = v427;
                id v200 = v433;
                if (![(VPNSetupListController *)v2 profileBacked])
                {
                  v260 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
                  [v433 addObject:v260];

                  v261 = [v433 lastObject];
                  [v261 setProperty:@"SPACER_GROUP" forKey:*MEMORY[0x263F60138]];

                  if ([v13 grade] == 7 || objc_msgSend(v13, "grade") == 8)
                  {
                    v262 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    v263 = v262;
                    v264 = @"DELETE_RELAY";
                  }
                  else
                  {
                    v262 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    v263 = v262;
                    v264 = @"DELETE_VPN";
                  }
                  id v302 = [v262 localizedStringForKey:v264 value:&stru_26E7C6230 table:@"MobileVPN"];

                  v303 = [MEMORY[0x263F5FC40] deleteButtonSpecifierWithName:v302 target:v2 action:sel_deleteConfirm_];
                  [v433 addObject:v303];
                }
                v304 = +[VPNConnectionStore sharedInstance];
                v305 = [(VPNSetupListController *)v2 serviceID];
                v306 = [v304 getProfileIDForServiceID:v305];

                if (v306)
                {
                  v307 = [v13 lastStopCause];
                  if (([v307 intValue] == 13
                     || [v307 intValue] == 20
                     || [v307 intValue] == 21
                     || [v307 intValue] == 24)
                    && [(VPNSetupListController *)v2 vpnGrade] != 7
                    && [(VPNSetupListController *)v2 vpnGrade] != 8)
                  {
                    v308 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
                    [v433 addObject:v308];

                    v309 = (void *)MEMORY[0x263F5FC40];
                    v310 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    v311 = [v310 localizedStringForKey:@"RENEW_CERTIFICATE" value:&stru_26E7C6230 table:@"MobileVPN"];
                    v312 = [v309 preferenceSpecifierNamed:v311 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

                    uint64_t v13 = v426;
                    [v312 setButtonAction:sel_renewCertificate_];
                    [v433 addObject:v312];
                  }
                }
                uint64_t v313 = [(VPNSetupListController *)v2 includedBundleIDs];
                if (v313)
                {
                  v314 = (void *)v313;
                  v315 = [(VPNSetupListController *)v2 includedBundleIDs];
                  uint64_t v316 = [v315 count];

                  if (v316)
                  {
                    v422 = v15;
                    v423 = v5;
                    v317 = (void *)MEMORY[0x263F5FC40];
                    v318 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    v319 = [v318 localizedStringForKey:@"INCLUDED_APPS_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
                    v320 = [v317 groupSpecifierWithName:v319];
                    [v433 addObject:v320];

                    long long v445 = 0u;
                    long long v446 = 0u;
                    long long v443 = 0u;
                    long long v444 = 0u;
                    obuint64_t j = [(VPNSetupListController *)v2 includedBundleIDs];
                    uint64_t v321 = [obj countByEnumeratingWithState:&v443 objects:v460 count:16];
                    if (v321)
                    {
                      uint64_t v322 = v321;
                      uint64_t v323 = *(void *)v444;
                      uint64_t v432 = *MEMORY[0x263F60138];
                      uint64_t v430 = *MEMORY[0x263F601A8];
                      uint64_t v431 = *MEMORY[0x263F60188];
                      uint64_t v429 = *MEMORY[0x263F60140];
                      do
                      {
                        uint64_t v324 = 0;
                        uint64_t v435 = v322;
                        do
                        {
                          if (*(void *)v444 != v323) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v325 = *(void *)(*((void *)&v443 + 1) + 8 * v324);
                          id v326 = objc_alloc(MEMORY[0x263F01878]);
                          id v442 = 0;
                          v327 = (void *)[v326 initWithBundleIdentifier:v325 allowPlaceholder:0 error:&v442];
                          id v328 = v442;
                          v329 = [v327 localizedName];

                          if (v329) {
                            BOOL v330 = v328 == 0;
                          }
                          else {
                            BOOL v330 = 0;
                          }
                          if (v330)
                          {
                            v331 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v329 target:v441 set:0 get:sel_getDescriptionForApp_ detail:0 cell:4 edit:0];
                            v332 = [(VPNSetupListController *)v441 includedBundleIDs];
                            v333 = [v332 objectForKeyedSubscript:v325];
                            [v331 setProperty:v333 forKey:@"AppDescription"];

                            [v331 setProperty:v325 forKey:v432];
                            if ([MEMORY[0x263F1CBA0] bundleIdentifierContainsWebClipIdentifier:v325])
                            {
                              v334 = [MEMORY[0x263F1CBA0] webClipIdentifierFromBundleIdentifier:v325];
                              v335 = [MEMORY[0x263F1CBA0] webClipWithIdentifier:v334];
                              v336 = [MEMORY[0x263F1C920] mainScreen];
                              [v336 scale];
                              v337 = objc_msgSend(v335, "generateIconImageForFormat:scale:", 0);

                              if (v337) {
                                [v331 setProperty:v337 forKey:v429];
                              }
                            }
                            else
                            {
                              [v331 setProperty:v325 forKey:v431];
                              v334 = [NSNumber numberWithBool:1];
                              [v331 setProperty:v334 forKey:v430];
                            }
                            uint64_t v322 = v435;

                            [v433 addObject:v331];
                          }

                          ++v324;
                        }
                        while (v322 != v324);
                        uint64_t v322 = [obj countByEnumeratingWithState:&v443 objects:v460 count:16];
                      }
                      while (v322);
                    }

                    int v15 = v422;
                    uint64_t v5 = v423;
                    id v2 = v441;
                    uint64_t v13 = v426;
                    v199 = v427;
                    id v200 = v433;
                  }
                }
                v338 = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
                objc_storeStrong(v338, v200);
                id v40 = *v338;

                v196 = v425;
                v197 = v437;
                v198 = v438;
                goto LABEL_207;
              }
              v138 = +[VPNConnectionStore sharedInstance];
              v139 = [(VPNSetupListController *)v2 serviceID];
              v140 = [v138 getProfileIDForServiceID:v139];
              if (!v140)
              {
                BOOL v137 = 0;
                goto LABEL_115;
              }
              v141 = [(VPNSetupListController *)v2 appName];
              if ([v141 length]
                || [(VPNSetupListController *)v2 currentVPNType] == 3
                || [(VPNSetupListController *)v2 vpnGrade]
                || [(VPNSetupListController *)v2 alwaysPrompt])
              {
                goto LABEL_75;
              }
              if ([(VPNSetupListController *)v2 currentVPNType] != 4)
              {
                BOOL v137 = 1;
                goto LABEL_76;
              }
              if ([(VPNSetupListController *)v2 eapType] != 1)
              {
LABEL_75:
                BOOL v137 = 0;
              }
              else
              {
                v402 = [v426 accountName];
                BOOL v137 = [v402 length] != 0;
              }
LABEL_76:

              uint64_t v13 = v426;
LABEL_115:

              goto LABEL_116;
            }
            v98 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v95 = [v98 localizedStringForKey:@"STATUS" value:&stru_26E7C6230 table:@"MobileVPN"];

            v99 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v95 target:v2 set:sel_setConnectionState_forSpecifier_ get:sel_getConnectionStateForSpecifier_ detail:0 cell:6 edit:0];
            uint64_t v463 = *MEMORY[0x263F5FFE0];
            uint64_t v464 = objc_opt_class();
            v100 = [NSDictionary dictionaryWithObjects:&v464 forKeys:&v463 count:1];
            [v99 setProperties:v100];

            [(VPNSetupListController *)v2 setConnectSpecifier:v99];
            v101 = [(VPNSetupListController *)v2 connectSpecifier];
            [v433 addObject:v101];
          }
        }

        goto LABEL_48;
      }
      id v144 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(VPNSetupListController *)v2 setTimeSpecifierArray:v144];

      uint64_t v434 = [v13 subConnectionCount];
      if (v434)
      {
        v421 = v6;
        v425 = 0;
        uint64_t v145 = 0;
        unint64_t v146 = 0x263F08000uLL;
        do
        {
          v147 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
          [v14 addObject:v147];

          v148 = (void *)MEMORY[0x263F5FC40];
          v149 = v14;
          v150 = [*(id *)(v146 + 1760) bundleForClass:objc_opt_class()];
          v151 = [v150 localizedStringForKey:@"INTERFACE_TYPE" value:&stru_26E7C6230 table:@"MobileVPN"];
          v152 = [v148 preferenceSpecifierNamed:v151 target:v2 set:0 get:sel_interfaceTypeForConnection_ detail:0 cell:4 edit:0];

          v153 = [NSNumber numberWithUnsignedInteger:v145];
          [v152 setProperty:v153 forKey:@"VPNSubConnectionIndex"];

          [v149 addObject:v152];
          v154 = (void *)MEMORY[0x263F5FC40];
          v155 = [*(id *)(v146 + 1760) bundleForClass:objc_opt_class()];
          v156 = [v155 localizedStringForKey:@"REMOTE_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
          v157 = [v154 preferenceSpecifierNamed:v156 target:v2 set:0 get:sel_remoteIPForSpecifier_ detail:0 cell:4 edit:0];

          v158 = [NSNumber numberWithUnsignedInteger:v145];
          [v157 setProperty:v158 forKey:@"VPNSubConnectionIndex"];

          [v149 addObject:v157];
          v159 = (void *)MEMORY[0x263F5FC40];
          v160 = [*(id *)(v146 + 1760) bundleForClass:objc_opt_class()];
          v161 = [v160 localizedStringForKey:@"LOCAL_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
          v162 = [v159 preferenceSpecifierNamed:v161 target:v2 set:0 get:sel_localIPForSpecifier_ detail:0 cell:4 edit:0];

          v163 = v426;
          v164 = [v426 ipAddressesForSubConnection:v145];
          if ([v164 count])
          {
            v165 = [v426 ipAddressesForSubConnection:v145];
            v166 = [v165 objectAtIndexedSubscript:0];
            uint64_t v167 = [v166 length];

            if (v167)
            {
              v168 = (void *)MEMORY[0x263F5FC40];
              v169 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v170 = [v169 localizedStringForKey:@"LOCAL_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
              uint64_t v171 = [v168 preferenceSpecifierNamed:v170 target:v441 set:0 get:sel_localIPForSpecifier_ detail:0 cell:4 edit:0];

              v172 = [NSNumber numberWithUnsignedInteger:v145];
              [v162 setProperty:v172 forKey:@"VPNSubConnectionIndex"];

              [v427 addObject:v162];
              v425 = (void *)v171;
            }
            v163 = v426;
          }
          else
          {
          }
          v173 = [v163 ipAddressesForSubConnection:v145];
          uint64_t v439 = v145;
          if ((unint64_t)[v173 count] <= 1)
          {

            unint64_t v178 = 0x263F08000;
          }
          else
          {
            v174 = [v163 ipAddressesForSubConnection:v145];
            v175 = [v174 objectAtIndexedSubscript:1];
            uint64_t v176 = [v175 length];

            if (v176)
            {
              v177 = (void *)MEMORY[0x263F5FC40];
              unint64_t v178 = 0x263F08000uLL;
              v179 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v180 = [v179 localizedStringForKey:@"LOCAL_IP" value:&stru_26E7C6230 table:@"MobileVPN"];
              uint64_t v181 = [v177 preferenceSpecifierNamed:v180 target:v441 set:0 get:sel_localIP2ForSpecifier_ detail:0 cell:4 edit:0];

              v182 = [NSNumber numberWithUnsignedInteger:v145];
              [v162 setProperty:v182 forKey:@"VPNSubConnectionIndex"];

              [v427 addObject:v162];
              v425 = (void *)v181;
            }
            else
            {
              unint64_t v178 = 0x263F08000uLL;
            }
          }
          v183 = (void *)MEMORY[0x263F5FC40];
          unint64_t v146 = v178;
          v184 = [*(id *)(v178 + 1760) bundleForClass:objc_opt_class()];
          v185 = [v184 localizedStringForKey:@"CONNECT_TIME" value:&stru_26E7C6230 table:@"MobileVPN"];
          v186 = [v183 preferenceSpecifierNamed:v185 target:v441 set:0 get:sel_timeConnectedForSpecifier_ detail:0 cell:4 edit:0];

          id v2 = v441;
          v187 = [NSNumber numberWithUnsignedInteger:v145];
          [v186 setProperty:v187 forKey:@"VPNSubConnectionIndex"];

          id v14 = v427;
          [v427 addObject:v186];
          v188 = [(VPNSetupListController *)v441 timeSpecifierArray];
          [v188 addObject:v186];

          ++v145;
        }
        while (v434 != v439 + 1);
        v437 = 0;
        v438 = 0;
        int v15 = v421;
        goto LABEL_38;
      }
    }
    else if (v143 != 3)
    {
      v288 = [v13 server];
      uint64_t v289 = [v288 length];

      if (v289)
      {
        v290 = (void *)MEMORY[0x263F5FC40];
        v291 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v292 = [v291 localizedStringForKey:@"SERVER" value:&stru_26E7C6230 table:@"MobileVPN"];
        v293 = [v290 preferenceSpecifierNamed:v292 target:v2 set:0 get:sel_serverForConnection_ detail:0 cell:4 edit:0];
        [(VPNSetupListController *)v2 setServerSpecifier:v293];

        v294 = [(VPNSetupListController *)v2 serverSpecifier];
        [v14 addObject:v294];
      }
      v295 = [v13 accountName];
      uint64_t v296 = [v295 length];

      if (v296)
      {
        v297 = (void *)MEMORY[0x263F5FC40];
        v298 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v299 = [v298 localizedStringForKey:@"ACCOUNT_NAME" value:&stru_26E7C6230 table:@"MobileVPN"];
        v300 = [v297 preferenceSpecifierNamed:v299 target:v2 set:0 get:sel_usernameForConnection_ detail:0 cell:4 edit:0];
        [(VPNSetupListController *)v2 setAccountSpecifier:v300];

        v301 = [(VPNSetupListController *)v2 accountSpecifier];
        [v14 addObject:v301];
      }
    }
    v425 = 0;
    v437 = 0;
    v438 = 0;
    goto LABEL_39;
  }
  id v41 = v6;
  BOOL v42 = [(VPNSetupListController *)v2 passwordEditOnly];
  v43 = (uint64_t *)MEMORY[0x263F600A8];
  if (!v42)
  {
    v62 = [v428 specifierForID:@"VPN_GRADE"];
    [(VPNSetupListController *)v2 setVpnGradeStaticSpecifier:v62];

    v63 = [v428 specifierForID:@"GROUP_NAME"];
    [(VPNSetupListController *)v2 setGroupNameSpecifier:v63];

    v64 = [v428 specifierForID:@"LOCAL_IDENTIFIER"];
    [(VPNSetupListController *)v2 setLocalIdentifierSpecifier:v64];

    v65 = [v428 specifierForID:@"REMOTE_IDENTIFIER"];
    [(VPNSetupListController *)v2 setRemoteIdentifierSpecifier:v65];

    v66 = [v428 specifierForID:@"EAP_TYPE"];
    [(VPNSetupListController *)v2 setEapTypeSpecifier:v66];

    v67 = [v428 specifierForID:@"CERTIFICATE_BASED"];
    [(VPNSetupListController *)v2 setUseCertificateSwitchSpecifier:v67];

    v68 = [v428 specifierForID:@"CERTIFICATE_IKEV2"];
    [(VPNSetupListController *)v2 setAuthTypeSpecifier:v68];

    v69 = [v428 specifierForID:@"CERTIFICATE_LIST"];
    [(VPNSetupListController *)v2 setCertificateListSpecifier:v69];

    v70 = [(VPNSetupListController *)v2 certificateObjects];
    if ([v70 count])
    {
      v71 = [(VPNSetupListController *)v2 certificateObjects];
      uint64_t v72 = [v71 count];
      v73 = [(VPNSetupListController *)v2 certificateIDs];
      uint64_t v74 = [v73 count];

      if (v72 == v74)
      {
        v75 = [(VPNSetupListController *)v2 certificateListSpecifier];
        uint64_t v76 = *v43;
        uint64_t v77 = MEMORY[0x263EFFA88];
        [v75 setProperty:MEMORY[0x263EFFA88] forKey:*v43];

        v78 = [(VPNSetupListController *)v2 certificateListSpecifier];
        v79 = [(VPNSetupListController *)v2 certificateObjects];
        [v78 setValues:v79];

        goto LABEL_100;
      }
    }
    else
    {
    }
    v78 = [(VPNSetupListController *)v2 certificateListSpecifier];
    uint64_t v76 = *v43;
    uint64_t v77 = MEMORY[0x263EFFA80];
    [v78 setProperty:MEMORY[0x263EFFA80] forKey:*v43];
LABEL_100:

    v201 = [(VPNSetupListController *)v2 useCertificateSwitchSpecifier];
    [v201 setProperty:v77 forKey:v76];

    v202 = [v428 specifierForID:@"SECRET"];
    [(VPNSetupListController *)v2 setSharedSecretSpecifier:v202];

    v203 = [v428 specifierForID:@"ENCRYPTION_LEVEL"];
    [(VPNSetupListController *)v2 setEncryptionTypeSpecifier:v203];

    v204 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v205 = [v204 userInterfaceIdiom];

    if ((v205 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v206 = [(VPNSetupListController *)v2 encryptionTypeSpecifier];
      v207 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v208 = [v207 localizedStringForKey:@"ENCRYPTION_LEVEL_ABBREVIATED" value:&stru_26E7C6230 table:@"MobileVPN"];
      [v206 setName:v208];
    }
    v209 = [v428 specifierForID:@"EAP_RSA"];
    [(VPNSetupListController *)v2 setRsaSpecifier:v209];

    v210 = [v428 specifierForID:@"TYPE_SPECIFIER"];
    v459[0] = v210;
    v211 = [v428 specifierForID:@"TYPE_GROUP"];
    v459[1] = v211;
    v212 = [MEMORY[0x263EFF8C0] arrayWithObjects:v459 count:2];
    [(VPNSetupListController *)v2 setTypeTabSpecifiers:v212];

    v213 = [v428 specifierForID:@"SERVER"];
    [(VPNSetupListController *)v2 setEditServerSpecifier:v213];

    v214 = [v428 specifierForID:@"CISCO_IMAGE_GROUP"];
    [(VPNSetupListController *)v2 setCiscoImageSpecifier:v214];

    v215 = [v428 specifierForID:@"PASSWORD"];
    [(VPNSetupListController *)v2 setPasswordSpecifier:v215];

    v216 = [(VPNSetupListController *)v2 passwordSpecifier];
    v217 = objc_msgSend(NSNumber, "numberWithBool:", -[VPNSetupListController passwordRequired](v2, "passwordRequired") ^ 1);
    [v216 setProperty:v217 forKey:v76];

    v218 = [v428 specifierForID:@"DISPLAY_NAME"];
    [(VPNSetupListController *)v2 setDisplayNameSpecifier:v218];

    if ([(VPNSetupListController *)v2 currentVPNType] == 4) {
      v219 = @"USERNAME";
    }
    else {
      v219 = @"ACCOUNT_NAME";
    }
    v220 = [v428 specifierForID:v219];
    [(VPNSetupListController *)v2 setAccountSpecifier:v220];

    v221 = [(VPNSetupListController *)v2 accountSpecifier];
    [v221 setKeyboardType:0 autoCaps:0 autoCorrection:0];

    v222 = [v428 specifierForID:@"SEND_ALL_TRAFFIC"];
    [(VPNSetupListController *)v2 setSendAllTrafficSpecifier:v222];

    v223 = [v428 specifierForID:@"PROXY_LABEL"];
    [(VPNSetupListController *)v2 setProxyLabelSpecifier:v223];

    id v224 = objc_alloc(MEMORY[0x263EFF8C0]);
    v225 = [(VPNSetupListController *)v2 proxyLabelSpecifier];
    v226 = [v428 specifierForID:@"PROXY_TYPE"];
    v227 = objc_msgSend(v224, "initWithObjects:", v225, v226, 0);
    [(VPNSetupListController *)v2 setProxyGroupSpecifiers:v227];

    id v228 = objc_alloc(MEMORY[0x263EFF8C0]);
    v229 = [v428 specifierForID:@"PROXY_GROUP"];
    v230 = [v428 specifierForID:@"PROXY_URL"];
    v231 = objc_msgSend(v228, "initWithObjects:", v229, v230, 0);
    [(VPNSetupListController *)v2 setPacSpecifiers:v231];

    id v232 = objc_alloc(MEMORY[0x263EFF8C0]);
    v233 = [v428 specifierForID:@"PROXY_GROUP"];
    v234 = [v428 specifierForID:@"PROXY_SERVER"];
    v235 = [v428 specifierForID:@"PROXY_PORT"];
    v236 = [v428 specifierForID:@"PROXY_AUTHENTICATION"];
    v237 = objc_msgSend(v232, "initWithObjects:", v233, v234, v235, v236, 0);
    [(VPNSetupListController *)v2 setManualProxySpecifiers:v237];

    id v238 = objc_alloc(MEMORY[0x263EFF8C0]);
    v239 = [v428 specifierForID:@"PROXY_USERNAME"];
    v240 = [v428 specifierForID:@"PROXY_PASSWORD"];
    v241 = objc_msgSend(v238, "initWithObjects:", v239, v240, 0);
    [(VPNSetupListController *)v2 setProxyAuthSpecifiers:v241];

    v242 = [(VPNSetupListController *)v2 serviceID];

    if (!v242)
    {
      v243 = [*(id *)((char *)&v2->super.super.super.super.super.isa + v3) userInfo];
      v244 = [v243 objectForKey:@"vpn-service-id"];
      v245 = (void *)[v244 copy];
      [(VPNSetupListController *)v2 setServiceID:v245];
    }
    v246 = [(VPNSetupListController *)v2 serviceID];

    if (v246)
    {
      v247 = [*(id *)((char *)&v2->super.super.super.super.super.isa + v3) name];
      [(VPNSetupListController *)v2 setTitle:v247];
    }
    v248 = [*(id *)((char *)&v2->super.super.super.super.super.isa + v3) userInfo];
    v249 = [v248 objectForKey:@"vpn-user-created"];
    -[VPNSetupListController setUserCreated:](v2, "setUserCreated:", [v249 BOOLValue]);

    v250 = [*(id *)((char *)&v2->super.super.super.super.super.isa + v3) userInfo];
    v251 = [v250 objectForKey:@"vpn-profile-backed"];
    -[VPNSetupListController setProfileBacked:](v2, "setProfileBacked:", [v251 BOOLValue]);

    id v200 = objc_alloc_init(MEMORY[0x263EFF980]);
    v252 = [(VPNSetupListController *)v2 serviceID];

    if (v252)
    {
      int v15 = v41;
      if ([(VPNSetupListController *)v2 currentVPNType] == 2)
      {
        v253 = [(VPNSetupListController *)v2 ciscoImageSpecifier];

        if (v253)
        {
          v254 = [(VPNSetupListController *)v2 ciscoImageSpecifier];
          [v200 addObject:v254];

          v255 = [(VPNSetupListController *)v2 ciscoImageSpecifier];
          [v255 setProperty:&unk_26E7CB9A0 forKey:@"VisibleOnInit"];
        }
      }
      v256 = [(VPNSetupListController *)v2 vpnGradeStaticSpecifier];
      [v200 addObject:v256];

      v257 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v200 addObject:v257];
    }
    else
    {
      v265 = [(VPNSetupListController *)v2 ciscoImageSpecifier];

      int v15 = v41;
      if (v265)
      {
        v266 = [(VPNSetupListController *)v2 ciscoImageSpecifier];
        [v200 addObject:v266];

        v267 = [(VPNSetupListController *)v2 ciscoImageSpecifier];
        v268 = objc_msgSend(NSNumber, "numberWithBool:", -[VPNSetupListController currentVPNType](v2, "currentVPNType") == 2);
        [v267 setProperty:v268 forKey:@"VisibleOnInit"];
      }
      v257 = [(VPNSetupListController *)v2 typeTabSpecifiers];
      [v200 addObjectsFromArray:v257];
    }

    if ([(VPNSetupListController *)v2 userCreated]
      || ([(VPNSetupListController *)v2 serviceID],
          v269 = objc_claimAutoreleasedReturnValue(),
          v269,
          !v269))
    {
      v270 = [(VPNSetupListController *)v2 displayNameSpecifier];
      [v200 addObject:v270];
    }
    v271 = [(VPNSetupListController *)v2 editServerSpecifier];
    [v200 addObject:v271];

    if ([(VPNSetupListController *)v2 currentVPNType] == 4)
    {
      v272 = [(VPNSetupListController *)v2 remoteIdentifierSpecifier];
      [v200 addObject:v272];

      v273 = [(VPNSetupListController *)v2 localIdentifierSpecifier];
      [v200 addObject:v273];

      v274 = (void *)MEMORY[0x263F5FC40];
      v275 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v276 = [v275 localizedStringForKey:@"AUTHENTICATION" value:&stru_26E7C6230 table:@"MobileVPN"];
      v277 = [v274 groupSpecifierWithName:v276];
      [v200 addObject:v277];

      v278 = [(VPNSetupListController *)v2 eapTypeSpecifier];
      [v200 addObject:v278];

      if (![(VPNSetupListController *)v2 eapType])
      {
        v279 = [(VPNSetupListController *)v2 authTypeSpecifier];
        [v200 addObject:v279];
      }
      if ([(VPNSetupListController *)v2 eapType] == 1)
      {
        v280 = [(VPNSetupListController *)v2 accountSpecifier];
        [v200 addObject:v280];

        v281 = [(VPNSetupListController *)v2 passwordSpecifier];
        [v200 addObject:v281];
      }
      if ([(VPNSetupListController *)v2 eapType] == 2
        || [(VPNSetupListController *)v2 authType] == 1 && ![(VPNSetupListController *)v2 eapType])
      {
        v282 = [(VPNSetupListController *)v2 certificateListSpecifier];
        [v200 addObject:v282];
      }
      if ([(VPNSetupListController *)v2 authType])
      {
LABEL_196:
        v373 = [(VPNSetupListController *)v2 proxyGroupSpecifiers];
        [v200 addObjectsFromArray:v373];

        v374 = [v200 specifierForID:@"PROXY_TYPE"];
        v375 = [(VPNSetupListController *)v2 proxyType:v374];
        int v376 = [v375 intValue];

        if (v376 == 2)
        {
          uint64_t v380 = [(VPNSetupListController *)v2 pacSpecifiers];
        }
        else
        {
          if (v376 != 1) {
            goto LABEL_202;
          }
          v377 = [(VPNSetupListController *)v2 manualProxySpecifiers];
          [v200 addObjectsFromArray:v377];

          v378 = [(VPNSetupListController *)v2 proxyUsesAuthentication:0];
          int v379 = [v378 BOOLValue];

          if (!v379)
          {
LABEL_202:
            v382 = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
            objc_storeStrong(v382, v200);
            v383 = [(VPNSetupListController *)v2 serviceID];
            if (v383)
            {
            }
            else
            {
              v384 = [MEMORY[0x263F1C5C0] currentDevice];
              uint64_t v385 = [v384 userInterfaceIdiom];

              if ((v385 & 0xFFFFFFFFFFFFFFFBLL) != 1)
              {
                v386 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v388 = [v386 localizedStringForKey:@"ADD_VPN_ABBREVIATED" value:&stru_26E7C6230 table:@"MobileVPN"];
                [(VPNSetupListController *)v2 setTitle:v388];

                goto LABEL_206;
              }
            }
            v386 = [(VPNSetupListController *)v2 displayName];
            [(VPNSetupListController *)v2 setTitle:v386];
LABEL_206:

            id v40 = *v382;
            v196 = 0;
            v197 = 0;
            v198 = 0;
            v199 = 0;
            goto LABEL_207;
          }
          uint64_t v380 = [(VPNSetupListController *)v2 proxyAuthSpecifiers];
        }
        v381 = (void *)v380;
        [v200 addObjectsFromArray:v380];

        goto LABEL_202;
      }
    }
    else
    {
      uint64_t v283 = [(VPNSetupListController *)v2 currentVPNType];
      v284 = [(VPNSetupListController *)v2 accountSpecifier];
      [v200 addObject:v284];

      if (v283 != 2)
      {
        v339 = [(VPNSetupListController *)v2 rsaSpecifier];
        [v200 addObject:v339];

        if (![(VPNSetupListController *)v2 useRSASecurID])
        {
          v340 = [(VPNSetupListController *)v2 passwordSpecifier];
          [v200 addObject:v340];
        }
        v341 = [(VPNSetupListController *)v2 sharedSecretSpecifier];
        [v200 addObject:v341];

        uint64_t v287 = [(VPNSetupListController *)v2 sendAllTrafficSpecifier];
        goto LABEL_195;
      }
      v285 = [(VPNSetupListController *)v2 passwordSpecifier];
      [v200 addObject:v285];

      v286 = [(VPNSetupListController *)v2 useCertificateSwitchSpecifier];
      [v200 addObject:v286];

      if ([(VPNSetupListController *)v2 usesCertificates])
      {
        uint64_t v287 = [(VPNSetupListController *)v2 certificateListSpecifier];
LABEL_195:
        v372 = (void *)v287;
        [v200 addObject:v287];

        goto LABEL_196;
      }
      v371 = [(VPNSetupListController *)v2 groupNameSpecifier];
      [v200 addObject:v371];
    }
    uint64_t v287 = [(VPNSetupListController *)v2 sharedSecretSpecifier];
    goto LABEL_195;
  }
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  v45 = [v428 specifierForID:@"VPN_GRADE"];
  [v44 addObject:v45];

  v46 = [v5 objectForKeyedSubscript:@"vpn-service-id"];
  int v15 = v6;
  v47 = objc_msgSend(v6, "connectionWithServiceID:withGrade:", v46, -[VPNSetupListController vpnGrade](v2, "vpnGrade"));

  v48 = [v47 server];
  uint64_t v49 = [v48 length];

  if (v49)
  {
    v50 = (void *)MEMORY[0x263F5FC40];
    v51 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v52 = [v51 localizedStringForKey:@"SERVER" value:&stru_26E7C6230 table:@"MobileVPN"];
    v53 = [v50 preferenceSpecifierNamed:v52 target:v2 set:0 get:sel_serverForConnection_ detail:0 cell:4 edit:0];
    [(VPNSetupListController *)v2 setServerSpecifier:v53];

    v54 = [(VPNSetupListController *)v2 serverSpecifier];
    [v44 addObject:v54];
  }
  if ([(VPNSetupListController *)v2 currentVPNType] != 4)
  {
    v59 = [v428 specifierForID:@"ACCOUNT_NAME"];
    [(VPNSetupListController *)v2 setAccountSpecifier:v59];
    goto LABEL_96;
  }
  v55 = [v47 accountName];
  uint64_t v56 = [v55 length];

  v57 = v44;
  if (v56)
  {
    v58 = (void *)MEMORY[0x263F5FC40];
    v59 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v60 = [v59 localizedStringForKey:@"ACCOUNT_NAME" value:&stru_26E7C6230 table:@"MobileVPN"];
    v61 = [v58 preferenceSpecifierNamed:v60 target:v2 set:0 get:sel_usernameForConnection_ detail:0 cell:4 edit:0];
    [(VPNSetupListController *)v2 setAccountSpecifier:v61];

LABEL_96:
    v189 = [(VPNSetupListController *)v2 accountSpecifier];
    v57 = v44;
    [v44 addObject:v189];
  }
  v190 = [v428 specifierForID:@"PASSWORD"];
  [(VPNSetupListController *)v2 setPasswordSpecifier:v190];

  v191 = [(VPNSetupListController *)v2 passwordSpecifier];
  v192 = objc_msgSend(NSNumber, "numberWithBool:", -[VPNSetupListController passwordRequired](v2, "passwordRequired") ^ 1);
  [v191 setProperty:v192 forKey:*v43];

  v193 = [(VPNSetupListController *)v2 passwordSpecifier];
  [v57 addObject:v193];

  v194 = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  objc_storeStrong(v194, v57);
  v195 = [(VPNSetupListController *)v2 displayName];
  [(VPNSetupListController *)v2 setTitle:v195];

  id v40 = *v194;
  v196 = 0;
  v197 = 0;
  v198 = 0;
  v199 = 0;
  id v200 = v57;
LABEL_207:

LABEL_208:

  return v40;
}

- (void)renewCertificate:(id)a3
{
  BOOL v4 = +[VPNConnectionStore sharedInstance];
  uint64_t v5 = [(VPNSetupListController *)self serviceID];
  id v8 = [v4 getProfileIDForServiceID:v5];

  if (v8)
  {
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    [v6 showProfileErrorUIWithProfileIdentifier:v8 outError:0];

    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE78]));
    [WeakRetained dismiss];
  }
}

- (unint64_t)currentVPNType
{
  return self->_currentVPNType;
}

- (void)setCurrentVPNType:(unint64_t)a3
{
  self->_currentVPNType = a3;
}

- (unint64_t)originalVPNType
{
  return self->_originalVPNType;
}

- (void)setOriginalVPNType:(unint64_t)a3
{
  self->_originalVPNType = a3;
}

- (unint64_t)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(unint64_t)a3
{
  self->_encryptionType = a3;
}

- (unint64_t)vpnGrade
{
  return self->_vpnGrade;
}

- (void)setVpnGrade:(unint64_t)a3
{
  self->_vpnGrade = a3;
}

- (unint64_t)eapType
{
  return self->_eapType;
}

- (void)setEapType:(unint64_t)a3
{
  self->_eapType = a3;
}

- (unint64_t)authType
{
  return self->_authType;
}

- (void)setAuthType:(unint64_t)a3
{
  self->_authType = a3;
}

- (UIBarButtonItem)backButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setBackButton:(id)a3
{
}

- (BOOL)overviewMode
{
  return self->_overviewMode;
}

- (void)setOverviewMode:(BOOL)a3
{
  self->_overviewMode = a3;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(BOOL)a3
{
  self->_editMode = a3;
}

- (BOOL)passwordEditOnly
{
  return self->_passwordEditOnly;
}

- (void)setPasswordEditOnly:(BOOL)a3
{
  self->_passwordEditOnly = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)sendAllTraffic
{
  return self->_sendAllTraffic;
}

- (void)setSendAllTraffic:(BOOL)a3
{
  self->_sendAllTraffic = a3;
}

- (BOOL)useRSASecurID
{
  return self->_useRSASecurID;
}

- (void)setUseRSASecurID:(BOOL)a3
{
  self->_useRSASecurID = a3;
}

- (BOOL)usesCertificates
{
  return self->_usesCertificates;
}

- (void)setUsesCertificates:(BOOL)a3
{
  self->_usesCertificates = a3;
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (void)setPasswordRequired:(BOOL)a3
{
  self->_passwordRequired = a3;
}

- (BOOL)userCreated
{
  return self->_userCreated;
}

- (void)setUserCreated:(BOOL)a3
{
  self->_userCreated = a3;
}

- (BOOL)profileBacked
{
  return self->_profileBacked;
}

- (void)setProfileBacked:(BOOL)a3
{
  self->_profileBacked = a3;
}

- (BOOL)onDemandService
{
  return self->_onDemandService;
}

- (void)setOnDemandService:(BOOL)a3
{
  self->_onDemandService = a3;
}

- (BOOL)onDemandEnabled
{
  return self->_onDemandEnabled;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  self->_onDemandEnabled = a3;
}

- (BOOL)alwaysPrompt
{
  return self->_alwaysPrompt;
}

- (void)setAlwaysPrompt:(BOOL)a3
{
  self->_alwaysPrompt = a3;
}

- (PSSpecifier)connectSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setConnectSpecifier:(id)a3
{
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setServiceID:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setAppName:(id)a3
{
}

- (NSDictionary)includedBundleIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setIncludedBundleIDs:(id)a3
{
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 1496, 1);
}

- (void)setMatchDomains:(id)a3
{
}

- (NSArray)excludeDomains
{
  return (NSArray *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setExcludeDomains:(id)a3
{
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 1512, 1);
}

- (void)setServer:(id)a3
{
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 1520, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 1528, 1);
}

- (void)setPassword:(id)a3
{
}

- (NSString)sharedSecret
{
  return (NSString *)objc_getProperty(self, a2, 1536, 1);
}

- (void)setSharedSecret:(id)a3
{
}

- (NSString)groupDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 1544, 1);
}

- (void)setGroupDisplayName:(id)a3
{
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1552, 1);
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSString)remoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1560, 1);
}

- (void)setRemoteIdentifier:(id)a3
{
}

- (PSSpecifier)displayNameSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1568, 1);
}

- (void)setDisplayNameSpecifier:(id)a3
{
}

- (PSSpecifier)serverSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1576, 1);
}

- (void)setServerSpecifier:(id)a3
{
}

- (PSSpecifier)serverAddressSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1584, 1);
}

- (void)setServerAddressSpecifier:(id)a3
{
}

- (PSSpecifier)ciscoImageSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1592, 1);
}

- (void)setCiscoImageSpecifier:(id)a3
{
}

- (PSSpecifier)sendAllTrafficSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1600, 1);
}

- (void)setSendAllTrafficSpecifier:(id)a3
{
}

- (PSSpecifier)rsaSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1608, 1);
}

- (void)setRsaSpecifier:(id)a3
{
}

- (PSSpecifier)sharedSecretSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1616, 1);
}

- (void)setSharedSecretSpecifier:(id)a3
{
}

- (PSSpecifier)encryptionTypeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1624, 1);
}

- (void)setEncryptionTypeSpecifier:(id)a3
{
}

- (PSSpecifier)vpnGradeStaticSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1632, 1);
}

- (void)setVpnGradeStaticSpecifier:(id)a3
{
}

- (PSSpecifier)passwordSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1640, 1);
}

- (void)setPasswordSpecifier:(id)a3
{
}

- (PSSpecifier)groupNameSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1648, 1);
}

- (void)setGroupNameSpecifier:(id)a3
{
}

- (PSSpecifier)useCertificateSwitchSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1656, 1);
}

- (void)setUseCertificateSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)certificateListSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1664, 1);
}

- (void)setCertificateListSpecifier:(id)a3
{
}

- (PSSpecifier)accountSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1672, 1);
}

- (void)setAccountSpecifier:(id)a3
{
}

- (PSSpecifier)localIdentifierSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1680, 1);
}

- (void)setLocalIdentifierSpecifier:(id)a3
{
}

- (PSSpecifier)remoteIdentifierSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1688, 1);
}

- (void)setRemoteIdentifierSpecifier:(id)a3
{
}

- (PSSpecifier)eapTypeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1696, 1);
}

- (void)setEapTypeSpecifier:(id)a3
{
}

- (PSSpecifier)authTypeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1704, 1);
}

- (void)setAuthTypeSpecifier:(id)a3
{
}

- (PSSpecifier)timeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1712, 1);
}

- (void)setTimeSpecifier:(id)a3
{
}

- (NSMutableArray)timeSpecifierArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1720, 1);
}

- (void)setTimeSpecifierArray:(id)a3
{
}

- (NSArray)typeTabSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1728, 1);
}

- (void)setTypeTabSpecifiers:(id)a3
{
}

- (PSSpecifier)editServerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1736, 1);
}

- (void)setEditServerSpecifier:(id)a3
{
}

- (NSArray)proxyGroupSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1744, 1);
}

- (void)setProxyGroupSpecifiers:(id)a3
{
}

- (NSArray)pacSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1752, 1);
}

- (void)setPacSpecifiers:(id)a3
{
}

- (NSArray)manualProxySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1760, 1);
}

- (void)setManualProxySpecifiers:(id)a3
{
}

- (NSArray)proxyAuthSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1768, 1);
}

- (void)setProxyAuthSpecifiers:(id)a3
{
}

- (PSSpecifier)proxyLabelSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1776, 1);
}

- (void)setProxyLabelSpecifier:(id)a3
{
}

- (unint64_t)proxyType
{
  return self->_proxyType;
}

- (void)setProxyType:(unint64_t)a3
{
  self->_proxyType = a3;
}

- (BOOL)proxyAuthenticated
{
  return self->_proxyAuthenticated;
}

- (void)setProxyAuthenticated:(BOOL)a3
{
  self->_proxyAuthenticated = a3;
}

- (NSString)proxyServer
{
  return (NSString *)objc_getProperty(self, a2, 1792, 1);
}

- (void)setProxyServer:(id)a3
{
}

- (NSString)proxyPort
{
  return (NSString *)objc_getProperty(self, a2, 1800, 1);
}

- (void)setProxyPort:(id)a3
{
}

- (NSString)proxyUsername
{
  return (NSString *)objc_getProperty(self, a2, 1808, 1);
}

- (void)setProxyUsername:(id)a3
{
}

- (NSString)proxyPassword
{
  return (NSString *)objc_getProperty(self, a2, 1816, 1);
}

- (void)setProxyPassword:(id)a3
{
}

- (NSString)proxyPACFile
{
  return (NSString *)objc_getProperty(self, a2, 1824, 1);
}

- (void)setProxyPACFile:(id)a3
{
}

- (NSObject)certificateID
{
  return objc_getProperty(self, a2, 1832, 1);
}

- (void)setCertificateID:(id)a3
{
}

- (NSArray)certificateIDs
{
  return (NSArray *)objc_getProperty(self, a2, 1840, 1);
}

- (void)setCertificateIDs:(id)a3
{
}

- (NSArray)certificateObjects
{
  return (NSArray *)objc_getProperty(self, a2, 1848, 1);
}

- (void)setCertificateObjects:(id)a3
{
}

- (BOOL)pptpWarningAccepted
{
  return self->_pptpWarningAccepted;
}

- (void)setPptpWarningAccepted:(BOOL)a3
{
  self->_pptpWarningAccepted = a3;
}

- (PSSpecifier)editButton
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1856, 1);
}

- (void)setEditButton:(id)a3
{
}

- (PSSpecifier)enableButton
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1864, 1);
}

- (void)setEnableButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_certificateObjects, 0);
  objc_storeStrong((id *)&self->_certificateIDs, 0);
  objc_storeStrong((id *)&self->_certificateID, 0);
  objc_storeStrong((id *)&self->_proxyPACFile, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUsername, 0);
  objc_storeStrong((id *)&self->_proxyPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_proxyLabelSpecifier, 0);
  objc_storeStrong((id *)&self->_proxyAuthSpecifiers, 0);
  objc_storeStrong((id *)&self->_manualProxySpecifiers, 0);
  objc_storeStrong((id *)&self->_pacSpecifiers, 0);
  objc_storeStrong((id *)&self->_proxyGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_editServerSpecifier, 0);
  objc_storeStrong((id *)&self->_typeTabSpecifiers, 0);
  objc_storeStrong((id *)&self->_timeSpecifierArray, 0);
  objc_storeStrong((id *)&self->_timeSpecifier, 0);
  objc_storeStrong((id *)&self->_authTypeSpecifier, 0);
  objc_storeStrong((id *)&self->_eapTypeSpecifier, 0);
  objc_storeStrong((id *)&self->_remoteIdentifierSpecifier, 0);
  objc_storeStrong((id *)&self->_localIdentifierSpecifier, 0);
  objc_storeStrong((id *)&self->_accountSpecifier, 0);
  objc_storeStrong((id *)&self->_certificateListSpecifier, 0);
  objc_storeStrong((id *)&self->_useCertificateSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_groupNameSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_vpnGradeStaticSpecifier, 0);
  objc_storeStrong((id *)&self->_encryptionTypeSpecifier, 0);
  objc_storeStrong((id *)&self->_sharedSecretSpecifier, 0);
  objc_storeStrong((id *)&self->_rsaSpecifier, 0);
  objc_storeStrong((id *)&self->_sendAllTrafficSpecifier, 0);
  objc_storeStrong((id *)&self->_ciscoImageSpecifier, 0);
  objc_storeStrong((id *)&self->_serverAddressSpecifier, 0);
  objc_storeStrong((id *)&self->_serverSpecifier, 0);
  objc_storeStrong((id *)&self->_displayNameSpecifier, 0);
  objc_storeStrong((id *)&self->_remoteIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_excludeDomains, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_includedBundleIDs, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_connectSpecifier, 0);

  objc_storeStrong((id *)&self->_backButton, 0);
}

@end