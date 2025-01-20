@interface NTKParameciumFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)complicationTypesBySlot;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
- (id)prideFacesForDevice:(id)a3;
@end

@implementation NTKParameciumFaceBundle

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
  v6 = +[NTKParameciumFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return 0;
}

- (id)prideFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([(objc_class *)[(NTKParameciumFaceBundle *)self faceClass] isRestrictedForDevice:v4])
  {
    v5 = &__NSArray0__struct;
  }
  else
  {
    v6 = [(id)objc_opt_class() identifier];
    v7 = [(id)objc_opt_class() analyticsIdentifier];
    v8 = +[NTKParameciumFace bundledFaceWithIdentifier:v6 analyticsIdentifier:v7 forDevice:v4 initCustomization:0];

    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:1000];
    id v11 = v9;
    v5 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v5;
}

- (id)galleryFacesForDevice:(id)a3
{
  uint64_t v3 = [(NTKParameciumFaceBundle *)self defaultFaceForDevice:a3];
  id v4 = (void *)v3;
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
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKParameciumFaceBundle *)self prideFacesForDevice:v4];
    id v9 = [v8 firstObject];

    id v10 = objc_alloc((Class)NTKFaceBundleSortableGalleryFace);
    id v11 = [v9 face];
    id v12 = [v10 initWithFace:v11 priority:1400];

    id v14 = v12;
    uint64_t v7 = +[NSArray arrayWithObjects:&v14 count:1];
  }

  return v7;
}

- (id)complicationTypesBySlot
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v5[0] = &off_10F70;
  v5[1] = &off_10F88;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v5[2] = &off_10FA0;
  v5[3] = &off_10FB8;
  v4[4] = NTKComplicationSlotSubdialTop;
  v5[4] = &off_10FD0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];

  return v2;
}

@end