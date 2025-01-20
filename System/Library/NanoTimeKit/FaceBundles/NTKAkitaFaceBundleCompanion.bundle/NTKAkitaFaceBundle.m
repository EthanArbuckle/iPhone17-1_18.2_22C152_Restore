@interface NTKAkitaFaceBundle
+ (id)logCategoryName;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_sortableFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitleForDevice:(id)a3;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKAkitaFaceBundle

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
  v6 = +[NTKAkitaFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  v7 = NTKAkitaGetMorphConfigString(0x12uLL);
  [v6 setCustomData:v7 forKey:NTKAkitaFaceKeyMorphConfig];

  return v6;
}

- (id)galleryTitleForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned int v5 = [v3 supportsCapability:v4];

  if (v5) {
    CFStringRef v6 = @"GALLERY_TITLE_AKITA_IN_TITLE_CASE";
  }
  else {
    CFStringRef v6 = @"FACE_STYLE_AKITA_IN_TITLE_CASE";
  }
  v7 = +[NTKAkitaFaceBundle localizedStringForKey:v6 comment:@"Akita"];

  return v7;
}

- (id)galleryDescriptionText
{
  return +[NTKAkitaFaceBundle localizedStringForKey:@"FACE_STYLE_AKITA_DESCRIPTION" comment:@"FACE_STYLE_AKITA_DESCRIPTION"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    CFStringRef v6 = +[NSMutableArray array];
    v7 = +[NTKFaceBundleManager sharedManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_67FC;
    v17[3] = &unk_10788;
    id v18 = v3;
    id v19 = v6;
    id v8 = v6;
    [v7 enumerateFaceBundlesOnDevice:v18 withBlock:v17];

    [v8 sortUsingSelector:"compare:"];
    +[NSMutableArray array];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_6860;
    v15[3] = &unk_107B0;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v9;
    [v8 enumerateObjectsUsingBlock:v15];

    v10 = v18;
  }
  else
  {
    id v8 = [(id)objc_opt_class() identifier];
    v11 = [(id)objc_opt_class() analyticsIdentifier];
    v10 = +[NTKAkitaFace bundledFaceWithIdentifier:v8 analyticsIdentifier:v11 forDevice:v3 initCustomization:0];

    if (v10)
    {
      uint32_t v12 = arc4random_uniform(9u);
      v13 = NTKAkitaGetMorphConfigString(v12 + 9);
      [v10 setCustomData:v13 forKey:NTKAkitaFaceKeyMorphConfig];

      v20 = v10;
      id v9 = +[NSArray arrayWithObjects:&v20 count:1];
    }
    else
    {
      id v9 = &__NSArray0__struct;
    }
  }

  return v9;
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
    v7 = [(NTKAkitaFaceBundle *)self _sortableFacesForDevice:v4];
  }

  return v7;
}

- (id)_sortableFacesForDevice:(id)a3
{
  id v3 = [(NTKAkitaFaceBundle *)self defaultFaceForDevice:a3];
  id v4 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v3 priority:100];
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    unsigned __int8 v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    unsigned __int8 v6 = &__NSArray0__struct;
  }

  return v6;
}

+ (id)logCategoryName
{
  return @"artist";
}

@end