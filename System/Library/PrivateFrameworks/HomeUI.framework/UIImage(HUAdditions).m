@interface UIImage(HUAdditions)
+ (__CFString)hu_symbolNameForDescriptionBadgeType:()HUAdditions;
+ (id)hu_airPlaySpeakerImage;
+ (id)hu_avatarImageWithSymbolNamed:()HUAdditions textStyle:scale:diameter:;
+ (id)hu_cameraErrorImage;
+ (id)hu_cellCheckmarkImage;
+ (id)hu_circleImageWithDiameter:()HUAdditions;
+ (id)hu_closeButtonImage;
+ (id)hu_connectedCheckmarkImage;
+ (id)hu_exclamationMarkImage;
+ (id)hu_fastForwardButtonImage;
+ (id)hu_gearImageWithBadgeCount:()HUAdditions;
+ (id)hu_gearSymbolImageWithBadgeCount:()HUAdditions;
+ (id)hu_imageForDescriptionBadgeType:()HUAdditions tintColor:;
+ (id)hu_largeQRBadgeTemplateImage;
+ (id)hu_microphoneGlyphForTalkingState:()HUAdditions usingStandardSymbolConfiguration:;
+ (id)hu_mutedMicrophoneImageInCircleWithTintColor:()HUAdditions backgroundColor:;
+ (id)hu_mutedMicrophoneImageWithTintColor:()HUAdditions;
+ (id)hu_navigationBarGlyphHouse;
+ (id)hu_navigationBarGlyphPlus;
+ (id)hu_pauseButton;
+ (id)hu_playButton;
+ (id)hu_playButtonImageForAnnouncementPlaybackButton;
+ (id)hu_recordingButtonMicOffImage;
+ (id)hu_recordingButtonMicOnImage;
+ (id)hu_recordingButtonSendImage;
+ (id)hu_recordingButtonStopImage;
+ (id)hu_recordingButtonWaveformImage;
+ (id)hu_recordingDeleteButton;
+ (id)hu_settingsImageUsingStandardSymbolConfiguration:()HUAdditions;
+ (id)hu_smallAirPlayAudioImage;
+ (id)hu_smallQRBadgeTemplateImage;
+ (id)hu_stopButtonImage;
+ (id)hu_walletAppIconImage;
+ (id)hu_waveformImage;
+ (uint64_t)hu_largeSymbolConfiguration;
+ (uint64_t)hu_navigationBarGlyphList;
+ (uint64_t)hu_navigationBarGlyphSize;
+ (uint64_t)hu_semiboldSymbolConfiguration;
+ (uint64_t)hu_standardSymbolConfiguration;
@end

@implementation UIImage(HUAdditions)

+ (id)hu_cameraErrorImage
{
  v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"video.slash.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438B8]];
  v2 = [v0 imageWithConfiguration:v1];

  return v2;
}

+ (id)hu_waveformImage
{
  v2 = [MEMORY[0x1E4F42A80] systemImageNamed:@"waveform"];
  v3 = objc_msgSend(a1, "hu_navigationBarGlyphSize");
  v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

+ (uint64_t)hu_navigationBarGlyphSize
{
  return [MEMORY[0x1E4F42A98] configurationWithPointSize:17.0];
}

+ (uint64_t)hu_standardSymbolConfiguration
{
  return [MEMORY[0x1E4F42A98] configurationWithWeight:4];
}

+ (uint64_t)hu_largeSymbolConfiguration
{
  return [MEMORY[0x1E4F42A98] configurationWithPointSize:18.0];
}

+ (uint64_t)hu_semiboldSymbolConfiguration
{
  return [MEMORY[0x1E4F42A98] configurationWithWeight:6];
}

+ (id)hu_navigationBarGlyphHouse
{
  v2 = [MEMORY[0x1E4F42A80] systemImageNamed:@"house"];
  v3 = objc_msgSend(a1, "hu_navigationBarGlyphSize");
  v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

+ (id)hu_navigationBarGlyphPlus
{
  v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"plus"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43870] scale:-1];
  v2 = [v0 imageWithConfiguration:v1];

  return v2;
}

+ (uint64_t)hu_navigationBarGlyphList
{
  return [MEMORY[0x1E4F42A80] systemImageNamed:@"list.bullet"];
}

+ (id)hu_largeQRBadgeTemplateImage
{
  v0 = [MEMORY[0x1E4F42A80] imageNamed:@"QRBadgeLg"];
  v1 = [v0 imageWithRenderingMode:2];

  return v1;
}

+ (id)hu_smallQRBadgeTemplateImage
{
  v0 = [MEMORY[0x1E4F42A80] imageNamed:@"QRBadgeSm"];
  v1 = [v0 imageWithRenderingMode:2];

  return v1;
}

+ (id)hu_cellCheckmarkImage
{
  if ([MEMORY[0x1E4F69758] useMacIdiom]) {
    uint64_t v0 = 1;
  }
  else {
    uint64_t v0 = 2;
  }
  v1 = [MEMORY[0x1E4F6A420] staticPreferredFontForTextStyle:*MEMORY[0x1E4F43870] traits:v0];
  v2 = [MEMORY[0x1E4F42A98] configurationWithFont:v1 scale:2];
  v3 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"checkmark"];
  v4 = [v3 imageWithConfiguration:v2];

  return v4;
}

+ (id)hu_exclamationMarkImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438A0]];
  v1 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v0];

  return v1;
}

+ (id)hu_closeButtonImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"xmark.circle.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438E8] scale:3];
  v2 = [v0 imageWithConfiguration:v1];

  return v2;
}

+ (id)hu_recordingButtonWaveformImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"waveform"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:32.0];
  v2 = [v0 imageWithConfiguration:v1];

  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_recordingButtonStopImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"stop.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43870] scale:-1];
  v2 = [v0 imageWithConfiguration:v1];

  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_recordingButtonSendImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"arrow.up"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43870] scale:-1];
  v2 = [v0 imageWithConfiguration:v1];

  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_recordingButtonMicOnImage
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  v1 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"mic.slash.fill"];
  v2 = [v1 imageWithConfiguration:v0];

  v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_recordingButtonMicOffImage
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  v1 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"mic.fill"];
  v2 = [v1 imageWithConfiguration:v0];

  v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_connectedCheckmarkImage
{
  if ([MEMORY[0x1E4F69758] useMacIdiom]) {
    uint64_t v0 = 1;
  }
  else {
    uint64_t v0 = 2;
  }
  v1 = [MEMORY[0x1E4F6A420] staticPreferredFontForTextStyle:*MEMORY[0x1E4F438B8] traits:v0];
  v2 = [MEMORY[0x1E4F42A98] configurationWithFont:v1 scale:3];
  v3 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"checkmark"];
  v4 = [v3 imageWithConfiguration:v2];

  v5 = [MEMORY[0x1E4F428B8] systemGreenColor];
  v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  return v6;
}

+ (id)hu_fastForwardButtonImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"forward.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:20.0];
  v2 = [v0 imageWithConfiguration:v1];

  v3 = [MEMORY[0x1E4F428B8] labelColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_airPlaySpeakerImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:90.0];
  v1 = [MEMORY[0x1E4F42A80] systemImageNamed:@"hifispeaker.fill"];
  v2 = [v1 imageWithConfiguration:v0];

  v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_smallAirPlayAudioImage
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"airplayaudio"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:18.0];
  v2 = [v0 imageWithConfiguration:v1];

  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

+ (id)hu_playButton
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"play.circle.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438F8] scale:3];
  v2 = [v0 imageWithConfiguration:v1];

  return v2;
}

+ (id)hu_pauseButton
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"pause.circle.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438F8] scale:3];
  v2 = [v0 imageWithConfiguration:v1];

  return v2;
}

+ (id)hu_stopButtonImage
{
  id v0 = objc_alloc(MEMORY[0x1E4F42A80]);
  v1 = [MEMORY[0x1E4F428B8] blackColor];
  v2 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
  v3 = (void *)[v0 _initWithFilledSystemImageNamed:@"stop.circle.fill" fillColor:v1 symbolColor:v2];
  v4 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438B8] scale:3];
  v5 = [v3 imageWithConfiguration:v4];

  return v5;
}

+ (id)hu_playButtonImageForAnnouncementPlaybackButton
{
  id v0 = objc_alloc(MEMORY[0x1E4F42A80]);
  v1 = [MEMORY[0x1E4F428B8] blackColor];
  v2 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
  v3 = (void *)[v0 _initWithFilledSystemImageNamed:@"play.circle.fill" fillColor:v1 symbolColor:v2];
  v4 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438B8] scale:3];
  v5 = [v3 imageWithConfiguration:v4];

  return v5;
}

+ (id)hu_recordingDeleteButton
{
  id v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"xmark.circle.fill"];
  v1 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438F0] scale:3];
  v2 = [v0 imageWithConfiguration:v1];

  return v2;
}

+ (id)hu_microphoneGlyphForTalkingState:()HUAdditions usingStandardSymbolConfiguration:
{
  if (a4) {
    objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  }
  else {
  v5 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_largeSymbolConfiguration");
  }
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"mic.fill"];
    v6 = [v7 imageWithConfiguration:v5];
  }

  return v6;
}

+ (id)hu_settingsImageUsingStandardSymbolConfiguration:()HUAdditions
{
  v5 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"gear"];
  if (a3) {
    objc_msgSend(a1, "hu_standardSymbolConfiguration");
  }
  else {
  v6 = objc_msgSend(a1, "hu_largeSymbolConfiguration");
  }
  v7 = [v5 imageWithConfiguration:v6];

  return v7;
}

+ (id)hu_gearImageWithBadgeCount:()HUAdditions
{
  if (a3) {
    v3 = @"gear-with-badge";
  }
  else {
    v3 = @"gear";
  }
  v4 = HUImageNamed(v3);

  return v4;
}

+ (id)hu_gearSymbolImageWithBadgeCount:()HUAdditions
{
  if (a3)
  {
    v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"gear.badge"];
    if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
    {
      v4 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
      uint64_t v5 = [v3 imageByApplyingSymbolConfiguration:v4];

      v3 = (void *)v5;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"gear"];
  }

  return v3;
}

+ (id)hu_avatarImageWithSymbolNamed:()HUAdditions textStyle:scale:diameter:
{
  v9 = (void *)MEMORY[0x1E4F428B8];
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 grayColor];
  v13 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:v10 scale:a6];

  v14 = [MEMORY[0x1E4F42A80] systemImageNamed:v11];

  v15 = [v14 imageWithSymbolConfiguration:v13];

  v16 = [v15 imageWithTintColor:v12 renderingMode:1];

  v31.width = a1;
  v31.height = a1;
  UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  v18 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a1, a1, a1 * 0.5);
  v19 = [MEMORY[0x1E4F428B8] whiteColor];
  [v19 set];

  [v18 setLineWidth:1.0];
  [v18 addClip];
  [v18 fill];
  [v16 size];
  double v21 = v20;
  [v16 size];
  double v23 = v21 + v22 * 0.5;
  [v16 size];
  double v25 = v24;
  [v16 size];
  objc_msgSend(v16, "drawInRect:blendMode:alpha:", 0, (a1 - v23) * 0.5, (a1 - (v25 + v26 * 0.5)) * 0.5, v23, v25 + v26 * 0.5, 1.0);
  v27 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v27, kCGBlendModeCopy);
  [v18 stroke];
  v28 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v28;
}

+ (id)hu_circleImageWithDiameter:()HUAdditions
{
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a1, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  v4 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a1, a1, a1 * 0.5);
  uint64_t v5 = [MEMORY[0x1E4F428B8] whiteColor];
  [v5 set];

  [v4 setLineWidth:1.0];
  [v4 addClip];
  [v4 fill];
  v6 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v6, kCGBlendModeCopy);
  [v4 stroke];
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)hu_mutedMicrophoneImageWithTintColor:()HUAdditions
{
  v3 = (void *)MEMORY[0x1E4F42A80];
  id v4 = a3;
  uint64_t v5 = [v3 _systemImageNamed:@"mic.slash.circle.fill"];
  v6 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43890] scale:3];
  v7 = [v5 imageWithConfiguration:v6];

  v8 = [v7 imageWithTintColor:v4 renderingMode:1];

  return v8;
}

+ (id)hu_mutedMicrophoneImageInCircleWithTintColor:()HUAdditions backgroundColor:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F42A80];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 _systemImageNamed:@"mic.slash.circle.fill"];
  v9 = [v8 imageWithTintColor:v7 renderingMode:1];

  [v9 size];
  double v11 = v10;
  [v9 size];
  double v13 = v12;
  v20.width = v11 + 2.0;
  v20.height = v11 + 2.0;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v11 + 2.0, v11 + 2.0, (v11 + 2.0) * 0.5);
  [v6 set];

  [v15 setLineWidth:1.0];
  [v15 addClip];
  [v15 fill];
  objc_msgSend(v9, "drawInRect:blendMode:alpha:", 0, (v11 + 2.0 - v11) * 0.5, (v11 + 2.0 - v13) * 0.5, v11, v13, 1.0);
  v16 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v16, kCGBlendModeCopy);
  [v15 stroke];
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

+ (id)hu_walletAppIconImage
{
  id v0 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43890] scale:3];
  v1 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"wallet.fill"];
  v2 = [v1 imageWithConfiguration:v0];
  v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

+ (__CFString)hu_symbolNameForDescriptionBadgeType:()HUAdditions
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return off_1E63860C8[a3 - 1];
  }
}

+ (id)hu_imageForDescriptionBadgeType:()HUAdditions tintColor:
{
  id v5 = a4;
  id v6 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_symbolNameForDescriptionBadgeType:", a3);
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F42A80] _systemImageNamed:v6];
    v8 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43890] scale:-1];
    v9 = [v7 imageWithConfiguration:v8];

    double v10 = [v9 imageWithTintColor:v5 renderingMode:1];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

@end