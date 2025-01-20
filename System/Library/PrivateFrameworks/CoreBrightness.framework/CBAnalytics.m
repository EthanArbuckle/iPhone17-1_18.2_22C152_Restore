@interface CBAnalytics
+ (void)alsOcclusionsByProx:(int64_t)a3 andByTouch:(int64_t)a4 touchProx:(int64_t)a5 none:(int64_t)a6;
+ (void)alsSelectionDeltas:(const double *)a3 count:(unint64_t)a4;
+ (void)alsSelectionSwaps:(unint64_t)a3;
+ (void)alsSelectionTimes:(const double *)a3 count:(unint64_t)a4;
+ (void)autoBrightnessEnabled:(BOOL)a3 byUser:(BOOL)a4;
+ (void)autoBrightnessUserChange:(BOOL)a3 lowPower:(BOOL)a4;
+ (void)autoDimLeave:(double)a3;
+ (void)cltmBudgetUpdated:(float)a3 currentSDRBrightness:(float)a4;
+ (void)cuveLevel:(int64_t)a3;
+ (void)deviceColor:(int64_t)a3;
+ (void)displayMaxCurrent:(float)a3;
+ (void)harmonyColor:(const ColorReport *)a3;
+ (void)harmonyEnabled:(BOOL)a3 byUser:(BOOL)a4;
+ (void)hdrSession:(BOOL)a3;
+ (void)illuminanceHistogram:(id)a3;
+ (void)luminanceHistogram:(id)a3 withName:(id)a4;
+ (void)nightShiftCCT:(int64_t)a3;
+ (void)nightShiftEnabled:(BOOL)a3 withOption:(int)a4;
+ (void)nightShiftSunSchedulePermitted:(BOOL)a3;
+ (void)rtplcTriggeredWithLength:(unint64_t)a3 maxAPCE:(float)a4 durationInSeconds:(float)a5 sdrBrightness:(float)a6 referenceModeEnabled:(BOOL)a7;
+ (void)sbimMitigationTriggeredWithBrightness:(float)a3;
+ (void)send:(id)a3 withBlock:(id)a4;
+ (void)sendBool:(id)a3 withField:(const char *)a4 andValue:(BOOL)a5;
+ (void)sendInt:(id)a3 withField:(const char *)a4 andValue:(int64_t)a5;
+ (void)sendSparseBins:(const double *)a3 count:(int64_t)a4 withName:(id)a5;
+ (void)touchOcclusionElapsedDelay:(float)a3;
+ (void)userSliderCommit:(const CBSliderCommitInfo *)a3;
@end

@implementation CBAnalytics

+ (void)send:(id)a3 withBlock:(id)a4
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  [@"com.apple.CoreBrightness" stringByAppendingString:a3];
  AnalyticsSendEventLazy();
}

+ (void)sendInt:(id)a3 withField:(const char *)a4 andValue:(int64_t)a5
{
  id v17 = a1;
  SEL v16 = a2;
  id v15 = a3;
  v14 = a4;
  int64_t v13 = a5;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __42__CBAnalytics_sendInt_withField_andValue___block_invoke;
  v10 = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v11 = v14;
  int64_t v12 = v13;
  objc_msgSend(v17, "send:withBlock:", v15);
}

uint64_t __42__CBAnalytics_sendInt_withField_andValue___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithUTF8String:*(void *)(a1 + 32)];
  v4[0] = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

+ (void)sendBool:(id)a3 withField:(const char *)a4 andValue:(BOOL)a5
{
  id v17 = a1;
  SEL v16 = a2;
  id v15 = a3;
  v14 = a4;
  BOOL v13 = a5;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __43__CBAnalytics_sendBool_withField_andValue___block_invoke;
  v10 = &__block_descriptor_41_e19___NSDictionary_8__0l;
  v11 = v14;
  BOOL v12 = v13;
  objc_msgSend(v17, "send:withBlock:", v15);
}

uint64_t __43__CBAnalytics_sendBool_withField_andValue___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithUTF8String:*(void *)(a1 + 32)];
  v4[0] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 40) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

+ (void)sendSparseBins:(const double *)a3 count:(int64_t)a4 withName:(id)a5
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  for (int64_t i = 0; i < a4; ++i)
  {
    if (a3[i] != 0.0) {
      objc_msgSend(a1, "send:withBlock:", a5);
    }
  }
}

uint64_t __45__CBAnalytics_sendSparseBins_count_withName___block_invoke(uint64_t a1)
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"bin";
  v4[0] = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v3[1] = @"time";
  v4[1] = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 32)) * 1000.0];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
}

+ (void)alsSelectionSwaps:(unint64_t)a3
{
  if (a3 <= 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [a1 sendInt:@".ALS.Swaps" withField:"swaps" andValue:v3];
}

+ (void)alsSelectionTimes:(const double *)a3 count:(unint64_t)a4
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  for (unint64_t i = 0; i < a4; ++i)
  {
    if (a3[i] > 0.0) {
      objc_msgSend(a1, "send:withBlock:", @".ALS.Times");
    }
  }
}

uint64_t __39__CBAnalytics_alsSelectionTimes_count___block_invoke(uint64_t a1)
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"index";
  v4[0] = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v3[1] = @"time";
  v4[1] = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 32)) * 1000.0];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
}

+ (void)alsSelectionDeltas:(const double *)a3 count:(unint64_t)a4
{
  id v21 = a1;
  SEL v20 = a2;
  v19 = a3;
  unint64_t v18 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v17 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  int v12 = -1073741824;
  int v13 = 0;
  v14 = __40__CBAnalytics_alsSelectionDeltas_count___block_invoke;
  id v15 = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  SEL v16 = v19;
  id v17 = dumpCArrayIntoDictionary(v18, (uint64_t)&v11);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __40__CBAnalytics_alsSelectionDeltas_count___block_invoke_2;
  v9 = &unk_1E6218D38;
  v10 = v17;
  objc_msgSend(v21, "send:withBlock:", @".ALS.Deltas");
}

uint64_t __40__CBAnalytics_alsSelectionDeltas_count___block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 8 * a2) * 1000.0];
}

uint64_t __40__CBAnalytics_alsSelectionDeltas_count___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

+ (void)autoBrightnessEnabled:(BOOL)a3 byUser:(BOOL)a4
{
  id v15 = a1;
  SEL v14 = a2;
  BOOL v13 = a3;
  BOOL v12 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __44__CBAnalytics_autoBrightnessEnabled_byUser___block_invoke;
  v9 = &__block_descriptor_34_e19___NSDictionary_8__0l;
  BOOL v10 = v13;
  BOOL v11 = v12;
  objc_msgSend(v15, "send:withBlock:", @".Auto.Enabled");
}

uint64_t __44__CBAnalytics_autoBrightnessEnabled_byUser___block_invoke(uint64_t a1)
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"enabled";
  v4[0] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 32) & 1];
  v3[1] = @"userChange";
  v4[1] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 33) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
}

+ (void)hdrSession:(BOOL)a3
{
  id v12 = a1;
  SEL v11 = a2;
  BOOL v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __26__CBAnalytics_hdrSession___block_invoke;
  int v8 = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v9 = v10;
  objc_msgSend(v12, "send:withBlock:", @".HDR.CPMSConstrained");
}

uint64_t __26__CBAnalytics_hdrSession___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"constrained";
  v3[0] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 32) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
}

+ (void)autoBrightnessUserChange:(BOOL)a3 lowPower:(BOOL)a4
{
  id v15 = a1;
  SEL v14 = a2;
  BOOL v13 = a3;
  BOOL v12 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __49__CBAnalytics_autoBrightnessUserChange_lowPower___block_invoke;
  BOOL v9 = &__block_descriptor_34_e19___NSDictionary_8__0l;
  BOOL v10 = v13;
  BOOL v11 = v12;
  objc_msgSend(v15, "send:withBlock:", @".Auto.UserChange");
}

uint64_t __49__CBAnalytics_autoBrightnessUserChange_lowPower___block_invoke(uint64_t a1)
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"isBrighter";
  v4[0] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 32) & 1];
  v3[1] = @"lowPowerModeEnabled";
  v4[1] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 33) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
}

+ (void)deviceColor:(int64_t)a3
{
}

+ (void)cuveLevel:(int64_t)a3
{
}

+ (void)nightShiftEnabled:(BOOL)a3 withOption:(int)a4
{
  id v15 = a1;
  SEL v14 = a2;
  BOOL v13 = a3;
  int v12 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __44__CBAnalytics_nightShiftEnabled_withOption___block_invoke;
  BOOL v9 = &__block_descriptor_37_e19___NSDictionary_8__0l;
  BOOL v11 = v13;
  int v10 = v12;
  objc_msgSend(v15, "send:withBlock:", @".NightShift.Enabled");
}

uint64_t __44__CBAnalytics_nightShiftEnabled_withOption___block_invoke(uint64_t a1)
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"enabled";
  v4[0] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 36) & 1];
  v3[1] = @"option";
  v4[1] = [NSNumber numberWithInteger:*(unsigned int *)(a1 + 32)];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
}

+ (void)nightShiftCCT:(int64_t)a3
{
}

+ (void)nightShiftSunSchedulePermitted:(BOOL)a3
{
}

+ (void)harmonyColor:(const ColorReport *)a3
{
  id v6 = a1;
  SEL v5 = a2;
  uint64_t v4 = a3;
  bzero(v3, 0x200uLL);
  memcpy(v3, v4, sizeof(v3));
  [v6 sendSparseBins:&v3[848] count:10 withName:@".Harmony.Strength"];
  [v6 sendSparseBins:&v3[432] count:46 withName:@".Harmony.Ambient"];
  [v6 sendSparseBins:&v3[216] count:17 withName:@".Harmony.Display"];
}

+ (void)harmonyEnabled:(BOOL)a3 byUser:(BOOL)a4
{
  id v15 = a1;
  SEL v14 = a2;
  BOOL v13 = a3;
  BOOL v12 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __37__CBAnalytics_harmonyEnabled_byUser___block_invoke;
  BOOL v9 = &__block_descriptor_34_e19___NSDictionary_8__0l;
  BOOL v10 = v13;
  BOOL v11 = v12;
  objc_msgSend(v15, "send:withBlock:", @".Harmony.Enabled");
}

uint64_t __37__CBAnalytics_harmonyEnabled_byUser___block_invoke(uint64_t a1)
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"enabled";
  v4[0] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 32) & 1];
  v3[1] = @"userChange";
  v4[1] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 33) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
}

+ (void)autoDimLeave:(double)a3
{
  id v12 = a1;
  SEL v11 = a2;
  double v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __28__CBAnalytics_autoDimLeave___block_invoke;
  int v8 = &__block_descriptor_40_e19___NSDictionary_8__0l;
  double v9 = v10;
  objc_msgSend(v12, "send:withBlock:", @".AutoDim.Leave");
}

uint64_t __28__CBAnalytics_autoDimLeave___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"duration";
  v3[0] = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
}

+ (void)sbimMitigationTriggeredWithBrightness:(float)a3
{
  id v12 = a1;
  SEL v11 = a2;
  float v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __53__CBAnalytics_sbimMitigationTriggeredWithBrightness___block_invoke;
  int v8 = &__block_descriptor_36_e19___NSDictionary_8__0l;
  float v9 = v10;
  objc_msgSend(v12, "send:withBlock:", @".SBIM.CapsHeadroom");
}

uint64_t __53__CBAnalytics_sbimMitigationTriggeredWithBrightness___block_invoke(uint64_t a1, double a2)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = @"sdrBrightness";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v4[0] = [NSNumber numberWithFloat:a2];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

+ (void)cltmBudgetUpdated:(float)a3 currentSDRBrightness:(float)a4
{
  id v15 = a1;
  SEL v14 = a2;
  float v13 = a3;
  float v12 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __54__CBAnalytics_cltmBudgetUpdated_currentSDRBrightness___block_invoke;
  float v9 = &__block_descriptor_40_e19___NSDictionary_8__0l;
  float v10 = v12;
  float v11 = v13;
  objc_msgSend(v15, "send:withBlock:", @".cltm.capsBrightness");
}

uint64_t __54__CBAnalytics_cltmBudgetUpdated_currentSDRBrightness___block_invoke(uint64_t a1, double a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"brightnessDrop";
  *(float *)&a2 = *(float *)(a1 + 32) - *(float *)(a1 + 36);
  v6[0] = [NSNumber numberWithFloat:a2];
  v5[1] = @"nitsBeforeCap";
  LODWORD(v2) = *(_DWORD *)(a1 + 32);
  v6[1] = [NSNumber numberWithFloat:v2];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
}

+ (void)illuminanceHistogram:(id)a3
{
  id v12 = a1;
  SEL v11 = a2;
  id v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __36__CBAnalytics_illuminanceHistogram___block_invoke;
  int v8 = &unk_1E6218E28;
  id v9 = v12;
  objc_msgSend(v10, "enumerateBinsUsingBlock:");
}

uint64_t __36__CBAnalytics_illuminanceHistogram___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a3;
  id v17 = a4;
  uint64_t v16 = a1;
  uint64_t result = [a4 doubleValue];
  if (v5 != 0.0)
  {
    int v6 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    SEL v11 = __36__CBAnalytics_illuminanceHistogram___block_invoke_2;
    id v12 = &unk_1E6218E00;
    uint64_t v15 = v19;
    uint64_t v13 = v18;
    SEL v14 = v17;
    return objc_msgSend(v6, "send:withBlock:", @".Illuminance");
  }
  return result;
}

uint64_t __36__CBAnalytics_illuminanceHistogram___block_invoke_2(uint64_t a1)
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"index";
  v6[0] = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v5[1] = @"edge";
  v6[1] = *(void *)(a1 + 32);
  void v5[2] = @"value";
  uint64_t v4 = NSNumber;
  [*(id *)(a1 + 40) doubleValue];
  v6[2] = [v4 numberWithDouble:v1 * 1000.0];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
}

+ (void)rtplcTriggeredWithLength:(unint64_t)a3 maxAPCE:(float)a4 durationInSeconds:(float)a5 sdrBrightness:(float)a6 referenceModeEnabled:(BOOL)a7
{
  *(float *)&uint64_t v7 = a6;
  BYTE4(v7) = a7;
  objc_msgSend(a1, "send:withBlock:", @".rtplc.Burst", MEMORY[0x1E4F143A8], 3221225472, __101__CBAnalytics_rtplcTriggeredWithLength_maxAPCE_durationInSeconds_sdrBrightness_referenceModeEnabled___block_invoke, &__block_descriptor_53_e19___NSDictionary_8__0l, a3, __PAIR64__(LODWORD(a5), LODWORD(a4)), v7);
}

uint64_t __101__CBAnalytics_rtplcTriggeredWithLength_maxAPCE_durationInSeconds_sdrBrightness_referenceModeEnabled___block_invoke(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6[0] = @"frameCount";
  v7[0] = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v6[1] = @"maxApce";
  LODWORD(v1) = *(_DWORD *)(a1 + 40);
  v7[1] = [NSNumber numberWithFloat:v1];
  v6[2] = @"durationInSeconds";
  LODWORD(v2) = *(_DWORD *)(a1 + 44);
  v7[2] = [NSNumber numberWithFloat:v2];
  void v6[3] = @"brightness";
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  v7[3] = [NSNumber numberWithFloat:v3];
  void v6[4] = @"referenceModeEnabled";
  v7[4] = [NSNumber numberWithBool:*(unsigned char *)(a1 + 52) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
}

+ (void)luminanceHistogram:(id)a3 withName:(id)a4
{
  id v15 = a1;
  SEL v14 = a2;
  id v13 = a3;
  id v12 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __43__CBAnalytics_luminanceHistogram_withName___block_invoke;
  int v9 = &unk_1E6218E98;
  id v10 = v15;
  id v11 = v12;
  objc_msgSend(v13, "enumerateBinsUsingBlock:");
}

uint64_t __43__CBAnalytics_luminanceHistogram_withName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = a1;
  uint64_t v20 = a2;
  uint64_t v19 = a3;
  uint64_t v18 = a4;
  uint64_t v17 = a1;
  uint64_t result = [a4 doubleValue];
  if (v5 != 0.0)
  {
    int v6 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = __43__CBAnalytics_luminanceHistogram_withName___block_invoke_2;
    id v12 = &unk_1E6218E70;
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v16 = v20;
    uint64_t v14 = v19;
    id v15 = v18;
    return objc_msgSend(v6, "send:withBlock:", @".Luminance");
  }
  return result;
}

uint64_t __43__CBAnalytics_luminanceHistogram_withName___block_invoke_2(uint64_t a1)
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"name";
  v6[0] = *(void *)(a1 + 32);
  v5[1] = @"index";
  v6[1] = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  void v5[2] = @"edge";
  v6[2] = *(void *)(a1 + 40);
  void v5[3] = @"value";
  uint64_t v4 = NSNumber;
  [*(id *)(a1 + 48) doubleValue];
  void v6[3] = [v4 numberWithDouble:v1 * 1000.0];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
}

+ (void)displayMaxCurrent:(float)a3
{
}

+ (void)userSliderCommit:(const CBSliderCommitInfo *)a3
{
  id v12 = a1;
  SEL v11 = a2;
  int v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __32__CBAnalytics_userSliderCommit___block_invoke;
  uint64_t v8 = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  int v9 = v10;
  objc_msgSend(v12, "send:withBlock:", @".UserSliderCommit_v4");
}

void *__32__CBAnalytics_userSliderCommit___block_invoke(uint64_t a1)
{
  v38[46] = *MEMORY[0x1E4F143B8];
  v34 = (void *)MEMORY[0x1E4F1CA60];
  v37[0] = @"aabParamsUpdateOnly";
  v38[0] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 140) & 1];
  v37[1] = @"autoBrightnessEnabled";
  v38[1] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 52) & 1];
  v37[2] = @"apce";
  LODWORD(v1) = *(_DWORD *)(*(void *)(a1 + 32) + 40);
  v38[2] = [NSNumber numberWithFloat:v1];
  v37[3] = @"colorAdaptationMode";
  v38[3] = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 200)];
  v37[4] = @"colorAdaptationStrength";
  *(float *)&double v2 = *(float *)(*(void *)(a1 + 32) + 196) * 100.0;
  v38[4] = [NSNumber numberWithFloat:v2];
  v37[5] = @"darkAppearanceApplied";
  v38[5] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 204) & 1];
  v37[6] = @"delayedAPCE";
  LODWORD(v3) = *(_DWORD *)(*(void *)(a1 + 32) + 44);
  v38[6] = [NSNumber numberWithFloat:v3];
  v37[7] = @"delayedAPCEStatus";
  v38[7] = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 48)];
  v37[8] = @"e0a";
  LODWORD(v4) = *(_DWORD *)(*(void *)(a1 + 32) + 60);
  v38[8] = [NSNumber numberWithFloat:v4];
  v37[9] = @"e0b";
  LODWORD(v5) = *(_DWORD *)(*(void *)(a1 + 32) + 64);
  v38[9] = [NSNumber numberWithFloat:v5];
  v37[10] = @"e1";
  LODWORD(v6) = *(_DWORD *)(*(void *)(a1 + 32) + 68);
  v38[10] = [NSNumber numberWithFloat:v6];
  v37[11] = @"e2";
  LODWORD(v7) = *(_DWORD *)(*(void *)(a1 + 32) + 72);
  v38[11] = [NSNumber numberWithFloat:v7];
  v37[12] = @"ecoModeFactor";
  *(float *)&double v8 = *(float *)(*(void *)(a1 + 32) + 56) * 100.0;
  v38[12] = [NSNumber numberWithFloat:v8];
  v37[13] = @"EDRHeadroom";
  LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 32) + 192);
  v38[13] = [NSNumber numberWithFloat:v9];
  v37[14] = @"frontLux";
  LODWORD(v10) = *(_DWORD *)(*(void *)(a1 + 32) + 20);
  v38[14] = [NSNumber numberWithFloat:v10];
  v37[15] = @"l0a";
  LODWORD(v11) = *(_DWORD *)(*(void *)(a1 + 32) + 76);
  v38[15] = [NSNumber numberWithFloat:v11];
  v37[16] = @"l0b";
  LODWORD(v12) = *(_DWORD *)(*(void *)(a1 + 32) + 80);
  v38[16] = [NSNumber numberWithFloat:v12];
  v37[17] = @"l1";
  LODWORD(v13) = *(_DWORD *)(*(void *)(a1 + 32) + 84);
  v38[17] = [NSNumber numberWithFloat:v13];
  v37[18] = @"l2";
  LODWORD(v14) = *(_DWORD *)(*(void *)(a1 + 32) + 88);
  v38[18] = [NSNumber numberWithFloat:v14];
  v37[19] = @"landscapeOrientation";
  v38[19] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 205) & 1];
  v37[20] = @"nits";
  LODWORD(v15) = *(_DWORD *)(*(void *)(a1 + 32) + 32);
  v38[20] = [NSNumber numberWithFloat:v15];
  v37[21] = @"slider";
  LODWORD(v16) = *(_DWORD *)(*(void *)(a1 + 32) + 36);
  v38[21] = [NSNumber numberWithFloat:v16];
  v37[22] = @"outdoorBrightnessBoostFactor";
  LODWORD(v17) = *(_DWORD *)(*(void *)(a1 + 32) + 188);
  v38[22] = [NSNumber numberWithFloat:v17];
  v37[23] = @"proxMitigationTriggered";
  v38[23] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 186) & 1];
  v37[24] = @"rearLux";
  LODWORD(v18) = *(_DWORD *)(*(void *)(a1 + 32) + 24);
  v38[24] = [NSNumber numberWithFloat:v18];
  v37[25] = @"rearLuxInUse";
  v38[25] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 28) & 1];
  v37[26] = @"thermalMitigationLimitingBrightness";
  v38[26] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 184) & 1];
  v37[27] = @"thirdSlope";
  LODWORD(v19) = *(_DWORD *)(*(void *)(a1 + 32) + 92);
  v38[27] = [NSNumber numberWithFloat:v19];
  v37[28] = @"timestamp";
  v38[28] = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 32) + 8)];
  v37[29] = @"touchMitigationTriggered";
  v38[29] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 185) & 1];
  v37[30] = @"trustedLux";
  v38[30] = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
  v37[31] = @"alternativeE0a";
  LODWORD(v20) = *(_DWORD *)(*(void *)(a1 + 32) + 100);
  v38[31] = [NSNumber numberWithFloat:v20];
  v37[32] = @"alternativeE0b";
  LODWORD(v21) = *(_DWORD *)(*(void *)(a1 + 32) + 104);
  v38[32] = [NSNumber numberWithFloat:v21];
  v37[33] = @"alternativeE1";
  LODWORD(v22) = *(_DWORD *)(*(void *)(a1 + 32) + 108);
  v38[33] = [NSNumber numberWithFloat:v22];
  v37[34] = @"alternativeE2";
  LODWORD(v23) = *(_DWORD *)(*(void *)(a1 + 32) + 112);
  v38[34] = [NSNumber numberWithFloat:v23];
  v37[35] = @"alternativeL0a";
  LODWORD(v24) = *(_DWORD *)(*(void *)(a1 + 32) + 116);
  v38[35] = [NSNumber numberWithFloat:v24];
  v37[36] = @"alternativeL0b";
  LODWORD(v25) = *(_DWORD *)(*(void *)(a1 + 32) + 120);
  v38[36] = [NSNumber numberWithFloat:v25];
  v37[37] = @"alternativeL1";
  LODWORD(v26) = *(_DWORD *)(*(void *)(a1 + 32) + 124);
  v38[37] = [NSNumber numberWithFloat:v26];
  v37[38] = @"alternativeL2";
  LODWORD(v27) = *(_DWORD *)(*(void *)(a1 + 32) + 128);
  v38[38] = [NSNumber numberWithFloat:v27];
  v37[39] = @"alternativeThirdSlope";
  LODWORD(v28) = *(_DWORD *)(*(void *)(a1 + 32) + 132);
  v38[39] = [NSNumber numberWithFloat:v28];
  v37[40] = @"aabParamsUpdateReason";
  v38[40] = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 144)];
  v37[41] = @"nitsDelta";
  LODWORD(v29) = *(_DWORD *)(*(void *)(a1 + 32) + 148);
  v38[41] = [NSNumber numberWithFloat:v29];
  v37[42] = @"nitsDeltaAlternative";
  LODWORD(v30) = *(_DWORD *)(*(void *)(a1 + 32) + 152);
  v38[42] = [NSNumber numberWithFloat:v30];
  v37[43] = @"restoreTimeTarget";
  v38[43] = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 32) + 160)];
  v37[44] = @"inactiveLength";
  LODWORD(v31) = *(_DWORD *)(*(void *)(a1 + 32) + 168);
  v38[44] = [NSNumber numberWithFloat:v31];
  v37[45] = @"inactiveStart";
  v38[45] = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 32) + 176)];
  v32 = objc_msgSend(v34, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v38, v37, 46));
  v36 = v32;
  if (*(void *)(*(void *)(a1 + 32) + 224))
  {
    objc_msgSend(v32, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(*(void *)(a1 + 32) + 216)), @"trialDeploymentId");
    [v36 setObject:*(void *)(*(void *)(a1 + 32) + 208) forKey:@"trialExperimentId"];
    [v36 setObject:*(void *)(*(void *)(a1 + 32) + 224) forKey:@"trialTreatmentId"];
  }
  return v36;
}

+ (void)alsOcclusionsByProx:(int64_t)a3 andByTouch:(int64_t)a4 touchProx:(int64_t)a5 none:(int64_t)a6
{
  id v21 = a1;
  SEL v20 = a2;
  int64_t v19 = a3;
  int64_t v18 = a4;
  int64_t v17 = a5;
  int64_t v16 = a6;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  double v10 = __61__CBAnalytics_alsOcclusionsByProx_andByTouch_touchProx_none___block_invoke;
  double v11 = &__block_descriptor_64_e19___NSDictionary_8__0l;
  int64_t v12 = v19;
  int64_t v13 = v18;
  int64_t v14 = v17;
  int64_t v15 = v16;
  objc_msgSend(v21, "send:withBlock:", @".ALSOcclusion");
}

uint64_t __61__CBAnalytics_alsOcclusionsByProx_andByTouch_touchProx_none___block_invoke(void *a1)
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"prox";
  v4[0] = [NSNumber numberWithInteger:a1[4]];
  v3[1] = @"touch";
  v4[1] = [NSNumber numberWithInteger:a1[5]];
  void v3[2] = @"touchProx";
  void v4[2] = [NSNumber numberWithInteger:a1[6]];
  v3[3] = @"none";
  void v4[3] = [NSNumber numberWithInteger:a1[7]];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
}

+ (void)touchOcclusionElapsedDelay:(float)a3
{
  id v12 = a1;
  SEL v11 = a2;
  float v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __42__CBAnalytics_touchOcclusionElapsedDelay___block_invoke;
  int v8 = &__block_descriptor_36_e19___NSDictionary_8__0l;
  float v9 = v10;
  objc_msgSend(v12, "send:withBlock:", @".TouchOcclusionDelay");
}

uint64_t __42__CBAnalytics_touchOcclusionElapsedDelay___block_invoke(uint64_t a1, double a2)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  double v3 = @"time";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v4[0] = [NSNumber numberWithFloat:a2];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

@end