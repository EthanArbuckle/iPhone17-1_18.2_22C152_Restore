@interface SLComposeViewController
+ (BOOL)_isAvailableForServiceType:(id)a3 inHostApplicationBundleID:(id)a4;
+ (BOOL)_isMultiUserDevice;
+ (BOOL)_isServiceType:(id)a3;
+ (BOOL)_legacyBuiltInAvailabilityForService:(id)a3 inHostApplicationBundleID:(id)a4;
+ (BOOL)isAvailableForExtension:(id)a3;
+ (BOOL)isAvailableForExtension:(id)a3 inHostApplicationBundleID:(id)a4;
+ (BOOL)isAvailableForServiceType:(NSString *)serviceType;
+ (SLComposeViewController)composeViewControllerForServiceType:(NSString *)serviceType;
+ (id)_extensionIdentifierForServiceType:(id)a3;
+ (id)_serviceTypeForExtensionIdentifier:(id)a3;
+ (id)_serviceTypeToExtensionIdentifierMap;
+ (id)_shareExtensionWithIdentifier:(id)a3;
+ (id)_unsupportedServiceTypes;
+ (id)composeViewControllerForExtension:(id)a3;
+ (id)extensionIdentifierForActivityType:(id)a3;
- (BOOL)_addImageAsset:(id)a3 preview:(id)a4;
- (BOOL)_addImageJPEGData:(id)a3 preview:(id)a4;
- (BOOL)_addURL:(id)a3 type:(int64_t)a4 preview:(id)a5;
- (BOOL)_addVideoAsset:(id)a3 preview:(id)a4;
- (BOOL)_addVideoData:(id)a3 preview:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_useCustomDimmingView;
- (BOOL)addAttachment:(id)a3;
- (BOOL)addExtensionItem:(id)a3;
- (BOOL)addImage:(UIImage *)image;
- (BOOL)addImageAsset:(id)a3;
- (BOOL)addItemProvider:(id)a3;
- (BOOL)addURL:(NSURL *)url;
- (BOOL)addURL:(id)a3 withPreviewImage:(id)a4;
- (BOOL)canAddContent;
- (BOOL)removeAllImages;
- (BOOL)removeAllURLs;
- (BOOL)setInitialText:(NSString *)text;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)supportsImageAsset:(id)a3;
- (BOOL)supportsVideoAsset:(id)a3;
- (NSString)serviceType;
- (SLComposeViewController)initWithExtension:(id)a3 requestedServiceType:(id)a4;
- (SLComposeViewController)initWithServiceType:(id)a3;
- (SLComposeViewControllerCompletionHandler)completionHandler;
- (UIViewController)remoteViewController;
- (id)_urlForUntypedAsset:(id)a3;
- (id)addDownSampledImageDataByProxyWithPreviewImage:(id)a3;
- (void)_handleRemoteViewFailure;
- (void)_instantiateAndBeginExtensionIfNeeded;
- (void)_instantiateAndBeginExtensionIfNeededWithCompletion:(id)a3;
- (void)completeWithResult:(int64_t)a3;
- (void)dealloc;
- (void)didLoadSheetViewController;
- (void)remoteController:(id)a3 didLoadWithError:(id)a4;
- (void)remoteViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)setCompletionHandler:(SLComposeViewControllerCompletionHandler)completionHandler;
- (void)setRemoteViewController:(id)a3;
- (void)userDidCancel;
- (void)userDidPost;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SLComposeViewController

+ (id)_unsupportedServiceTypes
{
  if (_unsupportedServiceTypes_onceToken != -1) {
    dispatch_once(&_unsupportedServiceTypes_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_unsupportedServiceTypes__unsupportedServiceTypes;

  return v2;
}

uint64_t __51__SLComposeViewController__unsupportedServiceTypes__block_invoke()
{
  _unsupportedServiceTypes__unsupportedServiceTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.social.facebook", @"com.apple.social.twitter", @"com.apple.social.sinaweibo", @"com.apple.social.flickr", @"com.apple.social.vimeo", @"com.apple.social.tencentweibo", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)_serviceTypeToExtensionIdentifierMap
{
  if (_serviceTypeToExtensionIdentifierMap_onceToken != -1) {
    dispatch_once(&_serviceTypeToExtensionIdentifierMap_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)_serviceTypeToExtensionIdentifierMap__map;

  return v2;
}

void __63__SLComposeViewController__serviceTypeToExtensionIdentifierMap__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.social.facebook";
  v2[1] = @"com.apple.social.twitter";
  v3[0] = @"com.apple.share.Facebook.post";
  v3[1] = @"com.apple.share.Twitter.post";
  v2[2] = @"com.apple.social.sinaweibo";
  v2[3] = @"com.apple.social.flickr";
  v3[2] = @"com.apple.share.SinaWeibo.post";
  v3[3] = @"com.apple.share.Flickr.post";
  v2[4] = @"com.apple.social.vimeo";
  v2[5] = @"com.apple.social.tencentweibo";
  v3[4] = @"com.apple.share.Vimeo.post";
  v3[5] = @"com.apple.share.TencentWeibo.post";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)_serviceTypeToExtensionIdentifierMap__map;
  _serviceTypeToExtensionIdentifierMap__map = v0;
}

+ (id)_extensionIdentifierForServiceType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _serviceTypeToExtensionIdentifierMap];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)_serviceTypeForExtensionIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 _serviceTypeToExtensionIdentifierMap];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v5, "allKeys", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v5 objectForKey:v10];
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)_isServiceType:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SLComposeViewController__isServiceType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = _isServiceType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isServiceType__onceToken, block);
  }
  char v5 = [(id)_isServiceType___serviceTypes containsObject:v4];

  return v5;
}

void __42__SLComposeViewController__isServiceType___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _serviceTypeToExtensionIdentifierMap];
  uint64_t v1 = [v3 allKeys];
  v2 = (void *)_isServiceType___serviceTypes;
  _isServiceType___serviceTypes = v1;
}

+ (id)extensionIdentifierForActivityType:(id)a3
{
  v13[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F435E8];
  v12[0] = *MEMORY[0x1E4F435D0];
  v12[1] = v4;
  v13[0] = @"com.apple.share.Facebook.post";
  v13[1] = @"com.apple.share.Twitter.post";
  uint64_t v5 = *MEMORY[0x1E4F435D8];
  v12[2] = *MEMORY[0x1E4F435F8];
  v12[3] = v5;
  v13[2] = @"com.apple.share.SinaWeibo.post";
  v13[3] = @"com.apple.share.Flickr.post";
  uint64_t v6 = *MEMORY[0x1E4F435E0];
  v12[4] = *MEMORY[0x1E4F435F0];
  v12[5] = v6;
  v13[4] = @"com.apple.share.Vimeo.post";
  v13[5] = @"com.apple.share.TencentWeibo.post";
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:6];
  v11 = [v9 objectForKey:v8];
  _SLLog(v3, 7, @"SLComposeViewController extensionIdentifierForActivityType: %@ => %@");

  return v11;
}

+ (id)_shareExtensionWithIdentifier:(id)a3
{
  uint64_t v3 = _shareExtensionWithIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_shareExtensionWithIdentifier__onceToken, &__block_literal_global_24_0);
  }
  uint64_t v5 = [(id)_shareExtensionWithIdentifier___identifierToMatcherMap objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 extension];

  return v6;
}

void __57__SLComposeViewController__shareExtensionWithIdentifier___block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"com.apple.share.Facebook.post";
  uint64_t v0 = [[_SLExtensionLazyMatcher alloc] initWithIdentifier:@"com.apple.share.Facebook.post"];
  v9[0] = v0;
  v8[1] = @"com.apple.share.Twitter.post";
  uint64_t v1 = [[_SLExtensionLazyMatcher alloc] initWithIdentifier:@"com.apple.share.Twitter.post"];
  v9[1] = v1;
  v8[2] = @"com.apple.share.SinaWeibo.post";
  v2 = [[_SLExtensionLazyMatcher alloc] initWithIdentifier:@"com.apple.share.SinaWeibo.post"];
  v9[2] = v2;
  v8[3] = @"com.apple.share.Flickr.post";
  uint64_t v3 = [[_SLExtensionLazyMatcher alloc] initWithIdentifier:@"com.apple.share.Flickr.post"];
  v9[3] = v3;
  v8[4] = @"com.apple.share.Vimeo.post";
  id v4 = [[_SLExtensionLazyMatcher alloc] initWithIdentifier:@"com.apple.share.Vimeo.post"];
  v9[4] = v4;
  v8[5] = @"com.apple.share.TencentWeibo.post";
  uint64_t v5 = [[_SLExtensionLazyMatcher alloc] initWithIdentifier:@"com.apple.share.TencentWeibo.post"];
  v9[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  id v7 = (void *)_shareExtensionWithIdentifier___identifierToMatcherMap;
  _shareExtensionWithIdentifier___identifierToMatcherMap = v6;
}

+ (BOOL)_legacyBuiltInAvailabilityForService:(id)a3 inHostApplicationBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFirstClassService])
  {
    if ((![v7 hasPrefix:@"com.apple."]
       || ![v7 compare:@"com.apple.gamecenter.GameCenterUIService" options:1])
      && ([v6 hasAccounts] & 1) == 0)
    {
      goto LABEL_5;
    }
LABEL_7:
    int v8 = [a1 _isMultiUserDevice] ^ 1;
    goto LABEL_8;
  }
  if ([v6 hasAccounts]) {
    goto LABEL_7;
  }
LABEL_5:
  LOBYTE(v8) = 0;
LABEL_8:

  return v8;
}

+ (BOOL)_isMultiUserDevice
{
  if (_isMultiUserDevice_onceToken != -1) {
    dispatch_once(&_isMultiUserDevice_onceToken, &__block_literal_global_33);
  }
  return _isMultiUserDevice_isMultiUserDevice;
}

void __45__SLComposeViewController__isMultiUserDevice__block_invoke()
{
  id v3 = (id)MKBUserTypeDeviceMode();
  uint64_t v1 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
  int v2 = [v1 isEqualToString:*MEMORY[0x1E4F78108]];
  _isMultiUserDevice_isMultiUserDevice = v2;
  if (v2) {
    _SLLog(v0, 7, @"Built-in Social services disabled for multi-user mode.");
  }
}

+ (BOOL)isAvailableForExtension:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 mainBundle];
  id v7 = [v6 bundleIdentifier];
  LOBYTE(a1) = [a1 isAvailableForExtension:v5 inHostApplicationBundleID:v7];

  return (char)a1;
}

+ (BOOL)isAvailableForServiceType:(NSString *)serviceType
{
  id v5 = serviceType;
  id v6 = [a1 _unsupportedServiceTypes];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    _SLLog(v3, 3, @"isAvailableForServiceType: for %@ returning NO");
    char v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 bundleIdentifier];
    char v8 = [a1 _isAvailableForServiceType:v5 inHostApplicationBundleID:v10];
  }
  return v8;
}

+ (BOOL)isAvailableForExtension:(id)a3 inHostApplicationBundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"SLComposeViewController isAvailableForExtension: %@ inHostApplicationBundleID: %@");
  v9 = objc_msgSend(v7, "_plugIn", v7, v8);
  v10 = [v9 supersededBy];

  if (v10)
  {
    char v11 = 1;
  }
  else
  {
    int v12 = [v7 identifier];
    v13 = [a1 _serviceTypeForExtensionIdentifier:v12];

    _SLLog(v4, 7, @"SLComposeViewController isAvailableForExtension: %@ inHostApplicationBundleID: %@ got serviceType %@");
    if (v13)
    {
      long long v14 = +[SLService serviceForServiceType:](SLService, "serviceForServiceType:", v13, v7, v8, v13);
      char v11 = [a1 _legacyBuiltInAvailabilityForService:v14 inHostApplicationBundleID:v8];
    }
    else
    {
      char v11 = 1;
    }
  }
  return v11;
}

+ (BOOL)_isAvailableForServiceType:(id)a3 inHostApplicationBundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"SLComposeViewController isAvailableForServiceType %@");
  int v9 = objc_msgSend(a1, "_isServiceType:", v7, v7);
  id v10 = v7;
  if (v9)
  {
    char v11 = [a1 _extensionIdentifierForServiceType:v10];
    int v12 = v10;
  }
  else
  {
    int v12 = [a1 _serviceTypeForExtensionIdentifier:v10];
    char v11 = v10;
  }
  if (v12)
  {
    v13 = +[SLService serviceForServiceType:v12];
    uint64_t v14 = [a1 _legacyBuiltInAvailabilityForService:v13 inHostApplicationBundleID:v8];

    [NSNumber numberWithBool:v14];
    v21 = v20 = v12;
    _SLLog(v4, 7, @"SLComposeViewController isAvailableForServiceType got serviceType %@ isAvailable %@");

    if ((v14 & 1) == 0)
    {
      long long v15 = +[SLComposeViewController _shareExtensionWithIdentifier:](SLComposeViewController, "_shareExtensionWithIdentifier:", v11, v12, v21);
      _SLLog(v4, 7, @"SLComposeViewController isAvailableForServiceType got extension %@ for extensionIdentifer %@");
      if (v15)
      {
        long long v16 = objc_msgSend(v15, "_plugIn", v15, v11);
        long long v17 = [v16 supersededBy];

        if (v17)
        {
          v20 = v11;
          _SLLog(v4, 7, @"SLComposeViewController isAvailableForServiceType returning YES for overridden extensionIdentifier %@");
          BOOL v18 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v20 = v11;
        _SLLog(v4, 3, @"SLComposeViewController isAvailableForServiceType failed to get extension for identifier %@");
      }
      BOOL v18 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v20 = v11;
    _SLLog(v4, 7, @"SLComposeViewController isAvailableForServiceType returning YES for extensionIdentifer %@");
  }
  BOOL v18 = 1;
LABEL_14:
  v22 = objc_msgSend(NSNumber, "numberWithBool:", v18, v20);
  _SLLog(v4, 7, @"SLComposeViewController isAvailableForServiceType %@ returning %@");

  return v18;
}

- (SLComposeViewController)initWithExtension:(id)a3 requestedServiceType:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  _SLLog(v4, 7, @"SLComposeViewController initWithExtension: %@ requestedServiceType: %@");
  id v10 = objc_opt_class();
  char v11 = objc_msgSend(v8, "identifier", v8, v9);
  int v12 = [v10 _serviceTypeForExtensionIdentifier:v11];

  if (v12)
  {
    v13 = +[SLService serviceForServiceType:v12];
    if (([v13 isFirstClassService] & 1) == 0 && !objc_msgSend(v13, "hasAccounts"))
    {
      uint64_t v14 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    v13 = 0;
  }
  v38.receiver = self;
  v38.super_class = (Class)SLComposeViewController;
  long long v15 = [(SLComposeViewController *)&v38 initWithNibName:0 bundle:0];
  long long v16 = v15;
  if (v15)
  {
    p_extension = (id *)&v15->_extension;
    objc_storeStrong((id *)&v15->_extension, a3);
    uint64_t v18 = objc_opt_new();
    itemProviders = v16->_itemProviders;
    v16->_itemProviders = (NSArray *)v18;

    if (v9) {
      v20 = (__CFString *)v9;
    }
    else {
      v20 = &stru_1F1E28690;
    }
    serviceType = v16->_serviceType;
    v16->_serviceType = &v20->isa;

    if (v13)
    {
      v16->_maximumImageCount = [v13 maximumImageCount];
      v16->_maximumURLCount = [v13 maximumURLCount];
      v16->_maximumVideoCount = [v13 maximumVideoCount];
    }
    else
    {
      v16->_maximumImageCount = 0;
      v16->_maximumURLCount = 0;
      v16->_maximumVideoCount = 0;
      v22 = [*p_extension attributes];
      v23 = [v22 objectForKeyedSubscript:@"NSExtensionActivationRule"];

      if (v23)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [v23 objectForKeyedSubscript:@"NSExtensionActivationSupportsImageWithMaxCount"];
          if (v24)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v16->_maximumImageCount = [v24 integerValue];
            }
          }
          v25 = [v23 objectForKeyedSubscript:@"NSExtensionActivationSupportsWebURLWithMaxCount"];

          if (v25)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v16->_maximumURLCount = [v25 integerValue];
            }
          }
          v26 = [v23 objectForKeyedSubscript:@"NSExtensionActivationSupportsMovieWithMaxCount"];

          if (v26)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v16->_maximumVideoCount = [v26 integerValue];
            }
          }
        }
        else
        {
          v16->_maximumImageCount = -1;
          v16->_maximumURLCount = -1;
          v16->_maximumVideoCount = -1;
        }
      }
    }
    if (!*p_extension) {
      v16->_didFailLoadingRemoteViewController = 1;
    }
    objc_initWeak(&location, v16);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke;
    v35[3] = &unk_1E6467830;
    objc_copyWeak(&v36, &location);
    [*p_extension setRequestCompletionBlock:v35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_3;
    v33[3] = &unk_1E6467680;
    objc_copyWeak(&v34, &location);
    [*p_extension setRequestCancellationBlock:v33];
    v27 = [(SLComposeViewController *)v16 view];
    [v27 setOpaque:0];

    v28 = [(SLComposeViewController *)v16 view];
    [v28 setClipsToBounds:0];

    v29 = [MEMORY[0x1E4F428B8] clearColor];
    v30 = [(SLComposeViewController *)v16 view];
    [v30 setBackgroundColor:v29];

    v31 = [(SLComposeViewController *)v16 view];
    [v31 setAutoresizingMask:18];

    [(SLComposeViewController *)v16 setModalPresentationStyle:17];
    [(SLComposeViewController *)v16 setShouldForceNonAnimatedTransition:1];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  self = v16;
  uint64_t v14 = self;
LABEL_30:

  return v14;
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_2;
  block[3] = &unk_1E6467720;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained completeWithResult:1];
    id WeakRetained = v2;
  }
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_4;
  block[3] = &unk_1E6467720;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained completeWithResult:0];
    id WeakRetained = v2;
  }
}

- (SLComposeViewController)initWithServiceType:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLComposeViewController initWithServiceType: %@");
  if (objc_msgSend((id)objc_opt_class(), "_isServiceType:", v5, v5))
  {
    id v6 = v5;
    id v7 = [(id)objc_opt_class() _extensionIdentifierForServiceType:v6];
  }
  else
  {
    id v6 = [(id)objc_opt_class() _serviceTypeForExtensionIdentifier:v5];
    id v7 = v5;
  }
  id v8 = v7;
  id v9 = +[SLComposeViewController _shareExtensionWithIdentifier:v7];
  uint64_t v18 = v9;
  _SLLog(v3, 7, @"SLComposeViewController initWithServiceType got extension %@ for identifier %@");
  if (v9) {
    goto LABEL_7;
  }
  id v10 = +[SLComposeViewController _unsupportedServiceTypes];
  int v11 = [v10 containsObject:v8];

  if (!v11) {
    goto LABEL_7;
  }
  int v12 = +[SLService serviceForServiceType:v6];
  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v14 = [v13 bundleIdentifier];
  BOOL v15 = +[SLComposeViewController _legacyBuiltInAvailabilityForService:v12 inHostApplicationBundleID:v14];

  if (v15)
  {
LABEL_7:
    self = -[SLComposeViewController initWithExtension:requestedServiceType:](self, "initWithExtension:requestedServiceType:", v9, v6, v18);
    long long v16 = self;
  }
  else
  {
    _SLLog(v3, 3, @"SLComposeViewController initWithServiceType failed to get extension for identifier %@");
    long long v16 = 0;
  }

  return v16;
}

+ (id)composeViewControllerForExtension:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [a1 _serviceTypeForExtensionIdentifier:v5];

  id v7 = (void *)[objc_alloc((Class)a1) initWithExtension:v4 requestedServiceType:v6];

  return v7;
}

+ (SLComposeViewController)composeViewControllerForServiceType:(NSString *)serviceType
{
  id v4 = serviceType;
  id v5 = (void *)[objc_alloc((Class)a1) initWithServiceType:v4];

  return (SLComposeViewController *)v5;
}

- (void)dealloc
{
  _SLLog(v2, 7, @"SLComposeViewController dealloc %@");
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", self);
  [v4 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SLComposeViewController;
  [(SLComposeViewController *)&v6 dealloc];
}

- (BOOL)canAddContent
{
  return !self->_wasPresented;
}

- (BOOL)setInitialText:(NSString *)text
{
  id v4 = text;
  BOOL v5 = [(SLComposeViewController *)self canAddContent];
  if (v5)
  {
    objc_super v6 = (NSString *)[(NSString *)v4 copy];
    initialText = self->_initialText;
    self->_initialText = v6;
  }
  return v5;
}

- (BOOL)supportsImageAsset:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 6, @"supportsImageAsset start");
  objc_super v6 = [(SLComposeViewController *)self _urlForUntypedAsset:v5];

  return v6 != 0;
}

- (BOOL)supportsVideoAsset:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"supportsVideoAsset start");
  objc_super v6 = [(SLComposeViewController *)self _urlForUntypedAsset:v5];

  return v6 != 0;
}

- (id)_urlForUntypedAsset:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 defaultRepresentation];
    id v6 = [v5 url];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
    }
    else
    {
      _SLLog(v3, 3, @"Unsupported asset type");
      id v6 = 0;
    }
  }

  return v6;
}

- (BOOL)addImageAsset:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"addImageAsset: start");
  LOBYTE(self) = [(SLComposeViewController *)self _addImageAsset:v5 preview:0];

  return (char)self;
}

- (BOOL)_addImageAsset:(id)a3 preview:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"SLComposeViewController _addImageAsset: %@ preview: %@");
  if (!-[SLComposeViewController supportsImageAsset:](self, "supportsImageAsset:", v7, v7, v8))
  {
    _SLLog(v4, 3, @"Asset type not supported");
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
  if (![(SLComposeViewController *)self canAddContent]) {
    goto LABEL_11;
  }
  int64_t maximumImageCount = self->_maximumImageCount;
  if (maximumImageCount != -1 && self->_numImagesAdded >= maximumImageCount) {
    goto LABEL_11;
  }
  id v10 = [v7 scheme];
  int v11 = [v10 isEqualToString:@"file"];
  int v12 = (id *)MEMORY[0x1E4F225B8];
  if (!v11) {
    int v12 = (id *)MEMORY[0x1E4F226F8];
  }
  id v13 = *v12;

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v7 typeIdentifier:v13];
  v23[0] = @"SLItemProviderIsImage";
  v23[1] = @"SLItemProviderHasPreview";
  v24[0] = MEMORY[0x1E4F1CC38];
  BOOL v15 = [NSNumber numberWithInt:v8 != 0];
  v24[1] = v15;
  long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v14 setUserInfo:v16];

  if (v8)
  {
    _SLLog(v4, 7, @"SLComposeViewController _addImageAsset:preview: supplying itemProvider.previewImageHandler");
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__SLComposeViewController__addImageAsset_preview___block_invoke;
    v21[3] = &unk_1E6467858;
    id v22 = v8;
    [v14 setPreviewImageHandler:v21];
  }
  ++self->_numImagesAdded;
  long long v17 = [(NSArray *)self->_itemProviders arrayByAddingObject:v14];
  itemProviders = self->_itemProviders;
  self->_itemProviders = v17;

  BOOL v19 = 1;
LABEL_12:

  return v19;
}

void __50__SLComposeViewController__addImageAsset_preview___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 7, @"SLComposeViewController _addImageAsset:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@");
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), 0);
}

- (BOOL)addImage:(UIImage *)image
{
  id v5 = image;
  _SLLog(v3, 7, @"addImage start");
  if ([(SLComposeViewController *)self canAddContent]
    && ((int64_t maximumImageCount = self->_maximumImageCount, maximumImageCount == -1)
     || self->_numImagesAdded < maximumImageCount))
  {
    id v7 = UIImageJPEGRepresentation(v5, 0.8);
    BOOL v8 = [(SLComposeViewController *)self _addImageJPEGData:v7 preview:0];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_addImageJPEGData:(id)a3 preview:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(SLComposeViewController *)self canAddContent]
    && ((int64_t maximumImageCount = self->_maximumImageCount, maximumImageCount == -1)
     || self->_numImagesAdded < maximumImageCount))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28D78]);
    int v11 = (void *)[v10 initWithItem:v7 typeIdentifier:*MEMORY[0x1E4F22610]];
    v23[0] = @"SLItemProviderIsImage";
    v23[1] = @"SLItemProviderHasPreview";
    v24[0] = MEMORY[0x1E4F1CC38];
    int v12 = [NSNumber numberWithInt:v8 != 0];
    v24[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v11 setUserInfo:v13];

    if (v8)
    {
      _SLLog(v4, 7, @"SLComposeViewController _addImageJPEGData:preview: supplying itemProvider.previewImageHandler");
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __53__SLComposeViewController__addImageJPEGData_preview___block_invoke;
      v21 = &unk_1E6467858;
      id v22 = v8;
      [v11 setPreviewImageHandler:&v18];
    }
    ++self->_numImagesAdded;
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v11, v18, v19, v20, v21);
    uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v14;

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __53__SLComposeViewController__addImageJPEGData_preview___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 7, @"SLComposeViewController _addImageJPEGData:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@");
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), 0);
}

- (BOOL)removeAllImages
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SLComposeViewController *)self canAddContent];
  BOOL v5 = v4;
  if (v4)
  {
    BOOL v18 = v4;
    id v6 = (void *)[(NSArray *)self->_itemProviders mutableCopy];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v17 = 992;
    id v7 = self->_itemProviders;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "userInfo", v17);
          uint64_t v14 = [v13 objectForKeyedSubscript:@"SLItemProviderIsImage"];

          if (v14) {
            [v6 removeObject:v12];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    self->_numImagesAdded = 0;
    BOOL v15 = *(Class *)((char *)&self->super.super.super.isa + v17);
    *(Class *)((char *)&self->super.super.super.isa + v17) = (Class)v6;

    return v18;
  }
  else
  {
    _SLLog(v2, 6, @"Can't remove images - sheet already presented, returning NO");
  }
  return v5;
}

- (BOOL)_addVideoAsset:(id)a3 preview:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"SLComposeViewController _addVideoAsset: %@ preview: %@");
  if (-[SLComposeViewController supportsVideoAsset:](self, "supportsVideoAsset:", v7, v7, v8)
    && [(SLComposeViewController *)self canAddContent]
    && ((int64_t maximumVideoCount = self->_maximumVideoCount, maximumVideoCount == -1)
     || self->_numVideosAdded < maximumVideoCount))
  {
    uint64_t v10 = [v7 scheme];
    int v11 = [v10 isEqualToString:@"file"];
    int v12 = (id *)MEMORY[0x1E4F225B8];
    if (!v11) {
      int v12 = (id *)MEMORY[0x1E4F226F8];
    }
    id v13 = *v12;

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v7 typeIdentifier:v13];
    v23[0] = @"SLItemProviderIsVideo";
    v23[1] = @"SLItemProviderHasPreview";
    v24[0] = MEMORY[0x1E4F1CC38];
    BOOL v15 = [NSNumber numberWithInt:v8 != 0];
    v24[1] = v15;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v14 setUserInfo:v16];

    if (v8)
    {
      _SLLog(v4, 7, @"SLComposeViewController _addVideoAsset:preview: supplying itemProvider.previewImageHandler");
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __50__SLComposeViewController__addVideoAsset_preview___block_invoke;
      v21[3] = &unk_1E6467858;
      id v22 = v8;
      [v14 setPreviewImageHandler:v21];
    }
    ++self->_numVideosAdded;
    uint64_t v17 = [(NSArray *)self->_itemProviders arrayByAddingObject:v14];
    itemProviders = self->_itemProviders;
    self->_itemProviders = v17;

    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

void __50__SLComposeViewController__addVideoAsset_preview___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 7, @"SLComposeViewController _addVideoAsset:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@");
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), 0);
}

- (BOOL)_addVideoData:(id)a3 preview:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(SLComposeViewController *)self canAddContent]
    && ((int64_t maximumVideoCount = self->_maximumVideoCount, maximumVideoCount == -1)
     || self->_numVideosAdded < maximumVideoCount))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28D78]);
    int v11 = (void *)[v10 initWithItem:v7 typeIdentifier:*MEMORY[0x1E4F22660]];
    v23[0] = @"SLItemProviderIsVideo";
    v23[1] = @"SLItemProviderHasPreview";
    v24[0] = MEMORY[0x1E4F1CC38];
    int v12 = [NSNumber numberWithInt:v8 != 0];
    v24[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v11 setUserInfo:v13];

    if (v8)
    {
      _SLLog(v4, 7, @"SLComposeViewController _addVideoData:preview: supplying itemProvider.previewImageHandler");
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      long long v20 = __49__SLComposeViewController__addVideoData_preview___block_invoke;
      long long v21 = &unk_1E6467858;
      id v22 = v8;
      [v11 setPreviewImageHandler:&v18];
    }
    ++self->_numVideosAdded;
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v11, v18, v19, v20, v21);
    uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v14;

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __49__SLComposeViewController__addVideoData_preview___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 7, @"SLComposeViewController _addVideoData:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@");
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), 0);
}

- (BOOL)addURL:(NSURL *)url
{
  BOOL v5 = url;
  _SLLog(v3, 7, @"addURL: start");
  LOBYTE(self) = [(SLComposeViewController *)self addURL:v5 withPreviewImage:0];

  return (char)self;
}

- (BOOL)addURL:(id)a3 withPreviewImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isMusicStoreURL])
  {
    uint64_t v8 = 3;
  }
  else if ([v6 isAppStoreURL])
  {
    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  BOOL v9 = [(SLComposeViewController *)self _addURL:v6 type:v8 preview:v7];

  return v9;
}

- (BOOL)_addURL:(id)a3 type:(int64_t)a4 preview:(id)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v24 = [NSNumber numberWithInteger:a4];
  _SLLog(v5, 7, @"SLComposeViewController _addURL: %@ type: %@ preview: %@");

  if ([(SLComposeViewController *)self canAddContent]
    && ((int64_t maximumURLCount = self->_maximumURLCount, maximumURLCount == -1) || self->_numURLsAdded < maximumURLCount))
  {
    int v12 = [v9 scheme];
    int v13 = [v12 isEqualToString:@"file"];
    uint64_t v14 = (id *)MEMORY[0x1E4F225B8];
    if (!v13) {
      uint64_t v14 = (id *)MEMORY[0x1E4F226F8];
    }
    id v15 = *v14;

    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v9 typeIdentifier:v15];
    v28[0] = MEMORY[0x1E4F1CC38];
    v27[0] = @"SLItemProviderIsURL";
    v27[1] = @"SLAttachmentURLType";
    uint64_t v17 = [NSNumber numberWithInteger:a4];
    v28[1] = v17;
    v27[2] = @"SLItemProviderHasPreview";
    uint64_t v18 = [NSNumber numberWithInt:v10 != 0];
    v28[2] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    [v16 setUserInfo:v19];

    if (v10)
    {
      _SLLog(v5, 7, @"SLComposeViewController _addURL:type:preview: supplying itemProvider.previewImageHandler");
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __48__SLComposeViewController__addURL_type_preview___block_invoke;
      v25[3] = &unk_1E6467858;
      id v26 = v10;
      [v16 setPreviewImageHandler:v25];
    }
    ++self->_numURLsAdded;
    long long v20 = [(NSArray *)self->_itemProviders arrayByAddingObject:v16];
    itemProviders = self->_itemProviders;
    self->_itemProviders = v20;

    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

void __48__SLComposeViewController__addURL_type_preview___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 7, @"SLComposeViewController _addURL:type:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@");
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), 0);
}

- (BOOL)removeAllURLs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  _SLLog(v2, 7, @"SLComposeViewController removeAllURLs");
  BOOL v4 = [(SLComposeViewController *)self canAddContent];
  BOOL v5 = v4;
  if (v4)
  {
    BOOL v26 = v4;
    if ([(NSArray *)self->_extensionItems count])
    {
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 bundleIdentifier];
      int v8 = [v7 isEqualToString:@"com.apple.itunesu"];

      if (v8)
      {
        if (![(NSString *)self->_initialText length])
        {
          id v9 = [(NSArray *)self->_extensionItems objectAtIndexedSubscript:0];
          id v10 = [v9 attributedContentText];
          int v11 = [v10 string];
          initialText = self->_initialText;
          self->_initialText = v11;
        }
        extensionItems = self->_extensionItems;
        self->_extensionItems = 0;

        _SLLog(v2, 7, @"SLComposeViewController removeAllURLs did remove all _extensionItems and transfer the first items text to _initialText");
      }
    }
    v27 = (NSArray *)[(NSArray *)self->_itemProviders mutableCopy];
    _SLLog(v2, 7, @"SLComposeViewController removeAllURLs starting with mutableItemProviders %@");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v25 = self;
    uint64_t v14 = self->_itemProviders;
    uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v27);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v24 = [v19 userInfo];
          _SLLog(v2, 7, @"SLComposeViewController removeAllURLs examining itemProvider.userInfo %@");

          long long v20 = objc_msgSend(v19, "userInfo", v24);
          long long v21 = [v20 objectForKeyedSubscript:@"SLItemProviderIsURL"];

          if (v21) {
            [(NSArray *)v27 removeObject:v19];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    _SLLog(v2, 7, @"SLComposeViewController removeAllURLs ended with mutableItemProviders %@");
    v25->_numURLsAdded = 0;
    itemProviders = v25->_itemProviders;
    v25->_itemProviders = v27;

    return v26;
  }
  else
  {
    _SLLog(v2, 6, @"Can't remove URLs - sheet already presented, returning NO");
  }
  return v5;
}

- (BOOL)addItemProvider:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLComposeViewController addItemProvider: %@");
  BOOL v6 = [(SLComposeViewController *)self canAddContent];
  if (v6)
  {
    id v7 = [(NSArray *)self->_itemProviders arrayByAddingObject:v5];
    itemProviders = self->_itemProviders;
    self->_itemProviders = v7;
  }
  else
  {
    _SLLog(v3, 6, @"Can't addItemProvider - sheet already presented, returning NO");
  }

  return v6;
}

- (BOOL)addExtensionItem:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _SLLog(v3, 7, @"SLComposeViewController addExtensionItem: %@");
  BOOL v6 = [(SLComposeViewController *)self canAddContent];
  if (v6)
  {
    extensionItems = self->_extensionItems;
    if (extensionItems)
    {
      int v8 = [(NSArray *)extensionItems arrayByAddingObject:v5];
    }
    else
    {
      v11[0] = v5;
      int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    id v9 = self->_extensionItems;
    self->_extensionItems = v8;
  }
  else
  {
    _SLLog(v3, 6, @"Can't addExtensionItem - sheet already presented, returning NO");
  }

  return v6;
}

- (BOOL)addAttachment:(id)a3
{
  id v4 = a3;
  BOOL v5 = 0;
  switch([v4 type])
  {
    case 0:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      BOOL v8 = [(SLComposeViewController *)self _addImageJPEGData:v6 preview:v7];
      goto LABEL_11;
    case 2:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      BOOL v8 = [(SLComposeViewController *)self _addImageAsset:v6 preview:v7];
      goto LABEL_11;
    case 4:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      id v9 = self;
      id v10 = v6;
      uint64_t v11 = 0;
      goto LABEL_8;
    case 5:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      id v9 = self;
      id v10 = v6;
      uint64_t v11 = 3;
      goto LABEL_8;
    case 6:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      id v9 = self;
      id v10 = v6;
      uint64_t v11 = 4;
      goto LABEL_8;
    case 7:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      id v9 = self;
      id v10 = v6;
      uint64_t v11 = 5;
LABEL_8:
      BOOL v8 = [(SLComposeViewController *)v9 _addURL:v10 type:v11 preview:v7];
      goto LABEL_11;
    case 8:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      BOOL v8 = [(SLComposeViewController *)self _addVideoData:v6 preview:v7];
      goto LABEL_11;
    case 9:
      BOOL v6 = [v4 payload];
      id v7 = [v4 previewImage];
      BOOL v8 = [(SLComposeViewController *)self _addVideoAsset:v6 preview:v7];
LABEL_11:
      BOOL v5 = v8;

      break;
    default:
      break;
  }

  return v5;
}

- (id)addDownSampledImageDataByProxyWithPreviewImage:(id)a3
{
  _SLLog(v3, 3, @"addDownSampledImageDataByProxyWithPreviewImage is non-functional. please stop using it.");
  return &__block_literal_global_231;
}

void __74__SLComposeViewController_addDownSampledImageDataByProxyWithPreviewImage___block_invoke()
{
  _SLLog(v0, 3, @"you called the proxy block returned by addDownSampledImageDataByProxyWithPreviewImage. please stop using it.");
}

- (void)completeWithResult:(int64_t)a3
{
  int64_t v12 = a3;
  _SLLog(v3, 7, @"SLComposeViewController completeWithResult: %d");
  self->_didCompleteSheet = 1;
  if (self->_completionHandler)
  {
    BOOL v6 = [(SLComposeViewController *)self serviceType];
    if ([v6 isEqualToString:@"com.apple.social.sinaweibo"])
    {
      char v7 = dyld_program_sdk_at_least();

      completionHandler = (void (**)(id, int64_t))self->_completionHandler;
      if (completionHandler)
      {
        completionHandler[2](completionHandler, a3);
        id v9 = self->_completionHandler;
        self->_completionHandler = 0;
      }
      if ((v7 & 1) == 0)
      {
        _SLLog(v3, 6, @"Expecting client to dismiss SLComposeViewController.");
        return;
      }
    }
    else
    {

      id v10 = (void (**)(id, int64_t))self->_completionHandler;
      if (v10)
      {
        v10[2](v10, a3);
        id v11 = self->_completionHandler;
        self->_completionHandler = 0;
      }
    }
  }
  if ([(SLComposeViewController *)self isBeingDismissed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[SLComposeViewController isBeingDismissed](self, "isBeingDismissed"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 7, @"SLComposeViewController skipping explicit dismiss because isBeingDismissed is already %@");
  }
  else
  {
    _SLLog(v3, 7, @"SLComposeViewController automatically dismissing itself");
    id v13 = [(SLComposeViewController *)self presentingViewController];
    [v13 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)userDidCancel
{
}

- (void)userDidPost
{
}

- (void)didLoadSheetViewController
{
  uint64_t v3 = [(SLComposeViewController *)self remoteViewController];
  [v3 willMoveToParentViewController:self];

  id v4 = [(SLComposeViewController *)self remoteViewController];
  [(SLComposeViewController *)self addChildViewController:v4];

  BOOL v5 = [(SLComposeViewController *)self view];
  BOOL v6 = [(SLComposeViewController *)self remoteViewController];
  char v7 = [v6 view];
  [v5 addSubview:v7];

  BOOL v8 = [(SLComposeViewController *)self view];
  id v9 = [(SLComposeViewController *)self remoteViewController];
  id v10 = [v9 view];
  [v8 bringSubviewToFront:v10];

  id v11 = [(SLComposeViewController *)self view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  long long v20 = [(SLComposeViewController *)self remoteViewController];
  long long v21 = [v20 view];
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

  BOOL v22 = [(SLComposeViewController *)self remoteViewController];
  v23 = [v22 view];
  [v23 setAlpha:1.0];

  uint64_t v24 = [(SLComposeViewController *)self remoteViewController];
  [v24 didMoveToParentViewController:self];

  id v25 = [(SLComposeViewController *)self view];
  [v25 setNeedsLayout];
}

- (void)_handleRemoteViewFailure
{
  if ([(SLComposeViewController *)self isBeingPresented])
  {
    _SLLog(v2, 3, @"Sheet is being presented, delaying dismissal and callbacks");
  }
  else
  {
    _SLLog(v2, 3, @"Sheet not being presented, calling premature completion");
    [(SLComposeViewController *)self completeWithResult:0];
  }
  self->_hasInstantiatedExtensionUI = 1;
  self->_didFailLoadingRemoteViewController = 1;
}

- (void)remoteController:(id)a3 didLoadWithError:(id)a4
{
  id v8 = a3;
  if (a4)
  {
    _SLLog(v4, 3, @"HOST: Failed to load remote view controller with error: %@");
    [(SLComposeViewController *)self _handleRemoteViewFailure];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      _SLLog(v4, 7, @"SLComposeViewController received remoteViewController of class SLRemoteComposeViewController, and setting its delegate to self");
      [v8 setDelegate:self];
    }
    char v7 = [v8 view];
    [v7 setClipsToBounds:0];

    _SLLog(v4, 6, @"HOST: Successfully loaded remote SLComposeVC");
    [(SLComposeViewController *)self setRemoteViewController:v8];
    _SLLog(v4, 6, @"[remoteViewController setupRemoteViewController]");
    [(SLComposeViewController *)self setRemoteViewController:v8];
    [(SLComposeViewController *)self didLoadSheetViewController];
    _SLLog(v4, 6, @"Finished setting up remote view controller");
  }
}

- (void)remoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  _SLLog(v4, 7, @"SLComposeViewController remoteViewController: %@ didTerminateWithError: %@");
  if (!self->_didCompleteSheet)
  {
    [(SLComposeViewController *)self completeWithResult:0];
  }
}

- (BOOL)_useCustomDimmingView
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = a3;
  _SLLog(v3, 7, @"viewWillAppear");
  self->_wasPresented = 1;
  v7.receiver = self;
  v7.super_class = (Class)SLComposeViewController;
  [(SLComposeViewController *)&v7 viewWillAppear:v4];
  BOOL v6 = [MEMORY[0x1E4F42738] sharedApplication];
  self->_savedStatusBarStyle = [v6 statusBarStyle];

  [(SLComposeViewController *)self _instantiateAndBeginExtensionIfNeeded];
}

- (void)_instantiateAndBeginExtensionIfNeededWithCompletion:(id)a3
{
  id v5 = a3;
  if (!self->_hasInstantiatedExtensionUI && self->_extension)
  {
    [(SLComposeViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(NSArray *)self->_itemProviders count])
    {
      double v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_itemProviders, "count"));
      _SLLog(v3, 7, @"SLComposeViewController building implicit NSExtensionItem from array of %@ _itemProviders");

      id v7 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      objc_msgSend(v7, "setAttachments:", self->_itemProviders, v13);
      [v6 addObject:v7];
    }
    extensionItems = self->_extensionItems;
    if (extensionItems)
    {
      double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](extensionItems, "count"));
      _SLLog(v3, 7, @"SLComposeViewController including %@ explicit NSExtensionItems");

      objc_msgSend(v6, "addObjectsFromArray:", self->_extensionItems, v14);
    }
    if (self->_initialText)
    {
      initialText = self->_initialText;
      _SLLog(v3, 7, @"SLComposeViewController setting first extensionItem.attributedContentText to '%@'");
      if (!objc_msgSend(v6, "count", initialText))
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F28C80]);
        [v6 addObject:v9];
      }
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_initialText];
      id v11 = [v6 firstObject];
      [v11 setAttributedContentText:v10];
    }
    double v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    _SLLog(v3, 7, @"SLComposeViewController about to instantiate remote view controller with array of %@ NSExtensionItems");

    self->_hasInstantiatedExtensionUI = 1;
    extension = self->_extension;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__SLComposeViewController__instantiateAndBeginExtensionIfNeededWithCompletion___block_invoke;
    v17[3] = &unk_1E64678A0;
    v17[4] = self;
    id v18 = v5;
    -[NSExtension instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:](extension, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", v6, 0, v17, v16);
  }
}

void __79__SLComposeViewController__instantiateAndBeginExtensionIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = a4;
  _SLLog(v4, 7, @"SLComposeViewController finished instantiate remote view controller %@ error %{public}@ extension request identifier %@");
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "remoteController:didLoadWithError:", v8, v9, v8, v9, v11);
  [*(id *)(a1 + 32) _endDelayingPresentation];
}

- (void)_instantiateAndBeginExtensionIfNeeded
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SLComposeViewController;
  [(SLComposeViewController *)&v3 viewDidDisappear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v4 = a3;
  _SLLog(v3, 7, @"viewDidAppear");
  v7.receiver = self;
  v7.super_class = (Class)SLComposeViewController;
  [(SLComposeViewController *)&v7 viewDidAppear:v4];
  if (self->_didFailLoadingRemoteViewController)
  {
    _SLLog(v3, 6, @"ViewDidAppear, but remote VC failed, dismissing");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SLComposeViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E6467288;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41__SLComposeViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRemoteViewFailure];
}

- (void)viewDidUnload
{
  v2.receiver = self;
  v2.super_class = (Class)SLComposeViewController;
  [(SLComposeViewController *)&v2 viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  BOOL v4 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return a3 != 2 || v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (SLComposeViewControllerCompletionHandler)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(SLComposeViewControllerCompletionHandler)completionHandler
{
}

- (UIViewController)remoteViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_keyboardTrackingView, 0);
  objc_storeStrong((id *)&self->_keyboardTopConstraint, 0);
  objc_storeStrong((id *)&self->_extensionItems, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_initialText, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end