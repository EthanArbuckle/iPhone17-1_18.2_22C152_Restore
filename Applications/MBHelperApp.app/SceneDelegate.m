@interface SceneDelegate
- (UIWindow)window;
- (void)continueUserActivity:(id)a3;
- (void)openURLWrapper:(id)a3 willOpenURL:(id)a4;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v6 = [a5 userActivities:a3, a4];
  v7 = [v6 allObjects];
  id v9 = [v7 firstObject];

  v8 = v9;
  if (v9)
  {
    [(SceneDelegate *)self continueUserActivity:v9];
    v8 = v9;
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
}

- (void)continueUserActivity:(id)a3
{
  id v9 = a3;
  v4 = [v9 activityType];
  unsigned int v5 = [v4 isEqualToString:NSUserActivityTypeBrowsingWeb];

  if (v5)
  {
    v6 = [v9 webpageURL];
    v7 = +[NSURLComponents componentsWithURL:v6 resolvingAgainstBaseURL:1];
    if (v7)
    {
      v8 = [[MBOpenURLWrapper alloc] initWithURL:v6];
      [(MBOpenURLWrapper *)v8 setDelegate:self];
      [(MBOpenURLWrapper *)v8 open];
    }
    else
    {
      [v9 invalidate];
    }
  }
}

- (void)openURLWrapper:(id)a3 willOpenURL:(id)a4
{
  CFStringRef v4 = (const __CFString *)kMBManagerPrebuddyDeepLinkURLKey;
  [a4 absoluteString];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(v4, v5, @"com.apple.MBHelperApp", @"mobile", kCFPreferencesAnyHost);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end