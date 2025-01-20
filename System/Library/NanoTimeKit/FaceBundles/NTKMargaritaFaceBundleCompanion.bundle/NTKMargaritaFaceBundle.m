@interface NTKMargaritaFaceBundle
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
@end

@implementation NTKMargaritaFaceBundle

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
  v6 = +[NTKMargaritaFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return +[NTKMargaritaFaceBundle localizedStringForKey:@"FACE_STYLE_MARGARITA_IN_TITLE_CASE" comment:@"Margarita"];
}

- (id)galleryFacesForDevice:(id)a3
{
  id v4 = a3;
  v5 = +[NTKMargaritaStripeCountEditOption optionsRestrictedByDevice:v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5EE0;
  v11[3] = &unk_10648;
  v11[4] = self;
  id v12 = v4;
  id v6 = (id)objc_opt_new();
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    id v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKMargaritaFaceBundle *)self defaultFaceForDevice:v4];
    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:200];
    v10 = v9;
    if (v9)
    {
      id v12 = v9;
      id v7 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      id v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

@end