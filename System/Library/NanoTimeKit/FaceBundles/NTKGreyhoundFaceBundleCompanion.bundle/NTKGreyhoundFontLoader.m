@interface NTKGreyhoundFontLoader
+ (id)nyNumeralsBlackFontDescriptor;
+ (id)nyNumeralsHeavyFontDescriptor;
+ (id)sfNumeralsBlackFontDescriptor;
+ (id)sfNumeralsHeavyFontDescriptor;
+ (id)tokyoBlackFontDescriptor;
+ (id)tokyoHeavyFontDescriptor;
@end

@implementation NTKGreyhoundFontLoader

+ (id)nyNumeralsBlackFontDescriptor
{
  if (qword_1A4F8 != -1) {
    dispatch_once(&qword_1A4F8, &stru_14458);
  }
  v2 = (void *)qword_1A4F0;

  return v2;
}

+ (id)nyNumeralsHeavyFontDescriptor
{
  if (qword_1A508 != -1) {
    dispatch_once(&qword_1A508, &stru_14478);
  }
  v2 = (void *)qword_1A500;

  return v2;
}

+ (id)sfNumeralsBlackFontDescriptor
{
  if (qword_1A518 != -1) {
    dispatch_once(&qword_1A518, &stru_14498);
  }
  v2 = (void *)qword_1A510;

  return v2;
}

+ (id)sfNumeralsHeavyFontDescriptor
{
  if (qword_1A528 != -1) {
    dispatch_once(&qword_1A528, &stru_144B8);
  }
  v2 = (void *)qword_1A520;

  return v2;
}

+ (id)tokyoBlackFontDescriptor
{
  if (qword_1A538 != -1) {
    dispatch_once(&qword_1A538, &stru_144D8);
  }
  v2 = (void *)qword_1A530;

  return v2;
}

+ (id)tokyoHeavyFontDescriptor
{
  if (qword_1A548 != -1) {
    dispatch_once(&qword_1A548, &stru_144F8);
  }
  v2 = (void *)qword_1A540;

  return v2;
}

@end