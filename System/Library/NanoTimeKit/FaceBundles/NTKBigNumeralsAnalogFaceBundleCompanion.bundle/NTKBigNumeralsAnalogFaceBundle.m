@interface NTKBigNumeralsAnalogFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_bigNumeralsAnalogFacesWithColor:(id)a3 forDevice:(id)a4;
- (id)_bigNumeralsAnalogFacesWithColorOptions:(id)a3 forDevice:(id)a4;
- (id)_colorOptionFromColorValue:(id)a3 device:(id)a4;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)_spring2020FacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKBigNumeralsAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_CB00;
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
  v4 = [(id)objc_opt_class() identifier];
  v5 = [(id)objc_opt_class() analyticsIdentifier];
  v6 = +[NTKBigNumeralsAnalogFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKBigNumeralsAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_BIG_NUMERALS_ANALOG_IN_TITLE_CASE" comment:@"Numerals Mono"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKBigNumeralsAnalogFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKBigNumeralsAnalogFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v7 = [(NTKBigNumeralsAnalogFaceBundle *)self _bigNumeralsAnalogFacesWithColorOptions:v6 forDevice:v4];
  }
  else
  {
    v7 = [(NTKBigNumeralsAnalogFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }

  return v7;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = [(NTKBigNumeralsAnalogFaceBundle *)self _fall2020FacesForDevice:v4];
  }
  else
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
    unsigned int v9 = [v4 supportsCapability:v8];

    if (v9) {
      [(NTKBigNumeralsAnalogFaceBundle *)self _spring2020FacesForDevice:v4];
    }
    else {
    uint64_t v7 = [(NTKBigNumeralsAnalogFaceBundle *)self _graceDefaultFacesForDevice:v4];
    }
  }
  v10 = (void *)v7;

  return v10;
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKFaceColorEditOption standardColorValuesForDevice:v4];
  unsigned int v6 = objc_msgSend(v5, "subarrayWithRange:", 0, 3);
  uint64_t v7 = [(NTKBigNumeralsAnalogFaceBundle *)self _bigNumeralsAnalogFacesWithColor:v6 forDevice:v4];

  return v7;
}

- (id)_spring2020FacesForDevice:(id)a3
{
  return [(NTKBigNumeralsAnalogFaceBundle *)self _bigNumeralsAnalogFacesWithColor:&off_CCD8 forDevice:a3];
}

- (id)_colorOptionFromColorValue:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
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
        v13 = +[NTKBigNumeralsAnalogColorEditOption optionWithFaceColor:forDevice:](NTKBigNumeralsAnalogColorEditOption, "optionWithFaceColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15), v6);
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

- (id)_bigNumeralsAnalogFacesWithColor:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NTKBigNumeralsAnalogFaceBundle *)self _colorOptionFromColorValue:a3 device:v6];
  id v8 = [(NTKBigNumeralsAnalogFaceBundle *)self _bigNumeralsAnalogFacesWithColorOptions:v7 forDevice:v6];

  return v8;
}

- (id)_bigNumeralsAnalogFacesWithColorOptions:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  uint64_t v8 = (uint64_t)+[NTKBigNumeralsAnalogTypefaceEditOption numberOfOptionsForDevice:v6];
  uint64_t v9 = v8 * (void)v7;
  id v10 = +[NSMutableArray array];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v12 = +[NTKFace defaultFaceOfStyle:38 forDevice:v6];
      if (v12)
      {
        v13 = +[NTKBigNumeralsAnalogTypefaceEditOption optionAtIndex:i % v8 forDevice:v6];
        [v12 selectOption:v13 forCustomEditMode:13 slot:0];
        v14 = [v5 objectAtIndexedSubscript:i / v8];
        [v12 selectOption:v14 forCustomEditMode:10 slot:0];

        [v10 addObject:v12];
      }
    }
  }

  return v10;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 deviceCategory];
  id v5 = +[NTKFace defaultFaceOfStyle:38 forDevice:v3];
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
    unsigned int v7 = [v3 supportsCapability:v6];

    if (v7) {
      uint64_t v8 = NTKBigNumeralsAnalogColorEditOption;
    }
    else {
      uint64_t v8 = (__objc2_class *)NTKFaceColorEditOption;
    }
    uint64_t v9 = +[NTKFaceColorEditOption standardColorValuesForDevice:v3];
    id v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = -[__objc2_class optionWithFaceColor:forDevice:](v8, "optionWithFaceColor:forDevice:", [v10 integerValue], v3);
    [v5 selectOption:v11 forCustomEditMode:10 slot:0];

    id v12 = [v5 copy];
    id v5 = v12;
  }
  if (v5)
  {
    long long v15 = v5;
    v13 = +[NSArray arrayWithObjects:&v15 count:1];
  }
  else
  {
    v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKFace defaultFaceOfStyle:38 forDevice:v3];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  unsigned int v6 = [v3 supportsCapability:v5];

  unsigned int v7 = (id *)off_C288;
  if (!v6) {
    unsigned int v7 = (id *)NTKFaceColorEditOption_ptr;
  }
  uint64_t v8 = [*v7 optionWithFaceColor:68 forDevice:v3];

  [v4 selectOption:v8 forCustomEditMode:10 slot:0];
  if (v4)
  {
    uint64_t v11 = v4;
    uint64_t v9 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    uint64_t v9 = &__NSArray0__struct;
  }

  return v9;
}

@end