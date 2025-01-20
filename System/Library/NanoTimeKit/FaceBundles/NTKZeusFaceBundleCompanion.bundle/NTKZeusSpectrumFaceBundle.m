@interface NTKZeusSpectrumFaceBundle
+ (id)identifier;
- (BOOL)isHardwareSpecific;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKZeusSpectrumFaceBundle

- (id)legacyFaceStyle
{
  return &off_3F4B8;
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
  return +[NTKSpectrumZeusFace defaultFaceOfStyle:42 forDevice:a3];
}

- (BOOL)isHardwareSpecific
{
  return 1;
}

- (id)galleryTitle
{
  return +[NTKZeusSpectrumFaceBundle localizedStringForKey:@"FACE_STYLE_ZEUS_SPECTRUM_IN_TITLE_CASE" comment:@"Noir Hermès"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  +[NTKSpectrumZeusFace isRestrictedForDevice:v4];
  v5 = objc_opt_new();
  v6 = (char *)+[NTKSpectrumStyleEditOption numberOfOptionsForDevice:v4];
  if ((uint64_t)v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = +[NTKFace defaultFaceOfStyle:42 forDevice:v4];
      if (v9)
      {
        v10 = +[NTKSpectrumStyleEditOption optionAtIndex:i forDevice:v4];
        [v9 selectOption:v10 forCustomEditMode:15 slot:0];

        v11 = [(NTKZeusSpectrumFaceBundle *)self complicationTypesBySlot];
        [v9 _setFaceGalleryComplicationTypesForSlots:v11];

        [v5 addObject:v9];
      }
    }
  }

  return v5;
}

- (id)complicationTypesBySlot
{
  uint64_t v4 = NTKComplicationSlotBottom;
  v5 = &off_3FB70;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([v4 deviceCategory] == (char *)&dword_0 + 1 || !objc_msgSend(v4, "isZeusBlack"))
  {
    v7 = 0;
  }
  else
  {
    v5 = +[NTKFace defaultFaceOfStyle:42 forDevice:v4];
    v6 = [(NTKZeusSpectrumFaceBundle *)self complicationTypesBySlot];
    [v5 _setFaceGalleryComplicationTypesForSlots:v6];

    if (v5)
    {
      v9 = v5;
      v7 = +[NSArray arrayWithObjects:&v9 count:1];
    }
    else
    {
      v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

@end