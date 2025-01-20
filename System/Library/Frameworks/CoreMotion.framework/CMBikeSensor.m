@interface CMBikeSensor
+ (BOOL)isAvailable;
- (CMBikeSensor)init;
- (CMBikeSensorInternal)_internal;
- (void)dealloc;
- (void)feedBikeSensorData:(id)a3;
@end

@implementation CMBikeSensor

- (CMBikeSensor)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMBikeSensor;
  v2 = [(CMBikeSensor *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMBikeSensorInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190527908;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMBikeSensor;
  [(CMBikeSensor *)&v5 dealloc];
}

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (void)feedBikeSensorData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BF398 != -1) {
    dispatch_once(&qword_1EB3BF398, &unk_1EDFD3840);
  }
  if (qword_1EB3BF390 == 3)
  {
    objc_msgSend_instantaneousPower(a3, a2, (uint64_t)a3);
    if (v7 >= 1.79769313e308 && (objc_msgSend_instantaneousCadence(a3, v5, v6), v8 >= 1.79769313e308))
    {
      if (qword_1E929D760 != -1) {
        dispatch_once(&qword_1E929D760, &unk_1EDFD3A60);
      }
      v13 = qword_1E929D768;
      if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_instantaneousPower(a3, v14, v15);
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v16;
        _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "CMBikeSensor::feedBikeSensorData the input variable is beyond the limit and was rejected: %f", buf, 0xCu);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D760 != -1) {
          dispatch_once(&qword_1E929D760, &unk_1EDFD3A60);
        }
        objc_msgSend_instantaneousPower(a3, v17, v18);
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMBikeSensor feedBikeSensorData:]", "CoreLocation: %s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
    }
    else
    {
      uint64_t v9 = objc_msgSend_newFitnessMachineDataFromBikeSensorData(a3, v5, v6);
      uint64_t v12 = objc_msgSend__internal(self, v10, v11);
      MEMORY[0x1F4181798](v12, sel__feedBikeSensorData_, v9);
    }
  }
}

- (CMBikeSensorInternal)_internal
{
  return self->_internal;
}

@end