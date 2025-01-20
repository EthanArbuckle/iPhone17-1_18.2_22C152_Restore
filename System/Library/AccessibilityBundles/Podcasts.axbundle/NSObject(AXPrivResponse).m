@interface NSObject(AXPrivResponse)
+ (id)_accessibilityPlayPauseButtonString:()AXPrivResponse;
+ (id)_accessibilitySeekButtonStringInDirection:()AXPrivResponse response:;
@end

@implementation NSObject(AXPrivResponse)

+ (id)_accessibilitySeekButtonStringInDirection:()AXPrivResponse response:
{
  id v5 = a4;
  v6 = [v5 safeValueForKey:@"tracklist"];
  v7 = [v6 safeValueForKey:@"playingItem"];
  v8 = __UIAccessibilitySafeClass();

  v9 = [v8 safeValueForKey:@"seekCommand"];
  v10 = v9;
  if (a3)
  {
    v11 = [v9 safeArrayForKey:@"preferredForwardJumpIntervals"];
    v12 = [v11 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [v11 firstObject];
      [v14 doubleValue];
      double v16 = v15;

      v17 = NSString;
      v18 = @"ff.button";
LABEL_6:
      v23 = accessibilityLocalizedString(v18);
      v24 = objc_msgSend(v17, "localizedStringWithFormat:", v23, fabs(v16));

      goto LABEL_8;
    }
  }
  else
  {
    v11 = [v9 safeArrayForKey:@"preferredBackwardJumpIntervals"];
    v19 = [v11 firstObject];
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if (v20)
    {
      v21 = [v11 firstObject];
      [v21 doubleValue];
      double v16 = v22;

      v17 = NSString;
      v18 = @"rewind.button";
      goto LABEL_6;
    }
  }
  v24 = 0;
LABEL_8:

  return v24;
}

+ (id)_accessibilityPlayPauseButtonString:()AXPrivResponse
{
  id v3 = a3;
  uint64_t v4 = [v3 safeIntegerForKey:@"state"];
  id v5 = [v3 safeValueForKey:@"tracklist"];
  v6 = [v5 safeValueForKey:@"playingItem"];
  v7 = __UIAccessibilitySafeClass();

  if (v7) {
    objc_msgSend(v7, "duration", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  if (v4 == 2) {
    v8 = @"AX_Pause";
  }
  else {
    v8 = @"AX_Play";
  }
  v9 = accessibilityLocalizedString(v8);

  return v9;
}

@end