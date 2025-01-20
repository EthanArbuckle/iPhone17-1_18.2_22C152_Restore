@interface NTKPrideDigitalFaceBundle
+ (id)identifier;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_analogFaceForDevice:(id)a3;
- (id)_facesFromSortableFaces:(id)a3;
- (id)_fall2021GalleryFacesForDevice:(id)a3;
- (id)_gloryFDefaultFacesForDevice:(id)a3;
- (id)_legacyDefaultFacesForDevice:(id)a3;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)_pride2020DefaultFacesForDevice:(id)a3;
- (id)_pride2021DefaultFacesForDevice:(id)a3;
- (id)_sortedGalleryFacesForDevice:(id)a3;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroGloryFDefaultFacesForDevice:(id)a3;
- (id)heroPride2020DefaultFacesForDevice:(id)a3;
- (id)legacyFaceStyle;
- (id)prideFacesForDevice:(id)a3;
@end

@implementation NTKPrideDigitalFaceBundle

- (id)legacyFaceStyle
{
  return &off_258D0;
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

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)defaultFaceForDevice:(id)a3
{
  return +[NTKPrideDigitalFace defaultFaceOfStyle:26 forDevice:a3];
}

- (id)_analogFaceForDevice:(id)a3
{
  id v3 = a3;
  if (NTKShowBlueRidgeUI()) {
    uint64_t v4 = 233;
  }
  else {
    uint64_t v4 = 33;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKPrideDigitalFaceBundle localizedStringForKey:@"PRIDE_GALLERY_ROW_IN_TITLE_CASE" table:@"PrideDigital-Companion" comment:@"Pride"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1087B4F0-9D95-407D-98BC-195A5FB6EDF5"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = [(NTKPrideDigitalFaceBundle *)self _sortedGalleryFacesForDevice:v4];
  }
  else
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1087B4F0-9D95-407D-98BC-195A5FB6EDF5"];
    unsigned int v9 = [v4 supportsCapability:v8];

    if (v9) {
      [(NTKPrideDigitalFaceBundle *)self _fall2021GalleryFacesForDevice:v4];
    }
    else {
    uint64_t v7 = [(NTKPrideDigitalFaceBundle *)self _legacyGalleryFacesForDevice:v4];
    }
  }
  v10 = (void *)v7;

  return v10;
}

- (id)_sortedGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  unsigned int v6 = +[NTKFaceBundleManager sharedManager];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_E764;
  v14 = &unk_24860;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateFaceBundlesOnDevice:v8 includingLegacy:1 withBlock:&v11];

  unsigned int v9 = -[NTKPrideDigitalFaceBundle _facesFromSortableFaces:](self, "_facesFromSortableFaces:", v7, v11, v12, v13, v14);

  return v9;
}

- (id)_facesFromSortableFaces:(id)a3
{
  id v3 = [a3 sortedArrayUsingSelector:"compare:"];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "face", (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (id)prideFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([(objc_class *)[(NTKPrideDigitalFaceBundle *)self faceClass] isRestrictedForDevice:v4])
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    id v6 = +[NTKFace defaultFaceOfStyle:26 forDevice:v4];
    id v7 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v4];
    [v6 selectOption:v7 forCustomEditMode:15 slot:0];

    uint64_t v8 = [(NTKPrideDigitalFaceBundle *)self _analogFaceForDevice:v4];
    unsigned int v9 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v4];
    [v8 selectOption:v9 forCustomEditMode:12 slot:0];

    v10 = +[NTKPrideAnalogShapeEditOption optionWithStyle:forDevice:](NTKPrideAnalogShapeEditOption, "optionWithStyle:forDevice:", [v4 deviceCategory] != (char *)&dword_0 + 1, v4);
    [v8 selectOption:v10 forCustomEditMode:15 slot:0];

    id v11 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v6 priority:600];
    id v12 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:700];
    v14[0] = v11;
    v14[1] = v12;
    id v5 = +[NSArray arrayWithObjects:v14 count:2];
  }

  return v5;
}

- (id)_fall2021GalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  if (+[NTKPrideDigitalFace isAvailableForDevice:v4])
  {
    id v5 = objc_opt_new();
    if ([v4 isLuxo])
    {
      id v6 = +[NTKFaceBundleManager sharedManager];
      id v7 = +[NTKPrideWeaveFaceBundle identifier];
      uint64_t v8 = [v6 faceBundleForBundleIdentifier:v7 onDevice:v4];

      unsigned int v9 = [v8 prideFacesForDevice:v4];
      v10 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v9];
      [v5 addObjectsFromArray:v10];
    }
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
    unsigned int v12 = [v4 supportsCapability:v11];

    if (v12)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_EDD8;
      v21[3] = &unk_24888;
      id v22 = v5;
      long long v13 = objc_retainBlock(v21);
      long long v14 = +[NTKFace defaultFaceOfStyle:26 forDevice:v4];
      long long v15 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v4];
      [v14 selectOption:v15 forCustomEditMode:15 slot:0];

      ((void (*)(void *, void *))v13[2])(v13, v14);
      long long v16 = [(NTKPrideDigitalFaceBundle *)self _analogFaceForDevice:v4];
      v17 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v4];
      [v16 selectOption:v17 forCustomEditMode:12 slot:0];

      v18 = +[NTKPrideAnalogShapeEditOption optionWithStyle:forDevice:](NTKPrideAnalogShapeEditOption, "optionWithStyle:forDevice:", [v4 deviceCategory] != (char *)&dword_0 + 1, v4);
      [v16 selectOption:v18 forCustomEditMode:15 slot:0];

      ((void (*)(void *, void *))v13[2])(v13, v16);
    }
    v19 = [(NTKPrideDigitalFaceBundle *)self _gloryFDefaultFacesForDevice:v4];
    [v5 addObjectsFromArray:v19];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v4 = a3;
  if (+[NTKPrideDigitalFace isAvailableForDevice:v4])
  {
    id v5 = [(NTKPrideDigitalFaceBundle *)self _pride2021DefaultFacesForDevice:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = +[NTKFace defaultFaceOfStyle:26 forDevice:a3];
  id v5 = [(NTKPrideDigitalFaceBundle *)self complicationTypesBySlot];
  [v4 _setFaceGalleryComplicationTypesForSlots:v5];

  if (v4)
  {
    uint64_t v8 = v4;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_gloryFDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_F274;
  v26 = &unk_24888;
  id v22 = (id)objc_opt_new();
  id v27 = v22;
  id v5 = objc_retainBlock(&v23);
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  unsigned int v7 = [v4 supportsCapability:v6];

  uint64_t v8 = +[NTKFace defaultFaceOfStyle:26 forDevice:v4];
  unsigned int v9 = +[NTKPrideStyleEditOption optionWithStyle:1 forDevice:v4];
  [v8 selectOption:v9 forCustomEditMode:15 slot:0];

  ((void (*)(void ***, void *))v5[2])(v5, v8);
  v10 = +[NTKFace defaultFaceOfStyle:26 forDevice:v4];
  id v11 = +[NTKPrideStyleEditOption optionWithStyle:0 forDevice:v4];
  [v10 selectOption:v11 forCustomEditMode:15 slot:0];

  unsigned int v12 = [(NTKPrideDigitalFaceBundle *)self complicationTypesBySlot];
  [v10 _setFaceGalleryComplicationTypesForSlots:v12];

  ((void (*)(void ***, void *))v5[2])(v5, v10);
  long long v13 = [(NTKPrideDigitalFaceBundle *)self _analogFaceForDevice:v4];
  long long v14 = +[NTKPrideAnalogShapeEditOption optionWithStyle:0 forDevice:v4];
  [v13 selectOption:v14 forCustomEditMode:15 slot:0];

  if (v7)
  {
    long long v15 = +[NTKPrideStyleEditOption optionWithStyle:1 forDevice:v4];
    [v13 selectOption:v15 forCustomEditMode:12 slot:0];
  }
  ((void (*)(void ***, void *))v5[2])(v5, v13);
  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    long long v16 = [(NTKPrideDigitalFaceBundle *)self _analogFaceForDevice:v4];
    v17 = +[NTKPrideAnalogShapeEditOption optionWithStyle:1 forDevice:v4];
    [v16 selectOption:v17 forCustomEditMode:15 slot:0];

    if (v7)
    {
      v18 = +[NTKPrideStyleEditOption optionWithStyle:1 forDevice:v4];
      [v16 selectOption:v18 forCustomEditMode:12 slot:0];
    }
    ((void (*)(void ***, void *))v5[2])(v5, v16);
  }
  v19 = v22;
  id v20 = objc_msgSend(v22, "copy", v22, v23, v24, v25, v26);

  return v20;
}

- (id)_pride2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_F6F8;
  v38[3] = &unk_24888;
  id v5 = (id)objc_opt_new();
  id v39 = v5;
  id v6 = objc_retainBlock(v38);
  if ([v4 collectionType] == (char *)&dword_4 + 2)
  {
    unsigned int v7 = +[NTKFaceBundleManager sharedManager];
    uint64_t v8 = [v7 faceBundleForFaceStyle:19 onDevice:v4];

    if (v8)
    {
      unsigned int v9 = [v8 prideFacesForDevice:v4];
      if ([v9 count])
      {
        v10 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v9];
        [v5 addObjectsFromArray:v10];
      }
    }
  }
  id v11 = +[NTKFace defaultFaceOfStyle:26 forDevice:v4];
  unsigned int v12 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v4];
  [v11 selectOption:v12 forCustomEditMode:15 slot:0];

  v36 = v11;
  ((void (*)(void *, void *))v6[2])(v6, v11);
  long long v13 = [(NTKPrideDigitalFaceBundle *)self _analogFaceForDevice:v4];
  long long v14 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v4];
  [v13 selectOption:v14 forCustomEditMode:12 slot:0];

  long long v15 = +[NTKPrideAnalogShapeEditOption optionWithStyle:forDevice:](NTKPrideAnalogShapeEditOption, "optionWithStyle:forDevice:", [v4 deviceCategory] != (char *)&dword_0 + 1, v4);
  [v13 selectOption:v15 forCustomEditMode:15 slot:0];

  v35 = v13;
  ((void (*)(void *, void *))v6[2])(v6, v13);
  if ([v4 deviceCategory] != (char *)&dword_0 + 1)
  {
    long long v16 = +[NTKFaceBundleManager sharedManager];
    v17 = [v16 faceBundleForFaceStyle:39 onDevice:v4];

    v18 = [v17 prideFacesForDevice:v4];
    if (v18)
    {
      v19 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v18];
      [v5 addObjectsFromArray:v19];
    }
  }
  v37 = v6;
  id v20 = +[NTKFaceBundleManager sharedManager];
  v21 = [v20 faceBundleForFaceStyle:37 onDevice:v4];

  id v22 = [v21 prideFacesForDevice:v4];
  if (v22)
  {
    v23 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v22];
    [v5 addObjectsFromArray:v23];
  }
  uint64_t v24 = +[NTKFaceBundleManager sharedManager];
  v25 = [v24 faceBundleForFaceStyle:38 onDevice:v4];

  v26 = [v25 prideFacesForDevice:v4];
  if (v26)
  {
    id v27 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v26];
    [v5 addObjectsFromArray:v27];
  }
  v28 = +[NTKFaceBundleManager sharedManager];
  v29 = [v28 faceBundleForFaceStyle:41 onDevice:v4];

  v30 = [v29 prideFacesForDevice:v4];
  if (v30)
  {
    v31 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v30];
    [v5 addObjectsFromArray:v31];
  }
  v32 = [(NTKPrideDigitalFaceBundle *)self _gloryFDefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v32];

  id v33 = [v5 copy];

  return v33;
}

- (id)_pride2021DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 deviceCategory] == (char *)&dword_0 + 3)
  {
    id v6 = +[NTKFaceBundleManager sharedManager];
    unsigned int v7 = [v6 faceBundleForBundleIdentifier:@"com.apple.NTKProteusFaceBundle" onDevice:v4];

    uint64_t v8 = [v7 prideFacesForDevice:v4];
    unsigned int v9 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v8];
    [v5 addObjectsFromArray:v9];
  }
  if ([v4 isLuxo])
  {
    v10 = +[NTKFaceBundleManager sharedManager];
    id v11 = +[NTKPrideWeaveFaceBundle identifier];
    unsigned int v12 = [v10 faceBundleForBundleIdentifier:v11 onDevice:v4];

    long long v13 = [v12 prideFacesForDevice:v4];
    long long v14 = [(NTKPrideDigitalFaceBundle *)self _facesFromSortableFaces:v13];
    [v5 addObjectsFromArray:v14];
  }
  long long v15 = [(NTKPrideDigitalFaceBundle *)self _pride2020DefaultFacesForDevice:v4];
  [v5 addObjectsFromArray:v15];

  return v5;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottom;
  v5[0] = &off_25B18;
  v5[1] = &off_25B30;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (id)heroGloryFDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKPrideDigitalFace defaultFaceOfStyle:26 forDevice:v3];
  id v5 = +[NTKPrideStyleEditOption optionWithStyle:1 forDevice:v3];

  [v4 selectOption:v5 forCustomEditMode:15 slot:0];
  if (v4)
  {
    uint64_t v8 = v4;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)heroPride2020DefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKPrideDigitalFace defaultFaceOfStyle:26 forDevice:v3];
  id v5 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v3];

  [v4 selectOption:v5 forCustomEditMode:15 slot:0];
  if (v4)
  {
    uint64_t v8 = v4;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

@end