@interface AVAudioSession(AVPlaybackRouteSelecting_Private)
- (AVExternalPlaybackController)_externalPlaybackController;
- (void)prepareRouteSelectionForPlaybackFromBundleID:()AVPlaybackRouteSelecting_Private withCompletionHandler:;
@end

@implementation AVAudioSession(AVPlaybackRouteSelecting_Private)

- (AVExternalPlaybackController)_externalPlaybackController
{
  objc_getAssociatedObject(a1, @"externalPlaybackController");
  v2 = (AVExternalPlaybackController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AVExternalPlaybackController);
    objc_setAssociatedObject(a1, @"externalPlaybackController", v2, (void *)0x301);
  }

  return v2;
}

- (void)prepareRouteSelectionForPlaybackFromBundleID:()AVPlaybackRouteSelecting_Private withCompletionHandler:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _externalPlaybackController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __119__AVAudioSession_AVPlaybackRouteSelecting_Private__prepareRouteSelectionForPlaybackFromBundleID_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E5FC3A38;
  id v11 = v6;
  id v9 = v6;
  [v8 willBeginPlaybackFromAppWithBundleID:v7 completionHandler:v10];
}

@end