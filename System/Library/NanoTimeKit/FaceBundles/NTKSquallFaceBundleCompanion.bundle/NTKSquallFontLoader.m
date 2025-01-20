@interface NTKSquallFontLoader
+ (id)squallFontDescriptor;
+ (id)squallPicayuneFontDescriptor;
+ (id)squallVariableFontDescriptor;
@end

@implementation NTKSquallFontLoader

+ (id)squallFontDescriptor
{
  if (qword_12CF0 != -1) {
    dispatch_once(&qword_12CF0, &stru_C520);
  }
  v2 = (void *)qword_12CE8;

  return v2;
}

+ (id)squallVariableFontDescriptor
{
  if (qword_12D00 != -1) {
    dispatch_once(&qword_12D00, &stru_C540);
  }
  v2 = (void *)qword_12CF8;

  return v2;
}

+ (id)squallPicayuneFontDescriptor
{
  v2 = [a1 squallFontDescriptor];
  CFStringRef v10 = kCTFontVariationAttribute;
  v3 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  v8 = v3;
  v9 = &off_C978;
  v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v6 = [v2 fontDescriptorByAddingAttributes:v5];

  return v6;
}

@end