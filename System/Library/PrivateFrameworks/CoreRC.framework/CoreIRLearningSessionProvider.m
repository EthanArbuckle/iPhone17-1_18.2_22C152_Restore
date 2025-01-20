@interface CoreIRLearningSessionProvider
- (BOOL)_addMapping:(id)a3;
- (BOOL)addMappingWithProtocolID:(unsigned __int8)a3 options:(unsigned __int8)a4 commandToMap:(unint64_t)a5 commands:(unint64_t *)a6 commandCount:(unint64_t)a7 repeats:(unint64_t *)a8 repeatCount:(unint64_t)a9;
- (BOOL)startLearningCommand:(unint64_t)a3;
- (Class)classForCoder;
- (NSMutableArray)mappings;
- (id)_newMappingWithProtocolID:(unsigned __int8)a3 options:(unsigned __int8)a4 commandToMap:(unint64_t)a5 commands:(unint64_t *)a6 commandCount:(unint64_t)a7 repeats:(unint64_t *)a8 repeatCount:(unint64_t)a9;
- (int)initTimers;
- (unint64_t)_findDuplicateIRCommand:(id)a3 forCommand:(unint64_t)a4 device:(id *)a5;
- (unint64_t)currentCommand;
- (void)_removeMappingForCommand:(unint64_t)a3;
- (void)captureIRCommand:(id)a3;
- (void)dealloc;
- (void)disableAllTimers;
- (void)endLearning;
- (void)enumerateMappingUsingBlock:(id)a3;
- (void)handleDone;
- (void)handleIdle;
- (void)handleNoSignal;
- (void)initTimer:(id *)a3 withTimeout:(unint64_t)a4 handler:(id)a5;
- (void)processCapturedPattern;
- (void)processIRCommand:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setCaptureState:(int)a3;
- (void)setMappings:(id)a3;
- (void)updateProgress;
- (void)waitForIdle;
@end

@implementation CoreIRLearningSessionProvider

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Coreirlearning_6.isa);
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void)disableAllTimers
{
  captureNoSignalTimer = self->_captureNoSignalTimer;
  if (captureNoSignalTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_captureNoSignalTimer);
    dispatch_release(captureNoSignalTimer);
    self->_captureNoSignalTimer = 0;
  }
  captureIdleTimer = self->_captureIdleTimer;
  if (captureIdleTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_captureIdleTimer);
    dispatch_release(captureIdleTimer);
    self->_captureIdleTimer = 0;
  }
  captureDoneTimer = self->_captureDoneTimer;
  if (captureDoneTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_captureDoneTimer);
    dispatch_release(captureDoneTimer);
    self->_captureDoneTimer = 0;
  }
}

- (void)dealloc
{
  [(CoreIRLearningSessionProvider *)self cleanup];

  v3.receiver = self;
  v3.super_class = (Class)CoreIRLearningSessionProvider;
  [(CoreIRLearningSessionProvider *)&v3 dealloc];
}

- (void)setCaptureState:(int)a3
{
  if (gLogCategory_CoreIRLearningSession <= 10
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_captureState = a3;
}

- (void)enumerateMappingUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CoreIRLearningSessionProvider *)self mappings];
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      v10 = (void *)[v9 objectForKey:@"CoreIRLearningSessionCommand"];
      char v11 = 0;
      (*((void (**)(id, uint64_t, uint64_t, uint64_t, char *))a3 + 2))(a3, [v10 unsignedIntegerValue], objc_msgSend(v9, "objectForKey:", @"CoreIRLearningSessionInfraredCommand"), objc_msgSend(v9, "objectForKey:", @"CoreIRLearningSessionInfraredRepeat"), &v11);
      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (BOOL)startLearningCommand:(unint64_t)a3
{
  if (gLogCategory_CoreIRLearningSession <= 10
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t captureState = self->_captureState;
    unint64_t v9 = a3;
    uint64_t v7 = "-[CoreIRLearningSessionProvider startLearningCommand:]";
    LogPrintF();
  }
  [(CoreIRLearningSessionProvider *)self disableAllTimers];
  self->_currentCommand = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CoreIRLearningSessionProvider_startLearningCommand___block_invoke;
  v10[3] = &unk_2652E3F20;
  v10[4] = self;
  [(CoreIRLearningSessionProvider *)self initTimer:&self->_captureNoSignalTimer withTimeout:20000000000 handler:v10];
  captureNoSignalTimer = self->_captureNoSignalTimer;
  if (captureNoSignalTimer)
  {
    [(CoreIRLearningSessionProvider *)self setCaptureState:1];
    if (!self->_mappings) {
      self->_mappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    if (gLogCategory_CoreIRLearningSession <= 10
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return captureNoSignalTimer != 0;
}

uint64_t __54__CoreIRLearningSessionProvider_startLearningCommand___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNoSignal];
}

- (void)endLearning
{
  [(CoreIRLearningSessionProvider *)self setCaptureState:0];
  [(CoreIRLearningSessionProvider *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CoreIRLearningSessionProvider;
  [(CoreIRLearningSession *)&v3 endLearning];
}

- (void)processIRCommand:(id)a3
{
  if (gLogCategory_CoreIRLearningSession <= 10
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int captureState = self->_captureState;
  switch(captureState)
  {
    case 3:
      [(CoreIRLearningSessionProvider *)self waitForIdle];
      break;
    case 2:
LABEL_19:
      [(CoreIRLearningSessionProvider *)self captureIRCommand:a3];
      return;
    case 1:
      if ([(CoreIRLearningSessionProvider *)self initTimers])
      {
        if (gLogCategory_CoreIRLearningSession > 60
          || gLogCategory_CoreIRLearningSession == -1 && !_LogCategory_Initialize())
        {
          return;
        }
LABEL_17:
        LogPrintF();
        return;
      }
      [(CoreIRLearningSessionProvider *)self setCaptureState:2];
      goto LABEL_19;
    default:
      if (gLogCategory_CoreIRLearningSession <= 90
        && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_17;
      }
      break;
  }
}

- (void)initTimer:(id *)a3 withTimeout:(unint64_t)a4 handler:(id)a5
{
  if (a4 >= 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRLearningSessionProvider.m", 229, @"ticks must be < INT64_MAX");
  }
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  *a3 = v9;
  if (v9)
  {
    dispatch_set_context(v9, self);
    dispatch_source_set_event_handler((dispatch_source_t)*a3, a5);
    v10 = *a3;
    dispatch_time_t v11 = dispatch_time(0, a4);
    dispatch_source_set_timer(v10, v11, a4, 0xF4240uLL);
    long long v12 = *a3;
    dispatch_resume(v12);
  }
}

- (int)initTimers
{
  captureNoSignalTimer = self->_captureNoSignalTimer;
  if (captureNoSignalTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_captureNoSignalTimer);
    dispatch_release(captureNoSignalTimer);
    self->_captureNoSignalTimer = 0;
  }
  self->_capturedCount = 0;
  uint64_t v4 = mach_absolute_time();
  self->_captureStartTicks = v4;
  self->_captureDoneTicks = NanosecondsToUpTicks() + v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__CoreIRLearningSessionProvider_initTimers__block_invoke;
  v7[3] = &unk_2652E3F20;
  v7[4] = self;
  [(CoreIRLearningSessionProvider *)self initTimer:&self->_captureIdleTimer withTimeout:400000000 handler:v7];
  if (!self->_captureIdleTimer) {
    return -6700;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__CoreIRLearningSessionProvider_initTimers__block_invoke_2;
  v6[3] = &unk_2652E3F20;
  v6[4] = self;
  [(CoreIRLearningSessionProvider *)self initTimer:&self->_captureDoneTimer withTimeout:1200000000 handler:v6];
  if (!self->_captureDoneTimer) {
    return -6700;
  }
  [(CoreIRLearningSessionBridgeDelegate *)[(CoreIRLearningSession *)self bridgeDelegate] learningSessionForDevice:[(CoreIRLearningSession *)self owningDevice] commandProgress:&unk_26FEDAAC8];
  return 0;
}

uint64_t __43__CoreIRLearningSessionProvider_initTimers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleIdle];
}

uint64_t __43__CoreIRLearningSessionProvider_initTimers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDone];
}

- (void)updateProgress
{
  uint64_t v3 = mach_absolute_time();
  unint64_t captureDoneTicks = self->_captureDoneTicks;
  float v5 = 1.0;
  if (v3 < captureDoneTicks) {
    float v5 = (float)(v3 - self->_captureStartTicks) / (float)(captureDoneTicks - self->_captureStartTicks);
  }
  if (gLogCategory_CoreIRLearningSession <= 10
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    double v10 = (float)(v5 * 100.0);
    LogPrintF();
  }
  uint64_t v6 = [(CoreIRLearningSession *)self bridgeDelegate];
  uint64_t v7 = [(CoreIRLearningSession *)self owningDevice];
  *(float *)&double v8 = v5;
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  [(CoreIRLearningSessionBridgeDelegate *)v6 learningSessionForDevice:v7 commandProgress:v9];
}

- (void)captureIRCommand:(id)a3
{
  captureIdleTimer = self->_captureIdleTimer;
  dispatch_time_t v6 = dispatch_time(0, 400000000);
  dispatch_source_set_timer(captureIdleTimer, v6, 0x17D78400uLL, 0xF4240uLL);
  unint64_t capturedCount = self->_capturedCount;
  if (!capturedCount)
  {
    self->_capturedProtocolID = objc_msgSend((id)objc_msgSend(a3, "protocol"), "protocolID");
    self->_capturedProtocolOptions = objc_msgSend((id)objc_msgSend(a3, "protocol"), "options");
    unint64_t capturedCount = self->_capturedCount;
  }
  if (capturedCount > 0x7F)
  {
    if (gLogCategory_CoreIRLearningSession <= 10
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = [a3 payload];
    unint64_t v9 = self->_capturedCount;
    self->_capturedCommands[v9] = v8;
    self->_unint64_t capturedCount = v9 + 1;
    if (gLogCategory_CoreIRLearningSession <= 10
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      LogPrintF();
    }
  }
  [(CoreIRLearningSessionProvider *)self updateProgress];
}

- (void)waitForIdle
{
  if (gLogCategory_CoreIRLearningSession <= 10
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  captureIdleTimer = self->_captureIdleTimer;
  dispatch_time_t v4 = dispatch_time(0, 400000000);
  dispatch_source_set_timer(captureIdleTimer, v4, 0x17D78400uLL, 0xF4240uLL);
}

- (void)processCapturedPattern
{
  unint64_t capturedCount = self->_capturedCount;
  if (capturedCount <= 4)
  {
    uint64_t v4 = 3758096385;
    if (gLogCategory_CoreIRLearningSession <= 50)
    {
      if (gLogCategory_CoreIRLearningSession == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_36;
        }
        unint64_t capturedCount = self->_capturedCount;
      }
      uint64_t v26 = capturedCount;
      goto LABEL_5;
    }
LABEL_36:
    [(CoreIRLearningSessionBridgeDelegate *)[(CoreIRLearningSession *)self bridgeDelegate] learningSessionForDevice:[(CoreIRLearningSession *)self owningDevice] status:v4];
    v18 = 0;
    goto LABEL_82;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  capturedCommands = self->_capturedCommands;
  unint64_t v8 = 6;
  if (capturedCount < 6) {
    unint64_t v8 = self->_capturedCount;
  }
  unint64_t v9 = self->_capturedCommands;
  while (1)
  {
    unint64_t v10 = capturedCount - v6;
    if (capturedCount - v6 >= 2) {
      break;
    }
LABEL_25:
    ++v6;
    ++v9;
    v5 -= 2;
    if (v6 == v8)
    {
      uint64_t v4 = 3758096386;
      if (gLogCategory_CoreIRLearningSession <= 50
        && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v26 = 3758096386;
LABEL_5:
        LogPrintF();
      }
      goto LABEL_36;
    }
  }
  unint64_t v11 = 1;
  while (v10 <= v11)
  {
LABEL_24:
    if (++v11 > v10 >> 1) {
      goto LABEL_25;
    }
  }
  uint64_t v12 = -2 * v11;
  unint64_t v13 = v11;
  long long v14 = &capturedCommands[v11];
  while (capturedCommands[v6] != v9[v13])
  {
    ++v13;
    v12 -= 2;
    ++v14;
    if (v13 >= v10) {
      goto LABEL_24;
    }
  }
  if (v13 - v5 > capturedCount || v6 - v12 > capturedCount)
  {
LABEL_23:
    unint64_t v11 = v13;
    goto LABEL_24;
  }
  if (v6 + v13)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = *v14++;
      if (v9[v15] != v16) {
        goto LABEL_23;
      }
    }
    while (v6 + v13 != ++v15);
  }
  if (v6) {
    unint64_t v17 = v6;
  }
  else {
    unint64_t v17 = v13;
  }
  if (gLogCategory_CoreIRLearningSession <= 40
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    unint64_t v27 = v17;
    LogPrintF();
  }
  unint64_t v29 = v17;
  if (v17)
  {
    v19 = self->_capturedCommands;
    do
    {
      if (gLogCategory_CoreIRLearningSession <= 40
        && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      ++v19;
      --v17;
    }
    while (v17);
  }
  if (gLogCategory_CoreIRLearningSession < 41)
  {
    if (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_CoreIRLearningSession <= 40
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      unint64_t v27 = v13;
      LogPrintF();
    }
  }
  if (v13)
  {
    unint64_t v20 = v13;
    do
    {
      if (gLogCategory_CoreIRLearningSession <= 40
        && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      ++v9;
      --v20;
    }
    while (v20);
  }
  if (gLogCategory_CoreIRLearningSession < 41
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v21 = -[CoreIRLearningSessionProvider _newMappingWithProtocolID:options:commandToMap:commands:commandCount:repeats:repeatCount:](self, "_newMappingWithProtocolID:options:commandToMap:commands:commandCount:repeats:repeatCount:", self->_capturedProtocolID, self->_capturedProtocolOptions, self->_currentCommand, capturedCommands, v29, &capturedCommands[v6], v13, v27);
  if (!v21)
  {
    uint64_t v4 = 3758096388;
    goto LABEL_36;
  }
  v18 = v21;
  if ([(CoreIRLearningSession *)self reason] != 1
    || (uint64_t v30 = 0,
        (unint64_t v22 = -[CoreIRLearningSessionProvider _findDuplicateIRCommand:forCommand:device:](self, "_findDuplicateIRCommand:forCommand:device:", [v18 objectForKey:@"CoreIRLearningSessionInfraredCommand"], self->_currentCommand, &v30)) == 0))
  {
LABEL_81:
    [(CoreIRLearningSessionProvider *)self _addMapping:v18];
    [(CoreIRLearningSessionBridgeDelegate *)[(CoreIRLearningSession *)self bridgeDelegate] learningSessionForDevice:[(CoreIRLearningSession *)self owningDevice] status:0];
    goto LABEL_82;
  }
  unint64_t v23 = v22;
  if (v22 == 47)
  {
    if (self->_currentCommand != 67) {
      goto LABEL_70;
    }
    goto LABEL_74;
  }
  if (v22 == 67 && self->_currentCommand == 47)
  {
LABEL_74:
    if (gLogCategory_CoreIRLearningSession <= 40
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [v18 setObject:&unk_26FEDAAB0 forKeyedSubscript:@"CoreIRLearningSessionCommand"];
    goto LABEL_81;
  }
LABEL_70:
  if (gLogCategory_CoreIRLearningSession <= 90
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v26 = v23;
    LogPrintF();
  }
  v24 = [(CoreIRLearningSession *)self bridgeDelegate];
  v25 = [(CoreIRLearningSession *)self owningDevice];
  [(CoreIRLearningSessionBridgeDelegate *)v24 learningSessionForDevice:v25 duplicateCommand:v23 target:v30];
LABEL_82:
}

- (id)_newMappingWithProtocolID:(unsigned __int8)a3 options:(unsigned __int8)a4 commandToMap:(unint64_t)a5 commands:(unint64_t *)a6 commandCount:(unint64_t)a7 repeats:(unint64_t *)a8 repeatCount:(unint64_t)a9
{
  unint64_t v9 = (void *)a5;
  if (a5)
  {
    unint64_t v13 = +[IRProtocol protocolWithID:a3 options:a4 hasRepeats:*a6 != *a8];
    if (v13
      && (long long v14 = v13,
          (uint64_t v15 = +[IRCommand commandWithProtocol:payload:repeat:](IRCommand, "commandWithProtocol:payload:repeat:", v13, *a6, 0)) != 0)&& (v16 = v15, [(IRCommand *)v15 setSequence:a6 withCount:a7], (v17 = +[IRCommand commandWithProtocol:v14 payload:*a8 repeat:1]) != 0))
    {
      v18 = v17;
      [(IRCommand *)v17 setSequence:a8 withCount:a9];
      id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
      unint64_t v9 = objc_msgSend(v19, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9), @"CoreIRLearningSessionCommand", v16, @"CoreIRLearningSessionInfraredCommand", v18, @"CoreIRLearningSessionInfraredRepeat", 0);
      if (gLogCategory_CoreIRLearningSession <= 10
        && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (BOOL)_addMapping:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (NSMutableArray *)objc_msgSend(NSDictionary, "dictionaryWithDictionary:");
    if (v4)
    {
      uint64_t v5 = v4;
      if (self->_mappings
        || (uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]), (self->_mappings = v4) != 0))
      {
        -[CoreIRLearningSessionProvider _removeMappingForCommand:](self, "_removeMappingForCommand:", objc_msgSend((id)-[NSMutableArray objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"CoreIRLearningSessionCommand"), "unsignedIntegerValue"));
        [(NSMutableArray *)self->_mappings addObject:v5];
        if (gLogCategory_CoreIRLearningSession <= 10
          && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        LOBYTE(v4) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)_removeMappingForCommand:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    mappings = self->_mappings;
    uint64_t v6 = [(NSMutableArray *)mappings countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(mappings);
          }
          unint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"CoreIRLearningSessionCommand"), "unsignedIntegerValue") == a3)
          {
            [(NSMutableArray *)self->_mappings removeObject:v10];
            return;
          }
        }
        uint64_t v7 = [(NSMutableArray *)mappings countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
}

- (BOOL)addMappingWithProtocolID:(unsigned __int8)a3 options:(unsigned __int8)a4 commandToMap:(unint64_t)a5 commands:(unint64_t *)a6 commandCount:(unint64_t)a7 repeats:(unint64_t *)a8 repeatCount:(unint64_t)a9
{
  id v10 = [(CoreIRLearningSessionProvider *)self _newMappingWithProtocolID:a3 options:a4 commandToMap:a5 commands:a6 commandCount:a7 repeats:a8 repeatCount:a9];
  if (v10)
  {
    long long v11 = v10;
    BOOL v12 = [(CoreIRLearningSessionProvider *)self _addMapping:v10];

    LOBYTE(v10) = v12;
  }
  return (char)v10;
}

- (unint64_t)_findDuplicateIRCommand:(id)a3 forCommand:(unint64_t)a4 device:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mappings = self->_mappings;
  uint64_t v8 = [(NSMutableArray *)mappings countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(mappings);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"CoreIRLearningSessionCommand"), "unsignedIntegerValue");
        uint64_t v14 = [v12 objectForKeyedSubscript:@"CoreIRLearningSessionInfraredCommand"];
        if (v13 != a4 && ([a3 isEqual:v14] & 1) != 0)
        {
          *a5 = 0;
          return v13;
        }
      }
      uint64_t v9 = [(NSMutableArray *)mappings countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return [(CoreIRDevice *)[(CoreIRLearningSession *)self owningDevice] findDuplicateIRCommand:a3 forCommand:a4 device:a5];
}

- (void)handleNoSignal
{
  if (gLogCategory_CoreIRLearningSession <= 10
    && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_captureState == 1)
  {
    if (gLogCategory_CoreIRLearningSession <= 90
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    captureNoSignalTimer = self->_captureNoSignalTimer;
    if (captureNoSignalTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_captureNoSignalTimer);
      dispatch_release(captureNoSignalTimer);
      self->_captureNoSignalTimer = 0;
    }
    uint64_t v4 = [(CoreIRLearningSession *)self bridgeDelegate];
    uint64_t v5 = [(CoreIRLearningSession *)self owningDevice];
    [(CoreIRLearningSessionBridgeDelegate *)v4 learningSessionForDevice:v5 status:3758096387];
  }
  else if (gLogCategory_CoreIRLearningSession <= 10 {
         && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)handleIdle
{
  int captureState = self->_captureState;
  if (captureState == 3)
  {
    if (gLogCategory_CoreIRLearningSession <= 10
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    captureIdleTimer = self->_captureIdleTimer;
    if (captureIdleTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_captureIdleTimer);
      dispatch_release(captureIdleTimer);
      self->_captureIdleTimer = 0;
    }
    [(CoreIRLearningSessionBridgeDelegate *)[(CoreIRLearningSession *)self bridgeDelegate] learningSessionForDeviceCommandDone:[(CoreIRLearningSession *)self owningDevice]];
    [(CoreIRLearningSessionProvider *)self setCaptureState:0];
  }
  else if (captureState == 2)
  {
    if (gLogCategory_CoreIRLearningSession <= 40
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = self->_captureIdleTimer;
    if (v4)
    {
      dispatch_source_cancel((dispatch_source_t)self->_captureIdleTimer);
      dispatch_release(v4);
      self->_captureIdleTimer = 0;
    }
    captureDoneTimer = self->_captureDoneTimer;
    if (captureDoneTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_captureDoneTimer);
      dispatch_release(captureDoneTimer);
      self->_captureDoneTimer = 0;
    }
    self->_unint64_t capturedCount = 0;
    [(CoreIRLearningSessionProvider *)self setCaptureState:1];
    uint64_t v6 = [(CoreIRLearningSession *)self bridgeDelegate];
    uint64_t v7 = [(CoreIRLearningSession *)self owningDevice];
    [(CoreIRLearningSessionBridgeDelegate *)v6 learningSessionForDevice:v7 commandProgress:&unk_26FEDAAC8];
  }
  else if (gLogCategory_CoreIRLearningSession <= 90 {
         && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)handleDone
{
  if (self->_captureState == 2)
  {
    if (gLogCategory_CoreIRLearningSession <= 10
      && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    captureDoneTimer = self->_captureDoneTimer;
    if (captureDoneTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_captureDoneTimer);
      dispatch_release(captureDoneTimer);
      self->_captureDoneTimer = 0;
    }
    [(CoreIRLearningSessionBridgeDelegate *)[(CoreIRLearningSession *)self bridgeDelegate] learningSessionForDevice:[(CoreIRLearningSession *)self owningDevice] commandProgress:&unk_26FEDAAD8];
    [(CoreIRLearningSessionProvider *)self processCapturedPattern];
    [(CoreIRLearningSessionProvider *)self setCaptureState:3];
  }
  else if (gLogCategory_CoreIRLearningSession <= 90 {
         && (gLogCategory_CoreIRLearningSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (unint64_t)currentCommand
{
  return self->_currentCommand;
}

- (NSMutableArray)mappings
{
  return self->_mappings;
}

- (void)setMappings:(id)a3
{
}

@end