@interface NTKFireWaterRichFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKFireWaterRichFaceBundle

- (id)legacyFaceStyle
{
  return &off_8998;
}

+ (id)identifier
{
  return @"com.apple.NTKFireWaterRichFaceBundle";
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
    v6.super_class = (Class)NTKFireWaterRichFaceBundle;
    v3 = [(NTKFireWaterFaceBundle *)&v6 galleryTitle];
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
  return +[NTKFace defaultFaceOfStyle:32 forDevice:a3];
}

@end