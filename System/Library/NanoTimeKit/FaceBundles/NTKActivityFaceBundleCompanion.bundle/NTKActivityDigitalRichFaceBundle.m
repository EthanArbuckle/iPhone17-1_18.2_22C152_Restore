@interface NTKActivityDigitalRichFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKActivityDigitalRichFaceBundle

- (id)legacyFaceStyle
{
  return &off_21978;
}

+ (id)identifier
{
  return @"com.apple.NTKActivityFaceBundle.NTKActivityDigitalRichFaceBundle";
}

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:17 forDevice:a3];
}

@end