@interface NTKColtanFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_sortableFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKColtanFaceBundle

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
  v4 = objc_opt_class();
  v5 = [v4 identifier];
  v6 = [v4 analyticsIdentifier];
  v7 = +[NTKColtanAnalogFace bundledFaceWithIdentifier:v5 analyticsIdentifier:v6 forDevice:v3 initCustomization:0];

  return v7;
}

- (id)galleryTitle
{
  return 0;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B8E1457C-60C6-4CBE-AE96-F0AA874D3100"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if ((v6 & 1) != 0
    || (id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"], v8 = objc_msgSend(v4, "supportsCapability:", v7), v7, (v8 & 1) != 0)|| (v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", @"B5C93485-A89F-4ACA-8845-3F508A6620EF"), v10 = objc_msgSend(v4, "supportsCapability:", v9), v9, !v10))
  {
    v11 = &__NSArray0__struct;
  }
  else
  {
    v11 = [(NTKColtanFaceBundle *)self _sortableFacesForDevice:v4];
  }

  return v11;
}

- (id)galleryFacesForDevice:(id)a3
{
  return 0;
}

- (id)_sortableFacesForDevice:(id)a3
{
  id v3 = [(NTKColtanFaceBundle *)self defaultFaceForDevice:a3];
  id v4 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v3 priority:1200];
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    unsigned __int8 v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    unsigned __int8 v6 = &__NSArray0__struct;
  }

  return v6;
}

@end