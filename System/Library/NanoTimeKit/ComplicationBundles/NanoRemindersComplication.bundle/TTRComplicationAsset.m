@interface TTRComplicationAsset
+ (UIColor)tintColor;
+ (id)_imageNameForFamily:(int64_t)a3;
+ (id)imageForFamily:(int64_t)a3;
@end

@implementation TTRComplicationAsset

+ (id)imageForFamily:(int64_t)a3
{
  v4 = [a1 _imageNameForFamily:a3];
  v5 = +[NSBundle bundleForClass:a1];
  v6 = +[UIImage imageNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (UIColor)tintColor
{
  return +[UIColor systemBlueColor];
}

+ (id)_imageNameForFamily:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return @"CircularSmall";
  }
  else {
    return off_10560[a3 - 1];
  }
}

@end