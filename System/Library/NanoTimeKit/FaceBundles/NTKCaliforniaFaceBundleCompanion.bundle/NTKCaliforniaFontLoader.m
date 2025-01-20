@interface NTKCaliforniaFontLoader
+ (id)sfNumeralsBoldFontDescriptor;
@end

@implementation NTKCaliforniaFontLoader

+ (id)sfNumeralsBoldFontDescriptor
{
  if (qword_22430 != -1) {
    dispatch_once(&qword_22430, &stru_189A8);
  }
  v2 = (void *)qword_22428;

  return v2;
}

@end