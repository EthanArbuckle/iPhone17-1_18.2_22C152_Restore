@interface NTKGladiusFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKGladiusFaceBundle

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
  v6 = +[NTKGladiusFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKGladiusFaceBundle localizedStringForKey:@"FACE_STYLE_GLADIUS_IN_TITLE_CASE" comment:@"Gladius"];
}

- (id)galleryDescriptionText
{
  return +[NTKGladiusFaceBundle localizedStringForKey:@"FACE_STYLE_GLADIUS_DESCRIPTION" comment:@"description"];
}

- (id)galleryFacesForDevice:(id)a3
{
  uint64_t v3 = [(NTKGladiusFaceBundle *)self defaultFaceForDevice:a3];
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
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    uint64_t v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKGladiusFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:400];
    id v11 = v9;
    uint64_t v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v7;
}

@end