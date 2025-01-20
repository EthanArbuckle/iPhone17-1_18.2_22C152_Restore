@interface CLISetupInteractor
- (CLISetupInteractor)init;
- (HDSSetupSession)setupSession;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (unint64_t)peerFeatureFlags;
- (unint64_t)testFlags;
- (void)_cleanupSession;
- (void)dealloc;
- (void)invalidate;
- (void)sessionHandleProgress:(unsigned int)a3 inInfo:(id)a4 session:(id)a5;
- (void)setCLIPromptsForStates;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPeerFeatureFlags:(unint64_t)a3;
- (void)setSetupSession:(id)a3;
- (void)setSetupUserInputConfig:(id)a3;
- (void)setTestFlags:(unint64_t)a3;
@end

@implementation CLISetupInteractor

- (CLISetupInteractor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLISetupInteractor;
  v2 = [(CLISetupInteractor *)&v7 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(CLISetupInteractor *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CLISetupInteractor;
  [(CLISetupInteractor *)&v3 dealloc];
}

- (void)_cleanupSession
{
  [(HDSSetupSession *)self->_setupSession invalidate];
  setupSession = self->_setupSession;
  self->_setupSession = 0;
}

- (void)setSetupUserInputConfig:(id)a3
{
  v4 = (char *)a3;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v42 = v4;
    LogPrintF();
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  BOOL v6 = Int64 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    uint64_t v7 = Int64;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v8 = "no";
      if (v7) {
        v8 = "yes";
      }
      v42 = v8;
      LogPrintF();
    }
  }
  self->_recognizeVoiceEnabled = v6;
  uint64_t v9 = CFDictionaryGetInt64();
  BOOL v10 = v9 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    uint64_t v11 = v9;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v12 = "no";
      if (v11) {
        v12 = "yes";
      }
      v42 = v12;
      LogPrintF();
    }
  }
  self->_locationEnabled = v10;
  uint64_t v13 = CFDictionaryGetInt64();
  BOOL v14 = v13 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    uint64_t v15 = v13;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v16 = "no";
      if (v15) {
        v16 = "yes";
      }
      v42 = v16;
      LogPrintF();
    }
  }
  self->_personalRequestsEnabled = v14;
  uint64_t v17 = CFDictionaryGetInt64();
  BOOL v18 = v17 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    uint64_t v19 = v17;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v20 = "no";
      if (v19) {
        v20 = "yes";
      }
      v42 = v20;
      LogPrintF();
    }
  }
  self->_siriEnabled = v18;
  uint64_t v21 = CFDictionaryGetInt64();
  BOOL v22 = v21 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    uint64_t v23 = v21;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v24 = "no";
      if (v23) {
        v24 = "yes";
      }
      v42 = v24;
      LogPrintF();
    }
  }
  self->_activeDeviceEnabled = v22;
  uint64_t v25 = CFDictionaryGetInt64();
  BOOL v26 = v25 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    uint64_t v27 = v25;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v28 = "no";
      if (v27) {
        v28 = "yes";
      }
      v42 = v28;
      LogPrintF();
    }
  }
  self->_odeonEnabled = v26;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v29 = (char *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v42 = v29;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_homeName, v29);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v30 = (char *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v42 = v30;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_roomName, v30);
  CFStringGetTypeID();
  v31 = CFDictionaryGetTypedValue();

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[HDSSetupSession forceCLIPassCode:](self->_setupSession, "forceCLIPassCode:", v31, v31);
  }
  else
  {
    -[HDSSetupSession forceCLIPassCode:](self->_setupSession, "forceCLIPassCode:", v31, v42);
  }
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    uint64_t v43 = Int64Ranged;
    LogPrintF();
  }
  self->_stereoRole = Int64Ranged;
  char v33 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    uint64_t v43 = v33;
    LogPrintF();
  }
  self->_stereoPairIndex = v33;
  CFStringGetTypeID();
  v34 = CFDictionaryGetTypedValue();

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HDSSetupSession setAppleIDPassword:](self->_setupSession, "setAppleIDPassword:", v34, v43);
  BOOL v35 = CFDictionaryGetInt64() != 0;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_soundRecognitionEnabled = v35;
  char v36 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homeIndex = v36;
  char v37 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_roomIndex = v37;
  char v38 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_suggestedRoomIndex = v38;
  unsigned int v39 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_delayTime = v39;
  BOOL v40 = CFDictionaryGetInt64() != 0;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_psgEnabled = v40;
  BOOL v41 = CFDictionaryGetInt64() != 0;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_siriForICloudEnabled = v41;
}

- (void)setCLIPromptsForStates
{
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke;
  v16[3] = &unk_26503F608;
  v16[4] = self;
  [(HDSSetupSession *)self->_setupSession setProgressHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_2;
  v15[3] = &unk_26503F658;
  v15[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForHomeHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_4;
  v14[3] = &unk_26503F680;
  v14[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForRoomHandlerDetailed:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_5;
  v13[3] = &unk_26503F6A8;
  v13[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForHomeiCloudHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_6;
  v12[3] = &unk_26503F6A8;
  v12[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForiTunesSignInHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_7;
  v11[3] = &unk_26503F6A8;
  v11[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForLocationEnableHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_8;
  v10[3] = &unk_26503F6A8;
  v10[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForPersonalRequestsHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_9;
  v9[3] = &unk_26503F6A8;
  v9[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForSiriEnableHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_10;
  v8[3] = &unk_26503F6A8;
  v8[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForTermsHandler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_11;
  v7[3] = &unk_26503F6A8;
  v7[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForTVAudioHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_12;
  v6[3] = &unk_26503F6A8;
  v6[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForStereoRoleHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_13;
  v5[3] = &unk_26503F6A8;
  v5[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForSetupPSGHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_14;
  v4[3] = &unk_26503F6D0;
  v4[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForStereoMultipleHandler:v4];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_15;
  v3[3] = &unk_26503F6A8;
  v3[4] = self;
  [(HDSSetupSession *)self->_setupSession setPromptForSoundRecognitionHandler:v3];
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = *(void **)(a1 + 32);
  if (v5[12]) {
    objc_msgSend(v5, "sessionHandleProgress:inInfo:session:", a2, v7);
  }
  return MEMORY[0x270F9A828]();
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = [v5 count];
    LogPrintF();
  }
  BOOL v6 = objc_msgSend(v5, "mutableCopy", v27);
  id v7 = *(id *)(*(void *)(a1 + 32) + 96);
  if (!v7) {
    goto LABEL_48;
  }
  NSLog(&cfstr_Cmdhomedevices.isa, v6);
  if (![v6 count])
  {
    uint64_t v10 = [v7 selectedHome];
LABEL_11:
    uint64_t v9 = (void *)v10;
    goto LABEL_12;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 24) length])
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_3;
    v42[3] = &unk_26503F630;
    v42[4] = *(void *)(a1 + 32);
    uint64_t v8 = [v6 indexOfObjectPassingTest:v42];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [v6 objectAtIndex:v8];
      if (gLogCategory_CLISetupInteractor <= 30
        && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
      {
        v28 = [v9 name];
        LogPrintF();
      }
    }
LABEL_12:
    if (v9) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (*(_DWORD *)(*(void *)(a1 + 32) + 40) != -1
    && [v6 count] > (unint64_t)*(int *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v10 = objc_msgSend(v6, "objectAtIndex:");
    goto LABEL_11;
  }
LABEL_17:
  uint64_t v9 = objc_msgSend(v6, "objectAtIndex:", a3, v28);
  NSLog(&cfstr_Cmdhomedevices_0.isa, v9);
LABEL_18:
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v28 = objc_msgSend(v9, "name", v28);
    LogPrintF();
  }
  uint64_t v11 = objc_msgSend(v9, "name", v28);
  NSLog(&cfstr_Cmdhomedevices_1.isa, v11);

  char v33 = v7;
  [v7 homeKitSelectHome:v9];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    v16 = (void *)*MEMORY[0x263F0B0A0];
    v30 = v6;
    id v31 = v5;
    v32 = v12;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v19 = [v18 accessories];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v35 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = [*(id *)(*((void *)&v34 + 1) + 8 * j) category];
              uint64_t v25 = [v24 categoryType];

              if (v25 == v16)
              {
                if (gLogCategory_CLISetupInteractor <= 30
                  && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }

                uint64_t v26 = 1;
                BOOL v6 = v30;
                id v5 = v31;
                id v12 = v32;
                goto LABEL_47;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        id v12 = v32;
        uint64_t v15 = v29;
      }
      uint64_t v14 = [v32 countByEnumeratingWithState:&v38 objects:v44 count:16];
      uint64_t v26 = 0;
      BOOL v6 = v30;
      id v5 = v31;
    }
    while (v14);
  }
  else
  {
    uint64_t v26 = 0;
  }
LABEL_47:

  id v7 = v33;
  [v33 setHasExistingHomePodInAccount:v26];

LABEL_48:
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  objc_super v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v23 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    [v9 count];
    uint64_t v22 = [v10 count];
    LogPrintF();
  }
  id v12 = *(id *)(*(void *)(a1 + 32) + 96);
  if (v12)
  {
    NSLog(&cfstr_Cmdhomedevices_3.isa, v9);
    NSLog(&cfstr_Cmdhomedevices_4.isa, v10);
    int v13 = [v9 containsObject:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v14 = *(void *)(a1 + 32);
    if (v13)
    {
LABEL_7:
      id v15 = *(id *)(v14 + 32);
      goto LABEL_28;
    }
    if (*(_DWORD *)(v14 + 44) != -1)
    {
      int v16 = [v9 count];
      uint64_t v14 = *(void *)(a1 + 32);
      if (*(_DWORD *)(v14 + 44) < v16)
      {
        NSLog(&cfstr_Cmdhomedevices_5.isa, *(unsigned int *)(v14 + 44));
        uint64_t v17 = *(int *)(*(void *)(a1 + 32) + 44);
LABEL_26:
        uint64_t v19 = v9;
        goto LABEL_27;
      }
    }
    if (*(_DWORD *)(v14 + 48) == -1
      || (v18 = [v10 count], uint64_t v14 = *(void *)(a1 + 32), *(_DWORD *)(v14 + 48) >= v18))
    {
      if ([v10 containsObject:*(void *)(v14 + 32)])
      {
        uint64_t v14 = *(void *)(a1 + 32);
        goto LABEL_7;
      }
      if (![v11 section])
      {
        uint64_t v17 = [v11 row];
        goto LABEL_26;
      }
      if ([v11 section] != 1) {
        goto LABEL_29;
      }
      uint64_t v17 = [v11 row];
    }
    else
    {
      NSLog(&cfstr_Cmdhomedevices_6.isa, *(unsigned int *)(v14 + 48));
      uint64_t v17 = *(int *)(*(void *)(a1 + 32) + 48);
    }
    uint64_t v19 = v10;
LABEL_27:
    id v15 = [v19 objectAtIndex:v17];
LABEL_28:
    uint64_t v20 = v15;
    if (v15)
    {
LABEL_33:
      NSLog(&cfstr_Cmdhomedevices_7.isa, v20, v22);
      if (gLogCategory_CLISetupInteractor <= 30
        && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
      {
        uint64_t v21 = v20;
        LogPrintF();
      }
      objc_msgSend(v12, "homeKitSelectRoom:", v20, v21);

      goto LABEL_38;
    }
LABEL_29:
    if ([v9 count]) {
      [v9 objectAtIndex:v11];
    }
    else {
    uint64_t v20 = [v10 firstObject];
    }
    goto LABEL_33;
  }
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_38:
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_5(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    id v3 = v2;
    NSLog(&cfstr_Cmdhomedevices_8.isa);
    [v3 homeiCloudEnable];
  }
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_6(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    id v3 = v2;
    NSLog(&cfstr_Cmdhomedevices_9.isa);
    [v3 skipiTunesSignIn];
  }
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_7(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  if (v3)
  {
    if (*(unsigned char *)(v2 + 9)) {
      uint64_t v4 = "yes";
    }
    else {
      uint64_t v4 = "no";
    }
    id v5 = v3;
    NSLog(&cfstr_Cmdhomedevices_10.isa, v4);
    [v5 locationEnable:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9)];
  }
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_8(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 10)) {
    uint64_t v2 = "yes";
  }
  else {
    uint64_t v2 = "no";
  }
  NSLog(&cfstr_Cmdhomedevices_11.isa, v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v4 = v3;
  if (v3)
  {
    id v8 = v3;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 10))
    {
      if (gLogCategory_CLISetupInteractor <= 30)
      {
        if (gLogCategory_CLISetupInteractor != -1 || (int v5 = _LogCategory_Initialize(), v4 = v8, v5))
        {
          LogPrintF();
          uint64_t v4 = v8;
        }
      }
      [v4 runPersonalRequestsAgreedCLI:*(unsigned __int8 *)(*(void *)(a1 + 32) + 11) makeActiveDevice:*(unsigned __int8 *)(*(void *)(a1 + 32) + 12)];
    }
    else
    {
      if (gLogCategory_CLISetupInteractor <= 30)
      {
        if (gLogCategory_CLISetupInteractor != -1 || (int v6 = _LogCategory_Initialize(), v4 = v8, v6))
        {
          LogPrintF();
          uint64_t v4 = v8;
        }
      }
      [v4 personalRequestsEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10)];
    }
  }
  return MEMORY[0x270F9A758]();
}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_9(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11)) {
    uint64_t v2 = "yes";
  }
  else {
    uint64_t v2 = "no";
  }
  NSLog(&cfstr_Cmdhomedevices_12.isa, v2);
  result = *(void **)(*(void *)(a1 + 32) + 96);
  if (result)
  {
    return (void *)[result siriEnable];
  }
  return result;
}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_10(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSLog(&cfstr_Cmdhomedevices_13.isa);
  result = *(void **)(*(void *)(a1 + 32) + 96);
  if (result)
  {
    return (void *)[result termsAgreed];
  }
  return result;
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_11(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSLog(&cfstr_Cmdhomedevices_14.isa);
  id v2 = *(id *)(*(void *)(a1 + 32) + 96);
  id v3 = v2;
  if (v2)
  {
    id v8 = v2;
    if (gLogCategory_CLISetupInteractor <= 30)
    {
      if (gLogCategory_CLISetupInteractor != -1 || (v5 = _LogCategory_Initialize(), id v3 = v8, v5))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 13)) {
          uint64_t v4 = "yes";
        }
        else {
          uint64_t v4 = "no";
        }
        id v7 = v4;
        LogPrintF();
        id v3 = v8;
      }
    }
    objc_msgSend(v3, "tvAudioEnabled:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 13), v7);
  }
  return MEMORY[0x270F9A758]();
}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_12(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSLog(&cfstr_Cmdhomedevices_15.isa);
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(v2 + 96);
  if (result)
  {
    uint64_t v4 = *(unsigned int *)(v2 + 68);
    return (void *)[result stereoRolePicked:v4];
  }
  return result;
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_13(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 15)) {
    uint64_t v2 = "yes";
  }
  else {
    uint64_t v2 = "no";
  }
  NSLog(&cfstr_Cmdhomedevices_16.isa, v2);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 96);
  uint64_t v5 = *(unsigned __int8 *)(v3 + 15);
  return [v4 psgSelected:v5];
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_14(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = *(id *)(*(void *)(a1 + 32) + 96);
  if (v3)
  {
    unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
    unint64_t v5 = [v8 count];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v4 >= v5)
    {
      NSLog(&cfstr_Cmdhomedevices_17.isa, *(void *)(v6 + 56));
    }
    else
    {
      id v7 = [v8 objectAtIndex:*(void *)(v6 + 56)];
      NSLog(&cfstr_Cmdhomedevices_18.isa, v7);
      [v3 stereoMultiplePicked:v7];
    }
  }
}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_15(uint64_t a1)
{
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 14)) {
    uint64_t v2 = "yes";
  }
  else {
    uint64_t v2 = "no";
  }
  NSLog(&cfstr_Cmdhomedevices_19.isa, v2);
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(v3 + 96);
  if (result)
  {
    uint64_t v5 = *(unsigned __int8 *)(v3 + 14);
    return (void *)[result soundRecognitionAgreed:v5];
  }
  return result;
}

- (void)sessionHandleProgress:(unsigned int)a3 inInfo:(id)a4 session:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  if ((int)a3 > 123)
  {
    if ((int)a3 > 229)
    {
      if ((int)a3 > 235)
      {
        if (a3 != 236)
        {
          if (a3 != 250) {
            goto LABEL_57;
          }
          goto LABEL_36;
        }
        FPrintF();
        goto LABEL_56;
      }
      if (a3 != 230 && a3 != 234) {
        goto LABEL_57;
      }
    }
    else if ((int)a3 > 199)
    {
      if (a3 != 200 && a3 != 210) {
        goto LABEL_57;
      }
    }
    else if (a3 != 124)
    {
      if (a3 == 140)
      {
        if (self->_recognizeVoiceEnabled) {
          id v9 = "yes";
        }
        else {
          id v9 = "no";
        }
        NSLog(&cfstr_Cmdhomedevices_20.isa, v9);
        [v8 siriForiCloudRecognizeAnswered:self->_siriForICloudEnabled];
        [v8 recognizeVoiceAnswered:self->_recognizeVoiceEnabled];
      }
      goto LABEL_57;
    }
LABEL_56:
    FPrintF();
    goto LABEL_57;
  }
  if ((int)a3 > 79)
  {
    if ((int)a3 > 119)
    {
      if (a3 != 120 && a3 != 122) {
        goto LABEL_57;
      }
    }
    else
    {
      if (a3 != 80)
      {
        if (a3 == 96) {
          goto LABEL_36;
        }
        goto LABEL_57;
      }
      if (self->_delayTime)
      {
        if (gLogCategory_CLISetupInteractor <= 30
          && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id v11 = dispatch_semaphore_create(0);
        dispatch_time_t v12 = dispatch_time(0, 1000000000 * self->_delayTime);
        dispatch_semaphore_wait(v11, v12);
      }
    }
    goto LABEL_56;
  }
  if ((int)a3 <= 34)
  {
    if (a3 != 20)
    {
      if (a3 != 30) {
        goto LABEL_57;
      }
      NSLog(&cfstr_Cmdhomedevices_34.isa);
      if (gLogCategory_CLISetupInteractor > 90
        || gLogCategory_CLISetupInteractor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_53;
      }
LABEL_8:
      LogPrintF();
LABEL_53:
      id v10 = [(HDSSetupSession *)self->_setupSession promptForSetupCompletionHandler];
      v10[2]();

      goto LABEL_57;
    }
LABEL_36:
    FPrintF();
    if (gLogCategory_CLISetupInteractor > 30
      || gLogCategory_CLISetupInteractor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_53;
    }
    goto LABEL_8;
  }
  if (a3 == 35 || a3 == 40) {
    goto LABEL_56;
  }
LABEL_57:
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CLISetupInteractor_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__CLISetupInteractor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (unint64_t)peerFeatureFlags
{
  return self->_peerFeatureFlags;
}

- (void)setPeerFeatureFlags:(unint64_t)a3
{
  self->_peerFeatureFlags = a3;
}

- (HDSSetupSession)setupSession
{
  return self->_setupSession;
}

- (void)setSetupSession:(id)a3
{
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSession, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
}

@end