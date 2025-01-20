@interface NTKPrideWeaveFaceBundle
+ (id)complicationTypesBySlot;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
- (id)prideFacesForDevice:(id)a3;
@end

@implementation NTKPrideWeaveFaceBundle

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
  v6 = +[NTKPrideWeaveFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    id v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKPrideWeaveFaceBundle *)self prideFacesForDevice:v4];
    +[NSMutableArray array];
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_BB84;
    v14 = &unk_24778;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 1100;
    id v9 = v15;
    [v8 enumerateObjectsUsingBlock:&v11];
    id v7 = objc_msgSend(v9, "copy", v11, v12, v13, v14);
  }

  return v7;
}

- (id)prideFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([(objc_class *)[(NTKPrideWeaveFaceBundle *)self faceClass] isRestrictedForDevice:v4])
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    unsigned __int8 v6 = [(id)objc_opt_class() identifier];
    id v7 = [(id)objc_opt_class() analyticsIdentifier];
    v8 = +[NTKPrideWeaveFace bundledFaceWithIdentifier:v6 analyticsIdentifier:v7 forDevice:v4 initCustomization:0];

    id v9 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v4];
    [v8 selectOption:v9 forCustomEditMode:12 slot:0];

    v10 = [(id)objc_opt_class() identifier];
    v11 = [(id)objc_opt_class() analyticsIdentifier];
    uint64_t v12 = +[NTKPrideWeaveFace bundledFaceWithIdentifier:v10 analyticsIdentifier:v11 forDevice:v4 initCustomization:0];

    v13 = +[NTKAnalogDialShapeEditOption optionWithShape:0 forDevice:v4];
    [v12 selectOption:v13 forCustomEditMode:12 slot:0];

    id v14 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:800];
    id v15 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v12 priority:801];
    v17[0] = v14;
    v17[1] = v15;
    id v5 = +[NSArray arrayWithObjects:v17 count:2];
  }

  return v5;
}

+ (id)complicationTypesBySlot
{
  return &__NSDictionary0__struct;
}

- (id)galleryTitle
{
  return 0;
}

- (id)galleryFacesForDevice:(id)a3
{
  return 0;
}

@end