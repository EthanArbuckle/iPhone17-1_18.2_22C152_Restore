@interface PHSOSKappaMaskedCheckInViewModel
- (NSString)subtitleString;
- (NSString)titleString;
- (double)countdownTickDuration;
- (double)timeout;
- (int64_t)sosVoiceMessageType;
@end

@implementation PHSOSKappaMaskedCheckInViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_KAPPA_MASKED_CHECK_IN_VIEW_TITLE" value:&stru_1002D6110 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_KAPPA_MASKED_CHECK_IN_VIEW_SUBTITLE" value:&stru_1002D6110 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

- (double)timeout
{
  return 10.0;
}

- (double)countdownTickDuration
{
  return 1.0;
}

- (int64_t)sosVoiceMessageType
{
  return 201;
}

@end