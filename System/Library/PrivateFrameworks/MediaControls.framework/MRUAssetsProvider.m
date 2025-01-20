@interface MRUAssetsProvider
+ (MRUAssetsProvider)sharedAssetsProvider;
+ (NSString)backwardSymbol;
+ (NSString)favoritePackageName;
+ (NSString)favoriteSymbol;
+ (NSString)forwardBackwardPackageName;
+ (NSString)forwardSymbol;
+ (NSString)pauseSymbol;
+ (NSString)playPauseStopPackageName;
+ (NSString)playSymbol;
+ (NSString)stopSymbol;
+ (NSString)suggestedRouteWaveformPackageName;
+ (NSString)suggestedRouteWaveformPackageStateOff;
+ (NSString)suggestedRouteWaveformPackageStateOn;
+ (NSString)volumeBoldPackageName;
+ (NSString)volumePackageName;
+ (NSString)volumeRTLPackageName;
+ (UIImage)airplay;
+ (UIImage)airplayVideo;
+ (UIImage)backward;
+ (UIImage)collapsedRoutingChevron;
+ (UIImage)controlOtherSpeakers;
+ (UIImage)dislike;
+ (UIImage)emptyArtwork;
+ (UIImage)expandedRoutingChevron;
+ (UIImage)forward;
+ (UIImage)genericDevices;
+ (UIImage)languageOptions;
+ (UIImage)like;
+ (UIImage)menu;
+ (UIImage)pause;
+ (UIImage)phone;
+ (UIImage)play;
+ (UIImage)routingAccessoryMultiDeselected;
+ (UIImage)routingAccessoryMultiSelected;
+ (UIImage)routingAccessorySelected;
+ (UIImage)sharing;
+ (UIImage)stop;
+ (UIImage)suggestedRouteTVRemote;
+ (UIImage)tvRemote;
+ (UIImage)volumeMax;
+ (UIImage)volumeMin;
+ (UIImage)volumeRelativeMinus;
+ (UIImage)volumeRelativePlus;
+ (UIImage)wirelessSharing;
+ (UIImage)wishlist;
+ (id)goBackwardForTimeInterval:(double)a3;
+ (id)goBackwardSymbolForTimeInterval:(double)a3;
+ (id)goForwardForTimeInterval:(double)a3;
+ (id)goForwardSymbolForTimeInterval:(double)a3;
+ (id)packageDescriptionWithName:(id)a3;
+ (id)packageWithName:(id)a3;
- (MRUAssetsProvider)init;
- (NSCache)applicationCache;
- (NSCache)imageCache;
- (NSDate)purgeApplicationCacheDate;
- (NSMutableDictionary)completionBlocks;
- (void)applicationIconForBundleIdentifier:(id)a3 appearance:(int64_t)a4 completion:(id)a5;
- (void)applicationIconForBundleIdentifier:(id)a3 size:(CGSize)a4 appearance:(int64_t)a5 completion:(id)a6;
- (void)applicationIconForBundleIdentifier:(id)a3 size:(CGSize)a4 traitCollection:(id)a5 completion:(id)a6;
- (void)applicationIconForBundleIdentifier:(id)a3 traitCollection:(id)a4 completion:(id)a5;
- (void)imageForURL:(id)a3 completion:(id)a4;
- (void)setPurgeApplicationCacheDate:(id)a3;
@end

@implementation MRUAssetsProvider

- (void)applicationIconForBundleIdentifier:(id)a3 traitCollection:(id)a4 completion:(id)a5
{
}

- (void)applicationIconForBundleIdentifier:(id)a3 size:(CGSize)a4 traitCollection:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  -[MRUAssetsProvider applicationIconForBundleIdentifier:size:appearance:completion:](self, "applicationIconForBundleIdentifier:size:appearance:completion:", v12, [a5 userInterfaceStyle] == 2, v11, width, height);
}

- (void)applicationIconForBundleIdentifier:(id)a3 size:(CGSize)a4 appearance:(int64_t)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v13 = (void (**)(void, void))v12;
  if (!v11)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
    goto LABEL_22;
  }
  if (MRMediaRemoteApplicationIsSystemMediaApplication())
  {
    uint64_t v14 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
LABEL_9:
    v15 = (void *)v14;

    id v11 = v15;
    goto LABEL_10;
  }
  if (MRMediaRemoteApplicationIsSystemPodcastApplication())
  {
    uint64_t v14 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    goto LABEL_9;
  }
  if (MRMediaRemoteApplicationIsSystemAppleTVApplication())
  {
    uint64_t v14 = MRMediaRemoteCopyLocalDeviceSystemAppleTVApplicationDisplayID();
    goto LABEL_9;
  }
LABEL_10:
  [(NSDate *)self->_purgeApplicationCacheDate timeIntervalSinceNow];
  if (-v16 >= 86400.0)
  {
    v17 = [MEMORY[0x1E4F1C9C8] now];
    purgeApplicationCacheDate = self->_purgeApplicationCacheDate;
    self->_purgeApplicationCacheDate = v17;

    [(NSCache *)self->_applicationCache removeAllObjects];
  }
  v19 = [(NSCache *)self->_applicationCache objectForKey:v11];
  if (!v19)
  {
    id v30 = 0;
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v11 allowPlaceholder:0 error:&v30];
    id v21 = v30;
    v19 = [NSNumber numberWithInt:v20 != 0];
    [(NSCache *)self->_applicationCache setObject:v19 forKey:v11];
    if (v21)
    {
      v22 = MCLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v32 = self;
        __int16 v33 = 2114;
        id v34 = v11;
        __int16 v35 = 2114;
        id v36 = v21;
        _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_ERROR, "%{public}@ coudln't find application with bundle: %{public}@ | error: %{public}@ ", buf, 0x20u);
      }
    }
  }
  if ([v19 BOOLValue])
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v11];
    v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v24 scale];
    double v26 = v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", width, height, v26);
    [v27 setAppearance:a5];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83__MRUAssetsProvider_applicationIconForBundleIdentifier_size_appearance_completion___block_invoke;
    v28[3] = &unk_1E5F10120;
    v29 = v13;
    [v23 getCGImageForImageDescriptor:v27 completion:v28];
  }
  else
  {
    v13[2](v13, 0);
  }

LABEL_22:
}

+ (MRUAssetsProvider)sharedAssetsProvider
{
  if (sharedAssetsProvider___onceToken != -1) {
    dispatch_once(&sharedAssetsProvider___onceToken, &__block_literal_global_41);
  }
  v2 = (void *)sharedAssetsProvider___sharedAssetsProvider;

  return (MRUAssetsProvider *)v2;
}

- (MRUAssetsProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRUAssetsProvider;
  v2 = [(MRUAssetsProvider *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    applicationCache = v2->_applicationCache;
    v2->_applicationCache = v7;
  }
  return v2;
}

void __41__MRUAssetsProvider_sharedAssetsProvider__block_invoke()
{
  v0 = objc_alloc_init(MRUAssetsProvider);
  v1 = (void *)sharedAssetsProvider___sharedAssetsProvider;
  sharedAssetsProvider___sharedAssetsProvider = (uint64_t)v0;
}

+ (UIImage)airplay
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"airplayaudio"];
}

+ (UIImage)airplayVideo
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"airplayvideo"];
}

+ (UIImage)genericDevices
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"tv.and.hifispeaker.fill"];
}

+ (UIImage)wirelessSharing
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill"];
}

+ (UIImage)controlOtherSpeakers
{
  if (+[MRUFeatureFlagProvider isNewControlsEnabled])
  {
    v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"tv.and.hifispeaker.fill.fill"];
    v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"tv.and.hifispeaker.fill"];
    }
    v5 = v4;
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"tv.and.hifispeaker.fill"];
  }

  return (UIImage *)v5;
}

+ (NSString)playSymbol
{
  return (NSString *)@"play.fill";
}

+ (NSString)pauseSymbol
{
  return (NSString *)@"pause.fill";
}

+ (NSString)stopSymbol
{
  return (NSString *)@"stop.fill";
}

+ (NSString)backwardSymbol
{
  return (NSString *)@"backward.fill";
}

+ (NSString)forwardSymbol
{
  return (NSString *)@"forward.fill";
}

+ (NSString)favoriteSymbol
{
  return (NSString *)@"favorite";
}

+ (NSString)playPauseStopPackageName
{
  return (NSString *)@"PlayPauseStop";
}

+ (NSString)forwardBackwardPackageName
{
  return (NSString *)@"ForwardBackward";
}

+ (NSString)favoritePackageName
{
  return (NSString *)@"Favorite";
}

+ (NSString)volumePackageName
{
  return (NSString *)@"Volume";
}

+ (NSString)volumeBoldPackageName
{
  return (NSString *)@"VolumeBold";
}

+ (NSString)volumeRTLPackageName
{
  return (NSString *)@"VolumeRTL";
}

+ (UIImage)play
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [a1 playSymbol];
  id v4 = [v2 systemImageNamed:v3];

  return (UIImage *)v4;
}

+ (UIImage)pause
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [a1 pauseSymbol];
  id v4 = [v2 systemImageNamed:v3];

  return (UIImage *)v4;
}

+ (UIImage)stop
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [a1 stopSymbol];
  id v4 = [v2 systemImageNamed:v3];

  return (UIImage *)v4;
}

+ (UIImage)tvRemote
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [MEMORY[0x1E4F28B50] mediaRemoteUIBundle];
  id v4 = [v2 imageNamed:@"appletvremote" inBundle:v3];

  return (UIImage *)v4;
}

+ (UIImage)languageOptions
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"captions.bubble"];
}

+ (UIImage)backward
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [a1 backwardSymbol];
  id v4 = [v2 systemImageNamed:v3];

  return (UIImage *)v4;
}

+ (UIImage)forward
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [a1 forwardSymbol];
  id v4 = [v2 systemImageNamed:v3];

  return (UIImage *)v4;
}

+ (UIImage)menu
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"line.horizontal.3"];
}

+ (UIImage)like
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"star.fill"];
}

+ (UIImage)dislike
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
}

+ (UIImage)wishlist
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
}

+ (id)goBackwardSymbolForTimeInterval:(double)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"gobackward.%i", llround(fabs(a3)));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  if (v4) {
    v5 = v3;
  }
  else {
    v5 = @"gobackward.minus";
  }
  v6 = v5;

  return v6;
}

+ (id)goForwardSymbolForTimeInterval:(double)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"goforward.%i", llround(fabs(a3)));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  if (v4) {
    v5 = v3;
  }
  else {
    v5 = @"goforward.plus";
  }
  v6 = v5;

  return v6;
}

+ (id)goBackwardForTimeInterval:(double)a3
{
  v3 = [a1 goBackwardSymbolForTimeInterval:a3];
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];

  return v4;
}

+ (id)goForwardForTimeInterval:(double)a3
{
  v3 = [a1 goForwardSymbolForTimeInterval:a3];
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];

  return v4;
}

+ (UIImage)volumeMin
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"volume.fill"];
}

+ (UIImage)volumeMax
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"volume.3.fill"];
}

+ (UIImage)volumeRelativeMinus
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"speaker.minus.fill"];
}

+ (UIImage)volumeRelativePlus
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"speaker.plus.fill"];
}

+ (UIImage)collapsedRoutingChevron
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
}

+ (UIImage)expandedRoutingChevron
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down"];
}

+ (UIImage)routingAccessoryMultiDeselected
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
}

+ (UIImage)routingAccessorySelected
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
}

+ (UIImage)routingAccessoryMultiSelected
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
}

+ (UIImage)phone
{
  return (UIImage *)[MEMORY[0x1E4FB1818] _systemImageNamed:@"phone.fill"];
}

+ (UIImage)sharing
{
  return (UIImage *)[MEMORY[0x1E4FB1818] _systemImageNamed:@"person.2.fill"];
}

+ (UIImage)emptyArtwork
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [MEMORY[0x1E4F28B50] mediaRemoteUIBundle];
  id v4 = [v2 imageNamed:@"EmptyArtwork" inBundle:v3];

  return (UIImage *)v4;
}

+ (NSString)suggestedRouteWaveformPackageName
{
  return (NSString *)@"SuggestedRouteWaveform";
}

+ (NSString)suggestedRouteWaveformPackageStateOn
{
  return (NSString *)@"On";
}

+ (NSString)suggestedRouteWaveformPackageStateOff
{
  return (NSString *)@"Off";
}

+ (UIImage)suggestedRouteTVRemote
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"appletvremote.gen4.fill"];
}

+ (id)packageWithName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 mediaRemoteUIBundle];
  v6 = [v5 URLForResource:v4 withExtension:@"ca"];

  v7 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v6 type:*MEMORY[0x1E4F3A4C0] options:0 error:0];

  return v7;
}

+ (id)packageDescriptionWithName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5ADD8];
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 mediaRemoteUIBundle];
  v7 = [v3 descriptionForPackageNamed:v5 inBundle:v6];

  return v7;
}

- (void)applicationIconForBundleIdentifier:(id)a3 appearance:(int64_t)a4 completion:(id)a5
{
}

void __83__MRUAssetsProvider_applicationIconForBundleIdentifier_size_appearance_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)imageForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [(MRUAssetsProvider *)self imageCache];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    objc_super v10 = [(MRUAssetsProvider *)self completionBlocks];
    v9 = [v10 objectForKeyedSubscript:v6];

    if (v9)
    {
      id v11 = _Block_copy(v7);
      id v12 = [v9 setByAddingObject:v11];
      v13 = [(MRUAssetsProvider *)self completionBlocks];
      [v13 setObject:v12 forKeyedSubscript:v6];
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v15 = _Block_copy(v7);
      double v16 = objc_msgSend(v14, "initWithObjects:", v15, 0);
      v17 = [(MRUAssetsProvider *)self completionBlocks];
      [v17 setObject:v16 forKeyedSubscript:v6];

      id v11 = [MEMORY[0x1E4F290E0] sharedSession];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __44__MRUAssetsProvider_imageForURL_completion___block_invoke;
      v19[3] = &unk_1E5F10148;
      v19[4] = self;
      id v20 = v6;
      v18 = [v11 dataTaskWithURL:v20 completionHandler:v19];
      [v18 resume];
    }
  }
}

void __44__MRUAssetsProvider_imageForURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a2 && !v6)
  {
    v9 = (objc_class *)MEMORY[0x1E4FB1818];
    id v10 = a2;
    v8 = (void *)[[v9 alloc] initWithData:v10];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__MRUAssetsProvider_imageForURL_completion___block_invoke_2;
  v15[3] = &unk_1E5F0ED98;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v16 = v8;
  uint64_t v17 = v11;
  id v18 = v12;
  id v19 = v7;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __44__MRUAssetsProvider_imageForURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) imageCache];
    [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "completionBlocks", 0);
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9 = [*(id *)(a1 + 40) completionBlocks];
  [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
}

- (NSMutableDictionary)completionBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSCache)imageCache
{
  return (NSCache *)objc_getProperty(self, a2, 16, 1);
}

- (NSCache)applicationCache
{
  return (NSCache *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)purgeApplicationCacheDate
{
  return self->_purgeApplicationCacheDate;
}

- (void)setPurgeApplicationCacheDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeApplicationCacheDate, 0);
  objc_storeStrong((id *)&self->_applicationCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end