@interface NTKShibaFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKShibaFaceBundle

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
  v6 = +[NTKShibaFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKShibaFaceBundle localizedStringForKey:@"FACE_STYLE_SHIBA_IN_TITLE_CASE" comment:@"Shiba"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  v5 = (char *)+[NTKShibaStyleEditOption numberOfOptionsForDevice:v3];
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = [(id)objc_opt_class() identifier];
      v9 = [(id)objc_opt_class() analyticsIdentifier];
      v10 = +[NTKShibaFace bundledFaceWithIdentifier:v8 analyticsIdentifier:v9 forDevice:v3 initCustomization:0];

      if (v10)
      {
        v11 = +[NTKShibaStyleEditOption optionAtIndex:i forDevice:v3];
        [v10 selectOption:v11 forCustomEditMode:15 slot:0];

        [v4 addObject:v10];
      }
    }
  }
  id v12 = [v4 copy];

  return v12;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKShibaFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:900];
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