@interface CMPredictedWalkDistance
+ (BOOL)resetPredictedWalkDistanceOnDate:(id)a3 error:(id *)a4;
@end

@implementation CMPredictedWalkDistance

+ (BOOL)resetPredictedWalkDistanceOnDate:(id)a3 error:(id *)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  v42 = @"CMPredictedWalkDistanceResetDateKey";
  v7 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(a3, v8, v9);
  v43[0] = objc_msgSend_numberWithDouble_(v7, v10, v11);
  uint64_t v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v43, &v42, 1);
  sub_1904A6C38("kCLConnectionMessagePredictedWalkDistanceReset", &v37, &v35);
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v18 = objc_msgSend_setWithObjects_(v13, v16, v14, v15, 0);
  uint64_t v33 = v35;
  v34 = v36;
  if (v36) {
    atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v20 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v17, (uint64_t)&v33, v18);
  if (v34) {
    sub_1902D8B58(v34);
  }
  if (v20 && !objc_msgSend_objectForKeyedSubscript_(v20, v19, @"CMErrorMessage"))
  {
    BOOL v30 = 1;
  }
  else
  {
    v21 = objc_msgSend_objectForKeyedSubscript_(v20, v19, @"CMErrorMessage");
    if (v21)
    {
      uint64_t v24 = objc_msgSend_integerValue(v21, v22, v23);
      if (qword_1E929D958 != -1) {
        dispatch_once(&qword_1E929D958, &unk_1EDFD1DA0);
      }
      v25 = qword_1E929D960;
      if (os_log_type_enabled((os_log_t)qword_1E929D960, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v41 = v24;
        _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_ERROR, "Unable to reset predicted walk distance. Error code %{public}ld.", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D958 != -1) {
          dispatch_once(&qword_1E929D958, &unk_1EDFD1DA0);
        }
        int v38 = 134349056;
        uint64_t v39 = v24;
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMPredictedWalkDistance resetPredictedWalkDistanceOnDate:error:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
    }
    else
    {
      if (qword_1E929D958 != -1) {
        dispatch_once(&qword_1E929D958, &unk_1EDFD1DA0);
      }
      v28 = qword_1E929D960;
      if (os_log_type_enabled((os_log_t)qword_1E929D960, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v28, OS_LOG_TYPE_FAULT, "Invalid response to reset walk distance.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D958 != -1) {
          dispatch_once(&qword_1E929D958, &unk_1EDFD1DA0);
        }
        LOWORD(v38) = 0;
        v32 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMPredictedWalkDistance resetPredictedWalkDistanceOnDate:error:]", "CoreLocation: %s\n", v32);
        if (v32 != (char *)buf) {
          free(v32);
        }
      }
      uint64_t v24 = 103;
    }
    if (a4)
    {
      v29 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v26, @"CMErrorDomain", v24, 0);
      BOOL v30 = 0;
      *a4 = v29;
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  if (v36) {
    sub_1902D8B58(v36);
  }
  objc_sync_exit(a1);
  return v30;
}

@end