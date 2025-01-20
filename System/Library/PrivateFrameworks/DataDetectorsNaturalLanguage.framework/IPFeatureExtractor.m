@interface IPFeatureExtractor
+ (id)defaultExtractor;
- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5;
@end

@implementation IPFeatureExtractor

+ (id)defaultExtractor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  return 0;
}

@end