@interface PKTextInputAnalyticsController
+ (id)sharedInstance;
+ (void)beginObservingSessionAnalytics;
- (NSTimer)eventSourceTimer;
- (PKTextInputAnalyticsController)init;
- (id)configuredSystemActionBundleIdentifier;
- (id)matchingAccumulatorNames;
- (void)_dispatchAnalytics;
- (void)_dispatchPencilSettingsAnalytics;
- (void)_setupAnalyticsTimer;
- (void)_updateAnalyticsTracking;
- (void)activePencilUsage:(id)a3;
- (void)dealloc;
- (void)didBeginSession;
- (void)didEndMatchingAccumulatorName:(id)a3;
- (void)didUpdateToEventSource:(int64_t)a3;
- (void)eventSourceDidChange:(id)a3;
- (void)messageHandwritingAnalyticsWithProxyBlock:(id)a3;
- (void)q_didBeginSession;
- (void)q_didEndMatchingAccumulatorName:(id)a3 inputMode:(id)a4;
- (void)setEventSourceTimer:(id)a3;
@end

@implementation PKTextInputAnalyticsController

+ (void)beginObservingSessionAnalytics
{
  id v2 = (id)[a1 sharedInstance];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PKTextInputAnalyticsController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB3C60E8 != -1) {
    dispatch_once(&qword_1EB3C60E8, block);
  }
  id v2 = (void *)_MergedGlobals_149;

  return v2;
}

void __48__PKTextInputAnalyticsController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)_MergedGlobals_149;
  _MergedGlobals_149 = (uint64_t)v1;
}

- (PKTextInputAnalyticsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKTextInputAnalyticsController;
  id v2 = [(PKTextInputAnalyticsController *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInputAnalyticsController", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [MEMORY[0x1E4FB1D90] addEndingObserver:v2];
    v2->_lastEventSource = 0;
    v2->_lastEventSourceChangeTimestamp = mach_absolute_time();
    *(_OWORD *)v2->_eventSourceUsage = 0u;
    *(_OWORD *)&v2->_eventSourceUsage[2] = 0u;
    *(_OWORD *)&v2->_eventSourceUsage[4] = 0u;
    *(_OWORD *)&v2->_eventSourceUsage[6] = 0u;
    v2->_eventSourceUsage[8] = 0;
    if (PK_UIApplicationIsSystemShell_onceToken != -1) {
      dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
    }
    if (PK_UIApplicationIsSystemShell___result)
    {
      [(PKTextInputAnalyticsController *)v2 _setupAnalyticsTimer];
      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:v2 selector:sel_eventSourceDidChange_ name:*MEMORY[0x1E4FB3080] object:0];

      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:v2 selector:sel_activePencilUsage_ name:@"com.apple.pencilkit.pkactivepencilusage" object:0];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3080] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputAnalyticsController;
  [(PKTextInputAnalyticsController *)&v4 dealloc];
}

- (void)didBeginSession
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKTextInputAnalyticsController_didBeginSession__block_invoke;
  aBlock[3] = &unk_1E64C61C0;
  aBlock[4] = self;
  id v2 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

void __49__PKTextInputAnalyticsController_didBeginSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKTextInputAnalyticsController_didBeginSession__block_invoke_2;
  block[3] = &unk_1E64C61C0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __49__PKTextInputAnalyticsController_didBeginSession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_didBeginSession");
}

- (void)q_didBeginSession
{
}

void __51__PKTextInputAnalyticsController_q_didBeginSession__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didBeginInputSession];
  }
}

- (id)matchingAccumulatorNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB3068], *MEMORY[0x1E4FB3070], 0);
}

- (void)didEndMatchingAccumulatorName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke;
  objc_super v10 = &unk_1E64C5F60;
  v11 = self;
  id v5 = v4;
  id v12 = v5;
  v6 = (void (**)(void))_Block_copy(&v7);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7, v8, v9, v10, v11)) {
    v6[2](v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke(uint64_t a1)
{
  id v2 = +[PKTextInputSettings sharedSettings];
  v3 = [v2 recognitionLocaleIdentifier];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke_2;
  block[3] = &unk_1E64C9B48;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_didEndMatchingAccumulatorName:inputMode:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)q_didEndMatchingAccumulatorName:(id)a3 inputMode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4FB3068]])
  {
    id v8 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v9 = __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke;
LABEL_5:
    v8[2] = v9;
    v8[3] = &unk_1E64C9B70;
    v8[4] = v7;
    [(PKTextInputAnalyticsController *)self messageHandwritingAnalyticsWithProxyBlock:v8];

    goto LABEL_6;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB3070]])
  {
    id v8 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v9 = __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke_2;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndInputSessionWithInputMode:*(void *)(a1 + 32)];
}

uint64_t __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didEndInputSessionUsingScribbleWithInputMode:*(void *)(a1 + 32)];
}

- (void)messageHandwritingAnalyticsWithProxyBlock:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.handwritingd.pkanalytics" options:0];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F20A7548];
    [v4 setRemoteObjectInterface:v5];
    [v4 resume];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__PKTextInputAnalyticsController_messageHandwritingAnalyticsWithProxyBlock___block_invoke;
    v7[3] = &unk_1E64C9958;
    v7[4] = &v8;
    id v6 = [v4 remoteObjectProxyWithErrorHandler:v7];
    if (!*((unsigned char *)v9 + 24)) {
      v3[2](v3, v6);
    }
    [v4 invalidate];

    _Block_object_dispose(&v8, 8);
  }
}

void __76__PKTextInputAnalyticsController_messageHandwritingAnalyticsWithProxyBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection for analytics: %@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (void)eventSourceDidChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4FB3078]];
  uint64_t v6 = [v5 integerValue];

  [(PKTextInputAnalyticsController *)self didUpdateToEventSource:v6];
}

- (void)activePencilUsage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 userInfo];
  id v9 = [v5 objectForKeyedSubscript:@"com.apple.pencilkit.pkactivepencilusage.type"];

  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"com.apple.pencilkit.pkactivepencilusage.interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      self->_activePencilUsage = v8 + self->_activePencilUsage;
      self->_lastActivePencilType = [v9 integerValue];
    }
  }
}

- (void)didUpdateToEventSource:(int64_t)a3
{
  self->_lastEventSource = a3;
}

- (void)_updateAnalyticsTracking
{
  if (qword_1EB3C60F8 != -1) {
    dispatch_once(&qword_1EB3C60F8, &__block_literal_global_136_0);
  }
  int64_t lastEventSource = self->_lastEventSource;
  uint64_t v4 = mach_absolute_time();
  self->_eventSourceUsage[lastEventSource] += (v4 - self->_lastEventSourceChangeTimestamp)
                                            * dword_1EB3C60F0
                                            / *(unsigned int *)algn_1EB3C60F4
                                            / 0xF4240;
  self->_lastEventSourceChangeTimestamp = v4;
}

void __58__PKTextInputAnalyticsController__updateAnalyticsTracking__block_invoke()
{
  kern_return_t v0;
  kern_return_t v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = mach_timebase_info((mach_timebase_info_t)&dword_1EB3C60F0);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3[0] = 67109120;
      v3[1] = v1;
      _os_log_error_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_ERROR, "Analytics: Unable to get mach timebase info. Error: %d", (uint8_t *)v3, 8u);
    }
  }
}

- (void)_setupAnalyticsTimer
{
  id v3 = [(PKTextInputAnalyticsController *)self eventSourceTimer];
  [v3 invalidate];

  self->_eventSourceUsage[8] = 0;
  *(_OWORD *)&self->_eventSourceUsage[4] = 0u;
  *(_OWORD *)&self->_eventSourceUsage[6] = 0u;
  *(_OWORD *)self->_eventSourceUsage = 0u;
  *(_OWORD *)&self->_eventSourceUsage[2] = 0u;
  self->_activePencilUsage = 0.0;
  id v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  int v5 = [v14 startOfDayForDate:v4];
  uint64_t v6 = [v14 dateByAddingUnit:16 value:1 toDate:v5 options:0];
  uint64_t v7 = [v14 dateByAddingUnit:64 value:30 toDate:v6 options:0];
  if (MGGetBoolAnswer())
  {
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
    uint64_t v9 = [v8 integerForKey:@"DailyAnalyticsFrequencyInMinutesForTesting"];
    if (v9 >= 1)
    {
      uint64_t v10 = [v14 dateByAddingUnit:64 value:v9 toDate:v4 options:0];

      uint64_t v7 = (void *)v10;
    }
  }
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v7 interval:self target:sel__dispatchAnalytics selector:0 userInfo:0 repeats:1000.0];
  [(PKTextInputAnalyticsController *)self setEventSourceTimer:v11];

  id v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  v13 = [(PKTextInputAnalyticsController *)self eventSourceTimer];
  [v12 addTimer:v13 forMode:*MEMORY[0x1E4F1C3A0]];
}

- (void)_dispatchAnalytics
{
  [(PKTextInputAnalyticsController *)self didUpdateToEventSource:0];
  for (uint64_t i = 0; i != 9; ++i)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1D90] stringValueForSource:i];
    int v5 = v4;
    if (i == 3 && self->_lastActivePencilType == 1)
    {
      uint64_t v6 = [v4 stringByAppendingString:@"3rdPartyOrCrayon"];

      int v5 = (void *)v6;
    }
    double v8 = v5;
    id v7 = v5;
    AnalyticsSendEventLazy();
  }
  if (+[PKHoverSettings isHoverActive]) {
    +[PKHoverSettings checkIfHoverIsEnabled:&__block_literal_global_168_0];
  }
  [(PKTextInputAnalyticsController *)self _dispatchPencilSettingsAnalytics];
  [(PKTextInputAnalyticsController *)self _setupAnalyticsTimer];
}

id __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke(uint64_t a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bundle";
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  uint64_t v4 = *(void *)(a1 + 32);
  v10[0] = v3;
  v10[1] = v4;
  v9[1] = @"source";
  v9[2] = @"minutes";
  int v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v10[2] = v5;
  v9[3] = @"activepencilminutes";
  uint64_t v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

uint64_t __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke_2()
{
  v0 = +[PKTextInputSettings sharedSettings];
  [v0 isScribbleActive];

  +[PKHoverSettings allowDoubleTapOnlyWithPencilHover];
  return AnalyticsSendEventLazy();
}

id __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke_3(unsigned __int8 *a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"settingShowEffectsEnabled";
  id v2 = [NSNumber numberWithBool:a1[32]];
  v9[0] = v2;
  v8[1] = @"settingScribbleEnabled";
  id v3 = [NSNumber numberWithBool:a1[33]];
  v9[1] = v3;
  v8[2] = @"settingSystemShadowEnabled";
  uint64_t v4 = [NSNumber numberWithBool:a1[34]];
  v9[2] = v4;
  v8[3] = @"settingDoubleTapInRangeEnabled";
  int v5 = [NSNumber numberWithBool:a1[35]];
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)configuredSystemActionBundleIdentifier
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"SBPencilSystemShortcutAction"];

  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  int v5 = (void *)qword_1EB3C6100;
  uint64_t v18 = qword_1EB3C6100;
  if (!qword_1EB3C6100)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getWFConfiguredSystemActionClass_block_invoke;
    v14[3] = &unk_1E64C5478;
    v14[4] = &v15;
    __getWFConfiguredSystemActionClass_block_invoke((uint64_t)v14);
    int v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  uint64_t v13 = 0;
  id v7 = [v4 unarchivedObjectOfClass:v6 fromData:v3 error:&v13];
  double v8 = v7;
  if (v13)
  {

LABEL_6:
    double v8 = 0;
  }
  uint64_t v9 = [v8 associatedBundleIdentifier];
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v9 = @"<unknown>";
  }
  char v11 = v9;

  return v11;
}

- (void)_dispatchPencilSettingsAnalytics
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.preferences.sounds"];
  uint64_t v4 = [v3 objectForKey:@"effects-pencil-haptic"];
  int v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CC38];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  double v8 = +[PKStatisticsManager sharedStatisticsManager]();
  [MEMORY[0x1E4FB1A80] preferredTapAction];

  uint64_t v9 = +[PKPencilDevice activePencil];
  [v9 pencilVersionForAnalytics];

  uint64_t v10 = +[PKHoverSettings sharedSettings];
  [v10 toolShadowActive];

  char v11 = [(PKTextInputAnalyticsController *)self configuredSystemActionBundleIdentifier];
  id v12 = +[PKStatisticsManager sharedStatisticsManager]();
  [MEMORY[0x1E4FB1A80] preferredSqueezeAction];

  [MEMORY[0x1E4FB1A80] preferredSqueezeAction];
  +[PKPencilSqueezeAnalyticsController currentSqueezeThresholdIndex]();
  [MEMORY[0x1E4FB1A80] preferredSqueezeAction];
  uint64_t v15 = v7;
  v16 = v11;
  id v13 = v11;
  id v14 = v7;
  AnalyticsSendEventLazy();
}

id __66__PKTextInputAnalyticsController__dispatchPencilSettingsAnalytics__block_invoke(uint64_t a1)
{
  v15[10] = *MEMORY[0x1E4F143B8];
  v14[0] = @"barrelRollEnablement";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
  v15[0] = v2;
  v14[1] = @"doubleTapState";
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 32);
  v15[1] = v3;
  v15[2] = v4;
  v14[2] = @"hapticsEnablement";
  v14[3] = @"pencilVersion";
  int v5 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v15[3] = v5;
  v14[4] = @"shadowEnablement";
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 89)];
  uint64_t v7 = *(void *)(a1 + 40);
  v15[4] = v6;
  v15[5] = v7;
  void v14[5] = @"shortcutIntentIdentifier";
  v14[6] = @"squeezeSettingStateCanvas";
  double v8 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v15[6] = v8;
  v14[7] = @"squeezeSettingStateSystem";
  uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  v15[7] = v9;
  v14[8] = @"squeezeThresholdState";
  uint64_t v10 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
  v15[8] = v10;
  v14[9] = @"wasShortcutEnabled";
  char v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 90)];
  v15[9] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:10];

  return v12;
}

- (NSTimer)eventSourceTimer
{
  return self->_eventSourceTimer;
}

- (void)setEventSourceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSourceTimer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end