@interface CAFilter(ClipServicesUIExtras)
+ (id)cps_filterWithType:()ClipServicesUIExtras value:forKey:;
@end

@implementation CAFilter(ClipServicesUIExtras)

+ (id)cps_filterWithType:()ClipServicesUIExtras value:forKey:
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(id)objc_opt_class() filterWithType:v8];

  v10 = [NSNumber numberWithDouble:a1];
  [v9 setValue:v10 forKey:v7];

  return v9;
}

@end