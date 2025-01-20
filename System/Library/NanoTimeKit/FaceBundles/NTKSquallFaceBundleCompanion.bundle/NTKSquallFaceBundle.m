@interface NTKSquallFaceBundle
+ (id)identifier;
- (BOOL)isHardwareSpecific;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKSquallFaceBundle

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

+ (id)identifier
{
  return @"com.apple.NTKSquallFaceBundle";
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isHardwareSpecific
{
  return 1;
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
  v6 = +[NTKSquallFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKSquallFaceBundle localizedStringForKey:@"FACE_STYLE_SQUALL_IN_TITLE_CASE" comment:@"Squall"];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned int v6 = [v4 supportsCapability:v5];

  if (v6 && [v4 deviceCategory] == &dword_4)
  {
    v7 = [(NTKSquallFaceBundle *)self defaultFaceForDevice:v4];
    id v8 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v7 priority:1800];
    id v11 = v8;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

@end