@interface CMCatherineFeeder
- (CMCatherineFeeder)init;
- (CMCatherineFeederInternal)internal;
- (void)dealloc;
- (void)feedCatherine:(double)a3 confidence:(double)a4;
@end

@implementation CMCatherineFeeder

- (CMCatherineFeeder)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMCatherineFeeder;
  v2 = [(CMCatherineFeeder *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMCatherineFeederInternal);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v4 = *(NSObject **)(objc_msgSend_internal(self, a2, v2) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190587140;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);

  v5.receiver = self;
  v5.super_class = (Class)CMCatherineFeeder;
  [(CMCatherineFeeder *)&v5 dealloc];
}

- (void)feedCatherine:(double)a3 confidence:(double)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D760 != -1) {
    dispatch_once(&qword_1E929D760, &unk_1EDFC2060);
  }
  v7 = qword_1E929D768;
  if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    double v18 = a3;
    __int16 v19 = 2049;
    double v20 = a4;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEBUG, "feedCatherine called with HR %{private}f, confidence %{private}f", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFC2060);
    }
    int v13 = 134283777;
    double v14 = a3;
    __int16 v15 = 2049;
    double v16 = a4;
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMCatherineFeeder feedCatherine:confidence:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  v10 = *(NSObject **)(objc_msgSend_internal(self, v8, v9) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190587380;
  block[3] = &unk_1E568DAC8;
  block[4] = self;
  *(double *)&void block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(v10, block);
}

- (CMCatherineFeederInternal)internal
{
  return self->_internal;
}

@end