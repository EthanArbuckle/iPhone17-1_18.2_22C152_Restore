@interface CMCatherineFeederInternal
- (CMCatherineFeederInternal)init;
- (void)_feedCatherine:(double)a3 confidence:(double)a4 timestamp:(double)a5;
- (void)_startDaemonConnection;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMCatherineFeederInternal

- (CMCatherineFeederInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMCatherineFeederInternal;
  v2 = [(CMCatherineFeederInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMCatherineFeeder.internal", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMCatherineFeederInternal;
  [(CMCatherineFeederInternal *)&v3 dealloc];
}

- (void)_teardown
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startDaemonConnection
{
  CLConnectionClient::setDefaultMessageHandler();
  fLocationdConnection = (CLConnectionClient *)self->fLocationdConnection;

  CLConnectionClient::start(fLocationdConnection);
}

- (void)_feedCatherine:(double)a3 confidence:(double)a4 timestamp:(double)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v8 = [CMCatherineData alloc];
  v11 = objc_msgSend_initWithCatherine_confidence_timestamp_(v8, v9, v10, a3, a4, a5);
  v17 = @"kCLConnectionMessageCatherineDataKey";
  v18[0] = v11;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v18, &v17, 1);

  sub_1905869D4("kCLConnectionMessageCatherineData", &v16, &v14);
  v13 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v13) {
    sub_1902D8B58(v13);
  }
  if (v15) {
    sub_1902D8B58(v15);
  }
}

@end