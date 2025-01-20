@interface CLCKController
- (id)actionTypes;
- (id)areConversationDetailsEnabled:(id)a3;
- (id)bundleIdentifiers;
- (id)contactPickerPrompt;
- (id)favoritesFooterText;
- (id)incomingHeaderText;
- (id)isEmojiKeyboardEnabled:(id)a3;
- (id)isSoftwareKeyboardEnabled:(id)a3;
- (id)isTapToSpeakEnabled:(id)a3;
- (id)isVideoRecordingEnabled:(id)a3;
- (id)outgoingHeaderText;
- (id)settings;
- (id)specifiers;
- (void)setConversationDetailsEnabled:(id)a3 specifier:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEmojiKeyboardEnabled:(id)a3 specifier:(id)a4;
- (void)setSoftwareKeyboardEnabled:(id)a3 specifier:(id)a4;
- (void)setTapToSpeakEnabled:(id)a3 specifier:(id)a4;
- (void)setVideoRecordingEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation CLCKController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CLCKController;
  [(CLCKController *)&v5 viewDidLoad];
  v3 = AXAppNameForBundleId();
  v4 = [(CLCKController *)self navigationItem];
  [v4 setTitle:v3];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXCLFCommunicationLimitController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(CLCKController *)self communicationLimitSpecifiers];
    id v6 = [v5 mutableCopy];

    v7 = [(CLCKController *)self loadSpecifiersFromPlistName:@"CLCKController" target:self];
    [v6 addObjectsFromArray:v7];

    v8 = CLCreatePrivacySpecifier(@"com.apple.onboarding.messages", self);
    v13 = v8;
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
    uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v6];
    v11 = *(void **)&self->AXCLFCommunicationLimitController_opaque[v3];
    *(void *)&self->AXCLFCommunicationLimitController_opaque[v3] = v10;

    v4 = *(void **)&self->AXCLFCommunicationLimitController_opaque[v3];
  }

  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLCKController;
  -[CLCKController setEditing:animated:](&v7, "setEditing:animated:");
  [*(id *)&self->AXCLFCommunicationLimitController_opaque[OBJC_IVAR___PSListController__table] setEditing:v5 animated:v4];
}

- (id)outgoingHeaderText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"OUTGOING_MESSAGES" value:&stru_4240 table:@"CLCKController"];

  return v3;
}

- (id)incomingHeaderText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INCOMING_MESSAGES" value:&stru_4240 table:@"CLCKController"];

  return v3;
}

- (id)favoritesFooterText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"FAVORITES_FOOTER" value:&stru_4240 table:@"CLCKController"];

  return v3;
}

- (id)contactPickerPrompt
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"CONTACT_PICKER_PROMPT" value:&stru_4240 table:@"CLCKController"];

  return v3;
}

- (id)actionTypes
{
  uint64_t v4 = CNActionTypeMessage;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)bundleIdentifiers
{
  uint64_t v4 = AX_MobileSMSBundleName;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)settings
{
  return +[CLFMessagesSettings sharedInstance];
}

- (void)setConversationDetailsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFMessagesSettings sharedInstance];
  [v5 setConversationDetailsEnabled:v4];
}

- (id)areConversationDetailsEnabled:(id)a3
{
  uint64_t v3 = +[CLFMessagesSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 conversationDetailsEnabled]);

  return v4;
}

- (void)setTapToSpeakEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFMessagesSettings sharedInstance];
  [v5 setTapToSpeakEnabled:v4];
}

- (id)isTapToSpeakEnabled:(id)a3
{
  uint64_t v3 = +[CLFMessagesSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 tapToSpeakEnabled]);

  return v4;
}

- (void)setSoftwareKeyboardEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFMessagesSettings sharedInstance];
  [v5 setSoftwareKeyboardEnabled:v4];
}

- (id)isSoftwareKeyboardEnabled:(id)a3
{
  uint64_t v3 = +[CLFMessagesSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 softwareKeyboardEnabled]);

  return v4;
}

- (void)setVideoRecordingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFMessagesSettings sharedInstance];
  [v5 setVideoRecordingEnabled:v4];
}

- (id)isVideoRecordingEnabled:(id)a3
{
  uint64_t v3 = +[CLFMessagesSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 videoRecordingEnabled]);

  return v4;
}

- (void)setEmojiKeyboardEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFMessagesSettings sharedInstance];
  [v5 setEmojiKeyboardEnabled:v4];
}

- (id)isEmojiKeyboardEnabled:(id)a3
{
  uint64_t v3 = +[CLFMessagesSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 emojiKeyboardEnabled]);

  return v4;
}

@end