@interface ICQDeeplinkHelper
+ (id)deeplinkFromURL:(id)a3;
@end

@implementation ICQDeeplinkHelper

+ (id)deeplinkFromURL:(id)a3
{
  v3 = [a3 absoluteString];
  if ([v3 containsString:@"%"])
  {
    id v4 = v3;
  }
  else
  {
    v5 = +[NSCharacterSet alphanumericCharacterSet];
    id v4 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v5];
  }
  v6 = +[ACAccountStore defaultStore];
  v7 = [v6 aa_primaryAppleAccount];

  CFStringRef v8 = @"com.apple.Settings.iCloud";
  if (!v7) {
    CFStringRef v8 = @"com.apple.Settings.AppleAccount/ICLOUD_SERVICE";
  }
  v9 = +[NSString stringWithFormat:@"settings-navigation://%@?amsURL=%@", v8, v4];
  v10 = +[NSURL URLWithString:v9];
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100004964(v10, v11);
  }

  return v10;
}

@end