@interface NTKSalmonFaceBundle
+ (id)analyticsIdentifier;
+ (id)identifier;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_legacyGalleryFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKSalmonFaceBundle

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

+ (id)analyticsIdentifier
{
  return @"salmon";
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
  v6 = +[NTKSalmonFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  return [a1 localizedStringForKey:a3 table:@"NTKSalmonLocalizable" comment:a4];
}

- (id)galleryTitle
{
  return +[NTKSalmonFaceBundle localizedStringForKey:@"ALASKAN_SALMON_FACE_NAME_IN_TITLE_CASE" comment:@"GMT"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(NTKSalmonFaceBundle *)self defaultFaceForDevice:v4];
  if ([v5 deviceSupportsPigmentEditOption])
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKSalmonFaceBundle;
    uint64_t v6 = [(NTKSalmonFaceBundle *)&v9 galleryFacesForDevice:v4];
  }
  else
  {
    uint64_t v6 = [(NTKSalmonFaceBundle *)self _legacyGalleryFacesForDevice:v4];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_legacyGalleryFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [&off_3ACE0 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(&off_3ACE0);
        }
        objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [(id)objc_opt_class() identifier];
        v11 = [(id)objc_opt_class() analyticsIdentifier];
        v12 = +[NTKSalmonFace bundledFaceWithIdentifier:v10 analyticsIdentifier:v11 forDevice:v3 initCustomization:0];

        if (v12)
        {
          v13 = +[NTKSalmonColorEditOption optionWithColor:forDevice:](NTKSalmonColorEditOption, "optionWithColor:forDevice:", [v9 unsignedIntValue], v3);
          [v12 selectOption:v13 forCustomEditMode:10 slot:0];

          [v4 addObject:v12];
        }
      }
      id v6 = [&off_3ACE0 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  id v14 = [v4 copy];

  return v14;
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
    v8 = [(NTKSalmonFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:500];
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