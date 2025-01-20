@interface NTKRenegadeFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)_galleryTitleKey;
- (id)_sortableFacesForDevice:(id)a3;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKRenegadeFaceBundle

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
  v6 = +[NTKRenegadeFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  v2 = [(NTKRenegadeFaceBundle *)self _galleryTitleKey];
  id v3 = +[NTKRenegadeFaceBundle localizedStringForKey:v2 comment:@"Unity gallery row"];

  return v3;
}

- (id)_galleryTitleKey
{
  return @"FACE_STYLE_RENEGADE_IN_TITLE_CASE";
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[NTKFaceBundleManager sharedManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2574;
  v12[3] = &unk_10468;
  id v13 = v3;
  id v14 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateFaceBundlesOnDevice:v7 withBlock:v12];

  [v6 sortUsingSelector:"compare:"];
  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_25D8;
  v10[3] = &unk_10490;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v8;
  [v6 enumerateObjectsUsingBlock:v10];

  return v8;
}

- (id)galleryDescriptionText
{
  return +[NTKRenegadeFaceBundle localizedStringForKey:@"FACE_STYLE_RENEGADE_GALLERY_DESCRIPTION" comment:@"Renegade face description"];
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B8E1457C-60C6-4CBE-AE96-F0AA874D3100"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if ((v6 & 1) != 0
    || (id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"], v8 = objc_msgSend(v4, "supportsCapability:", v7), v7, (v8 & 1) != 0))
  {
    v9 = &__NSArray0__struct;
  }
  else
  {
    v9 = [(NTKRenegadeFaceBundle *)self _sortableFacesForDevice:v4];
  }

  return v9;
}

- (id)_sortableFacesForDevice:(id)a3
{
  id v3 = [(NTKRenegadeFaceBundle *)self defaultFaceForDevice:a3];
  id v4 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v3 priority:1000];
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

@end