@interface AVCCameraTestUtils
+ (BOOL)expectedGFTResolutionForDevice:(id)a3 ratio:(CGSize *)a4;
+ (BOOL)expectedPreviewResolutionForDevice:(id)a3 width:(int *)a4 height:(int *)a5;
+ (BOOL)findExpectedFramerate:(float *)a3 forDevice:(id)a4;
+ (BOOL)isCameraAvailable;
+ (BOOL)isCameraAvailable:(int64_t)a3;
+ (BOOL)isCenterStageActive;
+ (BOOL)isCenterStageAvailable;
+ (BOOL)isReactionAvailable;
+ (BOOL)performReaction;
+ (id)defaultCameraUID;
@end

@implementation AVCCameraTestUtils

+ (id)defaultCameraUID
{
  return @"com.apple.avfoundation.avcapturedevice.built-in_video:1";
}

+ (BOOL)isReactionAvailable
{
  v2 = objc_msgSend(MEMORY[0x1E4F16440], "deviceWithUniqueID:", +[AVCCameraTestUtils defaultCameraUID](AVCCameraTestUtils, "defaultCameraUID"));
  if (v2)
  {
    LOBYTE(v2) = [v2 canPerformReactionEffects];
  }
  return (char)v2;
}

+ (BOOL)performReaction
{
  v2 = objc_msgSend(MEMORY[0x1E4F16440], "deviceWithUniqueID:", +[AVCCameraTestUtils defaultCameraUID](AVCCameraTestUtils, "defaultCameraUID"));
  if (v2)
  {
    LODWORD(v2) = [v2 canPerformReactionEffects];
    if (v2)
    {
      AVControlCenterVideoEffectsModulePerformReactionEffect();
      LOBYTE(v2) = 1;
    }
  }
  return (char)v2;
}

+ (BOOL)isCameraAvailable
{
  return +[AVCCameraTestUtils isCameraAvailable:0];
}

+ (BOOL)isCameraAvailable:(int64_t)a3
{
  v9[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F15808];
  v9[0] = *MEMORY[0x1E4F15830];
  v9[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F157E8];
  v9[2] = *MEMORY[0x1E4F15828];
  v9[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F15818];
  v9[4] = *MEMORY[0x1E4F157F0];
  v9[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F16448], "discoverySessionWithDeviceTypes:mediaType:position:", v7, *MEMORY[0x1E4F15C18], a3), "devices"), "count") != 0;
}

+ (BOOL)isCenterStageActive
{
  v2 = (void *)[MEMORY[0x1E4F16440] deviceWithUniqueID:@"com.apple.avfoundation.avcapturedevice.built-in_video:1"];

  return [v2 isCenterStageActive];
}

+ (BOOL)isCenterStageAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F16440], "deviceWithUniqueID:", @"com.apple.avfoundation.avcapturedevice.built-in_video:1"), "formats");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) isCenterStageSupported];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

+ (BOOL)expectedPreviewResolutionForDevice:(id)a3 width:(int *)a4 height:(int *)a5
{
  if (expectedPreviewResolutionForDevice_width_height__onceToken != -1) {
    dispatch_once(&expectedPreviewResolutionForDevice_width_height__onceToken, &__block_literal_global_39);
  }
  v8 = (void *)[(id)expectedPreviewResolutionForDevice_width_height___resolutionForDeviceTypeDict objectForKeyedSubscript:a3];
  v9 = v8;
  if (v8)
  {
    long long v10 = (void *)[v8 componentsSeparatedByString:@"x"];
    *a4 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "integerValue");
    *a5 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "integerValue");
  }
  return v9 != 0;
}

void __70__AVCCameraTestUtils_expectedPreviewResolutionForDevice_width_height___block_invoke()
{
  expectedPreviewResolutionForDevice_width_height___resolutionForDeviceTypeDict = (uint64_t)&unk_1F3DC8C28;
}

+ (BOOL)findExpectedFramerate:(float *)a3 forDevice:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = 0;
  int v9 = 0;
  BOOL v6 = [+[VCVideoRuleCollectionsCamera sharedInstance] getBestFrameWidth:(char *)v10 + 4 frameHeight:v10 frameRate:&v9];
  if (findExpectedFramerate_forDevice__onceToken != -1) {
    dispatch_once(&findExpectedFramerate_forDevice__onceToken, &__block_literal_global_65);
  }
  if ([(id)findExpectedFramerate_forDevice___exceptionDeviceFramerateDict objectForKeyedSubscript:a4]) {
    objc_msgSend((id)objc_msgSend((id)findExpectedFramerate_forDevice___exceptionDeviceFramerateDict, "objectForKeyedSubscript:", a4), "floatValue");
  }
  else {
    int v7 = v9;
  }
  *(_DWORD *)a3 = v7;
  return v6;
}

void __54__AVCCameraTestUtils_findExpectedFramerate_forDevice___block_invoke()
{
  findExpectedFramerate_forDevice___exceptionDeviceFramerateDict = (uint64_t)&unk_1F3DC8C50;
}

+ (BOOL)expectedGFTResolutionForDevice:(id)a3 ratio:(CGSize *)a4
{
  if (!a4) {
    return 0;
  }
  if (expectedGFTResolutionForDevice_ratio__onceToken != -1) {
    dispatch_once(&expectedGFTResolutionForDevice_ratio__onceToken, &__block_literal_global_84);
  }
  BOOL v6 = (void *)[(id)expectedGFTResolutionForDevice_ratio___gftResolutionForDeviceTypeDict objectForKeyedSubscript:a3];
  if (!v6) {
    return 0;
  }
  int v7 = (void *)[v6 componentsSeparatedByString:@"x"];
  a4->width = (double)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "integerValue");
  BOOL v8 = 1;
  a4->height = (double)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "integerValue");
  return v8;
}

void __59__AVCCameraTestUtils_expectedGFTResolutionForDevice_ratio___block_invoke()
{
  expectedGFTResolutionForDevice_ratio___gftResolutionForDeviceTypeDict = (uint64_t)&unk_1F3DC8C78;
}

@end