@interface NTKUltraCubeFontLoader
+ (id)nyNumeralsFontDescriptorOutlined:(BOOL)a3;
+ (id)sfNumeralsFontDescriptorOutlined:(BOOL)a3;
+ (id)tokyoFontDescriptorOutlined:(BOOL)a3;
@end

@implementation NTKUltraCubeFontLoader

+ (id)nyNumeralsFontDescriptorOutlined:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_58E40 != -1) {
    dispatch_once(&qword_58E40, &stru_48F18);
  }
  v4 = &qword_58E38;
  if (!v3) {
    v4 = &qword_58E30;
  }
  v5 = (void *)*v4;

  return v5;
}

+ (id)sfNumeralsFontDescriptorOutlined:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_58E58 != -1) {
    dispatch_once(&qword_58E58, &stru_48F38);
  }
  v4 = &qword_58E50;
  if (!v3) {
    v4 = &qword_58E48;
  }
  v5 = (void *)*v4;

  return v5;
}

+ (id)tokyoFontDescriptorOutlined:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_58E70 != -1) {
    dispatch_once(&qword_58E70, &stru_48F58);
  }
  v4 = &qword_58E68;
  if (!v3) {
    v4 = &qword_58E60;
  }
  v5 = (void *)*v4;

  return v5;
}

@end