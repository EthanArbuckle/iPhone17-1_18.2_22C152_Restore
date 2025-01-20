@interface _MKLocalizedHoursBuilder(MUPlaceRibbonExtras)
- (__CFString)ribbonSummaryForOpeningState;
@end

@implementation _MKLocalizedHoursBuilder(MUPlaceRibbonExtras)

- (__CFString)ribbonSummaryForOpeningState
{
  unint64_t v2 = [a1 state];
  if (v2 < 5 || v2 == 6)
  {
    v3 = [a1 localizedOperatingHours];
  }
  else if (v2 == 5)
  {
    _MULocalizedStringFromThisBundle(@"Open [Ribbon]");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EE3BF360;
  }
  return v3;
}

@end