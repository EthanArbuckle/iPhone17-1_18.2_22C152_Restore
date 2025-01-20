@interface CKFullScreenEffectManager
+ (double)delayBeforeEffectWithIdentifier:(id)a3;
+ (double)idleDurationAfterEffectWithIdentifier:(id)a3;
+ (id)localizedMaskStringForEffectWithIdentifier:(id)a3;
- (CKFullScreenEffect)currentEffect;
- (CKFullScreenEffectManager)init;
- (CKFullScreenEffectManagerDelegate)delegate;
- (CKScheduledUpdater)triggerUpdater;
- (NSMutableArray)effectQueue;
- (NSTimer)effectDurationTimer;
- (id)effectForIdentifier:(id)a3;
- (id)effectIdentifiers;
- (id)fullscreenEffectMap;
- (id)localizedDisplayNameForEffectWithIdentifier:(id)a3;
- (id)localizedPickerTitleForEffectWithIdentifier:(id)a3;
- (void)beginHoldingUpdatesForKey:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)endHoldingUpdatesForKey:(id)a3;
- (void)fullScreenEffectDidPrepareSoundEffect:(id)a3;
- (void)setCurrentEffect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectDurationTimer:(id)a3;
- (void)setEffectQueue:(id)a3;
- (void)setTriggerUpdater:(id)a3;
- (void)startFullscreenEffectForChatItem:(id)a3 language:(id)a4;
- (void)stopFullscreenEffect;
- (void)triggerNextEffect;
@end

@implementation CKFullScreenEffectManager

+ (id)localizedMaskStringForEffectWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKHappyBirthdayEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_BALLOONS_MESSAGE";
LABEL_19:
    v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

    goto LABEL_20;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKConfettiEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_CONFETTI_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKLasersEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_LASERS_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKFireworksEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_FIREWORKS_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKShootingStarEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_SHOOTING_STAR_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKSparklesEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_CELEBRATION_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKHeartEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_LOVE_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKEchoEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_ECHO_MESSAGE";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKSpotlightEffect"])
  {
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"SUMMARY_SPOTLIGHT_MESSAGE";
    goto LABEL_19;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

- (CKFullScreenEffectManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKFullScreenEffectManager;
  v2 = [(CKFullScreenEffectManager *)&v6 init];
  if (v2)
  {
    id v3 = [[CKScheduledUpdater alloc] initWithTarget:v2 action:sel_triggerNextEffect];
    [(CKFullScreenEffectManager *)v2 setTriggerUpdater:v3];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_didReceiveMemoryWarning name:*MEMORY[0x1E4F43670] object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CKScheduledUpdater *)self->_triggerUpdater invalidate];
  [(NSTimer *)self->_effectDurationTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CKFullScreenEffectManager;
  [(CKFullScreenEffectManager *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2 = (void *)sFullscreenEffectMap;
  sFullscreenEffectMap = 0;
}

- (id)fullscreenEffectMap
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (void *)sFullscreenEffectMap;
  if (!sFullscreenEffectMap)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/Messages/iMessageEffects"];
    objc_super v6 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:7 errorHandler:&__block_literal_global_36];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          v12 = [v11 bundleIdentifier];
          if (v12)
          {
            [v3 setObject:v11 forKey:v12];
          }
          else if (IMOSLoggingEnabled())
          {
            v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v11;
              _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Failed to get bundle identifier for %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v8);
    }

    v14 = (void *)sFullscreenEffectMap;
    sFullscreenEffectMap = (uint64_t)v3;

    v2 = (void *)sFullscreenEffectMap;
  }

  return v2;
}

uint64_t __48__CKFullScreenEffectManager_fullscreenEffectMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Couldn't enumerate %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return 1;
}

- (id)localizedDisplayNameForEffectWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CKFullScreenEffectManager *)self fullscreenEffectMap];
  objc_super v6 = [v5 objectForKey:v4];

  id v7 = [v6 localizedInfoDictionary];
  int v8 = [v7 objectForKey:@"CFBundleDisplayName"];

  return v8;
}

- (id)localizedPickerTitleForEffectWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 isAccessibilityPreferredContentSizeCategory];

  if (v6) {
    id v7 = @"AXEffectPickerTitle";
  }
  else {
    id v7 = @"EffectPickerTitle";
  }
  int v8 = [(CKFullScreenEffectManager *)self fullscreenEffectMap];
  id v9 = [v8 objectForKey:v4];

  __int16 v10 = [v9 localizedInfoDictionary];
  id v11 = [v10 objectForKey:v7];

  return v11;
}

- (id)effectIdentifiers
{
  v4[8] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.messages.effect.CKEchoEffect";
  v4[1] = @"com.apple.messages.effect.CKSpotlightEffect";
  v4[2] = @"com.apple.messages.effect.CKHappyBirthdayEffect";
  v4[3] = @"com.apple.messages.effect.CKConfettiEffect";
  v4[4] = @"com.apple.messages.effect.CKHeartEffect";
  v4[5] = @"com.apple.messages.effect.CKLasersEffect";
  v4[6] = @"com.apple.messages.effect.CKFireworksEffect";
  v4[7] = @"com.apple.messages.effect.CKSparklesEffect";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];

  return v2;
}

- (id)effectForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CKFullScreenEffectManager *)self fullscreenEffectMap];
    int v6 = [v5 objectForKey:v4];

    if (v6)
    {
      if (([v6 isLoaded] & 1) == 0) {
        [v6 load];
      }
      id v7 = objc_alloc_init((Class)[v6 principalClass]);
      [v7 setIdentifier:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)startFullscreenEffectForChatItem:(id)a3 language:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 supportsCommunicationSafety]
      && [v6 isCommSafetySensitive])
    {
      if (IMOSLoggingEnabled())
      {
        int v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Do not execute effects for sensitive messages", buf, 2u);
        }
LABEL_16:
      }
    }
    else
    {
      __int16 v10 = [v6 message];
      id v11 = [v10 subject];
      int v12 = [v11 isStewie];

      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          int v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Do not execute effects for Stewie chat", buf, 2u);
          }
          goto LABEL_16;
        }
      }
      else
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v13 = [(CKFullScreenEffectManager *)self effectQueue];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v51;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v51 != v15) {
                objc_enumerationMutation(v13);
              }
              long long v17 = [*(id *)(*((void *)&v50 + 1) + 8 * i) triggeringChatItem];
              char v18 = [v17 isEqual:v6];

              if (v18)
              {

                goto LABEL_42;
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v54 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke;
        aBlock[3] = &unk_1E5623AD0;
        id v19 = v6;
        id v48 = v19;
        v49 = self;
        v20 = _Block_copy(aBlock);
        if (__CurrentTestName)
        {
          uint64_t v21 = [(id)__CurrentTestName rangeOfString:@"Transcript"];
          uint64_t v23 = v22;
          uint64_t v24 = [(id)__CurrentTestName rangeOfString:@"FSM"];
          if (v23)
          {
            if (v25)
            {
              objc_msgSend((id)__CurrentTestName, "substringWithRange:", v21 + v23, v24 - (v21 + v23));
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if ([(__CFString *)v26 containsString:@"Balloons"])
              {

                v26 = @"HappyBirthday";
              }
              v27 = [(CKFullScreenEffectManager *)self effectIdentifiers];
              v44[0] = MEMORY[0x1E4F143A8];
              v44[1] = 3221225472;
              v44[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_145;
              v44[3] = &unk_1E5623AF8;
              v45 = v26;
              id v46 = v19;
              v28 = v26;
              [v27 enumerateObjectsUsingBlock:v44];
            }
          }
        }
        v29 = [(CKFullScreenEffectManager *)self fullscreenEffectMap];
        v30 = [v19 message];
        v31 = [v30 expressiveSendStyleID];
        v32 = [v29 objectForKey:v31];
        BOOL v33 = v32 == 0;

        if (v33)
        {
          if ([MEMORY[0x1E4F6E730] supportsScreenEffects])
          {
            v39 = [MEMORY[0x1E4F962A8] sharedManager];
            v40 = [v19 message];
            v41 = [v40 plainBody];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_149;
            v42[3] = &unk_1E5623B20;
            v42[4] = self;
            id v43 = v20;
            [v39 responsesForMessage:v41 maximumResponses:1 forContext:0 withLanguage:v7 options:576 completionBlock:v42];
          }
        }
        else if (v20)
        {
          if (IMOSLoggingEnabled())
          {
            v34 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              v35 = [v19 message];
              v36 = [v35 expressiveSendStyleID];
              *(_DWORD *)buf = 138412290;
              v56 = v36;
              _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Starting effect for explicit identifier: %@", buf, 0xCu);
            }
          }
          v37 = [v19 message];
          v38 = [v37 expressiveSendStyleID];
          (*((void (**)(void *, void *, void))v20 + 2))(v20, v38, 0);
        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "-[CKFullScreenEffectManager startFullscreenEffectForChatItem:language:]";
      __int16 v57 = 2112;
      id v58 = (id)objc_opt_class();
      id v9 = v58;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s called with non-message part chat item (type %@). Please file a bug", buf, 0x16u);
    }
    goto LABEL_16;
  }
LABEL_42:
}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) isFromMe]) {
    BOOL v6 = a3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v7 trackEvent:*MEMORY[0x1E4F6D860]];
  }
  int v8 = [*(id *)(a1 + 40) effectForIdentifier:v5];
  objc_msgSend(v8, "setMessageOrientation:", objc_msgSend(*(id *)(a1 + 32), "isFromMe"));
  [v8 setTriggeredByResponseKit:a3];
  [v8 setDelegate:*(void *)(a1 + 40)];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) effectQueue];

    if (!v9)
    {
      __int16 v10 = *(void **)(a1 + 40);
      id v11 = [MEMORY[0x1E4F1CA48] array];
      [v10 setEffectQueue:v11];
    }
    int v12 = [*(id *)(a1 + 40) effectQueue];
    [v12 addObject:v8];

    [v8 setTriggeringChatItem:*(void *)(a1 + 32)];
    v13 = [*(id *)(a1 + 40) triggerUpdater];
    [v13 setNeedsUpdate];

    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [*(id *)(a1 + 40) triggerUpdater];
        int v16 = 138412546;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v15;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Starting effect: %@ updater: %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_145(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 rangeOfString:*(void *)(a1 + 32)] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v6 = [*(id *)(a1 + 40) message];
    [v6 setExpressiveSendStyleID:v7];

    *a4 = 1;
  }
}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_149(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_2;
  block[3] = &unk_1E5622BA8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v2 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v2;
      _os_log_impl(&dword_18EF18000, v1, OS_LOG_TYPE_INFO, "Starting effect for RK responses: %@", buf, 0xCu);
    }
  }
  if ([*(id *)(a1 + 32) count] == 1)
  {
    __int16 v18 = [*(id *)(a1 + 32) firstObject];
    id v3 = [v18 attributes];
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v3;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "RK attributes: %@", buf, 0xCu);
      }
    }
    id v5 = [v3 objectForKey:@"type"];
    int v6 = [v5 isEqualToString:@"moment"];

    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = [*(id *)(a1 + 40) fullscreenEffectMap];
      id obj = [v7 allValues];

      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            int v12 = [v11 infoDictionary];
            v13 = [v12 objectForKey:@"Triggers"];

            uint64_t v14 = [v3 objectForKey:@"subtype"];
            int v15 = [v13 containsObject:v14];

            if (v15)
            {
              uint64_t v16 = *(void *)(a1 + 48);
              if (v16)
              {
                id v17 = [v11 bundleIdentifier];
                (*(void (**)(uint64_t, void *, uint64_t))(v16 + 16))(v16, v17, 1);
              }
              goto LABEL_23;
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_23:
    }
  }
}

- (void)triggerNextEffect
{
  id v3 = [(CKFullScreenEffectManager *)self effectQueue];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(CKFullScreenEffectManager *)self effectQueue];
    id v7 = [v5 firstObject];

    int v6 = [(CKFullScreenEffectManager *)self effectDurationTimer];
    [v6 invalidate];

    [(CKFullScreenEffectManager *)self beginHoldingUpdatesForKey:@"CKFullscreenEffectManagerUpdatesPlaying"];
    [v7 prepareSoundEffect];
  }
}

- (void)fullScreenEffectDidPrepareSoundEffect:(id)a3
{
  id v12 = a3;
  [v12 duration];
  double v5 = v4;
  if (__CurrentTestName)
  {
    int v6 = [v12 identifier];
    +[CKFullScreenEffectManager idleDurationAfterEffectWithIdentifier:v6];
    double v8 = v7;

    double v5 = v5 - v8;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_stopFullscreenEffect selector:0 userInfo:0 repeats:v5];
  id v10 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v10 addTimer:v9 forMode:*MEMORY[0x1E4F1C4B0]];

  [(CKFullScreenEffectManager *)self setEffectDurationTimer:v9];
  [(CKFullScreenEffectManager *)self setCurrentEffect:v12];
  id v11 = [(CKFullScreenEffectManager *)self delegate];
  [v11 effectManager:self didStartEffect:v12];
}

- (void)stopFullscreenEffect
{
  id v3 = [(CKFullScreenEffectManager *)self effectDurationTimer];
  [v3 invalidate];

  [(CKFullScreenEffectManager *)self setEffectDurationTimer:0];
  id v7 = [(CKFullScreenEffectManager *)self currentEffect];
  if (v7)
  {
    [(CKFullScreenEffectManager *)self setCurrentEffect:0];
    [(CKFullScreenEffectManager *)self endHoldingUpdatesForKey:@"CKFullscreenEffectManagerUpdatesPlaying"];
    double v4 = [(CKFullScreenEffectManager *)self delegate];
    [v4 effectManager:self didStopEffect:v7];

    double v5 = [(CKFullScreenEffectManager *)self effectQueue];
    [v5 removeObject:v7];
  }
  int v6 = [(CKFullScreenEffectManager *)self triggerUpdater];
  [v6 setNeedsUpdate];
}

- (void)beginHoldingUpdatesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKFullScreenEffectManager *)self triggerUpdater];
  [v5 beginHoldingUpdatesForKey:v4];
}

- (void)endHoldingUpdatesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKFullScreenEffectManager *)self triggerUpdater];
  [v5 endHoldingUpdatesForKey:v4];
}

+ (double)delayBeforeEffectWithIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = 1.0;
  if (([v3 isEqualToString:@"com.apple.messages.effect.CKConfettiEffect"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"com.apple.messages.effect.CKHappyBirthdayEffect"]) {
      double v4 = 0.15;
    }
    else {
      double v4 = 0.0;
    }
  }

  return v4;
}

+ (double)idleDurationAfterEffectWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKConfettiEffect"])
  {
    double v4 = 0.4;
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKHappyBirthdayEffect"])
  {
    double v4 = 0.55;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (CKFullScreenEffect)currentEffect
{
  return self->_currentEffect;
}

- (void)setCurrentEffect:(id)a3
{
}

- (CKFullScreenEffectManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKFullScreenEffectManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)effectQueue
{
  return self->_effectQueue;
}

- (void)setEffectQueue:(id)a3
{
}

- (NSTimer)effectDurationTimer
{
  return self->_effectDurationTimer;
}

- (void)setEffectDurationTimer:(id)a3
{
}

- (CKScheduledUpdater)triggerUpdater
{
  return self->_triggerUpdater;
}

- (void)setTriggerUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerUpdater, 0);
  objc_storeStrong((id *)&self->_effectDurationTimer, 0);
  objc_storeStrong((id *)&self->_effectQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_currentEffect, 0);
}

@end