@interface STKNotifyAlertViewController
- (BOOL)validateAction:(id)a3;
- (id)alertText;
@end

@implementation STKNotifyAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)alertText
{
  v21.receiver = self;
  v21.super_class = (Class)STKNotifyAlertViewController;
  id v3 = [(STKTextAlertViewController *)&v21 alertText];
  if (!v3)
  {
    v4 = [(STKBaseAlertViewController *)self sessionAction];
    v5 = [v4 sessionData];
    id v6 = [v5 notifyType];

    switch((unint64_t)v6)
    {
      case 2uLL:
        v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v8 = v7;
        CFStringRef v9 = @"SIMTK_SS_MESSAGE_SENT";
        break;
      case 3uLL:
        v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v8 = v7;
        CFStringRef v9 = @"SIMTK_USSD_MESSAGE_SENT";
        break;
      case 4uLL:
        v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v8 = v7;
        CFStringRef v9 = @"SIMTK_DTMF_MESSAGE_SENT";
        break;
      case 5uLL:
        v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v8 = v7;
        CFStringRef v9 = @"SIMTK_PLAY_TONE";
        break;
      default:
        v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
        v8 = v7;
        CFStringRef v9 = @"SIMTK_SMS_MESSAGE_SENT";
        break;
    }
    id v3 = [v7 localizedStringForKey:v9 value:&stru_100018540 table:@"SIMToolkitUI"];
  }
  v10 = [(STKBaseAlertViewController *)self sessionAction];
  v11 = [v10 sessionData];
  v12 = [v11 simLabel];

  if (v12)
  {
    v13 = [(STKBaseAlertViewController *)self sessionAction];
    v14 = [v13 sessionData];
    uint64_t v15 = [v14 simLabel];
    v16 = (void *)v15;
    CFStringRef v17 = &stru_100018540;
    if (v3) {
      CFStringRef v17 = v3;
    }
    v18 = +[NSString stringWithFormat:@"(%@) %@", v15, v17];
  }
  else
  {
    CFStringRef v19 = &stru_100018540;
    if (v3) {
      CFStringRef v19 = v3;
    }
    v18 = +[NSString stringWithFormat:@"%@", v19];
  }

  return v18;
}

@end