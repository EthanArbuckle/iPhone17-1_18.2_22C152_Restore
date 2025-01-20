@interface PKPencilStatisticsManager
+ (BOOL)isAllowedBundleID:(id)a3;
+ (id)allowedBundleIDFromBundleID:(id)a3;
- (id).cxx_construct;
- (uint64_t)startAnalyticsSessionIfNecessary;
- (void)endAnalyticsSessionIfNecessary;
@end

@implementation PKPencilStatisticsManager

+ (id)allowedBundleIDFromBundleID:(id)a3
{
  id v4 = a3;
  if ([a1 isAllowedBundleID:v4])
  {
    v5 = (__CFString *)v4;
  }
  else if ([v4 hasPrefix:@"com.apple"])
  {
    v5 = @"<unspecified Apple bundleID>";
  }
  else
  {
    v5 = @"<unspecified bundle ID>";
  }

  return v5;
}

- (uint64_t)startAnalyticsSessionIfNecessary
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16)) {
      operator new();
    }
  }
  return result;
}

- (void)endAnalyticsSessionIfNecessary
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      *(unsigned char *)(a1 + 16) = 0;
      if (CACurrentMediaTime() - *(double *)(a1 + 48) > 0.0)
      {
        v2 = *(__CFString **)(a1 + 40);
        if (!v2) {
          v2 = @"<unspecified tool>";
        }
        v13 = v2;
        v3 = *(__CFString **)(a1 + 112);
        if (!v3) {
          v3 = @"<unspecified bundle ID>";
        }
        id v4 = v3;
        v5 = *(PKRunningStat **)(a1 + 8);
        if (v5)
        {
          os_unfair_lock_lock(&v5->lock);
          uint64_t numValues = v5->numValues;
          os_unfair_lock_unlock(&v5->lock);
          PKRunningStat::max(v5);
          PKRunningStat::min(v5);
          PKRunningStat::mean(v5);
        }
        else
        {
          uint64_t numValues = 0;
        }
        uint64_t v7 = +[PKHoverSettings isHoverEnabled];
        uint64_t v8 = +[PKHoverSettings allowDoubleTapOnlyWithPencilHover];
        v9 = +[PKTextInputSettings sharedSettings];
        uint64_t v10 = [v9 isScribbleActive];

        IOPSDrawingUnlimitedPower();
        v11 = +[PKStatisticsManager sharedStatisticsManager]();
        -[PKStatisticsManager recordHoverDuration:onScreenDuration:hoverEdgeDuration:hoverExteriorDuration:sessionDuration:showEffectsEnabled:shadowEnabled:scribbleEnabled:doubleTapOnlyInHoverRangeEnabled:doubleTapsInRange:doubleTapsOutsideRange:deviceIsConnectedToCharger:intentionalHoverDuration:intentionalToolPreviewHoverDuration:countIntentionalHoverActions:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:]((uint64_t)v11);

        v12 = +[PKStatisticsManager sharedStatisticsManager]();
        -[PKStatisticsManager recordHoverToolType:hoverDuration:intentionalToolPreviewHoverDuration:intentionalHoverDuration:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:countIntentionalHoverActions:activepencilminutes:onScreenDuration:settingShowEffectsEnabled:settingSystemShadowEnabled:settingScribbleEnabled:settingDoubleTapInRangeEnabled:bundleID:]((uint64_t)v12, v13, numValues, v7, 0, v10, v8, v4);
      }
    }
  }
}

+ (BOOL)isAllowedBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.mobilenotes"];

  if (v6 & 1) != 0 || ([v3 hasPrefix:@"com.apple.quicklook"])
  {
    BOOL v7 = 1;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
    if (v10 < 0) {
      operator delete(__p);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedBundleID, 0);
  objc_storeStrong((id *)&self->_toolName, 0);
  value = self->_intentionalHoverStats.__ptr_.__value_;
  self->_intentionalHoverStats.__ptr_.__value_ = 0;
  if (value)
  {
    JUMPOUT(0x1C8783F10);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end