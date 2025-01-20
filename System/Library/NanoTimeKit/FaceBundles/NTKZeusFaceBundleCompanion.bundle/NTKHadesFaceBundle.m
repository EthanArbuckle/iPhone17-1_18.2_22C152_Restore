@interface NTKHadesFaceBundle
+ (id)identifier;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
- (BOOL)isHardwareSpecific;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKHadesFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

+ (id)identifier
{
  return @"com.apple.NTKHadesFaceBundle";
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
  v6 = +[NTKHadesFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (BOOL)isHardwareSpecific
{
  return 1;
}

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  return [a1 localizedStringForKey:a3 tableSuffix:@"Hades" comment:a4];
}

- (id)galleryTitle
{
  return +[NTKHadesFaceBundle localizedStringForKey:@"FACE_STYLE_HADES_IN_TITLE_CASE" comment:@"Hermès Mono"];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  if ([v4 supportsCapability:v5])
  {
  }
  else
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v7 = [v4 supportsCapability:v6];

    if (v7)
    {
      if ([v4 deviceCategory] == &dword_4)
      {
        uint64_t v8 = 600;
      }
      else if ([v4 deviceCategory] == (char *)&dword_0 + 3)
      {
        uint64_t v8 = 600;
      }
      else
      {
        uint64_t v8 = 400;
      }
      v10 = [(NTKHadesFaceBundle *)self defaultFaceForDevice:v4];
      id v11 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v10 priority:v8];
      v12 = v11;
      if (v11)
      {
        id v14 = v11;
        v9 = +[NSArray arrayWithObjects:&v14 count:1];
      }
      else
      {
        v9 = &__NSArray0__struct;
      }

      goto LABEL_14;
    }
  }
  v9 = &__NSArray0__struct;
LABEL_14:

  return v9;
}

@end