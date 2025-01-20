@interface NTKPrideAnalogFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKPrideAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_257F8;
}

+ (id)identifier
{
  v3 = +[NSBundle bundleForClass:a1];
  v4 = [v3 bundleIdentifier];
  v5 = NSStringFromClass((Class)a1);
  v6 = +[NSString stringWithFormat:@"%@.%@", v4, v5];

  return v6;
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
  id v3 = a3;
  if (NTKShowBlueRidgeUI()) {
    uint64_t v4 = 233;
  }
  else {
    uint64_t v4 = 33;
  }
  v5 = +[NTKPrideAnalogFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return 0;
}

@end