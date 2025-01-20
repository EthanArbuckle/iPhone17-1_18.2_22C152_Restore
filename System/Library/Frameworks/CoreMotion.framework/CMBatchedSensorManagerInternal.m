@interface CMBatchedSensorManagerInternal
+ (BOOL)areBatchedSensorsSupported;
+ (id)_newArrayByUnpackingAccelerometerBatch:(shared_ptr<CLConnectionMessage>)a3;
+ (id)_newArrayByUnpackingDeviceMotionBatch:(shared_ptr<CLConnectionMessage>)a3;
- (CMBatchedSensorManagerInternal)init;
- (NSArray)accelBatch;
- (NSArray)deviceMotionBatch;
- (void)_connect;
- (void)_startAccelerometerUpdates;
- (void)_startAccelerometerUpdatesWithHandler:(id)a3;
- (void)_startDeviceMotionUpdates;
- (void)_startDeviceMotionUpdatesWithHandler:(id)a3;
- (void)_stopAccelerometerUpdates;
- (void)_stopDeviceMotionUpdates;
- (void)_teardown;
- (void)dealloc;
- (void)setAccelBatch:(id)a3;
- (void)setDeviceMotionBatch:(id)a3;
@end

@implementation CMBatchedSensorManagerInternal

+ (BOOL)areBatchedSensorsSupported
{
  return 0;
}

- (CMBatchedSensorManagerInternal)init
{
  v9.receiver = self;
  v9.super_class = (Class)CMBatchedSensorManagerInternal;
  v2 = [(CMBatchedSensorManagerInternal *)&v9 init];
  v4 = v2;
  if (v2)
  {
    v2->_accelHandler = 0;
    v2->_queue = 0;
    v2->_dataQueue = 0;
    v2->_connection = 0;
    v2->_available = 0;
    objc_msgSend_setAccelBatch_(v2, v3, 0);
    v4->_deviceMotionHandler = 0;
    objc_msgSend_setDeviceMotionBatch_(v4, v5, 0);
    objc_msgSend__connect(v4, v6, v7);
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend_setAccelBatch_(self, a2, 0);
  objc_msgSend_setDeviceMotionBatch_(self, v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)CMBatchedSensorManagerInternal;
  [(CMBatchedSensorManagerInternal *)&v4 dealloc];
}

- (void)_connect
{
  if (!self->_connection)
  {
    self->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMBatchedSensorManager.Internal", 0);
    operator new();
  }
}

- (void)_teardown
{
  sub_1902C3F54(__p, "kCLConnectionMessageBatchedSensorAvailabilityUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageBatchedAccelerometer");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageBatchedSensorError");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  sub_1902C3F54(__p, "kCLConnectionMessageBatchedDeviceMotion");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  if (self->_connection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
    self->_connection = 0;
  }

  self->_queue = 0;
  self->_dataQueue = 0;
}

- (void)_startAccelerometerUpdates
{
}

- (void)_startAccelerometerUpdatesWithHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  char v5 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend_areBatchedSensorsSupported(v6, v7, v8);
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[framework-accel] attempting to start updates to queue, supported %d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    v19 = objc_opt_class();
    LODWORD(v29) = 67109120;
    HIDWORD(v29) = objc_msgSend_areBatchedSensorsSupported(v19, v20, v21);
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startAccelerometerUpdatesWithHandler:]", "CoreLocation: %s\n", v22);
    if (v22 != (char *)buf) {
      free(v22);
    }
  }
  objc_super v9 = objc_opt_class();
  if (objc_msgSend_areBatchedSensorsSupported(v9, v10, v11))
  {
    id accelHandler = self->_accelHandler;
    if (accelHandler != a3)
    {

      self->_id accelHandler = (id)objc_msgSend_copy(a3, v13, v14);
    }
    if (self->_connection)
    {
      if (qword_1E929DA08 != -1) {
        dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
      }
      v15 = qword_1E929DA10;
      if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "[framework-accel] starting updates to queue", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929DA08 != -1) {
          dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
        }
        LOWORD(v29) = 0;
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startAccelerometerUpdatesWithHandler:]", "CoreLocation: %s\n", v23);
        if (v23 != (char *)buf) {
          free(v23);
        }
      }
      sub_1902C3F54(buf, "kCLConnectionMessageBatchedAccelerometer");
      CLConnectionClient::setHandlerForMessage();
      if (v32 < 0) {
        operator delete(*(void **)buf);
      }
      v27 = @"kCLConnectionMessageSubscribeKey";
      uint64_t v28 = MEMORY[0x1E4F1CC38];
      uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v28, &v27, 1);
      sub_190445684("kCLConnectionMessageBatchedAccelerometer", &v29, buf);
      v25 = v31;
      if (v31) {
        atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v25) {
        sub_1902D8B58(v25);
      }
      if (v31) {
        sub_1902D8B58(v31);
      }
    }
    else
    {
      if (qword_1E929DA08 != -1) {
        dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
      }
      v18 = qword_1E929DA10;
      if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_ERROR, "framework-accel] no connection", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929DA08 != -1) {
          dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
        }
        LOWORD(v29) = 0;
        v24 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMBatchedSensorManagerInternal _startAccelerometerUpdatesWithHandler:]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
    }
    self->_accelActive = 1;
  }
  else if (a3)
  {
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905D1A60;
    block[3] = &unk_1E568D2D0;
    block[4] = a3;
    dispatch_async(dataQueue, block);
  }
}

- (void)_stopAccelerometerUpdates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  uint64_t v3 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend_areBatchedSensorsSupported(v4, v5, v6);
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[framework-accel] stopping updates, supported %d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    v12 = objc_opt_class();
    LODWORD(v19) = 67109120;
    HIDWORD(v19) = objc_msgSend_areBatchedSensorsSupported(v12, v13, v14);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _stopAccelerometerUpdates]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  uint64_t v7 = objc_opt_class();
  if (objc_msgSend_areBatchedSensorsSupported(v7, v8, v9))
  {
    id accelHandler = self->_accelHandler;
    if (accelHandler)
    {

      self->_id accelHandler = 0;
    }
    if (self->_connection)
    {
      v17 = @"kCLConnectionMessageSubscribeKey";
      uint64_t v18 = MEMORY[0x1E4F1CC28];
      uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v18, &v17, 1);
      sub_190445684("kCLConnectionMessageBatchedAccelerometer", &v19, buf);
      v16 = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v16) {
        sub_1902D8B58(v16);
      }
      if (v21) {
        sub_1902D8B58(v21);
      }
    }
    self->_accelActive = 0;
    objc_msgSend_setAccelBatch_(self, v10, 0);
  }
}

+ (id)_newArrayByUnpackingAccelerometerBatch:(shared_ptr<CLConnectionMessage>)a3
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v3 = (id)CLConnectionMessage::getRawPayload(*(CLConnectionMessage **)a3.var0);
  xpc_data_get_bytes_ptr(v3);
  int length = xpc_data_get_length(v3);
  int v5 = length / 20;
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  uint64_t v6 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    int v132 = length;
    *(_WORD *)v133 = 1026;
    *(_DWORD *)&v133[2] = length / 20;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[framework-accel] Received msg size %{public}d num %{public}d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    v87 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingAccelerometerBatch:]", "CoreLocation: %s\n", v87);
    if (v87 != (char *)buf) {
      free(v87);
    }
  }
  uint64_t v7 = objc_opt_new();
  if (length < 20)
  {
    unint64_t v10 = 0;
    unint64_t v9 = 0;
  }
  else
  {
    size_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    int v11 = 0;
    do
    {
      size_t bytes = xpc_data_get_bytes(v3, buf, v8, 0x14uLL);
      int v13 = *(_DWORD *)buf;
      int v14 = v132;
      int v15 = *(_DWORD *)v133;
      v8 += 20;
      unint64_t v16 = *(void *)&v133[4];
      v17 = (void *)MEMORY[0x192FCD2F0](bytes);
      uint64_t v18 = [CMAccelerometerData alloc];
      LODWORD(v19) = v13;
      LODWORD(v20) = v14;
      LODWORD(v21) = v15;
      id v24 = (id)objc_msgSend_initWithAcceleration_andTimestamp_(v18, v22, v23, v19, v20, v21, (double)v16 * 0.000000999999997);
      objc_msgSend_addObject_(v7, v25, (uint64_t)v24);
      if (v11) {
        unint64_t v10 = v16;
      }
      else {
        unint64_t v9 = v16;
      }
      ++v11;
    }
    while (v5 != v11);
  }
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  v26 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    Object = objc_msgSend_firstObject(v7, v27, v28);
    objc_msgSend_timestamp(Object, v30, v31);
    uint64_t v33 = v32;
    v36 = objc_msgSend_lastObject(v7, v34, v35);
    objc_msgSend_timestamp(v36, v37, v38);
    uint64_t v40 = v39;
    v43 = objc_msgSend_firstObject(v7, v41, v42);
    objc_msgSend_acceleration(v43, v44, v45);
    uint64_t v47 = v46;
    v50 = objc_msgSend_firstObject(v7, v48, v49);
    objc_msgSend_acceleration(v50, v51, v52);
    uint64_t v54 = v53;
    v57 = objc_msgSend_firstObject(v7, v55, v56);
    objc_msgSend_acceleration(v57, v58, v59);
    uint64_t v61 = v60;
    v64 = objc_msgSend_lastObject(v7, v62, v63);
    objc_msgSend_acceleration(v64, v65, v66);
    uint64_t v68 = v67;
    v71 = objc_msgSend_lastObject(v7, v69, v70);
    objc_msgSend_acceleration(v71, v72, v73);
    uint64_t v75 = v74;
    v78 = objc_msgSend_lastObject(v7, v76, v77);
    objc_msgSend_acceleration(v78, v79, v80);
    uint64_t v82 = v81;
    int v85 = objc_msgSend_count(v7, v83, v84);
    *(_DWORD *)buf = 67243008;
    int v132 = v5;
    *(_WORD *)v133 = 2050;
    *(void *)&v133[2] = v9;
    *(_WORD *)&v133[10] = 2050;
    unint64_t v134 = v10;
    __int16 v135 = 2050;
    uint64_t v136 = v33;
    __int16 v137 = 2050;
    uint64_t v138 = v40;
    __int16 v139 = 2050;
    uint64_t v140 = v47;
    __int16 v141 = 2050;
    uint64_t v142 = v54;
    __int16 v143 = 2050;
    uint64_t v144 = v61;
    __int16 v145 = 2050;
    uint64_t v146 = v68;
    __int16 v147 = 2050;
    uint64_t v148 = v75;
    __int16 v149 = 2050;
    uint64_t v150 = v82;
    __int16 v151 = 1026;
    int v152 = v85;
    _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_DEFAULT, "[framework-accel] Looped %{public}d times range [%{public}llu %{public}llu], timeS [%{public}f %{public}f], first sample [%{public}f %{public}f %{public}f], last sample [%{public}f %{public}f %{public}f], size %{public}d", buf, 0x72u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    v90 = objc_msgSend_firstObject(v7, v88, v89);
    objc_msgSend_timestamp(v90, v91, v92);
    v95 = objc_msgSend_lastObject(v7, v93, v94);
    objc_msgSend_timestamp(v95, v96, v97);
    v100 = objc_msgSend_firstObject(v7, v98, v99);
    objc_msgSend_acceleration(v100, v101, v102);
    v105 = objc_msgSend_firstObject(v7, v103, v104);
    objc_msgSend_acceleration(v105, v106, v107);
    v110 = objc_msgSend_firstObject(v7, v108, v109);
    objc_msgSend_acceleration(v110, v111, v112);
    v115 = objc_msgSend_lastObject(v7, v113, v114);
    objc_msgSend_acceleration(v115, v116, v117);
    v120 = objc_msgSend_lastObject(v7, v118, v119);
    objc_msgSend_acceleration(v120, v121, v122);
    v125 = objc_msgSend_lastObject(v7, v123, v124);
    objc_msgSend_acceleration(v125, v126, v127);
    objc_msgSend_count(v7, v128, v129);
    v130 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingAccelerometerBatch:]", "CoreLocation: %s\n", v130);
    if (v130 != (char *)buf) {
      free(v130);
    }
  }

  return v7;
}

- (void)_startDeviceMotionUpdates
{
}

- (void)_startDeviceMotionUpdatesWithHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  int v5 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = objc_msgSend_areBatchedSensorsSupported(v6, v7, v8);
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "[framework-dm] attempting to start updates to queue, supported %d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    double v19 = objc_opt_class();
    LODWORD(v29) = 67109120;
    HIDWORD(v29) = objc_msgSend_areBatchedSensorsSupported(v19, v20, v21);
    uint64_t v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startDeviceMotionUpdatesWithHandler:]", "CoreLocation: %s\n", v22);
    if (v22 != (char *)buf) {
      free(v22);
    }
  }
  unint64_t v9 = objc_opt_class();
  if (objc_msgSend_areBatchedSensorsSupported(v9, v10, v11))
  {
    id deviceMotionHandler = self->_deviceMotionHandler;
    if (deviceMotionHandler != a3)
    {

      self->_id deviceMotionHandler = (id)objc_msgSend_copy(a3, v13, v14);
    }
    if (self->_connection)
    {
      if (qword_1E929DA08 != -1) {
        dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
      }
      int v15 = qword_1E929DA10;
      if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "[framework-dm] starting updates to queue", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929DA08 != -1) {
          dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
        }
        LOWORD(v29) = 0;
        uint64_t v23 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startDeviceMotionUpdatesWithHandler:]", "CoreLocation: %s\n", v23);
        if (v23 != (char *)buf) {
          free(v23);
        }
      }
      sub_1902C3F54(buf, "kCLConnectionMessageBatchedDeviceMotion");
      CLConnectionClient::setHandlerForMessage();
      if (v32 < 0) {
        operator delete(*(void **)buf);
      }
      v27 = @"kCLConnectionMessageSubscribeKey";
      uint64_t v28 = MEMORY[0x1E4F1CC38];
      uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v28, &v27, 1);
      sub_19044262C("kCLConnectionMessageBatchedDeviceMotion", &v29, buf);
      v25 = v31;
      if (v31) {
        atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v25) {
        sub_1902D8B58(v25);
      }
      if (v31) {
        sub_1902D8B58(v31);
      }
    }
    else
    {
      if (qword_1E929DA08 != -1) {
        dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
      }
      uint64_t v18 = qword_1E929DA10;
      if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_ERROR, "framework-dm] no connection", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929DA08 != -1) {
          dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
        }
        LOWORD(v29) = 0;
        id v24 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMBatchedSensorManagerInternal _startDeviceMotionUpdatesWithHandler:]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
    }
    self->_deviceMotionActive = 1;
  }
  else if (a3)
  {
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905D2C24;
    block[3] = &unk_1E568D2D0;
    block[4] = a3;
    dispatch_async(dataQueue, block);
  }
}

- (void)_stopDeviceMotionUpdates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  id v3 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = objc_msgSend_areBatchedSensorsSupported(v4, v5, v6);
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[framework-dm] stopping updates, supported %d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    v12 = objc_opt_class();
    LODWORD(v19) = 67109120;
    HIDWORD(v19) = objc_msgSend_areBatchedSensorsSupported(v12, v13, v14);
    int v15 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _stopDeviceMotionUpdates]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  uint64_t v7 = objc_opt_class();
  if (objc_msgSend_areBatchedSensorsSupported(v7, v8, v9))
  {
    id deviceMotionHandler = self->_deviceMotionHandler;
    if (deviceMotionHandler)
    {

      self->_id deviceMotionHandler = 0;
    }
    if (self->_connection)
    {
      v17 = @"kCLConnectionMessageSubscribeKey";
      uint64_t v18 = MEMORY[0x1E4F1CC28];
      uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v18, &v17, 1);
      sub_19044262C("kCLConnectionMessageBatchedDeviceMotion", &v19, buf);
      unint64_t v16 = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v16) {
        sub_1902D8B58(v16);
      }
      if (v21) {
        sub_1902D8B58(v21);
      }
    }
    self->_deviceMotionActive = 0;
    objc_msgSend_setDeviceMotionBatch_(self, v10, 0);
  }
}

+ (id)_newArrayByUnpackingDeviceMotionBatch:(shared_ptr<CLConnectionMessage>)a3
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v3 = (id)CLConnectionMessage::getRawPayload(*(CLConnectionMessage **)a3.var0);
  xpc_data_get_bytes_ptr(v3);
  int length = xpc_data_get_length(v3);
  uint64_t v5 = (length / 50);
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  uint64_t v6 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&uint8_t buf[4] = length;
    *(_WORD *)v185 = 1026;
    *(_DWORD *)&v185[2] = length / 50;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "[framework-dm] Received msg size %{public}d num %{public}d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    int v160 = 67240448;
    int v161 = length;
    __int16 v162 = 1026;
    LODWORD(v163) = length / 50;
    v88 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingDeviceMotionBatch:]", "CoreLocation: %s\n", v88);
    if (v88 != (char *)buf) {
      free(v88);
    }
  }
  __int16 v149 = objc_opt_new();
  if (length < 50)
  {
    unint64_t v9 = 0;
    unint64_t v8 = 0;
  }
  else
  {
    size_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    int v10 = 0;
    do
    {
      size_t bytes = xpc_data_get_bytes(v3, buf, v7, 0x32uLL);
      int v12 = *(_DWORD *)&v185[16];
      int v13 = *(_DWORD *)v186;
      uint64_t v150 = *(void *)&v186[4];
      uint64_t v151 = *(void *)&v185[8];
      uint64_t v14 = v5;
      unint64_t v15 = *(void *)&v187[2];
      v7 += 50;
      double v16 = *(float *)&v185[4];
      double v17 = *(float *)v185;
      float32x2_t v18 = *(float32x2_t *)buf;
      id v19 = v3;
      uint64_t v20 = MEMORY[0x192FCD2F0](bytes);
      uint64_t v21 = [CMDeviceMotion alloc];
      double v152 = v16;
      float64x2_t v153 = vcvtq_f64_f32(v18);
      double v154 = v17;
      int v155 = v13;
      *(void *)&long long v22 = v150;
      *((void *)&v22 + 1) = v151;
      long long v156 = v22;
      int v157 = v12;
      long long v158 = 0u;
      long long v159 = 0u;
      id v24 = (id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v21, v23, (uint64_t)&v152, 0.0, (double)v15 * 0.000000999999997);
      objc_msgSend_addObject_(v149, v25, (uint64_t)v24);
      v26 = (void *)v20;
      id v3 = v19;
      if (v10) {
        unint64_t v9 = v15;
      }
      else {
        unint64_t v8 = v15;
      }
      uint64_t v5 = v14;
      ++v10;
    }
    while (v14 != v10);
  }
  if (qword_1E929DA08 != -1) {
    dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
  }
  v27 = qword_1E929DA10;
  if (os_log_type_enabled((os_log_t)qword_1E929DA10, OS_LOG_TYPE_DEFAULT))
  {
    Object = objc_msgSend_firstObject(v149, v28, v29);
    objc_msgSend_timestamp(Object, v31, v32);
    uint64_t v34 = v33;
    v37 = objc_msgSend_lastObject(v149, v35, v36);
    objc_msgSend_timestamp(v37, v38, v39);
    uint64_t v41 = v40;
    v44 = objc_msgSend_firstObject(v149, v42, v43);
    objc_msgSend_userAcceleration(v44, v45, v46);
    uint64_t v48 = v47;
    v51 = objc_msgSend_firstObject(v149, v49, v50);
    objc_msgSend_userAcceleration(v51, v52, v53);
    uint64_t v55 = v54;
    v58 = objc_msgSend_firstObject(v149, v56, v57);
    objc_msgSend_userAcceleration(v58, v59, v60);
    uint64_t v62 = v61;
    v65 = objc_msgSend_lastObject(v149, v63, v64);
    objc_msgSend_userAcceleration(v65, v66, v67);
    uint64_t v69 = v68;
    v72 = objc_msgSend_lastObject(v149, v70, v71);
    objc_msgSend_userAcceleration(v72, v73, v74);
    uint64_t v76 = v75;
    v79 = objc_msgSend_lastObject(v149, v77, v78);
    objc_msgSend_userAcceleration(v79, v80, v81);
    uint64_t v83 = v82;
    int v86 = objc_msgSend_count(v149, v84, v85);
    *(_DWORD *)buf = 67243008;
    *(_DWORD *)&uint8_t buf[4] = v5;
    *(_WORD *)v185 = 2050;
    *(void *)&v185[2] = v8;
    *(_WORD *)&v185[10] = 2050;
    *(void *)&v185[12] = v9;
    *(_WORD *)v186 = 2050;
    *(void *)&v186[2] = v34;
    *(_WORD *)&v186[10] = 2050;
    *(void *)v187 = v41;
    *(_WORD *)&v187[8] = 2050;
    uint64_t v188 = v48;
    __int16 v189 = 2050;
    uint64_t v190 = v55;
    __int16 v191 = 2050;
    uint64_t v192 = v62;
    __int16 v193 = 2050;
    uint64_t v194 = v69;
    __int16 v195 = 2050;
    uint64_t v196 = v76;
    __int16 v197 = 2050;
    uint64_t v198 = v83;
    __int16 v199 = 1026;
    int v200 = v86;
    _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_DEFAULT, "[framework-dm] Looped %{public}d times range [%{public}llu %{public}llu], timeS [%{public}f %{public}f], first sample [%{public}f %{public}f %{public}f], last sample [%{public}f %{public}f %{public}f], size %{public}d", buf, 0x72u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929DA08 != -1) {
      dispatch_once(&qword_1E929DA08, &unk_1EDFC3648);
    }
    v91 = objc_msgSend_firstObject(v149, v89, v90);
    objc_msgSend_timestamp(v91, v92, v93);
    uint64_t v95 = v94;
    v98 = objc_msgSend_lastObject(v149, v96, v97);
    objc_msgSend_timestamp(v98, v99, v100);
    uint64_t v102 = v101;
    v105 = objc_msgSend_firstObject(v149, v103, v104);
    objc_msgSend_userAcceleration(v105, v106, v107);
    uint64_t v109 = v108;
    uint64_t v112 = objc_msgSend_firstObject(v149, v110, v111);
    objc_msgSend_userAcceleration(v112, v113, v114);
    uint64_t v116 = v115;
    uint64_t v119 = objc_msgSend_firstObject(v149, v117, v118);
    objc_msgSend_userAcceleration(v119, v120, v121);
    uint64_t v123 = v122;
    v126 = objc_msgSend_lastObject(v149, v124, v125);
    objc_msgSend_userAcceleration(v126, v127, v128);
    uint64_t v130 = v129;
    v133 = objc_msgSend_lastObject(v149, v131, v132);
    objc_msgSend_userAcceleration(v133, v134, v135);
    uint64_t v137 = v136;
    uint64_t v140 = objc_msgSend_lastObject(v149, v138, v139);
    objc_msgSend_userAcceleration(v140, v141, v142);
    uint64_t v144 = v143;
    int v147 = objc_msgSend_count(v149, v145, v146);
    int v160 = 67243008;
    int v161 = v5;
    __int16 v162 = 2050;
    unint64_t v163 = v8;
    __int16 v164 = 2050;
    unint64_t v165 = v9;
    __int16 v166 = 2050;
    uint64_t v167 = v95;
    __int16 v168 = 2050;
    uint64_t v169 = v102;
    __int16 v170 = 2050;
    uint64_t v171 = v109;
    __int16 v172 = 2050;
    uint64_t v173 = v116;
    __int16 v174 = 2050;
    uint64_t v175 = v123;
    __int16 v176 = 2050;
    uint64_t v177 = v130;
    __int16 v178 = 2050;
    uint64_t v179 = v137;
    __int16 v180 = 2050;
    uint64_t v181 = v144;
    __int16 v182 = 1026;
    int v183 = v147;
    uint64_t v148 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingDeviceMotionBatch:]", "CoreLocation: %s\n", v148);
    if (v148 != (char *)buf) {
      free(v148);
    }
  }

  return v149;
}

- (NSArray)accelBatch
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccelBatch:(id)a3
{
}

- (NSArray)deviceMotionBatch
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDeviceMotionBatch:(id)a3
{
}

@end