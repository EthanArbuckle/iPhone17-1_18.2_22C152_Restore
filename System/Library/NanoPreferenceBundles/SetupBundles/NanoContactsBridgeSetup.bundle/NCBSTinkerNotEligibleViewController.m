@interface NCBSTinkerNotEligibleViewController
- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate;
- (NCBSTinkerNotEligibleViewController)init;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NCBSTinkerNotEligibleViewController

- (NCBSTinkerNotEligibleViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSTinkerNotEligibleViewController;
  v2 = [(NCBSTinkerNotEligibleViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCBSTinkerNotEligibleViewController *)v2 setStyle:2];
  }
  return v3;
}

- (id)titleString
{
  v2 = [(NCBSTinkerNotEligibleViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  objc_super v5 = [v4 localizedStringForKey:@"TK_CONTACTS_NOT_ELIGIBLE_TITLE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)detailString
{
  v3 = [(NCBSTinkerNotEligibleViewController *)self miniFlowDelegate];
  unsigned int v4 = [v3 activePairingDeviceSupportsContactsApp];
  objc_super v5 = @"TK_CONTACTS_NOT_ELIGIBLE_PHONEAPP_DETAIL";
  if (v4) {
    objc_super v5 = @"TK_CONTACTS_NOT_ELIGIBLE_CONTACTSAPP_DETAIL";
  }
  v6 = v5;

  v7 = [(NCBSTinkerNotEligibleViewController *)self miniFlowDelegate];
  v8 = [v7 familyMemberFirstName];

  v9 = NanoContactsBridgeSetupBundle();
  v10 = [v9 localizedStringForKey:v6 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  v11 = +[NSString stringWithValidatedFormat:v10, @"%@", 0, v8 validFormatSpecifiers error];

  return v11;
}

- (id)imageResource
{
  return @"Contacts-Header_80";
}

- (id)imageResourceBundleIdentifier
{
  return NanoContactsBridgeSetupBundleIdentifier;
}

- (id)suggestedButtonTitle
{
  v2 = NanoContactsBridgeSetupBundle();
  v3 = [v2 localizedStringForKey:@"TK_CONTACTS_NOT_ELIGIBLE_BUTTON_CONTINUE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(NCBSTinkerNotEligibleViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (NCBSBridgeSetupControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end