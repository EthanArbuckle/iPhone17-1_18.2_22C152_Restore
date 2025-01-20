@interface CUSystemMonitorImp
- ($A3B2E143E1A03423F9FC703C010436DC)_callInfoUncached;
- (BOOL)_hasMonitorPassingTest:(id)a3;
- (CUSystemMonitorImp)init;
- (id)_primaryAppleIDAccount;
- (int)_activeCallCountUnached;
- (int)_connectedCallCountUnached;
- (unsigned)_callFlagsUncached;
- (void)_bluetoothAddressMonitorStart;
- (void)_bluetoothAddressMonitorStop;
- (void)_callCenterStatusChanged:(id)a3;
- (void)_callInfoChanged;
- (void)_callMonitorStart;
- (void)_callMonitorStop;
- (void)_familyGetMembers:(BOOL)a3;
- (void)_familyMonitorStart;
- (void)_familyMonitorStop;
- (void)_familyNetworkChanged;
- (void)_familyUpdated:(id)a3;
- (void)_firstUnlockMonitorCheck:(BOOL)a3;
- (void)_firstUnlockMonitorStart;
- (void)_firstUnlockMonitorStop;
- (void)_forceManateeStateRefresh;
- (void)_invokeBlock:(id)a3 passingTest:(id)a4;
- (void)_locationVisitUpdate:(id)a3 arrived:(BOOL)a4;
- (void)_locationVisitsMonitorStart;
- (void)_locationVisitsMonitorStop;
- (void)_locationsOfInterestDidChange:(BOOL)a3;
- (void)_manateeMonitorStart;
- (void)_manateeMonitorStop;
- (void)_manateeRead;
- (void)_manatreeUpdateRetryTimer:(BOOL)a3;
- (void)_meDeviceCheckCompletion:(id)a3 error:(id)a4 firstCheck:(BOOL)a5;
- (void)_meDeviceCheckStart:(BOOL)a3;
- (void)_meDeviceMonitorStart;
- (void)_meDeviceMonitorStop;
- (void)_meDeviceMonitorStopFMF;
- (void)_meDeviceRetryTimerUpdate:(BOOL)a3;
- (void)_meDeviceUpdate:(id)a3;
- (void)_motionMonitorHandleActivity:(id)a3;
- (void)_motionMonitorOrientationChanged:(id)a3;
- (void)_motionMonitorStart;
- (void)_motionMonitorStop;
- (void)_netInterfaceMonitorStart;
- (void)_netInterfaceMonitorStop;
- (void)_powerUnlimitedMonitorStart;
- (void)_powerUnlimitedMonitorStop;
- (void)_primaryAppleIDChanged2:(BOOL)a3;
- (void)_primaryAppleIDChanged:(id)a3;
- (void)_primaryAppleIDMonitorStart;
- (void)_primaryAppleIDMonitorStop;
- (void)_regionMonitorGet;
- (void)_regionMonitorStart;
- (void)_regionMonitorStop;
- (void)_regionMonitorUpdateLocationsOfInterest:(id)a3;
- (void)_regionMonitorUpdateMCC:(id)a3;
- (void)_rotatingIdentifierMonitorStart;
- (void)_rotatingIdentifierMonitorStop;
- (void)_rotatingIdentifierTimerFired;
- (void)_screenChanged:(BOOL)a3;
- (void)_screenLockedChanged;
- (void)_screenLockedMonitorStart;
- (void)_screenLockedMonitorStop;
- (void)_screenOnMonitorStartiOS;
- (void)_screenOnMonitorStop;
- (void)_screenStateMonitorStart;
- (void)_screenStateMonitorStop;
- (void)_screenStateMonitorUpdateWithLayout:(id)a3;
- (void)_systemConfigChanged:(id)a3 initial:(BOOL)a4;
- (void)_systemConfigNetInterfaceChanged:(id)a3 initial:(BOOL)a4;
- (void)_systemConfigSystemNameChanged:(BOOL)a3;
- (void)_systemConfigUpdateKeyPtr:(id *)a3 name:(id)a4 enabled:(BOOL)a5 creator:(id)a6;
- (void)_systemConfigUpdateNotifications;
- (void)_systemLockStateMonitorStart;
- (void)_systemLockStateMonitorStop;
- (void)_systemLockStateUpdate:(BOOL)a3;
- (void)_systemUIMonitorChangedFlags:(unsigned int)a3;
- (void)_systemUIMonitorStart;
- (void)_systemUIMonitorStop;
- (void)_update;
- (void)_wifiMonitorStart;
- (void)_wifiMonitorStateChanged:(BOOL)a3;
- (void)_wifiMonitorStop;
- (void)addMonitor:(id)a3 completion:(id)a4;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)locationManager:(id)a3 didArrive:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didDepart:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)removeMonitor:(id)a3;
- (void)updateWithQueue:(id)a3 completion:(id)a4;
@end

@implementation CUSystemMonitorImp

void *__46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[63]) {
    return (void *)[result _screenStateMonitorUpdateWithLayout:*(void *)(a1 + 40)];
  }
  return result;
}

uint64_t __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _systemUIMonitorChangedFlags:*(_DWORD *)(*(void *)(a1 + 32) + 596) & 0x40000u | *(_DWORD *)(a1 + 40)];
}

uint64_t __48__CUSystemMonitorImp__meDeviceRetryTimerUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]_block_invoke", 0x1Eu, (uint64_t)"MeDevice retry timer fired", a5, a6, a7, a8, v11);
  }
  v9 = *(void **)(a1 + 32);
  return [v9 _meDeviceCheckStart:0];
}

void __51__CUSystemMonitorImp__systemUIMonitorChangedFlags___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    v2 = [a2 systemUIChangedHandler];
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }
  }
}

- (void)_systemUIMonitorChangedFlags:(unsigned int)a3
{
  uint64_t v8 = *(void *)&a3;
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    v10 = NSPrintF((uint64_t)"%#{flags}", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8);
    v23 = NSPrintF((uint64_t)"%#{flags}", v11, v12, v13, v14, v15, v16, v17, self->_systemUIFlags ^ v8);
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorChangedFlags:]", 0x1Eu, (uint64_t)"SystemUI changed: %@, diff %@", v18, v19, v20, v21, (uint64_t)v10);
  }
  unsigned int systemUIFlags = self->_systemUIFlags;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_unsigned int systemUIFlags = v8;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (systemUIFlags != v8)
  {
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_511 passingTest:&__block_literal_global_513];
  }
}

- (void)_screenStateMonitorUpdateWithLayout:(id)a3
{
  id v14 = a3;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [v14 backlightState];
    if (v8 >= 4) {
      int v9 = 0;
    }
    else {
      int v9 = dword_18E416FC0[v8];
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor > 30)
    {
      int v9 = 0;
      goto LABEL_28;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorUpdateWithLayout:]", 0x1Eu, (uint64_t)"ScreenState update no layout/backlight", v4, v5, v6, v7, v13);
    }
    int v9 = 0;
  }
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    int screenState = self->_screenState;
    if (screenState <= 19)
    {
      if (!screenState)
      {
        uint64_t v11 = @"Unknown";
        goto LABEL_27;
      }
      if (screenState == 10)
      {
        uint64_t v11 = @"Off";
        goto LABEL_27;
      }
    }
    else
    {
      switch(screenState)
      {
        case 20:
          uint64_t v11 = @"InactiveOn";
          goto LABEL_27;
        case 30:
          uint64_t v11 = @"ActiveDimmed";
          goto LABEL_27;
        case 40:
          uint64_t v11 = @"ActiveOn";
LABEL_27:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorUpdateWithLayout:]", 0x1Eu, (uint64_t)"ScreenState changed: %@ -> %@ (raw %d)", v4, v5, v6, v7, (uint64_t)v11);
          goto LABEL_28;
      }
    }
    uint64_t v11 = @"?";
    goto LABEL_27;
  }
LABEL_28:
  int v12 = self->_screenState;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_int screenState = v9;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v9 != v12) {
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_374_8165 passingTest:&__block_literal_global_376];
  }
}

- (void)_invokeBlock:(id)a3 passingTest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void))a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = self->_monitors;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(unsigned char **)(*((void *)&v17 + 1) + 8 * i);
        if (v13[9] && v7[2](v7, *(void *)(*((void *)&v17 + 1) + 8 * i)))
        {
          id v14 = [v13 dispatchQueue];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __47__CUSystemMonitorImp__invokeBlock_passingTest___block_invoke;
          v15[3] = &unk_1E55BF148;
          v15[4] = v13;
          id v16 = v6;
          dispatch_async(v14, v15);
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

BOOL __51__CUSystemMonitorImp__systemUIMonitorChangedFlags___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 systemUIChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [a3 elements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        if (v11)
        {
          int v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
          uint64_t v13 = v12;
          BOOL v14 = v12 != 0;
          if (v12) {
            v7 |= [v12 unsignedIntValue];
          }
        }
        else
        {
          BOOL v14 = 0;
        }
        long long v19 = [v10 bundleIdentifier];
        if (v19
          && ([*(id *)(a1 + 32) objectForKeyedSubscript:v19],
              (long long v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v21 = v20;
          v7 |= [v20 unsignedIntValue];
        }
        else if (!v14 {
               && gLogCategory_CUSystemMonitor <= 30
        }
               && (gLogCategory_CUSystemMonitor != -1
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStart]_block_invoke", 0x1Eu, (uint64_t)"SystemUI unknown identifier: '%@' / '%@'", v15, v16, v17, v18, (uint64_t)v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  uint64_t v22 = *(void *)(a1 + 40);
  v23 = *(NSObject **)(v22 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_2;
  block[3] = &unk_1E55BF088;
  block[4] = v22;
  int v25 = v7;
  dispatch_async(v23, block);
}

uint64_t __47__CUSystemMonitorImp__invokeBlock_passingTest___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

void __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke_2;
  v8[3] = &unk_1E55BF170;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_meDeviceCheckStart:(BOOL)a3
{
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckStart:]", 0xAu, (uint64_t)"MeDevice check\n", v3, v4, v5, v6, v12);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v9 setUnderlyingQueue:self->_dispatchQueue];
  uint64_t v10 = (void *)[objc_alloc(getFMFSessionClass()) initWithDelegate:self delegateQueue:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__CUSystemMonitorImp__meDeviceCheckStart___block_invoke;
  v13[3] = &unk_1E55BEB20;
  BOOL v15 = a3;
  v13[4] = self;
  id v14 = v10;
  id v11 = v10;
  [v11 getActiveLocationSharingDevice:v13];
}

uint64_t __42__CUSystemMonitorImp__meDeviceCheckStart___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _meDeviceCheckCompletion:a2 error:a3 firstCheck:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = *(void **)(a1 + 40);
  return [v4 setDelegate:0];
}

- (void)_meDeviceCheckCompletion:(id)a3 error:(id)a4 firstCheck:(BOOL)a5
{
  BOOL v5 = a5;
  id v38 = a4;
  id v8 = a3;
  id v9 = [v8 deviceId];
  uint64_t v10 = [v8 idsDeviceId];
  id v11 = [v8 deviceName];
  int v12 = [v8 isThisDevice];

  if (v38)
  {
    if (!v9 || !v10 || !v11)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x5Au, (uint64_t)"### MeDevice check failed: %{error}\n", v13, v14, v15, v16, (uint64_t)v38);
      }
      [(CUSystemMonitorImp *)self _meDeviceRetryTimerUpdate:1];
      goto LABEL_49;
    }
    if (gLogCategory_CUSystemMonitor <= 50
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x32u, (uint64_t)"MeDevice provided device info, but reported an error? : %{error}\n", v13, v14, v15, v16, (uint64_t)v38);
    }
  }
  [(CUSystemMonitorImp *)self _meDeviceRetryTimerUpdate:0];
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  uint64_t v18 = v9;
  long long v19 = meDeviceFMFDeviceID;
  BOOL v37 = v12;
  if (v18 == v19)
  {
  }
  else
  {
    long long v20 = v19;
    if ((v18 == 0) == (v19 != 0))
    {
      long long v27 = v18;
      goto LABEL_34;
    }
    int v21 = [(NSString *)v18 isEqual:v19];

    if (!v21) {
      goto LABEL_35;
    }
  }
  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  long long v27 = v10;
  long long v28 = meDeviceIDSDeviceID;
  if (v27 == v28)
  {
  }
  else
  {
    long long v20 = v28;
    if ((v27 == 0) == (v28 != 0)) {
      goto LABEL_34;
    }
    int v35 = [(NSString *)v27 isEqual:v28];

    if (!v35) {
      goto LABEL_35;
    }
  }
  meDeviceName = self->_meDeviceName;
  v36 = v11;
  v30 = v11;
  uint64_t v31 = meDeviceName;
  if (v30 != v31)
  {
    long long v20 = v31;
    if ((v30 == 0) != (v31 != 0))
    {
      int v34 = [(NSString *)v30 isEqual:v31];

      id v11 = v36;
      if (!v34)
      {
LABEL_35:
        if (v5)
        {
          BOOL v32 = v37;
          if (gLogCategory_CUSystemMonitor > 30
            || gLogCategory_CUSystemMonitor == -1
            && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
          {
            goto LABEL_46;
          }
          v33 = "MeDevice initial: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n";
        }
        else
        {
          BOOL v32 = v37;
          if (gLogCategory_CUSystemMonitor > 30
            || gLogCategory_CUSystemMonitor == -1
            && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
          {
            goto LABEL_46;
          }
          v33 = "MeDevice changed: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n";
        }
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x1Eu, (uint64_t)v33, v22, v23, v24, v25, (uint64_t)v18);
LABEL_46:
        pthread_mutex_lock(&gCUSystemMonitorLock);
        objc_storeStrong((id *)&self->_meDeviceFMFDeviceID, v9);
        objc_storeStrong((id *)&self->_meDeviceIDSDeviceID, v10);
        objc_storeStrong((id *)&self->_meDeviceName, v11);
        self->_meDeviceIsMe = v32;
        self->_meDeviceValid = 1;
        pthread_mutex_unlock(&gCUSystemMonitorLock);
        [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_203 passingTest:&__block_literal_global_205_8276];
        goto LABEL_49;
      }
      goto LABEL_28;
    }
    long long v27 = v30;
    id v11 = v36;
LABEL_34:

    goto LABEL_35;
  }

  id v11 = v36;
LABEL_28:
  if (self->_meDeviceIsMe != v37) {
    goto LABEL_35;
  }
  if (v5)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0x1Eu, (uint64_t)"MeDevice initial: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n", v22, v23, v24, v25, (uint64_t)v18);
    }
  }
  else if (gLogCategory_CUSystemMonitor <= 10 {
         && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  }
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceCheckCompletion:error:firstCheck:]", 0xAu, (uint64_t)"MeDevice unchanged: FMF <%.8@>, IDS <%.8@>, Name '%@', Me %s\n", v22, v23, v24, v25, (uint64_t)v18);
  }
LABEL_49:
}

- (void)_meDeviceRetryTimerUpdate:(BOOL)a3
{
  if (a3)
  {
    if (GestaltGetDeviceClass_sOnce != -1) {
      dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13498);
    }
    BOOL v8 = GestaltGetDeviceClass_deviceClass > 7 || ((1 << GestaltGetDeviceClass_deviceClass) & 0x8A) == 0;
    if (!v8 || GestaltGetDeviceClass_deviceClass == 100)
    {
      if (!self->_meDeviceRetryTimer)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]", 0x1Eu, (uint64_t)"MeDevice retry timer start", v3, v4, v5, v6, (uint64_t)v17);
        }
        id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        meDeviceRetryTimer = self->_meDeviceRetryTimer;
        self->_meDeviceRetryTimer = v9;

        id v11 = self->_meDeviceRetryTimer;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __48__CUSystemMonitorImp__meDeviceRetryTimerUpdate___block_invoke;
        handler[3] = &unk_1E55BFC18;
        handler[4] = self;
        dispatch_source_set_event_handler(v11, handler);
        int v12 = self->_meDeviceRetryTimer;
        dispatch_time_t v13 = dispatch_time(0, 30000000000);
        dispatch_source_set_timer(v12, v13, 0x6FC23AC00uLL, 0x12A05F200uLL);
        dispatch_activate((dispatch_object_t)self->_meDeviceRetryTimer);
      }
      return;
    }
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]", 0x1Eu, (uint64_t)"MeDevice retry timer disabled on unsupported device", v3, v4, v5, v6, (uint64_t)v17);
    }
  }
  uint64_t v14 = self->_meDeviceRetryTimer;
  if (!v14) {
    return;
  }
  if (gLogCategory_CUSystemMonitor >= 31)
  {
    uint64_t v15 = v14;
LABEL_27:
    uint64_t v18 = v15;
    dispatch_source_cancel(v15);
    uint64_t v16 = self->_meDeviceRetryTimer;
    self->_meDeviceRetryTimer = 0;

    return;
  }
  if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceRetryTimerUpdate:]", 0x1Eu, (uint64_t)"MeDevice retry timer stop", v3, v4, v5, v6, (uint64_t)v17);
  }
  uint64_t v15 = self->_meDeviceRetryTimer;
  if (v15) {
    goto LABEL_27;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_firstUnlockTimer, 0);
  objc_storeStrong((id *)&self->_systemUIMonitor, 0);
  objc_storeStrong((id *)&self->_systemUIIdentifierMap, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_scNotificationPatterns, 0);
  objc_storeStrong((id *)&self->_scNotificationKeys, 0);
  objc_storeStrong((id *)&self->_scPatternNetInterfaceIPv6, 0);
  objc_storeStrong((id *)&self->_scPatternNetInterfaceIPv4, 0);
  objc_storeStrong((id *)&self->_scKeySystemName, 0);
  objc_storeStrong((id *)&self->_scInitialKeys, 0);
  objc_storeStrong((id *)&self->_screenStateMonitor, 0);
  objc_storeStrong((id *)&self->_rotatingIdentifierTimer, 0);
  objc_storeStrong((id *)&self->_rotatingIdentifierData, 0);
  objc_storeStrong((id *)&self->_regionRoutineState, 0);
  objc_storeStrong((id *)&self->_regionRoutineCountry, 0);
  objc_storeStrong((id *)&self->_regionRoutineManager, 0);
  objc_storeStrong((id *)&self->_regionMobileCountryCode, 0);
  objc_storeStrong((id *)&self->_regionISOCountryCode, 0);
  objc_storeStrong((id *)&self->_regionCTClient, 0);
  objc_storeStrong((id *)&self->_primaryAppleID, 0);
  objc_storeStrong((id *)&self->_primaryNetworkSignature, 0);
  objc_storeStrong((id *)&self->_netInterfaceMonitor, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_meDeviceRetryTimer, 0);
  objc_storeStrong((id *)&self->_meDeviceName, 0);
  objc_storeStrong((id *)&self->_meDeviceIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_meDeviceFMFDeviceID, 0);
  objc_storeStrong((id *)&self->_meDeviceFindMyLocateMonitor, 0);
  objc_storeStrong((id *)&self->_manateeRetryTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_familyPrimaryIPMonitor, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressData, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)_wifiMonitorStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CUWiFiManager *)self->_wifiManager wifiFlags];
  int v6 = [(CUWiFiManager *)self->_wifiManager wifiState];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  unsigned int wifiFlags = self->_wifiFlags;
  int wifiState = self->_wifiState;
  self->_unsigned int wifiFlags = v5;
  self->_int wifiState = v6;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v6 == wifiState && v5 == wifiFlags)
  {
    if (v3)
    {
      if (gLogCategory_CUSystemMonitor > 10
        || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu))
      {
        return;
      }
      if (v6 <= 19)
      {
        if (!v6)
        {
          uint64_t v15 = "Unknown";
          goto LABEL_67;
        }
        if (v6 == 10)
        {
          uint64_t v15 = "Off";
          goto LABEL_67;
        }
      }
      else
      {
        switch(v6)
        {
          case 20:
            uint64_t v15 = "NotConnected";
            goto LABEL_67;
          case 30:
            uint64_t v15 = "Connecting";
            goto LABEL_67;
          case 40:
            uint64_t v15 = "Connected";
LABEL_67:
            LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0xAu, (uint64_t)"WiFi state unchanged: %s, %#{flags}\n", v9, v10, v11, v12, (uint64_t)v15);
            return;
        }
      }
      uint64_t v15 = "?";
      goto LABEL_67;
    }
    if (gLogCategory_CUSystemMonitor > 30
      || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      return;
    }
    if (v6 <= 19)
    {
      if (!v6)
      {
        id v17 = "Unknown";
        goto LABEL_73;
      }
      if (v6 == 10)
      {
        id v17 = "Off";
        goto LABEL_73;
      }
    }
    else
    {
      switch(v6)
      {
        case 20:
          id v17 = "NotConnected";
          goto LABEL_73;
        case 30:
          id v17 = "Connecting";
          goto LABEL_73;
        case 40:
          id v17 = "Connected";
LABEL_73:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0x1Eu, (uint64_t)"WiFi state initial: %s\n", v9, v10, v11, v12, (uint64_t)v17);
          return;
      }
    }
    id v17 = "?";
    goto LABEL_73;
  }
  if (!v3)
  {
    if (gLogCategory_CUSystemMonitor > 30
      || gLogCategory_CUSystemMonitor == -1 && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      goto LABEL_76;
    }
    if (v6 <= 19)
    {
      if (!v6)
      {
        uint64_t v16 = "Unknown";
        goto LABEL_70;
      }
      if (v6 == 10)
      {
        uint64_t v16 = "Off";
        goto LABEL_70;
      }
    }
    else
    {
      switch(v6)
      {
        case 20:
          uint64_t v16 = "NotConnected";
          goto LABEL_70;
        case 30:
          uint64_t v16 = "Connecting";
          goto LABEL_70;
        case 40:
          uint64_t v16 = "Connected";
LABEL_70:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0x1Eu, (uint64_t)"WiFi state initial: %s, %#{flags}\n", v9, v10, v11, v12, (uint64_t)v16);
          goto LABEL_76;
      }
    }
    uint64_t v16 = "?";
    goto LABEL_70;
  }
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    if (wifiState <= 19)
    {
      if (!wifiState)
      {
        uint64_t v14 = "Unknown";
        goto LABEL_75;
      }
      if (wifiState == 10)
      {
        uint64_t v14 = "Off";
        goto LABEL_75;
      }
    }
    else
    {
      switch(wifiState)
      {
        case 20:
          uint64_t v14 = "NotConnected";
          goto LABEL_75;
        case 30:
          uint64_t v14 = "Connecting";
          goto LABEL_75;
        case 40:
          uint64_t v14 = "Connected";
LABEL_75:
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStateChanged:]", 0x1Eu, (uint64_t)"WiFi state changed: %s -> %s, %#{flags}\n", v9, v10, v11, v12, (uint64_t)v14);
          goto LABEL_76;
      }
    }
    uint64_t v14 = "?";
    goto LABEL_75;
  }
LABEL_76:
  [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_535 passingTest:&__block_literal_global_537];
}

BOOL __47__CUSystemMonitorImp__wifiMonitorStateChanged___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 wifiStateChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__wifiMonitorStateChanged___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    v2 = [a2 wifiStateChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      v2 = v3;
    }
  }
}

- (void)_wifiMonitorStop
{
  if (self->_wifiManager
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStop]", 0x1Eu, (uint64_t)"WiFi monitoring stop\n", v2, v3, v4, v5, v8);
  }
  [(CUWiFiManager *)self->_wifiManager invalidate];
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0;
}

- (void)_wifiMonitorStart
{
  if (!self->_wifiManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStart]", 0x1Eu, (uint64_t)"WiFi monitoring start\n", v2, v3, v4, v5, v10[0]);
    }
    id v7 = objc_alloc_init(CUWiFiManager);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v7;

    [(CUWiFiManager *)self->_wifiManager setControlFlags:[(CUWiFiManager *)self->_wifiManager controlFlags] | 0x100];
    [(CUWiFiManager *)self->_wifiManager setDispatchQueue:self->_dispatchQueue];
    [(CUWiFiManager *)self->_wifiManager setLabel:@"SysMon"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke;
    v11[3] = &unk_1E55BFC18;
    v11[4] = self;
    [(CUWiFiManager *)self->_wifiManager setWifiStateChangedHandler:v11];
    uint64_t v9 = self->_wifiManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = (uint64_t)__39__CUSystemMonitorImp__wifiMonitorStart__block_invoke_2;
    v10[3] = (uint64_t)&unk_1E55BEC60;
    v10[4] = (uint64_t)self;
    [(CUWiFiManager *)v9 activateWithCompletion:v10];
  }
}

uint64_t __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wifiMonitorStateChanged:1];
}

void __39__CUSystemMonitorImp__wifiMonitorStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7
    && gLogCategory_CUSystemMonitor <= 90
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _wifiMonitorStart]_block_invoke_2", 0x5Au, (uint64_t)"### WiFi monitoring start failed: %{error}\n", v3, v4, v5, v6, (uint64_t)v7);
  }
  [*(id *)(a1 + 32) _wifiMonitorStateChanged:0];
}

- (void)_firstUnlockMonitorCheck:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = MKBDeviceUnlockedSinceBoot();
  BOOL v10 = v5 == 1;
  if (v3)
  {
    int v11 = v5;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v12 = "no";
      if (v11 == 1) {
        uint64_t v12 = "yes";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0x1Eu, (uint64_t)"FirstUnlock initial: %s\n", v6, v7, v8, v9, (uint64_t)v12);
    }
    if (v11 == 1) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v5 == 1)
    {
LABEL_15:
      pthread_mutex_lock(&gCUSystemMonitorLock);
      self->_firstUnlocked = v10;
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (!v3)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0x1Eu, (uint64_t)"FirstUnlock changed: No -> Yes\n", v13, v14, v15, v16, v22);
        }
        [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_520 passingTest:&__block_literal_global_522];
      }
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0x1Eu, (uint64_t)"FirstUnlock monitoring stop after unlock\n", v13, v14, v15, v16, v22);
      }
      int firstUnlockToken = self->_firstUnlockToken;
      if (firstUnlockToken != -1)
      {
        notify_cancel(firstUnlockToken);
        self->_int firstUnlockToken = -1;
      }
      firstUnlockTimer = self->_firstUnlockTimer;
      if (firstUnlockTimer)
      {
        long long v19 = firstUnlockTimer;
        dispatch_source_cancel(v19);
        long long v20 = self->_firstUnlockTimer;
        self->_firstUnlockTimer = 0;
      }
      if (v3)
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_3;
        block[3] = &unk_1E55BFC18;
        block[4] = self;
        dispatch_async(dispatchQueue, block);
      }
      else
      {
        [(CUSystemMonitorImp *)self _update];
      }
      return;
    }
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorCheck:]", 0xAu, (uint64_t)"FirstUnlock unchanged (No)\n", v6, v7, v8, v9, v25);
    }
  }
}

uint64_t __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

BOOL __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 firstUnlockHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__firstUnlockMonitorCheck___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 firstUnlockHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_firstUnlockMonitorStop
{
  int firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorStop]", 0x1Eu, (uint64_t)"FirstUnlock monitoring stop\n", v2, v3, v4, v5, v10);
    }
    int firstUnlockToken = self->_firstUnlockToken;
    if (firstUnlockToken != -1)
    {
LABEL_7:
      notify_cancel(firstUnlockToken);
      self->_int firstUnlockToken = -1;
    }
  }
  firstUnlockTimer = self->_firstUnlockTimer;
  if (firstUnlockTimer)
  {
    int v11 = firstUnlockTimer;
    dispatch_source_cancel(v11);
    uint64_t v9 = self->_firstUnlockTimer;
    self->_firstUnlockTimer = 0;
  }
}

- (void)_firstUnlockMonitorStart
{
  if (!self->_firstUnlocked && self->_firstUnlockToken == -1)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _firstUnlockMonitorStart]", 0x1Eu, (uint64_t)"FirstUnlock monitoring start\n", v2, v3, v4, v5, v9);
    }
    uint64_t v7 = (const char *)*MEMORY[0x1E4F78160];
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__CUSystemMonitorImp__firstUnlockMonitorStart__block_invoke;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch(v7, &self->_firstUnlockToken, dispatchQueue, handler);
    [(CUSystemMonitorImp *)self _firstUnlockMonitorCheck:1];
  }
}

uint64_t __46__CUSystemMonitorImp__firstUnlockMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _firstUnlockMonitorCheck:0];
}

- (void)_systemUIMonitorStop
{
  if (self->_systemUIMonitor
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStop]", 0x1Eu, (uint64_t)"SystemUI monitoring stop", v2, v3, v4, v5, v10);
  }
  [(FBSDisplayLayoutMonitor *)self->_systemUIMonitor invalidate];
  systemUIMonitor = self->_systemUIMonitor;
  self->_systemUIMonitor = 0;

  systemUIIdentifierMap = self->_systemUIIdentifierMap;
  self->_systemUIIdentifierMap = 0;

  int systemUIBluetoothNotifyToken = self->_systemUIBluetoothNotifyToken;
  if (systemUIBluetoothNotifyToken != -1)
  {
    notify_cancel(systemUIBluetoothNotifyToken);
    self->_int systemUIBluetoothNotifyToken = -1;
  }
}

- (void)_systemUIMonitorStart
{
  v56[19] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_systemUIIdentifierMap;
  if (!v3)
  {
    uint64_t v4 = getFBSDisplayLayoutElementControlCenterIdentifier[0]();
    v50 = (void *)v4;
    uint64_t v5 = @"com.apple.control-center";
    if (v4) {
      uint64_t v5 = (__CFString *)v4;
    }
    v55[0] = v5;
    v56[0] = &unk_1EDD440F8;
    uint64_t v6 = getFBSDisplayLayoutElementLockScreenIdentifier[0]();
    v49 = (void *)v6;
    uint64_t v7 = @"com.apple.lock-screen";
    if (v6) {
      uint64_t v7 = (__CFString *)v6;
    }
    v55[1] = v7;
    v56[1] = &unk_1EDD44110;
    uint64_t v8 = getFBSDisplayLayoutElementNotificationCenterIdentifier[0]();
    v48 = (void *)v8;
    uint64_t v9 = @"com.apple.notification-center";
    if (v8) {
      uint64_t v9 = (__CFString *)v8;
    }
    v55[2] = v9;
    v56[2] = &unk_1EDD44128;
    uint64_t v10 = getFBSDisplayLayoutElementSiriIdentifier[0]();
    v47 = (void *)v10;
    int v11 = @"com.apple.Siri";
    if (v10) {
      int v11 = (__CFString *)v10;
    }
    v55[3] = v11;
    v56[3] = &unk_1EDD44140;
    uint64_t v12 = getSBSDisplayLayoutElementAppSwitcherIdentifier[0]();
    v46 = (void *)v12;
    uint64_t v13 = @"com.apple.springboard.app-switcher";
    if (v12) {
      uint64_t v13 = (__CFString *)v12;
    }
    v55[4] = v13;
    v56[4] = &unk_1EDD44158;
    uint64_t v14 = getSBSDisplayLayoutElementCarPlayOEMIdentifier[0]();
    uint64_t v15 = (void *)v14;
    uint64_t v16 = @"com.apple.carplay.oem";
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    v55[5] = v16;
    v56[5] = &unk_1EDD44170;
    uint64_t v17 = getSBSDisplayLayoutElementHomeScreenIdentifier[0]();
    uint64_t v18 = (void *)v17;
    long long v19 = @"com.apple.springboard.home-screen";
    if (v17) {
      long long v19 = (__CFString *)v17;
    }
    v55[6] = v19;
    v56[6] = &unk_1EDD44188;
    uint64_t v20 = getSBSDisplayLayoutElementLockScreenNavigationIdentifier[0]();
    int v21 = (void *)v20;
    uint64_t v22 = @"com.apple.springboard.lockscreen.navigation";
    if (v20) {
      uint64_t v22 = (__CFString *)v20;
    }
    v55[7] = v22;
    v56[7] = &unk_1EDD441A0;
    uint64_t v23 = getSBSDisplayLayoutElementLoginIdentifier[0]();
    uint64_t v24 = (void *)v23;
    uint64_t v25 = @"com.apple.springboard.login";
    if (v23) {
      uint64_t v25 = (__CFString *)v23;
    }
    v55[8] = v25;
    v56[8] = &unk_1EDD441B8;
    uint64_t v26 = getSBSDisplayLayoutElementNowPlayingIdentifier[0]();
    long long v27 = (void *)v26;
    long long v28 = @"com.apple.now-playing";
    if (v26) {
      long long v28 = (__CFString *)v26;
    }
    v55[9] = v28;
    v56[9] = &unk_1EDD441D0;
    uint64_t v29 = getSBSDisplayLayoutElementPasscodeIdentifier[0]();
    v30 = (void *)v29;
    uint64_t v31 = @"com.apple.springboard.passcode";
    if (v29) {
      uint64_t v31 = (__CFString *)v29;
    }
    v55[10] = v31;
    v56[10] = &unk_1EDD441E8;
    uint64_t v32 = getSBSDisplayLayoutElementSpotlightIdentifier[0]();
    v33 = (void *)v32;
    int v34 = @"com.apple.springboard.spotlight";
    if (v32) {
      int v34 = (__CFString *)v32;
    }
    v55[11] = v34;
    v56[11] = &unk_1EDD44200;
    uint64_t v35 = getSBSDisplayLayoutElementTodayViewIdentifier[0]();
    v36 = (void *)v35;
    BOOL v37 = @"com.apple.springboard.today-view";
    if (v35) {
      BOOL v37 = (__CFString *)v35;
    }
    v55[12] = v37;
    v55[13] = @"com.apple.camera";
    v56[12] = &unk_1EDD44218;
    v56[13] = &unk_1EDD44230;
    v55[14] = @"com.apple.CoreAuthUI";
    v55[15] = @"com.apple.InCallService";
    v56[14] = &unk_1EDD44248;
    v56[15] = &unk_1EDD44260;
    v55[16] = @"com.apple.SharingViewService";
    v55[17] = @"SBSpotlightAlert";
    v56[16] = &unk_1EDD44278;
    v56[17] = &unk_1EDD44200;
    v55[18] = @"SBVoiceControlAlert";
    v56[18] = &unk_1EDD44290;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:19];

    objc_storeStrong((id *)&self->_systemUIIdentifierMap, v3);
  }
  id v38 = self->_systemUIMonitor;
  if (!v38)
  {
    if ((Class)getFBSDisplayLayoutMonitorConfigurationClass[0]() && (Class)getFBSDisplayLayoutMonitorClass[0]())
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemUIMonitorStart]", 0x1Eu, (uint64_t)"SystemUI monitoring start", v39, v40, v41, v42, v45);
      }
      v43 = [(Class)getFBSDisplayLayoutMonitorConfigurationClass[0]() configurationForDefaultMainDisplayMonitor];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke;
      v52[3] = &unk_1E55BEC38;
      v53 = v3;
      v54 = self;
      [v43 setTransitionHandler:v52];
      id v38 = [(Class)getFBSDisplayLayoutMonitorClass[0]() monitorWithConfiguration:v43];
      objc_storeStrong((id *)&self->_systemUIMonitor, v38);
    }
    else
    {
      id v38 = 0;
    }
  }
  if (self->_systemUIBluetoothNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_3;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.systemFlags", &self->_systemUIBluetoothNotifyToken, dispatchQueue, handler);
  }
}

uint64_t __43__CUSystemMonitorImp__systemUIMonitorStart__block_invoke_3(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) _systemUIMonitorChangedFlags:*(_DWORD *)(*(void *)(a1 + 32) + 596) & 0xFFFBFFFF | ((state64 & 1) << 18)];
}

- (void)_systemLockStateUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = MKBGetDeviceLockState();
  if (v5 <= 4) {
    int v6 = 4 - v5;
  }
  else {
    int v6 = 0;
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t systemLockState = self->_systemLockState;
  self->_uint64_t systemLockState = v6;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v3)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]", 0x1Eu, (uint64_t)"SystemLockState initial: %s\n", v8, v9, v10, v11, (uint64_t)off_1E55BED10[v6]);
    }
  }
  else if (v6 == systemLockState)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]", 0xAu, (uint64_t)"SystemLockState unchanged: %s\n", v8, v9, v10, v11, (uint64_t)off_1E55BED10[v6]);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (systemLockState > 4) {
        uint64_t v12 = "?";
      }
      else {
        uint64_t v12 = off_1E55BED10[systemLockState];
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateUpdate:]", 0x1Eu, (uint64_t)"SystemLockState changed: %s -> %s\n", v8, v9, v10, v11, (uint64_t)v12);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_409 passingTest:&__block_literal_global_411];
  }
}

BOOL __45__CUSystemMonitorImp__systemLockStateUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemLockStateChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __45__CUSystemMonitorImp__systemLockStateUpdate___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 systemLockStateChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_systemLockStateMonitorStop
{
  int systemLockStateToken = self->_systemLockStateToken;
  if (systemLockStateToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateMonitorStop]", 0x1Eu, (uint64_t)"SystemLockState monitoring stop\n", v2, v3, v4, v5, v8);
    }
    int systemLockStateToken = self->_systemLockStateToken;
    if (systemLockStateToken != -1)
    {
LABEL_7:
      notify_cancel(systemLockStateToken);
      self->_int systemLockStateToken = -1;
    }
  }
}

- (void)_systemLockStateMonitorStart
{
  if (self->_systemLockStateToken == -1)
  {
    p_int systemLockStateToken = &self->_systemLockStateToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemLockStateMonitorStart]", 0x1Eu, (uint64_t)"SystemLockState monitoring start\n", v2, v3, v4, v5, v10);
    }
    uint64_t v8 = (const char *)*MEMORY[0x1E4F78160];
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __50__CUSystemMonitorImp__systemLockStateMonitorStart__block_invoke;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch(v8, p_systemLockStateToken, dispatchQueue, handler);
    [(CUSystemMonitorImp *)self _systemLockStateUpdate:1];
  }
}

uint64_t __50__CUSystemMonitorImp__systemLockStateMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _systemLockStateUpdate:0];
}

- (void)_systemConfigSystemNameChanged:(BOOL)a3
{
  uint64_t v5 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  obj = v5;
  if (a3)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]", 0x1Eu, (uint64_t)"SystemName initial: '%@'\n", v6, v7, v8, v9, (uint64_t)obj);
    }
LABEL_23:
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)&self->_systemName, obj);
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (!a3) {
      [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_399_8153 passingTest:&__block_literal_global_401];
    }
    goto LABEL_25;
  }
  systemName = self->_systemName;
  uint64_t v11 = v5;
  uint64_t v12 = systemName;
  if (v11 == (__CFString *)v12)
  {
  }
  else
  {
    uint64_t v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_14:
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]", 0x1Eu, (uint64_t)"SystemName changed: '%@' -> '%@'\n", v15, v16, v17, v18, (uint64_t)self->_systemName);
      }
      goto LABEL_23;
    }
    char v14 = [(__CFString *)v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigSystemNameChanged:]", 0xAu, (uint64_t)"SystemName unchanged '%@'\n", v15, v16, v17, v18, (uint64_t)v11);
  }
LABEL_25:
}

BOOL __53__CUSystemMonitorImp__systemConfigSystemNameChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemNameChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __53__CUSystemMonitorImp__systemConfigSystemNameChanged___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 systemNameChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_systemConfigNetInterfaceChanged:(id)a3 initial:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v11 = v6;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigNetInterfaceChanged:initial:]", 0x1Eu, (uint64_t)"NetInterfaces changed: %##@\n", v7, v8, v9, v10, (uint64_t)v11);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_393 passingTest:&__block_literal_global_395];
    id v6 = v11;
  }
}

BOOL __63__CUSystemMonitorImp__systemConfigNetInterfaceChanged_initial___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 netInterfacesChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __63__CUSystemMonitorImp__systemConfigNetInterfaceChanged_initial___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 netInterfacesChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_systemConfigChanged:(id)a3 initial:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    BOOL v19 = v4;
    char v9 = 0;
    char v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 hasPrefix:@"State:/Network/Interface/"])
        {
          char v10 = 1;
        }
        else if ([(NSString *)self->_scKeySystemName isEqual:v13])
        {
          char v9 = 1;
        }
        else if (gLogCategory_CUSystemMonitor <= 30 {
               && (gLogCategory_CUSystemMonitor != -1
        }
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigChanged:initial:]", 0x1Eu, (uint64_t)"SystemConfig unknown key changed: '%@'\n", v14, v15, v16, v17, (uint64_t)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
    if (v10)
    {
      BOOL v18 = v19;
      [(CUSystemMonitorImp *)self _systemConfigNetInterfaceChanged:v6 initial:v19];
      if ((v9 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    BOOL v18 = v19;
    if (v9) {
LABEL_20:
    }
      [(CUSystemMonitorImp *)self _systemConfigSystemNameChanged:v18];
  }
LABEL_21:
}

- (void)_systemConfigUpdateNotifications
{
  scPatternNetInterfaceIPBOOL v4 = self->_scPatternNetInterfaceIPv4;
  if (scPatternNetInterfaceIPv4)
  {
    BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA48];
    uint64_t v5 = scPatternNetInterfaceIPv4;
    id v6 = objc_alloc_init(v4);
    [v6 addObject:v5];

    uint64_t v7 = self->_scPatternNetInterfaceIPv6;
    if (!v7) {
      goto LABEL_8;
    }
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v7 = self->_scPatternNetInterfaceIPv6;
  if (v7)
  {
LABEL_6:
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_7:
    [v6 addObject:v7];
    goto LABEL_8;
  }
  id v6 = 0;
LABEL_8:

  scKeySystemName = self->_scKeySystemName;
  if (scKeySystemName)
  {
    char v9 = (objc_class *)MEMORY[0x1E4F1CA48];
    char v10 = scKeySystemName;
    id v11 = objc_alloc_init(v9);
    [v11 addObject:v10];
  }
  else
  {
    id v11 = 0;
  }
  if (![v11 count] && !objc_msgSend(v6, "count"))
  {
    if (self->_scDynamicStore)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x1Eu, (uint64_t)"SystemConfig monitoring stop\n", v12, v13, v14, v15, v60);
      }
      SCDynamicStoreSetDispatchQueue(self->_scDynamicStore, 0);
      scDynamicStore = self->_scDynamicStore;
      if (scDynamicStore)
      {
        CFRelease(scDynamicStore);
        self->_scDynamicStore = 0;
      }
    }
    scNotificationKeys = self->_scNotificationKeys;
    self->_scNotificationKeys = 0;

    scNotificationPatterns = self->_scNotificationPatterns;
    self->_scNotificationPatterns = 0;

    goto LABEL_57;
  }
  uint64_t v16 = self->_scDynamicStore;
  if (!v16)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x1Eu, (uint64_t)"SystemConfig monitoring start\n", v12, v13, v14, v15, v60);
    }
    uint64_t v17 = getprogname();
    NSPrintF((uint64_t)"%s:CUSystemMonitor", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
    uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    uint64_t v26 = SCDynamicStoreCreate(0, v25, (SCDynamicStoreCallBack)_systemConfigChanged, &context);
    if (!v26)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        uint64_t v32 = SCError();
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x5Au, (uint64_t)"### SCDynamicStoreCreate failed: %#m\n", v33, v34, v35, v36, v32);
      }

      goto LABEL_61;
    }
    uint64_t v16 = v26;
    self->_scDynamicStore = v26;
    if (!SCDynamicStoreSetDispatchQueue(v26, (dispatch_queue_t)self->_dispatchQueue)
      && gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      uint64_t v27 = SCError();
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x5Au, (uint64_t)"### SCDynamicStoreSetDispatchQueue failed: %#m\n", v28, v29, v30, v31, v27);
    }
  }
  uint64_t v40 = self->_scNotificationKeys;
  uint64_t v41 = (NSArray *)v11;
  uint64_t v42 = v40;
  if (v41 == v42)
  {

    goto LABEL_44;
  }
  v43 = v42;
  if ((v41 == 0) == (v42 != 0))
  {
    v50 = v41;
LABEL_49:

    goto LABEL_50;
  }
  int v44 = [(NSArray *)v41 isEqual:v42];

  if (v44)
  {
LABEL_44:
    v49 = self->_scNotificationPatterns;
    v50 = (NSArray *)v6;
    v51 = v49;
    if (v50 == v51)
    {

LABEL_57:
      scInitialKeys = self->_scInitialKeys;
      if (scInitialKeys)
      {
        [(CUSystemMonitorImp *)self _systemConfigChanged:scInitialKeys initial:1];
        v54 = self->_scInitialKeys;
      }
      else
      {
        v54 = 0;
      }
      self->_scInitialKeys = 0;

      self->_scChangesPending = 0;
      goto LABEL_61;
    }
    v43 = v51;
    if ((v50 == 0) != (v51 != 0))
    {
      char v52 = [(NSArray *)v50 isEqual:v51];

      if (v52) {
        goto LABEL_57;
      }
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_50:
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x1Eu, (uint64_t)"SystemConfig watch: Keys %##@, Patterns %##@\n", v45, v46, v47, v48, (uint64_t)v41);
  }
  if (SCDynamicStoreSetNotificationKeys(v16, (CFArrayRef)v41, (CFArrayRef)v6))
  {
    objc_storeStrong((id *)&self->_scNotificationKeys, v11);
    objc_storeStrong((id *)&self->_scNotificationPatterns, v6);
    goto LABEL_57;
  }
  if (gLogCategory_CUSystemMonitor <= 90
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
  {
    uint64_t v55 = SCError();
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateNotifications]", 0x5Au, (uint64_t)"### SCDynamicStoreSetNotificationKeys failed: %#m\n", v56, v57, v58, v59, v55);
  }
LABEL_61:
}

- (void)_systemConfigUpdateKeyPtr:(id *)a3 name:(id)a4 enabled:(BOOL)a5 creator:(id)a6
{
  BOOL v7 = a5;
  id v21 = a4;
  uint64_t v14 = (void (**)(void))a6;
  id v15 = *a3;
  if (v7)
  {
    if (!v15)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]", 0x1Eu, (uint64_t)"SystemConfig monitoring add: %@\n", v10, v11, v12, v13, (uint64_t)v21);
      }
      uint64_t v17 = v14[2](v14);
      objc_storeStrong(a3, v17);
      self->_scChangesPending = 1;
      scInitialKeys = self->_scInitialKeys;
      if (!scInitialKeys)
      {
        uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v20 = self->_scInitialKeys;
        self->_scInitialKeys = v19;

        scInitialKeys = self->_scInitialKeys;
      }
      [(NSMutableArray *)scInitialKeys addObject:v17];
    }
  }
  else if (v15)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _systemConfigUpdateKeyPtr:name:enabled:creator:]", 0x1Eu, (uint64_t)"SystemConfig monitoring remove: %@\n", v10, v11, v12, v13, (uint64_t)v21);
    }
    id v16 = *a3;
    *a3 = 0;

    self->_scChangesPending = 1;
  }
}

BOOL __58__CUSystemMonitorImp__screenStateMonitorUpdateWithLayout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenStateChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __58__CUSystemMonitorImp__screenStateMonitorUpdateWithLayout___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 screenStateChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_screenStateMonitorStop
{
  if (self->_screenStateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStop]", 0x1Eu, (uint64_t)"ScreenState monitor stop", v2, v3, v4, v5, v8);
    }
    [(FBSDisplayLayoutMonitor *)self->_screenStateMonitor invalidate];
    screenStateMonitor = self->_screenStateMonitor;
    self->_screenStateMonitor = 0;

    self->_int screenState = 0;
  }
}

- (void)_screenStateMonitorStart
{
  if (!self->_screenStateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]", 0x1Eu, (uint64_t)"ScreenState monitor start", v2, v3, v4, v5, v18);
    }
    BOOL v7 = [(Class)getFBSDisplayLayoutMonitorConfigurationClass[0]() configurationForDefaultMainDisplayMonitor];
    uint64_t v12 = v7;
    if (v7)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __46__CUSystemMonitorImp__screenStateMonitorStart__block_invoke;
      v19[3] = &unk_1E55BEC10;
      v19[4] = self;
      [v7 setTransitionHandler:v19];
      uint64_t v17 = [(Class)getFBSDisplayLayoutMonitorClass[0]() monitorWithConfiguration:v12];
      if (v17)
      {
        objc_storeStrong((id *)&self->_screenStateMonitor, v17);
      }
      else if (gLogCategory_CUSystemMonitor <= 90 {
             && (gLogCategory_CUSystemMonitor != -1
      }
              || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]", 0x5Au, (uint64_t)"### ScreenState no monitor", v13, v14, v15, v16, v18);
      }
    }
    else if (gLogCategory_CUSystemMonitor <= 90 {
           && (gLogCategory_CUSystemMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenStateMonitorStart]", 0x5Au, (uint64_t)"### ScreenState no monitor config", v8, v9, v10, v11, v18);
    }
  }
}

- (void)_screenChanged:(BOOL)a3
{
  int v3 = a3;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int screenOn = self->_screenOn;
  self->_int screenOn = v3;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (screenOn == v3)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      uint64_t v10 = "off";
      if (v3) {
        uint64_t v10 = "on";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenChanged:]", 0xAu, (uint64_t)"ScreenOn unchanged (%s)\n", v6, v7, v8, v9, (uint64_t)v10);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (screenOn) {
        uint64_t v11 = "on";
      }
      else {
        uint64_t v11 = "off";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenChanged:]", 0x1Eu, (uint64_t)"ScreenOn changed: %s -> %s\n", v6, v7, v8, v9, (uint64_t)v11);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_361 passingTest:&__block_literal_global_363];
  }
}

BOOL __37__CUSystemMonitorImp__screenChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenOnChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __37__CUSystemMonitorImp__screenChanged___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 screenOnChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_screenOnMonitorStop
{
  int screenBlankedToken = self->_screenBlankedToken;
  if (screenBlankedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStop]", 0x1Eu, (uint64_t)"ScreenOn monitoring stop\n", v2, v3, v4, v5, v8);
    }
    int screenBlankedToken = self->_screenBlankedToken;
    if (screenBlankedToken != -1)
    {
LABEL_7:
      notify_cancel(screenBlankedToken);
      self->_int screenBlankedToken = -1;
    }
  }
}

- (void)_screenOnMonitorStartiOS
{
  if (self->_screenBlankedToken == -1)
  {
    p_int screenBlankedToken = &self->_screenBlankedToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStartiOS]", 0x1Eu, (uint64_t)"ScreenOn monitoring start\n", v2, v3, v4, v5, v17);
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__CUSystemMonitorImp__screenOnMonitorStartiOS__block_invoke;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", p_screenBlankedToken, dispatchQueue, handler);
    int screenBlankedToken = self->_screenBlankedToken;
    uint64_t state64 = 0;
    notify_get_state(screenBlankedToken, &state64);
    uint64_t v10 = state64;
    BOOL v11 = state64 == 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_int screenOn = v11;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v16 = "off";
      if (!v10) {
        uint64_t v16 = "on";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenOnMonitorStartiOS]", 0x1Eu, (uint64_t)"ScreenOn initial: %s\n", v12, v13, v14, v15, (uint64_t)v16);
    }
  }
}

uint64_t __46__CUSystemMonitorImp__screenOnMonitorStartiOS__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) _screenChanged:state64 == 0];
}

- (void)_screenLockedChanged
{
  if (SpringBoardServicesLibrary_sOnce != -1) {
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_1263);
  }
  int v3 = SpringBoardServicesLibrary_sLib
    && dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSGetScreenLockStatus")
    && softLinkSBSGetScreenLockStatus(0) != 0;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  int screenLocked = self->_screenLocked;
  self->_int screenLocked = v3;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (screenLocked == v3)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      uint64_t v9 = "no";
      if (v3) {
        uint64_t v9 = "yes";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedChanged]", 0xAu, (uint64_t)"ScreenLocked unchanged (%s)\n", v5, v6, v7, v8, (uint64_t)v9);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (screenLocked) {
        uint64_t v10 = "yes";
      }
      else {
        uint64_t v10 = "no";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedChanged]", 0x1Eu, (uint64_t)"ScreenLocked changed: %s -> %s\n", v5, v6, v7, v8, (uint64_t)v10);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_349 passingTest:&__block_literal_global_351];
  }
}

BOOL __42__CUSystemMonitorImp__screenLockedChanged__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenLockedChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __42__CUSystemMonitorImp__screenLockedChanged__block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 screenLockedChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_screenLockedMonitorStop
{
  int screenLockedToken = self->_screenLockedToken;
  if (screenLockedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStop]", 0x1Eu, (uint64_t)"ScreenLocked monitoring stop\n", v2, v3, v4, v5, v8);
    }
    int screenLockedToken = self->_screenLockedToken;
    if (screenLockedToken != -1)
    {
LABEL_7:
      notify_cancel(screenLockedToken);
      self->_int screenLockedToken = -1;
    }
  }
  self->_int screenLocked = 1;
}

- (void)_screenLockedMonitorStart
{
  if (self->_screenLockedToken == -1)
  {
    p_int screenLockedToken = &self->_screenLockedToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStart]", 0x1Eu, (uint64_t)"ScreenLocked monitoring start\n", v2, v3, v4, v5, v15);
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__CUSystemMonitorImp__screenLockedMonitorStart__block_invoke;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.lockstate", p_screenLockedToken, dispatchQueue, handler);
    if (SpringBoardServicesLibrary_sOnce != -1) {
      dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_1263);
    }
    BOOL v9 = SpringBoardServicesLibrary_sLib
      && dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSGetScreenLockStatus")
      && softLinkSBSGetScreenLockStatus(0) != 0;
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_int screenLocked = v9;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v14 = "no";
      if (v9) {
        uint64_t v14 = "yes";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _screenLockedMonitorStart]", 0x1Eu, (uint64_t)"ScreenLocked initial: %s\n", v10, v11, v12, v13, (uint64_t)v14);
    }
  }
}

uint64_t __47__CUSystemMonitorImp__screenLockedMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _screenLockedChanged];
}

- (void)_rotatingIdentifierTimerFired
{
  p_rotatingIdentifierData = &self->_rotatingIdentifierData;
  uint64_t v19 = self->_rotatingIdentifierData;
  uint64_t v10 = NSRandomData(6uLL, 0, v4, v5, v6, v7, v8, v9);
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)p_rotatingIdentifierData, v10);
  id v11 = v10;
  uint64_t v12 = [v11 bytes];
  __int16 v13 = *(_WORD *)(v12 + 4);
  *(_DWORD *)self->_rotatingIdentifier48.bytes = *(_DWORD *)v12;
  *(_WORD *)&self->_rotatingIdentifier48.bytes[4] = v13;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    uint64_t v14 = [(NSData *)v19 bytes];
    [v11 bytes];
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierTimerFired]", 0x1Eu, (uint64_t)"Rotating identifier changed timer: %.6a -> %.6a\n", v15, v16, v17, v18, v14);
  }
  [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_338 passingTest:&__block_literal_global_340];
}

BOOL __51__CUSystemMonitorImp__rotatingIdentifierTimerFired__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 rotatingIdentifierChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__rotatingIdentifierTimerFired__block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 rotatingIdentifierChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_rotatingIdentifierMonitorStop
{
  rotatingIdentifierTimer = self->_rotatingIdentifierTimer;
  if (!rotatingIdentifierTimer) {
    return;
  }
  if (gLogCategory_CUSystemMonitor >= 31)
  {
    uint64_t v8 = rotatingIdentifierTimer;
LABEL_8:
    id v11 = v8;
    dispatch_source_cancel(v8);
    uint64_t v9 = self->_rotatingIdentifierTimer;
    self->_rotatingIdentifierTimer = 0;

    return;
  }
  if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierMonitorStop]", 0x1Eu, (uint64_t)"Rotating identifier monitor stop\n", v2, v3, v4, v5, v10);
  }
  uint64_t v8 = self->_rotatingIdentifierTimer;
  if (v8) {
    goto LABEL_8;
  }
}

- (void)_rotatingIdentifierMonitorStart
{
  if (!self->_rotatingIdentifierTimer)
  {
    uint64_t v9 = NSRandomData(6uLL, 0, v2, v3, v4, v5, v6, v7);
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)&self->_rotatingIdentifierData, v9);
    id v10 = v9;
    uint64_t v11 = [v10 bytes];
    __int16 v12 = *(_WORD *)(v11 + 4);
    *(_DWORD *)self->_rotatingIdentifier48.bytes = *(_DWORD *)v11;
    *(_WORD *)&self->_rotatingIdentifier48.bytes[4] = v12;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v13 = [v10 bytes];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _rotatingIdentifierMonitorStart]", 0x1Eu, (uint64_t)"Rotating identifier monitor start: %.6a\n", v14, v15, v16, v17, v13);
    }
    uint64_t v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    rotatingIdentifierTimer = self->_rotatingIdentifierTimer;
    self->_rotatingIdentifierTimer = v18;

    uint64_t v20 = self->_rotatingIdentifierTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__CUSystemMonitorImp__rotatingIdentifierMonitorStart__block_invoke;
    handler[3] = &unk_1E55BFC18;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    id v21 = self->_rotatingIdentifierTimer;
    dispatch_time_t v22 = dispatch_time(0x8000000000000000, 1020000000000);
    dispatch_source_set_timer(v21, v22, 0xED7CBCD800uLL, 0xB2D05E00uLL);
    dispatch_activate((dispatch_object_t)self->_rotatingIdentifierTimer);
  }
}

uint64_t __53__CUSystemMonitorImp__rotatingIdentifierMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rotatingIdentifierTimerFired];
}

- (void)_locationsOfInterestDidChange:(BOOL)a3
{
  if (gLogCategory_CUSystemMonitor <= 30)
  {
    BOOL v8 = a3;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
    {
      uint64_t v9 = "(initial)";
      if (v8) {
        uint64_t v9 = "(changed)";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]", 0x1Eu, (uint64_t)"Region monitor LOI fetch start %s", v3, v4, v5, v6, (uint64_t)v9);
    }
  }
  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  regionRoutineManager = self->_regionRoutineManager;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke;
  v13[3] = &unk_1E55BEBE8;
  v13[4] = self;
  [(RTRoutineManager *)regionRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:v10 endDate:v11 withHandler:v13];
}

void __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = v5;
  if (!v11 || v6)
  {
    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]_block_invoke", 0x5Au, (uint64_t)"### Region monitor LOI fetch failed: %{error}", v7, v8, v9, v10, (uint64_t)v6);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v12 = [v11 count];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationsOfInterestDidChange:]_block_invoke", 0x1Eu, (uint64_t)"Region monitor LOI fetch completed: %d total", v13, v14, v15, v16, v12);
    }
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(NSObject **)(v17 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke_2;
    block[3] = &unk_1E55BF170;
    block[4] = v17;
    void block[5] = v11;
    dispatch_async(v18, block);
  }
}

uint64_t __52__CUSystemMonitorImp__locationsOfInterestDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _regionMonitorUpdateLocationsOfInterest:*(void *)(a1 + 40)];
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_regionCTClient)
  {
    id v6 = [v5 legacyInfo];
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v7 = [v6 count];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp cellMonitorUpdate:info:]", 0x1Eu, (uint64_t)"Region monitor cell update: %d items", v8, v9, v10, v11, v7);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v26 = self;
      char v15 = 0;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = [v18 objectForKeyedSubscript:getkCTCellMonitorMCC[0]()];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = [v19 integerValue];
              if (v20 >= 1)
              {
                if (v20 != 0xFFFF)
                {
                  uint64_t v25 = [v19 stringValue];
                  [(CUSystemMonitorImp *)v26 _regionMonitorUpdateMCC:v25];

                  goto LABEL_24;
                }
                char v15 = 1;
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }

      if (v15)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp cellMonitorUpdate:info:]", 0x1Eu, (uint64_t)"Region monitor mapping %d -> null (update)", v21, v22, v23, v24, 0xFFFFLL);
        }
        [(CUSystemMonitorImp *)v26 _regionMonitorUpdateMCC:0];
      }
    }
    else
    {
LABEL_24:
    }
  }
}

- (void)_regionMonitorUpdateMCC:(id)a3
{
  id v5 = a3;
  id v6 = self->_regionMobileCountryCode;
  uint64_t v7 = (NSString *)v5;
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v8 == v7)
  {
    int v10 = 1;
  }
  else if ((v7 == 0) == (v8 != 0))
  {
    int v10 = 0;
  }
  else
  {
    int v10 = [(NSString *)v7 isEqual:v8];
  }

  uint64_t v11 = self->_regionISOCountryCode;
  id v12 = v11;
  if (v10)
  {
    if (v7) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = v13;
    goto LABEL_26;
  }
  if (!v7) {
    goto LABEL_25;
  }
  regionCTServerCnx = self->_regionCTServerCnx;
  if (!regionCTServerCnx)
  {
    uint64_t v16 = getprogname();
    uint64_t v24 = NSPrintF((uint64_t)"com.apple.CUSystemMonitor.%s", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    uint64_t v25 = (__CTServerConnection *)((uint64_t (*)(uint64_t, uint64_t, void *, void *))softLink_CTServerConnectionCreateOnTargetQueue[0])(0, (uint64_t)v24, self->_dispatchQueue, 0);
    if (v25)
    {
      regionCTServerCnx = v25;
      self->_regionCTServerCnx = v25;

      goto LABEL_15;
    }
    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0x5Au, (uint64_t)"### Region monitor CTServerConnectionCreate failed", v26, v27, v28, v29, v42);
    }
    self->_regionCTServerCnx = 0;

LABEL_25:
    uint64_t v14 = 0;
    goto LABEL_26;
  }
LABEL_15:
  v43 = 0;
  ((void (*)(uint64_t, uint64_t, uint64_t))softLink_CTServerConnectionCopyISOForMCC[0])((uint64_t)regionCTServerCnx, (uint64_t)v7, (uint64_t)&v43);
  uint64_t v14 = v43;
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0x1Eu, (uint64_t)"Region monitor CopyISOForMCC: %@, ISO %@, error %d/%d", v30, v31, v32, v33, (uint64_t)v7);
  }
LABEL_26:
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)&self->_regionISOCountryCode, v14);
  objc_storeStrong((id *)&self->_regionMobileCountryCode, a3);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (!v10) {
    goto LABEL_36;
  }
  id v38 = v14;
  uint64_t v39 = v12;
  uint64_t v40 = v39;
  if (v38 == v39)
  {
  }
  else
  {
    if ((v39 != 0) == (v38 == 0))
    {

      goto LABEL_36;
    }
    char v41 = [(NSString *)v38 isEqual:v39];

    if ((v41 & 1) == 0)
    {
LABEL_36:
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0x1Eu, (uint64_t)"Region changed: MCC %@, ISO %@", v34, v35, v36, v37, (uint64_t)v7);
      }
      [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_320 passingTest:&__block_literal_global_322];
      goto LABEL_41;
    }
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateMCC:]", 0xAu, (uint64_t)"Region unchanged: MCC %@, ISO %@", v34, v35, v36, v37, (uint64_t)v7);
  }
LABEL_41:
}

BOOL __46__CUSystemMonitorImp__regionMonitorUpdateMCC___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 regionChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __46__CUSystemMonitorImp__regionMonitorUpdateMCC___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 regionChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_regionMonitorUpdateLocationsOfInterest:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = v4;
  id v50 = (id)[v6 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v50)
  {
    uint64_t v47 = self;
    obuint64_t j = v6;
    uint64_t v7 = 0;
    uint64_t v49 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v50; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        int v10 = [v9 visits];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v53 != v13) {
                objc_enumerationMutation(v10);
              }
              char v15 = [*(id *)(*((void *)&v52 + 1) + 8 * j) entryDate];
              if ([v15 compare:v5] <= 1)
              {
                id v16 = v9;

                id v17 = v15;
                id v5 = v17;
                uint64_t v7 = v16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v12);
        }
      }
      id v6 = obj;
      id v50 = (id)[obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v50);

    if (v7)
    {
      uint64_t v22 = v47->_regionRoutineCountry;
      uint64_t v23 = [v7 mapItem];
      uint64_t v24 = [v23 address];
      uint64_t v25 = [v24 country];

      uint64_t v26 = v22;
      id v51 = v25;
      uint64_t v27 = v25;
      uint64_t v28 = v27;
      if (v26 == v27)
      {
        int v29 = 1;
      }
      else if ((v26 == 0) == (v27 != 0))
      {
        int v29 = 0;
      }
      else
      {
        int v29 = [(NSString *)v26 isEqual:v27];
      }

      uint64_t v30 = v47->_regionRoutineState;
      uint64_t v31 = [v7 mapItem];
      uint64_t v32 = [v31 address];
      uint64_t v33 = [v32 administrativeAreaCode];

      uint64_t v34 = v30;
      uint64_t v35 = v33;
      uint64_t v36 = v35;
      if (v34 == v35)
      {
        int v37 = 1;
      }
      else
      {
        if ((v34 == 0) == (v35 != 0))
        {

          LOBYTE(v37) = 0;
          goto LABEL_36;
        }
        int v37 = [(NSString *)v34 isEqual:v35];
      }

      if (v29 & v37)
      {
        if (gLogCategory_CUSystemMonitor <= 10
          && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]", 0xAu, (uint64_t)"Region routine unchanged: Country %@, State %@", v38, v39, v40, v41, (uint64_t)v28);
        }
LABEL_47:

        goto LABEL_48;
      }
LABEL_36:
      pthread_mutex_lock(&gCUSystemMonitorLock);
      if ((v29 & 1) == 0) {
        objc_storeStrong((id *)&v47->_regionRoutineCountry, v51);
      }
      if ((v37 & 1) == 0) {
        objc_storeStrong((id *)&v47->_regionRoutineState, v33);
      }
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]", 0x1Eu, (uint64_t)"Region routine changed: Country %@, State %@", v42, v43, v44, v45, (uint64_t)v28);
      }
      [(CUSystemMonitorImp *)v47 _invokeBlock:&__block_literal_global_311 passingTest:&__block_literal_global_313];
      goto LABEL_47;
    }
  }
  else
  {
  }
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorUpdateLocationsOfInterest:]", 0x1Eu, (uint64_t)"Region monitor LOI none found", v18, v19, v20, v21, v46);
  }
  uint64_t v7 = 0;
LABEL_48:
}

BOOL __62__CUSystemMonitorImp__regionMonitorUpdateLocationsOfInterest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 regionChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __62__CUSystemMonitorImp__regionMonitorUpdateLocationsOfInterest___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 regionChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_regionMonitorGet
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]", 0x1Eu, (uint64_t)"Region monitor get CT subscription context", v2, v3, v4, v5, v9[0]);
  }
  regionCTClient = self->_regionCTClient;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)__39__CUSystemMonitorImp__regionMonitorGet__block_invoke;
  v9[3] = (uint64_t)&unk_1E55BEBC0;
  v9[4] = (uint64_t)self;
  v9[5] = (uint64_t)regionCTClient;
  uint64_t v8 = regionCTClient;
  [(CoreTelephonyClient *)v8 getCurrentDataSubscriptionContext:v9];
}

void __39__CUSystemMonitorImp__regionMonitorGet__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 392))
  {
    id v11 = v5;
    if (!v11 || v6)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke", 0x5Au, (uint64_t)"### Region monitor get CT subscription context failed: %{error}", v7, v8, v9, v10, (uint64_t)v6);
      }
    }
    else
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke", 0x1Eu, (uint64_t)"Region monitor get MCC", v7, v8, v9, v10, v13);
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __39__CUSystemMonitorImp__regionMonitorGet__block_invoke_2;
      v14[3] = &unk_1E55BEB98;
      uint64_t v12 = *(void **)(a1 + 40);
      v14[4] = *(void *)(a1 + 32);
      v14[5] = v12;
      [v12 copyMobileCountryCode:v11 completion:v14];
    }
  }
}

void __39__CUSystemMonitorImp__regionMonitorGet__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 392))
  {
    if (v5)
    {
      if (gLogCategory_CUSystemMonitor <= 90
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke_2", 0x5Au, (uint64_t)"### Region monitor get MCC failed: MCC %@, %{error}", v6, v7, v8, v9, (uint64_t)v15);
      }
    }
    else
    {
      if ([v15 integerValue] == 0xFFFF)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorGet]_block_invoke_2", 0x1Eu, (uint64_t)"Region monitor mapping %@ -> null (get)", v10, v11, v12, v13, (uint64_t)v15);
        }

        id v14 = 0;
      }
      else
      {
        id v14 = v15;
      }
      id v15 = v14;
      objc_msgSend(*(id *)(a1 + 32), "_regionMonitorUpdateMCC:");
    }
  }
}

- (void)_regionMonitorStop
{
  if (self->_regionCTClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorStop]", 0x1Eu, (uint64_t)"Region monitor stop", v2, v3, v4, v5, v15);
    }
    regionCTClient = self->_regionCTClient;
    self->_regionCTClient = 0;
  }
  regionCTServerCnx = self->_regionCTServerCnx;
  if (regionCTServerCnx)
  {
    CFRelease(regionCTServerCnx);
    self->_regionCTServerCnx = 0;
  }
  regionRoutineManager = self->_regionRoutineManager;
  if (regionRoutineManager)
  {
    self->_regionRoutineManager = 0;
  }
  int regionRoutineNotifyToken = self->_regionRoutineNotifyToken;
  if (regionRoutineNotifyToken != -1)
  {
    notify_cancel(regionRoutineNotifyToken);
    self->_int regionRoutineNotifyToken = -1;
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  regionISOCountryCode = self->_regionISOCountryCode;
  self->_regionISOCountryCode = 0;

  regionMobileCountryCode = self->_regionMobileCountryCode;
  self->_regionMobileCountryCode = 0;

  regionRoutineCountry = self->_regionRoutineCountry;
  self->_regionRoutineCountry = 0;

  regionRoutineState = self->_regionRoutineState;
  self->_regionRoutineState = 0;

  pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (void)_regionMonitorStart
{
  uint64_t v7 = self->_regionCTClient;
  if (!v7)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _regionMonitorStart]", 0x1Eu, (uint64_t)"Region monitor start", v3, v4, v5, v6, v10);
    }
    uint64_t v7 = (CoreTelephonyClient *)[objc_alloc((Class)getCoreTelephonyClientClass[0]()) initWithQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_regionCTClient, v7);
    [(CoreTelephonyClient *)v7 setDelegate:self];
    [(CUSystemMonitorImp *)self _regionMonitorGet];
  }
  uint64_t v8 = self->_regionRoutineManager;
  if (!v8)
  {
    uint64_t v8 = [(Class)getRTRoutineManagerClass[0]() defaultManager];
    objc_storeStrong((id *)&self->_regionRoutineManager, v8);
    if (self->_regionRoutineNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __41__CUSystemMonitorImp__regionMonitorStart__block_invoke;
      handler[3] = &unk_1E55BF010;
      handler[4] = self;
      notify_register_dispatch("RTLocationsOfInterestDidChangeNotification", &self->_regionRoutineNotifyToken, dispatchQueue, handler);
    }
    [(CUSystemMonitorImp *)self _locationsOfInterestDidChange:0];
  }
}

uint64_t __41__CUSystemMonitorImp__regionMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _locationsOfInterestDidChange:1];
}

- (void)_primaryAppleIDChanged2:(BOOL)a3
{
  BOOL v7 = a3;
  if (!a3
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"PrimaryAppleID change notification\n", v3, v4, v5, v6, v27);
  }
  uint64_t v9 = [(CUSystemMonitorImp *)self _primaryAppleIDAccount];
  BOOL primaryAppleIDActive = self->_primaryAppleIDActive;
  self->_BOOL primaryAppleIDActive = v9 != 0;
  id v28 = (id)v9;
  if (v9 && !primaryAppleIDActive && self->_familyFailed)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"Family re-check on PrimaryAppleID active\n", v10, v11, v12, v13, v27);
    }
    [(CUSystemMonitorImp *)self _familyGetMembers:0];
  }
  uint64_t v15 = [(objc_class *)getAKAccountManagerClass_8207() sharedInstance];
  id v16 = [v28 accountPropertyForKey:@"altDSID"];
  if (v16
    && ([v15 authKitAccountWithAltDSID:v16 error:0], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = (void *)v17;
    int v19 = [v15 securityLevelForAccount:v17] == 4;
  }
  else
  {
    int v19 = 0;
  }
  uint64_t v20 = [v28 username];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v21 = self->_primaryAppleID;
  objc_storeStrong((id *)&self->_primaryAppleID, v20);
  int primaryAppleIDIsHSA2 = self->_primaryAppleIDIsHSA2;
  self->_int primaryAppleIDIsHSA2 = v19;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v7)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"PrimaryAppleID initial: %@, HSA2 %s\n", v23, v24, v25, v26, (uint64_t)v20);
    }
  }
  else if (primaryAppleIDIsHSA2 == v19)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0xAu, (uint64_t)"PrimaryAppleID unchanged (%@, HSA2 %s)\n", v23, v24, v25, v26, (uint64_t)v20);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _primaryAppleIDChanged2:]", 0x1Eu, (uint64_t)"PrimaryAppleID changed: %@, HSA2 %s -> %@, HSA2 %s\n", v23, v24, v25, v26, (uint64_t)v21);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_294 passingTest:&__block_literal_global_296];
  }
}

BOOL __46__CUSystemMonitorImp__primaryAppleIDChanged2___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 primaryAppleIDChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __46__CUSystemMonitorImp__primaryAppleIDChanged2___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 primaryAppleIDChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_primaryAppleIDChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CUSystemMonitorImp__primaryAppleIDChanged___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __45__CUSystemMonitorImp__primaryAppleIDChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _primaryAppleIDChanged2:0];
}

- (id)_primaryAppleIDAccount
{
  if (AppleAccountLibrary_sOnce_8223 != -1) {
    dispatch_once(&AppleAccountLibrary_sOnce_8223, &__block_literal_global_1241);
  }
  uint64_t v2 = [(objc_class *)getACAccountStoreClass_8224() defaultStore];
  BOOL v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (void)_primaryAppleIDMonitorStop
{
  if (self->_primaryAppleIDObserving)
  {
    id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 removeObserver:self name:@"com.apple.authkit.user-info-changed" object:0];
    int primaryAppleIDNotifyToken = self->_primaryAppleIDNotifyToken;
    if (primaryAppleIDNotifyToken != -1)
    {
      notify_cancel(primaryAppleIDNotifyToken);
      self->_int primaryAppleIDNotifyToken = -1;
    }
    self->_primaryAppleIDObserving = 0;
    primaryAppleID = self->_primaryAppleID;
    self->_primaryAppleID = 0;

    *(_WORD *)&self->_BOOL primaryAppleIDActive = 0;
  }
}

- (void)_primaryAppleIDMonitorStart
{
  if (!self->_primaryAppleIDObserving)
  {
    BOOL v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:self selector:sel__primaryAppleIDChanged_ name:@"com.apple.authkit.user-info-changed" object:0];
    if (self->_primaryAppleIDNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __49__CUSystemMonitorImp__primaryAppleIDMonitorStart__block_invoke;
      handler[3] = &unk_1E55BF010;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.primaryAccountChanged", &self->_primaryAppleIDNotifyToken, dispatchQueue, handler);
    }
    self->_primaryAppleIDObserving = 1;
    [(CUSystemMonitorImp *)self _primaryAppleIDChanged2:1];
  }
}

uint64_t __49__CUSystemMonitorImp__primaryAppleIDMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _primaryAppleIDChanged2:0];
}

- (void)_powerUnlimitedMonitorStop
{
  int powerSourceToken = self->_powerSourceToken;
  if (powerSourceToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStop]", 0x1Eu, (uint64_t)"PowerUnlimited monitoring stop\n", v2, v3, v4, v5, v8);
    }
    int powerSourceToken = self->_powerSourceToken;
    if (powerSourceToken != -1)
    {
LABEL_7:
      notify_cancel(powerSourceToken);
      self->_int powerSourceToken = -1;
    }
  }
}

- (void)_powerUnlimitedMonitorStart
{
  if (self->_powerSourceToken == -1)
  {
    p_int powerSourceToken = &self->_powerSourceToken;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]", 0x1Eu, (uint64_t)"PowerUnlimited monitoring start\n", v2, v3, v4, v5, v15);
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.powersources.source", p_powerSourceToken, dispatchQueue, handler);
    int v9 = IOPSDrawingUnlimitedPower();
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_powerUnlimited = v9;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      id v14 = "no";
      if (v9) {
        id v14 = "yes";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]", 0x1Eu, (uint64_t)"PowerUnlimited initial: %s\n", v10, v11, v12, v13, (uint64_t)v14);
    }
  }
}

uint64_t __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke(uint64_t a1)
{
  int v2 = IOPSDrawingUnlimitedPower();
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(unsigned __int8 *)(v3 + 364);
  *(unsigned char *)(v3 + 364) = v2;
  uint64_t result = pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (v4 == v2)
  {
    if (gLogCategory_CUSystemMonitor <= 10)
    {
      if (gLogCategory_CUSystemMonitor != -1
        || (uint64_t result = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), result))
      {
        uint64_t v10 = "no";
        if (v2) {
          uint64_t v10 = "yes";
        }
        return LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]_block_invoke", 0xAu, (uint64_t)"PowerUnlimited unchanged (%s)\n", v6, v7, v8, v9, (uint64_t)v10);
      }
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (v4) {
        uint64_t v11 = "yes";
      }
      else {
        uint64_t v11 = "no";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _powerUnlimitedMonitorStart]_block_invoke", 0x1Eu, (uint64_t)"PowerUnlimited changed: %s -> %s\n", v6, v7, v8, v9, (uint64_t)v11);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    return [v12 _invokeBlock:&__block_literal_global_274 passingTest:&__block_literal_global_276];
  }
  return result;
}

BOOL __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = [a2 powerUnlimitedChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __49__CUSystemMonitorImp__powerUnlimitedMonitorStart__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 powerUnlimitedChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

- (void)_netInterfaceMonitorStop
{
  if (self->_netInterfaceMonitor)
  {
    BOOL v3 = logger_8247();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18E2F5000, v3, OS_LOG_TYPE_DEFAULT, "NetInterface monitoring stop", v6, 2u);
    }

    [(CUNetInterfaceMonitor *)self->_netInterfaceMonitor invalidate];
    netInterfaceMonitor = self->_netInterfaceMonitor;
    self->_netInterfaceMonitor = 0;

    self->_netFlags = 0;
    self->_primaryIPv4Addr.sa.sa_family = 0;
    self->_primaryIPv6Addr.sa.sa_family = 0;
    primaryNetworkSignature = self->_primaryNetworkSignature;
    self->_primaryNetworkSignature = 0;
  }
}

- (void)_netInterfaceMonitorStart
{
  if (!self->_netInterfaceMonitor)
  {
    BOOL v3 = logger_8247();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18E2F5000, v3, OS_LOG_TYPE_DEFAULT, "NetInterface monitoring start", buf, 2u);
    }

    int v4 = objc_alloc_init(CUNetInterfaceMonitor);
    netInterfaceMonitor = self->_netInterfaceMonitor;
    self->_netInterfaceMonitor = v4;

    [(CUNetInterfaceMonitor *)self->_netInterfaceMonitor setDispatchQueue:self->_dispatchQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke;
    v10[3] = &unk_1E55BFC18;
    v10[4] = self;
    [(CUNetInterfaceMonitor *)self->_netInterfaceMonitor setFlagsChangedHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3;
    v9[3] = &unk_1E55BFC18;
    v9[4] = self;
    [(CUNetInterfaceMonitor *)self->_netInterfaceMonitor setPrimaryIPChangedHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_246;
    v8[3] = &unk_1E55BFC18;
    v8[4] = self;
    [(CUNetInterfaceMonitor *)self->_netInterfaceMonitor setPrimaryNetworkChangedHandler:v8];
    uint64_t v6 = self->_netInterfaceMonitor;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_253;
    v7[3] = &unk_1E55BFC18;
    v7[4] = self;
    [(CUNetInterfaceMonitor *)v6 activateWithCompletion:v7];
  }
}

uint64_t __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  *(_DWORD *)(*(void *)(a1 + 32) + 288) = [*(id *)(*(void *)(a1 + 32) + 280) flags];
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  int v2 = logger_8247();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSPrintF((uint64_t)"%#{flags}", v3, v4, v5, v6, v7, v8, v9, *(unsigned int *)(*(void *)(a1 + 32) + 288));
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v10;
    _os_log_impl(&dword_18E2F5000, v2, OS_LOG_TYPE_DEFAULT, "Network interface flags changed: %@", buf, 0xCu);
  }
  return [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_237 passingTest:&__block_literal_global_239];
}

uint64_t __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (_OWORD *)(v2 + 292);
  uint64_t v4 = *(void **)(v2 + 280);
  if (v4) {
    [v4 primaryIPv4Addr];
  }
  else {
    memset(buf, 0, 28);
  }
  *uint64_t v3 = *(_OWORD *)buf;
  *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)&buf[12];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (_OWORD *)(v5 + 320);
  uint64_t v7 = *(void **)(v5 + 280);
  if (v7) {
    [v7 primaryIPv6Addr];
  }
  else {
    memset(buf, 0, 28);
  }
  *uint64_t v6 = *(_OWORD *)buf;
  *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)&buf[12];
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  uint64_t v8 = logger_8247();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = NSPrintF((uint64_t)"%##a", v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32) + 292);
    uint64_t v24 = NSPrintF((uint64_t)"%##a", v17, v18, v19, v20, v21, v22, v23, *(void *)(a1 + 32) + 320);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v24;
    _os_log_impl(&dword_18E2F5000, v8, OS_LOG_TYPE_DEFAULT, "PrimaryIP changed: IPv4 %@, IPv6 %@", buf, 0x16u);
  }
  return [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_242 passingTest:&__block_literal_global_245];
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_246(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 280) primaryNetworkSignature];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 352), v2);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  uint64_t v3 = logger_8247();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_18E2F5000, v3, OS_LOG_TYPE_DEFAULT, "PrimaryNetwork changed: %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_249 passingTest:&__block_literal_global_252];
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_253(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 280) flags];
  memset(v44, 0, 28);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 280);
  if (v3
    && ([v3 primaryIPv4Addr], int v4 = *(void **)(*(void *)(a1 + 32) + 280), memset(v43, 0, 28), v4))
  {
    [v4 primaryIPv6Addr];
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 280);
  }
  else
  {
    uint64_t v5 = 0;
    memset(v43, 0, 28);
  }
  uint64_t v6 = [v5 primaryNetworkSignature];
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(v7 + 288);
  char v9 = 1;
  int v10 = SockAddrCompareAddrEx(v44, v7 + 292, 1);
  BOOL v11 = (SockAddrCompareAddrEx(v43, *(void *)(a1 + 32) + 320, 1) | v10) != 0;
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 352);
  id v13 = v6;
  id v14 = v12;
  uint64_t v15 = v14;
  if (v13 != v14)
  {
    if ((v13 == 0) == (v14 != 0)) {
      char v9 = 0;
    }
    else {
      char v9 = [v13 isEqual:v14];
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 288) = v2;
  uint64_t v16 = *(void *)(a1 + 32);
  *(_OWORD *)(v16 + 304) = *(_OWORD *)((char *)v44 + 12);
  *(_OWORD *)(v16 + 292) = v44[0];
  uint64_t v17 = (_OWORD *)(*(void *)(a1 + 32) + 320);
  *uint64_t v17 = v43[0];
  *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)((char *)v43 + 12);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 352), v6);
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  uint64_t v18 = logger_8247();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = NSPrintF((uint64_t)"%#{flags}", v19, v20, v21, v22, v23, v24, v25, *(unsigned int *)(*(void *)(a1 + 32) + 288));
    uint64_t v34 = NSPrintF((uint64_t)"%##a", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v44);
    uint64_t v42 = NSPrintF((uint64_t)"%##a", v35, v36, v37, v38, v39, v40, v41, (uint64_t)v43);
    *(_DWORD *)buf = 138413058;
    uint64_t v46 = v26;
    __int16 v47 = 2112;
    uint64_t v48 = v34;
    __int16 v49 = 2112;
    id v50 = v42;
    __int16 v51 = 2112;
    id v52 = v13;
    _os_log_impl(&dword_18E2F5000, v18, OS_LOG_TYPE_DEFAULT, "NetInterface initial: Flags %@, IPv4 %@, IPv6 %@, Sig %@", buf, 0x2Au);
  }
  if (v2 == v8)
  {
    if (!v11) {
      goto LABEL_13;
    }
LABEL_17:
    [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_262 passingTest:&__block_literal_global_264];
    if (v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_256 passingTest:&__block_literal_global_259];
  if (v11) {
    goto LABEL_17;
  }
LABEL_13:
  if ((v9 & 1) == 0) {
LABEL_14:
  }
    [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_266 passingTest:&__block_literal_global_268];
LABEL_15:
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_6(uint64_t a1, void *a2)
{
  int v2 = [a2 primaryNetworkChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_5(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 primaryNetworkChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_4(uint64_t a1, void *a2)
{
  int v2 = [a2 primaryIPChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_3_260(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 primaryIPChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_257(uint64_t a1, void *a2)
{
  int v2 = [a2 netFlagsChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_254(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 netFlagsChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_250(uint64_t a1, void *a2)
{
  int v2 = [a2 primaryNetworkChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_247(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 primaryNetworkChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2_243(uint64_t a1, void *a2)
{
  int v2 = [a2 primaryIPChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_240(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 primaryIPChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

BOOL __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = [a2 netFlagsChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __47__CUSystemMonitorImp__netInterfaceMonitorStart__block_invoke_235(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 netFlagsChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

- (void)_motionMonitorOrientationChanged:(id)a3
{
  unsigned int v8 = [a3 orientation];
  uint64_t motionOrientation = self->_motionOrientation;
  if (v8 == motionOrientation)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      if (v8 > 6) {
        uint64_t v15 = "?";
      }
      else {
        uint64_t v15 = off_1E55BECD8[v8];
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorOrientationChanged:]", 0xAu, (uint64_t)"Motion orientation unchanged: %s", v4, v5, v6, v7, (uint64_t)v15);
    }
  }
  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_uint64_t motionOrientation = v8;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      if (motionOrientation > 6) {
        id v14 = "?";
      }
      else {
        id v14 = off_1E55BECD8[motionOrientation];
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorOrientationChanged:]", 0x1Eu, (uint64_t)"Motion orientation: %s -> %s", v10, v11, v12, v13, (uint64_t)v14);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_230 passingTest:&__block_literal_global_232];
  }
}

BOOL __55__CUSystemMonitorImp__motionMonitorOrientationChanged___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = [a2 motionHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __55__CUSystemMonitorImp__motionMonitorOrientationChanged___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 motionHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

- (void)_motionMonitorHandleActivity:(id)a3
{
  id v39 = a3;
  unsigned int v4 = [v39 stationary];
  if ([v39 walking]) {
    v4 |= 2u;
  }
  if ([v39 running]) {
    v4 |= 4u;
  }
  if ([v39 automotive]) {
    v4 |= 8u;
  }
  if ([v39 cycling]) {
    uint64_t v12 = v4 | 0x10;
  }
  else {
    uint64_t v12 = v4;
  }
  uint64_t motionFlags = self->_motionFlags;
  if (v12 == motionFlags)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      uint64_t v34 = NSPrintF((uint64_t)"%#{flags}", v5, v6, v7, v8, v9, v10, v11, v12);
      [v39 confidence];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorHandleActivity:]", 0xAu, (uint64_t)"Motion unchanged: %@, confidence %s", v35, v36, v37, v38, (uint64_t)v34);
    }
  }
  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_uint64_t motionFlags = v12;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v21 = NSPrintF((uint64_t)"%#{flags}", v14, v15, v16, v17, v18, v19, v20, motionFlags);
      uint64_t v29 = NSPrintF((uint64_t)"%#{flags}", v22, v23, v24, v25, v26, v27, v28, v12);
      [v39 confidence];
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorHandleActivity:]", 0x1Eu, (uint64_t)"Motion changed: %@ -> %@, confidence %s", v30, v31, v32, v33, (uint64_t)v21);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_224 passingTest:&__block_literal_global_226];
  }
}

BOOL __51__CUSystemMonitorImp__motionMonitorHandleActivity___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = [a2 motionHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__motionMonitorHandleActivity___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    int v2 = [a2 motionHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      int v2 = v3;
    }
  }
}

- (void)_motionMonitorStop
{
  if (self->_motionActivityManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorStop]", 0x1Eu, (uint64_t)"Motion monitor stop", v2, v3, v4, v5, v9);
    }
    [(CMMotionActivityManager *)self->_motionActivityManager stopActivityUpdates];
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0;

    self->_uint64_t motionFlags = 0;
    [(CMDeviceOrientationManager *)self->_orientationManager stopDeviceOrientationUpdates];
    orientationManager = self->_orientationManager;
    self->_orientationManager = 0;

    self->_uint64_t motionOrientation = 0;
  }
}

- (void)_motionMonitorStart
{
  p_motionActivityManager = &self->_motionActivityManager;
  uint64_t v8 = self->_motionActivityManager;
  if (!*p_motionActivityManager)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorStart]", 0x1Eu, (uint64_t)"Motion monitor start", v4, v5, v6, v7, v14[0]);
    }
    id v9 = objc_alloc_init((Class)getCMMotionActivityManagerClass[0]());

    objc_storeStrong((id *)p_motionActivityManager, v9);
    id v10 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v10 setUnderlyingQueue:self->_dispatchQueue];
    motionActivityManager = self->_motionActivityManager;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__CUSystemMonitorImp__motionMonitorStart__block_invoke;
    v17[3] = &unk_1E55BEB48;
    uint64_t v8 = (CMMotionActivityManager *)v9;
    uint64_t v18 = v8;
    uint64_t v19 = self;
    [(CMMotionActivityManager *)motionActivityManager startActivityUpdatesToQueue:v10 withHandler:v17];
    id v12 = objc_alloc_init((Class)getCMDeviceOrientationManagerClass[0]());
    objc_storeStrong((id *)&self->_orientationManager, v12);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = (uint64_t)__41__CUSystemMonitorImp__motionMonitorStart__block_invoke_2;
    v14[3] = (uint64_t)&unk_1E55BEB70;
    id v15 = v12;
    uint64_t v16 = self;
    id v13 = v12;
    [v13 startDeviceOrientationUpdatesToQueue:v10 withHandler:v14];
  }
}

void *__41__CUSystemMonitorImp__motionMonitorStart__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[30]) {
    return (void *)[result _motionMonitorHandleActivity:a2];
  }
  return result;
}

void __41__CUSystemMonitorImp__motionMonitorStart__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 272))
  {
    id v13 = v19;
    if (v13)
    {
      [*(id *)(a1 + 40) _motionMonitorOrientationChanged:v13];
    }
    else if (gLogCategory_CUSystemMonitor <= 90 {
           && (gLogCategory_CUSystemMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      uint64_t v14 = NSPrintF((uint64_t)"%{error}", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _motionMonitorStart]_block_invoke_2", 0x5Au, (uint64_t)"### Motion orientation failed: %@", v15, v16, v17, v18, (uint64_t)v14);
    }
  }
}

- (void)_meDeviceUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 findMyIdentifier];
  uint64_t v6 = [v4 idsID];
  uint64_t v7 = [v4 name];
  char v8 = [v4 isThisDevice];

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceUpdate:]", 0x1Eu, (uint64_t)"MeDevice updated: fml=<%.8@>, ids=<%.8@>, name='%@', isThisDevice=%s", v9, v10, v11, v12, (uint64_t)v5);
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  self->_meDeviceFMFDeviceID = v5;
  uint64_t v14 = v5;

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  self->_meDeviceIDSDeviceID = v6;
  uint64_t v16 = v6;

  meDeviceName = self->_meDeviceName;
  self->_meDeviceName = v7;

  self->_meDeviceIsMe = v8;
  self->_meDeviceValid = 1;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_212 passingTest:&__block_literal_global_214];
}

BOOL __38__CUSystemMonitorImp__meDeviceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 meDeviceChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __38__CUSystemMonitorImp__meDeviceUpdate___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 meDeviceChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

BOOL __64__CUSystemMonitorImp__meDeviceCheckCompletion_error_firstCheck___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 meDeviceChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __64__CUSystemMonitorImp__meDeviceCheckCompletion_error_firstCheck___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 meDeviceChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_meDeviceMonitorStopFMF
{
  int meDeviceChangedToken = self->_meDeviceChangedToken;
  if (meDeviceChangedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_7;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStopFMF]", 0x1Eu, (uint64_t)"MeDevice monitoring stop\n", v2, v3, v4, v5, v13);
    }
    int meDeviceChangedToken = self->_meDeviceChangedToken;
    if (meDeviceChangedToken != -1)
    {
LABEL_7:
      notify_cancel(meDeviceChangedToken);
      self->_int meDeviceChangedToken = -1;
    }
  }
  int fmfDevicesChangedToken = self->_fmfDevicesChangedToken;
  if (fmfDevicesChangedToken != -1)
  {
    notify_cancel(fmfDevicesChangedToken);
    self->_int fmfDevicesChangedToken = -1;
  }
  meDeviceRetryTimer = self->_meDeviceRetryTimer;
  if (meDeviceRetryTimer)
  {
    uint64_t v10 = meDeviceRetryTimer;
    dispatch_source_cancel(v10);
    uint64_t v11 = self->_meDeviceRetryTimer;
    self->_meDeviceRetryTimer = 0;
  }
  int meDeviceRetryToken = self->_meDeviceRetryToken;
  if (meDeviceRetryToken != -1)
  {
    notify_cancel(meDeviceRetryToken);
    self->_int meDeviceRetryToken = -1;
  }
}

- (void)_meDeviceMonitorStop
{
  if (self->_meDeviceFindMyLocateMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStop]", 0x1Eu, (uint64_t)"MeDevice monitoring stop (FML)", v2, v3, v4, v5, v11);
    }
    [(CUFindMyLocateMeDeviceMonitor *)self->_meDeviceFindMyLocateMonitor invalidate];
    meDeviceFindMyLocateMonitor = self->_meDeviceFindMyLocateMonitor;
    self->_meDeviceFindMyLocateMonitor = 0;
  }
  meDeviceFMFDeviceID = self->_meDeviceFMFDeviceID;
  self->_meDeviceFMFDeviceID = 0;

  meDeviceIDSDeviceID = self->_meDeviceIDSDeviceID;
  self->_meDeviceIDSDeviceID = 0;

  meDeviceName = self->_meDeviceName;
  self->_meDeviceName = 0;

  *(_WORD *)&self->_meDeviceIsMe = 0;
  [(CUSystemMonitorImp *)self _meDeviceMonitorStopFMF];
}

- (void)_meDeviceMonitorStart
{
  if ((self->_meDeviceUseFindMyLocate
     || (BOOL v3 = -[CUSystemMonitorImp _hasMonitorPassingTest:](self, "_hasMonitorPassingTest:", &__block_literal_global_182), self->_meDeviceUseFindMyLocate = v3, v3))&& [(Class)getCUFindMyLocateMeDeviceMonitorClass[0]() supported])
  {
    [(CUSystemMonitorImp *)self _meDeviceMonitorStopFMF];
    if (!self->_meDeviceFindMyLocateMonitor)
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]", 0x1Eu, (uint64_t)"MeDevice monitoring start (FML)", v4, v5, v6, v7, v21[0]);
      }
      uint64_t v14 = (CUFindMyLocateMeDeviceMonitor *)[objc_alloc((Class)getCUFindMyLocateMeDeviceMonitorClass[0]()) initWithDispatchQueue:self->_dispatchQueue];
      meDeviceFindMyLocateMonitor = self->_meDeviceFindMyLocateMonitor;
      self->_meDeviceFindMyLocateMonitor = v14;

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_2;
      v24[3] = &unk_1E55BEAF8;
      v24[4] = self;
      [(CUFindMyLocateMeDeviceMonitor *)self->_meDeviceFindMyLocateMonitor setMeDeviceUpdatedHandler:v24];
      [(CUFindMyLocateMeDeviceMonitor *)self->_meDeviceFindMyLocateMonitor activate];
    }
  }
  else
  {
    if (self->_meDeviceChangedToken == -1)
    {
      getFMFMeDeviceChangedNotification();
      id v8 = objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (const char *)[v8 UTF8String];

      if (!v9) {
        return;
      }
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]", 0x1Eu, (uint64_t)"MeDevice monitoring start\n", v10, v11, v12, v13, v21[0]);
      }
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_3;
      handler[3] = &unk_1E55BF010;
      handler[4] = self;
      notify_register_dispatch(v9, &self->_meDeviceChangedToken, dispatchQueue, handler);
      [(CUSystemMonitorImp *)self _meDeviceCheckStart:1];
    }
    if (self->_fmfDevicesChangedToken == -1)
    {
      getFMFDevicesChangedNotification();
      id v17 = objc_claimAutoreleasedReturnValue();
      uint64_t v18 = (const char *)[v17 UTF8String];

      if (!v18) {
        return;
      }
      id v19 = self->_dispatchQueue;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_4;
      v22[3] = &unk_1E55BF010;
      v22[4] = self;
      notify_register_dispatch(v18, &self->_fmfDevicesChangedToken, v19, v22);
    }
    if (self->_meDeviceRetryToken == -1)
    {
      uint64_t v20 = self->_dispatchQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = (uint64_t)__43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_5;
      v21[3] = (uint64_t)&unk_1E55BF010;
      v21[4] = (uint64_t)self;
      notify_register_dispatch("com.apple.siri.personal.requests.companion.update", &self->_meDeviceRetryToken, v20, v21);
    }
  }
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _meDeviceUpdate:a2];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_3", 0x1Eu, (uint64_t)"MeDevice me device changed\n", a5, a6, a7, a8, v11);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 _meDeviceCheckStart:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_4", 0x1Eu, (uint64_t)"MeDevice device list changed\n", a5, a6, a7, a8, v11);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 _meDeviceCheckStart:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _meDeviceMonitorStart]_block_invoke_5", 0x1Eu, (uint64_t)"MeDevice device retry notification\n", a5, a6, a7, a8, v11);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 _meDeviceCheckStart:0];
}

uint64_t __43__CUSystemMonitorImp__meDeviceMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  return [a2 meDeviceUseFindMyLocate];
}

- (void)_manatreeUpdateRetryTimer:(BOOL)a3
{
  BOOL v8 = a3;
  manateeRetryTimer = self->_manateeRetryTimer;
  if (manateeRetryTimer)
  {
    if (gLogCategory_CUSystemMonitor >= 31)
    {
      uint64_t v11 = manateeRetryTimer;
LABEL_8:
      dispatch_source_cancel(v11);
      uint64_t v12 = self->_manateeRetryTimer;
      self->_manateeRetryTimer = 0;

      goto LABEL_9;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]", 0x1Eu, (uint64_t)"Manatee retry timer cancel", v4, v5, v6, v7, v23);
    }
    uint64_t v11 = self->_manateeRetryTimer;
    if (v11) {
      goto LABEL_8;
    }
  }
LABEL_9:
  if (v8)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v13 = NSPrintF((uint64_t)"%{dur}", (uint64_t)a2, a3, v3, v4, v5, v6, v7, 300);
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]", 0x1Eu, (uint64_t)"Manatee retry timer start: %@", v14, v15, v16, v17, (uint64_t)v13);
    }
    uint64_t v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    id v19 = self->_manateeRetryTimer;
    self->_manateeRetryTimer = v18;

    uint64_t v20 = self->_manateeRetryTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__CUSystemMonitorImp__manatreeUpdateRetryTimer___block_invoke;
    handler[3] = &unk_1E55BFC18;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    uint64_t v21 = self->_manateeRetryTimer;
    dispatch_time_t v22 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)self->_manateeRetryTimer);
  }
}

uint64_t __48__CUSystemMonitorImp__manatreeUpdateRetryTimer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manatreeUpdateRetryTimer:]_block_invoke", 0x1Eu, (uint64_t)"Manatee retry timer fired", a5, a6, a7, a8, v14);
  }
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(result + 160);
  if (v10)
  {
    uint64_t v11 = v10;
    dispatch_source_cancel(v11);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 160);
    *(void *)(v12 + 160) = 0;

    uint64_t result = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(result + 156))
  {
    return [(id)result _manateeRead];
  }
  return result;
}

- (void)_forceManateeStateRefresh
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CUSystemMonitorImp__forceManateeStateRefresh__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

unsigned char *__47__CUSystemMonitorImp__forceManateeStateRefresh__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[156]) {
    return (unsigned char *)[result _manateeRead];
  }
  return result;
}

- (void)_manateeRead
{
  if (_manateeRead_sOnce != -1) {
    dispatch_once(&_manateeRead_sOnce, &__block_literal_global_170);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_2;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async((dispatch_queue_t)_manateeRead_cdpQueue, block);
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(getCDPStateControllerClass());
  uint64_t v3 = [(objc_class *)getCDPContextClass() contextForPrimaryAccount];
  uint64_t v4 = (void *)[v2 initWithContext:v3];

  id v12 = 0;
  LOBYTE(v3) = [v4 isManateeAvailable:&v12];
  id v5 = v12;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_3;
  v9[3] = &unk_1E55BEAD0;
  v9[4] = v6;
  id v10 = v5;
  char v11 = (char)v3;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_3(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__CUSystemMonitorImp__manateeRead__block_invoke_4;
  aBlock[3] = &unk_1E55BF170;
  id v2 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v30 = v2;
  uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 156))
  {
    int v11 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned char *)(a1 + 48)) {
      int v12 = 2;
    }
    else {
      int v12 = 1;
    }
    if (*(_DWORD *)(v10 + 152) == v12)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        uint64_t v14 = 30;
      }
      else {
        uint64_t v14 = 10;
      }
      if ((int)v14 >= gLogCategory_CUSystemMonitor)
      {
        if (gLogCategory_CUSystemMonitor == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, v14)) {
            goto LABEL_31;
          }
          uint64_t v13 = *(void *)(a1 + 40);
        }
        id v19 = NSPrintF((uint64_t)"%{error}", v14, v3, v4, v5, v6, v7, v8, v13);
        uint64_t v20 = "Available";
        if (!v11) {
          uint64_t v20 = "Unavailable";
        }
        if (v13) {
          unsigned int v21 = 30;
        }
        else {
          unsigned int v21 = 10;
        }
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeRead]_block_invoke_3", v21, (uint64_t)"Manatee State unchanged: %s, error=%@", v15, v16, v17, v18, (uint64_t)v20);
      }
    }
    else
    {
      pthread_mutex_lock(&gCUSystemMonitorLock);
      *(unsigned char *)(*(void *)(a1 + 32) + 148) = *(unsigned char *)(a1 + 48);
      if (*(unsigned char *)(a1 + 48)) {
        int v22 = 2;
      }
      else {
        int v22 = 1;
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 152) = v22;
      pthread_mutex_unlock(&gCUSystemMonitorLock);
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        uint64_t v27 = *(unsigned int *)(*(void *)(a1 + 32) + 152);
        if (v27 > 2) {
          uint64_t v28 = "?";
        }
        else {
          uint64_t v28 = off_1E55BECA8[v27];
        }
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeRead]_block_invoke_3", 0x1Eu, (uint64_t)"Manatee read: %s, %{error}\n", v23, v24, v25, v26, (uint64_t)v28);
      }
      [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_175 passingTest:&__block_literal_global_177];
    }
  }
LABEL_31:
  v9[2](v9);
}

uint64_t __34__CUSystemMonitorImp__manateeRead__block_invoke_4(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (v2[156]) {
    BOOL v3 = *(void *)(a1 + 40) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  return [v2 _manatreeUpdateRetryTimer:v3];
}

BOOL __34__CUSystemMonitorImp__manateeRead__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 manateeChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __34__CUSystemMonitorImp__manateeRead__block_invoke_5(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    id v2 = [a2 manateeChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      id v2 = v3;
    }
  }
}

uint64_t __34__CUSystemMonitorImp__manateeRead__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("CUSystemMonitor-CDP", 0);
  uint64_t v1 = _manateeRead_cdpQueue;
  _manateeRead_cdpQueue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_manateeMonitorStop
{
  if (self->_manateeObserving)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeMonitorStop]", 0x1Eu, (uint64_t)"Manatee monitoring stop\n", v2, v3, v4, v5, v11);
    }
    uint64_t v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v8 = [NSString stringWithUTF8String:getCDPManateeAvailabilityNotification()];
    [v7 removeObserver:self name:v8 object:0];
    self->_manateeObserving = 0;
  }
  manateeRetryTimer = self->_manateeRetryTimer;
  if (manateeRetryTimer)
  {
    int v12 = manateeRetryTimer;
    dispatch_source_cancel(v12);
    uint64_t v10 = self->_manateeRetryTimer;
    self->_manateeRetryTimer = 0;
  }
}

- (void)_manateeMonitorStart
{
  if (!self->_manateeObserving)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _manateeMonitorStart]", 0x1Eu, (uint64_t)"Manatee monitoring start\n", v2, v3, v4, v5, v8);
    }
    id v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v7 = [NSString stringWithUTF8String:getCDPManateeAvailabilityNotification()];
    [v9 addObserver:self selector:sel__manateeChanged_ name:v7 object:0];
    self->_manateeObserving = 1;
    [(CUSystemMonitorImp *)self _manateeRead];
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v17 = a4;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v7 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v7)
  {
    id v9 = [v17 _placeInference];
    uint64_t v10 = [v9 userType];
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      unint64_t v11 = v10;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v11 > 4) {
          int v12 = "?";
        }
        else {
          int v12 = off_1E55BEC80[v11];
        }
        [v9 confidence];
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didVisit:]", 0x1Eu, (uint64_t)"Location visited: %s, confidence %f", v13, v14, v15, v16, (uint64_t)v12);
      }
    }
    [(CUSystemMonitorImp *)self _locationVisitUpdate:v17 arrived:1];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v13 = a4;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v7 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v7
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didFailWithError:]", 0x1Eu, (uint64_t)"Location visit failed: %{error}", v9, v10, v11, v12, (uint64_t)v13);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    uint64_t v5 = [v10 count];
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didUpdateLocations:]", 0x1Eu, (uint64_t)"Location updated locations: %d", v6, v7, v8, v9, v5);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v11 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = v11;
  if (self->_locationManager == v11 && gLogCategory_CUSystemMonitor <= 30)
  {
    if (gLogCategory_CUSystemMonitor != -1
      || (uint64_t v4 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu), v5 = v11, v4))
    {
      uint64_t v6 = [(CLLocationManager *)v5 authorizationStatus];
      uint64_t v4 = LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManagerDidChangeAuthorization:]", 0x1Eu, (uint64_t)"Location authorization changed: %d", v7, v8, v9, v10, v6);
      uint64_t v5 = v11;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)locationManager:(id)a3 didDepart:(id)a4 completion:(id)a5
{
  id v20 = a4;
  uint64_t v8 = (void (**)(void))a5;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v10 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v10)
  {
    uint64_t v12 = [v20 _placeInference];
    uint64_t v13 = [v12 userType];
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      unint64_t v14 = v13;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v14 > 4) {
          uint64_t v15 = "?";
        }
        else {
          uint64_t v15 = off_1E55BEC80[v14];
        }
        [v12 confidence];
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didDepart:completion:]", 0x1Eu, (uint64_t)"Location visit departed: %s, confidence %f", v16, v17, v18, v19, (uint64_t)v15);
      }
    }
    [(CUSystemMonitorImp *)self _locationVisitUpdate:v20 arrived:0];
    v8[2](v8);
  }
  else
  {
    v8[2](v8);
  }
}

- (void)locationManager:(id)a3 didArrive:(id)a4 completion:(id)a5
{
  id v20 = a4;
  uint64_t v8 = (void (**)(void))a5;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v10 = (CLLocationManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  locationManager = self->_locationManager;

  if (locationManager == v10)
  {
    uint64_t v12 = [v20 _placeInference];
    uint64_t v13 = [v12 userType];
    if (gLogCategory_CUSystemMonitor <= 30)
    {
      unint64_t v14 = v13;
      if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))
      {
        if (v14 > 4) {
          uint64_t v15 = "?";
        }
        else {
          uint64_t v15 = off_1E55BEC80[v14];
        }
        [v12 confidence];
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp locationManager:didArrive:completion:]", 0x1Eu, (uint64_t)"Location visit arrived: %s, confidence %f", v16, v17, v18, v19, (uint64_t)v15);
      }
    }
    [(CUSystemMonitorImp *)self _locationVisitUpdate:v20 arrived:1];
    v8[2](v8);
  }
  else
  {
    v8[2](v8);
  }
}

- (void)_locationVisitUpdate:(id)a3 arrived:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = [a3 _placeInference];
  uint64_t v6 = [v20 userType];
  if ((unint64_t)(v6 - 1) > 3) {
    int v11 = 0;
  }
  else {
    int v11 = dword_18E416FB0[v6 - 1];
  }
  uint64_t locationVisitsFlags = self->_locationVisitsFlags;
  unsigned int v13 = locationVisitsFlags | v11;
  unsigned int v14 = locationVisitsFlags & ~v11;
  if (v4) {
    unsigned int v15 = v13;
  }
  else {
    unsigned int v15 = v14;
  }
  if (v15 == locationVisitsFlags)
  {
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitUpdate:arrived:]", 0xAu, (uint64_t)"Location visit unchanged: %#{flags}", v7, v8, v9, v10, locationVisitsFlags);
    }
  }
  else
  {
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_uint64_t locationVisitsFlags = v15;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitUpdate:arrived:]", 0x1Eu, (uint64_t)"Location visit changed: %#{flags} -> %#{flags}\n", v16, v17, v18, v19, locationVisitsFlags);
    }
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_154 passingTest:&__block_literal_global_156];
  }
}

BOOL __51__CUSystemMonitorImp__locationVisitUpdate_arrived___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 locationVisitsChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__locationVisitUpdate_arrived___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 locationVisitsChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_locationVisitsMonitorStop
{
  BOOL v3 = self->_locationManager;
  if (v3)
  {
    uint64_t v10 = v3;
    locationManager = self->_locationManager;
    self->_locationManager = 0;

    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStop]", 0x1Eu, (uint64_t)"Location visit monitoring stop", v5, v6, v7, v8, v9);
    }
    [(CLLocationManager *)v10 stopMonitoringVisits];
    pthread_mutex_lock(&gCUSystemMonitorLock);
    self->_uint64_t locationVisitsFlags = 0;
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    BOOL v3 = v10;
  }
}

- (void)_locationVisitsMonitorStart
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_locationManager = &self->_locationManager;
  BOOL v4 = self->_locationManager;
  if (!v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = self->_monitors;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) locationVisitsBundle];
          if (v10)
          {
            unsigned int v15 = (void *)v10;

            if (gLogCategory_CUSystemMonitor <= 30
              && (gLogCategory_CUSystemMonitor != -1
               || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
            {
              getkCLLocationAccuracyHundredMeters[0]();
              LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStart]", 0x1Eu, (uint64_t)"Location visit monitoring start: %f", v16, v17, v18, v19, v20);
            }
            BOOL v4 = (CLLocationManager *)[objc_alloc((Class)getCLLocationManagerClass[0]()) initWithEffectiveBundle:v15 delegate:self onQueue:self->_dispatchQueue];
            objc_storeStrong((id *)p_locationManager, v4);
            getkCLLocationAccuracyHundredMeters[0]();
            -[CLLocationManager setDesiredAccuracy:](v4, "setDesiredAccuracy:");
            [(CLLocationManager *)v4 startMonitoringVisits];

            goto LABEL_20;
          }
        }
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    if (gLogCategory_CUSystemMonitor <= 90
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _locationVisitsMonitorStart]", 0x5Au, (uint64_t)"### Location visit no bundle", v11, v12, v13, v14, v21);
    }
    BOOL v4 = 0;
  }
LABEL_20:
}

- (void)_familyUpdated:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CUSystemMonitorImp__familyUpdated___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__CUSystemMonitorImp__familyUpdated___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 112))
  {
    uint64_t v8 = result;
    if (*(void *)(result + 40)
      && gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyUpdated:]_block_invoke", 0x1Eu, (uint64_t)"Family updated\n", a5, a6, a7, a8, v10);
    }
    uint64_t v9 = *(void **)(v8 + 32);
    return [v9 _familyGetMembers:0];
  }
  return result;
}

- (void)_familyNetworkChanged
{
  familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
  if (familyPrimaryIPMonitor && self->_familyFailed)
  {
    memset(v10, 0, sizeof(v10));
    int v11 = 0;
    [(CUSystemMonitor *)familyPrimaryIPMonitor primaryIPv4Addr];
    id v4 = self->_familyPrimaryIPMonitor;
    if (v4) {
      [(CUSystemMonitor *)v4 primaryIPv6Addr];
    }
    if (BYTE1(v10[0]) == 2)
    {
      uint64_t v5 = [(CUSystemMonitorImp *)self _primaryAppleIDAccount];

      if (v5)
      {
        if (gLogCategory_CUSystemMonitor <= 30
          && (gLogCategory_CUSystemMonitor != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyNetworkChanged]", 0x1Eu, (uint64_t)"Family retry on network change: IPv4 %##a, IPv6 %##a\n", v6, v7, v8, v9, (uint64_t)v10);
        }
        [(CUSystemMonitorImp *)self _familyGetMembers:0];
      }
    }
  }
}

- (void)_familyGetMembers:(BOOL)a3
{
  BOOL v7 = a3;
  if (SetupAssistantLibrary_sOnce != -1) {
    dispatch_once(&SetupAssistantLibrary_sOnce, &__block_literal_global_1188);
  }
  if (SetupAssistantLibrary_sLib
    && dlsym((void *)SetupAssistantLibrary_sLib, "BYSetupAssistantNeedsToRun")
    && softLinkBYSetupAssistantNeedsToRun[0]())
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]", 0x1Eu, (uint64_t)"Family get members skipped when setup needs to run\n", v3, v4, v5, v6, v14);
    }
  }
  else
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      uint64_t v9 = "";
      if (v7) {
        uint64_t v9 = "(first)";
      }
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]", 0x1Eu, (uint64_t)"Family get members %s\n", v3, v4, v5, v6, (uint64_t)v9);
    }
    self->_familyFailed = 0;
    id v10 = objc_alloc_init((Class)getFAFetchFamilyCircleRequestClass[0]());
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__CUSystemMonitorImp__familyGetMembers___block_invoke;
    v11[3] = &unk_1E55BEAA8;
    v11[4] = self;
    BOOL v12 = v7;
    [v10 startRequestWithCompletionHandler:v11];
  }
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__CUSystemMonitorImp__familyGetMembers___block_invoke_2;
  v11[3] = &unk_1E55BEE78;
  v11[4] = v7;
  id v12 = v6;
  id v13 = v5;
  char v14 = *(unsigned char *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v8 + 128) == -1) {
    return;
  }
  *(unsigned char *)(v8 + 100) = *(void *)(a1 + 40) != 0;
  uint64_t v10 = *(void *)(a1 + 40);
  if (!v10)
  {
    int v11 = [*(id *)(a1 + 48) members];
    id v12 = (void *)[v11 copy];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          getFAFamilyMemberClass[0]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (gLogCategory_CUSystemMonitor <= 90
              && (gLogCategory_CUSystemMonitor != -1
               || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au)))
            {
              LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2", 0x5Au, (uint64_t)"### Family bad member type: %@\n", v19, v20, v21, v22, v18);
            }

            goto LABEL_33;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (*(unsigned char *)(a1 + 56))
    {
      if (gLogCategory_CUSystemMonitor <= 30
        && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
      {
        long long v23 = "Family initial: %d family member(s)\n";
LABEL_26:
        uint64_t v24 = [v13 count];
        LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2", 0x1Eu, (uint64_t)v23, v25, v26, v27, v28, v24);
      }
    }
    else if (gLogCategory_CUSystemMonitor <= 30 {
           && (gLogCategory_CUSystemMonitor != -1
    }
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      long long v23 = "Family updated: %d family member(s)\n";
      goto LABEL_26;
    }
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v12);
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_142 passingTest:&__block_literal_global_144];
LABEL_33:

    return;
  }
  if (gLogCategory_CUSystemMonitor > 90) {
    return;
  }
  if (gLogCategory_CUSystemMonitor != -1) {
    goto LABEL_5;
  }
  if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x5Au))
  {
    uint64_t v10 = *(void *)(a1 + 40);
LABEL_5:
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyGetMembers:]_block_invoke_2", 0x5Au, (uint64_t)"### Family get members failed: %{error}\n", a5, a6, a7, a8, v10);
  }
}

BOOL __40__CUSystemMonitorImp__familyGetMembers___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 familyUpdatedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __40__CUSystemMonitorImp__familyGetMembers___block_invoke_3(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 familyUpdatedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_familyMonitorStop
{
  self->_familyFailed = 0;
  [(CUSystemMonitor *)self->_familyPrimaryIPMonitor invalidate];
  familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
  self->_familyPrimaryIPMonitor = 0;

  int familyBuddyToken = self->_familyBuddyToken;
  if (familyBuddyToken != -1)
  {
    notify_cancel(familyBuddyToken);
    self->_int familyBuddyToken = -1;
  }
  int familyUpdatedToken = self->_familyUpdatedToken;
  if (familyUpdatedToken != -1)
  {
    if (gLogCategory_CUSystemMonitor > 30) {
      goto LABEL_9;
    }
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStop]", 0x1Eu, (uint64_t)"Family monitoring stop\n", v4, v5, v6, v7, v10);
    }
    int familyUpdatedToken = self->_familyUpdatedToken;
    if (familyUpdatedToken != -1)
    {
LABEL_9:
      notify_cancel(familyUpdatedToken);
      self->_int familyUpdatedToken = -1;
    }
  }
}

- (void)_familyMonitorStart
{
  if (!self->_familyPrimaryIPMonitor)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]", 0x1Eu, (uint64_t)"Family monitoring start\n", v2, v3, v4, v5, v13[0]);
    }
    uint64_t v7 = objc_alloc_init(CUSystemMonitor);
    familyPrimaryIPMonitor = self->_familyPrimaryIPMonitor;
    self->_familyPrimaryIPMonitor = v7;

    [(CUSystemMonitor *)self->_familyPrimaryIPMonitor setDispatchQueue:self->_dispatchQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke;
    v16[3] = &unk_1E55BFC18;
    v16[4] = self;
    [(CUSystemMonitor *)self->_familyPrimaryIPMonitor setPrimaryIPChangedHandler:v16];
    id v9 = self->_familyPrimaryIPMonitor;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_2;
    v15[3] = &unk_1E55BFC18;
    v15[4] = self;
    [(CUSystemMonitor *)v9 activateWithCompletion:v15];
  }
  if (self->_familyBuddyToken == -1)
  {
    uint64_t v10 = (const char *)[ (id) getBYSetupAssistantFinishedDarwinNotification[0]() UTF8String];
    if (v10)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_3;
      handler[3] = &unk_1E55BF010;
      handler[4] = self;
      notify_register_dispatch(v10, &self->_familyBuddyToken, dispatchQueue, handler);
    }
  }
  if (self->_familyUpdatedToken == -1)
  {
    id v12 = self->_dispatchQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = (uint64_t)__41__CUSystemMonitorImp__familyMonitorStart__block_invoke_4;
    v13[3] = (uint64_t)&unk_1E55BF010;
    v13[4] = (uint64_t)self;
    notify_register_dispatch("com.apple.family.family_updated", &self->_familyUpdatedToken, v12, v13);
    [(CUSystemMonitorImp *)self _familyGetMembers:1];
  }
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _familyNetworkChanged];
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _familyNetworkChanged];
}

void *__41__CUSystemMonitorImp__familyMonitorStart__block_invoke_3(uint64_t a1, int token)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    uint64_t state64 = 0;
    notify_get_state(token, &state64);
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]_block_invoke_3", 0x1Eu, (uint64_t)"Family setup state changed: %llu\n", v4, v5, v6, v7, state64);
  }
  uint64_t result = *(void **)(a1 + 32);
  if (!result[13]) {
    return (void *)[result _familyGetMembers:0];
  }
  return result;
}

uint64_t __41__CUSystemMonitorImp__familyMonitorStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _familyMonitorStart]_block_invoke_4", 0x1Eu, (uint64_t)"Family updated\n", a5, a6, a7, a8, v11);
  }
  id v9 = *(void **)(a1 + 32);
  return [v9 _familyGetMembers:0];
}

- (int)_connectedCallCountUnached
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(CXCallObserver *)self->_callObserver calls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 hasConnected]) {
          v5 += [v8 hasEnded] ^ 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (unsigned)_callFlagsUncached
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(TUCallCenter *)self->_callCenter currentAudioAndVideoCalls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) service];
        switch(v8)
        {
          case 3:
            v5 |= 4u;
            break;
          case 2:
            v5 |= 2u;
            break;
          case 1:
            v5 |= 1u;
            break;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (int)_activeCallCountUnached
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(CXCallObserver *)self->_callObserver calls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) hasEnded] ^ 1;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- ($A3B2E143E1A03423F9FC703C010436DC)_callInfoUncached
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = [(TUCallCenter *)self->_callCenter currentAudioAndVideoCalls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  unint64_t v4 = 0;
  if (v3)
  {
    LODWORD(v5) = 0;
    LODWORD(v6) = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v2);
        }
        long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v10 = [v9 isConnected];
        int v11 = [v9 isOutgoing];
        uint64_t v6 = v6 + (v10 & (v11 ^ 1));
        uint64_t v5 = v5 + ((v10 | v11) ^ 1);
        unint64_t v12 = (v4 + 1) | v4 & 0xFFFFFFFF00000000;
        if ((v10 & v11) == 0) {
          unint64_t v12 = v4;
        }
        unint64_t v13 = v4 & 0xFFFFFFFF00000000 | v12;
        if (v10 | v11 ^ 1) {
          unint64_t v4 = v12;
        }
        else {
          unint64_t v4 = v13 + 0x100000000;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
    uint64_t v3 = v5 << 32;
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v14 = v3 | v6;
  unint64_t v15 = v4;
  result.var2 = v15;
  result.var3 = HIDWORD(v15);
  result.var0 = v14;
  result.var1 = HIDWORD(v14);
  return result;
}

- (void)_callInfoChanged
{
  uint64_t v3 = [(CUSystemMonitorImp *)self _activeCallCountUnached];
  uint64_t v4 = [(CUSystemMonitorImp *)self _connectedCallCountUnached];
  uint64_t v5 = [(CUSystemMonitorImp *)self _callFlagsUncached];
  int callCountIncomingUnconnected = self->_callInfo.callCountIncomingUnconnected;
  int callCountOutgoingUnconnected = self->_callInfo.callCountOutgoingUnconnected;
  int callCountOutgoingConnected = self->_callInfo.callCountOutgoingConnected;
  uint64_t callCountIncomingConnected = self->_callInfo.callCountIncomingConnected;
  uint64_t v8 = [(CUSystemMonitorImp *)self _callInfoUncached];
  uint64_t v10 = v9;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  uint64_t connectedCallCount = self->_connectedCallCount;
  uint64_t activeCallCount = self->_activeCallCount;
  uint64_t v28 = v4;
  uint64_t callFlags = self->_callFlags;
  self->_uint64_t connectedCallCount = v4;
  self->_uint64_t activeCallCount = v3;
  self->_uint64_t callFlags = v5;
  uint64_t v31 = v5;
  *(void *)&self->_callInfo.uint64_t callCountIncomingConnected = v8;
  *(void *)&self->_callInfo.int callCountOutgoingConnected = v10;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  BOOL v25 = v3 != activeCallCount;
  if (v3 == activeCallCount)
  {
    int v16 = callCountIncomingUnconnected;
    int v18 = callCountOutgoingConnected;
    uint64_t v17 = callCountIncomingConnected;
    if (gLogCategory_CUSystemMonitor <= 10
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Active calls unchanged (%d)\n", v12, v13, v14, v15, v3);
    }
  }
  else
  {
    int v16 = callCountIncomingUnconnected;
    int v18 = callCountOutgoingConnected;
    uint64_t v17 = callCountIncomingConnected;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Active calls changed: %d -> %d\n", v12, v13, v14, v15, activeCallCount);
    }
  }
  int v19 = gLogCategory_CUSystemMonitor;
  if (__PAIR64__(v16, v17) == v8 && __PAIR64__(callCountOutgoingUnconnected, v18) == v10)
  {
    uint64_t v21 = v28;
    uint64_t v20 = callFlags;
    if (gLogCategory_CUSystemMonitor > 10)
    {
      uint64_t v23 = v31;
      uint64_t v22 = connectedCallCount;
      int v24 = v25;
      goto LABEL_26;
    }
    uint64_t v22 = connectedCallCount;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Call info unchanged: incoming connected %d, incoming unconnected %d, outcoming connected %d, outcoming unconnected %d", v12, v13, v14, v15, v17);
    }
    uint64_t v23 = v31;
    int v24 = v25;
  }
  else
  {
    if (gLogCategory_CUSystemMonitor > 30)
    {
      int v24 = 1;
      uint64_t v23 = v31;
      uint64_t v21 = v28;
      uint64_t v20 = callFlags;
      uint64_t v22 = connectedCallCount;
      goto LABEL_26;
    }
    uint64_t v22 = connectedCallCount;
    if (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Call info changed: incoming connected %d -> %d, incoming unconnected %d -> %d, outcoming connected %d -> %d, outcoming unconnected %d -> %d", v12, v13, v14, v15, v17);
    }
    int v24 = 1;
    uint64_t v23 = v31;
    uint64_t v21 = v28;
    uint64_t v20 = callFlags;
  }
  int v19 = gLogCategory_CUSystemMonitor;
LABEL_26:
  if (v21 == v22)
  {
    if (v19 <= 10 && (v19 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu))) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Connected calls unchanged (%d)\n", v12, v13, v14, v15, v21);
    }
  }
  else
  {
    if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu))) {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Connected calls changed: %d -> %d\n", v12, v13, v14, v15, v22);
    }
    int v24 = 1;
  }
  if (v23 != v20)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0x1Eu, (uint64_t)"Call flags changed: %#{flags} -> %#{flags}\n", v12, v13, v14, v15, v20);
    }
    goto LABEL_48;
  }
  if (gLogCategory_CUSystemMonitor <= 10
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callInfoChanged]", 0xAu, (uint64_t)"Call flags unchanged: %#{flags}\n", v12, v13, v14, v15, v23);
  }
  if (v24)
  {
LABEL_48:
    [(CUSystemMonitorImp *)self _invokeBlock:&__block_literal_global_122 passingTest:&__block_literal_global_124];
  }
}

BOOL __38__CUSystemMonitorImp__callInfoChanged__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 callChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __38__CUSystemMonitorImp__callInfoChanged__block_invoke(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 callChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v12 = a3;
  id v10 = a4;
  if (self->_callObserver)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp callObserver:callChanged:]", 0x1Eu, (uint64_t)"CallKit changed\n", v6, v7, v8, v9, v11);
    }
    [(CUSystemMonitorImp *)self _callInfoChanged];
  }
}

- (void)_callCenterStatusChanged:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CUSystemMonitorImp__callCenterStatusChanged___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__CUSystemMonitorImp__callCenterStatusChanged___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 88))
  {
    uint64_t v8 = result;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callCenterStatusChanged:]_block_invoke", 0x1Eu, (uint64_t)"TUCallCenter changed\n", a5, a6, a7, a8, v10);
    }
    uint64_t v9 = *(void **)(v8 + 32);
    return [v9 _callInfoChanged];
  }
  return result;
}

- (void)_callMonitorStop
{
  if (self->_callObserver
    && gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callMonitorStop]", 0x1Eu, (uint64_t)"Call monitoring stop\n", v2, v3, v4, v5, v16);
  }
  [(CXCallObserver *)self->_callObserver setDelegate:0 queue:self->_dispatchQueue];
  callObserver = self->_callObserver;
  self->_callObserver = 0;

  callCenter = self->_callCenter;
  self->_callCenter = 0;

  if (self->_callStatusObserving)
  {
    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = getTUCallCenterCallStatusChangedNotification[0]();

    if (v9)
    {
      uint64_t v10 = getTUCallCenterCallStatusChangedNotification[0]();
      [v17 removeObserver:self name:v10 object:0];
    }
    uint64_t v11 = getTUCallCenterCallConnectedNotification[0]();

    if (v11)
    {
      id v12 = getTUCallCenterCallConnectedNotification[0]();
      [v17 removeObserver:self name:v12 object:0];
    }
    uint64_t v13 = getTUCallCenterVideoCallStatusChangedNotification[0]();

    uint64_t v14 = v17;
    if (v13)
    {
      uint64_t v15 = getTUCallCenterVideoCallStatusChangedNotification[0]();
      [v17 removeObserver:self name:v15 object:0];

      uint64_t v14 = v17;
    }
    self->_callStatusObserving = 0;
  }
}

- (void)_callMonitorStart
{
  if (self->_callObserver) {
    return;
  }
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callMonitorStart]", 0x1Eu, (uint64_t)"Call monitoring start\n", v2, v3, v4, v5, v29);
  }
  uint64_t v7 = [(Class)getTUCallCenterClass[0]() callCenterWithQueue:self->_dispatchQueue];
  callCenter = self->_callCenter;
  self->_callCenter = v7;

  uint64_t v9 = getTUCallCenterCallStatusChangedNotification[0]();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = getTUCallCenterCallConnectedNotification[0]();
    if (!v11)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v12 = (void *)v11;
    uint64_t v13 = getTUCallCenterVideoCallStatusChangedNotification[0]();

    if (v13)
    {
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v14 = getTUCallCenterCallStatusChangedNotification[0]();
      [v10 addObserver:self selector:sel__callCenterStatusChanged_ name:v14 object:0];

      uint64_t v15 = getTUCallCenterCallConnectedNotification[0]();
      [v10 addObserver:self selector:sel__callCenterStatusChanged_ name:v15 object:0];

      uint64_t v16 = getTUCallCenterVideoCallStatusChangedNotification[0]();
      [v10 addObserver:self selector:sel__callCenterStatusChanged_ name:v16 object:0];

      self->_callStatusObserving = 1;
      goto LABEL_10;
    }
  }
LABEL_11:
  id v17 = (CXCallObserver *)objc_alloc_init((Class)getCXCallObserverClass[0]());
  callObserver = self->_callObserver;
  self->_callObserver = v17;

  [(CXCallObserver *)self->_callObserver setDelegate:self queue:self->_dispatchQueue];
  uint64_t v19 = [(CUSystemMonitorImp *)self _activeCallCountUnached];
  int v20 = [(CUSystemMonitorImp *)self _connectedCallCountUnached];
  unsigned int v21 = [(CUSystemMonitorImp *)self _callFlagsUncached];
  uint64_t v22 = [(CUSystemMonitorImp *)self _callInfoUncached];
  uint64_t v24 = v23;
  pthread_mutex_lock(&gCUSystemMonitorLock);
  self->_uint64_t connectedCallCount = v20;
  self->_uint64_t activeCallCount = v19;
  self->_uint64_t callFlags = v21;
  *(void *)&self->_callInfo.uint64_t callCountIncomingConnected = v22;
  *(void *)&self->_callInfo.int callCountOutgoingConnected = v24;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _callMonitorStart]", 0x1Eu, (uint64_t)"Calls initial: active %d, connected %d, call flags %#{flags}\n", v25, v26, v27, v28, v19);
  }
}

- (void)_bluetoothAddressMonitorStop
{
  if (self->_bluetoothClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStop]", 0x1Eu, (uint64_t)"Bluetooth address monitor stop\n", v2, v3, v4, v5, v8);
    }
    [(CUBluetoothClient *)self->_bluetoothClient invalidate];
    bluetoothClient = self->_bluetoothClient;
    self->_bluetoothClient = 0;
  }
}

- (void)_bluetoothAddressMonitorStart
{
  if (!self->_bluetoothClient)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]", 0x1Eu, (uint64_t)"Bluetooth address monitor start\n", v2, v3, v4, v5, v9);
    }
    uint64_t v7 = objc_alloc_init(CUBluetoothClient);
    bluetoothClient = self->_bluetoothClient;
    self->_bluetoothClient = v7;

    [(CUBluetoothClient *)self->_bluetoothClient setDispatchQueue:self->_dispatchQueue];
    [(CUBluetoothClient *)self->_bluetoothClient setLabel:@"SysMon"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke;
    void v10[3] = &unk_1E55BEA80;
    v10[4] = self;
    [(CUBluetoothClient *)self->_bluetoothClient setBluetoothAddressChangedHandler:v10];
    [(CUBluetoothClient *)self->_bluetoothClient activate];
  }
}

uint64_t __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = a2;
  uint64_t v5 = v4;
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v24 = (void *)v4;
    uint64_t v4 = [(id)v4 length];
    uint64_t v5 = (uint64_t)v24;
    if (v4 == 6)
    {
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32);
      id v7 = v24;
      id v8 = v6;
      if (v8 == v7)
      {
      }
      else
      {
        uint64_t v9 = v8;
        if ((v7 == 0) == (v8 != 0))
        {

          goto LABEL_12;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10)
        {
LABEL_12:
          if (gLogCategory_CUSystemMonitor <= 30
            && (gLogCategory_CUSystemMonitor != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
          {
            uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 32) bytes];
            [v7 bytes];
            LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]_block_invoke", 0x1Eu, (uint64_t)"Bluetooth address changed: %.6a -> %.6a\n", v17, v18, v19, v20, v16);
          }
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
          unsigned int v21 = (void *)(*(void *)(a1 + 32) + 24);
          id v22 = v7;
          memcpy(v21, (const void *)[v22 bytes], objc_msgSend(v22, "length"));
          uint64_t v4 = [*(id *)(a1 + 32) _invokeBlock:&__block_literal_global_99 passingTest:&__block_literal_global_101];
          goto LABEL_19;
        }
      }
      uint64_t v5 = (uint64_t)v24;
      if (gLogCategory_CUSystemMonitor <= 10)
      {
        if (gLogCategory_CUSystemMonitor != -1
          || (uint64_t v4 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0xAu), v5 = (uint64_t)v24, v4))
        {
          uint64_t v11 = [v7 bytes];
          uint64_t v4 = LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitorImp _bluetoothAddressMonitorStart]_block_invoke", 0xAu, (uint64_t)"Bluetooth address unchanged: %.6a\n", v12, v13, v14, v15, v11);
LABEL_19:
          uint64_t v5 = (uint64_t)v24;
        }
      }
    }
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

BOOL __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 bluetoothAddressChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

void __51__CUSystemMonitorImp__bluetoothAddressMonitorStart__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  if (!a2[24])
  {
    uint64_t v2 = [a2 bluetoothAddressChangedHandler];
    if (v2)
    {
      BOOL v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

- (void)_update
{
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_8348]) {
    [(CUSystemMonitorImp *)self _bluetoothAddressMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _bluetoothAddressMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_29_8349]) {
    [(CUSystemMonitorImp *)self _callMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _callMonitorStop];
  }
  BOOL v3 = [(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_31];
  BOOL v4 = v3;
  if (!v3)
  {
    [(CUSystemMonitorImp *)self _familyMonitorStop];
    goto LABEL_11;
  }
  if (self->_firstUnlocked)
  {
    [(CUSystemMonitorImp *)self _familyMonitorStart];
LABEL_11:
    char v5 = 0;
    goto LABEL_12;
  }
  char v5 = 1;
LABEL_12:
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_33_8350]) {
    [(CUSystemMonitorImp *)self _locationVisitsMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _locationVisitsMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_35]) {
    [(CUSystemMonitorImp *)self _manateeMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _manateeMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_37]) {
    [(CUSystemMonitorImp *)self _meDeviceMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _meDeviceMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_39]) {
    [(CUSystemMonitorImp *)self _motionMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _motionMonitorStop];
  }
  BOOL v6 = [(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_41_8351];
  [(CUSystemMonitorImp *)self _systemConfigUpdateKeyPtr:&self->_scPatternNetInterfaceIPv4 name:@"NetIfIPv4" enabled:v6 creator:&__block_literal_global_47_8353];
  [(CUSystemMonitorImp *)self _systemConfigUpdateKeyPtr:&self->_scPatternNetInterfaceIPv6 name:@"NetIfIPv6" enabled:v6 creator:&__block_literal_global_52_8355];
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_54]
    || [(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_56]
    || [(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_58_8356])
  {
    [(CUSystemMonitorImp *)self _netInterfaceMonitorStart];
  }
  else
  {
    [(CUSystemMonitorImp *)self _netInterfaceMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_60])
  {
    [(CUSystemMonitorImp *)self _powerUnlimitedMonitorStart];
    if (v4) {
      goto LABEL_33;
    }
  }
  else
  {
    [(CUSystemMonitorImp *)self _powerUnlimitedMonitorStop];
    if (v4)
    {
LABEL_33:
      [(CUSystemMonitorImp *)self _primaryAppleIDMonitorStart];
      goto LABEL_35;
    }
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_62]) {
    goto LABEL_33;
  }
  [(CUSystemMonitorImp *)self _primaryAppleIDMonitorStop];
LABEL_35:
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_64]) {
    [(CUSystemMonitorImp *)self _regionMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _regionMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_66]) {
    [(CUSystemMonitorImp *)self _rotatingIdentifierMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _rotatingIdentifierMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_68]) {
    [(CUSystemMonitorImp *)self _screenLockedMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _screenLockedMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_70]) {
    [(CUSystemMonitorImp *)self _screenOnMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _screenOnMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_72]) {
    [(CUSystemMonitorImp *)self _screenSaverMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _screenSaverMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_74]) {
    [(CUSystemMonitorImp *)self _screenStateMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _screenStateMonitorStop];
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_76]) {
    [(CUSystemMonitorImp *)self _systemLockStateMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _systemLockStateMonitorStop];
  }
  [(CUSystemMonitorImp *)self _systemConfigUpdateKeyPtr:&self->_scKeySystemName name:@"SystemName" enabled:[(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_78] creator:&__block_literal_global_83];
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_85])
  {
    [(CUSystemMonitorImp *)self _systemUIMonitorStart];
    if (v5) {
      goto LABEL_61;
    }
  }
  else
  {
    [(CUSystemMonitorImp *)self _systemUIMonitorStop];
    if (v5)
    {
LABEL_61:
      [(CUSystemMonitorImp *)self _firstUnlockMonitorStart];
      goto LABEL_63;
    }
  }
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_87]) {
    goto LABEL_61;
  }
  [(CUSystemMonitorImp *)self _firstUnlockMonitorStop];
LABEL_63:
  if ([(CUSystemMonitorImp *)self _hasMonitorPassingTest:&__block_literal_global_89]) {
    [(CUSystemMonitorImp *)self _wifiMonitorStart];
  }
  else {
    [(CUSystemMonitorImp *)self _wifiMonitorStop];
  }
  if (self->_scChangesPending)
  {
    [(CUSystemMonitorImp *)self _systemConfigUpdateNotifications];
  }
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 wifiStateChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 firstUnlockHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemUIChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

__CFString *__29__CUSystemMonitorImp__update__block_invoke_24()
{
  ComputerName = (__CFString *)SCDynamicStoreKeyCreateComputerName(0);
  return ComputerName;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemNameChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 systemLockStateChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenStateChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenSaverChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenOnChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 screenLockedChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 rotatingIdentifierChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 regionChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 primaryAppleIDChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 powerUnlimitedChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 primaryNetworkChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 primaryIPChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 netFlagsChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

__CFString *__29__CUSystemMonitorImp__update__block_invoke_10()
{
  NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B18]);
  return NetworkInterfaceEntity;
}

__CFString *__29__CUSystemMonitorImp__update__block_invoke_9()
{
  NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B10]);
  return NetworkInterfaceEntity;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 netInterfacesChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 motionHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 meDeviceChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 manateeChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 locationVisitsChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 familyUpdatedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 callChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __29__CUSystemMonitorImp__update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 bluetoothAddressChangedHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke;
  block[3] = &unk_1E55BE9F8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _update];
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    BOOL v3 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke_2;
    block[3] = &unk_1E55BFC80;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __49__CUSystemMonitorImp_updateWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_hasMonitorPassingTest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (uint64_t (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_monitors;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeMonitor:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CUSystemMonitorImp_removeMonitor___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __36__CUSystemMonitorImp_removeMonitor___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _update];
}

- (void)addMonitor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CUSystemMonitorImp_addMonitor_completion___block_invoke;
  block[3] = &unk_1E55BE9F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __44__CUSystemMonitorImp_addMonitor_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _update];
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    BOOL v3 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__CUSystemMonitorImp_addMonitor_completion___block_invoke_2;
    block[3] = &unk_1E55BFC80;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __44__CUSystemMonitorImp_addMonitor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CUSystemMonitorImp)init
{
  v10.receiver = self;
  v10.super_class = (Class)CUSystemMonitorImp;
  uint64_t v2 = [(CUSystemMonitorImp *)&v10 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CUSystemMonitor", v3);
    id v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    *((_DWORD *)v2 + 24) = -1;
    *((_DWORD *)v2 + 32) = -1;
    *(void *)(v2 + 212) = -1;
    *((_DWORD *)v2 + 58) = -1;
    *((_DWORD *)v2 + 90) = -1;
    *((_DWORD *)v2 + 95) = -1;
    *((_DWORD *)v2 + 110) = -1;
    v2[480] = 1;
    *((_DWORD *)v2 + 121) = -1;
    *((_DWORD *)v2 + 123) = -1;
    *(void *)(v2 + 588) = -1;
    *((_DWORD *)v2 + 155) = -1;
    id v8 = v2;
  }

  return (CUSystemMonitorImp *)v2;
}

@end