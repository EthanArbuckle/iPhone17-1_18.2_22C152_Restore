@interface PHInCallNumberPadButton
+ (BOOL)usesButtonColorMatrixFilters;
+ (BOOL)usesEmergencyCallButtonColorMatrixFilters;
+ (BOOL)usesTelephonyGlyphsWhereAvailable;
+ (double)horizontalPadding;
+ (double)outerCircleDiameter;
+ (double)unhighlightedCircleViewAlpha;
- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4;
@end

@implementation PHInCallNumberPadButton

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PHInCallNumberPadButton;
  id v4 = [(PHInCallNumberPadButton *)&v9 initForCharacter:a3 style:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 layer];
    [v6 setAllowsGroupOpacity:0];

    v7 = [v5 layer];
    [v7 setAllowsGroupBlending:0];
  }
  return v5;
}

+ (double)outerCircleDiameter
{
  v3 = +[CNKFeatures sharedInstance];
  unsigned __int8 v4 = [v3 isDialPadEnabled];

  if (v4)
  {
    v5 = +[UIScreen mainScreen];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    if (v7 >= v9) {
      double v10 = v9;
    }
    else {
      double v10 = v7;
    }
    float v11 = v10 * 0.1976;
    return roundf(v11);
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___PHInCallNumberPadButton;
    [super outerCircleDiameter];
  }
  return result;
}

+ (double)horizontalPadding
{
  v3 = +[CNKFeatures sharedInstance];
  unsigned __int8 v4 = [v3 isDialPadEnabled];

  if (v4)
  {
    v5 = +[UIScreen mainScreen];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    if (v7 >= v9) {
      double v10 = v9;
    }
    else {
      double v10 = v7;
    }
    double v11 = v10 + v10 * -0.102 * 2.0;
    [a1 outerCircleDiameter];
    return (v11 + v12 * -3.0) * 0.25;
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___PHInCallNumberPadButton;
    [super horizontalPadding];
  }
  return result;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

+ (double)unhighlightedCircleViewAlpha
{
  v2 = +[CNKFeatures sharedInstance];
  if ([v2 isButtonLayoutEnabled]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 0.100000001;
  }

  return v3;
}

+ (BOOL)usesButtonColorMatrixFilters
{
  v2 = +[CNKFeatures sharedInstance];
  unsigned __int8 v3 = [v2 isButtonLayoutEnabled];

  return v3;
}

+ (BOOL)usesEmergencyCallButtonColorMatrixFilters
{
  v2 = +[CNKFeatures sharedInstance];
  if ([v2 isEnhancedEmergencyEnabled])
  {
    unsigned __int8 v3 = +[TUCallCenter sharedInstance];
    unsigned __int8 v4 = [v3 frontmostCall];
    unsigned __int8 v5 = [v4 isEmergency];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end