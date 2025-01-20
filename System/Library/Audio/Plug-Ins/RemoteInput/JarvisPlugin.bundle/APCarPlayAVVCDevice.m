@interface APCarPlayAVVCDevice
- (APCarPlayAVVCDevice)initWithXPCClient:(OpaqueFigXPCRemoteClient *)a3;
- (AVAudioFormat)format;
- (NSArray)supportedFormats;
- (NSString)deviceIdentifier;
- (id)audioInputBlock;
- (id)pickDefaultFormat;
- (int)readAndSendPacketToAVVC;
- (int)readCompressedBuffer:(id *)a3 numOutputSamples:(unsigned int *)a4;
- (int)readPCMBuffer:(id *)a3 numOutputSamples:(unsigned int *)a4;
- (int)readSupportedFormats;
- (unsigned)deviceCategory;
- (void)actionCompleted:(id)a3 WithResult:(int)a4;
- (void)dealloc;
- (void)handleNotification:(__CFString *)a3 fromCenter:(__CFNotificationCenter *)a4 fromObject:(const void *)a5 withUserInfo:(__CFDictionary *)a6;
- (void)insertStreamStartTimestamp:(id)a3 returnOptions:(const __CFDictionary *)a4;
- (void)sendAllAvailableAudioDataToAVVC;
- (void)setAudioInputBlock:(id)a3;
- (void)setFormat:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)startRecordingWithSettings:(id)a3 withCompletionBlock:(id)a4;
- (void)stopRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithOptionalForcedError:(int)a3;
@end

@implementation APCarPlayAVVCDevice

- (APCarPlayAVVCDevice)initWithXPCClient:(OpaqueFigXPCRemoteClient *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)APCarPlayAVVCDevice;
  v4 = [(APCarPlayAVVCDevice *)&v21 init];
  v5 = v4;
  if (!v4)
  {
    APSLogErrorAt();
    return v5;
  }
  if (!a3)
  {
    v4->_remote.client = 0;
    goto LABEL_9;
  }
  v6 = (OpaqueFigXPCRemoteClient *)CFRetain(a3);
  v5->_remote.client = v6;
  if (!v6)
  {
LABEL_9:
    APSLogErrorAt();
    goto LABEL_22;
  }
  int v7 = APEndpointCarPlayRemoteCreate();
  if (v7)
  {
    int v19 = v7;
    if (v7 == -6720) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)sub_3C14, @"avvcDevice_ConnectionLost", v5->_remote.endpoint, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v9 = APEndpointStreamCarPlayAudioRemoteCreate();
  if (v9)
  {
    int v19 = v9;
    if (v9 == -6720) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = *(uint64_t (**)(uint64_t, void, void, NSString **))(v12 + 48);
  if (!v13)
  {
    int v19 = -12782;
    goto LABEL_21;
  }
  int v14 = v13(CMBaseObject, kFigEndpointProperty_ID, 0, &v5->_deviceIdentifier);
  if (v14)
  {
    int v19 = v14;
LABEL_21:
    APSLogErrorAt();
    if (v19 != -6720)
    {
LABEL_35:
      if (dword_CDC8 > 90 || dword_CDC8 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
LABEL_22:
    if (dword_CDC8 > 30 || dword_CDC8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_38;
    }
LABEL_37:
    LogPrintF();
LABEL_38:

    return 0;
  }
  unsigned int v15 = [(APCarPlayAVVCDevice *)v5 readSupportedFormats];
  if (v15)
  {
    int v19 = v15;
    goto LABEL_21;
  }
  v5->_dataProcessing.avvcCompletionBlock = 0;
  v5->_dataProcessing.isActive = 0;
  CFAllocatorGetDefault();
  uint64_t v16 = APSPowerAssertionCreate();
  v5->_dataProcessing.powerAssertion = (OpaqueAPSPowerAssertion *)v16;
  if (!v16
    || (v17 = FigDispatchQueueCreateWithPriority(),
        (v5->_dataProcessing.queue = (OS_dispatch_queue *)v17) == 0)
    || (v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v17),
        (v5->_dataProcessing.timer = (OS_dispatch_source *)v18) == 0))
  {
    APSLogErrorAt();
    goto LABEL_35;
  }
  dispatch_set_context(v18, v5);
  dispatch_source_set_event_handler_f((dispatch_source_t)v5->_dataProcessing.timer, (dispatch_function_t)j__objc_msgSend_sendAllAvailableAudioDataToAVVC);
  if (dword_CDC8 <= 30 && (dword_CDC8 != -1 || _LogCategory_Initialize()))
  {
    [(APCarPlayAVVCDevice *)v5 deviceIdentifier];
    LogPrintF();
  }
  return v5;
}

- (void)dealloc
{
  if (dword_CDC8 <= 30 && (dword_CDC8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = self;
    deviceIdentifier = self->_deviceIdentifier;
    LogPrintF();
  }
  -[APCarPlayAVVCDevice stopRecordingWithOptionalForcedError:](self, "stopRecordingWithOptionalForcedError:", 0, v12, deviceIdentifier);
  timer = self->_dataProcessing.timer;
  if (timer)
  {
    if (!self->_dataProcessing.isActive) {
      dispatch_resume(timer);
    }
    dispatch_source_cancel_and_wait();
    v4 = self->_dataProcessing.timer;
    if (v4)
    {
      dispatch_release(v4);
      self->_dataProcessing.timer = 0;
    }
  }
  queue = self->_dataProcessing.queue;
  if (queue)
  {
    dispatch_release((dispatch_object_t)queue);
    self->_dataProcessing.queue = 0;
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, @"avvcDevice_ConnectionLost", self->_remote.endpoint);
  powerAssertion = self->_dataProcessing.powerAssertion;
  if (powerAssertion)
  {
    CFRelease(powerAssertion);
    self->_dataProcessing.powerAssertion = 0;
  }

  endpoint = self->_remote.endpoint;
  if (endpoint)
  {
    CFRelease(endpoint);
    self->_remote.endpoint = 0;
  }
  endpointStream = self->_remote.endpointStream;
  if (endpointStream)
  {
    CFRelease(endpointStream);
    self->_remote.endpointStream = 0;
  }
  xpcAudioSink = self->_remote.xpcAudioSink;
  if (xpcAudioSink)
  {
    CFRelease(xpcAudioSink);
    self->_remote.xpcAudioSink = 0;
  }
  client = self->_remote.client;
  if (client) {
    CFRelease(client);
  }
  v14.receiver = self;
  v14.super_class = (Class)APCarPlayAVVCDevice;
  [(APCarPlayAVVCDevice *)&v14 dealloc];
}

- (unsigned)deviceCategory
{
  return 1919511158;
}

- (void)insertStreamStartTimestamp:(id)a3 returnOptions:(const __CFDictionary *)a4
{
  uint64_t v6 = mach_absolute_time();
  *a4 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFDictionaryRef v8 = Mutable;
    uint64_t Int64 = CFDictionaryGetInt64();
    unint64_t v10 = Int64;
    if (dword_CDC8 > 50)
    {
      if (Int64)
      {
LABEL_8:
        unsigned int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
        unsigned int v12 = FigGetCFPreferenceNumberWithDefault();
        if (v12 >= CFPreferenceNumberWithDefault) {
          unsigned int v13 = CFPreferenceNumberWithDefault;
        }
        else {
          unsigned int v13 = v12;
        }
        if (v13 && v10 > MillisecondsToUpTicks())
        {
          if (dword_CDC8 <= 50 && (dword_CDC8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          v10 -= MillisecondsToUpTicks();
        }
LABEL_27:
        if (dword_CDC8 <= 50 && (dword_CDC8 != -1 || _LogCategory_Initialize()))
        {
          UpTicksToMilliseconds();
          LogPrintF();
        }
        goto LABEL_31;
      }
    }
    else
    {
      if (dword_CDC8 != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (v10) {
        goto LABEL_8;
      }
      if (dword_CDC8 <= 50)
      {
        if (dword_CDC8 != -1 || (unint64_t v10 = v6, _LogCategory_Initialize()))
        {
          LogPrintF();
          unint64_t v10 = v6;
        }
        goto LABEL_27;
      }
    }
    unint64_t v10 = v6;
LABEL_31:
    self->_dataProcessing.streamStartTimestamp = v10;
    CFDictionarySetInt64();
    *a4 = v8;
    return;
  }

  APSLogErrorAt();
}

- (void)startRecordingWithSettings:(id)a3 withCompletionBlock:(id)a4
{
  queue = self->_dataProcessing.queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_41F4;
  block[3] = &unk_8440;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
}

- (void)stopRecordingWithOptionalForcedError:(int)a3
{
  queue = self->_dataProcessing.queue;
  if (queue)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_489C;
    v5[3] = &unk_8468;
    v5[4] = self;
    int v6 = a3;
    dispatch_sync((dispatch_queue_t)queue, v5);
  }
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  queue = self->_dataProcessing.queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4CA0;
  v5[3] = &unk_8490;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_sync((dispatch_queue_t)queue, v5);
  [(APCarPlayAVVCDevice *)self stopRecordingWithOptionalForcedError:0];
}

- (void)actionCompleted:(id)a3 WithResult:(int)a4
{
  if (self->_dataProcessing.avvcCompletionBlock)
  {
    if (dword_CDC8 <= 50 && (dword_CDC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4) {
      id v6 = [objc_alloc((Class)NSError) initWithDomain:NSOSStatusErrorDomain code:a4 userInfo:0];
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    (*((void (**)(id, id))self->_dataProcessing.avvcCompletionBlock + 2))(self->_dataProcessing.avvcCompletionBlock, v6);
    if (v7)
    {
    }
  }
}

- (int)readSupportedFormats
{
  CFArrayRef theArray = 0;
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v5 + 48);
  if (!v6)
  {
    int v19 = -12782;
LABEL_17:
    APSLogErrorAt();
    goto LABEL_18;
  }
  int v7 = v6(CMBaseObject, kAPEndpointStreamCarPlayAudioProperty_CarPlayAudioFormats, 0, &cf);
  if (v7)
  {
    int v19 = v7;
    goto LABEL_17;
  }
  int v8 = APCarPlayAudioFormatsCopyAudioFormatInfosForStreamAndType();
  if (v8)
  {
    int v19 = v8;
    goto LABEL_17;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  unint64_t v10 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:Count];
  if (v10)
  {
    uint64_t v11 = v10;
    if (Count < 1)
    {
LABEL_15:
      self->supportedFormats = v11;
      int v19 = 0;
      self->format = (AVAudioFormat *)[(APCarPlayAVVCDevice *)self pickDefaultFormat];
      goto LABEL_18;
    }
    CFIndex v12 = 0;
    unsigned int v13 = 1;
    while (1)
    {
      CFArrayGetValueAtIndex(theArray, v12);
      uint64_t v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t Description = APCarPlayAudioFormatInfoGetDescription();
      uint64_t v15 = *(void *)(Description + 32);
      long long v16 = *(_OWORD *)(Description + 16);
      long long v21 = *(_OWORD *)Description;
      long long v22 = v16;
      uint64_t v23 = v15;
      if (DWORD2(v21) == 1819304813) {
        HIDWORD(v21) &= ~2u;
      }
      id v17 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:&v21];
      -[NSArray setObject:atIndexedSubscript:](v11, "setObject:atIndexedSubscript:", v17, v12, (void)v21);
      if (![(NSArray *)v11 objectAtIndexedSubscript:v12]) {
        break;
      }
      CFIndex v12 = v13;
      if (Count <= v13++) {
        goto LABEL_15;
      }
    }
  }
  APSLogErrorAt();
  int v19 = 0;
LABEL_18:
  if (cf) {
    CFRelease(cf);
  }
  if (theArray) {
    CFRelease(theArray);
  }
  return v19;
}

- (id)pickDefaultFormat
{
  id result = self->supportedFormats;
  if (result) {
    return [result objectAtIndexedSubscript:0];
  }
  return result;
}

- (int)readCompressedBuffer:(id *)a3 numOutputSamples:(unsigned int *)a4
{
  uint64_t v19 = 1440;
  unsigned int v18 = 0;
  if (*((_DWORD *)[(AVAudioFormat *)self->format streamDescription] + 2) == 1819304813)
  {
    APSLogErrorAt();
    return -6705;
  }
  id v7 = [objc_alloc((Class)AVAudioCompressedBuffer) initWithFormat:self->format packetCapacity:1 maximumPacketSize:1440];
  if (!v7)
  {
    APSLogErrorAt();
    return 0;
  }
  int v8 = v7;
  xpcAudioSink = self->_remote.xpcAudioSink;
  uint64_t v10 = *((void *)[v7 audioBufferList] + 2);
  id v11 = [v8 packetDescriptions];
  CFIndex v12 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (*v13 < 2uLL)
  {
    int v16 = -12781;
    goto LABEL_13;
  }
  objc_super v14 = (uint64_t (*)(OpaqueFigEndpointAudioSink *, void, uint64_t, uint64_t, id, uint64_t, uint64_t *, unsigned int *))v13[7];
  if (!v14)
  {
    int v16 = -12782;
    goto LABEL_13;
  }
  int v15 = v14(xpcAudioSink, 0, v10, 1440, v11, 1, &v19, &v18);
  int v16 = v15;
  if (v15 == -6765)
  {
LABEL_14:

    return v16;
  }
  if (v15)
  {
LABEL_13:
    APSLogErrorAt();
    goto LABEL_14;
  }
  [v8 setByteLength:v19];
  [v8 setPacketCount:v18];
  *a4 = *((_DWORD *)[(AVAudioFormat *)self->format streamDescription] + 5);
  *a3 = v8;
  return v16;
}

- (int)readPCMBuffer:(id *)a3 numOutputSamples:(unsigned int *)a4
{
  uint64_t v19 = 1440;
  unsigned int v18 = 0;
  if (*((_DWORD *)[(AVAudioFormat *)self->format streamDescription] + 2) != 1819304813
    || (id v7 = objc_msgSend(objc_alloc((Class)AVAudioPCMBuffer), "initWithPCMFormat:frameCapacity:", self->format, 0x5A0u / *((_DWORD *)-[AVAudioFormat streamDescription](self->format, "streamDescription") + 6))) == 0)
  {
    APSLogErrorAt();
    return 0;
  }
  int v8 = v7;
  id v9 = [v7 frameCapacity];
  xpcAudioSink = self->_remote.xpcAudioSink;
  uint64_t v11 = *((void *)[v8 audioBufferList] + 2);
  CFIndex v12 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (*v13 < 2uLL)
  {
    int v16 = -12781;
    goto LABEL_13;
  }
  objc_super v14 = (uint64_t (*)(OpaqueFigEndpointAudioSink *, void, uint64_t, uint64_t, void, id, uint64_t *, unsigned int *))v13[7];
  if (!v14)
  {
    int v16 = -12782;
    goto LABEL_13;
  }
  int v15 = v14(xpcAudioSink, 0, v11, 1440, 0, v9, &v19, &v18);
  int v16 = v15;
  if (v15 == -6765)
  {
LABEL_14:

    return v16;
  }
  if (v15)
  {
LABEL_13:
    APSLogErrorAt();
    goto LABEL_14;
  }
  [v8 setFrameLength:v18];
  *a3 = v8;
  *a4 = v18;
  return v16;
}

- (int)readAndSendPacketToAVVC
{
  id v11 = 0;
  int v10 = 0;
  if (*((_DWORD *)[(AVAudioFormat *)self->format streamDescription] + 2) == 1819304813) {
    unsigned int v3 = [(APCarPlayAVVCDevice *)self readPCMBuffer:&v11 numOutputSamples:&v10];
  }
  else {
    unsigned int v3 = [(APCarPlayAVVCDevice *)self readCompressedBuffer:&v11 numOutputSamples:&v10];
  }
  int v4 = v3;
  if (!v3)
  {
    if (!self->audioInputBlock || !v11) {
      goto LABEL_9;
    }
    id v5 = objc_alloc((Class)AVAudioTime);
    [(AVAudioFormat *)self->format sampleRate];
    id v6 = objc_msgSend(v5, "initWithAudioTimeStamp:sampleRate:", &self->_dataProcessing.timestamp);
    if (v6)
    {
      id v7 = v6;
      (*((void (**)(void))self->audioInputBlock + 2))();

LABEL_9:
      [(AVAudioFormat *)self->format streamDescription];
      self->_dataProcessing.timestamp.mHostTime += SecondsToUpTicksF();
      LODWORD(v8) = v10;
      self->_dataProcessing.timestamp.mSampleTime = self->_dataProcessing.timestamp.mSampleTime + (double)v8;
      ++self->_dataProcessing.numPacketsProcessed;
      goto LABEL_10;
    }
    APSLogErrorAt();
  }
LABEL_10:
  if (v11) {

  }
  return v4;
}

- (void)sendAllAvailableAudioDataToAVVC
{
  if (self->_dataProcessing.isActive)
  {
    while (![(APCarPlayAVVCDevice *)self readAndSendPacketToAVVC])
      ;
  }
}

- (void)handleNotification:(__CFString *)a3 fromCenter:(__CFNotificationCenter *)a4 fromObject:(const void *)a5 withUserInfo:(__CFDictionary *)a6
{
  if (CFEqual(a3, kAPCarPlayAVVCNotification_StateIncompatibleWithAuxIn))
  {
    [(APCarPlayAVVCDevice *)self stopRecordingWithOptionalForcedError:1919115630];
  }
  else if (CFEqual(a3, @"avvcDevice_ConnectionLost"))
  {
    if (dword_CDC8 <= 50 && (dword_CDC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(APCarPlayAVVCDevice *)self stopRecordingWithOptionalForcedError:1919115630];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFStringRef v9 = (const __CFString *)kFigEndpointNotification_EndpointDeactivated;
    CFNotificationCenterPostNotification(LocalCenter, v9, self, 0, 1u);
  }
}

- (AVAudioFormat)format
{
  return self->format;
}

- (void)setFormat:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSArray)supportedFormats
{
  return self->supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
}

- (id)audioInputBlock
{
  return self->audioInputBlock;
}

- (void)setAudioInputBlock:(id)a3
{
}

@end