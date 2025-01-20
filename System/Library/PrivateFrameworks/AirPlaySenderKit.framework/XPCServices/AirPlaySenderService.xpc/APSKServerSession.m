@interface APSKServerSession
- (APSKServerSession)init;
- (int)sendAudioDataFromXPCParams:(id)a3;
- (int)sendFrameFromXPCParams:(id)a3;
- (int)setAuthStringFromXPCParams:(id)a3;
- (int)startWithXPCParams:(id)a3;
- (void)dealloc;
- (void)handleAuthRequired:(int)a3;
- (void)handleFailure:(int)a3;
- (void)handleStartCompletion:(int)a3;
- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5;
- (void)handleVideoStreamErrorNotification:(int)a3;
- (void)setObjectID:(unint64_t)a3 andConnection:(id)a4;
- (void)stop;
@end

@implementation APSKServerSession

- (APSKServerSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)APSKServerSession;
  v2 = [(APSKServerSession *)&v4 init];
  if (v2)
  {
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  return v2;
}

- (void)dealloc
{
  [(APSKServerSession *)self stop];
  FigSimpleMutexDestroy();
  self->_lock = 0;
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
  {
    v3 = self;
    LogPrintF();
  }
  v4.receiver = self;
  v4.super_class = (Class)APSKServerSession;
  [(APSKServerSession *)&v4 dealloc];
}

- (void)stop
{
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_senderNotifObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_senderNotifObserver];

    senderNotifObserver = self->_senderNotifObserver;
    self->_senderNotifObserver = 0;
  }
  sender = self->_sender;
  if (sender)
  {
    sub_100006424((uint64_t)sender);
    v6 = self->_sender;
    if (v6)
    {
      CFRelease(v6);
      self->_sender = 0;
    }
  }
  FigSimpleMutexLock();
  connection = self->_connection;
  self->_connection = 0;
  self->_objectID = 0;

  FigSimpleMutexUnlock();
}

- (int)startWithXPCParams:(id)a3
{
  id v4 = a3;
  CFTypeRef v40 = 0;
  int uint64 = xpc_dictionary_get_uint64(v4, off_1000102D0);
  string = xpc_dictionary_get_string(v4, off_1000102E0);
  CFTypeRef v39 = 0;
  int v7 = xpc_dictionary_get_uint64(v4, off_1000102C8);
  int v8 = xpc_dictionary_get_uint64(v4, off_1000102D8);
  objc_initWeak(&location, self);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100003338;
  v36[3] = &unk_10000C980;
  objc_copyWeak(&v37, &location);
  v26 = objc_retainBlock(v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100003388;
  v34[3] = &unk_10000C980;
  objc_copyWeak(&v35, &location);
  v9 = objc_retainBlock(v34);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000033D8;
  v32[3] = &unk_10000C980;
  objc_copyWeak(&v33, &location);
  v10 = objc_retainBlock(v32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100003428;
  v30[3] = &unk_10000C9A8;
  objc_copyWeak(&v31, &location);
  v25 = objc_retainBlock(v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100003490;
  v28[3] = &unk_10000C9D0;
  objc_copyWeak(&v29, &location);
  v24 = objc_retainBlock(v28);
  int v11 = FigXPCMessageCopyCFObject();
  if (v11) {
    goto LABEL_36;
  }
  if (!v39 || !uint64)
  {
    int v11 = -6705;
    APSLogErrorAt();
    goto LABEL_40;
  }
  if (self->_sender)
  {
    int v11 = -6709;
    APSLogErrorAt();
    goto LABEL_40;
  }
  sender = (OpaqueAPMediaSender *)sub_100004488();
  self->_sender = sender;
  if (!sender)
  {
    int v11 = -6762;
    APSLogErrorAt();
    goto LABEL_40;
  }
  if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1 || (int v13 = _LogCategory_Initialize(), sender = self->_sender, v13))
    {
      v22 = self;
      v23 = sender;
      LogPrintF();
      sender = self->_sender;
    }
  }
  if (string)
  {
    int v11 = sub_100005028((uint64_t)sender, +[NSString stringWithUTF8String:string]);
    if (v11)
    {
LABEL_36:
      APSLogErrorAt();
      goto LABEL_40;
    }
    sender = self->_sender;
  }
  int v11 = sub_1000046A8((uint64_t)sender, (uint64_t)v26);
  if (v11) {
    goto LABEL_36;
  }
  int v11 = sub_1000047FC((uint64_t)self->_sender, (uint64_t)v10);
  if (v11) {
    goto LABEL_36;
  }
  if ((uint64 & 2) == 0) {
    goto LABEL_19;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v4, off_100010308, &length);
  if (!data || length != 40)
  {
    int v11 = -6705;
    APSLogErrorAt();
    goto LABEL_40;
  }
  v15 = self->_sender;
  char v16 = xpc_dictionary_get_BOOL(v4, off_100010300);
  int v11 = sub_100004E60((uint64_t)v15, (uint64_t)data, v16);
  if (!v11)
  {
LABEL_19:
    if ((uint64 & 1) == 0)
    {
LABEL_26:
      sub_1000051D8((uint64_t)self->_sender, v39, v7, uint64, v8, (uint64_t)v9);
      int v11 = 0;
      goto LABEL_27;
    }
    int v11 = FigXPCMessageCopyCFDictionary();
    if (!v11)
    {
      int v11 = sub_100004C7C((uint64_t)self->_sender, v40);
      if (!v11)
      {
        int v11 = sub_100004950((uint64_t)self->_sender, (uint64_t)v25);
        if (!v11 && (!xpc_dictionary_get_BOOL(v4, off_1000102F0) || (int v11 = sub_100004AB4((uint64_t)self->_sender)) == 0))
        {
          v17 = +[NSNotificationCenter defaultCenter];
          v18 = [v17 addObserverForName:@"APMediaSender_VideoStreamFailed" object:self->_sender queue:0 usingBlock:v24];
          senderNotifObserver = self->_senderNotifObserver;
          self->_senderNotifObserver = v18;

          goto LABEL_26;
        }
      }
    }
  }
  APSLogErrorAt();
LABEL_40:
  if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v21 = self->_sender;
  if (v21)
  {
    CFRelease(v21);
    self->_sender = 0;
  }
LABEL_27:
  if (v39) {
    CFRelease(v39);
  }
  if (v40) {
    CFRelease(v40);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  return v11;
}

- (int)setAuthStringFromXPCParams:(id)a3
{
  string = xpc_dictionary_get_string(a3, off_1000102E0);
  sender = self->_sender;
  if (!sender)
  {
    int v7 = -6709;
LABEL_8:
    APSLogErrorAt();
    return v7;
  }
  if (string) {
    v6 = +[NSString stringWithUTF8String:string];
  }
  else {
    v6 = 0;
  }
  int v7 = sub_100005028((uint64_t)sender, v6);
  if (v7) {
    goto LABEL_8;
  }
  return v7;
}

- (int)sendFrameFromXPCParams:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v11 = 0;
  CFTypeRef cf = 0;
  if (self->_sender)
  {
    v6 = xpc_dictionary_get_value(v4, off_1000102E8);
    int v7 = v6;
    if (v6)
    {
      int v8 = sub_100008AF8(v6, (CVPixelBufferRef *)&cf, &v11);
      if (v8)
      {
        int v9 = v8;
      }
      else
      {
        int v9 = sub_1000065CC((uint64_t)self->_sender, (uint64_t)cf, v11);
        if (!v9) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      int v9 = -6705;
    }
    APSLogErrorAt();
  }
  else
  {
    int v9 = -6709;
    APSLogErrorAt();
    int v7 = 0;
  }
LABEL_5:
  if (cf) {
    CFRelease(cf);
  }

  return v9;
}

- (int)sendAudioDataFromXPCParams:(id)a3
{
  id v4 = a3;
  v5 = v4;
  long long v19 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  size_t length = 0;
  if (!self->_sender)
  {
    int v14 = -6709;
    APSLogErrorAt();
    goto LABEL_11;
  }
  data = (const UInt8 *)xpc_dictionary_get_data(v4, off_100010310, &length);
  if (data)
  {
    CFDataRef v7 = CFDataCreate(kCFAllocatorDefault, data, length);
    int CMTime = FigXPCMessageGetCMTime();
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, off_100010320);
    BOOL v10 = xpc_dictionary_get_BOOL(v5, off_100010328);
    if (CMTime)
    {
      int v11 = sub_100006790((uint64_t)self->_sender, (uint64_t)v7);
      goto LABEL_8;
    }
    char v12 = v10;
  }
  else
  {
    char v12 = 0;
    uint64_t uint64 = 0;
    CFDataRef v7 = 0;
  }
  sender = self->_sender;
  long long v16 = v19;
  CMTimeEpoch v17 = epoch;
  int v11 = sub_100006950((uint64_t)sender, (uint64_t)v7, &v16, uint64, v12);
LABEL_8:
  int v14 = v11;
  if (v11)
  {
    APSLogErrorAt();
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v7) {
LABEL_10:
  }
    CFRelease(v7);
LABEL_11:

  return v14;
}

- (void)setObjectID:(unint64_t)a3 andConnection:(id)a4
{
  v6 = (OS_xpc_object *)a4;
  FigSimpleMutexLock();
  connection = self->_connection;
  self->_connection = v6;
  self->_objectID = a3;
  int v8 = v6;

  FigSimpleMutexUnlock();
}

- (void)handleAuthRequired:(int)a3
{
  FigSimpleMutexLock();
  if (self->_objectID && self->_connection)
  {
    int v5 = FigXPCCreateBasicMessage();
    id v6 = 0;
    CFDataRef v7 = v6;
    if (v5)
    {
      APSLogErrorAt();
    }
    else
    {
      xpc_dictionary_set_uint64(v6, off_100010338, a3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }
  else
  {
    CFDataRef v7 = 0;
  }
  FigSimpleMutexUnlock();
  FigXPCRelease();
}

- (void)handleStartCompletion:(int)a3
{
  if (a3)
  {
    if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  FigSimpleMutexLock();
  if (self->_objectID && self->_connection)
  {
    int v5 = FigXPCCreateBasicMessage();
    id v6 = 0;
    CFDataRef v7 = v6;
    if (v5)
    {
      APSLogErrorAt();
    }
    else
    {
      xpc_dictionary_set_uint64(v6, off_100010330, a3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }
  else
  {
    CFDataRef v7 = 0;
  }
  FigSimpleMutexUnlock();
  FigXPCRelease();
}

- (void)handleFailure:(int)a3
{
  if (dword_100010248 <= 100 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  FigSimpleMutexLock();
  if (self->_objectID && self->_connection)
  {
    int v5 = FigXPCCreateBasicMessage();
    id v6 = 0;
    CFDataRef v7 = v6;
    if (v5)
    {
      APSLogErrorAt();
    }
    else
    {
      xpc_dictionary_set_uint64(v6, off_100010330, a3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }
  else
  {
    CFDataRef v7 = 0;
  }
  FigSimpleMutexUnlock();
  FigXPCRelease();
}

- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5
{
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  FigSimpleMutexLock();
  if (self->_objectID && self->_connection)
  {
    int v9 = FigXPCCreateBasicMessage();
    id v10 = 0;
    int v11 = v10;
    if (v9)
    {
      APSLogErrorAt();
    }
    else
    {
      xpc_dictionary_set_uint64(v10, off_100010340, a3);
      xpc_dictionary_set_uint64(v11, off_100010348, a4);
      xpc_dictionary_set_uint64(v11, off_100010350, a5);
      xpc_connection_send_message(self->_connection, v11);
    }
  }
  else
  {
    int v11 = 0;
  }
  FigSimpleMutexUnlock();
  FigXPCRelease();
}

- (void)handleVideoStreamErrorNotification:(int)a3
{
  if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  FigSimpleMutexLock();
  if (self->_objectID && self->_connection)
  {
    int v5 = FigXPCCreateBasicMessage();
    id v6 = 0;
    CFDataRef v7 = v6;
    if (v5)
    {
      APSLogErrorAt();
    }
    else
    {
      xpc_dictionary_set_uint64(v6, off_100010330, a3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }
  else
  {
    CFDataRef v7 = 0;
  }
  FigSimpleMutexUnlock();
  FigXPCRelease();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_senderNotifObserver, 0);
}

@end