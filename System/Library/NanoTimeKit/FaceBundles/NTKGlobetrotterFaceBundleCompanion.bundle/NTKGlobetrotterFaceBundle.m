@interface NTKGlobetrotterFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKGlobetrotterFaceBundle

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
  v6 = +[NTKGlobetrotterFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKGlobetrotterFaceBundle localizedStringForKey:@"FACE_STYLE_GLOBETROTTER_IN_TITLE_CASE" comment:@"Globetrotter"];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  if ([v4 supportsCapability:v5])
  {
  }
  else
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v7 = [v4 supportsCapability:v6];

    if (v7)
    {
      if ([v4 deviceCategory] == (char *)&dword_0 + 3) {
        uint64_t v8 = 100;
      }
      else {
        uint64_t v8 = 200;
      }
      v9 = [(NTKGlobetrotterFaceBundle *)self defaultFaceForDevice:v4];
      id v10 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v9 priority:v8];
      v11 = v10;
      if (v10)
      {
        id v14 = v10;
        v12 = +[NSArray arrayWithObjects:&v14 count:1];
      }
      else
      {
        v12 = &__NSArray0__struct;
      }

      goto LABEL_12;
    }
  }
  v12 = &__NSArray0__struct;
LABEL_12:

  return v12;
}

@end