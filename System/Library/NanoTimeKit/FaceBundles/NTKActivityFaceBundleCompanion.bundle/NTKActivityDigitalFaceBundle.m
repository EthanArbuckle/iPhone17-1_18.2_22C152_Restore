@interface NTKActivityDigitalFaceBundle
+ (id)identifier;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKActivityDigitalFaceBundle

- (id)legacyFaceStyle
{
  return &off_21960;
}

+ (id)identifier
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NTKActivityDigitalFaceBundle;
  v3 = objc_msgSendSuper2(&v7, "identifier");
  v4 = NSStringFromClass((Class)a1);
  v5 = +[NSString stringWithFormat:@"%@.%@", v3, v4];

  return v5;
}

- (id)galleryTitle
{
  return 0;
}

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  if (NTKShowBlueRidgeUI()) {
    uint64_t v4 = 217;
  }
  else {
    uint64_t v4 = 17;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

@end