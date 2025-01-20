@interface NTKZeusAnalogFaceBundle
+ (id)identifier;
- (BOOL)isHardwareSpecific;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_fall2020DefaultFacesForDevice:(id)a3;
- (id)_gloryEDefaultFacesForDevice:(id)a3;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_legacyDefaultFacesForDevice:(id)a3;
- (id)_spring2020DefaultFacesForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGloryEDefaultFacesForDevice:(id)a3;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroLegacyDefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKZeusAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_3EAC8;
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
  return +[NTKZeusAnalogFace defaultFaceOfStyle:14 forDevice:a3];
}

- (BOOL)isHardwareSpecific
{
  return 1;
}

- (id)galleryTitle
{
  return +[NTKZeusAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_ZEUS_ANALOG_IN_TITLE_CASE" comment:@"Hermès"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  +[NTKZeusAnalogFace isRestrictedForDevice:v4];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = [(NTKZeusAnalogFaceBundle *)self _fall2020DefaultFacesForDevice:v4];
LABEL_7:
    v10 = (void *)v7;
    goto LABEL_8;
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  unsigned int v9 = [v4 supportsCapability:v8];

  if (v9)
  {
    uint64_t v7 = [(NTKZeusAnalogFaceBundle *)self _spring2020DefaultFacesForDevice:v4];
    goto LABEL_7;
  }
  if ([v4 isRunningGraceOrLater])
  {
    uint64_t v7 = [(NTKZeusAnalogFaceBundle *)self _graceDefaultFacesForDevice:v4];
    goto LABEL_7;
  }
  v12 = [v4 nrDevice];
  if (v12
    && +[CLKDevice NRProductVersionForNRDevice:v12] >> 9 < 0x281)
  {
    uint64_t v13 = [(NTKZeusAnalogFaceBundle *)self _legacyDefaultFacesForDevice:v4];
  }
  else
  {
    uint64_t v13 = [(NTKZeusAnalogFaceBundle *)self _gloryEDefaultFacesForDevice:v4];
  }
  v10 = (void *)v13;

LABEL_8:

  return v10;
}

- (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    for (unsigned int i = 0; i != 3; ++i)
    {
      uint64_t v7 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      if (v7)
      {
        id v8 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
        [v7 selectOption:v8 forCustomEditMode:11 slot:0];

        if (i >= 3) {
          uint64_t v9 = 102;
        }
        else {
          uint64_t v9 = i + 3000;
        }
        v10 = +[NTKZeusColorEditOption optionWithColor:v9 forDevice:v4];
        [v7 selectOption:v10 forCustomEditMode:10 slot:0];

        v11 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
        [v7 selectOption:v11 forCustomEditMode:13 slot:0];

        v12 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
        [v7 _setFaceGalleryComplicationTypesForSlots:v12];

        [v5 addObject:v7];
      }
    }
  }
  uint64_t v13 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
  v14 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
  [v13 selectOption:v14 forCustomEditMode:11 slot:0];

  v15 = +[NTKZeusColorEditOption optionWithColor:102 forDevice:v4];
  [v13 selectOption:v15 forCustomEditMode:10 slot:0];

  v16 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
  [v13 selectOption:v16 forCustomEditMode:13 slot:0];

  v17 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
  [v13 _setFaceGalleryComplicationTypesForSlots:v17];

  if (v13) {
    [v5 addObject:v13];
  }
  v33 = v13;
  if ([v4 isExplorer])
  {
    v18 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
    v19 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
    [v18 selectOption:v19 forCustomEditMode:11 slot:0];

    v20 = +[NTKZeusColorEditOption optionWithColor:104 forDevice:v4];
    [v18 selectOption:v20 forCustomEditMode:10 slot:0];

    v21 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
    [v18 selectOption:v21 forCustomEditMode:13 slot:0];

    v22 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
    [v18 _setFaceGalleryComplicationTypesForSlots:v22];

    if (v18) {
      [v5 addObject:v18];
    }
  }
  v23 = &qword_33010;
  for (unsigned int j = -1; j != 3; ++j)
  {
    v25 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
    if (v25)
    {
      v26 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
      [v25 selectOption:v26 forCustomEditMode:11 slot:0];

      if (j > 2) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = *v23;
      }
      v28 = +[NTKZeusColorEditOption optionWithColor:7 forDevice:v4];
      [v25 selectOption:v28 forCustomEditMode:10 slot:0];

      v29 = +[NTKZeusAnalogStyleEditOption optionWithStyle:v27 forDevice:v4];
      [v25 selectOption:v29 forCustomEditMode:13 slot:0];

      v30 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
      [v25 _setFaceGalleryComplicationTypesForSlots:v30];

      [v5 addObject:v25];
    }

    ++v23;
  }
  id v31 = [v5 copy];

  return v31;
}

- (id)_gloryEDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unsigned int v6 = [(NTKZeusAnalogFaceBundle *)self _legacyDefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v6];

  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    uint64_t v7 = 0;
    char v8 = 1;
    uint64_t v9 = 3003;
    do
    {
      char v10 = v8;
      v11 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      if (v11)
      {
        v12 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
        [v11 selectOption:v12 forCustomEditMode:11 slot:0];

        uint64_t v13 = +[NTKZeusColorEditOption optionWithColor:v9 forDevice:v4];
        [v11 selectOption:v13 forCustomEditMode:10 slot:0];

        v14 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
        [v11 selectOption:v14 forCustomEditMode:13 slot:0];

        v15 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
        [v11 _setFaceGalleryComplicationTypesForSlots:v15];

        [v5 insertObject:v11 atIndex:v7];
      }

      char v8 = 0;
      uint64_t v9 = 3004;
      uint64_t v7 = 1;
    }
    while ((v10 & 1) != 0);
  }
  id v16 = [v5 copy];

  return v16;
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unsigned int v6 = +[NSMutableArray array];
  if ([v4 isZeusBlack]) {
    [v6 addObject:&off_3EAE0];
  }
  if ([v4 isExplorer]) {
    [v6 addObject:&off_3EAF8];
  }
  [v6 addObjectsFromArray:&off_3F870];
  if ([v4 deviceCategory] != (char *)&dword_0 + 1) {
    [v6 addObjectsFromArray:&off_3F888];
  }
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      char v8 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      if (v8)
      {
        uint64_t v9 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
        [v8 selectOption:v9 forCustomEditMode:11 slot:0];

        char v10 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
        [v8 selectOption:v10 forCustomEditMode:13 slot:0];

        v11 = [v6 objectAtIndexedSubscript:v7];
        v12 = +[NTKZeusColorEditOption optionWithColor:forDevice:](NTKZeusColorEditOption, "optionWithColor:forDevice:", [v11 integerValue], v4);
        [v8 selectOption:v12 forCustomEditMode:10 slot:0];

        uint64_t v13 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
        [v8 _setFaceGalleryComplicationTypesForSlots:v13];

        [v5 addObject:v8];
      }

      ++v7;
    }
    while ((unint64_t)[v6 count] > v7);
  }
  id v14 = [v5 copy];

  return v14;
}

- (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_231C;
  v11[3] = &unk_3C888;
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v5;
  id v7 = v5;
  char v8 = objc_retainBlock(v11);
  if ([v6 deviceCategory] != (char *)&dword_0 + 1)
  {
    ((void (*)(void *, uint64_t))v8[2])(v8, 3010);
    ((void (*)(void *, uint64_t))v8[2])(v8, 3011);
  }
  ((void (*)(void *, uint64_t))v8[2])(v8, 7);
  if ([v6 isExplorer]) {
    ((void (*)(void *, uint64_t))v8[2])(v8, 104);
  }
  ((void (*)(void *, uint64_t))v8[2])(v8, 102);
  id v9 = [v7 copy];

  return v9;
}

- (id)_fall2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_25A8;
  v10[3] = &unk_3C888;
  id v11 = v4;
  id v12 = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v13;
  id v6 = v4;
  id v7 = objc_retainBlock(v10);
  ((void (*)(void *, uint64_t))v7[2])(v7, 7);
  ((void (*)(void *, uint64_t))v7[2])(v7, 3013);
  ((void (*)(void *, uint64_t))v7[2])(v7, 3014);
  ((void (*)(void *, uint64_t))v7[2])(v7, 3015);
  ((void (*)(void *, uint64_t))v7[2])(v7, 3016);
  ((void (*)(void *, uint64_t))v7[2])(v7, 3012);
  ((void (*)(void *, uint64_t))v7[2])(v7, 3017);
  id v8 = [v5 copy];

  return v8;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTop;
  v4[1] = NTKComplicationSlotBottom;
  v5[0] = &off_3F8A0;
  v5[1] = &off_3F8B8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    id v6 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
    id v7 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v4];
    [v6 selectOption:v7 forCustomEditMode:11 slot:0];

    id v8 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
    [v6 selectOption:v8 forCustomEditMode:13 slot:0];

    id v9 = +[NTKZeusColorEditOption optionWithColor:3010 forDevice:v4];
    [v6 selectOption:v9 forCustomEditMode:10 slot:0];

    char v10 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
    [v6 _setFaceGalleryComplicationTypesForSlots:v10];

    if (v6) {
      [v5 addObject:v6];
    }
    id v11 = [v6 copy];
    id v12 = +[NTKZeusColorEditOption optionWithColor:3011 forDevice:v4];
    [v11 selectOption:v12 forCustomEditMode:10 slot:0];

    if (v11) {
      [v5 addObject:v11];
    }
  }
  id v13 = [v5 copy];

  return v13;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([v4 deviceCategory] == (char *)&dword_0 + 1)
  {
    id v5 = 0;
  }
  else
  {
    if ([v4 isZeusBlack])
    {
      id v6 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      id v7 = +[NTKZeusColorEditOption optionWithColor:3009 forDevice:v4];
      [v6 selectOption:v7 forCustomEditMode:10 slot:0];

      id v8 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
      [v6 _setFaceGalleryComplicationTypesForSlots:v8];

      if (v6)
      {
        id v22 = v6;
        id v5 = +[NSArray arrayWithObjects:&v22 count:1];
      }
      else
      {
        id v5 = &__NSArray0__struct;
      }
    }
    else
    {
      +[NSMutableArray array];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_2C9C;
      v20[3] = &unk_3C8B0;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = v21;
      id v9 = objc_retainBlock(v20);
      char v10 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      id v11 = +[NTKZeusColorEditOption optionWithColor:3006 forDevice:v4];
      [v10 selectOption:v11 forCustomEditMode:10 slot:0];

      id v12 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
      [v10 _setFaceGalleryComplicationTypesForSlots:v12];

      ((void (*)(void *, void *))v9[2])(v9, v10);
      id v13 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      id v14 = +[NTKZeusColorEditOption optionWithColor:3007 forDevice:v4];
      [v13 selectOption:v14 forCustomEditMode:10 slot:0];

      v15 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
      [v13 _setFaceGalleryComplicationTypesForSlots:v15];

      ((void (*)(void *, void *))v9[2])(v9, v13);
      id v16 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
      v17 = +[NTKZeusColorEditOption optionWithColor:3008 forDevice:v4];
      [v16 selectOption:v17 forCustomEditMode:10 slot:0];

      v18 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
      [v16 _setFaceGalleryComplicationTypesForSlots:v18];

      ((void (*)(void *, void *))v9[2])(v9, v16);
      id v5 = [v6 copy];
    }
  }

  return v5;
}

- (id)heroGloryEDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  [(NTKZeusAnalogFaceBundle *)self heroLegacyDefaultFacesForDevice:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (unsigned int i = 0; i != v7; unsigned int i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "faceStyle", (void)v14) == (char *)&dword_C + 2)
        {
          id v11 = +[NTKZeusColorEditOption optionWithColor:3003 forDevice:v4];
          [v10 selectOption:v11 forCustomEditMode:10 slot:0];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v12 = [v5 copy];

  return v12;
}

- (id)heroLegacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([v4 deviceCategory] == (char *)&dword_0 + 1)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = +[NTKFace defaultFaceOfStyle:14 forDevice:v4];
    id v7 = +[NTKZeusColorEditOption optionWithColor:3000 forDevice:v4];
    [v6 selectOption:v7 forCustomEditMode:10 slot:0];

    uint64_t v8 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
    [v6 selectOption:v8 forCustomEditMode:13 slot:0];

    id v9 = [(NTKZeusAnalogFaceBundle *)self complicationTypesBySlot];
    [v6 _setFaceGalleryComplicationTypesForSlots:v9];

    if (v6)
    {
      id v11 = v6;
      id v5 = +[NSArray arrayWithObjects:&v11 count:1];
    }
    else
    {
      id v5 = &__NSArray0__struct;
    }
  }

  return v5;
}

@end