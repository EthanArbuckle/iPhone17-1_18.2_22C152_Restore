@interface NTKCaliforniaFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_californiaFacesWithColorOptions:(id)a3 device:(id)a4;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGraceDefaultFacesForDevice:(id)a3;
- (id)heroSpring2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKCaliforniaFaceBundle

- (id)legacyFaceStyle
{
  return &off_1ACD8;
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
  return +[NTKCaliforniaFace defaultFaceOfStyle:39 forDevice:a3];
}

- (id)galleryTitle
{
  return +[NTKCaliforniaFaceBundle localizedStringForKey:@"FACE_STYLE_CALIFORNIA_IN_TITLE_CASE" comment:@"California"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKCaliforniaFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v6 = [(NTKCaliforniaFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
    v7 = [(NTKCaliforniaFaceBundle *)self _californiaFacesWithColorOptions:v6 device:v4];
  }
  else
  {
    v8 = +[NTKCaliforniaColorEditOption optionWithCaliforniaColor:3004 forDevice:v4];
    v12[0] = v8;
    v9 = +[NTKCaliforniaColorEditOption optionWithCaliforniaColor:3003 forDevice:v4];
    v12[1] = v9;
    v10 = +[NSArray arrayWithObjects:v12 count:2];

    v7 = [(NTKCaliforniaFaceBundle *)self _californiaFacesWithColorOptions:v10 device:v4];
  }

  return v7;
}

- (id)_californiaFacesWithColorOptions:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableArray array];
  if ([v7 deviceCategory] != (char *)&dword_0 + 1
    && [v7 isRunningGraceOrLater])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_3D7C;
    v22[3] = &unk_18650;
    id v23 = v7;
    v24 = self;
    id v25 = v8;
    v9 = objc_retainBlock(v22);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          ((void (*)(void *, uint64_t, uint64_t, uint64_t))v9[2])(v9, v15, 2, 1);
          ((void (*)(void *, uint64_t, void, uint64_t))v9[2])(v9, v15, 0, 1);
          ((void (*)(void *, uint64_t, uint64_t, uint64_t))v9[2])(v9, v15, -1, 1);
          ((void (*)(void *, uint64_t, uint64_t, void))v9[2])(v9, v15, -1, 0);
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }
  }
  id v16 = objc_msgSend(v8, "copy", (void)v18);

  return v16;
}

- (id)heroGraceDefaultFacesForDevice:(id)a3
{
  uint64_t v3 = +[NTKCaliforniaFace defaultFaceOfStyle:39 forDevice:a3];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v7 = v3;
    v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)heroSpring2020DefaultFacesForDevice:(id)a3
{
  id v4 = +[NTKCaliforniaFace defaultFaceOfStyle:39 forDevice:a3];
  v5 = [(NTKCaliforniaFaceBundle *)self complicationTypesBySlot];
  [v4 _setFaceGalleryComplicationTypesForSlots:v5];

  if (v4)
  {
    v8 = v4;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v5[0] = &off_1B540;
  v5[1] = &off_1B558;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v5[2] = &off_1B570;
  v5[3] = &off_1B588;
  v4[4] = NTKComplicationSlotSubdialTop;
  v4[5] = NTKComplicationSlotSubdialBottom;
  v5[4] = &off_1B5A0;
  v5[5] = &off_1B5B8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];

  return v2;
}

@end