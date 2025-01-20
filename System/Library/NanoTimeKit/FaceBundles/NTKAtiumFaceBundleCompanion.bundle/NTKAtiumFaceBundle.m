@interface NTKAtiumFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKAtiumFaceBundle

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
  v4 = +[NTKAtiumFaceBundle identifier];
  v5 = +[NTKAtiumFace bundledFaceWithIdentifier:v4 forDevice:v3 initCustomization:0];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKAtiumFaceBundle localizedStringForKey:@"FACE_ATIUM_IN_TITLE_CASE" comment:@"Atium"];
}

- (id)galleryDescriptionText
{
  return +[NTKAtiumFaceBundle localizedStringForKey:@"FACE_ATIUM_DESCRIPTION" comment:@"Atium Description"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 materialType] - 8;
  if (v5 <= 0x10 && ((0x1F801u >> v5) & 1) != 0)
  {
    uint64_t v20 = (uint64_t)*(&off_C3E0 + v5);
    v6 = +[NSArray arrayWithObjects:&v20 count:1];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }
  v7 = [v6 arrayByAddingObjectsFromArray:&off_CA90];

  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_21C4;
  v15 = &unk_C3C0;
  v16 = &off_CAA8;
  v17 = self;
  id v18 = v4;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v19;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:&v12];
  id v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = [(NTKAtiumFaceBundle *)self defaultFaceForDevice:v4];
    id v8 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v7 priority:200];
    id v9 = v8;
    if (v8)
    {
      id v12 = v8;
      id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      id v10 = &__NSArray0__struct;
    }
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

@end