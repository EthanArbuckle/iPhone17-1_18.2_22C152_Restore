@interface NTKLiquidMetalRichFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKLiquidMetalRichFaceBundle

- (id)legacyFaceStyle
{
  return &off_8908;
}

+ (id)identifier
{
  return @"com.apple.NTKLiquidMetalRichFaceBundle";
}

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (id)galleryTitle
{
  if (_os_feature_enabled_impl())
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKLiquidMetalRichFaceBundle;
    v3 = [(NTKLiquidMetalFaceBundle *)&v6 galleryTitle];
    v4 = +[NSString stringWithFormat:@"%@ (Legacy)", v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)defaultFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:31 forDevice:a3];
}

@end