@interface NTKPoodleFaceBundle
+ (id)identifier;
- (BOOL)isHardwareSpecific;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKPoodleFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

+ (id)identifier
{
  return @"com.apple.NTKPoodleFaceBundle";
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
  v6 = +[NTKPoodleFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (BOOL)isHardwareSpecific
{
  return 1;
}

- (id)galleryTitle
{
  return +[NTKPoodleFaceBundle localizedStringForKey:@"FACE_STYLE_POODLE_IN_TITLE_CASE" comment:@"Hermès Circulaire"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = a3;
  v16 = +[NSMutableArray array];
  v4 = [(id)objc_opt_class() identifier];
  +[NTKPoodleColorEditOption _orderedValuesForDevice:v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        signed int v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) intValue];
        v10 = [(id)objc_opt_class() analyticsIdentifier];
        v11 = +[NTKPoodleFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v10 forDevice:v3 initCustomization:0];

        if (v11)
        {
          v12 = +[NTKPoodleColorEditOption optionWithPoodleColor:v9 forDevice:v3];
          [v11 selectOption:v12 forCustomEditMode:10 slot:0];
          [v16 addObject:v11];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  id v13 = [v16 copy];

  return v13;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKPoodleFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:800];
    v10 = v9;
    if (v9)
    {
      id v12 = v9;
      uint64_t v7 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      uint64_t v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

@end