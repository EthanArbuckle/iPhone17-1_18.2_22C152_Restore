@interface NTKSimpleFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKSimpleFaceBundle

- (id)legacyFaceStyle
{
  return &off_C7C8;
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
    uint64_t v4 = 201;
  }
  else {
    uint64_t v4 = 1;
  }
  v5 = +[NTKSimpleFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKSimpleFaceBundle localizedStringForKey:@"SIMPLE_FACE_NAME_IN_TITLE_CASE" comment:@"Simple"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v16[0] = NTKComplicationSlotTopLeft;
  v16[1] = NTKComplicationSlotTopRight;
  v17[0] = &off_CA60;
  v17[1] = &off_CA78;
  v16[2] = NTKComplicationSlotBottomLeft;
  v16[3] = NTKComplicationSlotBottomRight;
  v17[2] = &off_CA90;
  v17[3] = &off_CAA8;
  v5 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  v6 = objc_opt_new();
  v7 = +[NTKFaceColorEditOption optionsRestrictedByDevice:v4];
  uint64_t v8 = NTKComplicationSlotDate;
  uint64_t v9 = 3;
  do
  {
    v10 = [(NTKSimpleFaceBundle *)self defaultFaceForDevice:v4];
    if (v10)
    {
      v11 = +[NTKDensityEditOption optionWithDensity:v9 forDevice:v4];
      [v10 selectOption:v11 forCustomEditMode:11 slot:0];

      [v10 _setFaceGalleryComplicationTypesForSlots:v5];
      v12 = +[NTKComplication anyComplicationOfType:0];
      [v10 setComplication:v12 forSlot:v8];

      if ([v7 count])
      {
        v13 = [v7 firstObject];
        [v10 selectOption:v13 forCustomEditMode:10 slot:0];
      }
      [v6 addObject:v10];
    }

    --v9;
  }
  while (v9);
  id v14 = [v6 copy];

  return v14;
}

@end