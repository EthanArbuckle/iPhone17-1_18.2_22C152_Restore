@interface NTKColorAnalogFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_allStyleFacesForDevice:(id)a3 colorOptions:(id)a4;
- (id)_allStyleFacesForDevice:(id)a3 colors:(id)a4;
- (id)_colorOptionFromColorValue:(id)a3 device:(id)a4;
- (id)_gloryBDefaultFacesForDevice:(id)a3;
- (id)_gloryEDefaultFacesForDevice:(id)a3;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_legacyDefaultFacesForDevice:(id)a3;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)_spring2020DefaultFacesForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGloryBDefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKColorAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_10B88;
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
    uint64_t v4 = 203;
  }
  else {
    uint64_t v4 = 3;
  }
  v5 = +[NTKColorAnalogFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKColorAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_COLOR_ANALOG_IN_TITLE_CASE" comment:@"Color"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKColorAnalogFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = +[NSMutableArray array];
    v7 = +[NTKFaceColorEditOption optionsRestrictedByDevice:v4];
    if (v7) {
      [v6 addObjectsFromArray:v7];
    }
    v8 = [(NTKColorAnalogFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    if (v8) {
      [v6 addObjectsFromArray:v8];
    }
    v9 = [(NTKColorAnalogFaceBundle *)self _allStyleFacesForDevice:v4 colorOptions:v6];
  }
  else
  {
    v9 = [(NTKColorAnalogFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }

  return v9;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = [(NTKColorAnalogFaceBundle *)self _spring2020DefaultFacesForDevice:v4];
  }
  else if ([v4 isRunningGraceOrLater])
  {
    uint64_t v7 = [(NTKColorAnalogFaceBundle *)self _graceDefaultFacesForDevice:v4];
  }
  else
  {
    unsigned int v8 = [v4 nrDeviceVersion];
    if (v8 <= 0x501FF)
    {
      if (v8 <= 0x500FF) {
        [(NTKColorAnalogFaceBundle *)self _legacyDefaultFacesForDevice:v4];
      }
      else {
      uint64_t v7 = [(NTKColorAnalogFaceBundle *)self _gloryBDefaultFacesForDevice:v4];
      }
    }
    else
    {
      uint64_t v7 = [(NTKColorAnalogFaceBundle *)self _gloryEDefaultFacesForDevice:v4];
    }
  }
  v9 = (void *)v7;

  return v9;
}

- (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unsigned int v6 = objc_opt_class();
  uint64_t v7 = +[NTKFaceColorEditOption standardColorsWithColorClass:v6 forDevice:v4];
  id v8 = [v7 mutableCopy];

  v9 = [v6 optionsRestrictedByDevice:v4];
  id v10 = [v9 mutableCopy];

  if ([v10 count]) {
    uint64_t v11 = 9;
  }
  else {
    uint64_t v11 = 8;
  }
  do
  {
    v12 = [(NTKColorAnalogFaceBundle *)self defaultFaceForDevice:v4];
    if (v12)
    {
      v13 = +[NTKColorAnalogStyleEditOption optionWithStyle:0 forDevice:v4];
      [v12 selectOption:v13 forCustomEditMode:15 slot:0];

      v14 = [(NTKColorAnalogFaceBundle *)self complicationTypesBySlot];
      [v12 _setFaceGalleryComplicationTypesForSlots:v14];

      if ([v12 _faceGalleryDidUpdateFaceColorForColorEditOptionClass:v6 availableHardwareSpecificColorOptions:v10 availableColorOptions:v8])objc_msgSend(v5, "addObject:", v12); {
    }
      }

    --v11;
  }
  while (v11);
  id v15 = [v5 copy];

  return v15;
}

- (id)heroGloryBDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    unsigned int v6 = [(NTKColorAnalogFaceBundle *)self defaultFaceForDevice:v4];
    uint64_t v7 = +[NTKColorAnalogStyleEditOption optionWithStyle:2 forDevice:v4];
    [v6 selectOption:v7 forCustomEditMode:15 slot:0];

    id v8 = +[NTKFaceColorEditOption optionWithFaceColor:6 forDevice:v4];
    [v6 selectOption:v8 forCustomEditMode:10 slot:0];

    [v6 _setFaceGalleryComplicationTypesForSlots:&__NSDictionary0__struct];
    [v5 addObject:v6];
  }
  v9 = [(NTKColorAnalogFaceBundle *)self defaultFaceForDevice:v4];
  id v10 = +[NTKColorAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
  [v9 selectOption:v10 forCustomEditMode:15 slot:0];

  uint64_t v11 = +[NTKFaceColorEditOption optionWithFaceColor:6 forDevice:v4];
  [v9 selectOption:v11 forCustomEditMode:10 slot:0];

  [v9 _setFaceGalleryComplicationTypesForSlots:&__NSDictionary0__struct];
  [v5 addObject:v9];
  id v12 = [v5 copy];

  return v12;
}

- (id)_gloryBDefaultFacesForDevice:(id)a3
{
  return [(NTKColorAnalogFaceBundle *)self _allStyleFacesForDevice:a3 colors:&off_111B0];
}

- (id)_gloryEDefaultFacesForDevice:(id)a3
{
  return [(NTKColorAnalogFaceBundle *)self _allStyleFacesForDevice:a3 colors:&off_111C8];
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  return [(NTKColorAnalogFaceBundle *)self _allStyleFacesForDevice:a3 colors:&off_111E0];
}

- (id)_spring2020DefaultFacesForDevice:(id)a3
{
  CGAffineTransform *(__cdecl **v6)(CGAffineTransform *__return_ptr __struct_ptr, CGFloat);
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  CGAffineTransform *(__cdecl **v15)(CGAffineTransform *__return_ptr __struct_ptr, CGFloat);
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NTKColorAnalogFaceBundle *v21;
  id v22;
  void *v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  unsigned char v28[128];
  uint64_t vars8;

  id v4 = a3;
  v23 = objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = [&off_111F8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v22)
  {
    uint64_t v5 = *(void *)v25;
    unsigned int v6 = &CGAffineTransformMakeRotation_ptr;
    v21 = self;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(&off_111F8);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v9 = [(NTKColorAnalogFaceBundle *)self defaultFaceForDevice:v4];
        id v10 = objc_msgSend(v6[113], "optionWithFaceColor:forDevice:", objc_msgSend(v8, "unsignedIntegerValue"), v4);
        uint64_t v11 = [(NTKColorAnalogFaceBundle *)self complicationTypesBySlot];
        [v9 _setFaceGalleryComplicationTypesForSlots:v11];

        [v9 selectOption:v10 forCustomEditMode:10 slot:0];
        if ([v4 deviceCategory] != (char *)&dword_0 + 1)
        {
          id v12 = +[NTKColorAnalogStyleEditOption optionWithStyle:2 forDevice:v4];
          [v9 selectOption:v12 forCustomEditMode:15 slot:0];
          if (v9) {
            [v23 addObject:v9];
          }
        }
        v13 = [v9 copy];
        v14 = +[NTKColorAnalogStyleEditOption optionWithStyle:1 forDevice:v4];
        [v13 selectOption:v14 forCustomEditMode:15 slot:0];
        if (v13) {
          [v23 addObject:v13];
        }
        if ([v4 deviceCategory] == (char *)&dword_0 + 1)
        {
          id v15 = v6;
          v16 = v5;
          v17 = [v9 copy];
          v18 = +[NTKColorAnalogStyleEditOption optionWithStyle:0 forDevice:v4];
          [v17 selectOption:v18 forCustomEditMode:15 slot:0];
          if (v17) {
            [v23 addObject:v17];
          }

          uint64_t v5 = v16;
          unsigned int v6 = v15;
          self = v21;
        }
      }
      v22 = [&off_111F8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v22);
  }
  v19 = [v23 copy];

  return v19;
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
        v13 = +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorEditOption, "optionWithFaceColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15), v6);
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

- (id)_allStyleFacesForDevice:(id)a3 colors:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NTKColorAnalogFaceBundle *)self _colorOptionFromColorValue:a4 device:v6];
  id v8 = [(NTKColorAnalogFaceBundle *)self _allStyleFacesForDevice:v6 colorOptions:v7];

  return v8;
}

- (id)_allStyleFacesForDevice:(id)a3 colorOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 addObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }
  v27 = v9;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v28 = v8;
  id obj = [v8 copy];
  id v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
        long long v18 = [(NTKColorAnalogFaceBundle *)self defaultFaceForDevice:v5];
        if (v18)
        {
          v19 = [(NTKColorAnalogFaceBundle *)self complicationTypesBySlot];
          [v18 _setFaceGalleryComplicationTypesForSlots:v19];

          [v18 selectOption:v17 forCustomEditMode:10 slot:0];
          v20 = (char *)+[NTKColorAnalogStyleEditOption numberOfOptionsForDevice:v5];
          if ((uint64_t)v20 >= 1)
          {
            v21 = v20;
            for (k = 0; k != v21; ++k)
            {
              id v23 = [v18 copy];
              v24 = +[NTKColorAnalogStyleEditOption optionAtIndex:k forDevice:v5];
              [v23 selectOption:v24 forCustomEditMode:15 slot:0];

              [v7 addObject:v23];
            }
          }
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v15);
  }

  id v25 = [v7 copy];

  return v25;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v5[0] = &off_11210;
  v5[1] = &off_11228;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v5[2] = &off_11240;
  v5[3] = &off_11258;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

@end