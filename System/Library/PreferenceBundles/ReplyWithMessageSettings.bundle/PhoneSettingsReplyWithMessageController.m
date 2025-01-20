@interface PhoneSettingsReplyWithMessageController
- (TUReplyWithMessageStore)replyWithMessageStore;
- (id)customReply:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)customReplyIndexOfSpecifier:(id)a3;
- (void)emitNavigationEvent;
- (void)returnPressedAtEnd;
- (void)setCustomReply:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PhoneSettingsReplyWithMessageController

- (TUReplyWithMessageStore)replyWithMessageStore
{
  replyWithMessageStore = self->_replyWithMessageStore;
  if (!replyWithMessageStore)
  {
    v4 = (TUReplyWithMessageStore *)objc_alloc_init((Class)TUReplyWithMessageStore);
    v5 = self->_replyWithMessageStore;
    self->_replyWithMessageStore = v4;

    replyWithMessageStore = self->_replyWithMessageStore;
  }

  return replyWithMessageStore;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PhoneSettingsReplyWithMessageController;
  [(PhoneSettingsReplyWithMessageController *)&v7 viewDidAppear:a3];
  v4 = [(PhoneSettingsReplyWithMessageController *)self specifier];
  v5 = [v4 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(PhoneSettingsReplyWithMessageController *)self emitNavigationEvent];
  }
}

- (void)emitNavigationEvent
{
  v3 = [(PhoneSettingsReplyWithMessageController *)self specifier];
  v4 = [v3 target];
  v5 = [v4 parentListController];
  v6 = [v5 specifierID];

  if ([v6 isEqualToString:@"com.apple.preferences.phone"])
  {
    v24 = +[NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@/%@", @"com.apple.mobilephone", @"REPLY_WITH_MESSAGES"];
    v23 = +[NSURL URLWithString:v24];
    id v7 = objc_alloc((Class)_NSLocalizedStringResource);
    v8 = +[NSLocale currentLocale];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 bundleURL];
    id v11 = [v7 initWithKey:@"Respond with Text" table:0 locale:v8 bundleURL:v10];

    id v12 = objc_alloc((Class)_NSLocalizedStringResource);
    v13 = +[NSLocale currentLocale];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 bundleURL];
    id v16 = [v12 initWithKey:@"Apps" table:0 locale:v13 bundleURL:v15];

    id v17 = objc_alloc((Class)_NSLocalizedStringResource);
    v18 = +[NSLocale currentLocale];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 bundleURL];
    id v21 = [v17 initWithKey:@"Phone" table:0 locale:v18 bundleURL:v20];

    v25[0] = v16;
    v25[1] = v21;
    v22 = +[NSArray arrayWithObjects:v25 count:2];
    [(PhoneSettingsReplyWithMessageController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilephone" title:v11 localizedNavigationComponents:v22 deepLink:v23];
  }
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v22 = OBJC_IVAR___PSListController__specifiers;
    v5 = [(PhoneSettingsReplyWithMessageController *)self loadSpecifiersFromPlistName:@"Reply With Message" target:self];
    uint64_t v6 = [v5 specifierForID:@"CustomReplyHeader"];
    id v21 = (void *)v6;
    if (v6)
    {
      id v7 = (char *)[v5 indexOfObject:v6];
      if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v7;
        v9 = [(PhoneSettingsReplyWithMessageController *)self replyWithMessageStore];
        int v10 = [v9 count];

        if (v10 >= 1)
        {
          uint64_t v11 = 0;
          id v12 = v8 + 1;
          do
          {
            v13 = +[PSTextFieldSpecifier preferenceSpecifierNamed:0 target:self set:"setCustomReply:specifier:" get:"customReply:" detail:0 cell:8 edit:0];
            v14 = [(PhoneSettingsReplyWithMessageController *)self replyWithMessageStore];
            v15 = [v14 defaultReplies];
            id v16 = [v15 objectAtIndex:v11];
            [v13 setPlaceholder:v16];

            id v17 = +[NSNumber numberWithInt:v11];
            [v13 setProperty:v17 forKey:@"ReplyIndex"];

            [v5 insertObject:v13 atIndex:&v12[v11]];
            ++v11;
          }
          while (v10 != v11);
        }
      }
    }
    else
    {
      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PhoneSettingsReplyWithMessageController.m", 98, @"No header, can't insert other items" object file lineNumber description];
    }
    v19 = *(void **)&self->PSListController_opaque[v22];
    *(void *)&self->PSListController_opaque[v22] = v5;

    v3 = *(void **)&self->PSListController_opaque[v22];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PhoneSettingsReplyWithMessageController;
  v4 = [(PhoneSettingsReplyWithMessageController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == &dword_8)
  {
    v5 = [v4 editableTextField];
    [v5 setClearButtonMode:3];
  }

  return v4;
}

- (void)returnPressedAtEnd
{
  id v3 = [UIApp keyWindow];
  v2 = [v3 firstResponder];
  [v2 resignFirstResponder];
}

- (void)setCustomReply:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PhoneSettingsReplyWithMessageController *)self replyWithMessageStore];
  LODWORD(self) = [(PhoneSettingsReplyWithMessageController *)self customReplyIndexOfSpecifier:v6];

  [v8 setCustomReply:v7 atIndex:(int)self];
}

- (id)customReply:(id)a3
{
  id v4 = a3;
  v5 = [(PhoneSettingsReplyWithMessageController *)self replyWithMessageStore];
  id v6 = [v5 customReplies];
  LODWORD(self) = [(PhoneSettingsReplyWithMessageController *)self customReplyIndexOfSpecifier:v4];

  id v7 = [v6 objectAtIndex:(int)self];

  return v7;
}

- (int)customReplyIndexOfSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"ReplyIndex"];
  int v4 = [v3 intValue];

  return v4;
}

- (void).cxx_destruct
{
}

@end