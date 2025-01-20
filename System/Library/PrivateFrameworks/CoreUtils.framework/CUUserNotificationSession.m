@interface CUUserNotificationSession
- (BOOL)_runInit:(id *)a3;
- (BOOL)_runRequestAddStart:(id *)a3;
- (BOOL)_runResponse:(id)a3 error:(id *)a4;
- (CUUserNotificationSession)init;
- (NSArray)bodyArguments;
- (NSArray)subtitleArguments;
- (NSArray)titleArguments;
- (NSDictionary)userInfo;
- (NSString)bodyKey;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)description;
- (NSString)header;
- (NSString)iconAppIdentifier;
- (NSString)iconName;
- (NSString)iconPath;
- (NSString)iconSystemName;
- (NSString)identifier;
- (NSString)label;
- (NSString)subtitleKey;
- (NSString)titleKey;
- (OS_dispatch_queue)dispatchQueue;
- (UNNotificationSound)sound;
- (double)timeoutSeconds;
- (id)actionHandler;
- (int)interruptionLevel;
- (int64_t)soundAlertType;
- (unsigned)flags;
- (void)_invalidate;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)_reportTimeout;
- (void)_run;
- (void)_runAuthorizeCheckStart;
- (void)_runAuthorizeRequestStart;
- (void)_updateActionCategories;
- (void)activate;
- (void)addActionWithIdentifier:(id)a3 title:(id)a4 flags:(unsigned int)a5 handler:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)removeActionWithIdentifier:(id)a3;
- (void)removeAllActions;
- (void)setActionHandler:(id)a3;
- (void)setBodyArguments:(id)a3;
- (void)setBodyKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHeader:(id)a3;
- (void)setIconAppIdentifier:(id)a3;
- (void)setIconName:(id)a3;
- (void)setIconPath:(id)a3;
- (void)setIconSystemName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionLevel:(int)a3;
- (void)setLabel:(id)a3;
- (void)setSound:(id)a3;
- (void)setSoundAlertType:(int64_t)a3;
- (void)setSubtitleArguments:(id)a3;
- (void)setSubtitleKey:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTitleArguments:(id)a3;
- (void)setTitleKey:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CUUserNotificationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_titleArguments, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_subtitleArguments, 0);
  objc_storeStrong((id *)&self->_subtitleKey, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_iconAppIdentifier, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bodyArguments, 0);
  objc_storeStrong((id *)&self->_bodyKey, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setTitleArguments:(id)a3
{
}

- (NSArray)titleArguments
{
  return self->_titleArguments;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setSubtitleArguments:(id)a3
{
}

- (NSArray)subtitleArguments
{
  return self->_subtitleArguments;
}

- (void)setSubtitleKey:(id)a3
{
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (void)setSoundAlertType:(int64_t)a3
{
  self->_soundAlertType = a3;
}

- (int64_t)soundAlertType
{
  return self->_soundAlertType;
}

- (void)setSound:(id)a3
{
}

- (UNNotificationSound)sound
{
  return self->_sound;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInterruptionLevel:(int)a3
{
  self->_interruptionLevel = a3;
}

- (int)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIconSystemName:(id)a3
{
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconPath:(id)a3
{
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconName:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconAppIdentifier:(id)a3
{
}

- (NSString)iconAppIdentifier
{
  return self->_iconAppIdentifier;
}

- (void)setHeader:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBodyArguments:(id)a3
{
}

- (NSArray)bodyArguments
{
  return self->_bodyArguments;
}

- (void)setBodyKey:(id)a3
{
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setActionHandler:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__CUUserNotificationSession_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E55BEEF0;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __105__CUUserNotificationSession_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v9 == *(void *)(v10 + 64))
  {
    id v12 = [*(id *)(a1 + 48) notification];
    id v13 = [v12 request];

    id v14 = [v13 content];
    v15 = [v14 categoryIdentifier];

    if ([v15 isEqual:*(void *)(*(void *)(a1 + 40) + 120)])
    {
      v20 = [v13 identifier];
      char v25 = [v20 isEqual:*(void *)(*(void *)(a1 + 40) + 176)];
      v26 = *(uint64_t **)(a1 + 40);
      if (v25)
      {
        uint64_t v27 = *(void *)(a1 + 48);
        id v37 = 0;
        [v26 _runResponse:v27 error:&v37];
        id v32 = v37;
        if (!v32) {
          goto LABEL_26;
        }
        v33 = *(int **)(*(void *)(a1 + 40) + 72);
        if (*v33 > 90) {
          goto LABEL_26;
        }
        if (*v33 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v33, 0x5Au)) {
            goto LABEL_26;
          }
          v33 = *(int **)(*(void *)(a1 + 40) + 72);
        }
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x5Au, (uint64_t)"### Response failed: %{error}\n", v28, v29, v30, v31, (uint64_t)v32);
LABEL_26:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        goto LABEL_27;
      }
      v36 = (int *)v26[9];
      if (*v36 <= 30)
      {
        if (*v36 == -1)
        {
          if (!_LogCategory_Initialize(v26[9], 0x1Eu)) {
            goto LABEL_24;
          }
          v36 = *(int **)(*(void *)(a1 + 40) + 72);
        }
        LogPrintF((uint64_t)v36, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x1Eu, (uint64_t)"Response wrong ID: %@ vs %@\n", v21, v22, v23, v24, (uint64_t)v20);
      }
LABEL_24:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_27:

      goto LABEL_28;
    }
    v34 = *(int **)(*(void *)(a1 + 40) + 72);
    if (*v34 <= 30)
    {
      if (*v34 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v34, 0x1Eu)) {
          goto LABEL_22;
        }
        v34 = *(int **)(*(void *)(a1 + 40) + 72);
      }
      LogPrintF((uint64_t)v34, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x1Eu, (uint64_t)"Response wrong category: %@ vs %@\n", v16, v17, v18, v19, (uint64_t)v15);
    }
LABEL_22:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_28:

    return;
  }
  v11 = *(int **)(v10 + 72);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu)) {
        goto LABEL_15;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      v11 = *(int **)(*(void *)(a1 + 40) + 72);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x1Eu, (uint64_t)"Response wrong center: %{ptr} vs %{ptr}\n", a5, a6, a7, a8, v9);
  }
LABEL_15:
  v35 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  v35();
}

- (BOOL)_runResponse:(id)a3 error:(id *)a4
{
  id v12 = [a3 actionIdentifier];
  if (v12)
  {
    uint64_t v19 = self->_requestIdentifier;
    if (v19)
    {
      v20 = getUNNotificationDefaultActionIdentifier[0]();
      int v21 = [v12 isEqual:v20];

      if (v21)
      {
        ucat = self->_ucat;
        if (ucat->var0 > 30) {
          goto LABEL_16;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          {
LABEL_16:
            v43 = (void (**)(void))_Block_copy(self->_actionHandler);
            v44 = v43;
            if (v43)
            {
              v45 = v43[2];
LABEL_21:
              v45();
              goto LABEL_22;
            }
            goto LABEL_22;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runResponse:error:]", 0x1Eu, (uint64_t)"Request action default: %@\n", v22, v23, v24, v25, (uint64_t)v19);
        goto LABEL_16;
      }
      uint64_t v27 = getUNNotificationDismissActionIdentifier[0]();
      int v28 = [v12 isEqual:v27];

      if (v28)
      {
        v33 = self->_ucat;
        if (v33->var0 > 30) {
          goto LABEL_19;
        }
        if (v33->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v33, 0x1Eu))
          {
LABEL_19:
            v46 = (void (**)(void))_Block_copy(self->_actionHandler);
            v44 = v46;
            if (v46)
            {
              v45 = v46[2];
              goto LABEL_21;
            }
LABEL_22:

LABEL_27:
            BOOL v49 = 1;
LABEL_28:

            goto LABEL_29;
          }
          v33 = self->_ucat;
        }
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUUserNotificationSession _runResponse:error:]", 0x1Eu, (uint64_t)"Request action dismiss: %@\n", v29, v30, v31, v32, (uint64_t)v19);
        goto LABEL_19;
      }
      uint64_t v34 = [(NSMutableDictionary *)self->_actions objectForKeyedSubscript:v12];
      if (v34)
      {
        v41 = (void *)v34;
        v42 = self->_ucat;
        if (v42->var0 <= 30)
        {
          if (v42->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v42, 0x1Eu)) {
              goto LABEL_24;
            }
            v42 = self->_ucat;
          }
          LogPrintF((uint64_t)v42, (uint64_t)"-[CUUserNotificationSession _runResponse:error:]", 0x1Eu, (uint64_t)"Request action: %@, %@\n", v37, v38, v39, v40, (uint64_t)v19);
        }
LABEL_24:
        uint64_t v47 = [v41 handler];
        v48 = (void *)v47;
        if (v47) {
          (*(void (**)(uint64_t))(v47 + 16))(v47);
        }

        goto LABEL_27;
      }
      if (a4)
      {
        NSErrorWithOSStatusF(4294960584, (uint64_t)"Request action unknown: '%@'", v35, v36, v37, v38, v39, v40, (uint64_t)v12);
        goto LABEL_34;
      }
    }
    else if (a4)
    {
      NSErrorWithOSStatusF(4294960588, (uint64_t)"No identifier", v13, v14, v15, v16, v17, v18, v51);
LABEL_34:
      BOOL v49 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    BOOL v49 = 0;
    goto LABEL_28;
  }
  if (a4)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No actionID", v6, v7, v8, v9, v10, v11, v51);
    BOOL v49 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v49 = 0;
  }
LABEL_29:

  return v49;
}

- (BOOL)_runRequestAddStart:(id *)a3
{
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepState = 1;
  id v12 = self->_bundleID;
  if (v12)
  {
    uint64_t v13 = [NSString stringWithFormat:@"/System/Library/UserNotifications/Bundles/%@.bundle"];
    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithPath:v13];
    if (![v14 _cfBundle])
    {
      if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No bundle found: '%@'", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
        BOOL v29 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v29 = 0;
      }
      goto LABEL_49;
    }
    id v21 = objc_alloc_init((Class)getUNMutableNotificationContentClass[0]());
    int v28 = self->_categoryID;
    BOOL v29 = v28 != 0;
    if (!v28)
    {
      if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No categoryID", v22, v23, v24, v25, v26, v27, (uint64_t)v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_48;
    }
    v78 = v13;
    [v21 setCategoryIdentifier:v28];
    uint64_t v30 = self->_header;
    if (v30) {
      [v21 setHeader:v30];
    }
    v75 = v30;
    uint64_t v31 = self->_iconAppIdentifier;
    if (v31)
    {
      uint64_t v32 = [(Class)getUNNotificationIconClass[0]() iconForApplicationIdentifier:v31];
      [v21 setIcon:v32];
    }
    v33 = self->_iconName;
    if (v33)
    {
      uint64_t v34 = [(Class)getUNNotificationIconClass[0]() iconNamed:v33];
      [v21 setIcon:v34];
    }
    v80 = v33;
    uint64_t v35 = self->_iconPath;
    if (v35)
    {
      uint64_t v36 = [(Class)getUNNotificationIconClass[0]() iconAtPath:v35];
      [v21 setIcon:v36];
    }
    uint64_t v37 = self->_iconSystemName;
    v73 = v37;
    if (v37)
    {
      uint64_t v38 = [(Class)getUNNotificationIconClass[0]() iconForSystemImageNamed:v37];
      [v21 setIcon:v38];
    }
    uint64_t v39 = self->_titleKey;
    v72 = v39;
    if (v39)
    {
      uint64_t v40 = [NSString localizedUserNotificationStringForKey:v39 arguments:self->_titleArguments];
      [v21 setTitle:v40];
    }
    BOOL v76 = v28 != 0;
    v41 = self->_subtitleKey;
    if (v41)
    {
      v42 = [NSString localizedUserNotificationStringForKey:v41 arguments:self->_subtitleArguments];
      [v21 setSubtitle:v42];
    }
    v43 = self->_bodyKey;
    if (v43)
    {
      v44 = [NSString localizedUserNotificationStringForKey:v43 arguments:self->_bodyArguments];
      [v21 setBody:v44];
    }
    v71 = v41;
    if ((self->_interruptionLevel - 1) <= 3) {
      objc_msgSend(v21, "setInterruptionLevel:");
    }
    v45 = v80;
    if (self->_flags) {
      [v21 setShouldAuthenticateDefaultAction:1];
    }
    [v21 setShouldBackgroundDefaultAction:1];
    unsigned int flags = self->_flags;
    if ((flags & 8) != 0)
    {
      [v21 setShouldSuppressDefaultAction:1];
      unsigned int flags = self->_flags;
      if ((flags & 0x10) == 0)
      {
LABEL_26:
        if ((flags & 0x40) == 0) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    else if ((flags & 0x10) == 0)
    {
      goto LABEL_26;
    }
    [v21 setShouldIgnoreDoNotDisturb:1];
    if ((self->_flags & 0x40) == 0)
    {
LABEL_28:
      if (self->_sound) {
        objc_msgSend(v21, "setSound:");
      }
      uint64_t v79 = (uint64_t)v28;
      int64_t soundAlertType = self->_soundAlertType;
      if (soundAlertType)
      {
        v48 = [(Class)getUNNotificationSoundClass[0]() soundWithAlertType:soundAlertType];
        [v21 setSound:v48];
      }
      v77 = v14;
      BOOL v49 = self->_userInfo;
      if (v49) {
        [v21 setUserInfo:v49];
      }
      v54 = self->_identifier;
      v74 = v31;
      if (!v54)
      {
        v55 = [MEMORY[0x1E4F29128] UUID];
        v54 = [v55 UUIDString];

        objc_storeStrong((id *)&self->_identifier, v54);
      }
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_43;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_43;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runRequestAddStart:]", 0x1Eu, (uint64_t)"Request add start: Category %@, ID %@\n", v50, v51, v52, v53, v79);
LABEL_43:
      objc_storeStrong((id *)&self->_requestIdentifier, v54);
      v57 = [(Class)getUNNotificationRequestClass[0]() requestWithIdentifier:v54 content:v21 trigger:0];
      v58 = self->_unCenter;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke;
      v82[3] = &unk_1E55BEFE8;
      v82[4] = self;
      v82[5] = v58;
      v59 = v54;
      v83 = v59;
      [(UNUserNotificationCenter *)v58 addNotificationRequest:v57 withCompletionHandler:v82];
      if (self->_timeoutSeconds > 0.0)
      {
        v70 = v35;
        v60 = v12;
        timer = self->_timer;
        if (timer)
        {
          v62 = timer;
          dispatch_source_cancel(v62);
          v63 = self->_timer;
          self->_timer = 0;
        }
        v64 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        v65 = self->_timer;
        self->_timer = v64;
        v66 = v64;

        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke_3;
        handler[3] = &unk_1E55BF170;
        handler[4] = v66;
        handler[5] = self;
        dispatch_source_set_event_handler(v66, handler);
        dispatch_time_t v67 = dispatch_time(0, (unint64_t)(self->_timeoutSeconds * 1000000000.0));
        dispatch_source_set_timer(v66, v67, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        dispatch_activate(v66);

        id v12 = v60;
        v45 = v80;
        uint64_t v35 = v70;
      }

      uint64_t v14 = v77;
      uint64_t v13 = v78;
      BOOL v29 = v76;
      int v28 = (NSString *)v79;
LABEL_48:

LABEL_49:
      goto LABEL_50;
    }
LABEL_27:
    [v21 setShouldShowSubordinateIcon:1];
    goto LABEL_28;
  }
  if (a3)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No bundleID", v6, v7, v8, v9, v10, v11, v69);
    BOOL v29 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_50:

  return v29;
}

void __49__CUUserNotificationSession__runRequestAddStart___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  int8x16_t v4 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v5 = *(void *)(a1 + 32);
  v8[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke_2;
  v8[3] = &unk_1E55BEEC8;
  uint64_t v6 = *(NSObject **)(v5 + 128);
  int8x16_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);
}

void *__49__CUUserNotificationSession__runRequestAddStart___block_invoke_3(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == (void *)result[7])
  {
    if (v3)
    {
      int8x16_t v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = 0;

      result = *(void **)(a1 + 40);
    }
    return (void *)[result _reportTimeout];
  }
  return result;
}

uint64_t __49__CUUserNotificationSession__runRequestAddStart___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (*(void *)(result + 32) != *(void *)(v8 + 64)) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(v9 + 40);
      if (!v11) {
        goto LABEL_6;
      }
      id v10 = *(int **)(v8 + 72);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUUserNotificationSession _runRequestAddStart:]_block_invoke_2", 0x1Eu, (uint64_t)"Request added: %@, %{error}\n", a5, a6, a7, a8, *(void *)(v9 + 48));
    uint64_t v8 = *(void *)(v9 + 40);
  }
LABEL_6:
  if (*(void *)(v9 + 56)) {
    int v12 = 3;
  }
  else {
    int v12 = 4;
  }
  *(_DWORD *)(v8 + 48) = v12;
  objc_storeStrong((id *)(*(void *)(v9 + 40) + 40), *(id *)(v9 + 56));
  uint64_t v13 = *(void **)(v9 + 40);
  return [v13 _run];
}

- (void)_runAuthorizeRequestStart
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runAuthorizeRequestStart]", 0x1Eu, (uint64_t)"Authorize request\n", v2, v3, v4, v5, v11[0]);
  }
LABEL_5:
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepState = 1;
  unCenter = self->_unCenter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = (uint64_t)__54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke;
  v11[3] = (uint64_t)&unk_1E55BEEA0;
  v11[4] = (uint64_t)self;
  v11[5] = (uint64_t)unCenter;
  id v10 = unCenter;
  [(UNUserNotificationCenter *)v10 requestAuthorizationWithOptions:6 completionHandler:v11];
}

void __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke(int8x16_t *a1, char a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  int8x16_t v6 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v7 = a1[2].i64[0];
  v10[2] = __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke_2;
  v10[3] = &unk_1E55BEE78;
  uint64_t v8 = *(NSObject **)(v7 + 128);
  int8x16_t v11 = v6;
  char v13 = a2;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);
}

uint64_t __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (*(void *)(result + 32) != *(void *)(v8 + 64)) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_4:
      int8x16_t v11 = "yes";
      if (!*(unsigned char *)(v9 + 56)) {
        int8x16_t v11 = "no";
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUUserNotificationSession _runAuthorizeRequestStart]_block_invoke_2", 0x1Eu, (uint64_t)"Authorize response: Granted %s, %{error}\n", a5, a6, a7, a8, (uint64_t)v11);
      uint64_t v8 = *(void *)(v9 + 40);
      goto LABEL_8;
    }
    BOOL v12 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v8 = *(void *)(v9 + 40);
    if (v12)
    {
      id v10 = *(int **)(v8 + 72);
      goto LABEL_4;
    }
  }
LABEL_8:
  if (*(unsigned char *)(v9 + 56)) {
    int v13 = 4;
  }
  else {
    int v13 = 3;
  }
  *(_DWORD *)(v8 + 48) = v13;
  objc_storeStrong((id *)(*(void *)(v9 + 40) + 40), *(id *)(v9 + 48));
  uint64_t v14 = *(void **)(v9 + 40);
  return [v14 _run];
}

- (void)_runAuthorizeCheckStart
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_5;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runAuthorizeCheckStart]", 0x1Eu, (uint64_t)"Authorization status request\n", v2, v3, v4, v5, v11[0]);
  }
LABEL_5:
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepState = 1;
  unCenter = self->_unCenter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = (uint64_t)__52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke;
  v11[3] = (uint64_t)&unk_1E55BEE50;
  v11[4] = (uint64_t)self;
  v11[5] = (uint64_t)unCenter;
  id v10 = unCenter;
  [(UNUserNotificationCenter *)v10 getNotificationSettingsWithCompletionHandler:v11];
}

void __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v3 = [a2 authorizationStatus];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  int8x16_t v4 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v5 = a1[2].i64[0];
  block[2] = __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke_2;
  block[3] = &unk_1E55BEE28;
  int8x16_t v6 = *(NSObject **)(v5 + 128);
  int8x16_t v8 = v4;
  uint64_t v9 = v3;
  dispatch_async(v6, block);
}

uint64_t __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (*(void *)(result + 32) != *(void *)(v8 + 64)) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu)) {
        goto LABEL_10;
      }
      id v10 = *(int **)(*(void *)(v9 + 40) + 72);
    }
    unint64_t v11 = *(void *)(v9 + 48);
    if (v11 > 3) {
      BOOL v12 = "?";
    }
    else {
      BOOL v12 = off_1E55BEF98[v11];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUUserNotificationSession _runAuthorizeCheckStart]_block_invoke_2", 0x1Eu, (uint64_t)"Authorization status response: %s\n", a5, a6, a7, a8, (uint64_t)v12);
  }
LABEL_10:
  uint64_t v13 = *(void *)(v9 + 48);
  if ((unint64_t)(v13 - 2) < 2)
  {
    uint64_t v14 = *(void *)(v9 + 40);
    int v15 = 2;
  }
  else
  {
    if (v13 == 1)
    {
      *(_DWORD *)(*(void *)(v9 + 40) + 48) = 3;
      uint64_t v17 = NSErrorWithOSStatusF(4294896150, (uint64_t)"Authorization status denied", a3, a4, a5, a6, a7, a8, v20);
      uint64_t v18 = *(void *)(v9 + 40);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      goto LABEL_15;
    }
    uint64_t v14 = *(void *)(v9 + 40);
    int v15 = 4;
  }
  *(_DWORD *)(v14 + 48) = v15;
LABEL_15:
  uint64_t v16 = *(void **)(v9 + 40);
  return [v16 _run];
}

- (BOOL)_runInit:(id *)a3
{
  unint64_t v11 = self->_bundleID;
  if (v11)
  {
    uint64_t v18 = self->_categoryID;
    if (v18)
    {
      uint64_t v25 = (void *)[objc_alloc((Class)getUNUserNotificationCenterClass[0]()) initWithBundleIdentifier:v11];
      BOOL v26 = v25 != 0;
      if (v25)
      {
        objc_storeStrong((id *)&self->_unCenter, v25);
        [v25 setDelegate:self];
        [v25 setWantsNotificationResponsesDelivered];
        [(CUUserNotificationSession *)self _updateActionCategories];
      }
      else if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No UN center", v19, v20, v21, v22, v23, v24, v28);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a3)
    {
      NSErrorWithOSStatusF(4294960591, (uint64_t)"No categoryID", v12, v13, v14, v15, v16, v17, v28);
      BOOL v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else if (a3)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No bundleID", v5, v6, v7, v8, v9, v10, v28);
    BOOL v26 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (void)_run
{
  while (2)
  {
    if (!self->_invalidateCalled)
    {
      int state = self->_state;
      switch(state)
      {
        case 0:
          id v17 = 0;
          [(CUUserNotificationSession *)self _runInit:&v17];
          id v9 = v17;
          if (v9) {
            goto LABEL_26;
          }
          self->_int state = 10;
          goto LABEL_27;
        case 10:
          [(CUUserNotificationSession *)self _runAuthorizeCheckStart];
          goto LABEL_23;
        case 11:
          if (self->_stepError) {
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          }
          int stepState = self->_stepState;
          if (stepState == 1) {
            goto LABEL_28;
          }
          if (stepState != 2) {
            goto LABEL_23;
          }
          self->_int state = 14;
          goto LABEL_28;
        case 12:
          [(CUUserNotificationSession *)self _runAuthorizeRequestStart];
          goto LABEL_23;
        case 13:
          stepError = self->_stepError;
          if (stepError) {
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          }
          int v12 = self->_stepState;
          if (v12 == 1) {
            goto LABEL_28;
          }
          if (v12 == 4) {
            goto LABEL_23;
          }
          uint64_t v13 = 4294896150;
          uint64_t v14 = "Authorize request failed";
          goto LABEL_25;
        case 14:
          id v16 = 0;
          [(CUUserNotificationSession *)self _runRequestAddStart:&v16];
          id v9 = v16;
          if (v9) {
            goto LABEL_26;
          }
          ++self->_state;
          goto LABEL_27;
        case 15:
          stepError = self->_stepError;
          if (stepError) {
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          }
          int v15 = self->_stepState;
          if (v15 == 1) {
            goto LABEL_28;
          }
          if (v15 == 4)
          {
LABEL_23:
            ++self->_state;
          }
          else
          {
            uint64_t v13 = 4294960596;
            uint64_t v14 = "Request add failed";
LABEL_25:
            NSErrorWithOSStatusF(v13, (uint64_t)v14, (uint64_t)stepError, v2, v3, v4, v5, v6, (uint64_t)v16);
            id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
            [(CUUserNotificationSession *)self _reportError:v9];
LABEL_27:
          }
LABEL_28:
          if (self->_state == state) {
            return;
          }
          continue;
        default:
          goto LABEL_28;
      }
    }
    break;
  }
}

- (void)_reportTimeout
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _reportTimeout]", 0x1Eu, (uint64_t)"Timeout\n", v2, v3, v4, v5, v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v8 = _Block_copy(self->_actionHandler);
  id v9 = v8;
  if (v8) {
    (*((void (**)(void *, uint64_t, void))v8 + 2))(v8, 5, 0);
  }

  [(CUUserNotificationSession *)self _invalidate];
}

- (void)_reportError:(id)a3
{
  id v13 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    uint64_t state = self->_state;
    if (state > 0x10) {
      uint64_t v10 = "?";
    }
    else {
      uint64_t v10 = off_1E55BEF10[state];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _reportError:]", 0x5Au, (uint64_t)"### Failed: %s, %{error}\n", v4, v5, v6, v7, (uint64_t)v10);
  }
LABEL_9:
  self->_uint64_t state = 3;
  unint64_t v11 = _Block_copy(self->_actionHandler);
  int v12 = v11;
  if (v11) {
    (*((void (**)(void *, uint64_t, id))v11 + 2))(v11, 4, v13);
  }
}

- (void)_updateActionCategories
{
  if (self->_actionsChanged)
  {
    categoryID = self->_categoryID;
    if (categoryID)
    {
      uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
      uint64_t v5 = categoryID;
      id v6 = objc_alloc_init(v4);
      actions = self->_actions;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__CUUserNotificationSession__updateActionCategories__block_invoke;
      v10[3] = &unk_1E55BEE00;
      void v10[4] = v6;
      [(NSMutableDictionary *)actions enumerateKeysAndObjectsUsingBlock:v10];
      id v9 = [(Class)getUNNotificationCategoryClass[0]() categoryWithIdentifier:v5 actions:v6 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:1];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v9 count:1];
      [(UNUserNotificationCenter *)self->_unCenter setNotificationCategories:v8];
      self->_actionsChanged = 0;
    }
  }
}

void __52__CUUserNotificationSession__updateActionCategories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 action];
  [v3 addObject:v4];
}

- (void)removeAllActions
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CUUserNotificationSession_removeAllActions__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void *__45__CUUserNotificationSession_removeAllActions__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(int **)(v2 + 72);
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_3:
      uint64_t v4 = [*(id *)(v2 + 8) count];
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUUserNotificationSession removeAllActions]_block_invoke", 0x1Eu, (uint64_t)"Remove all actions: %d total\n", v5, v6, v7, v8, v4);
      uint64_t v2 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v9 = _LogCategory_Initialize(*(void *)(v2 + 72), 0x1Eu);
    uint64_t v2 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v3 = *(int **)(v2 + 72);
      goto LABEL_3;
    }
  }
LABEL_5:
  [*(id *)(v2 + 8) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  result = *(void **)(a1 + 32);
  if (result[8])
  {
    return (void *)[result _updateActionCategories];
  }
  return result;
}

- (void)removeActionWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CUUserNotificationSession_removeActionWithIdentifier___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __56__CUUserNotificationSession_removeActionWithIdentifier___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (int *)v2[9];
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_3:
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [v12 action];
      unint64_t v11 = [v5 title];
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUUserNotificationSession removeActionWithIdentifier:]_block_invoke", 0x1Eu, (uint64_t)"Remove action: %@, '%@'\n", v6, v7, v8, v9, v4);

      uint64_t v2 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v10 = _LogCategory_Initialize(v2[9], 0x1Eu);
    uint64_t v2 = *(void **)(a1 + 32);
    if (v10)
    {
      uint64_t v3 = (int *)v2[9];
      goto LABEL_3;
    }
  }
LABEL_5:
  if (v2[8]) {
    [v2 _updateActionCategories];
  }
}

- (void)addActionWithIdentifier:(id)a3 title:(id)a4 flags:(unsigned int)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(Class)getUNNotificationActionClass[0]() actionWithIdentifier:v10 title:v11 options:a5 & 7];
  dispatchQueue = self->_dispatchQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__CUUserNotificationSession_addActionWithIdentifier_title_flags_handler___block_invoke;
  v19[3] = &unk_1E55BEDD8;
  id v23 = v11;
  id v24 = v12;
  id v20 = v13;
  uint64_t v21 = self;
  id v22 = v10;
  unsigned int v25 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(dispatchQueue, v19);
}

void __73__CUUserNotificationSession_addActionWithIdentifier_title_flags_handler___block_invoke(void *a1)
{
  id v13 = objc_alloc_init(CUUserNotificationCustomAction);
  [(CUUserNotificationCustomAction *)v13 setAction:a1[4]];
  [(CUUserNotificationCustomAction *)v13 setHandler:a1[8]];
  uint64_t v2 = *(void **)(a1[5] + 8);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v2 = *(void **)(a1[5] + 8);
  }
  [v2 setObject:v13 forKeyedSubscript:a1[6]];
  *(unsigned char *)(a1[5] + 16) = 1;
  id v10 = (void *)a1[5];
  if (v10[8])
  {
    id v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        id v10 = (void *)a1[5];
        if (!v12) {
          goto LABEL_8;
        }
        id v11 = (int *)v10[9];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]_block_invoke", 0x1Eu, (uint64_t)"Add action: %@, '%@', %#{flags}\n", v6, v7, v8, v9, a1[6]);
      id v10 = (void *)a1[5];
    }
LABEL_8:
    [v10 _updateActionCategories];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v3 = _Block_copy(self->_actionHandler);
    uint64_t v4 = v3;
    if (v3) {
      (*((void (**)(void *, uint64_t, void))v3 + 2))(v3, 3, 0);
    }

    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v6, v7, v8, v9, v12);
    }
  }
}

- (void)_invalidate
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = self->_unCenter;
  uint64_t v8 = self->_requestIdentifier;
  if (v8)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _invalidate]", 0x1Eu, (uint64_t)"Removing request: %@\n", v4, v5, v6, v7, (uint64_t)v8);
    }
LABEL_6:
    v16[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(UNUserNotificationCenter *)v3 removePendingNotificationRequestsWithIdentifiers:v10];
    [(UNUserNotificationCenter *)v3 removeDeliveredNotificationsWithIdentifiers:v10];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = 0;
  }
  timer = self->_timer;
  if (timer)
  {
    id v13 = timer;
    dispatch_source_cancel(v13);
    uint64_t v14 = self->_timer;
    self->_timer = 0;
  }
  [(UNUserNotificationCenter *)self->_unCenter setDelegate:0];
  unCenter = self->_unCenter;
  self->_unCenter = 0;

  [(CUUserNotificationSession *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CUUserNotificationSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__CUUserNotificationSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 18)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 18) = 1;
  id v10 = *(uint64_t **)(result + 32);
  id v11 = (int *)v10[9];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize(v10[9], 0x1Eu);
      id v10 = *(uint64_t **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      id v11 = (int *)v10[9];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate: BundleID %@, Category %@\n", a5, a6, a7, a8, v10[14]);
    id v10 = *(uint64_t **)(v9 + 32);
  }
LABEL_6:
  return [v10 _invalidate];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CUUserNotificationSession_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__CUUserNotificationSession_activate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 17)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 17) = 1;
  id v10 = *(uint64_t **)(result + 32);
  id v11 = (int *)v10[9];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize(v10[9], 0x1Eu);
      id v10 = *(uint64_t **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      id v11 = (int *)v10[9];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate: BundleID %@, Category %@\n", a5, a6, a7, a8, v10[14]);
    id v10 = *(uint64_t **)(v9 + 32);
  }
LABEL_6:
  return [v10 _run];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CDB28;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (NSString)description
{
  return (NSString *)NSPrintF((uint64_t)"CUUserNotificationSession: Category %@, ID %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_categoryID);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUUserNotificationSession;
  [(CUUserNotificationSession *)&v4 dealloc];
}

- (CUUserNotificationSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUUserNotificationSession;
  uint64_t v2 = [(CUUserNotificationSession *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUUserNotificationSession;
    objc_super v4 = v3;
  }

  return v3;
}

@end