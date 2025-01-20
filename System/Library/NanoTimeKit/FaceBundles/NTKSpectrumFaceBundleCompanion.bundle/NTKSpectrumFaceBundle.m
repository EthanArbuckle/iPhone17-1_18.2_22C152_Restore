@interface NTKSpectrumFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_galleryFacesWithColorOptions:(id)a3 device:(id)a4;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKSpectrumFaceBundle

- (id)legacyFaceStyle
{
  return &off_10F00;
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
  return +[NTKSpectrumAnalogFace defaultFaceOfStyle:41 forDevice:a3];
}

- (id)galleryTitle
{
  return +[NTKSpectrumFaceBundle localizedStringForKey:@"SPECTRUM_FACE_NAME_IN_TITLE_CASE" comment:@"Spectrum"];
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = +[NTKFace defaultFaceOfStyle:41 forDevice:v3];
    v6 = +[NTKSpectrumAnalogColorEditOption optionWithColor:3004 forDevice:v3];
    [v5 selectOption:v6 forCustomEditMode:10 slot:0];

    if (v5)
    {
      v8 = v5;
      v4 = +[NSArray arrayWithObjects:&v8 count:1];
    }
    else
    {
      v4 = &__NSArray0__struct;
    }
  }

  return v4;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = +[NTKFace defaultFaceOfStyle:41 forDevice:v3];
    v6 = +[NTKSpectrumAnalogColorEditOption optionWithColor:6 forDevice:v3];
    [v5 selectOption:v6 forCustomEditMode:10 slot:0];

    v10[0] = NTKComplicationSlotTopLeft;
    v10[1] = NTKComplicationSlotTopRight;
    v11[0] = &off_11240;
    v11[1] = &off_11258;
    v10[2] = NTKComplicationSlotBottomLeft;
    v10[3] = NTKComplicationSlotBottomRight;
    v11[2] = &off_11270;
    v11[3] = &off_11288;
    v10[4] = NTKComplicationSlotBezel;
    v11[4] = &off_112A0;
    v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];
    [v5 _setFaceGalleryComplicationTypesForSlots:v7];

    if (v5)
    {
      v9 = v5;
      v4 = +[NSArray arrayWithObjects:&v9 count:1];
    }
    else
    {
      v4 = &__NSArray0__struct;
    }
  }

  return v4;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKSpectrumFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKSpectrumFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v7 = [(NTKSpectrumFaceBundle *)self _galleryFacesWithColorOptions:v6 device:v4];
  }
  else
  {
    v7 = [(NTKSpectrumFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }

  return v7;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &off_112B8;
  }
  else
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
    unsigned int v9 = [v4 supportsCapability:v8];

    if (v9) {
      v7 = &off_112D0;
    }
    else {
      v7 = &off_112E8;
    }
  }
  v10 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v7);
        }
        v15 = +[NTKSpectrumAnalogColorEditOption optionWithFaceColor:forDevice:](NTKSpectrumAnalogColorEditOption, "optionWithFaceColor:forDevice:", [*(id *)(*((void *)&v18 + 1) + 8 * i) integerValue], v4);
        if (v15) {
          [v10 addObject:v15];
        }
      }
      id v12 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  v16 = [(NTKSpectrumFaceBundle *)self _galleryFacesWithColorOptions:v10 device:v4];

  return v16;
}

- (id)_galleryFacesWithColorOptions:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v8 = 2 * (void)[v5 count];
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      v10 = +[NTKFace defaultFaceOfStyle:41 forDevice:v6];
      if (v10)
      {
        id v11 = +[NTKSpectrumStyleEditOption optionWithStyle:2 forDevice:v6];
        [v10 selectOption:v11 forCustomEditMode:15 slot:0];

        id v12 = +[NTKAnalogDialShapeEditOption optionWithShape:(i & 1) == 0 forDevice:v6];
        [v10 selectOption:v12 forCustomEditMode:12 slot:0];

        uint64_t v13 = [v5 objectAtIndexedSubscript:i >> 1];
        [v10 selectOption:v13 forCustomEditMode:10 slot:0];

        [v7 addObject:v10];
      }
    }
  }
  id v14 = [v7 copy];

  return v14;
}

@end