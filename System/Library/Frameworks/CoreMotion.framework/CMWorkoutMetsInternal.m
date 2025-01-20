@interface CMWorkoutMetsInternal
- (CMWorkoutMetsInternal)init;
- (void)_queryWorkoutMetsWithSessionId:(id)a3 handler:(id)a4;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMWorkoutMetsInternal

- (CMWorkoutMetsInternal)init
{
  if (!objc_msgSend_isAvailable(CMWorkoutMets, a2, v2)) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CMWorkoutMetsInternal;
  v4 = [(CMWorkoutMetsInternal *)&v6 init];
  if (v4)
  {
    v4->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMWorkoutMets", 0);
    operator new();
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutMetsInternal;
  [(CMWorkoutMetsInternal *)&v3 dealloc];
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

- (void)_queryWorkoutMetsWithSessionId:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D760 != -1) {
    dispatch_once(&qword_1E929D760, &unk_1EDFD3AC0);
  }
  v7 = qword_1E929D768;
  if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = objc_msgSend_UUIDString(a3, v8, v9);
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "Workout Mets query for session: %@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD3AC0);
    }
    int v15 = 138412290;
    uint64_t v16 = objc_msgSend_UUIDString(a3, v11, v12);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutMetsInternal _queryWorkoutMetsWithSessionId:handler:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19058DDB4;
  block[3] = &unk_1E568D410;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(fInternalQueue, block);
}

@end