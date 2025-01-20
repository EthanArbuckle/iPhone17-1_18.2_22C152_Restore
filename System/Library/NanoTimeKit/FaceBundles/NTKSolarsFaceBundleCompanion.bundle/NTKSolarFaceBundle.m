@interface NTKSolarFaceBundle
+ (id)identifier;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_legacyDefaultFacesForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitleForDevice:(id)a3;
- (id)legacyFaceStyle;
- (id)siderealComplicationTypesBySlot;
@end

@implementation NTKSolarFaceBundle

- (id)legacyFaceStyle
{
  return &off_2DC88;
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
  return +[NTKSolarFace defaultFaceOfStyle:8 forDevice:a3];
}

- (id)galleryTitleForDevice:(id)a3
{
  if ([a3 deviceCategory] == (char *)&dword_0 + 1)
  {
    CFStringRef v3 = @"FACE_STYLE_SOLAR_GRAPH_IN_TITLE_CASE";
    CFStringRef v4 = @"Solar Graph";
  }
  else
  {
    CFStringRef v3 = @"COMBINED_SOLAR_GALLERY_TITLE";
    CFStringRef v4 = @"Solar";
  }
  v5 = +[NTKSolarFaceBundle localizedStringForKey:v3 comment:v4];

  return v5;
}

- (id)galleryDescriptionText
{
  return +[NTKSolarFaceBundle localizedStringForKey:@"FACE_STYLE_SOLAR_GRAPH_GALLERY_DESCRIPTION" comment:@"description"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isRunningGraceOrLater]) {
    [(NTKSolarFaceBundle *)self _graceDefaultFacesForDevice:v4];
  }
  else {
  v5 = [(NTKSolarFaceBundle *)self _legacyDefaultFacesForDevice:v4];
  }

  return v5;
}

- (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = [(NTKSolarFaceBundle *)self defaultFaceForDevice:a3];
  v5 = [(NTKSolarFaceBundle *)self complicationTypesBySlot];
  [v4 _setFaceGalleryComplicationTypesForSlots:v5];

  if (v4)
  {
    v8 = v4;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    v6 = (char *)+[NTKSiderealTimeStyleEditOption numberOfOptionsForDevice:v4];
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      uint64_t v9 = NTKBundleComplicationNoiseBundleIdentifier;
      uint64_t v10 = NTKBundleComplicationNoiseAppBundleIdentifier;
      uint64_t v11 = NTKComplicationSlotTopLeft;
      do
      {
        v12 = +[NTKSiderealFace defaultFaceOfStyle:36 forDevice:v4];
        if (v12)
        {
          v13 = +[NTKSiderealTimeStyleEditOption optionWithStyle:v8 forDevice:v4];
          [v12 selectOption:v13 forCustomEditMode:15 slot:0];

          v14 = [(NTKSolarFaceBundle *)self siderealComplicationTypesBySlot];
          [v12 _setFaceGalleryComplicationTypesForSlots:v14];

          v15 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:v9 appBundleIdentifier:v10 complicationDescriptor:0];
          [v12 setComplication:v15 forSlot:v11];
          [v5 addObject:v12];
        }
        ++v8;
      }
      while (v7 != v8);
    }
  }
  v16 = [(NTKSolarFaceBundle *)self defaultFaceForDevice:v4];
  v17 = [(NTKSolarFaceBundle *)self complicationTypesBySlot];
  [v16 _setFaceGalleryComplicationTypesForSlots:v17];

  if (v16) {
    [v5 addObject:v16];
  }
  id v18 = [v5 copy];

  return v18;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottom;
  v5[0] = &off_2E0B8;
  v5[1] = &off_2E0D0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (id)siderealComplicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottomLeft;
  v5[0] = &off_2E0E8;
  v5[1] = &off_2E100;
  void v4[2] = NTKComplicationSlotBottomRight;
  void v5[2] = &off_2E118;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

@end