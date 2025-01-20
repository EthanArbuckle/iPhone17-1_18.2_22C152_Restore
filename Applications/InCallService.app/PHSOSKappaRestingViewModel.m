@interface PHSOSKappaRestingViewModel
- (NSDate)dateOfSOSEvent;
- (NSString)subtitleString;
- (NSString)titleString;
- (void)setDateOfSOSEvent:(id)a3;
@end

@implementation PHSOSKappaRestingViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_KAPPA_RESTING_VIEW_TITLE" value:&stru_1002D6110 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  v2 = [(PHSOSKappaRestingViewModel *)self dateOfSOSEvent];
  v3 = sub_1000352D8(v2, 0);

  return (NSString *)v3;
}

- (NSDate)dateOfSOSEvent
{
  return self->_dateOfSOSEvent;
}

- (void)setDateOfSOSEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end