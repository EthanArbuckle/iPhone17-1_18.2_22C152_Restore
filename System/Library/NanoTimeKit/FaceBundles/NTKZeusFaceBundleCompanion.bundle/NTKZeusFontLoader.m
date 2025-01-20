@interface NTKZeusFontLoader
+ (id)_fontVariationAttributesForInlineWidth:(double)a3;
+ (id)capeCodFontDescriptor;
+ (id)capeCodInlineFontDescriptorWithInlineWidth:(double)a3;
+ (id)carrickFontDescriptor;
+ (id)clipperFontDescriptor;
+ (id)espaceFontDescriptor;
@end

@implementation NTKZeusFontLoader

+ (id)clipperFontDescriptor
{
  if (qword_4CB88 != -1) {
    dispatch_once(&qword_4CB88, &stru_3CCF8);
  }
  v2 = (void *)qword_4CB80;

  return v2;
}

+ (id)capeCodFontDescriptor
{
  if (qword_4CB98 != -1) {
    dispatch_once(&qword_4CB98, &stru_3CD18);
  }
  v2 = (void *)qword_4CB90;

  return v2;
}

+ (id)espaceFontDescriptor
{
  if (qword_4CBA8 != -1) {
    dispatch_once(&qword_4CBA8, &stru_3CD38);
  }
  v2 = (void *)qword_4CBA0;

  return v2;
}

+ (id)carrickFontDescriptor
{
  if (qword_4CBB8 != -1) {
    dispatch_once(&qword_4CBB8, &stru_3CD58);
  }
  v2 = (void *)qword_4CBB0;

  return v2;
}

+ (id)capeCodInlineFontDescriptorWithInlineWidth:(double)a3
{
  if (qword_4CBC8 != -1) {
    dispatch_once(&qword_4CBC8, &stru_3CD78);
  }
  id v5 = [(id)qword_4CBC0 copy];
  v6 = objc_opt_new();
  v7 = [a1 _fontVariationAttributesForInlineWidth:a3];
  [v6 setObject:v7 forKey:kCTFontVariationAttribute];
  v8 = objc_opt_new();
  if ([v8 count]) {
    [v6 setObject:v8 forKey:UIFontDescriptorFeatureSettingsAttribute];
  }
  v9 = [v5 fontDescriptorByAddingAttributes:v6];

  return v9;
}

+ (id)_fontVariationAttributesForInlineWidth:(double)a3
{
  v4 = objc_opt_new();
  id v5 = +[NSNumber numberWithDouble:a3];
  v6 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  [v4 setObject:v5 forKey:v6];

  return v4;
}

@end