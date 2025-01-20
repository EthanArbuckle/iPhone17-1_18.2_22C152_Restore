@interface CPSSessionProxy
- (BOOL)canRequestLocationConfirmation;
- (BOOL)isEqual:(id)a3;
- (BOOL)originIsControlCenter;
- (BOOL)usedByPPT;
- (CPSClipMetadata)metadata;
- (CPSSessionConfiguration)configuration;
- (CPSSessionProxy)initWithURL:(id)a3;
- (CPSSessionProxyDelegate)delegate;
- (NSNumber)estimatedProgress;
- (NSString)launchReason;
- (NSString)referrerBundleID;
- (NSString)sourceBundleID;
- (NSURL)applicationIconFileURL;
- (NSURL)businessIconURL;
- (NSURL)heroImageFileURL;
- (NSURL)url;
- (double)appLaunchTime;
- (unint64_t)hash;
- (void)_checkAndConsumeShowsAppAttributionBannerIfNeeded;
- (void)cancel;
- (void)checkAndConsumeShowsAppAttributionBannerWithCompletion:(id)a3;
- (void)connectToService;
- (void)didDetermineAvailability:(BOOL)a3;
- (void)didFinishLoadingWithError:(id)a3;
- (void)didFinishTestingAtTime:(double)a3;
- (void)didInstallApplicationPlaceholder;
- (void)didRetrieveApplicationIcon:(id)a3;
- (void)didRetrieveBusinessIcon:(id)a3;
- (void)didRetrieveHeroImage:(id)a3;
- (void)didUpdateInstallProgress:(id)a3;
- (void)didUpdateMetadata:(id)a3;
- (void)disconnect;
- (void)fetchClipMetadataAndImages;
- (void)getLastLaunchOptionsWithCompletion:(id)a3;
- (void)installClip;
- (void)installClipWithCompletion:(id)a3;
- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4;
- (void)openClipWithLaunchOptions:(id)a3 completion:(id)a4;
- (void)prewarmClip;
- (void)prewarmClipWithCompletionHandler:(id)a3;
- (void)remoteServiceDidCrash;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaunchReason:(id)a3;
- (void)setOriginIsControlCenter:(BOOL)a3;
- (void)setReferrerBundleID:(id)a3;
- (void)setSourceBundleID:(id)a3;
- (void)setUsedByPPT:(BOOL)a3;
@end

@implementation CPSSessionProxy

- (CPSSessionProxy)initWithURL:(id)a3
{
  id v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)CPSSessionProxy,
        (self = [(CPSSessionProxy *)&v9 init]) != 0))
  {
    v5 = (NSURL *)[v4 copy];
    url = self->_url;
    self->_url = v5;

    self->_mutableIvarLock._os_unfair_lock_opaque = 0;
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSURL *)self->_url isEqual:v4[3]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canRequestLocationConfirmation
{
  v2 = [(CPSSessionProxy *)self launchReason];
  if (([v2 isEqualToString:@"QR"] & 1) != 0
    || ([v2 isEqualToString:@"AppclipCode"] & 1) != 0
    || ([v2 isEqualToString:@"NFC"] & 1) != 0
    || ([v2 isEqualToString:@"ClipTester"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 bundleIdentifier];
    char v3 = [v6 isEqualToString:@"com.apple.ClipTester"];
  }
  return v3;
}

- (NSString)launchReason
{
  char v3 = [(CPSSessionProxy *)self configuration];
  id v4 = [v3 launchReason];
  launchReason = v4;
  if (!v4) {
    launchReason = self->_launchReason;
  }
  v6 = launchReason;

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = @"Other";
  }
  v8 = v7;

  return v8;
}

- (void)connectToService
{
  id v3 = +[CPSDaemonConnection sharedConnection];
  [v3 registerSessionProxy:self];
}

- (void)disconnect
{
  id v3 = +[CPSDaemonConnection sharedConnection];
  [v3 unregisterSessionProxy:self];
}

- (void)prewarmClip
{
}

- (void)prewarmClipWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[CPSDaemonConnection sharedConnection];
  [v5 prewarmClipWithURL:self->_url completionHandler:v4];
}

- (void)fetchClipMetadataAndImages
{
  id v3 = +[CPSDaemonConnection sharedConnection];
  [v3 fetchClipMetadataAndImagesWithURL:self->_url completionHandler:0];
}

- (void)installClip
{
}

- (void)installClipWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[CPSDaemonConnection sharedConnection];
  [v5 installClipWithURL:self->_url completionHandler:v4];
}

- (void)cancel
{
  id v3 = +[CPSDaemonConnection sharedConnection];
  url = self->_url;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__CPSSessionProxy_cancel__block_invoke;
  v6[3] = &unk_26424E6A0;
  id v7 = v3;
  v8 = self;
  id v5 = v3;
  [v5 cancelPrewarmingClipWithURL:url completionHandler:v6];
}

uint64_t __25__CPSSessionProxy_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unregisterSessionProxy:*(void *)(a1 + 40)];
}

- (void)openClipWithLaunchOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CPSDaemonConnection sharedConnection];
  [v8 openClipWithURL:self->_url launchOptions:v7 completion:v6];
}

- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSDaemonConnection sharedConnection];
  [v7 notifyWebClipActivationWithBundleID:v6 referrerBundleID:v5];
}

- (void)getLastLaunchOptionsWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  id v4 = [(CPSClipMetadata *)self->_metadata clipBundleID];

  if (v4)
  {
    id v5 = +[CPSDaemonConnection sharedConnection];
    id v6 = [(CPSClipMetadata *)self->_metadata clipBundleID];
    [v5 getLastLaunchOptionsWithBundleID:v6 completion:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)checkAndConsumeShowsAppAttributionBannerWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  os_unfair_lock_lock(&self->_mutableIvarLock);
  if (self->_showAppAttributionBannerCallback)
  {
    os_unfair_lock_unlock(&self->_mutableIvarLock);
    v6[2](v6, 0);
  }
  else
  {
    id v4 = (void *)MEMORY[0x2166BE5C0](v6);
    id showAppAttributionBannerCallback = self->_showAppAttributionBannerCallback;
    self->_id showAppAttributionBannerCallback = v4;

    os_unfair_lock_unlock(&self->_mutableIvarLock);
    [(CPSSessionProxy *)self _checkAndConsumeShowsAppAttributionBannerIfNeeded];
  }
}

- (void)_checkAndConsumeShowsAppAttributionBannerIfNeeded
{
  p_mutableIvarLock = &self->_mutableIvarLock;
  os_unfair_lock_lock(&self->_mutableIvarLock);
  if (self->_showAppAttributionBannerCallback
    && !self->_isCheckingAppAttributionBannerCanShow
    && ([(CPSClipMetadata *)self->_metadata clipBundleID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    self->_isCheckingAppAttributionBannerCanShow = 1;
    os_unfair_lock_unlock(p_mutableIvarLock);
    objc_initWeak(&location, self);
    id v5 = +[CPSDaemonConnection sharedConnection];
    id v6 = [(CPSClipMetadata *)self->_metadata webClipID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__CPSSessionProxy__checkAndConsumeShowsAppAttributionBannerIfNeeded__block_invoke;
    v7[3] = &unk_26424F830;
    objc_copyWeak(&v8, &location);
    [v5 checkAndConsumeShowsAppAttributionBannerForBundleID:v6 completion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(p_mutableIvarLock);
  }
}

void __68__CPSSessionProxy__checkAndConsumeShowsAppAttributionBannerIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained + 2;
    id v7 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    LOBYTE(v7[3]._os_unfair_lock_opaque) = 0;
    id v5 = (void (**)(void, void))MEMORY[0x2166BE5C0](*(void *)&v7[4]._os_unfair_lock_opaque);
    id v6 = *(void **)&v7[4]._os_unfair_lock_opaque;
    *(void *)&v7[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v4);
    v5[2](v5, a2);

    WeakRetained = v7;
  }
}

- (void)didDetermineAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 proxy:self didDetermineAvailability:v3];
  }
}

- (void)didUpdateMetadata:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  [(CPSSessionProxy *)self _checkAndConsumeShowsAppAttributionBannerIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 proxyDidUpdateMetadata:self];
  }
}

- (void)didFinishLoadingWithError:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 proxy:self didFinishLoadingWithError:v7];
  }
}

- (void)didUpdateInstallProgress:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_estimatedProgress, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 proxyDidChangeProgress:self];
  }
}

- (void)didInstallApplicationPlaceholder
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 proxyDidInstallApplicationPlaceholder:self];
  }
}

- (void)didRetrieveApplicationIcon:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_applicationIconFileURL, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained proxy:self didRetrieveApplicationIcon:v6];
  }
}

- (void)didRetrieveBusinessIcon:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_businessIconURL, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained proxyDidRetrieveBusinessIcon:self];
  }
}

- (void)didRetrieveHeroImage:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_heroImageFileURL, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained proxy:self didRetrieveHeroImage:v6];
  }
}

- (void)didFinishTestingAtTime:(double)a3
{
  self->_appLaunchTime = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained proxyAppDidLaunchForTesting:self];
  }
}

- (void)remoteServiceDidCrash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained proxyRemoteServiceDidCrash:self];
  }
}

- (CPSSessionProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSSessionProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (CPSClipMetadata)metadata
{
  return self->_metadata;
}

- (NSNumber)estimatedProgress
{
  return self->_estimatedProgress;
}

- (NSURL)applicationIconFileURL
{
  return self->_applicationIconFileURL;
}

- (NSURL)heroImageFileURL
{
  return self->_heroImageFileURL;
}

- (BOOL)usedByPPT
{
  return self->_usedByPPT;
}

- (void)setUsedByPPT:(BOOL)a3
{
  self->_usedByPPT = a3;
}

- (BOOL)originIsControlCenter
{
  return self->_originIsControlCenter;
}

- (void)setOriginIsControlCenter:(BOOL)a3
{
  self->_originIsControlCenter = a3;
}

- (void)setLaunchReason:(id)a3
{
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (void)setSourceBundleID:(id)a3
{
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void)setReferrerBundleID:(id)a3
{
}

- (CPSSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (double)appLaunchTime
{
  return self->_appLaunchTime;
}

- (NSURL)businessIconURL
{
  return self->_businessIconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessIconURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_heroImageFileURL, 0);
  objc_storeStrong((id *)&self->_applicationIconFileURL, 0);
  objc_storeStrong((id *)&self->_estimatedProgress, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong(&self->_showAppAttributionBannerCallback, 0);
}

@end