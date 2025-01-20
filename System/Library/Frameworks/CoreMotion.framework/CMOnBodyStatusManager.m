@interface CMOnBodyStatusManager
+ (BOOL)isOnBodyStatusDetectionAvailable;
+ (id)sharedOnBodyStatusManager;
- (CMOnBodyStatusManager)init;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)setPropertiesWithDictionary:(id)a3;
- (void)startOnBodyStatusDetectionPrivateToQueue:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)startOnBodyStatusDetectionToQueue:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)stopOnBodyStatusDetection;
- (void)stopOnBodyStatusDetectionPrivate;
@end

@implementation CMOnBodyStatusManager

- (CMOnBodyStatusManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMOnBodyStatusManager;
  v4 = [(CMOnBodyStatusManager *)&v6 init];
  if (v4)
  {
    if (objc_msgSend_isOnBodyStatusDetectionAvailable(CMOnBodyStatusManager, v2, v3))
    {
      v4->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOnBodyStatusManagerPrivateQueue", 0);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMOnBodyStatusManager;
  [(CMOnBodyStatusManager *)&v2 dealloc];
}

+ (BOOL)isOnBodyStatusDetectionAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return ((unint64_t)sub_1902CD6B0() >> 11) & 1;
  }
  return v2;
}

+ (id)sharedOnBodyStatusManager
{
  if (qword_1EB3BEAE8 != -1) {
    dispatch_once(&qword_1EB3BEAE8, &unk_1EDFD1840);
  }
  return (id)qword_1EB3BEAE0;
}

- (void)startOnBodyStatusDetectionToQueue:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  fPrivateQueue = self->fPrivateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190492F30;
  v6[3] = &unk_1E568DCF8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(fPrivateQueue, v6);
}

- (void)stopOnBodyStatusDetection
{
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190492FB4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

- (void)setPropertiesWithDictionary:(id)a3
{
  if (sub_190539BB4((uint64_t)a3))
  {
    fPrivateQueue = self->fPrivateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_190493048;
    v6[3] = &unk_1E568D190;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(fPrivateQueue, v6);
  }
}

- (void)connect
{
  if (!self->fLocationdConnection) {
    operator new();
  }
}

- (void)disconnect
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
    self->fLocationdConnection = 0;
  }
}

- (void)startOnBodyStatusDetectionPrivateToQueue:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  if (a3 && a5)
  {
    fOnBodyStatusQueue = self->fOnBodyStatusQueue;
    if (fOnBodyStatusQueue != a3)
    {

      self->fOnBodyStatusQueue = (OS_dispatch_queue *)a3;
    }
    id fOnBodyStatusHandler = self->fOnBodyStatusHandler;
    if (fOnBodyStatusHandler != a5)
    {

      self->id fOnBodyStatusHandler = (id)objc_msgSend_copy(a5, v11, v12);
    }
    objc_msgSend_connect(self, a2, (uint64_t)a3);
    if (sub_190539BB4((uint64_t)a4))
    {
      sub_19044F990("kCLConnectionMessageOnBodyDetectionParams", &v19, buf);
      v17[2] = *(void *)buf;
      v18 = v23;
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v18) {
        sub_1902D8B58(v18);
      }
      if (v23) {
        sub_1902D8B58(v23);
      }
    }
    if (!self->fSubscribedToOnBodyStatusDetection)
    {
      v20 = @"kCLConnectionMessageSubscribeKey";
      uint64_t v21 = MEMORY[0x1E4F1CC38];
      v17[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)&v21, &v20, 1);
      sub_190493DEC("kCLConnectionMessageOnBodyDetection", v17, buf);
      v16 = v23;
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v16) {
        sub_1902D8B58(v16);
      }
      self->fSubscribedToOnBodyStatusDetection = 1;
      if (v23) {
        sub_1902D8B58(v23);
      }
    }
  }
  else
  {
    if (qword_1E929D988 != -1) {
      dispatch_once(&qword_1E929D988, &unk_1EDFD39C0);
    }
    v14 = qword_1E929D990;
    if (os_log_type_enabled((os_log_t)qword_1E929D990, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_FAULT, "Neither the queue nor the handler can be nil", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D988 != -1) {
        dispatch_once(&qword_1E929D988, &unk_1EDFD39C0);
      }
      LOWORD(v17[0]) = 0;
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMOnBodyStatusManager startOnBodyStatusDetectionPrivateToQueue:withParameters:handler:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
}

- (void)stopOnBodyStatusDetectionPrivate
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->fOnBodyStatusQueue && self->fOnBodyStatusHandler)
  {
    v9 = @"kCLConnectionMessageSubscribeKey";
    v10[0] = MEMORY[0x1E4F1CC28];
    uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v10, &v9, 1);
    sub_190493DEC("kCLConnectionMessageOnBodyDetection", &v8, &v6);
    v5 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v5) {
      sub_1902D8B58(v5);
    }
    self->fSubscribedToOnBodyStatusDetection = 0;

    self->fOnBodyStatusQueue = 0;
    self->id fOnBodyStatusHandler = 0;
    objc_msgSend_disconnect(self, v3, v4);
    if (v7) {
      sub_1902D8B58(v7);
    }
  }
}

@end