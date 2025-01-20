@interface CMNatalimeterInternal
- (CMNatalimeterInternal)init;
- (unint64_t)_promptsNeeded;
- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4;
- (void)_queryAbsoluteNatalimetryDataSinceDataRecord:(id)a3 withHandler:(id)a4;
- (void)_queryAbsoluteNatalimetryDataSinceRecord:(int64_t)a3 withHandler:(id)a4;
- (void)_startAbsoluteNatalimetryDataUpdatesWithHandler:(id)a3;
- (void)_stopAbsoluteNatalimetryDataUpdates;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMNatalimeterInternal

- (CMNatalimeterInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMNatalimeterInternal;
  v2 = [(CMNatalimeterInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMNatalimeter", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMNatalimeterInternal;
  [(CMNatalimeterInternal *)&v3 dealloc];
}

- (void)_teardown
{
  id fHandler = self->fHandler;
  if (fHandler)
  {

    self->id fHandler = 0;
  }
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    uint64_t v5 = MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    MEMORY[0x192FCC980](v5, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_queryAbsoluteNatalimetryDataSinceRecord:(int64_t)a3 withHandler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904EB8B0;
  block[3] = &unk_1E568E590;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_queryAbsoluteNatalimetryDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904EBB08;
  block[3] = &unk_1E568D398;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4
{
  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v12 = (NSSet *)objc_msgSend_setWithObjects_(v6, v11, v7, v8, v9, v10, 0);
  if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v12)) != 0)
  {
    v15 = DictionaryOfClasses;
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v14, @"CMErrorMessage");
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v15, v17, @"CMNatalimetryNatalieDataArray");
    if (v16)
    {
      v19 = v22;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_1904EC42C;
      v22[3] = &unk_1E568D320;
      v22[4] = v16;
      v22[5] = var1;
    }
    else if (v18)
    {
      v19 = v21;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1904EC4A4;
      v21[3] = &unk_1E568D320;
      v21[4] = v18;
      v21[5] = var1;
    }
    else
    {
      v19 = v20;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1904EC4BC;
      v20[3] = &unk_1E568D2D0;
      v20[4] = var1;
    }
  }
  else
  {
    v19 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1904EC3C8;
    block[3] = &unk_1E568D2D0;
    block[4] = var1;
  }
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

- (void)_startAbsoluteNatalimetryDataUpdatesWithHandler:(id)a3
{
  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904EC594;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopAbsoluteNatalimetryDataUpdates
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904ECE78;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (unint64_t)_promptsNeeded
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  sub_190429020("kCLConnectionMessageNatalimetryCalibrationPromptsNeeded", &v28);
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_setWithObjects_(v2, v5, v3, v4, 0);
  uint64_t v26 = v28;
  v27 = v29;
  if (v29) {
    atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v6, (uint64_t)&v26, v7);
  if (v27) {
    sub_1902D8B58(v27);
  }
  if (!v9)
  {
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    v23 = qword_1E929D768;
    if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_ERROR, "Prompts needed response invalid.", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    LOWORD(v30) = 0;
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMNatalimeterInternal _promptsNeeded]", "CoreLocation: %s\n", v22);
    if (v22 == (char *)buf) {
      goto LABEL_21;
    }
LABEL_30:
    free(v22);
    goto LABEL_21;
  }
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v9, v8, @"CMErrorMessage");
  v12 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"CMReturnCode");
  if (v10)
  {
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    v15 = qword_1E929D768;
    if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend_integerValue(v10, v16, v17);
      *(_DWORD *)buf = 134349056;
      uint64_t v33 = v18;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_ERROR, "Querying for calibration prompts encountered an error: %{public}ld.", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 0)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    uint64_t v21 = objc_msgSend_integerValue(v10, v19, v20);
    int v30 = 134349056;
    uint64_t v31 = v21;
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMNatalimeterInternal _promptsNeeded]", "CoreLocation: %s\n", v22);
    if (v22 == (char *)buf) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
  if (!v12)
  {
LABEL_21:
    unint64_t v24 = 0;
    goto LABEL_22;
  }
  unint64_t v24 = objc_msgSend_unsignedIntegerValue(v12, v13, v14);
LABEL_22:
  if (v29) {
    sub_1902D8B58(v29);
  }
  return v24;
}

@end