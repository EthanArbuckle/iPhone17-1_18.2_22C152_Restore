@interface PHHandsetDialerNumberPadButton
+ (BOOL)usesButtonSaturationFilters;
+ (BOOL)usesTelephonyGlyphsWhereAvailable;
+ (double)outerCircleDiameter;
+ (double)verticalPadding;
@end

@implementation PHHandsetDialerNumberPadButton

+ (double)verticalPadding
{
  if (+[PHUIConfiguration handsetDialerSpacing]
    || (+[TUCallCenter sharedInstance],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 hasCurrentAudioCalls],
        v5,
        double v4 = 3.5,
        (v6 & 1) == 0)
    && !+[PHUIConfiguration requiresSmallScreenConfig])
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___PHHandsetDialerNumberPadButton;
    [super verticalPadding];
    return v3;
  }
  return v4;
}

+ (double)outerCircleDiameter
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PHHandsetDialerNumberPadButton;
  [super outerCircleDiameter];
  double v3 = v2;
  if (+[PHUIConfiguration requiresSmallScreenConfig]) {
    return 67.0;
  }
  if (+[PHInCallUIUtilities hasMultipleSenderIdentities])
  {
    unint64_t v4 = +[PHUIConfiguration handsetDialerSpacing];
    if (v4 == 2)
    {
      return 73.0;
    }
    else if (!v4)
    {
      return 70.0;
    }
  }
  return v3;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

+ (BOOL)usesButtonSaturationFilters
{
  return 0;
}

@end