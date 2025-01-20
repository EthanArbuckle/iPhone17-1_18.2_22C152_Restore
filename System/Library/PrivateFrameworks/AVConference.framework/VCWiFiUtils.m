@interface VCWiFiUtils
+ (BOOL)copyAWDLChannelSequence:(id *)a3 twoPtFourGhzChannelCount:(int *)a4 fiveGhzChannelCount:(int *)a5 dfsChannelCount:(int *)a6 inactiveSlotCount:(int *)a7;
+ (BOOL)copyAWDLChannelSequence:(id *)a3 twoPtFourGhzChannelCount:(int *)a4 fiveGhzChannelCount:(int *)a5 dfsChannelCount:(int *)a6 inactiveSlotCount:(int *)a7 isPresent:(BOOL *)a8;
+ (BOOL)getInfraChannelNumber:(int *)a3 is5Ghz:(BOOL *)a4;
+ (BOOL)getInfraChannelNumber:(int *)a3 is5Ghz:(BOOL *)a4 isPresent:(BOOL *)a5;
+ (BOOL)isWiFiPresent;
@end

@implementation VCWiFiUtils

+ (BOOL)getInfraChannelNumber:(int *)a3 is5Ghz:(BOOL *)a4
{
  return +[VCWiFiUtils getInfraChannelNumber:a3 is5Ghz:a4 isPresent:0];
}

+ (BOOL)getInfraChannelNumber:(int *)a3 is5Ghz:(BOOL *)a4 isPresent:(BOOL *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  if (!softLink_WiFiCopyCurrentNetworkInfoEx) {
    return 0;
  }
  v8 = (const void *)softLink_WiFiCopyCurrentNetworkInfoEx(0, (uint64_t)v12 + 4);
  if (HIDWORD(v12[0])) {
    goto LABEL_13;
  }
  int Int32IfPresent = FigCFDictionaryGetInt32IfPresent();
  if (a5) {
    *a5 = Int32IfPresent != 0;
  }
  if (!Int32IfPresent)
  {
LABEL_13:
    BOOL v10 = 0;
    if (!v8) {
      return v10;
    }
    goto LABEL_11;
  }
  if (a3) {
    *a3 = v12[0];
  }
  if (a4) {
    *a4 = 0;
  }
  BOOL v10 = 1;
  if (v8) {
LABEL_11:
  }
    CFRelease(v8);
  return v10;
}

+ (BOOL)copyAWDLChannelSequence:(id *)a3 twoPtFourGhzChannelCount:(int *)a4 fiveGhzChannelCount:(int *)a5 dfsChannelCount:(int *)a6 inactiveSlotCount:(int *)a7
{
  return +[VCWiFiUtils copyAWDLChannelSequence:a3 twoPtFourGhzChannelCount:a4 fiveGhzChannelCount:a5 dfsChannelCount:a6 inactiveSlotCount:a7 isPresent:0];
}

+ (BOOL)isWiFiPresent
{
  v6[1] = *MEMORY[0x1E4F143B8];
  HIDWORD(v6[0]) = 0;
  if (!softLink_WiFiCopyCurrentNetworkInfoEx) {
    return 0;
  }
  uint64_t v2 = softLink_WiFiCopyCurrentNetworkInfoEx(0, (uint64_t)v6 + 4);
  v3 = (const void *)v2;
  if (HIDWORD(v6[0]))
  {
    BOOL v4 = 0;
    if (!v2) {
      return v4;
    }
    goto LABEL_4;
  }
  BOOL v4 = FigCFDictionaryGetInt32IfPresent() != 0;
  if (v3) {
LABEL_4:
  }
    CFRelease(v3);
  return v4;
}

+ (BOOL)copyAWDLChannelSequence:(id *)a3 twoPtFourGhzChannelCount:(int *)a4 fiveGhzChannelCount:(int *)a5 dfsChannelCount:(int *)a6 inactiveSlotCount:(int *)a7 isPresent:(BOOL *)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  CFTypeRef cf = 0;
  if (softLink_WiFiManagerCreate) {
    BOOL v14 = softLink_WiFiManagerSetProperty == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || softLink_WiFiManagerDoApple80211 == 0) {
    goto LABEL_42;
  }
  v30 = a7;
  if (!getkWiFiManagerPropertyInterfaceName()) {
    goto LABEL_42;
  }
  BOOL v16 = +[VCWiFiUtils isWiFiPresent];
  if (a8) {
    *a8 = v16;
  }
  if (!v16
    || ((uint64_t (*)(uint64_t, uint64_t))softLink_WiFiManagerCreate)((uint64_t)&cf, 0)
    || (v17 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLink_WiFiManagerSetProperty,
        CFTypeRef v18 = cf,
        uint64_t v19 = getkWiFiManagerPropertyInterfaceName(),
        v17((uint64_t)v18, v19, 0, @"awdl0"))
    || (memset(&v35[1], 0, 396),
        v35[0] = 1,
        ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLink_WiFiManagerDoApple80211)((uint64_t)cf, 1, 129, (uint64_t)v35, 400)))
  {
LABEL_42:
    BOOL v28 = 0;
    goto LABEL_37;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v21 = (void *)[v20 initWithCapacity:BYTE1(v35[1])];
  if (BYTE1(v35[1]))
  {
    unint64_t v22 = 0;
    int v23 = 0;
    v24 = &v35[4];
    do
    {
      objc_msgSend(v21, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *v24));
      unsigned int v25 = v24[1];
      v26 = v11;
      if ((v25 & 8) != 0 || (v26 = v12, (v25 & 0x10) != 0)) {
        objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *v24));
      }
      if (*((unsigned char *)v24 + 5)) {
        objc_msgSend(v13, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *v24));
      }
      unsigned int v27 = *v24;
      v24 += 3;
      if (!v27) {
        ++v23;
      }
      ++v22;
    }
    while (v22 < BYTE1(v35[1]));
  }
  else
  {
    int v23 = 0;
  }
  if (a4) {
    *a4 = [v11 count];
  }
  if (a5) {
    *a5 = [v12 count];
  }
  if (a6) {
    *a6 = [v13 count];
  }
  if (v30) {
    int *v30 = v23;
  }
  if (a3)
  {
    *a3 = v21;
    BOOL v28 = 1;
LABEL_37:
    v21 = 0;
    goto LABEL_39;
  }
  BOOL v28 = 1;
LABEL_39:
  if (cf) {
    CFRelease(cf);
  }

  return v28;
}

@end