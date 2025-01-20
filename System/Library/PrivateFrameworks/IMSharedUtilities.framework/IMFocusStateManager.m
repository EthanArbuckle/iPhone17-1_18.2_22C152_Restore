@interface IMFocusStateManager
+ (BOOL)_conversationWithHandles:(id)a3 isAllowedInFocusWithExclusiveSenderConfiguration:(id)a4;
+ (BOOL)_conversationWithHandles:(id)a3 isAllowedInFocusWithInclusiveSenderConfiguration:(id)a4;
+ (BOOL)_shouldDisplayConversationWithHandles:(id)a3 withFocusConfiguration:(id)a4;
+ (BOOL)focusConfiguration:(id)a3 matchesConversationWithHandleStrings:(id)a4;
+ (BOOL)focusConfiguration:(id)a3 matchesConversationWithHandles:(id)a4;
+ (IMFocusStateManager)sharedManager;
+ (id)_dndContactHandleForAddress:(id)a3;
- (BOOL)activeFocusModeMatchesConversationWithHandleStrings:(id)a3;
- (BOOL)activeFocusModeMatchesConversationWithHandles:(id)a3;
- (BOOL)deviceSupportsFocusFiltering;
- (BOOL)focusFilterActionIsEnabled;
- (BOOL)hasActiveFocusMode;
- (BOOL)registeredAsStateUpdateListener;
- (BOOL)shouldDisplayFocusFilterBanner;
- (BOOL)shouldFilterConversationsByFocus;
- (BOOL)userSwitchForFocusFilteringIsEnabled;
- (DNDState)dndState;
- (DNDStateService)dndStateService;
- (IMFocusStateManager)init;
- (NSHashTable)delegates;
- (id)activeFocusName;
- (id)activeFocusSymbolName;
- (void)_fetchInitialDNDStateSynchronously:(BOOL)a3;
- (void)_notifyDelegatesOfDNDStateChange;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setDndState:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setFocusFilterActionIsEnabled:(BOOL)a3;
- (void)setRegisteredAsStateUpdateListener:(BOOL)a3;
- (void)setUserSwitchForFocusFilteringIsEnabled:(BOOL)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation IMFocusStateManager

- (BOOL)shouldFilterConversationsByFocus
{
  int v3 = [(IMFocusStateManager *)self shouldDisplayFocusFilterBanner];
  if (v3)
  {
    LOBYTE(v3) = MEMORY[0x1F4181798](self, sel_userSwitchForFocusFilteringIsEnabled);
  }
  return v3;
}

- (BOOL)shouldDisplayFocusFilterBanner
{
  if (![(IMFocusStateManager *)self deviceSupportsFocusFiltering]
    || ![(IMFocusStateManager *)self focusFilterActionIsEnabled])
  {
    return 0;
  }

  return MEMORY[0x1F4181798](self, sel_hasActiveFocusMode);
}

- (BOOL)focusFilterActionIsEnabled
{
  return self->_focusFilterActionIsEnabled;
}

- (BOOL)deviceSupportsFocusFiltering
{
  return 1;
}

+ (IMFocusStateManager)sharedManager
{
  if (qword_1EB4A61E0 != -1) {
    dispatch_once(&qword_1EB4A61E0, &unk_1EF2BF440);
  }
  v2 = (void *)qword_1EB4A6110;

  return (IMFocusStateManager *)v2;
}

- (void)_notifyDelegatesOfDNDStateChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_delegates allObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v12;
    *(void *)&long long v4 = 138412290;
    long long v10 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        if (IMOSLoggingEnabled())
        {
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v10;
            v16 = v7;
            _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Notifying %@ of dnd state change", buf, 0xCu);
          }
        }
        objc_msgSend(v7, "focusStateDidChange", v10, (void)v11);
        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v3);
  }

  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Finished notifying all delegates of dnd state change", buf, 2u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"conversationListFocusFilterActionEnabled"])
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Received KVO notification for conversationListFocusFilterActionEnabled", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0788D44;
    block[3] = &unk_1E5A11D40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IMFocusStateManager;
    [(IMFocusStateManager *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)addDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Adding IMFocusStateManagerDelegate: %@", buf, 0xCu);
    }
  }
  [(NSHashTable *)self->_delegates addObject:v4];
  if (![(IMFocusStateManager *)self registeredAsStateUpdateListener])
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    uint64_t v6 = [(IMFocusStateManager *)self dndStateService];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A0790D7C;
    v12[3] = &unk_1E5A11F18;
    objc_copyWeak(&v13, (id *)buf);
    [v6 addStateUpdateListener:self withCompletionHandler:v12];

    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Registering for NSUserDefaults KVO.", v11, 2u);
      }
    }
    v8 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    [v8 addObserver:self forKeyPath:@"conversationListFocusFilterActionEnabled" options:5 context:0];

    v9 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    uint64_t v10 = [v9 conversationListFocusFilterActionEnabled];

    [(IMFocusStateManager *)self _fetchInitialDNDStateSynchronously:v10];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setFocusFilterActionIsEnabled:(BOOL)a3
{
  if (self->_focusFilterActionIsEnabled != a3)
  {
    self->_focusFilterActionIsEnabled = a3;
    [(IMFocusStateManager *)self _notifyDelegatesOfDNDStateChange];
  }
}

- (BOOL)registeredAsStateUpdateListener
{
  return self->_registeredAsStateUpdateListener;
}

- (void)setRegisteredAsStateUpdateListener:(BOOL)a3
{
  self->_registeredAsStateUpdateListener = a3;
}

- (void)setDndState:(id)a3
{
}

- (IMFocusStateManager)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)IMFocusStateManager;
  id v2 = [(IMFocusStateManager *)&v7 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v9 = v2;
        _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "IMFocusStateManager init: %p", buf, 0xCu);
      }
    }
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v4;

    v2->_userSwitchForFocusFilteringIsEnabled = 1;
  }
  return v2;
}

- (DNDStateService)dndStateService
{
  dndStateService = self->_dndStateService;
  if (!dndStateService)
  {
    objc_msgSend((id)MEMORY[0x1A6227910](@"DNDStateService", @"DoNotDisturb"), "serviceForClientIdentifier:", @"com.apple.messages");
    uint64_t v4 = (DNDStateService *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_dndStateService;
    self->_dndStateService = v4;

    dndStateService = self->_dndStateService;
  }

  return dndStateService;
}

- (void)_fetchInitialDNDStateSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A078FE58;
  aBlock[3] = &unk_1E5A11F40;
  objc_copyWeak(&v18, &location);
  uint64_t v5 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Fetching DND state synchronously", buf, 2u);
      }
    }
    objc_super v7 = [(IMFocusStateManager *)self dndStateService];
    id v15 = 0;
    v8 = [v7 queryCurrentStateWithError:&v15];
    v9 = (void (**)(void *, void *, id))v15;

    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "DND state synchronously received", buf, 2u);
      }
    }
    v5[2](v5, v8, v9);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Fetching DND state asynchronously", buf, 2u);
      }
    }
    id v12 = [(IMFocusStateManager *)self dndStateService];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A078FD14;
    v13[3] = &unk_1E5A11F90;
    objc_super v14 = v5;
    [v12 queryCurrentStateWithCompletionHandler:v13];

    v9 = v14;
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = self;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "IMFocusStateManager dealloc: %p", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IMFocusStateManager;
  [(IMFocusStateManager *)&v4 dealloc];
}

- (void)setUserSwitchForFocusFilteringIsEnabled:(BOOL)a3
{
  if (self->_userSwitchForFocusFilteringIsEnabled != a3)
  {
    self->_userSwitchForFocusFilteringIsEnabled = a3;
    [(IMFocusStateManager *)self _notifyDelegatesOfDNDStateChange];
  }
}

- (id)activeFocusName
{
  id v2 = [(IMFocusStateManager *)self dndState];
  BOOL v3 = [v2 activeModeConfiguration];
  objc_super v4 = [v3 mode];
  uint64_t v5 = [v4 name];

  return v5;
}

- (id)activeFocusSymbolName
{
  id v2 = [(IMFocusStateManager *)self dndState];
  BOOL v3 = [v2 activeModeConfiguration];
  objc_super v4 = [v3 mode];
  uint64_t v5 = [v4 symbolImageName];

  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"moon.fill";
  }
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)activeFocusModeMatchesConversationWithHandleStrings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMFocusStateManager *)self dndState];
  uint64_t v6 = [v5 activeModeConfiguration];
  uint64_t v7 = [v6 configuration];

  LOBYTE(v5) = +[IMFocusStateManager focusConfiguration:v7 matchesConversationWithHandleStrings:v4];
  return (char)v5;
}

- (BOOL)activeFocusModeMatchesConversationWithHandles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMFocusStateManager *)self dndState];
  uint64_t v6 = [v5 activeModeConfiguration];
  uint64_t v7 = [v6 configuration];

  LOBYTE(v5) = +[IMFocusStateManager focusConfiguration:v7 matchesConversationWithHandles:v4];
  return (char)v5;
}

+ (BOOL)focusConfiguration:(id)a3 matchesConversationWithHandleStrings:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = objc_msgSend(a1, "_dndContactHandleForAddress:", *(void *)(*((void *)&v18 + 1) + 8 * v13), (void)v18);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = (void *)[v8 copy];
  char v16 = [a1 focusConfiguration:v6 matchesConversationWithHandles:v15];

  return v16;
}

+ (BOOL)focusConfiguration:(id)a3 matchesConversationWithHandles:(id)a4
{
  return MEMORY[0x1F4181798](a1, sel__shouldDisplayConversationWithHandles_withFocusConfiguration_);
}

- (void)removeDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Removing IMFocusStateManagerDelegate: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSHashTable *)self->_delegates removeObject:v4];
}

- (BOOL)hasActiveFocusMode
{
  id v2 = [(IMFocusStateManager *)self dndState];
  BOOL v3 = [v2 activeModeConfiguration];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Received dnd state update: %@", buf, 0xCu);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A07ED048;
  v10[3] = &unk_1E5A10080;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

+ (BOOL)_shouldDisplayConversationWithHandles:(id)a3 withFocusConfiguration:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    uint64_t v8 = [v7 senderConfiguration];
    uint64_t v9 = [v7 senderConfigurationType];

    if (v9 == 2)
    {
      BOOL v11 = 1;
    }
    else
    {
      if (v9 == 1)
      {
        char v10 = [a1 _conversationWithHandles:v6 isAllowedInFocusWithInclusiveSenderConfiguration:v8];
      }
      else
      {
        if (v9)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
        char v10 = [a1 _conversationWithHandles:v6 isAllowedInFocusWithExclusiveSenderConfiguration:v8];
      }
      BOOL v11 = v10;
    }
LABEL_11:

    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)_conversationWithHandles:(id)a3 isAllowedInFocusWithExclusiveSenderConfiguration:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 allowedContacts];
  if ([v6 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([*(id *)(*((void *)&v21 + 1) + 8 * j) matchesContactHandle:v12])
                {

                  BOOL v18 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = v20;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
        BOOL v18 = 0;
      }
      while (v9);
    }
    else
    {
      BOOL v18 = 0;
    }
LABEL_21:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)_conversationWithHandles:(id)a3 isAllowedInFocusWithInclusiveSenderConfiguration:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 deniedContacts];
  if ([v6 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([*(id *)(*((void *)&v21 + 1) + 8 * j) matchesContactHandle:v12])
                {

                  BOOL v18 = 0;
                  goto LABEL_21;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = v20;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
        BOOL v18 = 1;
      }
      while (v9);
    }
    else
    {
      BOOL v18 = 1;
    }
LABEL_21:
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

+ (id)_dndContactHandleForAddress:(id)a3
{
  id v3 = a3;
  if ([v3 _appearsToBeEmail]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = objc_alloc_init((Class)MEMORY[0x1A6227910](@"DNDMutableContactHandle", @"DoNotDisturb"));
  [v5 setValue:v3];

  [v5 setType:v4];
  id v6 = (void *)[v5 copy];

  return v6;
}

- (BOOL)userSwitchForFocusFilteringIsEnabled
{
  return self->_userSwitchForFocusFilteringIsEnabled;
}

- (void)setDndStateService:(id)a3
{
}

- (DNDState)dndState
{
  return self->_dndState;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_dndState, 0);

  objc_storeStrong((id *)&self->_dndStateService, 0);
}

@end