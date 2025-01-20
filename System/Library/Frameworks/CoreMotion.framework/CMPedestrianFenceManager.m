@interface CMPedestrianFenceManager
+ (BOOL)isAvailable;
+ (unint64_t)availableFenceTypes;
- (CMPedestrianFenceManager)init;
- (CMPedestrianFenceManagerInternal)_internal;
- (void)clearFence:(id)a3;
- (void)dealloc;
- (void)endSession;
- (void)forceClearAllFences;
- (void)forceClearFence:(id)a3;
- (void)setFence:(id)a3 withRadius:(float)a4 withCompletion:(id)a5;
- (void)simulateFence:(id)a3 withExitAfterDelay:(double)a4 wake:(BOOL)a5 withCompletion:(id)a6;
- (void)startSession;
- (void)startSessionWithStatusHandler:(id)a3;
@end

@implementation CMPedestrianFenceManager

+ (BOOL)isAvailable
{
  return objc_msgSend_availableFenceTypes(CMPedestrianFenceManager, a2, v2) != 0;
}

+ (unint64_t)availableFenceTypes
{
  sub_1902BAD40();
  if (sub_19046C114()) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1902BAD40();
  return v2 | sub_19046C1C4();
}

- (void)startSession
{
}

- (void)startSessionWithStatusHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D9C8 != -1) {
    dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
  }
  v5 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Starting pedestrian fence session", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager startSessionWithStatusHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  v8 = objc_msgSend__internal(self, v6, v7);
  objc_msgSend__setInSession_withStatusHandler_(v8, v9, 1, a3);
}

- (void)endSession
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D9C8 != -1) {
    dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
  }
  v3 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Ending pedestrian fence session", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager endSession]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  v6 = objc_msgSend__internal(self, v4, v5);
  objc_msgSend__setInSession_withStatusHandler_(v6, v7, 0, 0);
}

- (void)setFence:(id)a3 withRadius:(float)a4 withCompletion:(id)a5
{
  uint64_t v7 = (const char *)a3;
  SEL v8 = a2;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3))
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    v21 = qword_1E929D9D0;
    SEL v8 = "";
    self = (CMPedestrianFenceManager *)"assert";
    uint64_t v7 = "[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v30 = 0;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "";
      *(_WORD *)&v30[14] = 2082;
      *(void *)&v30[16] = "assert";
      __int16 v31 = 2081;
      v32 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    v22 = qword_1E929D9D0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9D0))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v30 = 0;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "";
      *(_WORD *)&v30[14] = 2082;
      *(void *)&v30[16] = "assert";
      __int16 v31 = 2081;
      v32 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    a5 = (id)qword_1E929D9D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v30 = 0;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "";
      *(_WORD *)&v30[14] = 2082;
      *(void *)&v30[16] = "assert";
      __int16 v31 = 2081;
      v32 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, (os_log_t)a5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v27 = 236;
    v28 = "-[CMPedestrianFenceManager setFence:withRadius:withCompletion:]";
    v26 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v26, v27, v28);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)v8, self, @"CMPedestrianFenceManager.mm", 237, @"Invalid parameter not satisfying: %@", @"handler");
LABEL_3:
  if (qword_1E929D9C8 != -1) {
    dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
  }
  uint64_t v12 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v30 = v7;
    *(_WORD *)&v30[8] = 2050;
    *(double *)&v30[10] = a4;
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEFAULT, "Setting pedestrian fence: fenceID,%{public}@,radiusMeters,%{public}f", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager setFence:withRadius:withCompletion:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
  *(float *)&double v15 = a4;
  uint64_t v16 = objc_msgSend_numberWithFloat_(NSNumber, v13, v14, v15);
  v19 = objc_msgSend__internal(self, v17, v18);
  objc_msgSend__setFence_withRadius_wake_delay_withCompletion_(v19, v20, (uint64_t)v7, v16, 1, 0, a5);
}

- (void)clearFence:(id)a3
{
  v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3))
  {
    if (qword_1E929D9C8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    uint64_t v10 = qword_1E929D9D0;
    self = (CMPedestrianFenceManager *)"[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v17 = 0;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "";
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    uint64_t v11 = qword_1E929D9D0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9D0))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v17 = 0;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "";
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    v3 = qword_1E929D9D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v17 = 0;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "";
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v14 = 246;
    double v15 = "-[CMPedestrianFenceManager clearFence:]";
    v13 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
LABEL_3:
  uint64_t v5 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v17 = v3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Clearing pedestrian fence: fenceID,%{public}@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    LODWORD(v14) = 12;
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager clearFence:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  SEL v8 = objc_msgSend__internal(self, v6, v7, v13, v14, v15);
  objc_msgSend__clearFence_force_(v8, v9, (uint64_t)v3, 0);
}

- (void)simulateFence:(id)a3 withExitAfterDelay:(double)a4 wake:(BOOL)a5 withCompletion:(id)a6
{
  uint64_t v7 = (const char *)a5;
  v9 = (const char *)a3;
  SEL v10 = a2;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3))
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    v23 = qword_1E929D9D0;
    SEL v10 = (SEL)&qword_190607000;
    self = (CMPedestrianFenceManager *)"";
    v9 = "assert";
    uint64_t v7 = "[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v32 = 0;
      *(_WORD *)&v32[4] = 2082;
      *(void *)&v32[6] = "";
      *(_WORD *)&v32[14] = 2082;
      *(void *)&v32[16] = "assert";
      __int16 v33 = 2081;
      v34 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    v24 = qword_1E929D9D0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9D0))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v32 = 0;
      *(_WORD *)&v32[4] = 2082;
      *(void *)&v32[6] = "";
      *(_WORD *)&v32[14] = 2082;
      *(void *)&v32[16] = "assert";
      __int16 v33 = 2081;
      v34 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    a6 = (id)qword_1E929D9D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v32 = 0;
      *(_WORD *)&v32[4] = 2082;
      *(void *)&v32[6] = "";
      *(_WORD *)&v32[14] = 2082;
      *(void *)&v32[16] = "assert";
      __int16 v33 = 2081;
      v34 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, (os_log_t)a6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v29 = 253;
    v30 = "-[CMPedestrianFenceManager simulateFence:withExitAfterDelay:wake:withCompletion:]";
    v28 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v28, v29, v30);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)v10, self, @"CMPedestrianFenceManager.mm", 254, @"Invalid parameter not satisfying: %@", @"handler");
LABEL_3:
  if (qword_1E929D9C8 != -1) {
    dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
  }
  uint64_t v14 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    float v15 = a4;
    *(_DWORD *)buf = 138543874;
    *(void *)v32 = v9;
    *(_WORD *)&v32[8] = 2050;
    *(double *)&v32[10] = v15;
    *(_WORD *)&v32[18] = 1026;
    *(_DWORD *)&v32[20] = v7;
    _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_DEFAULT, "Simulating fence exit: fenceID,%{public}@,delay,%{public}f,shouldWake,%{public}d", buf, 0x1Cu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    uint64_t v27 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager simulateFence:withExitAfterDelay:wake:withCompletion:]", "CoreLocation: %s\n", v27);
    if (v27 != (char *)buf) {
      free(v27);
    }
  }
  uint64_t v18 = objc_msgSend_numberWithDouble_(NSNumber, v16, v17, a4);
  v21 = objc_msgSend__internal(self, v19, v20);
  objc_msgSend__setFence_withRadius_wake_delay_withCompletion_(v21, v22, (uint64_t)v9, 0, v7, v18, a6);
}

- (void)forceClearFence:(id)a3
{
  v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3))
  {
    if (qword_1E929D9C8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    SEL v10 = qword_1E929D9D0;
    self = (CMPedestrianFenceManager *)"[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)uint64_t v17 = 0;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "";
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    uint64_t v11 = qword_1E929D9D0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9D0))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)uint64_t v17 = 0;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "";
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    v3 = qword_1E929D9D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)uint64_t v17 = 0;
      *(_WORD *)&v17[4] = 2082;
      *(void *)&v17[6] = "";
      __int16 v18 = 2082;
      v19 = "assert";
      __int16 v20 = 2081;
      v21 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v14 = 263;
    float v15 = "-[CMPedestrianFenceManager forceClearFence:]";
    uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
LABEL_3:
  uint64_t v5 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)uint64_t v17 = v3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Force clearing pedestrian fence: fenceID,%{public}@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    LODWORD(v14) = 12;
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager forceClearFence:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  SEL v8 = objc_msgSend__internal(self, v6, v7, v13, v14, v15);
  objc_msgSend__clearFence_force_(v8, v9, (uint64_t)v3, 1);
}

- (void)forceClearAllFences
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, v2))
  {
    if (qword_1E929D9C8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    v9 = qword_1E929D9D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    SEL v10 = qword_1E929D9D0;
    if (os_signpost_enabled((os_log_t)qword_1E929D9D0))
    {
      *(_DWORD *)buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_1902AF000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1E929D9C8 != -1) {
        dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
      }
    }
    self = (CMPedestrianFenceManager *)qword_1E929D9D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = "assert";
      __int16 v21 = 2081;
      uint64_t v22 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_1902AF000, &self->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v13 = 270;
    uint64_t v14 = "-[CMPedestrianFenceManager forceClearAllFences]";
    uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
LABEL_3:
  v4 = qword_1E929D9D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_DEFAULT, "Force clearing all fences", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9C8 != -1) {
      dispatch_once(&qword_1E929D9C8, &unk_1EDFC3588);
    }
    LODWORD(v13) = 2;
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMPedestrianFenceManager forceClearAllFences]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  uint64_t v7 = objc_msgSend__internal(self, v5, v6, v12, v13, v14);
  objc_msgSend__clearFence_force_(v7, v8, 0, 1);
}

- (CMPedestrianFenceManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMPedestrianFenceManager;
  uint64_t v2 = [(CMPedestrianFenceManager *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMPedestrianFenceManagerInternal);
  }
  return v2;
}

- (void)dealloc
{
  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMPedestrianFenceManager;
  [(CMPedestrianFenceManager *)&v3 dealloc];
}

- (CMPedestrianFenceManagerInternal)_internal
{
  return (CMPedestrianFenceManagerInternal *)self->_internal;
}

@end