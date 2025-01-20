@interface CMFall
+ (BOOL)areStatsAvailable;
- (BOOL)setStatsEnabled:(BOOL)a3;
- (id)fallConfig;
- (id)sendStatsDataToUrl:(id)a3;
- (unint64_t)setDataCollectionConfiguration:(unint64_t)a3;
- (void)sendStatsDataToUrl:(id)a3 onCompletion:(id)a4;
- (void)setHgalCaptureMode:(unsigned __int8)a3;
- (void)simulateEvent:(unint64_t)a3;
@end

@implementation CMFall

+ (BOOL)areStatsAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v2, (uint64_t)"kCLConnectionMessageFallStatsAvailable");
}

- (BOOL)setStatsEnabled:(BOOL)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"CMFallSetStatsEnabled";
  v6[0] = objc_msgSend_numberWithBool_(NSNumber, a2, a3);
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v6, &v5, 1);
  operator new();
}

- (unint64_t)setDataCollectionConfiguration:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"CMFallDataCollectionConfigurationKey";
  v6[0] = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3);
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v6, &v5, 1);
  operator new();
}

- (id)fallConfig
{
}

- (id)sendStatsDataToUrl:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4);
  uint64_t v7 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, v6, (uint64_t)a3);
  if (v7)
  {
    v9 = (void *)v7;
    sub_190442778("kCLConnectionMessageFallStatsSendStats", &v35);
    v10 = v35;
    objc_msgSend_fileDescriptor(v9, v11, v12);
    CLConnectionMessage::setFileDescriptor(v10);
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v18 = objc_msgSend_setWithObjects_(v13, v16, v14, v15, 0);
    v33 = v35;
    v34 = v36;
    if (v36) {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v20 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v17, (uint64_t)&v33, v18);
    if (v34) {
      sub_1902D8B58(v34);
    }
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v20, v19, @"CMErrorMessage");
    v23 = objc_msgSend_objectForKeyedSubscript_(v20, v22, @"CMReturnCode");
    char v26 = objc_msgSend_BOOLValue(v23, v24, v25);
    if (v21) {
      char v29 = 0;
    }
    else {
      char v29 = v26;
    }
    if ((v29 & 1) == 0)
    {
      v30 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v27, v28);
      objc_msgSend_removeItemAtURL_error_(v30, v31, (uint64_t)a3, 0);
    }
    if (v36) {
      sub_1902D8B58(v36);
    }
  }
  else
  {
    v37 = @"CMReturnCode";
    v38[0] = MEMORY[0x1E4F1CC28];
    return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v38, &v37, 1);
  }
  return v20;
}

- (void)sendStatsDataToUrl:(id)a3 onCompletion:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v6 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v7, (uint64_t)v6);
  uint64_t v9 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, v8, (uint64_t)a3);
  if (v9)
  {
    v11 = (void *)v9;
    sub_190442778("kCLConnectionMessageFallStatsSendStats", &v25);
    uint64_t v12 = v25;
    objc_msgSend_fileDescriptor(v11, v13, v14);
    CLConnectionMessage::setFileDescriptor(v12);
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v20 = objc_msgSend_setWithObjects_(v15, v18, v16, v17, 0);
    v23 = v25;
    v24 = v26;
    if (v26) {
      atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_19057E85C;
    v22[3] = &unk_1E568DE50;
    v22[4] = a3;
    v22[5] = a4;
    objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v19, (uint64_t)&v23, v20, v22);
    if (v24) {
      sub_1902D8B58(v24);
    }
    if (v26) {
      sub_1902D8B58(v26);
    }
  }
  else
  {
    v27 = @"CMReturnCode";
    v28[0] = MEMORY[0x1E4F1CC28];
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v28, &v27, 1);
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v21);
  }
}

- (void)simulateEvent:(unint64_t)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = @"CMAnomalyEventType";
  v17[0] = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3);
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v17, &v16, 1);
  v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageAnomalyDetectionSimulateEvent");
  MEMORY[0x192FCC420](&v5[1], __p, v4);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
  uint64_t v12 = v5 + 1;
  v13 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v11, (uint64_t)&v12, v10, &unk_1EDFD2620);
  if (v13) {
    sub_1902D8B58(v13);
  }
  sub_1902D8B58(v5);
}

- (void)setHgalCaptureMode:(unsigned __int8)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  char v15 = @"CMHgalCaptureMode";
  v16[0] = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, a3);
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v16, &v15, 1);
  sub_190545E24("kCLConnectionMessageSetHgalCaptureMode", &v12, &v13);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend_setWithObjects_(v4, v7, v5, v6, 0);
  uint64_t v10 = v13;
  v11 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v8, (uint64_t)&v10, v9, &unk_1EDFD3060);
  if (v11) {
    sub_1902D8B58(v11);
  }
  if (v14) {
    sub_1902D8B58(v14);
  }
}

@end