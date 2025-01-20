@interface VCVideoFeatureListStringHelper
+ (BOOL)extractAspectRatios:(const char *)a3 landscapeX:(int *)a4 landscapeY:(int *)a5 portraitX:(int *)a6 portraitY:(int *)a7;
+ (BOOL)extractAspectRatios:(const char *)a3 prefix:(const char *)a4 landscapeX:(int *)a5 landscapeY:(int *)a6 portraitX:(int *)a7 portraitY:(int *)a8;
+ (BOOL)extractExpectedAspectRatios:(const char *)a3 expectedLandscapeX:(int *)a4 expectedLandscapeY:(int *)a5 expectedPortraitX:(int *)a6 expectedPortraitY:(int *)a7;
+ (BOOL)featureListString:(char *)a3 maxSize:(int64_t)a4 payload:(int)a5 featureListStrings:(__CFDictionary *)a6;
+ (BOOL)findFeatureString:(const char *)a3 value:(char *)a4 valueLength:(unint64_t)a5 withPrefix:(const char *)a6;
+ (BOOL)isResizePIPSupportedInFeatureListString:(id)a3;
+ (id)deriveAspectRatioFLS;
+ (id)deriveAspectRatioFLSWithPortraitRatio:(CGSize)a3 landscapeRatio:(CGSize)a4 expectedPortraitRatio:(CGSize)a5 expectedLandscapeRatio:(CGSize)a6;
+ (id)extractKeyAndValueStringFromFeatureString:(id)a3 prefix:(id)a4;
+ (id)newEmptyFeatureString;
+ (id)newEmptyFeatureStringWithPayload:(int)a3;
+ (id)newFeatureListStringsDictForGroupID:(unsigned int)a3 isOneToOne:(BOOL)a4;
+ (id)newLocalFeaturesStringFixedPositionWithType:(unsigned __int8)a3;
+ (id)newLocalFeaturesStringWithType:(unsigned __int8)a3;
+ (id)newLocalFeaturesStringWithType:(unsigned __int8)a3 aspectRatioFLS:(id)a4 version:(int64_t)a5;
+ (id)newLocalFeaturesStringWithVCP:(id)a3 aspectRatioFLS:(id)a4;
+ (id)newScreenFeatureString;
+ (id)retrieveVCPFeaturesStringWithType:(unsigned __int8)a3 version:(int64_t)a4;
+ (int)defaultPayload:(__CFDictionary *)a3;
+ (unsigned)hardwareSettingsModeFromFeatureListStringType:(unsigned __int8)a3;
+ (void)aspectRatioPortrait:(CGSize *)a3 landscape:(CGSize *)a4 isMismatchedOrientation:(BOOL)a5;
+ (void)fixInvalidAspectRatioPortrait:(CGSize *)a3 landscape:(CGSize *)a4;
@end

@implementation VCVideoFeatureListStringHelper

+ (unsigned)hardwareSettingsModeFromFeatureListStringType:(unsigned __int8)a3
{
  unsigned __int8 v3 = a3;
  if ((a3 - 1) >= 7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoFeatureListStringHelper hardwareSettingsModeFromFeatureListStringType:]();
      }
    }
    return 0;
  }
  return v3;
}

+ (id)retrieveVCPFeaturesStringWithType:(unsigned __int8)a3 version:(int64_t)a4
{
  uint64_t v5 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  switch((int)v5)
  {
    case 1:
    case 6:
      v8 = VCVideoRuleCollectionsCamera;
      goto LABEL_8;
    case 2:
      v9 = &unk_1F3DC87C0;
      break;
    case 3:
      v8 = VCVideoRuleCollectionsScreenSecondary;
      goto LABEL_8;
    case 4:
      v8 = VCVideoRuleCollectionsScreenAirplay;
      goto LABEL_8;
    case 5:
      v8 = VCVideoRuleCollectionsRemoteCamera;
LABEL_8:
      v10 = [(__objc2_class *)v8 sharedInstance];
      goto LABEL_9;
    case 7:
      v10 = (__objc2_class *)+[VCVideoRuleCollections newU1VideoRuleCollections];
LABEL_9:
      v9 = (void *)[(__objc2_class *)v10 supportedPayloads];
      break;
    default:
      v9 = 0;
      break;
  }
  uint64_t v11 = [a1 hardwareSettingsModeFromFeatureListStringType:v5];
  id v12 = +[VCHardwareSettings featureListStringForPayload:126 hardwareSettingsMode:v11 version:a4];
  id v13 = +[VCHardwareSettings featureListStringForPayload:100 hardwareSettingsMode:v11 version:a4];
  int v14 = [v9 containsObject:&unk_1F3DC62D0];
  if (v12)
  {
    int v15 = v14;
    if (([v12 hasSuffix:@";"] & 1) == 0) {
      id v12 = (id)[v12 stringByAppendingString:@";"];
    }
    [v7 setObject:v12 forKeyedSubscript:&unk_1F3DC6300];
    if (v15) {
      [v7 setObject:v12 forKeyedSubscript:&unk_1F3DC62D0];
    }
  }
  if ([v9 containsObject:&unk_1F3DC62E8])
  {
    if (!v13 && v12) {
      id v13 = (id)[NSString stringWithString:v12];
    }
    if (v13)
    {
      if (([v13 hasSuffix:@";"] & 1) == 0) {
        id v13 = (id)[v13 stringByAppendingString:@";"];
      }
      [v7 setObject:v13 forKeyedSubscript:&unk_1F3DC62E8];
    }
  }
  return v7;
}

+ (void)fixInvalidAspectRatioPortrait:(CGSize *)a3 landscape:(CGSize *)a4
{
  if (a3->width == 512.0 && a3->height == 683.0) {
    *a3 = (CGSize)xmmword_1E25A1EB0;
  }
  if (a4->width == 683.0 && a4->height == 512.0) {
    *a4 = (CGSize)xmmword_1E25A1EC0;
  }
}

+ (void)aspectRatioPortrait:(CGSize *)a3 landscape:(CGSize *)a4 isMismatchedOrientation:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
  if (v5)
  {
    [v8 localExpectedRatioForScreenOrientation:0];
    double v10 = v9;
    double v12 = v11;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localExpectedRatioForScreenOrientation:", 3);
  }
  else
  {
    [v8 localScreenRatioForScreenOrientation:0];
    double v10 = v15;
    double v12 = v16;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 3);
  }
  v18.width = (double)(int)v10;
  v18.height = (double)(int)v12;
  v17.width = (double)(int)v13;
  v17.height = (double)(int)v14;
  SimplifyFixedPointRatio(&v18.width);
  +[VCVideoFeatureListStringHelper fixInvalidAspectRatioPortrait:landscape:](VCVideoFeatureListStringHelper, "fixInvalidAspectRatioPortrait:landscape:", &v18, &v17, SimplifyFixedPointRatio(&v17.width));
  if (a3) {
    *a3 = v18;
  }
  if (a4) {
    *a4 = v17;
  }
}

+ (id)deriveAspectRatioFLS
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v9 = NAN;
  double v10 = NAN;
  double v7 = NAN;
  double v8 = NAN;
  double v5 = NAN;
  double v6 = NAN;
  double v3 = NAN;
  double v4 = NAN;
  +[VCVideoFeatureListStringHelper aspectRatioPortrait:&v9 landscape:&v7 isMismatchedOrientation:0];
  +[VCVideoFeatureListStringHelper aspectRatioPortrait:&v5 landscape:&v3 isMismatchedOrientation:1];
  return +[VCVideoFeatureListStringHelper deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:](VCVideoFeatureListStringHelper, "deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:", v9, v10, v7, v8, v5, v6, v3, v4);
}

+ (id)deriveAspectRatioFLSWithPortraitRatio:(CGSize)a3 landscapeRatio:(CGSize)a4 expectedPortraitRatio:(CGSize)a5 expectedLandscapeRatio:(CGSize)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d/%d,%d/%d;%s:%d/%d,%d/%d;",
                 "AR",
                 (int)a4.width,
                 (int)a4.height,
                 (int)a3.width,
                 (int)a3.height,
                 "XR",
                 (int)a6.width,
                 (int)a6.height,
                 (int)a5.width,
                 (int)a5.height);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    double v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      double v13 = "+[VCVideoFeatureListStringHelper deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:"
            "expectedLandscapeRatio:]";
      __int16 v14 = 1024;
      int v15 = 201;
      __int16 v16 = 2112;
      CGSize v17 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Aspect ratio string: %@", buf, 0x26u);
    }
  }
  return v6;
}

+ (BOOL)findFeatureString:(const char *)a3 value:(char *)a4 valueLength:(unint64_t)a5 withPrefix:(const char *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  __int16 v14 = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  __strlcpy_chk();
  double v9 = strtok_r(__b, ";", &v14);
  if (v9)
  {
    double v10 = v9;
    while (1)
    {
      uint64_t v11 = strchr(v10, 58);
      __int16 v12 = v11;
      if (v11) {
        *uint64_t v11 = 0;
      }
      if (!strcmp(v10, a6)) {
        break;
      }
      double v9 = strtok_r(0, ";", &v14);
      double v10 = v9;
      if (!v9) {
        return (char)v9;
      }
    }
    if (a4)
    {
      if (v12) {
        strncpy(a4, v12 + 1, a5);
      }
      else {
        *a4 = 0;
      }
    }
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

+ (id)newLocalFeaturesStringWithType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = 0;
  if (a3 != 3 && a3 != 5) {
    uint64_t v4 = objc_msgSend(a1, "deriveAspectRatioFLS", a3, 0);
  }

  return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:v3 aspectRatioFLS:v4 version:1];
}

+ (id)newLocalFeaturesStringFixedPositionWithType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = 0;
  if (a3 <= 4u && a3 != 3) {
    uint64_t v4 = objc_msgSend(a1, "deriveAspectRatioFLS", a3, 0);
  }

  return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:v3 aspectRatioFLS:v4 version:2];
}

+ (id)newLocalFeaturesStringWithType:(unsigned __int8)a3 aspectRatioFLS:(id)a4 version:(int64_t)a5
{
  unsigned int v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v8 = (void *)[a1 retrieveVCPFeaturesStringWithType:a3 version:a5];
  if (v6 > 8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        int v15 = "+[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:]";
        __int16 v16 = 1024;
        int v17 = 284;
        __int16 v18 = 1024;
        unsigned int v19 = v6;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unexpected VCVideoFeatureListStringType=%d", (uint8_t *)&v12, 0x22u);
      }
    }
    return 0;
  }
  else if (((1 << v6) & 0x1E8) != 0)
  {
    return v8;
  }
  else
  {
    return (id)[a1 newLocalFeaturesStringWithVCP:v8 aspectRatioFLS:a4];
  }
}

+ (id)newLocalFeaturesStringWithVCP:(id)a3 aspectRatioFLS:(id)a4
{
  v8[6] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__VCVideoFeatureListStringHelper_newLocalFeaturesStringWithVCP_aspectRatioFLS___block_invoke;
  v8[3] = &unk_1E6DB8618;
  v8[4] = a4;
  v8[5] = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
  return v6;
}

uint64_t __79__VCVideoFeatureListStringHelper_newLocalFeaturesStringWithVCP_aspectRatioFLS___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithString:");
  uint64_t v5 = (uint64_t)v4;
  if (*(void *)(a1 + 32)) {
    uint64_t v5 = objc_msgSend(v4, "stringByAppendingString:");
  }
  id v6 = *(void **)(a1 + 40);

  return [v6 setObject:v5 forKeyedSubscript:a2];
}

+ (id)newEmptyFeatureStringWithPayload:(int)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v7[0] = @"FLS;";
  uint64_t v3 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = v3;
  return v3;
}

+ (id)newEmptyFeatureString
{
  id v2 = [NSString alloc];

  return (id)[v2 initWithString:@"FLS;"];
}

+ (BOOL)extractAspectRatios:(const char *)a3 prefix:(const char *)a4 landscapeX:(int *)a5 landscapeY:(int *)a6 portraitX:(int *)a7 portraitY:(int *)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      int v17 = *MEMORY[0x1E4F47A50];
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v15) {
        return v15;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "+[VCVideoFeatureListStringHelper extractAspectRatios:prefix:landscapeX:landscapeY:portraitX:portraitY:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 318;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = a3;
      __int16 v20 = 2080;
      v21 = a4;
      _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid parameter(s): featureListStrings=%s, prefix=%s", buf, 0x30u);
    }
LABEL_9:
    LOBYTE(v15) = 0;
    return v15;
  }
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v14;
  *(_OWORD *)&buf[16] = v14;
  if (!+[VCVideoFeatureListStringHelper findFeatureString:a3 value:buf valueLength:32 withPrefix:a4]|| sscanf(buf, "%d/%d,%d/%d", a5, a6, a7, a8) != 4)
  {
    goto LABEL_9;
  }
  LOBYTE(v15) = 1;
  return v15;
}

+ (BOOL)extractAspectRatios:(const char *)a3 landscapeX:(int *)a4 landscapeY:(int *)a5 portraitX:(int *)a6 portraitY:(int *)a7
{
  return +[VCVideoFeatureListStringHelper extractAspectRatios:a3 prefix:"AR" landscapeX:a4 landscapeY:a5 portraitX:a6 portraitY:a7];
}

+ (BOOL)extractExpectedAspectRatios:(const char *)a3 expectedLandscapeX:(int *)a4 expectedLandscapeY:(int *)a5 expectedPortraitX:(int *)a6 expectedPortraitY:(int *)a7
{
  return +[VCVideoFeatureListStringHelper extractAspectRatios:a3 prefix:"XR" landscapeX:a4 landscapeY:a5 portraitX:a6 portraitY:a7];
}

+ (id)extractKeyAndValueStringFromFeatureString:(id)a3 prefix:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 componentsSeparatedByString:@";"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    if ([v10 hasPrefix:a4]) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (int)defaultPayload:(__CFDictionary *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFDictionaryGetCount(a3);
  if (Count)
  {
    size_t v5 = 8 * Count;
    uint64_t v6 = (CFNumberRef *)((char *)&v8 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v6, 170, 8 * Count);
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(a3, (const void **)v6, (const void **)v6);
    HIDWORD(v8) = 128;
    if (!CFNumberGetValue(*v6, kCFNumberIntType, (char *)&v8 + 4) || (int result = HIDWORD(v8), HIDWORD(v8) == 128))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCVideoFeatureListStringHelper defaultPayload:]();
        }
      }
      return 128;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoFeatureListStringHelper defaultPayload:]();
      }
    }
    return 128;
  }
  return result;
}

+ (BOOL)featureListString:(char *)a3 maxSize:(int64_t)a4 payload:(int)a5 featureListStrings:(__CFDictionary *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int valuePtr = a5;
  if (!a3 || !a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        return v13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      v21 = "+[VCVideoFeatureListStringHelper featureListString:maxSize:payload:featureListStrings:]";
      __int16 v22 = 1024;
      int v23 = 394;
      __int16 v24 = 2048;
      v25 = a6;
      __int16 v26 = 2080;
      v27 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid parameter(s): featureListStrings=%p, featureListString=%s", buf, 0x30u);
    }
    LOBYTE(v13) = 0;
    return v13;
  }
  CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a6, v9);
  CFRelease(v9);
  if (CFStringGetCString(Value, a3, a4, 0x8000100u) && *a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        v21 = "+[VCVideoFeatureListStringHelper featureListString:maxSize:payload:featureListStrings:]";
        __int16 v22 = 1024;
        int v23 = 403;
        __int16 v24 = 2080;
        v25 = a3;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Selected %s", buf, 0x26u);
      }
    }
    LOBYTE(v13) = 1;
  }
  else
  {
    LOBYTE(v13) = 0;
    *a3 = 0;
  }
  return v13;
}

+ (id)newScreenFeatureString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"FLS;VRAE:0;SW:1;",
               &unk_1F3DC62E8,
               @"FLS;SW:1;",
               &unk_1F3DC62D0,
               0);
}

+ (id)newFeatureListStringsDictForGroupID:(unsigned int)a3 isOneToOne:(BOOL)a4
{
  if (a3 != 1935897189)
  {
    if (a3 == 1718909044)
    {
      uint64_t v4 = 100;
      return +[VCVideoFeatureListStringHelper newEmptyFeatureStringWithPayload:](VCVideoFeatureListStringHelper, "newEmptyFeatureStringWithPayload:", v4, a4);
    }
    if (a3 == 1667329399)
    {
      uint64_t v4 = 123;
      return +[VCVideoFeatureListStringHelper newEmptyFeatureStringWithPayload:](VCVideoFeatureListStringHelper, "newEmptyFeatureStringWithPayload:", v4, a4);
    }
    if (a4) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:v6];
  }
  if (a4)
  {
    uint64_t v6 = 6;
    return +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:v6];
  }
  return +[VCVideoFeatureListStringHelper newScreenFeatureString];
}

+ (BOOL)isResizePIPSupportedInFeatureListString:(id)a3
{
  BOOL v4 = +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [a3 UTF8String], 0, 0, "PR");
  return v4 | +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [a3 UTF8String], 0, 0, "FLS2");
}

+ (void)hardwareSettingsModeFromFeatureListStringType:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  size_t v5 = "+[VCVideoFeatureListStringHelper hardwareSettingsModeFromFeatureListStringType:]";
  __int16 v6 = 1024;
  int v7 = 50;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected featureListStringType=%hhu", v3, 0x22u);
}

+ (void)defaultPayload:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 375;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d featureListStrings is empty", v1, 0x1Cu);
}

+ (void)defaultPayload:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 383;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retrieve fist payload from featureListStrings", v1, 0x1Cu);
}

@end