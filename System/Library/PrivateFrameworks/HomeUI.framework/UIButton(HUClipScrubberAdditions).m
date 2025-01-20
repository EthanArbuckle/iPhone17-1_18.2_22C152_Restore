@interface UIButton(HUClipScrubberAdditions)
+ (id)hu_clipScrubberLiveButtonWithMaximimumLineHeight:()HUClipScrubberAdditions;
+ (id)hu_clipScrubberNearbyAccessoryButton;
+ (uint64_t)hu_clipScrubberLiveButton;
+ (uint64_t)hu_doneStateForButton:()HUClipScrubberAdditions usingStandardSymbolConfiguration:;
+ (uint64_t)hu_talkStateForButton:()HUClipScrubberAdditions usingStandardSymbolConfiguration:;
+ (void)hu_microphoneButton:()HUClipScrubberAdditions forTalkingState:usingStandardSymbolConfiguration:;
@end

@implementation UIButton(HUClipScrubberAdditions)

+ (id)hu_clipScrubberLiveButtonWithMaximimumLineHeight:()HUClipScrubberAdditions
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v3 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  [v2 setBackgroundColor:v3];

  v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v2 setTintColor:v4];

  v5 = [v2 titleLabel];
  [v5 setAdjustsFontSizeToFitWidth:1];

  v6 = _HULocalizedStringWithDefaultValue(@"HUCameraLive", @"HUCameraLive", 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F42670]);
  LODWORD(v8) = 1.0;
  [v7 setHyphenationFactor:v8];
  [v7 setMaximumLineHeight:18.0];
  id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v10 = *MEMORY[0x1E4F42508];
  v19[0] = *MEMORY[0x1E4F42540];
  v19[1] = v10;
  v20[0] = v7;
  v11 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v13 = (void *)[v9 initWithString:v6 attributes:v12];

  [v13 size];
  if (v14 > 54.0)
  {
    v15 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:12.0];
    v16 = [v13 string];
    objc_msgSend(v13, "addAttribute:value:range:", v10, v15, 0, objc_msgSend(v16, "length"));

    [v7 setMaximumLineHeight:a1];
  }
  [v2 setAttributedTitle:v13 forState:0];
  v17 = [v2 titleLabel];
  [v17 setNumberOfLines:3];

  return v2;
}

+ (uint64_t)hu_clipScrubberLiveButton
{
  return objc_msgSend(MEMORY[0x1E4F427E0], "hu_clipScrubberLiveButtonWithMaximimumLineHeight:", 12.0);
}

+ (id)hu_clipScrubberNearbyAccessoryButton
{
  v0 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v1 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.grid.2x2.fill"];
  [v0 setImage:v1 forState:0];
  v2 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v0 setTintColor:v2];

  return v0;
}

+ (uint64_t)hu_talkStateForButton:()HUClipScrubberAdditions usingStandardSymbolConfiguration:
{
  return objc_msgSend(a1, "hu_microphoneButton:forTalkingState:usingStandardSymbolConfiguration:", a3, 0, a4);
}

+ (uint64_t)hu_doneStateForButton:()HUClipScrubberAdditions usingStandardSymbolConfiguration:
{
  return objc_msgSend(a1, "hu_microphoneButton:forTalkingState:usingStandardSymbolConfiguration:", a3, 1, a4);
}

+ (void)hu_microphoneButton:()HUClipScrubberAdditions forTalkingState:usingStandardSymbolConfiguration:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F428B8] systemYellowColor];
  [v7 setBackgroundColor:v8];

  id v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_microphoneGlyphForTalkingState:usingStandardSymbolConfiguration:", a4, a5);
  if (v9) {
    [v7 setImage:v9 forState:0];
  }
  uint64_t v10 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [v7 setTintColor:v10];

  objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v7, "semanticContentAttribute"));
  double v12 = -9.0;
  if (v11) {
    double v12 = 9.0;
  }
  objc_msgSend(v7, "setImageEdgeInsets:", 0.0, v12, 0.0, 0.0);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 _setContinuousCornerRadius:16.0];
  if (a4)
  {
    if (v11) {
      v13 = @"HUCameraMicrophoneDoneRTLText";
    }
    else {
      v13 = @"HUCameraMicrophoneDoneLTRText";
    }
  }
  else
  {
    v13 = @"HUCameraMicrophoneTalkText";
  }
  double v14 = _HULocalizedStringWithDefaultValue(v13, v13, 1);
  id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v19 = *MEMORY[0x1E4F42508];
  v16 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
  v20[0] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v18 = (void *)[v15 initWithString:v14 attributes:v17];

  [v7 setAttributedTitle:v18 forState:0];
}

@end