@interface CBHIDPerformanceMonitor
- (BOOL)_findDevicesAndReturnError:(id *)a3;
- (BOOL)_hidSetFeatureWithReportID:(unsigned __int8)a3 value:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)_hidStartAndReturnError:(id *)a3;
- (BOOL)_hidStartPERAndRetunError:(id *)a3;
- (BOOL)_hidStopPERAndRetunError:(id *)a3;
- (BOOL)_isAppleOldHIDs:(unsigned int)a3;
- (BOOL)_isMac;
- (CBHIDPerformanceMonitor)init;
- (NSArray)devices;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)workQueue;
- (double)intervalMs;
- (double)testSeconds;
- (id)excessiveIntervalHandler;
- (id)invalidationHandler;
- (id)summaryHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_hidStop;
- (void)_invalidate;
- (void)_invalidated;
- (void)_packetLoggerProcessPacketData:(id)a3;
- (void)_packetLoggerStart;
- (void)_packetLoggerStop;
- (void)_rssiAndHandleRead;
- (void)_testEnd;
- (void)_testEnded;
- (void)_testStart;
- (void)_timerStart;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDevices:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExcessiveIntervalHandler:(id)a3;
- (void)setIntervalMs:(double)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSummaryHandler:(id)a3;
- (void)setTestSeconds:(double)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CBHIDPerformanceMonitor

- (CBHIDPerformanceMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)CBHIDPerformanceMonitor;
  v2 = [(CBHIDPerformanceMonitor *)&v10 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    uint64_t v4 = dispatch_get_global_queue(0, 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    v3->_hidManager = 0;
    targetBTAddrData = v3->_targetBTAddrData;
    v3->_targetBTAddrData = (NSString *)&stru_1F02E5F20;

    targetBTAddrKey = v3->_targetBTAddrKey;
    v3->_targetBTAddrKey = (NSString *)&stru_1F02E5F20;

    v8 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CBHIDPerformanceMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5E32278;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__CBHIDPerformanceMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke;
  v19[3] = &unk_1E5E31360;
  v21 = &v22;
  v19[4] = self;
  id v5 = v4;
  id v20 = v5;
  id v6 = (void (**)(void))MEMORY[0x1AD111AA0](v19);
  if (*(_WORD *)&self->_activateCalled)
  {
    uint64_t v12 = NSErrorF_safe();
    id v13 = v23[5];
    v23[5] = (id)v12;
  }
  else
  {
    self->_activateCalled = 1;
    double testSeconds = self->_testSeconds;
    if (testSeconds <= 0.0) {
      double testSeconds = 30.0;
    }
    self->_double testSecondsActual = testSeconds;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSObjectOneLine();
      double v15 = self->_testSeconds;
      double testSecondsActual = self->_testSecondsActual;
      v14 = v8;
      LogPrintF_safe();
    }
    v9 = v23;
    id obj = v23[5];
    BOOL v10 = -[CBHIDPerformanceMonitor _findDevicesAndReturnError:](self, "_findDevicesAndReturnError:", &obj, v14, *(void *)&v15, *(void *)&testSecondsActual);
    objc_storeStrong(v9 + 5, obj);
    if (v10)
    {
      (*((void (**)(id, void))v5 + 2))(v5, 0);
      [(CBHIDPerformanceMonitor *)self _packetLoggerStart];
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke_2;
      block[3] = &unk_1E5E31248;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v22, 8);
}

uint64_t __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintNSError();
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "_packetLoggerStop", v4);
    [*(id *)(a1 + 32) _hidStop];
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _testStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CBHIDPerformanceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__CBHIDPerformanceMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      id v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    [(CBHIDPerformanceMonitor *)self _packetLoggerStop];
    [(CBHIDPerformanceMonitor *)self _hidStop];
    [(CBHIDPerformanceMonitor *)self _invalidated];
  }
}

- (void)_invalidated
{
  hidManager = self->_hidManager;
  if (hidManager)
  {
    IOHIDManagerClose(hidManager, 0);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    uint64_t v9 = MEMORY[0x1AD111AA0](self->_invalidationHandler, a2);
    id excessiveIntervalHandler = self->_excessiveIntervalHandler;
    self->_id excessiveIntervalHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id summaryHandler = self->_summaryHandler;
    self->_id summaryHandler = 0;

    uint64_t v8 = v9;
    if (v9)
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(v9 + 16))(v9);
      uint64_t v8 = v9;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_CBHIDPerf <= 30
      && (gLogCategory_CBHIDPerf != -1 || (v7 = _LogCategory_Initialize(), uint64_t v8 = v9, v7)))
    {
      uint64_t v7 = LogPrintF_safe();
      uint64_t v8 = v9;
    }
    else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    {
      __break(0xC471u);
    }
    MEMORY[0x1F41817F8](v7, v8);
  }
}

- (void)_testStart
{
  NSUInteger v3 = [(NSArray *)self->_targetDevices count];
  unint64_t targetDeviceIndex = self->_targetDeviceIndex;
  if (targetDeviceIndex >= v3)
  {
LABEL_11:
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBHIDPerformanceMonitor *)self invalidate];
  }
  else
  {
    NSUInteger v5 = v3;
    while (1)
    {
      targetDevices = self->_targetDevices;
      self->_unint64_t targetDeviceIndex = targetDeviceIndex + 1;
      -[NSArray objectAtIndexedSubscript:](targetDevices, "objectAtIndexedSubscript:");
      uint64_t v7 = (CBDevice *)objc_claimAutoreleasedReturnValue();
      targetDevice = self->_targetDevice;
      self->_targetDevice = v7;

      [(CBHIDPerformanceMonitor *)self _rssiAndHandleRead];
      id v17 = 0;
      BOOL v9 = [(CBHIDPerformanceMonitor *)self _hidStartAndReturnError:&v17];
      id v10 = v17;
      if (v9) {
        break;
      }
      if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
      {
        v11 = CUDescriptionWithLevel();
        CUPrintNSError();
        v16 = double v15 = v11;
        LogPrintF_safe();
      }
      uint64_t v12 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_summaryHandler);
      if (v12)
      {
        id v13 = objc_alloc_init(CBHIDPerformanceSummary);
        [(CBHIDPerformanceSummary *)v13 setDevice:self->_targetDevice];
        [(CBHIDPerformanceSummary *)v13 setError:v10];
        ((void (**)(void, CBHIDPerformanceSummary *))v12)[2](v12, v13);
      }
      [(CBHIDPerformanceMonitor *)self _hidStop];

      unint64_t targetDeviceIndex = self->_targetDeviceIndex;
      if (targetDeviceIndex >= v5) {
        goto LABEL_11;
      }
    }
    [(CBHIDPerformanceMonitor *)self _timerStart];
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      v14 = CUDescriptionWithLevel();
      LogPrintF_safe();
    }
  }
}

- (void)_testEnd
{
  BOOL hidStartedErrorRateMode = self->_hidStartedErrorRateMode;
  self->_finishWait = hidStartedErrorRateMode;
  if (hidStartedErrorRateMode)
  {
    id v8 = 0;
    [(CBHIDPerformanceMonitor *)self _hidStopPERAndRetunError:&v8];
    id v4 = v8;
    self->_BOOL hidStartedErrorRateMode = 0;
    if (v4)
    {
      self->_finishWait = 0;
      if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
      {
        NSUInteger v5 = CUDescriptionWithLevel();
        CUPrintNSError();
        v7 = id v6 = v5;
        LogPrintF_safe();
      }
    }
    [(CBHIDPerformanceMonitor *)self _testEnded];
  }
}

- (void)_testEnded
{
  if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    id v4 = timeoutTimer;
    dispatch_source_cancel(v4);
    NSUInteger v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(CBHIDPerformanceMonitor *)self _hidStop];

  [(CBHIDPerformanceMonitor *)self _testStart];
}

- (BOOL)_isAppleOldHIDs:(unsigned int)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 0x208u:
    case 0x209u:
    case 0x20Au:
    case 0x22Cu:
    case 0x22Du:
    case 0x22Eu:
    case 0x239u:
    case 0x23Au:
    case 0x23Bu:
    case 0x255u:
    case 0x256u:
    case 0x257u:
      return result;
    case 0x20Bu:
    case 0x20Cu:
    case 0x20Du:
    case 0x20Eu:
    case 0x20Fu:
    case 0x210u:
    case 0x211u:
    case 0x212u:
    case 0x213u:
    case 0x214u:
    case 0x215u:
    case 0x216u:
    case 0x217u:
    case 0x218u:
    case 0x219u:
    case 0x21Au:
    case 0x21Bu:
    case 0x21Cu:
    case 0x21Du:
    case 0x21Eu:
    case 0x21Fu:
    case 0x220u:
    case 0x221u:
    case 0x222u:
    case 0x223u:
    case 0x224u:
    case 0x225u:
    case 0x226u:
    case 0x227u:
    case 0x228u:
    case 0x229u:
    case 0x22Au:
    case 0x22Bu:
    case 0x22Fu:
    case 0x230u:
    case 0x231u:
    case 0x232u:
    case 0x233u:
    case 0x234u:
    case 0x235u:
    case 0x236u:
    case 0x237u:
    case 0x238u:
    case 0x23Cu:
    case 0x23Du:
    case 0x23Eu:
    case 0x23Fu:
    case 0x240u:
    case 0x241u:
    case 0x242u:
    case 0x243u:
    case 0x244u:
    case 0x245u:
    case 0x246u:
    case 0x247u:
    case 0x248u:
    case 0x249u:
    case 0x24Au:
    case 0x24Bu:
    case 0x24Cu:
    case 0x24Du:
    case 0x24Eu:
    case 0x24Fu:
    case 0x250u:
    case 0x251u:
    case 0x252u:
    case 0x253u:
    case 0x254u:
      goto LABEL_5;
    default:
      if (a3 - 777 > 5 || ((1 << (a3 - 9)) & 0x39) == 0) {
LABEL_5:
      }
        BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)_isMac
{
  return 0;
}

- (BOOL)_findDevicesAndReturnError:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v44 = +[CBDiscovery devicesWithDiscoveryFlags:0x200000 error:a3];
  if (v44)
  {
    v42 = a3;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = self->_devices;
    uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v54;
      v40 = self;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v54 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v11 = v44;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (!v12)
          {
LABEL_40:

LABEL_41:
            if (v42)
            {
              CBErrorF(-6727, (uint64_t)"Device not found: %@", v18, v19, v20, v21, v22, v23, v10);
              id *v42 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_44;
          }
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v50;
LABEL_12:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v50 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
            if ((objc_msgSend(v16, "connectedServices", v38) & 0x20) != 0
              && [v16 deviceType] != 26
              && ([v16 isEquivalentToCBDevice:v10 compareFlags:8] & 1) != 0)
            {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v58 count:16];
              if (!v13) {
                goto LABEL_40;
              }
              goto LABEL_12;
            }
          }
          id v17 = v16;

          if (!v17) {
            goto LABEL_41;
          }
          [v5 addObject:v17];
          if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
          {
            v38 = CUDescriptionWithLevel();
            LogPrintF_safe();
          }
        }
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v59 count:16];
        self = v40;
        if (v7) {
          continue;
        }
        break;
      }
    }

    if (![v5 count])
    {
      v41 = self;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v24 = v44;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            if ((objc_msgSend(v29, "connectedServices", v38) & 0x20) != 0
              && [v29 deviceType] != 26)
            {
              [v5 addObject:v29];
              if (gLogCategory_CBHIDPerf <= 30
                && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
              {
                v38 = CUDescriptionWithLevel();
                LogPrintF_safe();
              }
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v57 count:16];
        }
        while (v26);
      }

      self = v41;
    }
    if (objc_msgSend(v5, "count", v38))
    {
      objc_storeStrong((id *)&self->_targetDevices, v5);
      BOOL v30 = 1;
      goto LABEL_48;
    }
    if (v42)
    {
      CBErrorF(-6727, (uint64_t)"No devices found", v31, v32, v33, v34, v35, v36, v39);
      BOOL v30 = 0;
      id *v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
  }
LABEL_44:
  BOOL v30 = 0;
LABEL_48:

  return v30;
}

- (BOOL)_hidStartAndReturnError:(id *)a3
{
  kern_return_t MatchingServices;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(void);
  void *CFProperty;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __IOHIDManager *v23;
  IOReturn v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  NSString *targetBTAddrData;
  NSString *v42;
  NSString *targetBTAddrKey;
  __IOHIDManager *hidManager;
  CFArrayRef v45;
  CFSetRef v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  __IOHIDManager *v55;
  CFArrayRef v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CFSetRef v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  __IOHIDDevice *v67;
  void *v68;
  __CFString *v69;
  void *Property;
  double intervalMs;
  CBDeviceRequest *v72;
  CBDevice *targetDevice;
  void *v74;
  id v75;
  unsigned int v76;
  void *v77;
  CFUUIDRef v78;
  CFUUIDRef v79;
  kern_return_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  IOCFPlugInInterfaceStruct **hidPluginInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v89;
  CFUUIDBytes v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  CBDeviceRequest *v107;
  CBDevice *v108;
  void *v109;
  id v110;
  unsigned int v111;
  CBDeviceRequest *v112;
  CBDevice *v113;
  void *v114;
  id v115;
  unsigned int v116;
  CBDeviceRequest *v117;
  CBDevice *v118;
  void *v119;
  id v120;
  unsigned int v121;
  id v122;
  void *v123;
  id v124;
  unint64_t byte7;
  void *byte7a;
  void *byte7b;
  void *byte7c;
  void *byte7d;
  void (**v131)(void);
  unsigned int entry;
  void *entrya;
  id v135;
  long long v136;
  long long v137;
  long long v138;
  long long v139;
  void v140[5];
  void v141[4];
  io_iterator_t v142;
  io_iterator_t existing;
  unsigned char v144[128];
  void *v145;
  void *v146;
  SInt32 theScore[2];
  SInt32 *v148;
  uint64_t v149;
  io_object_t v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E4F143B8];
  if (![(CBHIDPerformanceMonitor *)self _isMac]
    || _os_feature_enabled_impl()
    && ![(CBHIDPerformanceMonitor *)self _isAppleOldHIDs:[(CBDevice *)self->_targetDevice productID]])
  {
    if (!self->_hidManager)
    {
      uint64_t v23 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      self->_hidManager = v23;
      id v24 = IOHIDManagerOpen(v23, 0);
      if (v24)
      {
        if (a3)
        {
          CBErrorF(v24, (uint64_t)"Open HID Manager failed", v25, v26, v27, v28, v29, v30, byte7);
          v124 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v106) = 0;
          *a3 = v124;
          return v106;
        }
        goto LABEL_39;
      }
    }
    entrya = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v31 = [NSString stringWithUTF8String:"Transport"];
    [entrya setObject:@"Bluetooth" forKey:v31];

    uint64_t v32 = [NSNumber numberWithUnsignedShort:76];
    uint64_t v33 = [NSString stringWithUTF8String:"VendorID"];
    [entrya setObject:v32 forKey:v33];

    uint64_t v34 = [NSNumber numberWithUnsignedShort:65280];
    uint64_t v35 = [NSString stringWithUTF8String:"PrimaryUsagePage"];
    [entrya setObject:v34 forKey:v35];

    uint64_t v36 = [NSNumber numberWithUnsignedShort:18];
    v37 = [NSString stringWithUTF8String:"PrimaryUsage"];
    [entrya setObject:v36 forKey:v37];

    v38 = [(CBDevice *)self->_targetDevice btAddressData];
    uint64_t v39 = v38;
    if (v38)
    {
      *(void *)theScore = 0;
      v148 = 0;
      LOWORD(v149) = 0;
      [v38 bytes];
      HardwareAddressToCString();
      v40 = [NSString stringWithCString:theScore encoding:4];
      targetBTAddrData = self->_targetBTAddrData;
      self->_targetBTAddrData = v40;

      v42 = [NSString stringWithUTF8String:"SerialNumber"];
      targetBTAddrKey = self->_targetBTAddrKey;
      self->_targetBTAddrKey = v42;

      [entrya setObject:self->_targetBTAddrData forKey:self->_targetBTAddrKey];
    }

    hidManager = self->_hidManager;
    v146 = entrya;
    long long v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
    IOHIDManagerSetDeviceMatchingMultiple(hidManager, v45);

    long long v46 = IOHIDManagerCopyDevices(self->_hidManager);
    if (!v46)
    {
      long long v47 = [NSString stringWithUTF8String:"SerialNumber"];
      [entrya removeObjectForKey:v47];

      long long v48 = [NSNumber numberWithUnsignedShort:0];
      long long v49 = [NSString stringWithUTF8String:"PrimaryUsagePage"];
      [entrya setObject:v48 forKey:v49];

      long long v50 = [NSNumber numberWithUnsignedShort:1];
      long long v51 = [NSString stringWithUTF8String:"PrimaryUsage"];
      [entrya setObject:v50 forKey:v51];

      long long v52 = [(NSString *)self->_targetBTAddrData stringByReplacingOccurrencesOfString:@":" withString:@"-"];
      long long v53 = self->_targetBTAddrData;
      self->_targetBTAddrData = v52;

      long long v54 = self->_targetBTAddrKey;
      self->_targetBTAddrKey = (NSString *)@"DeviceAddress";

      [entrya setObject:self->_targetBTAddrData forKey:self->_targetBTAddrKey];
      long long v55 = self->_hidManager;
      v145 = entrya;
      long long v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
      IOHIDManagerSetDeviceMatchingMultiple(v55, v56);

      long long v46 = IOHIDManagerCopyDevices(self->_hidManager);
      if (!v46)
      {
        if (a3)
        {
          CBErrorF(-6762, (uint64_t)"No HID devices", v57, v58, v59, v60, v61, v62, byte7);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_39;
      }
    }
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v63 = v46;
    v64 = [(__CFSet *)v63 countByEnumeratingWithState:&v136 objects:v144 count:16];
    if (v64)
    {
      v65 = *(void *)v137;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v137 != v65) {
            objc_enumerationMutation(v63);
          }
          v67 = *(__IOHIDDevice **)(*((void *)&v136 + 1) + 8 * i);
          v68 = IOHIDDeviceGetProperty(v67, (CFStringRef)self->_targetBTAddrKey);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ![v68 caseInsensitiveCompare:self->_targetBTAddrData])
          {
            v69 = [NSString stringWithUTF8String:"ProductID"];
            Property = (void *)IOHIDDeviceGetProperty(v67, v69);
            self->_hidProductID = (unsigned __int16)CFGetInt64Ranged();
          }
        }
        v64 = [(__CFSet *)v63 countByEnumeratingWithState:&v136 objects:v144 count:16];
      }
      while (v64);
    }

    goto LABEL_28;
  }
  existing = 0;
  mach_port_t v4 = *MEMORY[0x1E4F2EEF8];
  CFDictionaryRef v5 = IOServiceMatching((const char *)[@"IOBluetoothHIDDriver" UTF8String]);
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  if (!existing)
  {
    if (a3)
    {
      if (!MatchingServices) {
        MatchingServices = -6700;
      }
      CBErrorF(MatchingServices, (uint64_t)"Get HID services failed", v7, v8, v9, v10, v11, v12, byte7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_39;
  }
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke;
  v141[3] = &__block_descriptor_36_e5_v8__0l;
  v142 = existing;
  v131 = (void (**)(void))MEMORY[0x1AD111AA0](v141);
  entry = 0;
  while (1)
  {
    *(void *)theScore = 0;
    v148 = theScore;
    v149 = 0x2020000000;
    v150 = 0;
    v150 = IOIteratorNext(existing);
    if (!v148[6]) {
      break;
    }
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke_2;
    v140[3] = &unk_1E5E354F8;
    v140[4] = theScore;
    uint64_t v13 = (void (**)(void))MEMORY[0x1AD111AA0](v140);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v148[6], @"BD_ADDR", 0, 0);
    uint64_t v15 = [(CBDevice *)self->_targetDevice btAddressData];
    v16 = [CFProperty isEqual:v15];

    if (v16)
    {
      entry = v148[6];
      v148[6] = 0;
    }

    v13[2](v13);
    _Block_object_dispose(theScore, 8);
    if (v16) {
      goto LABEL_33;
    }
  }
  _Block_object_dispose(theScore, 8);
LABEL_33:
  if (entry)
  {
    self->_hidService = entry;
    v77 = (void *)IORegistryEntryCreateCFProperty(entry, @"ProductID", 0, 0);
    self->_hidProductID = (unsigned __int16)CFGetInt64Ranged();

    theScore[0] = 0;
    v78 = CFUUIDGetConstantUUIDWithBytes(0, 0xFAu, 0x12u, 0xFAu, 0x38u, 0x6Fu, 0x1Au, 0x11u, 0xD4u, 0xBAu, 0xCu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
    v79 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v80 = IOCreatePlugInInterfaceForService(entry, v78, v79, &self->_hidPluginInterface, theScore);
    hidPluginInterface = self->_hidPluginInterface;
    if (hidPluginInterface)
    {
      QueryInterface = (*hidPluginInterface)->QueryInterface;
      v89 = CFUUIDGetConstantUUIDWithBytes(0, 0x78u, 0xBDu, 0x42u, 0xCu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x94u, 0x74u, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
      v90 = CFUUIDGetUUIDBytes(v89);
      v91 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, void, void, IOHIDDeviceInterface ***))QueryInterface)(hidPluginInterface, *(void *)&v90.byte0, *(void *)&v90.byte8, &self->_hidInterface);
      if (self->_hidInterface)
      {
        v98 = ((uint64_t (*)(IOHIDDeviceInterface **, void))(*self->_hidInterface)->open)(self->_hidInterface, 0);
        if (!v98)
        {
          v105 = 0;
          goto LABEL_38;
        }
        if (a3)
        {
          v123 = CBErrorF(v98, (uint64_t)"Open HID interface failed", v99, v100, v101, v102, v103, v104, byte7);
LABEL_97:
          v122 = v123;
          goto LABEL_98;
        }
      }
      else if (a3)
      {
        if (!v91) {
          v91 = -6700;
        }
        v123 = CBErrorF(v91, (uint64_t)"Get HID interface failed", v92, v93, v94, v95, v96, v97, byte7);
        goto LABEL_97;
      }
    }
    else if (a3)
    {
      if (!v80) {
        v80 = -6700;
      }
      v123 = CBErrorF(v80, (uint64_t)"Get HID plugin failed", v81, v82, v83, v84, v85, v86, byte7);
      goto LABEL_97;
    }
  }
  else if (a3)
  {
    CBErrorF(-6727, (uint64_t)"HID not found", v17, v18, v19, v20, v21, v22, byte7);
    v122 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:
    *a3 = v122;
  }
  v105 = 1;
LABEL_38:
  v131[2]();

  if (v105)
  {
LABEL_39:
    LOBYTE(v106) = 0;
    return v106;
  }
LABEL_28:
  intervalMs = self->_intervalMs;
  if (intervalMs > 0.0)
  {
    self->_statsPacketIntervalMicsExpected = (intervalMs * 1000.0);
LABEL_70:
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      byte7 = self->_statsPacketIntervalMicsExpected;
      LogPrintF_safe();
    }
    if (-[CBHIDPerformanceMonitor _hidStartPERAndRetunError:](self, "_hidStartPERAndRetunError:", a3, byte7))
    {
      LOBYTE(v106) = 1;
    }
    else
    {
      [(CBHIDPerformanceMonitor *)self _hidStopPERAndRetunError:0];
      LOBYTE(v106) = [(CBHIDPerformanceMonitor *)self _hidStartPERAndRetunError:a3];
    }
    return v106;
  }
  self->_statsPacketIntervalMicsExpected = 0;
  v72 = objc_alloc_init(CBDeviceRequest);
  [(CBDeviceRequest *)v72 setRequestFlags:512];
  targetDevice = self->_targetDevice;
  v135 = 0;
  v74 = +[CBController performDeviceRequest:v72 device:targetDevice error:&v135];
  v75 = v135;
  v76 = [v74 sniffInterval];
  if (v76)
  {
    self->_statsPacketIntervalMicsExpected = v76;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    byte7a = CUPrintNSError();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7a);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected) {
    goto LABEL_70;
  }
  v107 = objc_alloc_init(CBDeviceRequest);
  [(CBDeviceRequest *)v107 setRequestFlags:512];
  v108 = self->_targetDevice;
  v135 = 0;
  v109 = +[CBController performDeviceRequest:v107 device:v108 error:&v135];
  v110 = v135;
  v111 = [v109 sniffInterval];
  if (v111)
  {
    self->_statsPacketIntervalMicsExpected = v111;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    byte7b = CUPrintNSError();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7b);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected) {
    goto LABEL_70;
  }
  v112 = objc_alloc_init(CBDeviceRequest);
  [(CBDeviceRequest *)v112 setRequestFlags:512];
  v113 = self->_targetDevice;
  v135 = 0;
  v114 = +[CBController performDeviceRequest:v112 device:v113 error:&v135];
  v115 = v135;
  v116 = [v114 sniffInterval];
  if (v116)
  {
    self->_statsPacketIntervalMicsExpected = v116;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    byte7c = CUPrintNSError();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7c);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected) {
    goto LABEL_70;
  }
  v117 = objc_alloc_init(CBDeviceRequest);
  [(CBDeviceRequest *)v117 setRequestFlags:512];
  v118 = self->_targetDevice;
  v135 = 0;
  v119 = +[CBController performDeviceRequest:v117 device:v118 error:&v135];
  v120 = v135;
  v121 = [v119 sniffInterval];
  if (v121)
  {
    self->_statsPacketIntervalMicsExpected = v121;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    byte7d = CUPrintNSError();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7d);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected) {
    goto LABEL_70;
  }
  if (gLogCategory_CBHIDPerf > 90) {
    goto LABEL_39;
  }
  if (gLogCategory_CBHIDPerf != -1 || (v106 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF_safe();
    goto LABEL_39;
  }
  return v106;
}

uint64_t __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke(uint64_t a1)
{
  return IOObjectRelease(*(_DWORD *)(a1 + 32));
}

uint64_t __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result) {
    return IOObjectRelease(result);
  }
  return result;
}

- (void)_hidStop
{
  if (self->_hidStartedErrorRateMode)
  {
    [(CBHIDPerformanceMonitor *)self _hidStopPERAndRetunError:0];
    self->_BOOL hidStartedErrorRateMode = 0;
  }
  hidInterface = self->_hidInterface;
  if (hidInterface)
  {
    ((void (*)(IOHIDDeviceInterface **, SEL))(*hidInterface)->close)(hidInterface, a2);
    ((void (*)(IOHIDDeviceInterface **))(*self->_hidInterface)->Release)(self->_hidInterface);
    self->_hidInterface = 0;
  }
  hidPluginInterface = self->_hidPluginInterface;
  if (hidPluginInterface)
  {
    ((void (*)(IOCFPlugInInterfaceStruct **, SEL))(*hidPluginInterface)->Release)(hidPluginInterface, a2);
    self->_hidPluginInterface = 0;
  }
  io_object_t hidService = self->_hidService;
  if (hidService)
  {
    IOObjectRelease(hidService);
    self->_io_object_t hidService = 0;
  }
  hidManager = self->_hidManager;
  if (hidManager)
  {
    IOHIDManagerClose(hidManager, 0);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
}

- (BOOL)_hidStartPERAndRetunError:(id *)a3
{
  unsigned int hidProductID = self->_hidProductID;
  uint64_t v10 = 7;
  uint64_t v11 = 213;
  switch(hidProductID)
  {
    case 0x239u:
    case 0x23Au:
    case 0x23Bu:
    case 0x255u:
    case 0x256u:
    case 0x257u:
      goto LABEL_6;
    case 0x23Cu:
    case 0x23Du:
    case 0x23Eu:
    case 0x23Fu:
    case 0x240u:
    case 0x241u:
    case 0x242u:
    case 0x243u:
    case 0x244u:
    case 0x245u:
    case 0x246u:
    case 0x247u:
    case 0x248u:
    case 0x249u:
    case 0x24Au:
    case 0x24Bu:
    case 0x24Cu:
    case 0x24Du:
    case 0x24Eu:
    case 0x24Fu:
    case 0x250u:
    case 0x251u:
    case 0x252u:
    case 0x253u:
    case 0x254u:
    case 0x258u:
    case 0x259u:
    case 0x25Au:
    case 0x25Bu:
    case 0x25Cu:
    case 0x25Du:
    case 0x25Eu:
    case 0x25Fu:
    case 0x260u:
    case 0x261u:
    case 0x262u:
    case 0x263u:
    case 0x264u:
    case 0x266u:
    case 0x268u:
    case 0x26Au:
    case 0x26Bu:
    case 0x26Du:
    case 0x26Eu:
    case 0x26Fu:
    case 0x270u:
    case 0x271u:
    case 0x272u:
    case 0x273u:
    case 0x274u:
    case 0x275u:
    case 0x276u:
    case 0x277u:
    case 0x278u:
    case 0x279u:
    case 0x27Au:
    case 0x27Bu:
    case 0x27Cu:
    case 0x27Du:
    case 0x27Eu:
    case 0x27Fu:
    case 0x280u:
    case 0x281u:
    case 0x282u:
    case 0x283u:
    case 0x284u:
    case 0x285u:
    case 0x286u:
    case 0x287u:
    case 0x288u:
    case 0x289u:
    case 0x28Au:
    case 0x28Bu:
    case 0x28Cu:
    case 0x28Du:
    case 0x28Eu:
    case 0x28Fu:
    case 0x290u:
    case 0x291u:
    case 0x292u:
    case 0x293u:
    case 0x294u:
    case 0x295u:
    case 0x296u:
    case 0x297u:
    case 0x298u:
    case 0x299u:
    case 0x29Bu:
    case 0x29Du:
    case 0x29Eu:
LABEL_11:
      if (a3)
      {
        CBErrorF(-6735, (uint64_t)"Unsupported HID: PID 0x%04X", 213, 7, v3, v4, v5, v6, self->_hidProductID);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = 0;
        *a3 = v13;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
      return v12;
    case 0x265u:
    case 0x269u:
LABEL_4:
      uint64_t v10 = 52;
      goto LABEL_5;
    case 0x267u:
    case 0x26Cu:
    case 0x29Au:
    case 0x29Cu:
    case 0x29Fu:
LABEL_3:
      uint64_t v10 = 10;
LABEL_5:
      uint64_t v11 = 214;
LABEL_6:
      self->_startWait = 0;
      BOOL v12 = [(CBHIDPerformanceMonitor *)self _hidSetFeatureWithReportID:v11 value:v10 error:a3];
      if (v12)
      {
        LOBYTE(v12) = 1;
        self->_BOOL hidStartedErrorRateMode = 1;
        self->_statsPacketIntervalMicsMax = 0;
        *(_OWORD *)&self->_statsPacketMicsStart = 0u;
        *(_OWORD *)&self->_statsPacketMicsPrevious = 0u;
        self->_statsPacketCountExpected = 0;
      }
      return v12;
    default:
      switch(hidProductID)
      {
        case 0x30Du:
          uint64_t v10 = 12;
          uint64_t v11 = 213;
          goto LABEL_6;
        case 0x30Eu:
          uint64_t v10 = 15;
          uint64_t v11 = 213;
          goto LABEL_6;
        case 0x320u:
        case 0x321u:
        case 0x322u:
          goto LABEL_3;
        case 0x323u:
        case 0x324u:
          goto LABEL_4;
        default:
          goto LABEL_11;
      }
  }
}

- (BOOL)_hidStopPERAndRetunError:(id *)a3
{
  self->_BOOL hidStartedErrorRateMode = 0;
  unsigned int hidProductID = self->_hidProductID;
  switch(hidProductID)
  {
    case 0x239u:
    case 0x23Au:
    case 0x23Bu:
    case 0x255u:
    case 0x256u:
    case 0x257u:
      goto LABEL_5;
    case 0x23Cu:
    case 0x23Du:
    case 0x23Eu:
    case 0x23Fu:
    case 0x240u:
    case 0x241u:
    case 0x242u:
    case 0x243u:
    case 0x244u:
    case 0x245u:
    case 0x246u:
    case 0x247u:
    case 0x248u:
    case 0x249u:
    case 0x24Au:
    case 0x24Bu:
    case 0x24Cu:
    case 0x24Du:
    case 0x24Eu:
    case 0x24Fu:
    case 0x250u:
    case 0x251u:
    case 0x252u:
    case 0x253u:
    case 0x254u:
    case 0x258u:
    case 0x259u:
    case 0x25Au:
    case 0x25Bu:
    case 0x25Cu:
    case 0x25Du:
    case 0x25Eu:
    case 0x25Fu:
    case 0x260u:
    case 0x261u:
    case 0x262u:
    case 0x263u:
    case 0x264u:
    case 0x266u:
    case 0x268u:
    case 0x26Au:
    case 0x26Bu:
    case 0x26Du:
    case 0x26Eu:
    case 0x26Fu:
    case 0x270u:
    case 0x271u:
    case 0x272u:
    case 0x273u:
    case 0x274u:
    case 0x275u:
    case 0x276u:
    case 0x277u:
    case 0x278u:
    case 0x279u:
    case 0x27Au:
    case 0x27Bu:
    case 0x27Cu:
    case 0x27Du:
    case 0x27Eu:
    case 0x27Fu:
    case 0x280u:
    case 0x281u:
    case 0x282u:
    case 0x283u:
    case 0x284u:
    case 0x285u:
    case 0x286u:
    case 0x287u:
    case 0x288u:
    case 0x289u:
    case 0x28Au:
    case 0x28Bu:
    case 0x28Cu:
    case 0x28Du:
    case 0x28Eu:
    case 0x28Fu:
    case 0x290u:
    case 0x291u:
    case 0x292u:
    case 0x293u:
    case 0x294u:
    case 0x295u:
    case 0x296u:
    case 0x297u:
    case 0x298u:
    case 0x299u:
    case 0x29Bu:
    case 0x29Du:
    case 0x29Eu:
      goto LABEL_9;
    case 0x265u:
    case 0x267u:
    case 0x269u:
    case 0x26Cu:
    case 0x29Au:
    case 0x29Cu:
    case 0x29Fu:
      goto LABEL_3;
    default:
      if (hidProductID - 800 < 5)
      {
LABEL_3:
        uint64_t v10 = 214;
LABEL_6:
        return [(CBHIDPerformanceMonitor *)self _hidSetFeatureWithReportID:v10 value:0 error:a3];
      }
      if (hidProductID - 781 <= 1)
      {
LABEL_5:
        uint64_t v10 = 213;
        goto LABEL_6;
      }
LABEL_9:
      if (a3)
      {
        CBErrorF(-6735, (uint64_t)"Unsupported HID: PID 0x%04X", (uint64_t)a3, v3, v4, v5, v6, v7, self->_hidProductID);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      return 0;
  }
}

- (BOOL)_hidSetFeatureWithReportID:(unsigned __int8)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v7 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (![(CBHIDPerformanceMonitor *)self _isMac]
    || _os_feature_enabled_impl()
    && ![(CBHIDPerformanceMonitor *)self _isAppleOldHIDs:[(CBDevice *)self->_targetDevice productID]])
  {
    hidManager = self->_hidManager;
    if (hidManager)
    {
      uint8_t report = v7;
      unsigned __int8 v43 = a4;
      CFSetRef v25 = IOHIDManagerCopyDevices(hidManager);
      if (v25)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        CFSetRef v26 = v25;
        uint64_t v27 = [(__CFSet *)v26 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v39 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(__IOHIDDevice **)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v32 = IOHIDDeviceGetProperty(v31, (CFStringRef)self->_targetBTAddrKey);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ![v32 caseInsensitiveCompare:self->_targetBTAddrData])
              {
                IOHIDDeviceSetReport(v31, kIOHIDReportTypeFeature, 0, &report, 2);
              }
            }
            uint64_t v28 = [(__CFSet *)v26 countByEnumeratingWithState:&v38 objects:v44 count:16];
          }
          while (v28);
        }

        int v23 = gLogCategory_CBHIDPerf;
        if (gLogCategory_CBHIDPerf > 30) {
          return 1;
        }
        goto LABEL_21;
      }
      if (a5)
      {
        uint64_t v35 = "No HID devices";
        int v16 = -6762;
LABEL_35:
        CBErrorF(v16, (uint64_t)v35, v17, v18, v19, v20, v21, v22, v37);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      return 0;
    }
    if (!a5) {
      return 0;
    }
    uint64_t v34 = "No HID Manager";
LABEL_32:
    CBErrorF(-6762, (uint64_t)v34, v9, v10, v11, v12, v13, v14, v37);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a5 = v36;
    return result;
  }
  hidInterface = self->_hidInterface;
  if (!hidInterface)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v34 = "No HID interface";
    goto LABEL_32;
  }
  uint8_t report = v7;
  unsigned __int8 v43 = a4;
  uint64_t v37 = 0;
  int v16 = ((uint64_t (*)(IOHIDDeviceInterface **, uint64_t, uint64_t, uint8_t *, uint64_t, uint64_t, void, void))(*hidInterface)->setReport)(hidInterface, 2, v7, &report, 2, 1000, 0, 0);
  if (v16)
  {
    if (a5)
    {
      uint64_t v35 = "SetFeature failed";
      goto LABEL_35;
    }
    return 0;
  }
  int v23 = gLogCategory_CBHIDPerf;
  if (gLogCategory_CBHIDPerf <= 30)
  {
LABEL_21:
    if (v23 != -1 || _LogCategory_Initialize()) {
      LogPrintF_safe();
    }
  }
  return 1;
}

- (void)_packetLoggerStart
{
  p_packetLoggerClient = &self->_packetLoggerClient;
  uint64_t v4 = self->_packetLoggerClient;
  if (!v4)
  {
    uint64_t v5 = objc_alloc_init(CBPacketLoggerClient);
    objc_storeStrong((id *)p_packetLoggerClient, v5);
    [(CBPacketLoggerClient *)v5 setDispatchQueue:self->_dispatchQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke;
    v10[3] = &unk_1E5E31630;
    uint64_t v6 = v5;
    uint64_t v11 = v6;
    uint64_t v12 = self;
    [(CBPacketLoggerClient *)v6 setRawPacketHandler:v10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke_2;
    v7[3] = &unk_1E5E35520;
    uint64_t v4 = v6;
    uint64_t v8 = v4;
    uint64_t v9 = self;
    [(CBPacketLoggerClient *)v4 activateWithCompletion:v7];
  }
}

void *__45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL result = *(void **)(a1 + 40);
  if (v3 == result[8]) {
    return (void *)[result _packetLoggerProcessPacketData:a2];
  }
  return result;
}

void __45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 64))
  {
    id v7 = v3;
    if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = CUPrintNSError();
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v6);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0;

    id v3 = v7;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
}

- (void)_packetLoggerStop
{
  [(CBPacketLoggerClient *)self->_packetLoggerClient invalidate];
  packetLoggerClient = self->_packetLoggerClient;
  self->_packetLoggerClient = 0;
}

- (void)_packetLoggerProcessPacketData:(id)a3
{
  xpc_object_t xdata = a3;
  uint64_t v4 = self->_targetDevice;
  if (!v4) {
    goto LABEL_68;
  }
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(xdata);
  size_t length = xpc_data_get_length(xdata);
  if ((uint64_t)length <= 12 || (bytes_ptr[13] | ((bytes_ptr[14] & 0xF) << 8)) != self->_statsLastConnectionHandle) {
    goto LABEL_68;
  }
  unint64_t v7 = bswap32(*((_DWORD *)bytes_ptr + 2)) + 1000000 * bswap32(*((_DWORD *)bytes_ptr + 1));
  int v8 = bytes_ptr[12];
  if (v8 != 3)
  {
    if (v8 != 2) {
      goto LABEL_68;
    }
    if (length >= 0x18 && self->_finishWait)
    {
      if (bytes_ptr[15] != 7) {
        goto LABEL_68;
      }
      if (!bytes_ptr[23])
      {
        unint64_t statsPacketIntervalMicsExpected = self->_statsPacketIntervalMicsExpected;
        if (statsPacketIntervalMicsExpected) {
          unint64_t statsPacketIntervalMicsExpected = (10
        }
                                           * (self->_statsPacketMicsEnd - self->_statsPacketMicsStart)
                                           / statsPacketIntervalMicsExpected
                                           + 5)
                                          / 0xA
                                          + 1;
        uint64_t v10 = statsPacketIntervalMicsExpected - self->_statsPacketCountActual;
        if (v10 < 0) {
          unint64_t statsPacketIntervalMicsExpected = self->_statsPacketCountActual;
        }
        self->_unint64_t statsPacketCountExpected = statsPacketIntervalMicsExpected;
        uint64_t v11 = objc_alloc_init(CBHIDPerformanceSummary);
        [(CBHIDPerformanceSummary *)v11 setDevice:v4];
        double v12 = 0.0;
        if (v10 >= 1)
        {
          unint64_t statsPacketCountExpected = self->_statsPacketCountExpected;
          if (statsPacketCountExpected) {
            double v12 = (double)v10 / (double)statsPacketCountExpected;
          }
        }
        [(CBHIDPerformanceSummary *)v11 setErrorRate:v12];
        [(CBHIDPerformanceSummary *)v11 setIntervalSecondsExpected:(double)self->_statsPacketIntervalMicsExpected / 1000000.0];
        [(CBHIDPerformanceSummary *)v11 setIntervalSecondsMax:(double)self->_statsPacketIntervalMicsMax / 1000000.0];
        [(CBHIDPerformanceSummary *)v11 setRssi:self->_statsLastRSSI];
        if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
        {
          [(CBHIDPerformanceSummary *)v11 errorRate];
          [(CBHIDPerformanceSummary *)v11 intervalSecondsExpected];
          [(CBHIDPerformanceSummary *)v11 intervalSecondsMax];
          [(CBHIDPerformanceSummary *)v11 rssi];
          LogPrintF_safe();
        }
        uint64_t v24 = MEMORY[0x1AD111AA0](self->_summaryHandler);
        CFSetRef v25 = (void *)v24;
        if (v24) {
          (*(void (**)(uint64_t, CBHIDPerformanceSummary *))(v24 + 16))(v24, v11);
        }

        goto LABEL_68;
      }
    }
    else if (length < 0x18 || bytes_ptr[15] != 7)
    {
      goto LABEL_68;
    }
    int v15 = bytes_ptr[22];
    if (v15 == 214)
    {
      int v21 = bytes_ptr[23];
      if (v21 != 52 && v21 != 10) {
        goto LABEL_68;
      }
    }
    else
    {
      if (v15 != 213) {
        goto LABEL_68;
      }
      unsigned int v16 = bytes_ptr[23];
      if (v16 > 0xF || ((1 << v16) & 0x9080) == 0) {
        goto LABEL_68;
      }
    }
    self->_startWait = 1;
    goto LABEL_68;
  }
  if (length >= 0x10 && self->_startWait)
  {
    unsigned int v14 = bytes_ptr[15];
    if (v14 == 5)
    {
      self->_statsPacketIntervalMicsMax = 0;
      self->_statsPacketMicsStart = v7;
      self->_statsPacketMicsEnd = v7;
      self->_unint64_t statsPacketMicsPrevious = v7;
      self->_statsPacketCountActual = 0;
      self->_startWait = 0;
      if (gLogCategory_CBHIDPerf > 10 || gLogCategory_CBHIDPerf == -1 && !_LogCategory_Initialize()) {
        goto LABEL_68;
      }
      goto LABEL_47;
    }
  }
  else
  {
    if (length < 0x10) {
      goto LABEL_68;
    }
    unsigned int v14 = bytes_ptr[15];
  }
  if ((v14 > 0x39 || ((1 << v14) & 0x248000000008080) == 0) && v14 != 81) {
    goto LABEL_68;
  }
  if (!self->_statsPacketMicsStart) {
    self->_statsPacketMicsStart = v7;
  }
  unint64_t statsPacketMicsPrevious = self->_statsPacketMicsPrevious;
  unint64_t v18 = v7;
  if (statsPacketMicsPrevious)
  {
    if (v7 < statsPacketMicsPrevious)
    {
      if (gLogCategory_CBHIDPerf > 90 || gLogCategory_CBHIDPerf == -1 && !_LogCategory_Initialize()) {
        goto LABEL_68;
      }
LABEL_47:
      LogPrintF_safe();
      goto LABEL_68;
    }
    unint64_t v18 = self->_statsPacketMicsPrevious;
  }
  unint64_t v19 = v7 - v18;
  if (v7 - v18 > self->_statsPacketIntervalMicsMax) {
    self->_statsPacketIntervalMicsMax = v19;
  }
  self->_statsPacketMicsEnd = v7;
  self->_unint64_t statsPacketMicsPrevious = v7;
  ++self->_statsPacketCountActual;
  double v20 = (double)(v7 - v18) / 1000000.0;
  if (v19 < 3 * self->_statsPacketIntervalMicsExpected)
  {
    if (gLogCategory_CBHIDPerf > 10 || gLogCategory_CBHIDPerf == -1 && !_LogCategory_Initialize()) {
      goto LABEL_68;
    }
    goto LABEL_47;
  }
  if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v22 = MEMORY[0x1AD111AA0](self->_excessiveIntervalHandler);
  int v23 = (void *)v22;
  if (v22) {
    (*(void (**)(uint64_t, CBDevice *, double))(v22 + 16))(v22, v4, v20);
  }

LABEL_68:
}

- (void)_rssiAndHandleRead
{
  targetDevice = self->_targetDevice;
  if (targetDevice)
  {
    self->_statsLastRSSI = 0;
    self->_statsLastConnectionHandle = 0;
    uint64_t v4 = targetDevice;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = objc_alloc_init(CBController);
    [(CBController *)v6 setDispatchQueue:self->_dispatchQueue];
    unint64_t v7 = objc_alloc_init(CBDeviceRequest);
    [(CBDeviceRequest *)v7 setRequestFlags:9];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__CBHIDPerformanceMonitor__rssiAndHandleRead__block_invoke;
    v10[3] = &unk_1E5E35548;
    dispatch_semaphore_t v11 = v5;
    double v12 = v4;
    uint64_t v13 = self;
    unsigned int v14 = v6;
    int v8 = v5;
    [(CBController *)v6 performDeviceRequest:v7 device:v4 completion:v10];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);
  }
}

void __45__CBHIDPerformanceMonitor__rssiAndHandleRead__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v6 = [*(id *)(a1 + 40) btAddressData];
  unint64_t v7 = [*(id *)(*(void *)(a1 + 48) + 80) btAddressData];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = [v19 rssi];
    int v10 = v9;
    if (v9) {
      *(unsigned char *)(*(void *)(a1 + 48) + 136) = v9;
    }
    unsigned int v11 = [v19 connectionHandle];
    unsigned int v12 = v11;
    if (v11) {
      *(_WORD *)(*(void *)(a1 + 48) + 138) = v11;
    }
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = [*(id *)(a1 + 40) name];
      unint64_t v18 = CUPrintNSError();
      LogPrintF_safe();

      objc_msgSend(*(id *)(a1 + 56), "invalidate", v10, v12, v13, v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "invalidate", v14, v15, v16, v17);
    }
  }
}

- (void)_timerStart
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v4 = timeoutTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_workQueue);
  unint64_t v7 = self->_timeoutTimer;
  self->_timeoutTimer = v6;
  int v8 = v6;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__CBHIDPerformanceMonitor__timerStart__block_invoke;
  v9[3] = &unk_1E5E31068;
  v9[4] = v8;
  v9[5] = self;
  dispatch_source_set_event_handler(v8, v9);
  CUDispatchTimerSet();
  dispatch_activate(v8);
}

uint64_t __38__CBHIDPerformanceMonitor__timerStart__block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 128))
  {
    uint64_t v1 = result;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      v2 = *(void **)(v1 + 40);
    }
    else
    {
      v2 = *(void **)(v1 + 40);
    }
    return [v2 _testEnd];
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (id)excessiveIntervalHandler
{
  return self->_excessiveIntervalHandler;
}

- (void)setExcessiveIntervalHandler:(id)a3
{
}

- (double)intervalMs
{
  return self->_intervalMs;
}

- (void)setIntervalMs:(double)a3
{
  self->_intervalMs = a3;
}

- (id)summaryHandler
{
  return self->_summaryHandler;
}

- (void)setSummaryHandler:(id)a3
{
}

- (double)testSeconds
{
  return self->_testSeconds;
}

- (void)setTestSeconds:(double)a3
{
  self->_double testSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_summaryHandler, 0);
  objc_storeStrong(&self->_excessiveIntervalHandler, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_targetDevices, 0);
  objc_storeStrong((id *)&self->_targetBTAddrKey, 0);
  objc_storeStrong((id *)&self->_targetBTAddrData, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);

  objc_storeStrong((id *)&self->_packetLoggerClient, 0);
}

@end