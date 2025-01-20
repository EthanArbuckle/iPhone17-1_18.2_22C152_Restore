@interface PhoneSettingsReplyWithMessageBundleController
- (NSArray)specifiersArray;
- (id)parentListController;
- (id)specifiersWithSpecifier:(id)a3;
- (void)setSpecifiersArray:(id)a3;
@end

@implementation PhoneSettingsReplyWithMessageBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = [(PhoneSettingsReplyWithMessageBundleController *)self specifiersArray];

  if (!v4)
  {
    v5 = +[NSMutableArray arrayWithCapacity:2];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"REPLY_WITH_MESSAGE_CELL_TITLE" value:&stru_43C8 table:@"Reply With Message"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v8 setIdentifier:@"REPLY_WITH_MESSAGES"];
    [v5 addObject:v8];
    [(PhoneSettingsReplyWithMessageBundleController *)self setSpecifiersArray:v5];
  }

  return [(PhoneSettingsReplyWithMessageBundleController *)self specifiersArray];
}

- (id)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return WeakRetained;
}

- (NSArray)specifiersArray
{
  return self->_specifiersArray;
}

- (void)setSpecifiersArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end