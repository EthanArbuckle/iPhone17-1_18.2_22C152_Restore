@interface NTKProteusFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKProteusFaceBundle

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
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_480C;
  v9[3] = &unk_10408;
  id v10 = v3;
  id v6 = v3;
  v7 = +[NTKProteusFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v6 initCustomization:v9];

  return v7;
}

- (id)galleryFacesForDevice:(id)a3
{
  id v3 = [(NTKProteusFaceBundle *)self defaultFaceForDevice:a3];
  id v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (id)galleryDescriptionText
{
  return +[NTKProteusFaceBundle localizedStringForKey:@"FACE_STYLE_PROTEUS_DESCRIPTION" comment:@"Proteus Gallery Description"];
}

- (id)galleryTitle
{
  return +[NTKProteusFaceBundle localizedStringForKey:@"FACE_STYLE_PROTEUS_IN_TITLE_CASE" comment:@"Contour"];
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

    if (v7 && [v4 deviceCategory] == (char *)&dword_0 + 3)
    {
      v8 = [(NTKProteusFaceBundle *)self defaultFaceForDevice:v4];
      id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:400];
      id v10 = v9;
      if (v9)
      {
        id v13 = v9;
        v11 = +[NSArray arrayWithObjects:&v13 count:1];
      }
      else
      {
        v11 = &__NSArray0__struct;
      }

      goto LABEL_8;
    }
  }
  v11 = &__NSArray0__struct;
LABEL_8:

  return v11;
}

@end