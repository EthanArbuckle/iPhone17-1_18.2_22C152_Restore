@interface NTKPrideAnalogRichFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKPrideAnalogRichFaceBundle

- (id)legacyFaceStyle
{
  return &off_25810;
}

+ (id)identifier
{
  return @"com.apple.NTKPrideAnalogRichFaceBundle";
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
  return +[NTKFace defaultFaceOfStyle:33 forDevice:a3];
}

@end