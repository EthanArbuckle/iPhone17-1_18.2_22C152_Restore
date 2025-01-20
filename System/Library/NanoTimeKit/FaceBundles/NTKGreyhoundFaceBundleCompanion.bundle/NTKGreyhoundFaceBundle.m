@interface NTKGreyhoundFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKGreyhoundFaceBundle

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
  v6 = +[NTKGreyhoundFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKGreyhoundFaceBundle localizedStringForKey:@"GREYHOUND_FACE_NAME_IN_TITLE_CASE" comment:@"Greyhound"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v25 = [(NTKGreyhoundFaceBundle *)self defaultFaceForDevice:v4];
  if ([v25 deviceSupportsPigmentEditOption])
  {
    v29 = [(NTKGreyhoundFaceBundle *)self galleryDefaultPigmentOptionsForDevice:v4];
  }
  else
  {
    v5 = +[NTKGreyhoundColorEditOption optionWithCaliforniaColor:3000 forDevice:v4];
    v35[0] = v5;
    v6 = +[NTKGreyhoundColorEditOption optionWithCaliforniaColor:3002 forDevice:v4];
    v35[1] = v6;
    v7 = +[NTKGreyhoundColorEditOption optionWithCaliforniaColor:3004 forDevice:v4];
    v35[2] = v7;
    v29 = +[NSArray arrayWithObjects:v35 count:3];
  }
  v28 = +[NSMutableArray array];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned int v9 = [v4 supportsCapability:v8];

  if (v9)
  {
    v26 = [&off_160A0 arrayByAddingObject:&off_158F0];
  }
  else
  {
    v26 = &off_160A0;
  }
  if ([&off_16088 count])
  {
    unint64_t v10 = 0;
    do
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obj = v26;
      id v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v31;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v16 = [(id)objc_opt_class() identifier];
            v17 = [(id)objc_opt_class() analyticsIdentifier];
            v18 = +[NTKGreyhoundFace bundledFaceWithIdentifier:v16 analyticsIdentifier:v17 forDevice:v4 initCustomization:0];

            if (v18)
            {
              v19 = [v29 objectAtIndexedSubscript:v10];
              v20 = [&off_16088 objectAtIndexedSubscript:v10];
              v21 = +[NTKGreyhoundTypefaceEditOption optionWithTypeface:forDevice:](NTKGreyhoundTypefaceEditOption, "optionWithTypeface:forDevice:", [v20 unsignedIntValue], v4);

              v22 = +[NTKGreyhoundStyleEditOption optionWithStyle:forDevice:](NTKGreyhoundStyleEditOption, "optionWithStyle:forDevice:", [v15 unsignedIntValue], v4);
              [v18 selectOption:v19 forCustomEditMode:10 slot:0];
              [v18 selectOption:v21 forCustomEditMode:13 slot:0];
              [v18 selectOption:v22 forCustomEditMode:15 slot:0];
              [v28 addObject:v18];
            }
          }
          id v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v12);
      }

      ++v10;
    }
    while ((unint64_t)[&off_16088 count] > v10);
  }
  id v23 = [v28 copy];

  return v23;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    id v8 = [(NTKGreyhoundFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:700];
    unint64_t v10 = v9;
    if (v9)
    {
      id v12 = v9;
      v7 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

@end