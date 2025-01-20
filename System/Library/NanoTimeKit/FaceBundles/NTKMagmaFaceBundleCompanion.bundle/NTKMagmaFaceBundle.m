@interface NTKMagmaFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKMagmaFaceBundle

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
  v6 = +[NTKMagmaFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKMagmaFaceBundle localizedStringForKey:@"FACE_STYLE_MAGMA_IN_TITLE_CASE" comment:@"Magma"];
}

- (id)galleryDescriptionForDevice:(id)a3
{
  if ([a3 supportsVictoryFaces]) {
    +[NTKMagmaFaceBundle localizedStringForKey:@"FACE_STYLE_MAGMA_DESCRIPTION_LIGHTHOUSE" tableSuffix:@"Lighthouse" comment:@"lighthouse description"];
  }
  else {
  id v3 = +[NTKMagmaFaceBundle localizedStringForKey:@"FACE_STYLE_MAGMA_DESCRIPTION" comment:@"Magma Gallery Description"];
  }

  return v3;
}

- (id)galleryFacesForDevice:(id)a3
{
  uint64_t v3 = [(NTKMagmaFaceBundle *)self defaultFaceForDevice:a3];
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v7 = v3;
    v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
        uint64_t v8 = 500;
      }
      else {
        uint64_t v8 = 300;
      }
      v9 = [(NTKMagmaFaceBundle *)self defaultFaceForDevice:v4];
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