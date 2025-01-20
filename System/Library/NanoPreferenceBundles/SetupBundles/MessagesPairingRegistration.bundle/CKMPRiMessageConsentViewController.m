@interface CKMPRiMessageConsentViewController
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (CKMPRiMessageConsentViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_registerPhoneNumberPermissionEnabled:(BOOL)a3;
- (void)alternateButtonPressed:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation CKMPRiMessageConsentViewController

- (CKMPRiMessageConsentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKMPRiMessageConsentViewController;
  v2 = [(CKMPRiMessageConsentViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKMPRiMessageConsentViewController *)v2 setStyle:10];
  }
  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_TITLE" value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_INFO" value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_ALLOW" value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PHONE_NUMBER_PERMISSION_NOTNOW" value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  [(CKMPRiMessageConsentViewController *)self _registerPhoneNumberPermissionEnabled:1];
  id v4 = [(CKMPRiMessageConsentViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (void)alternateButtonPressed:(id)a3
{
  [(CKMPRiMessageConsentViewController *)self _registerPhoneNumberPermissionEnabled:0];
  id v4 = [(CKMPRiMessageConsentViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (id)privacyBundles
{
  return &off_4458;
}

- (void)_registerPhoneNumberPermissionEnabled:(BOOL)a3
{
  BOOL v27 = a3;
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CKMPRiMessageConsentViewController _registerPhoneNumberPermissionEnabled:]";
      __int16 v36 = 1024;
      LODWORD(v37[0]) = v27;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s - %d", buf, 0x12u);
    }
  }
  id v4 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.tinker.messages"];
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CKMPRiMessageConsentViewController _registerPhoneNumberPermissionEnabled:]";
      __int16 v36 = 2112;
      v37[0] = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s - tinkerMessagesActivationService: %@", buf, 0x16u);
    }
  }
  v6 = [v4 linkedDevicesWithRelationship:2];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CKMPRiMessageConsentViewController _registerPhoneNumberPermissionEnabled:]";
      __int16 v36 = 2112;
      v37[0] = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s - idsTinkerDevices: %@", buf, 0x16u);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v12 isActive])
        {
          id v9 = v12;
          goto LABEL_23;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[CKMPRiMessageConsentViewController _registerPhoneNumberPermissionEnabled:]";
      __int16 v36 = 2112;
      v37[0] = v9;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s - activeTinkerDevice: %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    CFStringRef v38 = @"enableRegistration";
    v14 = +[NSNumber numberWithBool:v27];
    v39 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v16 = (void *)IDSCopyIDForDevice();
    v17 = +[NSSet setWithObject:v16];
    id v28 = 0;
    id v29 = 0;
    unsigned int v18 = [v4 sendMessage:v15 toDestinations:v17 priority:200 options:0 identifier:&v29 error:&v28];
    id v19 = v29;
    id v20 = v28;

    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[CKMPRiMessageConsentViewController _registerPhoneNumberPermissionEnabled:]";
        __int16 v36 = 1024;
        LODWORD(v37[0]) = v18;
        WORD2(v37[0]) = 2112;
        *(void *)((char *)v37 + 6) = v20;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s - sendMessageForTinkerPhoneNumberRegistrationEnabled success: %d, error: %@", buf, 0x1Cu);
      }
    }
    v22 = BPSGetActiveDevice();
    v23 = [v22 pairingID];
    v24 = [v23 UUIDString];
    v25 = [@"kEnableMessages-" stringByAppendingString:v24];

    v26 = (CFPropertyListRef *)&kCFBooleanTrue;
    if (!v27) {
      v26 = (CFPropertyListRef *)&kCFBooleanFalse;
    }
    CFPreferencesSetAppValue(v25, *v26, @"com.apple.MobileSMS");
    CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  }
  else
  {
    id v20 = 0;
    id v19 = 0;
  }
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end