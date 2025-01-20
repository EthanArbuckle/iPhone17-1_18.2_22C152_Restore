@interface NTKOlympusFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_colorOptionFromColorValue:(unint64_t)a3 device:(id)a4;
- (id)_galleryFacesForColorOptions:(id)a3 device:(id)a4;
- (id)_graceDefaultFacesForDevice:(id)a3;
- (id)_hunterDefaultFacesForDevice:(id)a3;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)_olympusFaceWithStyle:(unint64_t)a3 dial:(unint64_t)a4 colorOption:(id)a5 complicationTypesBySlot:(id)a6 forDevice:(id)a7;
- (id)_olympusFacesWithColorOption:(id)a3 complicationTypesBySlot:(id)a4 forDevice:(id)a5;
- (id)_spring2020DefaultFacesForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
- (id)spring2020ComplicationTypesBySlot;
@end

@implementation NTKOlympusFaceBundle

- (id)legacyFaceStyle
{
  return &off_C7C0;
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
  return +[NTKOlympusFace defaultFaceOfStyle:35 forDevice:a3];
}

- (id)galleryTitle
{
  return +[NTKOlympusFaceBundle localizedStringForKey:@"FACE_STYLE_OLYMPUS_IN_TITLE_CASE" comment:@"Olympus"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKOlympusFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKOlympusFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v7 = [(NTKOlympusFaceBundle *)self _galleryFacesForColorOptions:v6 device:v4];
  }
  else
  {
    v7 = [(NTKOlympusFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }

  return v7;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  v5 = +[NTKFace defaultFaceOfStyle:35 forDevice:v3];
  v6 = +[NTKOlympusStyleEditOption optionWithStyle:0 forDevice:v3];
  [v5 selectOption:v6 forCustomEditMode:15 slot:0];

  v7 = +[NTKOlympusDialShapeEditOption optionWithShape:0 forDevice:v3];
  [v5 selectOption:v7 forCustomEditMode:12 slot:0];

  [v4 addObject:v5];
  v8 = +[NTKFace defaultFaceOfStyle:35 forDevice:v3];
  v9 = +[NTKOlympusStyleEditOption optionWithStyle:2 forDevice:v3];
  [v8 selectOption:v9 forCustomEditMode:15 slot:0];

  v10 = +[NTKOlympusDialShapeEditOption optionWithShape:1 forDevice:v3];
  [v8 selectOption:v10 forCustomEditMode:12 slot:0];

  [v4 addObject:v8];
  v11 = +[NTKFace defaultFaceOfStyle:35 forDevice:v3];
  v12 = +[NTKOlympusStyleEditOption optionWithStyle:3 forDevice:v3];
  [v11 selectOption:v12 forCustomEditMode:15 slot:0];

  v13 = +[NTKOlympusDialShapeEditOption optionWithShape:0 forDevice:v3];

  [v11 selectOption:v13 forCustomEditMode:12 slot:0];
  [v4 addObject:v11];
  id v14 = [v4 copy];

  return v14;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  v5 = +[NTKFace defaultFaceOfStyle:35 forDevice:v3];
  v6 = +[NTKOlympusColorEditOption optionWithOlympusColor:26 forDevice:v3];
  [v5 selectOption:v6 forCustomEditMode:10 slot:0];

  v7 = +[NTKOlympusStyleEditOption optionWithStyle:0 forDevice:v3];
  [v5 selectOption:v7 forCustomEditMode:15 slot:0];

  v8 = +[NTKOlympusDialShapeEditOption optionWithShape:0 forDevice:v3];
  [v5 selectOption:v8 forCustomEditMode:12 slot:0];

  v17[0] = NTKComplicationSlotTopLeft;
  v17[1] = NTKComplicationSlotTopRight;
  v18[0] = &off_CA18;
  v18[1] = &off_CA30;
  v17[2] = NTKComplicationSlotBottomLeft;
  v17[3] = NTKComplicationSlotBottomRight;
  v18[2] = &off_CA48;
  v18[3] = &off_CA60;
  v17[4] = NTKComplicationSlotBezel;
  v18[4] = &off_CA78;
  v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  [v5 _setFaceGalleryComplicationTypesForSlots:v9];

  [v4 addObject:v5];
  id v10 = [v5 copy];
  v11 = +[NTKOlympusStyleEditOption optionWithStyle:2 forDevice:v3];
  [v10 selectOption:v11 forCustomEditMode:15 slot:0];

  v12 = +[NTKOlympusDialShapeEditOption optionWithShape:1 forDevice:v3];
  [v10 selectOption:v12 forCustomEditMode:12 slot:0];

  [v4 addObject:v10];
  id v13 = [v5 copy];
  id v14 = +[NTKOlympusStyleEditOption optionWithStyle:3 forDevice:v3];

  [v13 selectOption:v14 forCustomEditMode:15 slot:0];
  [v4 addObject:v13];
  id v15 = [v4 copy];

  return v15;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = [(NTKOlympusFaceBundle *)self _hunterDefaultFacesForDevice:v4];
  }
  else
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
    unsigned int v9 = [v4 supportsCapability:v8];

    if (v9) {
      [(NTKOlympusFaceBundle *)self _spring2020DefaultFacesForDevice:v4];
    }
    else {
    uint64_t v7 = [(NTKOlympusFaceBundle *)self _graceDefaultFacesForDevice:v4];
    }
  }
  id v10 = (void *)v7;

  return v10;
}

- (id)_graceDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKOlympusFaceBundle *)self complicationTypesBySlot];
  unsigned int v6 = +[NSMutableArray array];
  uint64_t v7 = [(NTKOlympusFaceBundle *)self _colorOptionFromColorValue:7 device:v4];
  id v8 = [(NTKOlympusFaceBundle *)self _olympusFacesWithColorOption:v7 complicationTypesBySlot:v5 forDevice:v4];
  [v6 addObjectsFromArray:v8];

  unsigned int v9 = [(NTKOlympusFaceBundle *)self _colorOptionFromColorValue:15 device:v4];
  id v10 = [(NTKOlympusFaceBundle *)self _olympusFacesWithColorOption:v9 complicationTypesBySlot:v5 forDevice:v4];

  [v6 addObjectsFromArray:v10];
  id v11 = [v6 copy];

  return v11;
}

- (id)_galleryFacesForColorOptions:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKOlympusFaceBundle *)self spring2020ComplicationTypesBySlot];
  unsigned int v9 = +[NSMutableArray array];
  if ([v6 count])
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = [v6 objectAtIndexedSubscript:v10];
      v12 = [(NTKOlympusFaceBundle *)self _olympusFacesWithColorOption:v11 complicationTypesBySlot:v8 forDevice:v7];
      [v9 addObjectsFromArray:v12];

      v10 += 3;
    }
    while ((unint64_t)[v6 count] > v10);
  }
  id v13 = [v9 copy];

  return v13;
}

- (id)_hunterDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKOlympusFaceBundle *)self spring2020ComplicationTypesBySlot];
  id v6 = +[NSMutableArray array];
  id v7 = [(NTKOlympusFaceBundle *)self _colorOptionFromColorValue:31 device:v4];
  id v8 = [(NTKOlympusFaceBundle *)self _olympusFacesWithColorOption:v7 complicationTypesBySlot:v5 forDevice:v4];
  [v6 addObjectsFromArray:v8];

  unsigned int v9 = [(NTKOlympusFaceBundle *)self _colorOptionFromColorValue:34 device:v4];
  unint64_t v10 = [(NTKOlympusFaceBundle *)self _olympusFacesWithColorOption:v9 complicationTypesBySlot:v5 forDevice:v4];

  [v6 addObjectsFromArray:v10];
  id v11 = [v6 copy];

  return v11;
}

- (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKOlympusFaceBundle *)self spring2020ComplicationTypesBySlot];
  id v6 = +[NSMutableArray array];
  id v7 = [(NTKOlympusFaceBundle *)self _colorOptionFromColorValue:26 device:v4];
  id v8 = [(NTKOlympusFaceBundle *)self _olympusFacesWithColorOption:v7 complicationTypesBySlot:v5 forDevice:v4];
  [v6 addObjectsFromArray:v8];

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_6270;
  v18 = &unk_C398;
  v19 = self;
  id v20 = v4;
  id v21 = v5;
  id v22 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = v4;
  v12 = objc_retainBlock(&v15);
  ((void (*)(void ***, void))v12[2])(v12, 0);
  ((void (*)(void ***, uint64_t))v12[2])(v12, 2);
  ((void (*)(void ***, uint64_t))v12[2])(v12, 3);
  id v13 = objc_msgSend(v9, "copy", v15, v16, v17, v18, v19);

  return v13;
}

- (id)_colorOptionFromColorValue:(unint64_t)a3 device:(id)a4
{
  return +[NTKOlympusColorEditOption optionWithOlympusColor:a3 forDevice:a4];
}

- (id)_olympusFacesWithColorOption:(id)a3 complicationTypesBySlot:(id)a4 forDevice:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  +[NSMutableArray array];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_651C;
  id v20 = &unk_C3C0;
  id v21 = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v24;
  id v12 = v9;
  id v13 = v8;
  id v14 = objc_retainBlock(&v17);
  ((void (*)(void ***, void, void, id))v14[2])(v14, 0, 0, v10);
  ((void (*)(void ***, void, uint64_t, id))v14[2])(v14, 0, 1, v10);
  ((void (*)(void ***, uint64_t, void, id))v14[2])(v14, 2, 0, v10);
  ((void (*)(void ***, uint64_t, uint64_t, id))v14[2])(v14, 2, 1, v10);
  ((void (*)(void ***, uint64_t, void, id))v14[2])(v14, 3, 0, v10);
  ((void (*)(void ***, uint64_t, uint64_t, id))v14[2])(v14, 3, 1, v10);

  id v15 = objc_msgSend(v11, "copy", v17, v18, v19, v20, v21);

  return v15;
}

- (id)_olympusFaceWithStyle:(unint64_t)a3 dial:(unint64_t)a4 colorOption:(id)a5 complicationTypesBySlot:(id)a6 forDevice:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[NTKFace defaultFaceOfStyle:35 forDevice:v11];
  [v14 selectOption:v13 forCustomEditMode:10 slot:0];

  id v15 = +[NTKOlympusStyleEditOption optionWithStyle:a3 forDevice:v11];
  [v14 selectOption:v15 forCustomEditMode:15 slot:0];

  uint64_t v16 = +[NTKOlympusDialShapeEditOption optionWithShape:a4 forDevice:v11];

  [v14 selectOption:v16 forCustomEditMode:12 slot:0];
  [v14 _setFaceGalleryComplicationTypesForSlots:v12];

  return v14;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v5[0] = &off_CA90;
  v5[1] = &off_CAA8;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v5[2] = &off_CAC0;
  v5[3] = &off_CAD8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

- (id)spring2020ComplicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v5[0] = &off_CAF0;
  v5[1] = &off_CB08;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v5[2] = &off_CB20;
  v5[3] = &off_CB38;
  void v4[4] = NTKComplicationSlotBezel;
  void v5[4] = &off_CB50;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];

  return v2;
}

@end