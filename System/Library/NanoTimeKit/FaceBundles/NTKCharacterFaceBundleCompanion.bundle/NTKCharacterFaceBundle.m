@interface NTKCharacterFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKCharacterFaceBundle

- (id)legacyFaceStyle
{
  return &off_1DE48;
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
    uint64_t v4 = 210;
  }
  else {
    uint64_t v4 = 10;
  }
  v5 = +[NTKCharacterFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKCharacterFaceBundle localizedStringForKey:@"CHARACTER_FACE_NAME_IN_TITLE_CASE" comment:@"Character"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v14[0] = NTKComplicationSlotTopLeft;
  v14[1] = NTKComplicationSlotTopRight;
  v15[0] = &off_1E9B8;
  v15[1] = &off_1E9D0;
  v14[2] = NTKComplicationSlotBottomCenter;
  v15[2] = &off_1E9E8;
  v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v6 = +[NSMutableArray array];
  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    v10 = [(NTKCharacterFaceBundle *)self defaultFaceForDevice:v4];
    if (v10)
    {
      v11 = +[NTKCharacterEditOption optionWithCharacter:v7 forDevice:v4];
      [v10 selectOption:v11 forCustomEditMode:12 slot:0];

      [v10 _setFaceGalleryComplicationTypesForSlots:v5];
      [v6 addObject:v10];
    }

    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  id v12 = [v6 copy];

  return v12;
}

@end