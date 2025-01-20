@interface ASOServiceOverlayDevelopmentLockupProvider
+ (id)appDevelopmentLockupForConfiguration:(id)a3 serviceContext:(id)a4;
+ (id)ascArtworkForIcon:(id)a3 shape:(unint64_t)a4;
+ (id)log;
+ (id)parentAppDevelopmentLockupForConfiguration:(id)a3 serviceContext:(id)a4;
+ (id)parentApplicationRecordForConfiguration:(id)a3 serviceContext:(id)a4;
+ (id)placeholderAppDevelopmentLockupForConfiguration:(id)a3 serviceContext:(id)a4;
@end

@implementation ASOServiceOverlayDevelopmentLockupProvider

+ (id)log
{
  if (qword_10002CB10 != -1) {
    dispatch_once(&qword_10002CB10, &stru_100024EE8);
  }
  v2 = (void *)qword_10002CB18;

  return v2;
}

+ (id)placeholderAppDevelopmentLockupForConfiguration:(id)a3 serviceContext:(id)a4
{
  v5 = +[ASOLocalizer defaultLocalizer];
  v6 = +[ISIcon genericApplicationIcon];
  id v7 = objc_alloc((Class)ASCLockup);
  id v8 = [objc_alloc((Class)ASCAdamID) initWithInt64:0x8000000000000000];
  uint64_t v9 = ASCLockupKindApp;
  v10 = [a1 ascArtworkForIcon:v6 shape:0];
  v11 = [v5 stringForKey:@"APP_CLIP_DEVELOPMENT_HEADING"];
  v12 = +[NSString stringWithFormat:@"%@:::%@", @"appstore", v11];
  v13 = [v5 stringForKey:@"APP_CLIP_DEVELOPMENT_SUBTITLE"];
  id v14 = [v7 initWithID:v8 kind:v9 metrics:0 icon:v10 heading:v12 title:0 subtitle:v13 ageRating:0 offer:0];

  return v14;
}

+ (id)appDevelopmentLockupForConfiguration:(id)a3 serviceContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 applicationRecord];
  id v8 = v7;
  if (v7
    && ([v7 applicationState],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isInstalled],
        v9,
        (v10 & 1) != 0))
  {
    v11 = +[ASOLocalizer defaultLocalizer];
    v25 = [v8 localizedName];
    id v12 = objc_alloc((Class)ISIcon);
    v13 = [v8 URL];
    id v24 = [v12 initWithURL:v13];

    id v14 = objc_alloc((Class)ASCLockup);
    id v15 = [objc_alloc((Class)ASCAdamID) initWithInt64:0x8000000000000000];
    uint64_t v16 = ASCLockupKindApp;
    v17 = [a1 ascArtworkForIcon:v24 shape:1];
    v18 = [v11 stringForKey:@"APP_CLIP_DEVELOPMENT_HEADING"];
    v19 = +[NSString stringWithFormat:@"%@:::%@", @"appstore", v18];
    v20 = [v11 stringForKey:@"APP_CLIP_DEVELOPMENT_SUBTITLE"];
    id v21 = [v14 initWithID:v15 kind:v16 metrics:0 icon:v17 heading:v19 title:v25 subtitle:v20 ageRating:0 offer:0];
  }
  else
  {
    v22 = +[ASOServiceOverlayDevelopmentLockupProvider log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Unable to build development app lockup for parent app: %@", buf, 0xCu);
    }

    id v21 = 0;
  }

  return v21;
}

+ (id)parentAppDevelopmentLockupForConfiguration:(id)a3 serviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 additionalValueForKey:ASOOverlayConfigurationPrivateParameterIgnoreParentApp serviceContext:v7];
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    v11 = [a1 parentApplicationRecordForConfiguration:v6 serviceContext:v7];
    id v12 = v11;
    if (v11
      && ([v11 applicationState],
          v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v13 isInstalled],
          v13,
          (v14 & 1) != 0))
    {
      id v15 = +[ASOLocalizer defaultLocalizer];
      v29 = [v12 localizedName];
      id v16 = objc_alloc((Class)ISIcon);
      v17 = [v12 URL];
      id v28 = [v16 initWithURL:v17];

      id v27 = objc_alloc((Class)ASCLockup);
      id v18 = [objc_alloc((Class)ASCAdamID) initWithInt64:0x8000000000000000];
      uint64_t v19 = ASCLockupKindApp;
      v20 = [a1 ascArtworkForIcon:v28 shape:0];
      v26 = v15;
      id v21 = [v15 stringForKey:@"APP_CLIP_DEVELOPMENT_HEADING"];
      v22 = +[NSString stringWithFormat:@"%@:::%@", @"appstore", v21];
      v23 = [v15 stringForKey:@"APP_CLIP_DEVELOPMENT_SUBTITLE"];
      id v10 = [v27 initWithID:v18 kind:v19 metrics:0 icon:v20 heading:v22 title:v29 subtitle:v23 ageRating:0 offer:0];
    }
    else
    {
      id v24 = +[ASOServiceOverlayDevelopmentLockupProvider log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v6;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Unable to build development app lockup for parent app: %@", buf, 0xCu);
      }

      id v10 = 0;
    }
  }

  return v10;
}

+ (id)ascArtworkForIcon:(id)a3 shape:(unint64_t)a4
{
  uint64_t v5 = kISImageDescriptorHomeScreen;
  id v6 = a3;
  id v7 = +[ISImageDescriptor imageDescriptorNamed:v5];
  [v7 setShape:a4];
  id v15 = v7;
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  [v6 prepareImagesForImageDescriptors:v8];

  unsigned __int8 v9 = [v6 imageForDescriptor:v7];

  id v10 = [v9 CGImage];
  [v9 scale];
  v11 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 0);
  id v12 = objc_alloc((Class)ASCArtwork);
  id v13 = [v12 initWithImage:v11 decoration:ASCArtworkDecorationNone];

  return v13;
}

+ (id)parentApplicationRecordForConfiguration:(id)a3 serviceContext:(id)a4
{
  id v5 = a4;
  id v6 = [a3 additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideParentAppBundleIdentifier serviceContext:v5];
  if (v6)
  {
    id v7 = objc_msgSend(objc_msgSend(LSApplicationRecord, "init"), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
  }
  else
  {
    id v7 = [v5 appClipParentApplicationRecord];
  }
  id v8 = v7;

  return v8;
}

@end