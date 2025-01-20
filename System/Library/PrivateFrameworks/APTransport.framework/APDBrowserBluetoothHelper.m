@interface APDBrowserBluetoothHelper
- (APDBrowserBluetoothHelper)init;
- (BOOL)bluetoothPowerChangedListeningStarted;
- (BOOL)isInvalidated;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)queue;
- (OpaqueAPDBluetoothHelper)helperRef;
- (id)getEventString:(unsigned int)a3;
- (int)dispatchEvent:(unsigned int)a3 withEventInfo:(id)a4;
- (int)ensureBluetoothPowerChangedListenerStopped;
- (int)ensureBluetoothPowerEventMonitorStarted;
- (int)getBluetoothPowerOn:(BOOL *)a3;
- (int)invalidate;
- (int)queryBluetoothPower:(BOOL *)a3;
- (int)setBluetoothPower:(BOOL)a3;
- (int)setEventHandler:(void *)a3 context:(void *)a4 helperRef:(OpaqueAPDBluetoothHelper *)a5;
- (int)setPowered:(BOOL)a3;
- (int)startListeningToEvent:(unsigned int)a3;
- (int)stopListeningToEvent:(unsigned int)a3;
- (void)dealloc;
- (void)eventHandlerContext;
- (void)eventHandlerFunc;
- (void)handleBluetoothChangedNotificationInternal:(id)a3;
- (void)setBluetoothPowerChangedListeningStarted:(BOOL)a3;
- (void)setEventHandlerContext:(void *)a3;
- (void)setEventHandlerFunc:(void *)a3;
- (void)setHelperRef:(OpaqueAPDBluetoothHelper *)a3;
- (void)setIsInvalidated:(BOOL)a3;
@end

@implementation APDBrowserBluetoothHelper

- (APDBrowserBluetoothHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)APDBrowserBluetoothHelper;
  v2 = [(APDBrowserBluetoothHelper *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("APBrowserBluetoothManagerInternalQueue", 0);
    v2->_queue = (OS_dispatch_queue *)v3;
    if (v3
      && (dispatch_queue_t v4 = dispatch_queue_create("APBrowserBluetoothManagerEventQueue", 0),
          (v2->_eventQueue = (OS_dispatch_queue *)v4) != 0))
    {
      [MEMORY[0x1E4F50B70] setSharedInstanceQueue:v2->_queue];
    }
    else
    {
      APSLogErrorAt();
    }
  }
  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  eventQueue = self->_eventQueue;
  if (eventQueue)
  {
    dispatch_release(eventQueue);
    self->_eventQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APDBrowserBluetoothHelper;
  [(APDBrowserBluetoothHelper *)&v5 dealloc];
}

- (int)invalidate
{
  if ([(APDBrowserBluetoothHelper *)self isInvalidated]) {
    return -72182;
  }
  int v3 = [(APDBrowserBluetoothHelper *)self ensureBluetoothPowerChangedListenerStopped];
  if (v3)
  {
    int v4 = v3;
    APSLogErrorAt();
  }
  else
  {
    int v4 = [(APDBrowserBluetoothHelper *)self dispatchEvent:100 withEventInfo:0];
    [(APDBrowserBluetoothHelper *)self setIsInvalidated:1];
  }
  return v4;
}

- (id)getEventString:(unsigned int)a3
{
  int v3 = @"Invalidated";
  int v4 = @"Unknown";
  if (a3 == 101) {
    int v4 = @"Bluetooth Power Changed Listening Stopped";
  }
  if (a3 != 100) {
    int v3 = v4;
  }
  if (a3 == 1) {
    return @"Bluetooth Power Changed";
  }
  else {
    return v3;
  }
}

- (int)setEventHandler:(void *)a3 context:(void *)a4 helperRef:(OpaqueAPDBluetoothHelper *)a5
{
  if ([(APDBrowserBluetoothHelper *)self isInvalidated]) {
    return -72182;
  }
  [(APDBrowserBluetoothHelper *)self setEventHandlerFunc:a3];
  [(APDBrowserBluetoothHelper *)self setEventHandlerContext:a4];
  [(APDBrowserBluetoothHelper *)self setHelperRef:a5];
  return 0;
}

- (int)startListeningToEvent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(APDBrowserBluetoothHelper *)self isInvalidated])
  {
    APSLogErrorAt();
    return -72182;
  }
  if ((v3 - 100) >= 2)
  {
    if (v3 == 1)
    {
      int v5 = [(APDBrowserBluetoothHelper *)self ensureBluetoothPowerEventMonitorStarted];
      if (!v5) {
        return v5;
      }
    }
    else
    {
      int v5 = -72181;
      if (v3)
      {
        if (gLogCategory_APDBluetoothHelper > 60
          || gLogCategory_APDBluetoothHelper == -1 && !_LogCategory_Initialize())
        {
          return v5;
        }
LABEL_11:
        LogPrintF();
        return v5;
      }
    }
    APSLogErrorAt();
    return v5;
  }
  int v5 = -72181;
  if (gLogCategory_APDBluetoothHelper <= 60
    && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
  {
    [(APDBrowserBluetoothHelper *)self getEventString:v3];
    goto LABEL_11;
  }
  return v5;
}

- (int)stopListeningToEvent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(APDBrowserBluetoothHelper *)self isInvalidated])
  {
    APSLogErrorAt();
    return -72182;
  }
  if ((v3 - 100) >= 2)
  {
    if (v3 == 1)
    {
      int v5 = [(APDBrowserBluetoothHelper *)self ensureBluetoothPowerChangedListenerStopped];
      if (!v5) {
        return v5;
      }
    }
    else
    {
      int v5 = -72181;
      if (v3)
      {
        if (gLogCategory_APDBluetoothHelper > 60
          || gLogCategory_APDBluetoothHelper == -1 && !_LogCategory_Initialize())
        {
          return v5;
        }
LABEL_11:
        LogPrintF();
        return v5;
      }
    }
    APSLogErrorAt();
    return v5;
  }
  int v5 = -72181;
  if (gLogCategory_APDBluetoothHelper <= 60
    && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
  {
    [(APDBrowserBluetoothHelper *)self getEventString:v3];
    goto LABEL_11;
  }
  return v5;
}

- (int)dispatchEvent:(unsigned int)a3 withEventInfo:(id)a4
{
  v7 = [(APDBrowserBluetoothHelper *)self eventHandlerFunc];
  v8 = [(APDBrowserBluetoothHelper *)self helperRef];
  v9 = [(APDBrowserBluetoothHelper *)self eventHandlerContext];
  if ([(APDBrowserBluetoothHelper *)self eventHandlerFunc]
    && ![(APDBrowserBluetoothHelper *)self isInvalidated])
  {
    CFRetain(v8);
    v10 = [(APDBrowserBluetoothHelper *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__APDBrowserBluetoothHelper_dispatchEvent_withEventInfo___block_invoke;
    block[3] = &unk_1E688DC08;
    unsigned int v13 = a3;
    block[4] = a4;
    block[5] = v7;
    block[6] = v8;
    block[7] = v9;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  return 0;
}

void __57__APDBrowserBluetoothHelper_dispatchEvent_withEventInfo___block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(a1 + 40))(*(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 56));
  v2 = *(const void **)(a1 + 48);
  CFRelease(v2);
}

- (void)handleBluetoothChangedNotificationInternal:(id)a3
{
  unsigned __int8 v11 = 0;
  if (![(APDBrowserBluetoothHelper *)self isInvalidated]
    && [(APDBrowserBluetoothHelper *)self bluetoothPowerChangedListeningStarted])
  {
    if (![(APDBrowserBluetoothHelper *)self getBluetoothPowerOn:&v11])
    {
      int isBluetoothPoweredOn = self->_isBluetoothPoweredOn;
      int v5 = v11;
      if (isBluetoothPoweredOn == v11) {
        return;
      }
      if (gLogCategory_APDBluetoothHelper > 40) {
        goto LABEL_15;
      }
      if (gLogCategory_APDBluetoothHelper == -1)
      {
        int v8 = _LogCategory_Initialize();
        int v5 = v11;
        if (!v8)
        {
LABEL_15:
          self->_int isBluetoothPoweredOn = v5;
          -[APDBrowserBluetoothHelper dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 1, 0, v9, v10);
          return;
        }
        int isBluetoothPoweredOn = self->_isBluetoothPoweredOn;
      }
      if (isBluetoothPoweredOn) {
        objc_super v6 = "ON";
      }
      else {
        objc_super v6 = "OFF";
      }
      if (v5) {
        v7 = "ON";
      }
      else {
        v7 = "OFF";
      }
      v9 = v6;
      v10 = v7;
      LogPrintF();
      LOBYTE(v5) = v11;
      goto LABEL_15;
    }
    APSLogErrorAt();
    if (gLogCategory_APDBluetoothHelper <= 60
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (int)ensureBluetoothPowerEventMonitorStarted
{
  if ([(APDBrowserBluetoothHelper *)self isInvalidated])
  {
    APSLogErrorAt();
    return -72182;
  }
  else if ([(APDBrowserBluetoothHelper *)self bluetoothPowerChangedListeningStarted])
  {
    return 0;
  }
  else
  {
    if (gLogCategory_APDBluetoothHelper <= 40
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v3 = [(APDBrowserBluetoothHelper *)self getBluetoothPowerOn:&self->_isBluetoothPoweredOn];
    if (v3)
    {
      APSLogErrorAt();
      if (gLogCategory_APDBluetoothHelper <= 60
        && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleBluetoothChangedNotification, @"com.apple.bluetooth.power-changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      [(APDBrowserBluetoothHelper *)self setBluetoothPowerChangedListeningStarted:1];
    }
  }
  return v3;
}

- (int)ensureBluetoothPowerChangedListenerStopped
{
  if ([(APDBrowserBluetoothHelper *)self isInvalidated])
  {
    APSLogErrorAt();
    return -72182;
  }
  else
  {
    int result = [(APDBrowserBluetoothHelper *)self bluetoothPowerChangedListeningStarted];
    if (result)
    {
      if (gLogCategory_APDBluetoothHelper <= 40
        && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.bluetooth.power-changed", 0);
      [(APDBrowserBluetoothHelper *)self setBluetoothPowerChangedListeningStarted:0];
      return [(APDBrowserBluetoothHelper *)self dispatchEvent:101 withEventInfo:0];
    }
  }
  return result;
}

- (int)queryBluetoothPower:(BOOL *)a3
{
  BOOL v6 = 0;
  int v4 = [(APDBrowserBluetoothHelper *)self getBluetoothPowerOn:&v6];
  if (v4)
  {
    APSLogErrorAt();
    if (gLogCategory_APDBluetoothHelper <= 60
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    *a3 = v6;
  }
  return v4;
}

- (int)setBluetoothPower:(BOOL)a3
{
  BOOL v3 = a3;
  char v10 = 0;
  if (gLogCategory_APDBluetoothHelper <= 40
    && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
  {
    int v5 = "OFF";
    if (v3) {
      int v5 = "ON";
    }
    v9 = v5;
    LogPrintF();
  }
  int v6 = -[APDBrowserBluetoothHelper getBluetoothPowerOn:](self, "getBluetoothPowerOn:", &v10, v9);
  if (v6)
  {
    int v7 = v6;
    APSLogErrorAt();
    if (gLogCategory_APDBluetoothHelper <= 60
      && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_17;
    }
  }
  else if (v10 == v3)
  {
    return 0;
  }
  else
  {
    int v7 = [(APDBrowserBluetoothHelper *)self setPowered:v3];
    if (v7)
    {
      APSLogErrorAt();
      if (gLogCategory_APDBluetoothHelper <= 60
        && (gLogCategory_APDBluetoothHelper != -1 || _LogCategory_Initialize()))
      {
LABEL_17:
        LogPrintF();
      }
    }
  }
  return v7;
}

- (int)getBluetoothPowerOn:(BOOL *)a3
{
  int v4 = (void *)[MEMORY[0x1E4F50B70] sharedInstance];
  if (v4)
  {
    char v5 = [v4 enabled];
    int result = 0;
    *a3 = v5;
  }
  else
  {
    APSLogErrorAt();
    return -72184;
  }
  return result;
}

- (int)setPowered:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = -72184;
  char v5 = (void *)[MEMORY[0x1E4F50B70] sharedInstance];
  if (!v5) {
    goto LABEL_7;
  }
  if (([v5 setPowered:v3] & 1) == 0)
  {
    int v4 = -72183;
LABEL_7:
    APSLogErrorAt();
    return v4;
  }
  return 0;
}

- (void)eventHandlerContext
{
  return self->_eventHandlerContext;
}

- (void)setEventHandlerContext:(void *)a3
{
  self->_eventHandlerContext = a3;
}

- (void)eventHandlerFunc
{
  return self->_eventHandlerFunc;
}

- (void)setEventHandlerFunc:(void *)a3
{
  self->_eventHandlerFunc = a3;
}

- (OpaqueAPDBluetoothHelper)helperRef
{
  return self->_helperRef;
}

- (void)setHelperRef:(OpaqueAPDBluetoothHelper *)a3
{
  self->_helperRef = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (BOOL)bluetoothPowerChangedListeningStarted
{
  return self->_bluetoothPowerChangedListeningStarted;
}

- (void)setBluetoothPowerChangedListeningStarted:(BOOL)a3
{
  self->_bluetoothPowerChangedListeningStarted = a3;
}

@end