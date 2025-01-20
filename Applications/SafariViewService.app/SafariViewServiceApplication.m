@interface SafariViewServiceApplication
+ (void)initialize;
- (id)newSharedSiteMetadataManager;
- (int64_t)currentKeyboardModifierFlags;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SafariViewServiceApplication

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 addSuiteNamed:@"com.apple.mobilesafari"];

    id v5 = +[NSUserDefaults safari_browserDefaults];
    [v5 safari_registerMobileSafariDefaults];
  }
}

- (void)applicationDidFinishLaunching:(id)a3
{
  +[_SFSiteMetadataManager setSharedSiteMetadataManagerProvider:self];
  +[_SFReaderCustomProtocols registerReaderCustomProtocols];
  +[_SFBrowserContentViewController createDefaultWebsiteDataStore];

  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:@"_SFGenericWebsiteName" andApp:0];
}

- (id)newSharedSiteMetadataManager
{
  id v2 = objc_alloc((Class)_SFSiteMetadataManager);
  id v3 = +[NSBundle safari_safariInjectedBundleURL];
  v4 = _SFSafariIconImageCacheDirectoryPath();
  id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  id v6 = [v2 initWithInjectedBundleURL:v3 imageCacheDirectoryURL:v5 cacheIsReadOnly:1 metadataType:38];

  return v6;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)[v6 modifierFlags];
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  [(SafariViewServiceApplication *)&v8 pressesBegan:v7 withEvent:v6];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)[v6 modifierFlags];
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  [(SafariViewServiceApplication *)&v8 pressesChanged:v7 withEvent:v6];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)[v6 modifierFlags];
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  [(SafariViewServiceApplication *)&v8 pressesEnded:v7 withEvent:v6];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  self->_currentKeyboardModifierFlags = (int64_t)[v6 modifierFlags];
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  [(SafariViewServiceApplication *)&v8 pressesCancelled:v7 withEvent:v6];
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SafariViewServiceApplication;
  [(SafariViewServiceApplication *)&v8 buildMenuWithBuilder:v4];
  id v5 = [v4 system];
  id v6 = +[UIMenuSystem mainSystem];

  if (v5 == v6)
  {
    id v7 = +[SFBrowserMenuProvider sharedProvider];
    [v7 setMenusIfNecessaryForSafariViewServiceWithBuilder:v4];
  }
}

- (int64_t)currentKeyboardModifierFlags
{
  return self->_currentKeyboardModifierFlags;
}

@end