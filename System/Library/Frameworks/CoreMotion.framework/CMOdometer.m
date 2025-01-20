@interface CMOdometer
- (CMOdometer)init;
- (CMOdometerDelegate)delegate;
- (CMOdometerProxy)odometerProxy;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startCyclingWorkoutDistanceUpdatesWithHandler:(id)a3;
- (void)startOdometerUpdatesForActivity:(int64_t)a3 withHandler:(id)a4;
- (void)stopCyclingWorkoutDistanceUpdates;
- (void)stopOdometerUpdates;
@end

@implementation CMOdometer

- (CMOdometer)init
{
  v9.receiver = self;
  v9.super_class = (Class)CMOdometer;
  v2 = [(CMOdometer *)&v9 init];
  if (v2)
  {
    v3 = [CMOdometerProxy alloc];
    v5 = (CMOdometerProxy *)objc_msgSend_initWithOdometer_(v3, v4, (uint64_t)v2);
    v2->_odometerProxy = v5;
    objc_msgSend__startDaemonConnection(v5, v6, v7);
  }
  return v2;
}

- (void)dealloc
{
  v4 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, v2) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190495B48;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);

  v5.receiver = self;
  v5.super_class = (Class)CMOdometer;
  [(CMOdometer *)&v5 dealloc];
}

- (void)startOdometerUpdatesForActivity:(int64_t)a3 withHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CMOdometer.mm", 273, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      v11 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, a3) + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_190495F7C;
      block[3] = &unk_1E568D2F8;
      block[4] = self;
      void block[5] = a4;
      dispatch_async(v11, block);
      return;
    }
    if (qword_1E929D918 != -1) {
      dispatch_once(&qword_1E929D918, &unk_1EDFC3688);
    }
    v12 = qword_1E929D920;
    if (os_log_type_enabled((os_log_t)qword_1E929D920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "#Warning Unsupported activity requested", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D918 != -1) {
        dispatch_once(&qword_1E929D918, &unk_1EDFC3688);
      }
      LOWORD(v25) = 0;
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMOdometer startOdometerUpdatesForActivity:withHandler:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"Invalid CMOdometerActivity";
    uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)&v22, &v21, 1);
  }
  else
  {
    if (qword_1E929D918 != -1) {
      dispatch_once(&qword_1E929D918, &unk_1EDFC3688);
    }
    uint64_t v7 = qword_1E929D920;
    if (os_log_type_enabled((os_log_t)qword_1E929D920, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v28 = a3;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "#Warning The requested activity %ld is not yet supported", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D918 != -1) {
        dispatch_once(&qword_1E929D918, &unk_1EDFC3688);
      }
      int v25 = 134217984;
      int64_t v26 = a3;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMOdometer startOdometerUpdatesForActivity:withHandler:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24 = @"The requested CMOdometerActivity is not yet supported";
    uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)&v24, &v23, 1);
  }
  uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, @"CMErrorDomain", 109, v9);
  (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v14);
}

- (void)stopOdometerUpdates
{
  v4 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, v2) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190496038;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)startCyclingWorkoutDistanceUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMOdometer.mm", 311, @"Invalid parameter not satisfying: %@", @"handler");
  }
  uint64_t v7 = objc_msgSend_copy(a3, a2, (uint64_t)a3);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3BEAF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB3BEAF8))
  {
    byte_1EB3BEAF0 = _os_feature_enabled_impl();
    __cxa_guard_release(&qword_1EB3BEAF8);
  }
  int v8 = byte_1EB3BEAF0;
  uint64_t v9 = *(NSObject **)(objc_msgSend_odometerProxy(self, v5, v6) + 8);
  if (v8)
  {
    v10 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v11 = sub_1904961F0;
  }
  else
  {
    v10 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v11 = sub_19049622C;
  }
  v10[2] = v11;
  v10[3] = &unk_1E568D2F8;
  v10[4] = self;
  v10[5] = v7;
  dispatch_async(v9, v10);
}

- (void)stopCyclingWorkoutDistanceUpdates
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_1EB3BEB00, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_1EB3BEB00))
  {
    byte_1EB3BEAF1 = _os_feature_enabled_impl();
    __cxa_guard_release(qword_1EB3BEB00);
  }
  int v4 = byte_1EB3BEAF1;
  objc_super v5 = *(NSObject **)(objc_msgSend_odometerProxy(self, a2, v2) + 8);
  if (v4)
  {
    uint64_t v6 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    uint64_t v7 = sub_1904964B0;
  }
  else
  {
    uint64_t v6 = v8;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    uint64_t v7 = sub_1904964DC;
  }
  v6[2] = v7;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

- (CMOdometerDelegate)delegate
{
  return (CMOdometerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CMOdometerProxy)odometerProxy
{
  return self->_odometerProxy;
}

- (void).cxx_destruct
{
}

@end