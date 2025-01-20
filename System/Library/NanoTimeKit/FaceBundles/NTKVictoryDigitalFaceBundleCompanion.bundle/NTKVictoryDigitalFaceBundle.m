@interface NTKVictoryDigitalFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_colorOptionsFromColorValues:(id)a3 device:(id)a4;
- (id)_fall2020DefaultFacesForDevice:(id)a3;
- (id)_fullscreenDefaultFacesForDevice:(id)a3 colorOptions:(id)a4;
- (id)_fullscreenDefaultFacesForDevice:(id)a3 colors:(id)a4;
- (id)_gloryDefaultFacesForDevice:(id)a3;
- (id)_gloryEDefaultFacesForDevice:(id)a3;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_legacyDefaultFacesForDevice:(id)a3;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)_spring2020DefaultFacesForDevice:(id)a3;
- (id)complications;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKVictoryDigitalFaceBundle

- (id)legacyFaceStyle
{
  return &off_10D30;
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
  if (NTKShowBlueRidgeUI()) {
    uint64_t v4 = 220;
  }
  else {
    uint64_t v4 = 20;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKVictoryDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_VICTORY_DIGITAL_IN_TITLE_CASE" comment:@"Victory Digital"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKVictoryDigitalFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKVictoryDigitalFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v7 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colorOptions:v6];
  }
  else
  {
    v7 = [(NTKVictoryDigitalFaceBundle *)self _legacyGalleryFacesForDevice:v4];
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
    uint64_t v7 = [(NTKVictoryDigitalFaceBundle *)self _fall2020DefaultFacesForDevice:v4];
LABEL_7:
    v10 = (void *)v7;
    goto LABEL_8;
  }
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
  unsigned int v9 = [v4 supportsCapability:v8];

  if (v9)
  {
    uint64_t v7 = [(NTKVictoryDigitalFaceBundle *)self _spring2020DefaultFacesForDevice:v4];
    goto LABEL_7;
  }
  if ([v4 isRunningGraceOrLater])
  {
    uint64_t v7 = [(NTKVictoryDigitalFaceBundle *)self _graceDefaultFacesForDevice:v4];
    goto LABEL_7;
  }
  v12 = [v4 nrDevice];
  if (v12
    && +[CLKDevice NRProductVersionForNRDevice:v12] >> 9 < 0x281)
  {
    if ([v4 isRunningGloryGMOrLater]) {
      [(NTKVictoryDigitalFaceBundle *)self _gloryDefaultFacesForDevice:v4];
    }
    else {
    uint64_t v13 = [(NTKVictoryDigitalFaceBundle *)self _legacyDefaultFacesForDevice:v4];
    }
  }
  else
  {
    uint64_t v13 = [(NTKVictoryDigitalFaceBundle *)self _gloryEDefaultFacesForDevice:v4];
  }
  v10 = (void *)v13;

LABEL_8:

  return v10;
}

- (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if (+[NTKVictoryDigitalStyleEditOption numberOfOptionsForDevice:v4])
  {
    uint64_t v6 = NTKComplicationSlotBottom;
    uint64_t v7 = 3;
    do
    {
      id v8 = [(NTKVictoryDigitalFaceBundle *)self defaultFaceForDevice:v4];
      if (v8)
      {
        unsigned int v9 = +[NTKVictoryDigitalStyleEditOption optionWithStyle:v7 forDevice:v4];
        [v8 selectOption:v9 forCustomEditMode:13 slot:0];

        v10 = [(NTKVictoryDigitalFaceBundle *)self complications];
        [v8 _setFaceGalleryComplicationTypesForSlots:v10];

        v11 = +[NTKVictoryAppLauncher complication];
        [v8 setComplication:v11 forSlot:v6];

        [v5 addObject:v8];
      }

      id v12 = +[NTKVictoryDigitalStyleEditOption numberOfOptionsForDevice:v4];
      unint64_t v13 = v7 - 2;
      ++v7;
    }
    while ((unint64_t)v12 > v13);
  }
  id v14 = [v5 copy];

  return v14;
}

- (id)_gloryDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption gloryVictoryColors];
  uint64_t v6 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colors:v5];

  return v6;
}

- (id)_gloryEDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption gloryEVictoryColors];
  uint64_t v6 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colors:v5];

  return v6;
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption graceVictoryColors];
  uint64_t v6 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colors:v5];

  return v6;
}

- (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption spring2020VictoryColors];
  uint64_t v6 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colors:v5];

  return v6;
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
        unint64_t v13 = +[NTKVictoryDigitalColorEditOption optionWithVictoryColor:forDevice:](NTKVictoryDigitalColorEditOption, "optionWithVictoryColor:forDevice:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15), v6);
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

- (id)_fall2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKVictoryColorEditOption fall2020VictoryColors];
  id v6 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v4 colors:v5];

  return v6;
}

- (id)_fullscreenDefaultFacesForDevice:(id)a3 colors:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NTKVictoryDigitalFaceBundle *)self _colorOptionsFromColorValues:a4 device:v6];
  id v8 = [(NTKVictoryDigitalFaceBundle *)self _fullscreenDefaultFacesForDevice:v6 colorOptions:v7];

  return v8;
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
    id v12 = 0;
    uint64_t v13 = NTKComplicationSlotBottom;
    do
    {
      id v14 = [(NTKVictoryDigitalFaceBundle *)self defaultFaceForDevice:v6];
      if (v14)
      {
        long long v15 = +[NTKVictoryDigitalStyleEditOption optionWithStyle:3 forDevice:v6];
        [v14 selectOption:v15 forCustomEditMode:13 slot:0];

        uint64_t v16 = [v7 objectAtIndexedSubscript:v11];

        [v14 selectOption:v16 forCustomEditMode:10 slot:0];
        long long v17 = [(NTKVictoryDigitalFaceBundle *)self complications];
        [v14 _setFaceGalleryComplicationTypesForSlots:v17];

        long long v18 = +[NTKVictoryAppLauncher complication];
        [v14 setComplication:v18 forSlot:v13];

        [v8 addObject:v14];
        id v12 = (void *)v16;
      }

      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    id v12 = 0;
  }
  id v19 = [v8 copy];

  return v19;
}

- (id)complications
{
  v4[0] = NTKComplicationSlot1;
  v4[1] = NTKComplicationSlot2;
  v5[0] = &off_10F90;
  v5[1] = &off_10FA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

@end