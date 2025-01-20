@interface NTKSecretariatFaceBundle
+ (id)identifier;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
- (BOOL)isHardwareSpecific;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKSecretariatFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

+ (id)identifier
{
  return @"com.apple.NTKSecretariatFaceBundle";
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
  v6 = +[NTKSecretariatFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (BOOL)isHardwareSpecific
{
  return 1;
}

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  return [a1 localizedStringForKey:a3 tableSuffix:@"Secretariat" comment:a4];
}

- (id)galleryTitle
{
  return +[NTKSecretariatFaceBundle localizedStringForKey:@"SECRETARIAT_FACE_NAME" comment:@"Secretariat"];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKSecretariatFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:700];
    v10 = v9;
    if (v9)
    {
      id v12 = v9;
      v7 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

@end