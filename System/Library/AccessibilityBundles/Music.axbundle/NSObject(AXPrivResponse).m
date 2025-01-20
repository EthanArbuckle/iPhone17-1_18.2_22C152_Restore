@interface NSObject(AXPrivResponse)
+ (BOOL)accessibilityIsFavoriteEnabledForResponse:()AXPrivResponse;
+ (double)_accessibilitySkipIntervalInDirection:()AXPrivResponse forResponse:;
+ (id)accessibilityPlayPauseStopButtonString:()AXPrivResponse;
+ (id)accessibilitySeekButtonStringInDirection:()AXPrivResponse response:;
+ (uint64_t)accessibilityIsSeekEnabledInDirection:()AXPrivResponse forResponse:;
@end

@implementation NSObject(AXPrivResponse)

+ (BOOL)accessibilityIsFavoriteEnabledForResponse:()AXPrivResponse
{
  id v3 = a3;
  v4 = [v3 safeValueForKeyPath:@"tracklist.playingItem.likeCommand"];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 safeValueForKeyPath:@"tracklist.playingItem.dislikeCommand"];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

+ (double)_accessibilitySkipIntervalInDirection:()AXPrivResponse forResponse:
{
  BOOL v5 = [a4 safeValueForKeyPath:@"tracklist.playingItem.seekCommand"];
  v6 = v5;
  if (a3 == 1) {
    v7 = @"preferredForwardJumpIntervals";
  }
  else {
    v7 = @"preferredBackwardJumpIntervals";
  }
  v8 = [v5 safeArrayForKey:v7];
  if ([v8 count])
  {
    v9 = [v8 firstObject];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (uint64_t)accessibilityIsSeekEnabledInDirection:()AXPrivResponse forResponse:
{
  id v4 = a4;
  [v4 safeValueForKeyPath:@"tracklist.playingItem.seekCommand"];
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  AXPerformSafeBlock();
  uint64_t v5 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

+ (id)accessibilitySeekButtonStringInDirection:()AXPrivResponse response:
{
  objc_msgSend(MEMORY[0x263F8C6D0], "_accessibilitySkipIntervalInDirection:forResponse:");
  id v4 = NSString;
  double v6 = fabs(v5);
  if (a3 == 1) {
    id v7 = @"ff.button";
  }
  else {
    id v7 = @"rewind.button";
  }
  id v8 = accessibilityMusicLocalizedString(v7);
  uint64_t v9 = objc_msgSend(v4, "localizedStringWithFormat:", v8, *(void *)&v6);

  return v9;
}

+ (id)accessibilityPlayPauseStopButtonString:()AXPrivResponse
{
  id v3 = a3;
  uint64_t v4 = [v3 safeIntegerForKey:@"state"];
  double v5 = [v3 safeValueForKeyPath:@"tracklist.playingItem"];
  double v6 = __UIAccessibilitySafeClass();

  if (v6) {
    objc_msgSend(v6, "duration", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  if (v4 == 2) {
    id v7 = @"AX_Pause";
  }
  else {
    id v7 = @"AX_Play";
  }
  id v8 = accessibilityMusicLocalizedString(v7);

  return v8;
}

@end