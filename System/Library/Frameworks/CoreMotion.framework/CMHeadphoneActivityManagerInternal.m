@interface CMHeadphoneActivityManagerInternal
- (BOOL)mslLoggingEnabledPrivate;
- (CMHeadphoneActivityManagerInternal)init;
- (id).cxx_construct;
- (void)connectActivity;
- (void)connectStatus;
- (void)dealloc;
- (void)disconnectActivity;
- (void)disconnectStatus;
- (void)onAudioAccessoryDeviceMotion:(const void *)a3;
- (void)startMslLoggingPrivateWithFilenamePrefix:(id)a3 filePath:(id)a4;
- (void)stopMslLoggingPrivate;
- (void)updatePreferences;
@end

@implementation CMHeadphoneActivityManagerInternal

- (CMHeadphoneActivityManagerInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMHeadphoneActivityManagerInternal;
  v2 = [(CMHeadphoneActivityManagerInternal *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMHeadphoneMotionManager", v3);
    v2->_activityConnectionClient = 0;
    v2->_statusConnectionClient = 0;
    *(_WORD *)&v2->_activityActive = 0;
    *(_WORD *)&v2->_statusActive = 0;
    v2->_deviceConnected = 0;
    v2->_startTime = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMHeadphoneActivityManagerInternal;
  [(CMHeadphoneActivityManagerInternal *)&v3 dealloc];
}

- (void)connectActivity
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activityConnectionClient)
  {
    objc_super v3 = (RMConnectionClient *)sub_19047CD80((id *)[RMConnectionClient alloc], self->_dispatchQueue, @"com.apple.relatived.public", &unk_1EDFD26C0);
    self->_activityConnectionClient = v3;
    sub_19047D4E0((uint64_t)v3);
  }
}

- (void)disconnectActivity
{
  self->_activityConnectionClient = 0;
}

- (void)connectStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusConnectionClient)
  {
    objc_super v3 = (RMConnectionClient *)sub_19047CD80((id *)[RMConnectionClient alloc], self->_dispatchQueue, @"com.apple.relatived.status", &unk_1EDFC3888);
    self->_statusConnectionClient = v3;
    sub_19047D4E0((uint64_t)v3);
  }
}

- (void)disconnectStatus
{
  self->_statusConnectionClient = 0;
}

- (void)updatePreferences
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  operator new();
}

- (BOOL)mslLoggingEnabledPrivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend_updatePreferences(self, v3, v4);
  return self->_enableMSL;
}

- (void)startMslLoggingPrivateWithFilenamePrefix:(id)a3 filePath:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend_updatePreferences(self, v7, v8);
  if (self->_enableMSL)
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F40);
    }
    v9 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneActivityManager] Starting MSL Logging", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F40);
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal startMslLoggingPrivateWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    objc_msgSend_cStringUsingEncoding_(a3, v10, 1);
    objc_msgSend_cStringUsingEncoding_(a4, v11, 1);
    operator new();
  }
}

- (void)stopMslLoggingPrivate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_enableMSL)
  {
    if (qword_1EB3BE878 != -1) {
      dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F40);
    }
    objc_super v3 = off_1EB3BE870;
    if (os_log_type_enabled((os_log_t)off_1EB3BE870, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneActivityManager] Stopping MSL Logging.", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE878 != -1) {
        dispatch_once(&qword_1EB3BE878, &unk_1EDFC1F40);
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal stopMslLoggingPrivate]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    if (self->_accessoryAccelerometerDispatcher.__ptr_.__value_)
    {
      if (qword_1E929EAA8 != -1) {
        dispatch_once(&qword_1E929EAA8, &unk_1EDFD24A0);
      }
      sub_1902CDE08(qword_1E929EAA0, 0, (uint64_t)self->_accessoryAccelerometerDispatcher.__ptr_.__value_);
      value = self->_accessoryAccelerometerDispatcher.__ptr_.__value_;
      self->_accessoryAccelerometerDispatcher.__ptr_.__value_ = 0;
      if (value) {
        (*((void (**)(Dispatcher *))value->var0 + 1))(value);
      }
    }
    if (self->_accessoryGyroDispatcher.__ptr_.__value_)
    {
      if (qword_1E929EAE0 != -1) {
        dispatch_once(&qword_1E929EAE0, &unk_1EDFD2C60);
      }
      sub_1902CDE08(qword_1E929EAD8, 0, (uint64_t)self->_accessoryGyroDispatcher.__ptr_.__value_);
      objc_super v5 = self->_accessoryGyroDispatcher.__ptr_.__value_;
      self->_accessoryGyroDispatcher.__ptr_.__value_ = 0;
      if (v5) {
        (*((void (**)(Dispatcher *))v5->var0 + 1))(v5);
      }
    }
    if (self->_accessoryDeviceMotionDispatcher.__ptr_.__value_)
    {
      uint64_t v6 = sub_1905298B4();
      sub_1902CDE08(v6, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher.__ptr_.__value_);
      v7 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
      if (v7) {
        (*((void (**)(Dispatcher *))v7->var0 + 1))(v7);
      }
    }
    if (self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_)
    {
      uint64_t v8 = sub_1905298B4();
      sub_1902CDE08(v8, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_);
      v9 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
      if (v9) {
        (*((void (**)(Dispatcher *))v9->var0 + 1))(v9);
      }
    }
    if (self->_deviceMotionDispatcher.__ptr_.__value_)
    {
      uint64_t v10 = sub_1902B35C0();
      sub_1902E02F4(v10, (uint64_t)self->_deviceMotionDispatcher.__ptr_.__value_);
      v11 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
      if (v11) {
        (*((void (**)(Dispatcher *))v11->var0 + 1))(v11);
      }
    }
    sub_1904378CC((uint64_t **)&self->fLogger, 0);
  }
}

- (void)onAudioAccessoryDeviceMotion:(const void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  value = (uint64_t *)self->fLogger.__ptr_.__value_;
  if (value) {
    sub_190456160(value, (int *)a3);
  }
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFC1F20);
  }
  uint64_t v6 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *((unsigned __int8 *)a3 + 141);
    double v8 = *((float *)a3 + 32);
    double v9 = *((float *)a3 + 33);
    double v10 = *((float *)a3 + 34);
    *(_DWORD *)buf = 67240961;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)v15 = 2049;
    *(double *)&v15[2] = v8;
    *(_WORD *)&v15[10] = 2049;
    *(double *)&v15[12] = v9;
    __int16 v16 = 2049;
    double v17 = v10;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEBUG, "[CMHeadphoneActivityManager] Received DM6 packet,activity,%{public}u,gyro bias,[%{private}.4f,%{private}.4f,%{private}.4f]", buf, 0x26u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFC1F20);
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal onAudioAccessoryDeviceMotion:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if (!self->_isGyroBiasValid && *((unsigned char *)a3 + 140))
  {
    int v11 = *((_DWORD *)a3 + 34);
    v12 = operator new(0x10uLL);
    *(void *)buf = v12;
    *(void *)&v15[8] = v12 + 4;
    *(void *)v12 = *((void *)a3 + 16);
    v12[2] = v11;
    v12[3] = 1106247680;
    *(void *)v15 = v12 + 4;
    if (self->fLogger.__ptr_.__value_)
    {
      sub_1904599D4();
      v12 = *(_DWORD **)buf;
      self->_isGyroBiasValid = 1;
      if (!v12) {
        return;
      }
    }
    else
    {
      self->_isGyroBiasValid = 1;
    }
    *(void *)v15 = v12;
    operator delete(v12);
  }
}

- (void).cxx_destruct
{
  sub_1904378CC((uint64_t **)&self->fLogger, 0);
  value = self->_deviceMotionDispatcher.__ptr_.__value_;
  self->_deviceMotionDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*((void (**)(Dispatcher *))value->var0 + 1))(value);
  }
  uint64_t v4 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
  if (v4) {
    (*((void (**)(Dispatcher *))v4->var0 + 1))(v4);
  }
  objc_super v5 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v5) {
    (*((void (**)(Dispatcher *))v5->var0 + 1))(v5);
  }
  uint64_t v6 = self->_accessoryGyroDispatcher.__ptr_.__value_;
  self->_accessoryGyroDispatcher.__ptr_.__value_ = 0;
  if (v6) {
    (*((void (**)(Dispatcher *))v6->var0 + 1))(v6);
  }
  int v7 = self->_accessoryAccelerometerDispatcher.__ptr_.__value_;
  self->_accessoryAccelerometerDispatcher.__ptr_.__value_ = 0;
  if (v7) {
    (*((void (**)(Dispatcher *))v7->var0 + 1))(v7);
  }
  double v8 = self->_motionSettings.__ptr_.__value_;
  self->_motionSettings.__ptr_.__value_ = 0;
  if (v8)
  {
    double v9 = *(void (**)(void))(*(void *)v8 + 8);
    v9();
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  return self;
}

@end