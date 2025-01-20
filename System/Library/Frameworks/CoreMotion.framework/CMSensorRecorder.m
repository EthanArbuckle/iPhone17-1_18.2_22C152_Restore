@interface CMSensorRecorder
+ (BOOL)isAccelerometerRecordingAvailable;
+ (BOOL)isAuthorizedForRecording;
+ (BOOL)isGyroRecordingAvailable;
+ (BOOL)isPressureRecordingAvailable;
+ (BOOL)isRecordingAvailableForType:(int)a3;
+ (CMAuthorizationStatus)authorizationStatus;
- (BOOL)sendAccelDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5;
- (BOOL)sendGyroDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5;
- (BOOL)sendPressureDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5;
- (BOOL)sendSensorDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5 forType:(int)a6;
- (BOOL)setAccelSampleRate:(unsigned int)a3;
- (BOOL)setGyroSampleRate:(unsigned int)a3;
- (BOOL)setPressureSampleRate:(unsigned int)a3;
- (BOOL)setSensorSampleRate:(unsigned int)a3 forType:(int)a4;
- (BOOL)validateTimesFromDate:(id *)a3 toDate:(id)a4;
- (CMSensorDataList)accelerometerDataFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
- (id)accelerometerDataFrom:(id)a3 to:(id)a4;
- (id)accelerometerDataSince:(unint64_t)a3;
- (id)accelerometerDataSinceId:(unint64_t)a3;
- (id)gyroDataFromDate:(id)a3 toDate:(id)a4;
- (id)gyroDataSinceId:(unint64_t)a3;
- (id)pressureDataFromDate:(id)a3 toDate:(id)a4;
- (id)pressureDataSinceId:(unint64_t)a3;
- (id)sensorDataFromDate:(id)a3 toDate:(id)a4 forType:(int)a5;
- (void)recordAccelerometerForDuration:(NSTimeInterval)duration;
- (void)recordDataType:(int)a3 forDuration:(double)a4;
- (void)recordGyroForDuration:(double)a3;
- (void)recordPressureForDuration:(double)a3;
@end

@implementation CMSensorRecorder

+ (BOOL)isRecordingAvailableForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (sub_1902BACB4()) {
    return 0;
  }
  v5 = objc_alloc_init(CLSensorRecorderSensorAvailable);
  objc_msgSend_setDataType_(v5, v6, v3);
  v7 = (std::__shared_weak_count *)operator new(0x70uLL);
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageSensorRecorderSensorAvailable");
  MEMORY[0x192FCC420](&v7[1], __p, v5);
  if (v25 < 0) {
    operator delete(__p[0]);
  }
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = objc_msgSend_setWithObjects_(v8, v11, v9, v10, 0);
  v22 = v7 + 1;
  v23 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  v15 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v13, (uint64_t)&v22, v12);
  if (v23) {
    sub_1902D8B58(v23);
  }
  if (!v15 || (v16 = objc_msgSend_objectForKeyedSubscript_(v15, v14, @"CMAvailable")) == 0)
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v17 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_FAULT, "Response invalid.", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMSensorRecorder isRecordingAvailableForType:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)__p) {
        free(v21);
      }
    }
    v16 = 0;
  }

  char v4 = objc_msgSend_BOOLValue(v16, v18, v19);
  sub_1902D8B58(v7);
  return v4;
}

+ (BOOL)isAccelerometerRecordingAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return MEMORY[0x1F4181798](a1, sel_isRecordingAvailableForType_, 0);
}

+ (BOOL)isGyroRecordingAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return MEMORY[0x1F4181798](a1, sel_isRecordingAvailableForType_, 1);
}

+ (BOOL)isPressureRecordingAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return MEMORY[0x1F4181798](a1, sel_isRecordingAvailableForType_, 2);
}

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

+ (BOOL)isAuthorizedForRecording
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (id)accelerometerDataSinceId:(unint64_t)a3
{
  char v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4);
  v6 = [CMSensorDataList alloc];
  v8 = objc_msgSend_initWithIdentifier_andType_(v6, v7, a3, 0);

  return v8;
}

- (id)gyroDataSinceId:(unint64_t)a3
{
  char v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4);
  v6 = [CMSensorDataList alloc];
  v8 = objc_msgSend_initWithIdentifier_andType_(v6, v7, a3, 1);

  return v8;
}

- (id)pressureDataSinceId:(unint64_t)a3
{
  char v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4);
  v6 = [CMSensorDataList alloc];
  v8 = objc_msgSend_initWithIdentifier_andType_(v6, v7, a3, 2);

  return v8;
}

- (CMSensorDataList)accelerometerDataFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
  return (CMSensorDataList *)MEMORY[0x1F4181798](self, sel_sensorDataFromDate_toDate_forType_, fromDate);
}

- (id)gyroDataFromDate:(id)a3 toDate:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_sensorDataFromDate_toDate_forType_, a3);
}

- (id)pressureDataFromDate:(id)a3 toDate:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_sensorDataFromDate_toDate_forType_, a3);
}

- (BOOL)validateTimesFromDate:(id *)a3 toDate:(id)a4
{
  if (!a3)
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CMSensorRecorder.mm", 640, @"Invalid parameter not satisfying: %@", @"startTime");
  }
  if (*a3)
  {
    if (a4) {
      goto LABEL_5;
    }
  }
  else
  {
    v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMSensorRecorder.mm", 641, @"Invalid parameter not satisfying: %@", @"*startTime");
    if (a4) {
      goto LABEL_5;
    }
  }
  uint64_t v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CMSensorRecorder.mm", 642, @"Invalid parameter not satisfying: %@", @"endTime");
LABEL_5:
  objc_msgSend_timeIntervalSinceDate_(a4, a2, (uint64_t)*a3);
  if (v10 < 0.0)
  {
    v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CMSensorRecorder.mm", 644, @"startTime must be <= to endTime");
  }
  double Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_timeIntervalSinceReferenceDate(*a3, v12, v13);
  if (Current - v16 >= 259200.0)
  {
    v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, @"CMSensorRecorder.mm", 645, @"startTime must be within 3 days of today.");
  }
  objc_msgSend_timeIntervalSinceDate_(a4, v14, (uint64_t)*a3);
  double v20 = v19;
  if (v19 > 43200.0) {
    *a3 = (id)objc_msgSend_dateByAddingTimeInterval_(a4, v17, v18, -43200.0);
  }
  return v20 > 43200.0;
}

- (id)sensorDataFromDate:(id)a3 toDate:(id)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  if (objc_msgSend_validateTimesFromDate_toDate_(self, a2, (uint64_t)&v40))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v8 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      uint64_t v13 = objc_msgSend_UTF8String(v10, v11, v12);
      v14 = NSStringFromSelector(a2);
      uint64_t v17 = objc_msgSend_UTF8String(v14, v15, v16);
      *(_DWORD *)buf = 136446466;
      uint64_t v46 = v13;
      __int16 v47 = 2082;
      uint64_t v48 = v17;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_DEFAULT, "#Notice -[%{public}s %{public}s] fromDate has been adjusted so that the duration requested is <= 12 hours.", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      uint64_t v34 = objc_msgSend_UTF8String(v31, v32, v33);
      v35 = NSStringFromSelector(a2);
      uint64_t v38 = objc_msgSend_UTF8String(v35, v36, v37);
      int v41 = 136446466;
      uint64_t v42 = v34;
      __int16 v43 = 2082;
      uint64_t v44 = v38;
      v39 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSensorRecorder sensorDataFromDate:toDate:forType:]", "CoreLocation: %s\n", v39);
      if (v39 != (char *)buf) {
        free(v39);
      }
    }
  }
  uint64_t v18 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v19, (uint64_t)v18);
  double v20 = [CMSensorDataList alloc];
  objc_msgSend_timeIntervalSinceReferenceDate(v40, v21, v22);
  double v24 = v23;
  objc_msgSend_timeIntervalSinceReferenceDate(a4, v25, v26);
  return (id)objc_msgSend_initFrom_to_withType_(v20, v27, v5, v24, v28);
}

- (BOOL)sendAccelDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return MEMORY[0x1F4181798](self, sel_sendSensorDataToUrl_fromDate_toDate_forType_, a3);
}

- (BOOL)sendGyroDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return MEMORY[0x1F4181798](self, sel_sendSensorDataToUrl_fromDate_toDate_forType_, a3);
}

- (BOOL)sendPressureDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return MEMORY[0x1F4181798](self, sel_sendSensorDataToUrl_fromDate_toDate_forType_, a3);
}

- (BOOL)sendSensorDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5 forType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v62 = a4;
  if (objc_msgSend_validateTimesFromDate_toDate_(self, a2, (uint64_t)&v62, a5))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    double v10 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v15 = objc_msgSend_UTF8String(v12, v13, v14);
      uint64_t v16 = NSStringFromSelector(a2);
      uint64_t v19 = objc_msgSend_UTF8String(v16, v17, v18);
      *(_DWORD *)buf = 136446466;
      uint64_t v68 = v15;
      __int16 v69 = 2082;
      uint64_t v70 = v19;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "#Notice -[%{public}s %{public}s] fromDate has been adjusted so that the duration requested is <= 12 hours.", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      uint64_t v48 = (objc_class *)objc_opt_class();
      uint64_t v49 = NSStringFromClass(v48);
      uint64_t v52 = objc_msgSend_UTF8String(v49, v50, v51);
      v53 = NSStringFromSelector(a2);
      uint64_t v56 = objc_msgSend_UTF8String(v53, v54, v55);
      int v63 = 136446466;
      uint64_t v64 = v52;
      __int16 v65 = 2082;
      uint64_t v66 = v56;
      v57 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSensorRecorder sendSensorDataToUrl:fromDate:toDate:forType:]", "CoreLocation: %s\n", v57);
      if (v57 != (char *)buf) {
        free(v57);
      }
    }
  }
  double v20 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v21, (uint64_t)v20);
  uint64_t v23 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, v22, (uint64_t)a3);
  if (v23)
  {
    uint64_t v24 = v23;
    char v25 = objc_alloc_init(CMSensorRecorderInternal);
    objc_msgSend_timeIntervalSinceReferenceDate(v62, v26, v27);
    double v29 = v28;
    objc_msgSend_timeIntervalSinceReferenceDate(a5, v30, v31);
    char v36 = objc_msgSend_writeSensorDataToFile_from_to_forType_(v25, v32, v24, v6, v29, v33);
    if ((v36 & 1) == 0)
    {
      uint64_t v37 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v34, v35);
      objc_msgSend_removeItemAtURL_error_(v37, v38, (uint64_t)a3, 0);
    }
  }
  else
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v39 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = objc_msgSend_absoluteString(a3, v40, v41);
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = v42;
      _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_DEFAULT, "#Notice Unable to get file handle for URL %{public}@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      uint64_t v60 = objc_msgSend_absoluteString(a3, v58, v59);
      int v63 = 138543362;
      uint64_t v64 = v60;
      v61 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSensorRecorder sendSensorDataToUrl:fromDate:toDate:forType:]", "CoreLocation: %s\n", v61);
      if (v61 != (char *)buf) {
        free(v61);
      }
    }
    v45 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v43, v44);
    objc_msgSend_removeItemAtURL_error_(v45, v46, (uint64_t)a3, 0);
    return 0;
  }
  return v36;
}

- (void)recordAccelerometerForDuration:(NSTimeInterval)duration
{
}

- (void)recordGyroForDuration:(double)a3
{
}

- (void)recordPressureForDuration:(double)a3
{
}

- (void)recordDataType:(int)a3 forDuration:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a4 <= 0.0)
  {
    uint64_t v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, *(uint64_t *)&a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMSensorRecorder.mm", 726, @"Invalid parameter not satisfying: %@", @"duration > 0.0");
  }
  v7 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v8, (uint64_t)v7);
  uint64_t v9 = objc_alloc_init(CLSensorRecorderRecordSensorTypeFor);
  objc_msgSend_setDuration_(v9, v10, v11, a4);
  objc_msgSend_setDataType_(v9, v12, v5);
  uint64_t v13 = (std::__shared_weak_count *)operator new(0x70uLL);
  v13->__shared_owners_ = 0;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageSensorRecorderRecordFor");
  MEMORY[0x192FCC420](&v13[1], __p, v9);
  if (v30 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v18 = objc_msgSend_setWithObjects_(v14, v17, v15, v16, 0);
  uint64_t v27 = v13 + 1;
  double v28 = v13;
  atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  v21 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v19, (uint64_t)&v27, v18);
  if (v28) {
    sub_1902D8B58(v28);
  }
  if (!v21 || objc_msgSend_objectForKey_(v21, v20, @"CMErrorMessage"))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    uint64_t v22 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_FAULT, "Response invalid.", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      uint64_t v26 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorRecorder recordDataType:forDuration:]", "CoreLocation: %s\n", v26);
      if (v26 != (char *)__p) {
        free(v26);
      }
    }
  }

  sub_1902D8B58(v13);
}

- (id)accelerometerDataFrom:(id)a3 to:(id)a4
{
  return 0;
}

- (id)accelerometerDataSince:(unint64_t)a3
{
  return 0;
}

- (BOOL)setSensorSampleRate:(unsigned int)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (a3 >= 0x65)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, *(uint64_t *)&a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMSensorRecorder.mm", 762, @"Invalid parameter not satisfying: %@", @"rate <= 100");
  }
  v7 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v8, (uint64_t)v7);
  uint64_t v9 = objc_alloc_init(CMSensorRecorderInternal);
  char v11 = objc_msgSend_setSensorSampleRate_forType_(v9, v10, v5, v4);

  return v11;
}

- (BOOL)setAccelSampleRate:(unsigned int)a3
{
  return objc_msgSend_setSensorSampleRate_forType_(self, a2, *(uint64_t *)&a3, 0);
}

- (BOOL)setGyroSampleRate:(unsigned int)a3
{
  return objc_msgSend_setSensorSampleRate_forType_(self, a2, *(uint64_t *)&a3, 1);
}

- (BOOL)setPressureSampleRate:(unsigned int)a3
{
  return objc_msgSend_setSensorSampleRate_forType_(self, a2, *(uint64_t *)&a3, 2);
}

@end