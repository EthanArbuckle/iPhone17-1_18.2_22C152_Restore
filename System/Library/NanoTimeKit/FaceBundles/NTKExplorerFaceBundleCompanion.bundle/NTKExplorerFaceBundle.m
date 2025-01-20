@interface NTKExplorerFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)galleryTitleForDevice:(id)a3;
- (id)legacyFaceStyle;
@end

@implementation NTKExplorerFaceBundle

- (id)legacyFaceStyle
{
  return &off_10D20;
}

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
  if (NTKShowBlueRidgeUI()) {
    uint64_t v4 = 224;
  }
  else {
    uint64_t v4 = 24;
  }
  v5 = +[NTKExplorerFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

- (id)galleryTitle
{
  return +[NTKExplorerFaceBundle localizedStringForKey:@"FACE_STYLE_EXPLORER_IN_TITLE_CASE" comment:@"Explorer"];
}

- (id)galleryTitleForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKExplorerFaceBundle;
    v7 = [(NTKExplorerFaceBundle *)&v9 galleryTitleForDevice:v4];
  }

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  +[NTKExplorerFace isRestrictedForDevice:v4];
  id v5 = objc_opt_new();
  v12[0] = NTKComplicationSlotTopLeft;
  v12[1] = NTKComplicationSlotTopRight;
  v13[0] = &off_11020;
  v13[1] = &off_11038;
  v12[2] = NTKComplicationSlotBottomCenter;
  v13[2] = &off_11050;
  uint64_t v6 = 3;
  v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  do
  {
    v8 = [(NTKExplorerFaceBundle *)self defaultFaceForDevice:v4];
    if (v8)
    {
      objc_super v9 = +[NTKDensityEditOption optionWithDensity:v6 forDevice:v4];
      [v8 selectOption:v9 forCustomEditMode:11 slot:0];

      [v8 _setFaceGalleryComplicationTypesForSlots:v7];
      [v5 addObject:v8];
    }

    --v6;
  }
  while (v6 != -1);
  id v10 = [v5 copy];

  return v10;
}

@end