@interface NCBSTinkerContactsIntroViewController
- (NCBSBridgeSetupControllerDelegate)miniFlowDelegate;
- (NCBSTinkerContactsIntroViewController)init;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NCBSTinkerContactsIntroViewController

- (NCBSTinkerContactsIntroViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSTinkerContactsIntroViewController;
  v2 = [(NCBSTinkerContactsIntroViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCBSTinkerContactsIntroViewController *)v2 setStyle:2];
  }
  return v3;
}

- (id)titleString
{
  v2 = [(NCBSTinkerContactsIntroViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  objc_super v5 = [v4 localizedStringForKey:@"TK_CONTACTS_INTRO_TITLE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)detailString
{
  v2 = [(NCBSTinkerContactsIntroViewController *)self miniFlowDelegate];
  v3 = [v2 familyMemberFirstName];

  v4 = NanoContactsBridgeSetupBundle();
  objc_super v5 = [v4 localizedStringForKey:@"TK_CONTACTS_INTRO_DETAIL" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3, v3);

  return v6;
}

- (id)imageResource
{
  return @"Contacts-ScreenTime-Header_80";
}

- (id)imageResourceBundleIdentifier
{
  return NanoContactsBridgeSetupBundleIdentifier;
}

- (id)suggestedButtonTitle
{
  v2 = NanoContactsBridgeSetupBundle();
  v3 = [v2 localizedStringForKey:@"TK_CONTACTS_INTRO_BUTTON_SETUP" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(NCBSTinkerContactsIntroViewController *)self miniFlowDelegate];
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