@interface CMSpringTrackerInternal
- (BOOL)_isTracking;
- (CMSpringTrackerInternal)init;
- (void)_handleStartStopResponse:(shared_ptr<CLConnectionMessage>)a3 handler:(id)a4;
- (void)_querySpringDataFromRecord:(id)a3 handler:(id)a4;
- (void)_startWithHandler:(id)a3;
- (void)_stopWithHandler:(id)a3;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMSpringTrackerInternal

- (CMSpringTrackerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSpringTrackerInternal;
  v2 = [(CMSpringTrackerInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSpringTracker", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSpringTrackerInternal;
  [(CMSpringTrackerInternal *)&v3 dealloc];
}

- (void)_teardown
{
  self->fHandler = 0;
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (BOOL)_isTracking
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904BCD3C;
  block[3] = &unk_1E568DDD8;
  block[4] = &v6;
  dispatch_sync(fInternalQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startWithHandler:(id)a3
{
  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904BCF54;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopWithHandler:(id)a3
{
  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904BD1C8;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_handleStartStopResponse:(shared_ptr<CLConnectionMessage>)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3.var1)
  {
    var0 = (CLConnectionMessage **)a3.var0;
    id v5 = (id)objc_msgSend_copy(a3.var1, a2, (uint64_t)a3.var0);
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v10 = (NSSet *)objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v10)) != 0)
    {
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v12, @"CMErrorMessage");
      if (v13)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = sub_1904BD840;
        v21[3] = &unk_1E568D2F8;
        v21[4] = v13;
        v21[5] = v5;
        v14 = MEMORY[0x1E4F14428];
        v15 = v21;
      }
      else
      {
        if (qword_1E929DA48 != -1) {
          dispatch_once(&qword_1E929DA48, &unk_1EDFD3C40);
        }
        v17 = qword_1E929DA50;
        if (os_log_type_enabled((os_log_t)qword_1E929DA50, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_FAULT, "Error parsing start / stop response.", buf, 2u);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929DA48 != -1) {
            dispatch_once(&qword_1E929DA48, &unk_1EDFD3C40);
          }
          __int16 v23 = 0;
          v19 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMSpringTrackerInternal _handleStartStopResponse:handler:]", "CoreLocation: %s\n", v19);
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = sub_1904BD8D4;
        v20[3] = &unk_1E568D2D0;
        v20[4] = v5;
        v14 = MEMORY[0x1E4F14428];
        v15 = v20;
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1904BD7E0;
      block[3] = &unk_1E568D2D0;
      block[4] = v5;
      v14 = MEMORY[0x1E4F14428];
      v15 = block;
    }
    dispatch_async(v14, v15);
  }
  else
  {
    if (qword_1E929DA48 != -1) {
      dispatch_once(&qword_1E929DA48, &unk_1EDFD3C40);
    }
    v16 = qword_1E929DA50;
    if (os_log_type_enabled((os_log_t)qword_1E929DA50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_FAULT, "Error responding to start / stop tracking request, handler unavailable.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929DA48 != -1) {
        dispatch_once(&qword_1E929DA48, &unk_1EDFD3C40);
      }
      __int16 v23 = 0;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSpringTrackerInternal _handleStartStopResponse:handler:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
}

- (void)_querySpringDataFromRecord:(id)a3 handler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904BD9AC;
  block[3] = &unk_1E568D398;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

@end