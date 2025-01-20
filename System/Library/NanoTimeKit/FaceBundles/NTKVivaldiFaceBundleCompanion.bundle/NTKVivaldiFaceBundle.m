@interface NTKVivaldiFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKVivaldiFaceBundle

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

- (id)galleryDescriptionText
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_VIVALDI_DESCRIPTION" comment:@"Vivaldi Gallery Description"];
}

- (id)galleryTitle
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_VIVALDI_IN_TITLE_CASE" comment:@"Vivaldi"];
}

- (id)heroFacesForDevice:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  char v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v8 = [(NTKVivaldiFaceBundle *)self defaultFaceForDevice:v4];
    v9 = (void *)[objc_alloc(MEMORY[0x263F579E8]) initWithFace:v8 priority:100];
    v11[0] = v9;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  int v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(&unk_26FB3D700, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_246CB3488;
    v12[3] = &unk_265200FA8;
    v12[4] = self;
    id v13 = v4;
    id v14 = v7;
    id v8 = v7;
    [&unk_26FB3D700 enumerateObjectsUsingBlock:v12];
    v9 = (void *)[v8 copy];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKVivaldiFaceBundle;
    v9 = [(NTKFaceBundle *)&v11 galleryFacesForDevice:v4];
  }

  return v9;
}

@end