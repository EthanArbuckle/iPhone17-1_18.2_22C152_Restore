@interface NTKBellonaFaceBundle
+ (id)identifier;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
- (BOOL)isHardwareSpecific;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKBellonaFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

+ (id)identifier
{
  return @"com.apple.NTKBellonaFaceBundle";
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
  v6 = +[NTKBellonaFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (BOOL)isHardwareSpecific
{
  return 1;
}

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  return [a1 localizedStringForKey:a3 tableSuffix:@"Bellona" comment:a4];
}

- (id)galleryTitle
{
  return +[NTKBellonaFaceBundle localizedStringForKey:@"BELLONA_FACE_NAME" comment:@"Bellona"];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKBellonaFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:500];
    id v11 = v9;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v7;
}

@end