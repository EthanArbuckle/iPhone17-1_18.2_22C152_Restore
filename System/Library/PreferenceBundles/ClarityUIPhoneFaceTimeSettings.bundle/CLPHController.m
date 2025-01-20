@interface CLPHController
- (id)_axLoadSpecifiersFromPlist;
- (id)actionTypes;
- (id)bundleIdentifiers;
- (id)contactPickerPrompt;
- (id)favoritesFooterText;
- (id)incomingHeaderText;
- (id)isInCallKeypadEnabled:(id)a3;
- (id)isSpeakerOptionEnabled:(id)a3;
- (id)outgoingHeaderText;
- (id)settings;
- (id)specifiers;
- (void)reload;
- (void)setInCallKeypadEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeakerOptionEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation CLPHController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CLPHController;
  [(CLPHController *)&v6 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CALLS" value:&stru_4208 table:@"CLPHController"];
  v5 = [(CLPHController *)self navigationItem];
  [v5 setTitle:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXCLFCommunicationLimitController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(CLPHController *)self communicationLimitSpecifiers];
    id v6 = [v5 mutableCopy];

    v7 = [(CLPHController *)self _axLoadSpecifiersFromPlist];
    [v6 addObjectsFromArray:v7];

    v8 = CLCreatePrivacySpecifier(@"com.apple.onboarding.facetime", self);
    v13 = v8;
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
    uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v6];
    v11 = *(void **)&self->AXCLFCommunicationLimitController_opaque[v3];
    *(void *)&self->AXCLFCommunicationLimitController_opaque[v3] = v10;

    v4 = *(void **)&self->AXCLFCommunicationLimitController_opaque[v3];
  }

  return v4;
}

- (void)reload
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)&self->AXCLFCommunicationLimitController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = PSAllowMultilineTitleKey;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) setObject:&__kCFBooleanTrue forKeyedSubscript:v7];
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)CLPHController;
  [(CLPHController *)&v9 reload];
}

- (id)_axLoadSpecifiersFromPlist
{
  v2 = [(CLPHController *)self loadSpecifiersFromPlistName:@"CLPHController" target:self];
  if (AXDeviceIsPad()) {
    objc_msgSend(v2, "ax_removeObjectsFromArrayUsingBlock:", &stru_41A0);
  }

  return v2;
}

- (id)outgoingHeaderText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"OUTGOING_CALLS" value:&stru_4208 table:@"CLPHController"];

  return v3;
}

- (id)incomingHeaderText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"INCOMING_CALLS" value:&stru_4208 table:@"CLPHController"];

  return v3;
}

- (id)favoritesFooterText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"FAVORITES_FOOTER" value:&stru_4208 table:@"CLPHController"];

  return v3;
}

- (id)contactPickerPrompt
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CONTACT_PICKER_PROMPT" value:&stru_4208 table:@"CLPHController"];

  return v3;
}

- (id)actionTypes
{
  v4[0] = CNActionTypeAudioCall;
  v4[1] = CNActionTypeVideoCall;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)bundleIdentifiers
{
  v4[0] = AX_MobilePhoneBundleName;
  v4[1] = AX_FaceTimeBundleName;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)settings
{
  return +[CLFPhoneFaceTimeSettings sharedInstance];
}

- (void)setInCallKeypadEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFPhoneFaceTimeSettings sharedInstance];
  [v5 setInCallKeypadEnabled:v4];
}

- (id)isInCallKeypadEnabled:(id)a3
{
  id v3 = +[CLFPhoneFaceTimeSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 inCallKeypadEnabled]);

  return v4;
}

- (void)setSpeakerOptionEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFPhoneFaceTimeSettings sharedInstance];
  [v5 setSpeakerOptionEnabled:v4];
}

- (id)isSpeakerOptionEnabled:(id)a3
{
  id v3 = +[CLFPhoneFaceTimeSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 speakerOptionEnabled]);

  return v4;
}

@end