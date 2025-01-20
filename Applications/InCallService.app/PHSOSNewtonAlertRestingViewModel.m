@interface PHSOSNewtonAlertRestingViewModel
- (NSString)titleString;
@end

@implementation PHSOSNewtonAlertRestingViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_NEWTON_RESTING_VIEW_TITLE" value:&stru_1002D6110 table:@"Localizable-Stewie"];

  return (NSString *)v3;
}

@end