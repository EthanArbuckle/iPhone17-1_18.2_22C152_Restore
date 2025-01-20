@interface NTKSolarDialFaceBundle
+ (id)identifier;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
- (id)siderealComplicationTypesBySlot;
@end

@implementation NTKSolarDialFaceBundle

- (id)legacyFaceStyle
{
  return &off_2DBF8;
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

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  return +[NTKSiderealFace defaultFaceOfStyle:36 forDevice:a3];
}

- (id)galleryTitle
{
  return 0;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([v4 deviceCategory] == (char *)&dword_0 + 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = +[NTKSiderealFace defaultFaceOfStyle:36 forDevice:v4];
    v7 = [(NTKSolarDialFaceBundle *)self siderealComplicationTypesBySlot];
    [v6 _setFaceGalleryComplicationTypesForSlots:v7];

    v8 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationNoiseBundleIdentifier appBundleIdentifier:NTKBundleComplicationNoiseAppBundleIdentifier complicationDescriptor:0];
    [v6 setComplication:v8 forSlot:NTKComplicationSlotTopLeft];
    v10 = v6;
    v5 = +[NSArray arrayWithObjects:&v10 count:1];
  }

  return v5;
}

- (id)siderealComplicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottomLeft;
  v5[0] = &off_2E028;
  v5[1] = &off_2E040;
  v4[2] = NTKComplicationSlotBottomRight;
  v5[2] = &off_2E058;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

@end