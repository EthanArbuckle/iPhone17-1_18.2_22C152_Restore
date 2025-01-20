@interface NTKNumeralsAnalogFaceBundle
+ (id)complicationTypesBySlot;
+ (id)styles;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)galleryTitleForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKNumeralsAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_10FC8;
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
    uint64_t v4 = 218;
  }
  else {
    uint64_t v4 = 18;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKNumeralsAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_NUMERALS_IN_TITLE_CASE" comment:@"Numerals"];
}

- (id)galleryTitleForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKNumeralsAnalogFaceBundle;
    v7 = [(NTKNumeralsAnalogFaceBundle *)&v9 galleryTitleForDevice:v4];
  }

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unsigned __int8 v6 = +[NTKNumeralsAnalogFaceBundle styles];
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      if (v7 || CLKLocaleCurrentNumberSystem() == 1)
      {
        v8 = [(NTKNumeralsAnalogFaceBundle *)self defaultFaceForDevice:v4];
        if (v8)
        {
          objc_super v9 = +[NTKNumeralsAnalogFaceColorEditOption optionWithFaceColor:19 forDevice:v4];
          [v8 selectOption:v9 forCustomEditMode:10 slot:0];

          v10 = [v6 objectAtIndexedSubscript:v7];
          id v11 = [v10 unsignedIntegerValue];

          v12 = +[NTKNumeralsAnalogStyleEditOption optionWithStyle:v11 forDevice:v4];
          [v8 selectOption:v12 forCustomEditMode:13 slot:0];

          v13 = +[NTKNumeralsAnalogFaceBundle complicationTypesBySlot];
          [v8 _setFaceGalleryComplicationTypesForSlots:v13];

          [v5 addObject:v8];
        }
      }
      ++v7;
    }
    while ((unint64_t)[v6 count] > v7);
  }
  id v14 = [v5 copy];

  return v14;
}

+ (id)styles
{
  return &off_114A0;
}

+ (id)complicationTypesBySlot
{
  uint64_t v4 = NTKComplicationSlot1;
  id v5 = &off_114B8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

@end