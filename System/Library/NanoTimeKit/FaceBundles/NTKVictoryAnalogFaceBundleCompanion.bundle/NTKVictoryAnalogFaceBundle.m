@interface NTKVictoryAnalogFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_colorOptionsFromColorValues:(id)a3 device:(id)a4;
- (id)_fall2020DefaultFacesForDevice:(id)a3;
- (id)_fullscreenDefaultFacesForDevice:(id)a3 colorOptions:(id)a4;
- (id)_gloryDefaultFacesForDevice:(id)a3;
- (id)_gloryEDefaultFacesForDevice:(id)a3;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_legacyDefaultFacesForDevice:(id)a3;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)_spring2020DefaultFacesForDevice:(id)a3;
- (id)_spring2021DefaultFacesForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroLegacyDefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
- (id)spring2021VictoryColors;
@end

@implementation NTKVictoryAnalogFaceBundle

- (id)legacyFaceStyle
{
  return &off_C840;
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
    uint64_t v4 = 219;
  }
  else {
    uint64_t v4 = 19;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)heroLegacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKVictoryAnalogFaceBundle *)self defaultFaceForDevice:v4];
  v6 = +[NTKVictoryAnalogColorEditOption optionWithVictoryColor:21 forDevice:v4];
  [v5 selectOption:v6 forCustomEditMode:10 slot:0];

  v7 = +[NTKVictoryAnalogStyleEditOption optionWithStyle:4 forDevice:v4];

  [v5 selectOption:v7 forCustomEditMode:11 slot:0];
  v8 = [(NTKVictoryAnalogFaceBundle *)self complicationTypesBySlot];
  [v5 _setFaceGalleryComplicationTypesForSlots:v8];

  if (v5)
  {
    v11 = v5;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v5[0] = &off_CB50;
  v5[1] = &off_CB68;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (id)galleryTitle
{
  return +[NTKVictoryAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_VICTORY_ANALOG_IN_TITLE_CASE" comment:@"Victory Analog"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKVictoryAnalogFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKVictoryAnalogFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];
  }
  else
  {
    v7 = [(NTKVictoryAnalogFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }

  return v7;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C814BC07-AE2D-4061-9C1E-D97BED9DAC22"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _spring2021DefaultFacesForDevice:v4];
LABEL_9:
    v12 = (void *)v7;
    goto LABEL_10;
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v9 = [v4 supportsCapability:v8];

  if (v9)
  {
    uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fall2020DefaultFacesForDevice:v4];
    goto LABEL_9;
  }
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  unsigned int v11 = [v4 supportsCapability:v10];

  if (v11)
  {
    uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _spring2020DefaultFacesForDevice:v4];
    goto LABEL_9;
  }
  if ([v4 isRunningGraceOrLater])
  {
    uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _graceDefaultFacesForDevice:v4];
    goto LABEL_9;
  }
  v14 = [v4 nrDevice];
  if (v14
    && +[CLKDevice NRProductVersionForNRDevice:v14] >> 9 < 0x281)
  {
    if ([v4 isRunningGloryGMOrLater]) {
      [(NTKVictoryAnalogFaceBundle *)self _gloryDefaultFacesForDevice:v4];
    }
    else {
    uint64_t v15 = [(NTKVictoryAnalogFaceBundle *)self _legacyDefaultFacesForDevice:v4];
    }
  }
  else
  {
    uint64_t v15 = [(NTKVictoryAnalogFaceBundle *)self _gloryEDefaultFacesForDevice:v4];
  }
  v12 = (void *)v15;

LABEL_10:

  return v12;
}

- (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if (+[NTKVictoryAnalogStyleEditOption numberOfOptionsForDevice:v4])
  {
    unint64_t v6 = 0;
    uint64_t v7 = NTKComplicationSlotBottomCenter;
    uint64_t v8 = 3;
    do
    {
      unsigned int v9 = [(NTKVictoryAnalogFaceBundle *)self defaultFaceForDevice:v4];
      if (v9)
      {
        if ([v4 isExplorer]) {
          uint64_t v10 = 100;
        }
        else {
          uint64_t v10 = 1;
        }
        unsigned int v11 = +[NTKVictoryAnalogColorEditOption optionWithVictoryColor:v10 forDevice:v4];
        [v9 selectOption:v11 forCustomEditMode:10 slot:0];

        v12 = +[NTKVictoryAnalogStyleEditOption optionWithStyle:v8 forDevice:v4];
        [v9 selectOption:v12 forCustomEditMode:11 slot:0];

        v13 = [(NTKVictoryAnalogFaceBundle *)self complicationTypesBySlot];
        [v9 _setFaceGalleryComplicationTypesForSlots:v13];

        v14 = +[NTKVictoryAppLauncher complication];
        [v9 setComplication:v14 forSlot:v7];

        [v5 addObject:v9];
      }

      ++v6;
      --v8;
    }
    while ((unint64_t)+[NTKVictoryAnalogStyleEditOption numberOfOptionsForDevice:v4] > v6);
  }
  id v15 = [v5 copy];

  return v15;
}

- (id)_gloryDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption gloryVictoryColors];
  unint64_t v6 = [(NTKVictoryAnalogFaceBundle *)self _colorOptionsFromColorValues:v5 device:v4];
  uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];

  return v7;
}

- (id)_gloryEDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption gloryEVictoryColors];
  unint64_t v6 = [(NTKVictoryAnalogFaceBundle *)self _colorOptionsFromColorValues:v5 device:v4];
  uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];

  return v7;
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption graceVictoryColors];
  unint64_t v6 = [(NTKVictoryAnalogFaceBundle *)self _colorOptionsFromColorValues:v5 device:v4];
  uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];

  return v7;
}

- (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption spring2020VictoryColors];
  unint64_t v6 = [(NTKVictoryAnalogFaceBundle *)self _colorOptionsFromColorValues:v5 device:v4];
  uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];

  return v7;
}

- (id)_spring2021DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKVictoryAnalogFaceBundle *)self spring2021VictoryColors];
  unint64_t v6 = [(NTKVictoryAnalogFaceBundle *)self _colorOptionsFromColorValues:v5 device:v4];
  uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];

  return v7;
}

- (id)spring2021VictoryColors
{
  v2 = +[NTKVictoryColorEditOption fall2020VictoryColors];
  id v3 = [v2 arrayByAddingObjectsFromArray:&off_CB98];
  id v4 = [&off_CB80 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (id)_fall2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption fall2020VictoryColors];
  unint64_t v6 = [(NTKVictoryAnalogFaceBundle *)self _colorOptionsFromColorValues:v5 device:v4];
  uint64_t v7 = [(NTKVictoryAnalogFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];

  return v7;
}

- (id)_colorOptionsFromColorValues:(id)a3 device:(id)a4
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
        v13 = +[NTKVictoryAnalogColorEditOption optionWithVictoryColor:forDevice:](NTKVictoryAnalogColorEditOption, "optionWithVictoryColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15), v6);
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

- (id)_fullscreenDefaultFacesForDevice:(id)a3 colorOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [v7 count];
  if ((unint64_t)v9 >= 8) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = (uint64_t)v9;
  }
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = NTKComplicationSlotBottomCenter;
    do
    {
      v13 = [(NTKVictoryAnalogFaceBundle *)self defaultFaceForDevice:v6];
      if (v13)
      {
        v14 = +[NTKVictoryAnalogStyleEditOption optionWithStyle:3 forDevice:v6];
        [v13 selectOption:v14 forCustomEditMode:11 slot:0];

        long long v15 = [v7 objectAtIndexedSubscript:v11];
        [v13 selectOption:v15 forCustomEditMode:10 slot:0];

        long long v16 = [(NTKVictoryAnalogFaceBundle *)self complicationTypesBySlot];
        [v13 _setFaceGalleryComplicationTypesForSlots:v16];

        long long v17 = +[NTKVictoryAppLauncher complication];
        [v13 setComplication:v17 forSlot:v12];

        [v8 addObject:v13];
      }

      ++v11;
    }
    while (v10 != v11);
  }
  id v18 = [v8 copy];

  return v18;
}

@end