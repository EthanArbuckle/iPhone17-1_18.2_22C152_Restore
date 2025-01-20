@interface CKMPRiMessageContactsTransparencyViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)isTinkerPairing;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (CKMPRiMessageContactsTransparencyViewController)init;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)setIsTinkerPairing:(BOOL)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation CKMPRiMessageContactsTransparencyViewController

- (CKMPRiMessageContactsTransparencyViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKMPRiMessageContactsTransparencyViewController;
  v2 = [(CKMPRiMessageContactsTransparencyViewController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(CKMPRiMessageContactsTransparencyViewController *)v2 setStyle:2];
    v4 = +[NRPairedDeviceRegistry sharedInstance];
    v5 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
    v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    v7 = [v6 firstObject];

    if (v7)
    {
      v8 = [v7 valueForProperty:NRDevicePropertyIsAltAccount];
      v3->_isTinkerPairing = [v8 BOOLValue];
    }
    else
    {
      v3->_isTinkerPairing = 0;
    }
  }
  return v3;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = +[BPSBridgeAppContext shared];
  unsigned int v3 = [v2 isRestoringToKnownDevice];

  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = @"YES";
      if (v3) {
        CFStringRef v5 = @"NO";
      }
      int v7 = 138412290;
      CFStringRef v8 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "CKMPRiMessageContactsTransparencyViewController is called with return value: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (id)titleString
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"MESSAGES_CONTACT_TRANSPARENCY_TITLE" value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v3;
}

- (id)detailString
{
  BOOL isTinkerPairing = self->_isTinkerPairing;
  unsigned int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = v3;
  if (isTinkerPairing) {
    CFStringRef v5 = @"MESSAGES_CONTACT_TRANSPARENCY_TINKER_INFO";
  }
  else {
    CFStringRef v5 = @"MESSAGES_CONTACT_TRANSPARENCY_CLASSIC_INFO";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v6;
}

- (id)imageResource
{
  return @"Messages";
}

- (id)imageResourceBundleIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(CKMPRiMessageContactsTransparencyViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"MESSAGES_CONTACT_TRANSPARENCY_OK" value:&stru_4200 table:@"MessagesPairingRegistration"];

  return v3;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (BOOL)isTinkerPairing
{
  return self->_isTinkerPairing;
}

- (void)setIsTinkerPairing:(BOOL)a3
{
  self->_BOOL isTinkerPairing = a3;
}

- (void).cxx_destruct
{
}

@end