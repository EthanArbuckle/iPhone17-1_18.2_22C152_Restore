@interface NTKPlumeriaFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
- (id)prideFacesForDevice:(id)a3;
@end

@implementation NTKPlumeriaFaceBundle

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
  v4 = [(id)objc_opt_class() identifier];
  v5 = [(id)objc_opt_class() analyticsIdentifier];
  v6 = +[NTKPlumeriaFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return 0;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKPlumeriaFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:1600];
    id v11 = v9;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v7;
}

- (id)galleryDescriptionText
{
  return 0;
}

- (id)galleryFacesForDevice:(id)a3
{
  uint64_t v3 = [(NTKPlumeriaFaceBundle *)self defaultFaceForDevice:a3];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v7 = v3;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)prideFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([(objc_class *)[(NTKPlumeriaFaceBundle *)self faceClass] isRestrictedForDevice:v4])
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    unsigned __int8 v6 = [(id)objc_opt_class() identifier];
    uint64_t v7 = [(id)objc_opt_class() analyticsIdentifier];
    v8 = +[NTKPlumeriaFace bundledFaceWithIdentifier:v6 analyticsIdentifier:v7 forDevice:v4 initCustomization:0];

    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:1100];
    id v11 = v9;
    id v5 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v5;
}

@end