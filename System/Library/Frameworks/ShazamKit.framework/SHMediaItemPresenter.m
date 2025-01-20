@interface SHMediaItemPresenter
- (BOOL)didUserCancelAuthenticationWithError:(id)a3;
- (BOOL)isShazamAppInstalled;
- (NSString)bundleIdentifier;
- (SHMediaItemPresenter)initWithRemoteConfiguration:(id)a3 bundleIdentifier:(id)a4;
- (SHRemoteConfiguration)remoteConfiguration;
- (id)initBundleIdentifier:(id)a3;
- (id)presentationOptionsForFeatureFlags:(id)a3;
- (id)removePresentationOption:(int64_t)a3 fromArray:(id)a4;
- (void)iteratePresentationOptions:(id)a3 mediaItem:(id)a4 presentationSettings:(id)a5 featureFlags:(id)a6 completionHandler:(id)a7;
- (void)openURL:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5;
- (void)presentMediaItem:(id)a3 completionHandler:(id)a4;
- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5;
- (void)presentShazamAppFromShazamURL:(id)a3 completionHandler:(id)a4;
- (void)presentTrackPageFromMediaItem:(id)a3 presentationSettings:(id)a4 displayShazamUpsell:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation SHMediaItemPresenter

- (id)initBundleIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHMediaItemPresenter;
  v6 = [(SHMediaItemPresenter *)&v10 init];
  if (v6)
  {
    uint64_t v7 = +[SHRemoteConfiguration sharedInstance];
    remoteConfiguration = v6->_remoteConfiguration;
    v6->_remoteConfiguration = (SHRemoteConfiguration *)v7;

    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v6;
}

- (SHMediaItemPresenter)initWithRemoteConfiguration:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SHMediaItemPresenter *)self initBundleIdentifier:v8];
  objc_super v10 = (SHMediaItemPresenter *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (void)presentMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)SHMediaItemPresentationSettings);
  uint64_t v14 = SHMediaItemPresentationSettingOpenResultInBrowserOnFailure;
  v15 = &__kCFBooleanTrue;
  v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v10 = [v8 initWithSettings:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005130;
  v12[3] = &unk_100074D20;
  id v13 = v6;
  id v11 = v6;
  [(SHMediaItemPresenter *)self presentMediaItem:v7 presentationSettings:v10 completionHandler:v12];
}

- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 properties];
  id v12 = [v11 count];

  if (v12)
  {
    objc_initWeak(location, self);
    id v13 = [(SHMediaItemPresenter *)self remoteConfiguration];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000534C;
    v15[3] = &unk_100074D48;
    objc_copyWeak(&v19, location);
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    [v13 featureFlagsWithCompletion:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Presenting media item with no properties %@", (uint8_t *)location, 0xCu);
    }

    [(SHMediaItemPresenter *)self presentTrackPageFromMediaItem:v8 presentationSettings:v9 displayShazamUpsell:0 completionHandler:v10];
  }
}

- (BOOL)isShazamAppInstalled
{
  id v7 = 0;
  id v2 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.shazam.Shazam" allowPlaceholder:0 error:&v7];
  id v3 = v7;
  if (!v2)
  {
    v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [0 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "No application record for %@ found with error: %@", buf, 0x16u);
    }
  }

  return v2 != 0;
}

- (id)presentationOptionsForFeatureFlags:(id)a3
{
  v4 = +[NSMutableArray array];
  if ([(SHMediaItemPresenter *)self isShazamAppInstalled]) {
    [v4 addObject:&off_100078C80];
  }
  [v4 addObject:&off_100078C98];
  [v4 addObject:&off_100078CB0];
  id v5 = [v4 copy];

  return v5;
}

- (id)removePresentationOption:(int64_t)a3 fromArray:(id)a4
{
  id v5 = [a4 mutableCopy];
  id v6 = +[NSNumber numberWithInteger:a3];
  [v5 removeObject:v6];

  id v7 = [v5 copy];

  return v7;
}

- (BOOL)didUserCancelAuthenticationWithError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  unsigned __int8 v5 = [v4 isEqualToString:FBSOpenApplicationServiceErrorDomain];

  BOOL v6 = [v3 code] != (id)1 && objc_msgSend(v3, "code") != (id)2;
  char v7 = v5 ^ 1 | v6;
  if ((v7 & 1) == 0)
  {
    id v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "User dismissed the authentication request to open the matched song", v10, 2u);
    }
  }
  return v7 ^ 1;
}

- (void)iteratePresentationOptions:(id)a3 mediaItem:(id)a4 presentationSettings:(id)a5 featureFlags:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = sh_log_object();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Available presentation options are %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v47;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)v21) integerValue];
        if (!(!v24 & v23))
        {
          switch((unint64_t)v22)
          {
            case 0uLL:
              goto LABEL_23;
            case 1uLL:
              v25 = [v13 webURL];
              BOOL v26 = v25 == 0;

              if (v26)
              {
                [(SHMediaItemPresenter *)self presentTrackPageFromMediaItem:v13 presentationSettings:v14 displayShazamUpsell:0 completionHandler:v16];
              }
              else
              {
                v27 = [v13 webURL];
                v40[0] = _NSConcreteStackBlock;
                v40[1] = 3221225472;
                v40[2] = sub_100005BA0;
                v40[3] = &unk_100074D70;
                objc_copyWeak(&v45, (id *)buf);
                id v41 = v13;
                id v44 = v16;
                id v42 = v18;
                id v43 = v15;
                [(SHMediaItemPresenter *)self presentShazamAppFromShazamURL:v27 completionHandler:v40];

                objc_destroyWeak(&v45);
              }
              goto LABEL_24;
            case 2uLL:
              id v28 = [v15 shouldDisplayShazamUpsell];
              v34[0] = _NSConcreteStackBlock;
              v34[1] = 3221225472;
              v34[2] = sub_100005C84;
              v34[3] = &unk_100074D70;
              objc_copyWeak(&v39, (id *)buf);
              id v35 = v13;
              id v38 = v16;
              id v36 = v18;
              id v37 = v15;
              [(SHMediaItemPresenter *)self presentTrackPageFromMediaItem:v35 presentationSettings:v14 displayShazamUpsell:v28 completionHandler:v34];

              objc_destroyWeak(&v39);
              goto LABEL_24;
            case 3uLL:
              v29 = [v13 webURL];
              BOOL v30 = v29 == 0;

              if (v30)
              {
                v32 = sh_log_object();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v33 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to present media item, missing url", v33, 2u);
                }

LABEL_23:
                (*((void (**)(id, void, void, void))v16 + 2))(v16, 0, 0, 0);
              }
              else
              {
                v31 = [v13 webURL];
                [(SHMediaItemPresenter *)self openURL:v31 presentationSettings:v14 completionHandler:v16];
              }
LABEL_24:

              break;
            default:
              JUMPOUT(0);
          }
          goto LABEL_25;
        }
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v18 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  (*((void (**)(id, void, void, void))v16 + 2))(v16, 0, 0, 0);
LABEL_25:
  objc_destroyWeak((id *)buf);
}

- (void)presentShazamAppFromShazamURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = sh_log_object();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Attempting to open Shazam app with url %@", buf, 0xCu);
  }

  id v8 = objc_alloc_init((Class)_LSOpenConfiguration);
  v15[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v15[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v16[0] = &__kCFBooleanTrue;
  v16[1] = &__kCFBooleanTrue;
  id v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v8 setFrontBoardOptions:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005F8C;
  v12[3] = &unk_100074D98;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  +[LSAppLink openWithURL:v11 configuration:v8 completionHandler:v12];
}

- (void)presentTrackPageFromMediaItem:(id)a3 presentationSettings:(id)a4 displayShazamUpsell:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v9 = (__CFString *)a3;
  id v10 = (void (**)(id, void, id, id))a6;
  id v11 = sh_log_object();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Attempting to present native track page for media item %@", buf, 0xCu);
  }

  id v12 = objc_alloc_init((Class)_LSOpenConfiguration);
  v38[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v38[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v39[0] = &__kCFBooleanTrue;
  v39[1] = &__kCFBooleanTrue;
  id v13 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  [v12 setFrontBoardOptions:v13];

  id v31 = 0;
  id v14 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v31];
  id v15 = (__CFString *)v31;
  if (v15)
  {
    id v16 = sh_log_object();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error archiving SHMediaItem object: %@", buf, 0xCu);
    }

    id v17 = [(__CFString *)v9 webURL];
    v10[2](v10, 0, v17, v15);
  }
  else
  {
    id v18 = objc_alloc((Class)NSMutableDictionary);
    v36[0] = @"mediaItem";
    v36[1] = @"displayShazamUpsell";
    v37[0] = v14;
    id v19 = +[NSNumber numberWithBool:v7];
    v37[1] = v19;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    id v17 = [v18 initWithDictionary:v20];

    v21 = [(SHMediaItemPresenter *)self bundleIdentifier];
    [v17 setValue:v21 forKey:@"bundleIdentifier"];

    id v22 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.musicrecognition.trackpage"];
    [v22 setUserInfo:v17];
    id v30 = 0;
    id v23 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.musicrecognition" allowPlaceholder:0 error:&v30];
    id v24 = v30;
    if (v24)
    {
      v25 = sh_log_object();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v33 = @"com.apple.musicrecognition";
        __int16 v34 = 2112;
        id v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error initializing launch services application error for %@ with error: %@", buf, 0x16u);
      }

      BOOL v26 = [(__CFString *)v9 webURL];
      v10[2](v10, 0, v26, v24);
    }
    else
    {
      v27 = +[LSApplicationWorkspace defaultWorkspace];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000650C;
      v28[3] = &unk_100074DC0;
      v29 = v10;
      [v27 openUserActivity:v22 usingApplicationRecord:v23 configuration:v12 completionHandler:v28];

      BOOL v26 = v29;
    }
  }
}

- (void)openURL:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && ([v8 openResultInBrowserOnFailure] & 1) == 0)
  {
    (*((void (**)(id, void, id, void))v9 + 2))(v9, 0, v7, 0);
  }
  else
  {
    id v10 = objc_alloc_init((Class)_LSOpenConfiguration);
    v16[0] = FBSOpenApplicationOptionKeyUnlockDevice;
    v16[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v17[0] = &__kCFBooleanTrue;
    v17[1] = &__kCFBooleanTrue;
    id v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v10 setFrontBoardOptions:v11];

    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000067C0;
    v13[3] = &unk_100074DE8;
    id v14 = v7;
    id v15 = v9;
    [v12 openURL:v14 configuration:v10 completionHandler:v13];
  }
}

- (SHRemoteConfiguration)remoteConfiguration
{
  return self->_remoteConfiguration;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_remoteConfiguration, 0);
}

@end