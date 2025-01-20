@interface NTKActivityAnalogRichFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_digitalFaceForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKActivityAnalogRichFaceBundle

- (id)legacyFaceStyle
{
  return &off_218D0;
}

+ (id)identifier
{
  return @"com.apple.NTKActivityFaceBundle.NTKActivityAnalogRichFaceBundle";
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
    v6.super_class = (Class)NTKActivityAnalogRichFaceBundle;
    v3 = [(NTKActivityAnalogFaceBundle *)&v6 galleryTitle];
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
  return +[NTKFace defaultFaceOfStyle:16 forDevice:a3];
}

- (id)_digitalFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:17 forDevice:a3];
}

@end