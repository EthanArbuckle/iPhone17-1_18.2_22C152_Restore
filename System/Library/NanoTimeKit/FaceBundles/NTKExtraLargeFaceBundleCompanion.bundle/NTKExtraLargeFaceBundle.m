@interface NTKExtraLargeFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDefaultPigmentOptionsForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)legacyFaceStyle;
@end

@implementation NTKExtraLargeFaceBundle

- (id)legacyFaceStyle
{
  return &off_10780;
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
    uint64_t v4 = 212;
  }
  else {
    uint64_t v4 = 12;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKExtraLargeFaceBundle localizedStringForKey:@"EXTRA_LARGE_FACE_NAME_IN_TITLE_CASE" comment:@"X-Large"];
}

- (id)galleryDefaultPigmentOptionsForDevice:(id)a3
{
  id v4 = a3;
  if (NTKShowGossamerUI()
    && (id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"], v6 = objc_msgSend(v4, "supportsCapability:", v5), v5, (v6 & 1) == 0))
  {
    v8 = [(objc_class *)[(NTKExtraLargeFaceBundle *)self faceClass] pigmentFaceDomain];
    v9 = [v8 stringByAppendingString:@"-Gossamer"];

    v10 = +[NSBundle bundleForClass:[(NTKExtraLargeFaceBundle *)self faceClass]];
    v11 = +[NTKPigmentEditOptionStore sharedInstance];
    v7 = [v11 defaultGalleryColorsForDomain:v9 bundle:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKExtraLargeFaceBundle;
    v7 = [(NTKExtraLargeFaceBundle *)&v13 galleryDefaultPigmentOptionsForDevice:v4];
  }

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = +[NSMutableArray array];
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned int v8 = [v5 supportsCapability:v7];

  if (!v8) {
    goto LABEL_31;
  }
  v46[0] = ntk_seasons_fall2024_denim;
  v46[1] = ntk_seasons_fall2024_chartreuse;
  v46[2] = ntk_seasons_fall2024_lakeGreen;
  v46[3] = ntk_seasons_fall2024_ultramarine;
  v46[4] = ntk_seasons_fall2024_magenta;
  v46[5] = ntk_seasons_fall2024_darkTaupe;
  v9 = +[NSArray arrayWithObjects:v46 count:6];
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [0 count]);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_4D68;
  v43[3] = &unk_10410;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v44 = v10;
  [v9 enumerateObjectsUsingBlock:v43];
  id v11 = [v10 copy];
  int v12 = NTKShowGossamerUI();
  char v13 = v12;
  if (v12)
  {
    v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
    v15 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:v5];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_4DD0;
    v39[3] = &unk_10438;
    v39[4] = self;
    id v40 = v5;
    id v41 = v15;
    id v16 = v14;
    id v42 = v16;
    id v17 = v15;
    [v11 enumerateObjectsUsingBlock:v39];
    v18 = v42;
    id v3 = v16;
  }
  if ((v13 & 1) == 0)
  {
LABEL_31:
    if (NTKShowGossamerUI())
    {
      v38.receiver = self;
      v38.super_class = (Class)NTKExtraLargeFaceBundle;
      v19 = [(NTKExtraLargeFaceBundle *)&v38 galleryFacesForDevice:v5];
      id v20 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:v5];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v21 = v19;
      id v22 = [v21 countByEnumeratingWithState:&v34 objects:v45 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v35;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v21);
            }
            objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "selectOption:forCustomEditMode:slot:", v20, 17, 0, (void)v34);
          }
          id v23 = [v21 countByEnumeratingWithState:&v34 objects:v45 count:16];
        }
        while (v23);
      }
      id v3 = v21;
    }
    else
    {
      v26 = objc_opt_class();
      id v21 = [(NTKExtraLargeFaceBundle *)self defaultFaceForDevice:v5];
      if ([v21 deviceSupportsPigmentEditOption]) {
        [(NTKExtraLargeFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v5];
      }
      else {
      v27 = +[NTKFaceColorEditOption standardColorsWithColorClass:v26 forDevice:v5];
      }
      id v20 = [v27 mutableCopy];

      v28 = [v26 optionsRestrictedByDevice:v5];
      id v29 = [v28 mutableCopy];

      if ([v29 count]) {
        uint64_t v30 = 9;
      }
      else {
        uint64_t v30 = 8;
      }
      do
      {
        v31 = [(NTKExtraLargeFaceBundle *)self defaultFaceForDevice:v5];
        v32 = v31;
        if (v31
          && [v31 _faceGalleryDidUpdateFaceColorForColorEditOptionClass:v26 availableHardwareSpecificColorOptions:v29 availableColorOptions:v20])
        {
          [v6 addObject:v32];
        }

        --v30;
      }
      while (v30);
      id v3 = [v6 copy];
    }
  }

  return v3;
}

@end