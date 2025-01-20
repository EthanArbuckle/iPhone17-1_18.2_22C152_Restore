@interface NTKActivityAnalogFaceBundle
+ (id)identifier;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_digitalFaceForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKActivityAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_21858;
}

+ (id)identifier
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NTKActivityAnalogFaceBundle;
  v3 = objc_msgSendSuper2(&v7, "identifier");
  v4 = NSStringFromClass((Class)a1);
  v5 = +[NSString stringWithFormat:@"%@.%@", v3, v4];

  return v5;
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
    uint64_t v4 = 216;
  }
  else {
    uint64_t v4 = 16;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKActivityAnalogFaceBundle localizedStringForKey:@"GALLERY_TITLE_ACTIVITY" comment:@"Activity"];
}

- (id)_digitalFaceForDevice:(id)a3
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

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  int v6 = 0;
  uint64_t v7 = NTKComplicationSlotTopLeft;
  uint64_t v8 = NTKComplicationSlotTopRight;
  uint64_t v9 = NTKComplicationSlotBottomCenter;
  do
  {
    if (v6 == 2)
    {
      v10 = [(NTKActivityAnalogFaceBundle *)self _digitalFaceForDevice:v4];
      if (v10) {
        goto LABEL_8;
      }
    }
    else
    {
      if (v6 == 1)
      {
        v10 = [(NTKActivityAnalogFaceBundle *)self defaultFaceForDevice:v4];
        uint64_t v11 = 3;
      }
      else
      {
        if (v6) {
          goto LABEL_9;
        }
        v10 = [(NTKActivityAnalogFaceBundle *)self defaultFaceForDevice:v4];
        uint64_t v11 = 1;
      }
      v12 = +[NTKActivityAnalogDensityEditOption optionWithDensity:v11 forDevice:v4];
      [v10 selectOption:v12 forCustomEditMode:11 slot:0];

      if (v10)
      {
LABEL_8:
        v16[0] = v7;
        v16[1] = v8;
        v17[0] = &off_21B48;
        v17[1] = &off_21B60;
        v16[2] = v9;
        v17[2] = &off_21B78;
        v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
        [v10 _setFaceGalleryComplicationTypesForSlots:v13];

        [v5 addObject:v10];
      }
    }
LABEL_9:
    ++v6;
  }
  while (v6 != 3);
  id v14 = [v5 copy];

  return v14;
}

@end