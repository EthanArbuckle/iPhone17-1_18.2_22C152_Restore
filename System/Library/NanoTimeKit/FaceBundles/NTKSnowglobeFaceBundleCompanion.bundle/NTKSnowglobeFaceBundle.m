@interface NTKSnowglobeFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_sortableFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKSnowglobeFaceBundle

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (Class)faceClass
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

- (id)galleryTitle
{
  return 0;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  char v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v7 = [(NTKSnowglobeFaceBundle *)self _sortableFacesForDevice:v4];
  }

  return v7;
}

- (id)_sortableFacesForDevice:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKSnowglobeFaceBundle *)self defaultFaceForDevice:a3];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F79FF0]) initWithFace:v3 priority:400];
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

@end