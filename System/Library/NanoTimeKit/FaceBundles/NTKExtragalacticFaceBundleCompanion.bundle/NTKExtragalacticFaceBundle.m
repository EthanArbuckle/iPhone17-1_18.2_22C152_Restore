@interface NTKExtragalacticFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_sortableFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitleForDevice:(id)a3;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKExtragalacticFaceBundle

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
  v6 = +[NTKFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)galleryTitleForDevice:(id)a3
{
  return 0;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  char v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v7 = [(NTKExtragalacticFaceBundle *)self _sortableFacesForDevice:v4];
  }

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  return 0;
}

- (id)_sortableFacesForDevice:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = [(NTKExtragalacticFaceBundle *)self defaultFaceForDevice:a3];
  uint64_t v4 = [objc_alloc(MEMORY[0x263F579E8]) initWithFace:v3 priority:1300];
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    char v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

@end