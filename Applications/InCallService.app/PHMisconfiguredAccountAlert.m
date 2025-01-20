@interface PHMisconfiguredAccountAlert
- (PHMisconfiguredAccountAlert)initWithDialAction:(id)a3;
- (id)alternateButtonTitle;
- (id)defaultButtonTitle;
- (id)dialAction;
- (id)message;
- (id)otherButtonTitle;
- (id)title;
- (void)otherResponse;
- (void)setDialAction:(id)a3;
@end

@implementation PHMisconfiguredAccountAlert

- (PHMisconfiguredAccountAlert)initWithDialAction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHMisconfiguredAccountAlert;
  v5 = [(PHMisconfiguredAccountAlert *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PHMisconfiguredAccountAlert *)v5 setDialAction:v4];
  }

  return v6;
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"MISCONFIGURED_ACCOUNT_TITLE" value:&stru_1002D6110 table:@"InCallService"];

  return v3;
}

- (id)message
{
  v2 = +[IMAccountController sharedInstance];
  v3 = +[IMService facetimeService];
  id v4 = [v2 accountsForService:v3];
  v5 = [v4 firstObject];

  id v6 = objc_alloc_init((Class)TUFeatureFlags);
  LODWORD(v3) = [v6 appleAccountRebrandEnabled];
  v7 = +[NSBundle mainBundle];
  objc_super v8 = v7;
  if (v3) {
    CFStringRef v9 = @"MISCONFIGURED_ACCOUNT_%@_MESSAGE_APPLEACCOUNT";
  }
  else {
    CFStringRef v9 = @"MISCONFIGURED_ACCOUNT_%@_MESSAGE";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_1002D6110 table:@"InCallService"];

  v11 = [v5 name];
  v12 = IMStripLoginID();
  v13 = TUHomeCountryCode();
  v14 = TUFormattedPhoneNumber();
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v14);

  return v15;
}

- (id)alternateButtonTitle
{
  return 0;
}

- (id)otherButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"MISCONFIGURED_ACCOUNT_ADD_EMAIL_ADDRESS" value:&stru_1002D6110 table:@"InCallService"];

  return v3;
}

- (id)defaultButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"MISCONFIGURED_ACCOUNT_CANCEL" value:&stru_1002D6110 table:@"InCallService"];

  return v3;
}

- (void)otherResponse
{
  id v3 = +[UIApplication sharedApplication];
  v2 = +[NSURL URLWithString:@"https://appleid.apple.com"];
  [v3 openURL:v2 withCompletionHandler:0];
}

- (id)dialAction
{
  return self->_dialAction;
}

- (void)setDialAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end