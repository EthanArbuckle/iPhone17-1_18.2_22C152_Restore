@interface NTKBigNumeralsDigitalFaceBundle
+ (id)_bigNumeralsDigitalFacesWithColorOptions:(id)a3 forDevice:(id)a4;
+ (id)_editOptionsWithColorValues:(id)a3 device:(id)a4;
+ (id)_fall2020FacesForDevice:(id)a3;
+ (id)_graceDefaultFacesForDevice:(id)a3;
+ (id)_spring2020FacesForDevice:(id)a3;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKBigNumeralsDigitalFaceBundle

- (id)legacyFaceStyle
{
  return &off_D278;
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
  v4 = [(id)objc_opt_class() identifier];
  v5 = [(id)objc_opt_class() analyticsIdentifier];
  v6 = +[NTKBigNumeralsDigitalFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKBigNumeralsDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_BIG_NUMERALS_DIGITAL_IN_TITLE_CASE" comment:@"Numerals Duo"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKBigNumeralsDigitalFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = objc_opt_class();
    v7 = [(NTKBigNumeralsDigitalFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v8 = [v6 _bigNumeralsDigitalFacesWithColorOptions:v7 forDevice:v4];
  }
  else
  {
    v8 = [(NTKBigNumeralsDigitalFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }

  return v8;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    uint64_t v6 = +[NTKBigNumeralsDigitalFaceBundle _fall2020FacesForDevice:v3];
  }
  else
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
    unsigned int v8 = [v3 supportsCapability:v7];

    if (v8) {
      +[NTKBigNumeralsDigitalFaceBundle _spring2020FacesForDevice:v3];
    }
    else {
    uint64_t v6 = +[NTKBigNumeralsDigitalFaceBundle _graceDefaultFacesForDevice:v3];
    }
  }
  v9 = (void *)v6;

  return v9;
}

+ (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 _editOptionsWithColorValues:&off_D5B0 device:v4];
  uint64_t v6 = [a1 _bigNumeralsDigitalFacesWithColorOptions:v5 forDevice:v4];

  return v6;
}

+ (id)_spring2020FacesForDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 _editOptionsWithColorValues:&off_D5C8 device:v4];
  uint64_t v6 = [a1 _bigNumeralsDigitalFacesWithColorOptions:v5 forDevice:v4];

  return v6;
}

+ (id)_fall2020FacesForDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 _editOptionsWithColorValues:&off_D5E0 device:v4];
  uint64_t v6 = [a1 _bigNumeralsDigitalFacesWithColorOptions:v5 forDevice:v4];

  return v6;
}

+ (id)_editOptionsWithColorValues:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = +[NTKBigNumeralsDigitalColorEditOption optionWithColor:forDevice:](NTKBigNumeralsDigitalColorEditOption, "optionWithColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15), v6);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)_bigNumeralsDigitalFacesWithColorOptions:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  uint64_t v8 = (uint64_t)+[NTKBigNumeralsDigitalStyleEditOption numberOfOptionsForDevice:v6];
  uint64_t v9 = v8 * (void)v7;
  id v10 = +[NSMutableArray array];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v12 = +[NTKFace defaultFaceOfStyle:37 forDevice:v6];
      if (v12)
      {
        v13 = +[NTKBigNumeralsDigitalStyleEditOption optionAtIndex:i % v8 forDevice:v6];
        [v12 selectOption:v13 forCustomEditMode:15 slot:0];
        v14 = [v5 objectAtIndexedSubscript:i / v8];
        [v12 selectOption:v14 forCustomEditMode:10 slot:0];

        [v10 addObject:v12];
      }
    }
  }
  id v15 = [v10 copy];

  return v15;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 deviceCategory];
  id v5 = +[NTKFace defaultFaceOfStyle:37 forDevice:v3];
  id v6 = +[NTKBigNumeralsDigitalColorEditOption optionWithColor:3005 forDevice:v3];
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    [v5 selectOption:v6 forCustomEditMode:10 slot:0];

    id v6 = +[NTKBigNumeralsDigitalStyleEditOption optionWithStyle:0 forDevice:v3];

    id v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = 15;
  }
  else
  {

    id v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = 10;
  }
  [v7 selectOption:v8 forCustomEditMode:v9 slot:0];

  if (v5)
  {
    v12 = v5;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKFace defaultFaceOfStyle:37 forDevice:v3];
  id v5 = +[NTKBigNumeralsDigitalColorEditOption optionWithColor:3011 forDevice:v3];
  [v4 selectOption:v5 forCustomEditMode:10 slot:0];

  id v6 = +[NTKBigNumeralsDigitalStyleEditOption optionWithStyle:0 forDevice:v3];

  [v4 selectOption:v6 forCustomEditMode:15 slot:0];
  if (v4)
  {
    uint64_t v9 = v4;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

@end