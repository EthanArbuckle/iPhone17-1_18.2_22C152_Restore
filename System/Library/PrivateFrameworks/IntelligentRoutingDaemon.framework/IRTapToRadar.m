@interface IRTapToRadar
+ (id)shared;
- (BOOL)pendingNotificationPresent;
- (IRTapToRadar)init;
- (NSDate)previousNotificationDate;
- (OS_dispatch_queue)queue;
- (id)_createErrorEventPromptIfAllowed:(id)a3;
- (id)_createErrorEventsPromptsForMediaEvent:(id)a3;
- (id)_createPeriodicPromptIfAllowed:(id)a3;
- (id)_createPeriodicPromptsForMediaEvent:(id)a3;
- (id)_errorEventQuestionaire:(id)a3;
- (id)_triggerUserPrompts:(id)a3;
- (void)_initiatePopupAndTTR:(id)a3;
- (void)promptForTapToRadarIfAllowed:(id)a3;
- (void)setPendingNotificationPresent:(BOOL)a3;
- (void)setPreviousNotificationDate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IRTapToRadar

+ (id)shared
{
  if (shared_onceToken_1 != -1) {
    dispatch_once(&shared_onceToken_1, &__block_literal_global_24);
  }
  v2 = (void *)shared_tapToRadar;

  return v2;
}

uint64_t __22__IRTapToRadar_shared__block_invoke()
{
  shared_tapToRadar = objc_alloc_init(IRTapToRadar);

  return MEMORY[0x270F9A758]();
}

- (IRTapToRadar)init
{
  v8.receiver = self;
  v8.super_class = (Class)IRTapToRadar;
  v2 = [(IRTapToRadar *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(IRTapToRadar *)v2 setPendingNotificationPresent:0];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.intelligentrouting.alert", v4);
    [(IRTapToRadar *)v3 setQueue:v5];

    v6 = v3;
  }

  return v3;
}

- (void)promptForTapToRadarIfAllowed:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(IRTapToRadar *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__IRTapToRadar_promptForTapToRadarIfAllowed___block_invoke;
  v7[3] = &unk_2653A1048;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

void __45__IRTapToRadar_promptForTapToRadarIfAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 _createErrorEventPromptIfAllowed:*(void *)(a1 + 32)];
  if (v3
    || ([v4 _createPeriodicPromptIfAllowed:*(void *)(a1 + 32)],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v4 _initiatePopupAndTTR:v3];
  }
}

- (void)_initiatePopupAndTTR:(id)a3
{
  id v13 = a3;
  if (+[IRPlatformInfo isInternalInstall]
    && ![(IRTapToRadar *)self pendingNotificationPresent])
  {
    [(IRTapToRadar *)self setPendingNotificationPresent:1];
    id v4 = [(IRTapToRadar *)self _triggerUserPrompts:v13];
    if (v4)
    {
      dispatch_queue_t v5 = NSString;
      id v6 = [v13 query];
      v7 = [v6 radarDescription];
      id v8 = [v5 stringWithFormat:@"%@%@", v7, v4];
      v9 = [v13 query];
      [v9 setRadarDescription:v8];

      v10 = [MEMORY[0x263F01880] defaultWorkspace];
      v11 = [v13 query];
      v12 = [v11 build];
      [v10 openURL:v12 configuration:0 completionHandler:&__block_literal_global_186];

      [(IRTapToRadar *)self setPendingNotificationPresent:0];
    }
  }
}

void __37__IRTapToRadar__initiatePopupAndTTR___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      __37__IRTapToRadar__initiatePopupAndTTR___block_invoke_cold_1(v6, v5);
    }
  }
}

- (id)_errorEventQuestionaire:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  LOWORD(v10) = 257;
  id v4 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, @"RadarPrompt", @"\nIf you find this suggestion unreasonable, would you like to assist by answering 3 yes/no questions?", @"Open radar", @"Not now", 0, v10);
  LOWORD(v11) = 0;
  id v5 = [[IRTTRpopup alloc] initWithHeader:v3 key:@"QuestionSameRoom" message:@"\nQuestion 1/3:\nIs the suggested device located in the room you are currently in?" defaultButton:@"I don't know" otherButton:@"No" alternateButton:@"Yes" ttrWillOpen:v11 dismissWillStop:v4];
  v14[1] = v5;
  LOWORD(v12) = 0;
  id v6 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, @"QuestionPreviouslyRouted", @"\nQuestion 2/3:\nHave you previously routed to this device from this room? ", @"I don't know", @"No", @"Yes", v12);
  v14[2] = v6;
  LOWORD(v13) = 0;
  v7 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, @"QuestionAirplayIntent", @"\nQuestion 3/3:\nWas your intention to route content to a different device?", @"I don't know", @"No", @"Yes", v13);

  v14[3] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];

  return v8;
}

- (id)_triggerUserPrompts:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  id v20 = (id)objc_opt_new();
  id v5 = [v4 popups];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__IRTapToRadar__triggerUserPrompts___block_invoke;
  v14[3] = &unk_2653A1090;
  v14[4] = &v21;
  void v14[5] = &v15;
  [v5 enumerateObjectsUsingBlock:v14];

  self->_pendingNotificationPresent = 0;
  id v6 = objc_opt_new();
  v7 = [v4 query];
  id v8 = [v7 title];
  [v6 setObject:v8 forKeyedSubscript:@"reason"];

  [v6 setObject:v16[5] forKeyedSubscript:@"prompts"];
  v9 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:1 error:0];
  uint64_t v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
  uint64_t v11 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_INFO, "#ttr, TTR prompt: %@", buf, 0xCu);
  }
  if (*((unsigned char *)v22 + 24)) {
    id v12 = v10;
  }
  else {
    id v12 = 0;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __36__IRTapToRadar__triggerUserPrompts___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = [v6 header];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263EFFFC8]];

  v9 = [v6 message];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263EFFFD8]];

  uint64_t v10 = [v6 otherButton];
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x263F00020]];

  uint64_t v11 = [v6 defaultButton];
  [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x263F00000]];

  id v12 = [v6 alternateButton];

  if (v12)
  {
    uint64_t v13 = [v6 alternateButton];
    [v7 setObject:v13 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  }
  v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, (CFDictionaryRef)v7);
  if (!v14)
  {
    uint64_t v15 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      __36__IRTapToRadar__triggerUserPrompts___block_invoke_cold_1(v15);
    }
    *a4 = 1;
  }
  v16 = objc_opt_new();
  uint64_t v17 = [v6 message];
  [v16 setObject:v17 forKeyedSubscript:@"message"];

  v18 = [v6 key];
  [v16 setObject:v18 forKeyedSubscript:@"key"];

  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
  CFUserNotificationCancel(v14);
  CFRelease(v14);
  if (responseFlags == 2)
  {
    *a4 = [v6 dismissWillStop];
    uint64_t v20 = [v6 otherButton];
    goto LABEL_13;
  }
  if (responseFlags == 1)
  {
    uint64_t v20 = [v6 alternateButton];
    goto LABEL_13;
  }
  v19 = 0;
  if (!responseFlags)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= [v6 ttrWillOpen];
    uint64_t v20 = [v6 defaultButton];
LABEL_13:
    v19 = (void *)v20;
  }
  [v16 setObject:v19 forKeyedSubscript:@"response"];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v16];
}

- (id)_createErrorEventPromptIfAllowed:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[IRPreferences shared];
  id v6 = [v5 liveOnTtrDebugDataRequestsEnabled];
  if (([v6 BOOLValue] & 1) == 0)
  {

LABEL_12:
    uint64_t v21 = 0;
    goto LABEL_13;
  }
  id v7 = +[IRPreferences shared];
  id v8 = [v7 liveOnEnable];
  int v9 = [v8 BOOLValue];

  if (!v9) {
    goto LABEL_12;
  }
  if (+[IRPlatformInfo isRunningInUnitTesting]) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v11 = [v10 objectForKey:@"IRTTRErrorEventsLastPopupDate"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  id v12 = v11;
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_17;
  }
  [v12 timeIntervalSinceNow];
  double v15 = -v14;
  v16 = +[IRPreferences shared];
  uint64_t v17 = [v16 ttrThrottleTimeSec];
  [v17 doubleValue];
  double v19 = v18;

  if (v19 <= v15)
  {
LABEL_17:
    uint64_t v21 = [(IRTapToRadar *)self _createErrorEventsPromptsForMediaEvent:v4];
    if (v21)
    {
      uint64_t v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
      char v24 = [MEMORY[0x263EFF910] now];
      [v23 setObject:v24 forKey:@"IRTTRErrorEventsLastPopupDate"];

      v25 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        v26 = v25;
        uint64_t v27 = [v21 query];
        v28 = [v27 title];
        int v29 = 138412290;
        double v30 = *(double *)&v28;
        _os_log_impl(&dword_25418E000, v26, OS_LOG_TYPE_INFO, "#ttr, TTR Error Event prompt created: %@", (uint8_t *)&v29, 0xCu);
      }
    }
    goto LABEL_20;
  }
  uint64_t v20 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
  {
    int v29 = 134218498;
    double v30 = v15;
    __int16 v31 = 2048;
    double v32 = v19;
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_debug_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEBUG, "#ttr, TTR Error Event throttled with interval: %0.1fsec, threshold:%0.1fsec, last popup at:%@", (uint8_t *)&v29, 0x20u);
  }
  uint64_t v21 = 0;
LABEL_20:

LABEL_13:

  return v21;
}

- (id)_createPeriodicPromptIfAllowed:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[IRPreferences shared];
  id v6 = [v5 liveOnTtrPeriodicDataRequestsEnabled];
  if (([v6 BOOLValue] & 1) == 0)
  {

LABEL_11:
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  id v7 = +[IRPreferences shared];
  id v8 = [v7 liveOnEnable];
  int v9 = [v8 BOOLValue];

  if (!v9) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v11 = [v10 objectForKey:@"IRTTRPeriodicLastPopupDate"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  id v12 = v11;
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_16;
  }
  [v12 timeIntervalSinceNow];
  double v15 = -v14;
  v16 = +[IRPreferences shared];
  uint64_t v17 = [v16 ttrPeriodicThrottleTimeSec];
  [v17 doubleValue];
  double v19 = v18;

  if (v19 <= v15)
  {
LABEL_16:
    uint64_t v21 = [(IRTapToRadar *)self _createPeriodicPromptsForMediaEvent:v4];
    if (v21)
    {
      uint64_t v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
      char v24 = [MEMORY[0x263EFF910] now];
      [v23 setObject:v24 forKey:@"IRTTRPeriodicLastPopupDate"];

      v25 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        v26 = v25;
        uint64_t v27 = [v21 query];
        v28 = [v27 title];
        int v29 = 138412290;
        double v30 = *(double *)&v28;
        _os_log_impl(&dword_25418E000, v26, OS_LOG_TYPE_INFO, "#ttr, TTR Periodic prompt created: %@", (uint8_t *)&v29, 0xCu);
      }
    }
    goto LABEL_19;
  }
  uint64_t v20 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
  {
    int v29 = 134218498;
    double v30 = v15;
    __int16 v31 = 2048;
    double v32 = v19;
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_debug_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEBUG, "#ttr, TTR periodic throttled with interval: %0.1fsec, threshold:%0.1fsec, last popup at:%@", (uint8_t *)&v29, 0x20u);
  }
  uint64_t v21 = 0;
LABEL_19:

LABEL_12:

  return v21;
}

- (id)_createErrorEventsPromptsForMediaEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  [v5 setQuery:v6];

  id v7 = [v5 query];
  [v7 setExtensionIdentifiers:&unk_2703AF3B0];

  id v8 = [v5 query];
  [v8 setRemoteDeviceSelections:&unk_2703AF3C8];

  int v9 = [v5 query];
  [v9 setRadarDescription:@"Thank you in assisting in Coriander Live On.\nYou can add any relevant information here:\n\n Please do not change description beyond this point.\n#############################\n"];

  uint64_t v10 = [v4 eventType];
  if (v10 == 2)
  {
    uint64_t v11 = @"Coriander - Automatic Route Revoked";
    goto LABEL_5;
  }
  if (v10 == 4)
  {
    uint64_t v11 = @"Coriander - One-Tap Suggestion Rejected";
LABEL_5:
    id v12 = [(IRTapToRadar *)self _errorEventQuestionaire:v11];
    [v5 setPopups:v12];

    uint64_t v13 = [NSString stringWithFormat:@"[Coriander Live On Event Prompt] %@", v11];
    double v14 = [v5 query];
    [v14 setTitle:v13];

    id v15 = v5;
    goto LABEL_7;
  }
  id v15 = 0;
LABEL_7:

  return v15;
}

- (id)_createPeriodicPromptsForMediaEvent:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  [v4 setQuery:v5];

  id v6 = [v4 query];
  [v6 setExtensionIdentifiers:&unk_2703AF3E0];

  id v7 = [v4 query];
  [v7 setRemoteDeviceSelections:&unk_2703AF3F8];

  id v8 = [v4 query];
  [v8 setRadarDescription:@"Thank you in assisting in Coriander Live On.\nYou can add any relevant information here:\n\n Please do not change description beyond this point.\n#############################\n"];

  uint64_t v9 = [v3 eventType];
  if (v9 != 5 && v9)
  {
    id v14 = 0;
  }
  else
  {
    LOWORD(v16) = 257;
    uint64_t v10 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", @"Coriander Live-On", @"RadarPrompt", @"Thank you for participating in the Coriander Live On. Would you help and file a radar?\n(You can always turn of this prompt in Internal Settings->Intelligent Routing)", @"Open radar", @"Not now", 0, v16);
    v17[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [v4 setPopups:v11];

    id v12 = [NSString stringWithFormat:@"[Coriander Live On Periodic Prompt] %@", @"Coriander - Periodic data collection"];
    uint64_t v13 = [v4 query];
    [v13 setTitle:v12];

    id v14 = v4;
  }

  return v14;
}

- (NSDate)previousNotificationDate
{
  return self->_previousNotificationDate;
}

- (void)setPreviousNotificationDate:(id)a3
{
}

- (BOOL)pendingNotificationPresent
{
  return self->_pendingNotificationPresent;
}

- (void)setPendingNotificationPresent:(BOOL)a3
{
  self->_pendingNotificationPresent = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_previousNotificationDate, 0);
}

void __37__IRTapToRadar__initiatePopupAndTTR___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 debugDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "#ttr, [ErrorId - TTR popup post error] Unable to post notification: %@", (uint8_t *)&v5, 0xCu);
}

void __36__IRTapToRadar__triggerUserPrompts___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25418E000, log, OS_LOG_TYPE_ERROR, "#ttr, [ErrorId - TTR alert error] Could not create alert notification", v1, 2u);
}

@end