@interface NTKAegirFaceBundle
+ (id)identifier;
+ (id)logCategoryName;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKAegirFaceBundle

+ (id)identifier
{
  return @"com.apple.NTKAegirFaceBundle";
}

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
  v6 = +[NTKFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

+ (id)logCategoryName
{
  return @"aegir";
}

- (id)galleryDescriptionText
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_AEGIR_FACE_DESCRIPTION" comment:@"Ægir"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = sub_1DAFD73C4;
  v13 = &unk_1E6BE3C30;
  v14 = self;
  id v15 = v4;
  id v16 = &unk_1F3527A50;
  id v17 = v5;
  id v6 = v5;
  id v7 = v4;
  [&unk_1F3527A38 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (id)galleryTitle
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_AEGIR_IN_TITLE_CASE" comment:@"Ægir"];
}

- (id)heroFacesForDevice:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  char v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v8 = [(NTKAegirFaceBundle *)self defaultFaceForDevice:v4];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F79FF0]) initWithFace:v8 priority:300];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      v12[0] = v9;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v7;
}

@end