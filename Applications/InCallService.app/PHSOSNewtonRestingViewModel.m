@interface PHSOSNewtonRestingViewModel
- (NSDate)dateOfSOSEvent;
- (NSString)subtitleString;
- (NSString)titleString;
- (void)setDateOfSOSEvent:(id)a3;
@end

@implementation PHSOSNewtonRestingViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_NEWTON_RESTING_VIEW_TITLE" value:&stru_1002D6110 table:@"Localizable-Stewie"];

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  v2 = [(PHSOSNewtonRestingViewModel *)self dateOfSOSEvent];
  v3 = sub_1000353FC(v2);

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