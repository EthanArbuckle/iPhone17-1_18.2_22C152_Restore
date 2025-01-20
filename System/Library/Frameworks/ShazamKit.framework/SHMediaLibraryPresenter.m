@interface SHMediaLibraryPresenter
- (BOOL)isShazamAppInstalled;
- (NSString)bundleIdentifier;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (SHMediaLibraryPresenter)initWithBundleIdentifier:(id)a3;
- (void)openNativeHistoryWithShazamUpsell:(BOOL)a3 completionHandler:(id)a4;
- (void)openShazamAppLibrary:(id)a3;
- (void)presentMediaLibraryWithCompletionHandler:(id)a3;
- (void)setLibraryInfoFetcher:(id)a3;
@end

@implementation SHMediaLibraryPresenter

- (SHMediaLibraryPresenter)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHMediaLibraryPresenter;
  v6 = [(SHMediaLibraryPresenter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = objc_alloc_init(SHMediaLibraryInfoFetcher);
    libraryInfoFetcher = v7->_libraryInfoFetcher;
    v7->_libraryInfoFetcher = v8;
  }
  return v7;
}

- (void)presentMediaLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SHMediaLibraryPresenter *)self libraryInfoFetcher];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D584;
  v7[3] = &unk_100075DB8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 fetchLibraryInfoWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)openShazamAppLibrary:(id)a3
{
  id v3 = a3;
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Attempting to open Shazam App Library", buf, 2u);
  }

  id v5 = objc_alloc_init((Class)_LSOpenConfiguration);
  v13[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v13[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v14[0] = &__kCFBooleanTrue;
  v14[1] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v5 setFrontBoardOptions:v6];

  v7 = +[LSApplicationWorkspace defaultWorkspace];
  id v8 = +[NSURL URLWithString:@"https://www.shazam.com/myshazam?referrer=shazam-module"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D888;
  v10[3] = &unk_100074CD0;
  id v11 = v3;
  id v9 = v3;
  [v7 openURL:v8 configuration:v5 completionHandler:v10];
}

- (void)openNativeHistoryWithShazamUpsell:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  v7 = sh_log_object();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Attempting to open native History", buf, 2u);
  }

  id v8 = objc_alloc_init((Class)_LSOpenConfiguration);
  v29[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v29[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v30[0] = &__kCFBooleanTrue;
  v30[1] = &__kCFBooleanTrue;
  id v9 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v8 setFrontBoardOptions:v9];

  id v10 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v27 = @"displayShazamUpsell";
  id v11 = +[NSNumber numberWithBool:v4];
  v28 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v13 = [v10 initWithDictionary:v12];

  v14 = [(SHMediaLibraryPresenter *)self bundleIdentifier];
  [v13 setValue:v14 forKey:@"bundleIdentifier"];

  id v15 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.musicrecognition.history"];
  [v15 setUserInfo:v13];
  id v22 = 0;
  id v16 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.musicrecognition" allowPlaceholder:0 error:&v22];
  id v17 = v22;
  if (v17)
  {
    v18 = sh_log_object();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v24 = @"com.apple.musicrecognition";
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error initializing launch services application error for %@ with error: %@", buf, 0x16u);
    }

    v6[2](v6, v17);
  }
  else
  {
    v19 = +[LSApplicationWorkspace defaultWorkspace];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003DC98;
    v20[3] = &unk_100074DC0;
    v21 = v6;
    [v19 openUserActivity:v15 usingApplicationRecord:v16 configuration:v8 completionHandler:v20];
  }
}

- (BOOL)isShazamAppInstalled
{
  id v6 = 0;
  id v2 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.shazam.Shazam" allowPlaceholder:0 error:&v6];
  id v3 = v6;
  if (!v2)
  {
    BOOL v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v8 = @"com.shazam.Shazam";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "No application record for %@ found with error: %@", buf, 0x16u);
    }
  }
  return v2 != 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  return self->_libraryInfoFetcher;
}

- (void)setLibraryInfoFetcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryInfoFetcher, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end