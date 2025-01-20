@interface CMSafetyAnomaly
+ (BOOL)areStatsAvailable;
- (int)getState;
- (void)notifyEvent:(id)a3;
- (void)sendAPCmd:(int)a3 arg:(int)a4;
@end

@implementation CMSafetyAnomaly

+ (BOOL)areStatsAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v2, (uint64_t)"kCLConnectionMessageKappaStatsAvailable");
}

- (void)sendAPCmd:(int)a3 arg:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8F8 != -1) {
    dispatch_once(&qword_1E929D8F8, &unk_1EDFD2BC0);
  }
  v6 = qword_1E929D900;
  if (os_log_type_enabled((os_log_t)qword_1E929D900, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = v4;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_INFO, "kappa ap command=%d arg=%d", buf, 0xEu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8F8 != -1) {
      dispatch_once(&qword_1E929D8F8, &unk_1EDFD2BC0);
    }
    LODWORD(v21) = 67109376;
    HIDWORD(v21) = v5;
    __int16 v22 = 1024;
    int v23 = v4;
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSafetyAnomaly sendAPCmd:arg:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  v19[0] = @"CMKappaCmdKey";
  v20[0] = objc_msgSend_numberWithInt_(NSNumber, v7, v5);
  v19[1] = @"CMKappaArgKey";
  v20[1] = objc_msgSend_numberWithInt_(NSNumber, v8, v4);
  uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v20, v19, 2);
  sub_19045B038("kCLConnectionMessageKappaSendAPCommand", &v21, buf);
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v15 = objc_msgSend_setWithObjects_(v10, v13, v11, v12, 0);
  uint64_t v17 = *(void *)buf;
  v18 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v14, (uint64_t)&v17, v15);
  if (v18) {
    sub_1902D8B58(v18);
  }
  if (v25) {
    sub_1902D8B58(v25);
  }
}

- (int)getState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8F8 != -1) {
    dispatch_once(&qword_1E929D8F8, &unk_1EDFD2BC0);
  }
  v2 = qword_1E929D900;
  if (os_log_type_enabled((os_log_t)qword_1E929D900, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_DEBUG, "get state updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8F8 != -1) {
      dispatch_once(&qword_1E929D8F8, &unk_1EDFD2BC0);
    }
    __int16 v26 = 0;
    __int16 v22 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSafetyAnomaly getState]", "CoreLocation: %s\n", v22);
    if (v22 != (char *)buf) {
      free(v22);
    }
  }
  v3 = (std::__shared_weak_count *)operator new(0x70uLL);
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(buf, "kCLConnectionMessageKappaGetState");
  MEMORY[0x192FCC410](&v3[1], buf);
  if (v28 < 0) {
    operator delete(*(void **)buf);
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_setWithObjects_(v4, v7, v5, v6, 0);
  v24 = v3 + 1;
  v25 = v3;
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v11 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v24, v8);
  if (v25) {
    sub_1902D8B58(v25);
  }
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v11, v10, @"CMErrorMessage");
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v11, v13, @"CMReturnCode");
  v16 = objc_msgSend_objectForKeyedSubscript_(v11, v15, @"CMKappaStateKey");
  if (v12 || !v14)
  {
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD3640);
    }
    v20 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_ERROR, "#Notice Response invalid.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8E8 != -1) {
        dispatch_once(&qword_1E929D8E8, &unk_1EDFD3640);
      }
      __int16 v26 = 0;
      int v23 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSafetyAnomaly getState]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    int v19 = -1;
  }
  else
  {
    int v19 = objc_msgSend_intValue(v16, v17, v18);
  }
  sub_1902D8B58(v3);
  return v19;
}

- (void)notifyEvent:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = @"CMSafetyAnomalyPropertiesKey";
  v30[0] = a3;
  uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v30, &v29, 1);
  sub_19044262C("kCLConnectionMessageSafetyAnomalyNotify", &v24, &v22);
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_setWithObjects_(v3, v6, v4, v5, 0);
  uint64_t v20 = v22;
  uint64_t v21 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v7, (uint64_t)&v20, v8);
  if (v21) {
    sub_1902D8B58(v21);
  }
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v10, v9, @"CMErrorMessage");
  if (v11)
  {
    if (qword_1E929DA18 != -1) {
      dispatch_once(&qword_1E929DA18, &unk_1EDFD3740);
    }
    uint64_t v12 = qword_1E929DA20;
    if (os_log_type_enabled((os_log_t)qword_1E929DA20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend_unsignedLongValue(v11, v13, v14);
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v15;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "igneous event error: %lu", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929DA18 != -1) {
        dispatch_once(&qword_1E929DA18, &unk_1EDFD3740);
      }
      uint64_t v18 = objc_msgSend_unsignedLongValue(v11, v16, v17);
      int v25 = 134217984;
      uint64_t v26 = v18;
      int v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSafetyAnomaly notifyEvent:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  if (v23) {
    sub_1902D8B58(v23);
  }
}

@end