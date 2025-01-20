@interface NTKUtilityFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKUtilityFaceBundle

- (id)legacyFaceStyle
{
  return &off_11488;
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
    uint64_t v4 = 200;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = +[NTKUtilityFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKUtilityFaceBundle localizedStringForKey:@"UTILITY_FACE_NAME_IN_TITLE_CASE" comment:@"Utility"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v15[0] = NTKComplicationSlotTopLeft;
  v15[1] = NTKComplicationSlotTopRight;
  v16[0] = &off_116D8;
  v16[1] = &off_116F0;
  v15[2] = NTKComplicationSlotBottomCenter;
  v16[2] = &off_11708;
  uint64_t v6 = 3;
  v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v8 = NTKComplicationSlotDate;
  do
  {
    v9 = [(NTKUtilityFaceBundle *)self defaultFaceForDevice:v4];
    if (v9)
    {
      v10 = +[NTKDensityEditOption optionWithDensity:v6 forDevice:v4];
      [v9 selectOption:v10 forCustomEditMode:11 slot:0];

      id v11 = [v7 mutableCopy];
      [v9 _setFaceGalleryComplicationTypesForSlots:v11];

      v12 = +[NTKDateComplication complicationWithDateStyle:4];
      [v9 setComplication:v12 forSlot:v8];

      [v5 addObject:v9];
    }

    --v6;
  }
  while (v6 != -1);
  id v13 = [v5 copy];

  return v13;
}

@end