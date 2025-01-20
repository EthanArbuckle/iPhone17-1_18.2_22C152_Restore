@interface NTKUltraCubeFaceBundle
+ (id)identifier;
+ (id)logCategoryName;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_galleryFaceForDevice:(id)a3;
- (id)_randomSampleResourceDirectoryPath;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitleForDevice:(id)a3;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKUltraCubeFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

+ (id)identifier
{
  return @"com.apple.NTKUltraCubeFaceBundle";
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
  v4 = [(id)objc_opt_class() identifier];
  v5 = [(id)objc_opt_class() analyticsIdentifier];
  v6 = +[NTKUltraCubeFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

+ (id)logCategoryName
{
  return @"photos";
}

- (id)galleryDescriptionForDevice:(id)a3
{
  if (+[NTKUltraCubeFace isColorEffectFeatureEnabledForDevice:a3])
  {
    CFStringRef v3 = @"FACE_STYLE_ULTRACUBE_GALLERY_DESCRIPTION";
  }
  else
  {
    CFStringRef v3 = @"FACE_STYLE_ULTRACUBE_GALLERY_DESCRIPTION_PRE2K22";
  }
  v4 = +[NTKUltraCubeFaceBundle localizedStringForKey:v3 comment:@"Portrait"];

  return v4;
}

- (id)_galleryFaceForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() identifier];
  v6 = [(id)objc_opt_class() analyticsIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_80C8;
  v9[3] = &unk_48D70;
  v9[4] = self;
  v7 = +[NTKUltraCubeFace bundledFaceWithIdentifier:v5 analyticsIdentifier:v6 forDevice:v4 initCustomization:v9];

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  uint64_t v3 = [(NTKUltraCubeFaceBundle *)self _galleryFaceForDevice:a3];
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

- (id)galleryTitleForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F27862F8-5179-4DB0-9F89-179EA7CB4011"];
  unsigned int v5 = [v3 supportsCapability:v4];

  char v6 = _os_feature_enabled_impl();
  if (v5 && (v6 & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"FACE_STYLE_ULTRACUBE_IN_TITLE_CASE" comment:@"Portrait"];
  }

  return v7;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = &__NSArray0__struct;
  }
  else
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
    unsigned __int8 v9 = [v4 supportsCapability:v8];

    if (v9)
    {
      uint64_t v10 = 200;
    }
    else if ([v4 deviceCategory] == (char *)&dword_0 + 3)
    {
      uint64_t v10 = 200;
    }
    else
    {
      uint64_t v10 = 100;
    }
    v11 = [(NTKUltraCubeFaceBundle *)self _galleryFaceForDevice:v4];
    id v12 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v11 priority:v10];
    v13 = v12;
    if (v12)
    {
      id v15 = v12;
      uint64_t v7 = +[NSArray arrayWithObjects:&v15 count:1];
    }
    else
    {
      uint64_t v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

- (id)_randomSampleResourceDirectoryPath
{
  v23 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v23 bundlePath];
  v21 = [v22 stringByAppendingPathComponent:@"SampleResourceDirectories"];
  uint64_t v2 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  id v3 = +[NSFileManager defaultManager];
  v31[0] = NSURLNameKey;
  v31[1] = NSURLIsDirectoryKey;
  id v4 = +[NSArray arrayWithObjects:v31 count:2];
  v19 = v3;
  v20 = (void *)v2;
  id v5 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:5 errorHandler:&stru_48DB0];

  unsigned __int8 v6 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        [v12 getResourceValue:&v25 forKey:NSURLIsDirectoryKey error:0];
        id v13 = v25;
        if ([v13 BOOLValue])
        {
          id v24 = 0;
          [v12 getResourceValue:&v24 forKey:NSURLNameKey error:0];
          id v14 = v24;
          if ([v14 hasPrefix:@"SampleImage"]) {
            [v6 addObject:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  unint64_t v15 = (unint64_t)[v6 count];
  if (v15)
  {
    v16 = [v6 objectAtIndexedSubscript:arc4random() % v15];
    v17 = v21;
    unint64_t v15 = [v21 stringByAppendingPathComponent:v16];
  }
  else
  {
    v17 = v21;
  }

  return (id)v15;
}

@end