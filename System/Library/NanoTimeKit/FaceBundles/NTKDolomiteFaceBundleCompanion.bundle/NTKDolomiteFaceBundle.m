@interface NTKDolomiteFaceBundle
+ (id)logCategoryName;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_sortableFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitleForDevice:(id)a3;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKDolomiteFaceBundle

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
  v6 = +[NTKDolomiteFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitleForDevice:(id)a3
{
  return +[NTKDolomiteFaceBundle localizedStringForKey:@"FACE_STYLE_DOLOMITE_IN_TITLE_CASE" comment:@"Dolomite"];
}

- (id)galleryDescriptionText
{
  return +[NTKDolomiteFaceBundle localizedStringForKey:@"FACE_STYLE_DOLOMITE_DESCRIPTION" comment:@"FACE_STYLE_DOLOMITE_DESCRIPTION"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  id v14 = ntk_seasons_fall2024_chartreuse;
  id v15 = ntk_seasons_fall2024_denim;
  id v16 = ntk_seasons_fall2024_plum;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 12, 0, @"dolomite.dynamic", 0, @"dolomite.color02", 0, @"dolomite.color04", 1, @"dolomite.color11", 0, v14, 0, v15, 0, v16, 1, ntk_seasons_fall2024_lakeGreen,
    0,
    @"dolomite.silver",
    0,
    @"dolomite.rosegold",
    0,
    @"dolomite.jetblack",
    1,
  v5 = @"dolomite.silver");
  for (uint64_t i = 0; i != 192; i += 16)
  {
    v7 = [(NTKDolomiteFaceBundle *)self defaultFaceForDevice:v4];
    if (v7)
    {
      v8 = +[NTKPigmentEditOption pigmentNamed:*(uint64_t *)((char *)&v13 + i + 8)];
      [v7 selectOption:v8 forCustomEditMode:10 slot:0];
      v9 = +[NTKDolomiteStyleEditOption optionWithStyle:*(uint64_t *)((char *)&v13 + i) forDevice:v4];
      [v7 selectOption:v9 forCustomEditMode:15 slot:0];
      [v5 addObject:v7];
    }
  }
  id v10 = [v5 copy];

  for (uint64_t j = 184; j != -8; j -= 16)

  return v10;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = [(NTKDolomiteFaceBundle *)self _sortableFacesForDevice:v4];
  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)_sortableFacesForDevice:(id)a3
{
  id v3 = [(NTKDolomiteFaceBundle *)self defaultFaceForDevice:a3];
  id v4 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v3 priority:100];
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    unsigned int v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    unsigned int v6 = &__NSArray0__struct;
  }

  return v6;
}

+ (id)logCategoryName
{
  return @"dolomite";
}

@end