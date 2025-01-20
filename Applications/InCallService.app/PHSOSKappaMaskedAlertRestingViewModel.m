@interface PHSOSKappaMaskedAlertRestingViewModel
- (NSString)titleString;
@end

@implementation PHSOSKappaMaskedAlertRestingViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_KAPPA_MASKED_RESTING_VIEW_TITLE" value:&stru_1002D6110 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

@end