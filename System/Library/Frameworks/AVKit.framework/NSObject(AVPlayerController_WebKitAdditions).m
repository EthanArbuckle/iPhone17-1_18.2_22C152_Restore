@interface NSObject(AVPlayerController_WebKitAdditions)
- (AVPlayerControllerWebKitData)_avkit_playerControllerWebKitData;
- (id)avkit_webkitDelegate;
- (uint64_t)avkit_isAVPlayerControllerOrSubclass;
- (uint64_t)avkit_webkitIsScrubbing;
- (void)avkit_setWebKitDelegate:()AVPlayerController_WebKitAdditions;
- (void)avkit_setWebKitIsScrubbing:()AVPlayerController_WebKitAdditions;
- (void)avkit_setWebKitSeekToTime:()AVPlayerController_WebKitAdditions;
- (void)avkit_webkitSeekToTime;
@end

@implementation NSObject(AVPlayerController_WebKitAdditions)

- (void)avkit_setWebKitDelegate:()AVPlayerController_WebKitAdditions
{
  id v5 = a3;
  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    v4 = objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    [v4 setDelegate:v5];
  }
}

- (AVPlayerControllerWebKitData)_avkit_playerControllerWebKitData
{
  if (objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass"))
  {
    v2 = _AVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_ERROR, "WebKit AVPlayerController data is not available for AVPlayerController subclasses.", v5, 2u);
    }
  }
  objc_getAssociatedObject(a1, (const void *)AVPlayerControllerWebKitDataPropertyKey);
  v3 = (AVPlayerControllerWebKitData *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = [[AVPlayerControllerWebKitData alloc] initWithPlayerController:a1];
    objc_setAssociatedObject(a1, (const void *)AVPlayerControllerWebKitDataPropertyKey, v3, (void *)1);
  }

  return v3;
}

- (id)avkit_webkitDelegate
{
  if (objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass"))
  {
    v2 = 0;
  }
  else
  {
    v3 = objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    v2 = [v3 delegate];
  }

  return v2;
}

- (void)avkit_setWebKitSeekToTime:()AVPlayerController_WebKitAdditions
{
  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setSeekToTime:a2];
  }
}

- (void)avkit_webkitSeekToTime
{
  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    v2 = objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    [v2 seekToTime];
  }
}

- (void)avkit_setWebKitIsScrubbing:()AVPlayerController_WebKitAdditions
{
  if ((objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass") & 1) == 0)
  {
    objc_msgSend(a1, "_avkit_playerControllerWebKitData");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setScrubbing:a3];
  }
}

- (uint64_t)avkit_webkitIsScrubbing
{
  if (objc_msgSend(a1, "avkit_isAVPlayerControllerOrSubclass")) {
    return 0;
  }
  v3 = objc_msgSend(a1, "_avkit_playerControllerWebKitData");
  uint64_t v4 = [v3 isScrubbing];

  return v4;
}

- (uint64_t)avkit_isAVPlayerControllerOrSubclass
{
  return 0;
}

@end