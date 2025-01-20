@interface NTKLilypadFaceBundle
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (id)defaultFaceForDevice:(id)a3;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
- (id)prideFacesForDevice:(id)a3;
- (void)argon_generateNotificationContentWithCompletion:(id)a3;
@end

@implementation NTKLilypadFaceBundle

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
  v6 = +[NTKLilypadFace bundledFaceWithIdentifier:v4 analyticsIdentifier:v5 forDevice:v3 initCustomization:0];

  return v6;
}

- (id)galleryTitle
{
  return 0;
}

- (id)heroFacesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    v8 = [(NTKLilypadFaceBundle *)self prideFacesForDevice:v4];
    v9 = [v8 firstObject];

    id v10 = objc_alloc((Class)NTKFaceBundleSortableGalleryFace);
    v11 = [v9 face];
    id v12 = [v10 initWithFace:v11 priority:1300];

    id v14 = v12;
    v7 = +[NSArray arrayWithObjects:&v14 count:1];
  }

  return v7;
}

- (id)prideFacesForDevice:(id)a3
{
  id v4 = a3;
  if ([(objc_class *)[(NTKLilypadFaceBundle *)self faceClass] isRestrictedForDevice:v4])
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    unsigned __int8 v6 = [(id)objc_opt_class() identifier];
    v7 = [(id)objc_opt_class() analyticsIdentifier];
    v8 = +[NTKLilypadFace bundledFaceWithIdentifier:v6 analyticsIdentifier:v7 forDevice:v4 initCustomization:0];

    id v9 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v8 priority:900];
    id v11 = v9;
    id v5 = +[NSArray arrayWithObjects:&v11 count:1];
  }

  return v5;
}

- (void)argon_generateNotificationContentWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[CLKDevice currentDevice];
    unsigned __int8 v6 = [(NTKLilypadFaceBundle *)self defaultFaceForDevice:v5];
    if (v6)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_2430;
      v8[3] = &unk_C3A8;
      v8[4] = self;
      id v9 = v4;
      objc_msgSend(v6, "argon_notificationContentWithCompletion:", v8);
    }
    else
    {
      v7 = +[NSError errorWithDomain:@"NTKLilypadFaceDomain" code:403 userInfo:&off_C9C8];
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v7);
    }
  }
}

- (id)galleryFacesForDevice:(id)a3
{
  return 0;
}

@end