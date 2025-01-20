@interface MUDayRowViewModel
- (NSArray)AMPMStrings;
- (NSArray)hourStrings;
- (NSString)dayString;
- (NSString)labelHeaderString;
- (id)buildDefaultPlacecardHoursString;
- (void)setAMPMStrings:(id)a3;
- (void)setDayString:(id)a3;
- (void)setHourStrings:(id)a3;
- (void)setLabelHeaderString:(id)a3;
@end

@implementation MUDayRowViewModel

- (id)buildDefaultPlacecardHoursString
{
  v2 = +[MUPlaceHoursFormatter hoursFormatterFromHoursStringComponents:self->_hourStrings AMPMSymbols:self->_AMPMStrings];
  v3 = [v2 buildDefaultPlacecardHoursString];

  return v3;
}

- (NSString)labelHeaderString
{
  return self->_labelHeaderString;
}

- (void)setLabelHeaderString:(id)a3
{
}

- (NSString)dayString
{
  return self->_dayString;
}

- (void)setDayString:(id)a3
{
}

- (NSArray)hourStrings
{
  return self->_hourStrings;
}

- (void)setHourStrings:(id)a3
{
}

- (NSArray)AMPMStrings
{
  return self->_AMPMStrings;
}

- (void)setAMPMStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AMPMStrings, 0);
  objc_storeStrong((id *)&self->_hourStrings, 0);
  objc_storeStrong((id *)&self->_dayString, 0);
  objc_storeStrong((id *)&self->_labelHeaderString, 0);
}

@end