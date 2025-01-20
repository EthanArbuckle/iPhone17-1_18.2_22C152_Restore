@interface NTKAegirFontLoader
+ (id)nyNumeralsFontDescriptorOutlined:(BOOL)a3;
+ (id)sfNumeralsFontDescriptorOutlined:(BOOL)a3;
+ (id)tokyoFontDescriptorOutlined:(BOOL)a3;
@end

@implementation NTKAegirFontLoader

+ (id)nyNumeralsFontDescriptorOutlined:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EA8FC8B8 != -1) {
    dispatch_once(&qword_1EA8FC8B8, &unk_1F3524ED8);
  }
  v4 = &qword_1EA8FC8B0;
  if (!v3) {
    v4 = &qword_1EA8FC8A8;
  }
  v5 = (void *)*v4;

  return v5;
}

+ (id)sfNumeralsFontDescriptorOutlined:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EA8FC8D0 != -1) {
    dispatch_once(&qword_1EA8FC8D0, &unk_1F3524EF8);
  }
  v4 = &qword_1EA8FC8C8;
  if (!v3) {
    v4 = &qword_1EA8FC8C0;
  }
  v5 = (void *)*v4;

  return v5;
}

+ (id)tokyoFontDescriptorOutlined:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EA8FC8E8 != -1) {
    dispatch_once(&qword_1EA8FC8E8, &unk_1F3524F18);
  }
  v4 = &qword_1EA8FC8E0;
  if (!v3) {
    v4 = &qword_1EA8FC8D8;
  }
  v5 = (void *)*v4;

  return v5;
}

@end