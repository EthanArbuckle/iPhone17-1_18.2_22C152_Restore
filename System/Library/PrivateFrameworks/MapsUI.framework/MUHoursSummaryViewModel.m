@interface MUHoursSummaryViewModel
- (BOOL)hideChevron;
- (BOOL)isServiceHours;
- (MUHoursSummaryViewModel)init;
- (NSArray)AMPMSymbols;
- (NSString)hoursText;
- (NSString)openStateText;
- (NSString)titleText;
- (UIColor)openStateColor;
- (id)buildDefaultPlacecardHoursString;
- (void)setAMPMSymbols:(id)a3;
- (void)setHideChevron:(BOOL)a3;
- (void)setHoursText:(id)a3;
- (void)setOpenStateColor:(id)a3;
- (void)setOpenStateText:(id)a3;
- (void)setServiceHours:(BOOL)a3;
- (void)setTitleText:(id)a3;
@end

@implementation MUHoursSummaryViewModel

- (MUHoursSummaryViewModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)MUHoursSummaryViewModel;
  v2 = [(MUHoursSummaryViewModel *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MUInfoCardStyle textColor];
    openStateColor = v2->_openStateColor;
    v2->_openStateColor = (UIColor *)v3;
  }
  return v2;
}

- (id)buildDefaultPlacecardHoursString
{
  v2 = [[MUPlaceHoursFormatter alloc] initWithHoursString:self->_hoursText AMPMSymbols:self->_AMPMSymbols];
  uint64_t v3 = [(MUPlaceHoursFormatter *)v2 buildDefaultPlacecardHoursString];

  return v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)hoursText
{
  return self->_hoursText;
}

- (void)setHoursText:(id)a3
{
}

- (NSString)openStateText
{
  return self->_openStateText;
}

- (void)setOpenStateText:(id)a3
{
}

- (UIColor)openStateColor
{
  return self->_openStateColor;
}

- (void)setOpenStateColor:(id)a3
{
}

- (NSArray)AMPMSymbols
{
  return self->_AMPMSymbols;
}

- (void)setAMPMSymbols:(id)a3
{
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
}

- (void)setHideChevron:(BOOL)a3
{
  self->_hideChevron = a3;
}

- (BOOL)isServiceHours
{
  return self->_serviceHours;
}

- (void)setServiceHours:(BOOL)a3
{
  self->_serviceHours = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AMPMSymbols, 0);
  objc_storeStrong((id *)&self->_openStateColor, 0);
  objc_storeStrong((id *)&self->_openStateText, 0);
  objc_storeStrong((id *)&self->_hoursText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end