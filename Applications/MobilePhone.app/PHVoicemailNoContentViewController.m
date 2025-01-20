@interface PHVoicemailNoContentViewController
- (void)loadView;
@end

@implementation PHVoicemailNoContentViewController

- (void)loadView
{
  id v3 = objc_alloc((Class)_UIContentUnavailableView);
  v4 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v5 = [v4 localizedStringForKey:@"VOICEMAIL_OUT_OF_ORDER_TITLE" value:&stru_100285990 table:@"Voicemail"];
  id v9 = [v3 initWithFrame:v5 origin:CGRectZero.origin size:CGRectZero.size];

  v6 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v7 = [v6 localizedStringForKey:@"VOICEMAIL_OUT_OF_ORDER_SUBTITLE" value:&stru_100285990 table:@"Voicemail"];
  [v9 setMessage:v7];

  [v9 setAutoresizingMask:18];
  v8 = +[UIColor systemBackgroundColor];
  [v9 setBackgroundColor:v8];

  [(PHVoicemailNoContentViewController *)self setView:v9];
}

@end