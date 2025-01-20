@interface BWCoreAnalyticsReporter
+ (id)geometricDistortionCorrectionSourceToShortString:(int)a3;
+ (id)shallowDepthOfFieldEffectStatusToString:(int)a3;
+ (id)sharedInstance;
+ (int)clientApplicationIDType:(id)a3;
+ (void)initialize;
- (uint64_t)_sendAutoFocusROIEventToBiome:(uint64_t)result;
- (void)_sanitizePayloadDictionary:(uint64_t)a1 eventName:(void *)a2;
- (void)sendEvent:(id)a3;
@end

@implementation BWCoreAnalyticsReporter

- (void)sendEvent:(id)a3
{
  v5 = (void *)[a3 eventDictionary];
  uint64_t v6 = [a3 eventName];
  v7 = -[BWCoreAnalyticsReporter _sanitizePayloadDictionary:eventName:]((uint64_t)self, v5);
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[BWCoreAnalyticsReporter _sendAutoFocusROIEventToBiome:]((uint64_t)self, v8);
      }
      else
      {
        MEMORY[0x1F41138A0](v6, v8);
      }
    }
  }
}

- (void)_sanitizePayloadDictionary:(uint64_t)a1 eventName:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = (void *)[a2 objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 floatValue];
          [v9 floatValue];
          if (fabsf(v10) == INFINITY) {
            [v3 addObject:v8];
          }
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  if ([v3 count])
  {
    a2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a2];
    [a2 removeObjectsForKeys:v3];
  }
  return a2;
}

+ (id)sharedInstance
{
  if (sharedInstance_checkBWCoreAnalyticsReporterOnceToken != -1) {
    dispatch_once(&sharedInstance_checkBWCoreAnalyticsReporterOnceToken, &__block_literal_global_77);
  }
  return (id)sharedInstance_sSharedCoreAnalyticsReporter;
}

+ (void)initialize
{
}

BWCoreAnalyticsReporter *__41__BWCoreAnalyticsReporter_sharedInstance__block_invoke()
{
  result = objc_alloc_init(BWCoreAnalyticsReporter);
  sharedInstance_sSharedCoreAnalyticsReporter = (uint64_t)result;
  return result;
}

- (uint64_t)_sendAutoFocusROIEventToBiome:(uint64_t)result
{
  if (result)
  {
    uint64_t v23 = 0;
    uint64_t v24 = (uint64_t)&v23;
    uint64_t v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__28;
    v27 = __Block_byref_object_dispose__28;
    v3 = (objc_class *)getBMCameraCaptureAutoFocusROIClass_softClass;
    uint64_t v28 = getBMCameraCaptureAutoFocusROIClass_softClass;
    if (!getBMCameraCaptureAutoFocusROIClass_softClass)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = (uint64_t)__getBMCameraCaptureAutoFocusROIClass_block_invoke;
      v21 = &unk_1E5C24978;
      v22 = &v23;
      __getBMCameraCaptureAutoFocusROIClass_block_invoke((uint64_t)&v18);
      v3 = *(objc_class **)(v24 + 40);
    }
    _Block_object_dispose(&v23, 8);
    id v4 = [v3 alloc];
    uint64_t v5 = [a2 objectForKeyedSubscript:@"portType"];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"focusRegionType"), "intValue")+ 1;
    uint64_t v7 = [a2 objectForKeyedSubscript:@"focusRegionX"];
    uint64_t v8 = [a2 objectForKeyedSubscript:@"focusRegionY"];
    uint64_t v9 = [a2 objectForKeyedSubscript:@"focusRegionWidth"];
    uint64_t v10 = [a2 objectForKeyedSubscript:@"focusRegionHeight"];
    uint64_t v11 = [a2 objectForKeyedSubscript:@"luxLevel"];
    uint64_t v12 = [a2 objectForKeyedSubscript:@"subjectDistance"];
    LODWORD(v17) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"clientIDType"), "intValue");
    id v13 = (id)[v4 initWithPortType:v5 focusRegionType:v6 topLeftCornerRow:v7 topLeftCornerColumn:v8 width:v9 height:v10 luxLevel:v11 subjectDistance:v12 clientApplicationIDType:v17];
    uint64_t v18 = 0;
    uint64_t v19 = (uint64_t)&v18;
    uint64_t v20 = 0x2020000000;
    long long v14 = (uint64_t (*)(void))getBiomeLibrarySymbolLoc_ptr;
    v21 = getBiomeLibrarySymbolLoc_ptr;
    if (!getBiomeLibrarySymbolLoc_ptr)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      uint64_t v25 = (uint64_t)__getBiomeLibrarySymbolLoc_block_invoke;
      v26 = (void (*)(uint64_t, uint64_t))&unk_1E5C24978;
      v27 = (void (*)(uint64_t))&v18;
      long long v15 = (void *)BiomeLibraryLibrary();
      v16 = dlsym(v15, "BiomeLibrary");
      *(void *)(*((void *)v27 + 1) + 24) = v16;
      getBiomeLibrarySymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v27 + 1) + 24);
      long long v14 = *(uint64_t (**)(void))(v19 + 24);
    }
    _Block_object_dispose(&v18, 8);
    if (!v14) {
      -[BWCoreAnalyticsReporter _sendAutoFocusROIEventToBiome:]();
    }
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v14(), "CameraCapture"), "AutoFocusROI"), "source"), "sendEvent:", v13);
  }
  return result;
}

+ (int)clientApplicationIDType:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 isEqualToString:0x1EFA44100]) {
    return 3;
  }
  if ([a3 isEqualToString:0x1EFA55880]) {
    return 4;
  }
  if ([a3 isEqualToString:0x1EFA55AE0]) {
    return 5;
  }
  if ([a3 isEqualToString:0x1EFA559A0]) {
    return 10;
  }
  if ([a3 isEqualToString:0x1EFA55940]) {
    return 23;
  }
  if ([a3 isEqualToString:0x1EFA55B40]) {
    return 27;
  }
  if ([a3 isEqualToString:0x1EFA55B00]) {
    return 28;
  }
  if ([a3 isEqualToString:0x1EFA55C00]) {
    return 33;
  }
  if ([a3 isEqualToString:0x1EFA558C0]) {
    return 34;
  }
  if ([a3 isEqualToString:0x1EFA558E0]) {
    return 35;
  }
  if (([a3 isEqualToString:0x1EFA55B80] & 1) != 0
    || ([a3 isEqualToString:0x1EFA55BA0] & 1) != 0)
  {
    return 44;
  }
  if ([a3 isEqualToString:0x1EFA55A80]) {
    return 45;
  }
  if ([a3 isEqualToString:0x1EFA55A60]) {
    return 46;
  }
  if ([a3 hasPrefix:@"com.apple."]) {
    return 2;
  }
  if (([a3 isEqualToString:@"net.whatsapp.WhatsApp"] & 1) != 0
    || ([a3 isEqualToString:@"desktop.WhatsApp"] & 1) != 0
    || ([a3 isEqualToString:@"net.whatsapp.WhatsAppSMB"] & 1) != 0
    || ([a3 isEqualToString:@"WhatsApp"] & 1) != 0)
  {
    return 6;
  }
  if ([a3 isEqualToString:@"com.facebook.Messenger"]) {
    return 7;
  }
  if (([a3 isEqualToString:@"com.skype.skype"] & 1) != 0
    || ([a3 isEqualToString:@"com.skype.SkypeForiPad"] & 1) != 0)
  {
    return 8;
  }
  if (([a3 isEqualToString:@"com.tencent.xin"] & 1) != 0
    || ([a3 isEqualToString:@"com.tencent.xinWeChat"] & 1) != 0)
  {
    return 9;
  }
  if ([a3 isEqualToString:@"com.burbn.instagram"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"com.toyopagroup.picaboo"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"com.zhiliaoapp.musically"]) {
    return 13;
  }
  if (([a3 isEqualToString:@"com.webex.meeting"] & 1) != 0
    || ([a3 isEqualToString:@"com.webex.meetingmanager"] & 1) != 0
    || ([a3 isEqualToString:@"com.cisco.squared"] & 1) != 0
    || ([a3 isEqualToString:@"com.cisco.squared.intune"] & 1) != 0
    || ([a3 isEqualToString:@"com.cisco.webexcalling"] & 1) != 0)
  {
    return 14;
  }
  if (([a3 isEqualToString:@"us.zoom.videomeetings"] & 1) != 0
    || ([a3 isEqualToString:@"us.zoom.xos"] & 1) != 0)
  {
    return 15;
  }
  if ([a3 isEqualToString:@"com.google.hangouts"]) {
    return 16;
  }
  if (([a3 isEqualToString:@"com.bluejeansnet.Blue-Jeans"] & 1) != 0
    || ([a3 isEqualToString:@"com.bluejeansnet.Huddle"] & 1) != 0
    || ([a3 isEqualToString:@"com.bluejeansnet.Blue"] & 1) != 0)
  {
    return 17;
  }
  if (([a3 isEqualToString:@"com.logmein.gotomeeting"] & 1) != 0
    || ([a3 isEqualToString:@"com.logmein.GoToMeeting"] & 1) != 0)
  {
    return 18;
  }
  if (([a3 isEqualToString:@"com.logmein.joinme"] & 1) != 0
    || ([a3 isEqualToString:@"com.logmein.join.me"] & 1) != 0)
  {
    return 19;
  }
  if (([a3 isEqualToString:@"com.herzick.houseparty"] & 1) != 0
    || ([a3 isEqualToString:@"com.herzick.mac"] & 1) != 0)
  {
    return 20;
  }
  if (([a3 isEqualToString:@"com.cisco.jabberIM"] & 1) != 0
    || ([a3 isEqualToString:@"com.cisco.jabberIMintune"] & 1) != 0
    || ([a3 isEqualToString:@"com.cisco.JabberGuest"] & 1) != 0
    || ([a3 isEqualToString:@"com.cisco.jabberIMbb"] & 1) != 0)
  {
    return 21;
  }
  if (([a3 isEqualToString:@"com.microsoft.skype.teams"] & 1) != 0
    || ([a3 isEqualToString:@"com.microsoft.teams"] & 1) != 0)
  {
    return 22;
  }
  if ([a3 isEqualToString:@"com.meetinone.meetinone"]) {
    return 24;
  }
  if ([a3 isEqualToString:@"com.google.meetings"]) {
    return 25;
  }
  if ([a3 isEqualToString:@"com.tinyspeck.slackmacgap"]) {
    return 26;
  }
  if (([a3 isEqualToString:@"com.tencent.tencentmeeting"] & 1) != 0
    || ([a3 isEqualToString:@"com.tencent.meeting"] & 1) != 0)
  {
    return 29;
  }
  if ([a3 isEqualToString:@"com.hnc.Discord"]) {
    return 30;
  }
  if ([a3 isEqualToString:@"com.obsproject.obs-studio"]) {
    return 31;
  }
  if (([a3 isEqualToString:@"com.alibaba.DingTalkMac"] & 1) != 0
    || ([a3 isEqualToString:@"com.alibaba.DingTalkMacLite"] & 1) != 0)
  {
    return 32;
  }
  if ([a3 isEqualToString:@"com.brave.Browser"]) {
    return 36;
  }
  if ([a3 isEqualToString:@"com.google.Chrome"]) {
    return 37;
  }
  if ([a3 isEqualToString:@"com.microsoft.edgemac"]) {
    return 38;
  }
  if ([a3 isEqualToString:@"org.mozilla.firefox"]) {
    return 39;
  }
  if ([a3 isEqualToString:@"ru.keepcoder.Telegram"]) {
    return 30;
  }
  if ([a3 isEqualToString:@"jp.naver.line.mac"]) {
    return 41;
  }
  if ([a3 isEqualToString:@"com.ecamm.EcammLive"]) {
    return 42;
  }
  if ([a3 isEqualToString:@"com.reincubate.macos.cam"]) {
    return 43;
  }
  return 1;
}

+ (id)shallowDepthOfFieldEffectStatusToString:(int)a3
{
  if (a3 > 0xF) {
    return @"Invalid";
  }
  else {
    return off_1E5C296B8[a3];
  }
}

+ (id)geometricDistortionCorrectionSourceToShortString:(int)a3
{
  if (a3 > 3) {
    return @"Invalid";
  }
  else {
    return off_1E5C29738[a3];
  }
}

- (void)_sendAutoFocusROIEventToBiome:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "id<BMRootLibrary> BWBMLibrary(void)"), @"BWCoreAnalyticsReporter.m", 29, @"%s", dlerror());
  __break(1u);
}

@end