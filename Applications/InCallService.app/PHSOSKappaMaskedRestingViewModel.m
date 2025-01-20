@interface PHSOSKappaMaskedRestingViewModel
- (NSDate)dateOfSOSEvent;
- (NSString)subtitleString;
- (NSString)titleString;
- (void)setDateOfSOSEvent:(id)a3;
@end

@implementation PHSOSKappaMaskedRestingViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_KAPPA_MASKED_RESTING_VIEW_TITLE" value:&stru_1002D6110 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  v2 = [(PHSOSKappaMaskedRestingViewModel *)self dateOfSOSEvent];
  v3 = sub_1000352D8(v2, 1);

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