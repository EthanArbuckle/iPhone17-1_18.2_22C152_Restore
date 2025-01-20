@interface CMActivityAlarmProxy
+ (id)sharedInstance;
- (BOOL)activityAlarmAvailable;
- (CMActivityAlarmProxy)init;
- (void)dealloc;
- (void)listenForActivityAlarm:(id)a3;
- (void)stopListeningForActivityAlarm:(id)a3;
@end

@implementation CMActivityAlarmProxy

- (CMActivityAlarmProxy)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMActivityAlarmProxy;
  v2 = [(CMActivityAlarmProxy *)&v4 init];
  if (v2)
  {
    v2->fAlarmCounter = 0;
    v2->fAlarmAvailable = 0;
    v2->fReplyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMActivityAlarmProxyPrivateQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_sync_enter(self);
  dispatch_release((dispatch_object_t)self->fReplyQueue);
  self->fReplyQueue = 0;

  self->fAlarms = 0;
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
  v4.receiver = self;
  v4.super_class = (Class)CMActivityAlarmProxy;
  [(CMActivityAlarmProxy *)&v4 dealloc];
  objc_sync_exit(self);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905AD144;
  block[3] = &unk_1E568D118;
  block[4] = a1;
  if (qword_1EB3BF740 != -1) {
    dispatch_once(&qword_1EB3BF740, block);
  }
  return (id)qword_1EB3BF748;
}

- (BOOL)activityAlarmAvailable
{
  return (sub_1902BACB4() & 1) == 0 && self->fAlarmAvailable;
}

- (void)listenForActivityAlarm:(id)a3
{
  buf[205] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (objc_msgSend_activityAlarmAvailable(self, v5, v6))
  {
    fAlarms = self->fAlarms;
    uint64_t v9 = objc_msgSend_numberWithInt_(NSNumber, v7, self->fAlarmCounter);
    objc_msgSend_setObject_forKey_(fAlarms, v10, (uint64_t)a3, v9);
    sub_1902C34CC(buf);
    LODWORD(v19) = objc_msgSend_trigger(a3, v11, v12);
    objc_msgSend_duration(a3, v13, v14);
    uint64_t v20 = v15;
    sub_190538954(&self->fAlarmCounter, &v19, &v20, (uint64_t)buf);
    LOBYTE(v20) = 1;
    sub_190461598((uint64_t)buf, "kCLConnectionMessageSubscribeKey", &v20);
    uint64_t v19 = buf[1];
    sub_190545E24("kCLConnectionMessageActivityAlarmStart", &v19, &v20);
    v18 = v21;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v18) {
      sub_1902D8B58(v18);
    }
    ++self->fAlarmCounter;
    if (v21) {
      sub_1902D8B58(v21);
    }
    sub_19045CCC8(buf);
  }
  else
  {
    if (qword_1E929D738 != -1) {
      dispatch_once(&qword_1E929D738, &unk_1EDFD38A0);
    }
    v16 = qword_1E929D730;
    if (os_log_type_enabled((os_log_t)qword_1E929D730, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Was not able to listen for alarm.  Activity alarms are not available for this system.", (uint8_t *)buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D738 != -1) {
        dispatch_once(&qword_1E929D738, &unk_1EDFD38A0);
      }
      LOWORD(v20) = 0;
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMActivityAlarmProxy listenForActivityAlarm:]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  objc_sync_exit(self);
}

- (void)stopListeningForActivityAlarm:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  fAlarms = self->fAlarms;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(fAlarms, v6, (uint64_t)&v38, v46, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v39;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v39 != v9) {
        objc_enumerationMutation(fAlarms);
      }
      v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
      if ((id)objc_msgSend_objectForKeyedSubscript_(self->fAlarms, v7, (uint64_t)v11) == a3) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(fAlarms, v7, (uint64_t)&v38, v46, 16);
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    id v13 = v11;
    if (!v13) {
      goto LABEL_18;
    }
    objc_msgSend_removeObjectForKey_(self->fAlarms, v12, (uint64_t)v13);
    sub_1902C34CC(&buf);
    LODWORD(v36) = objc_msgSend_intValue(v13, v14, v15);
    int v37 = objc_msgSend_trigger(a3, v16, v17);
    objc_msgSend_duration(a3, v18, v19);
    uint64_t v42 = v20;
    sub_190538954(&v36, &v37, &v42, (uint64_t)&buf);
    LOBYTE(v42) = 0;
    sub_190461598((uint64_t)&buf, "kCLConnectionMessageSubscribeKey", &v42);
    uint64_t v36 = v45[0];
    sub_190545E24("kCLConnectionMessageActivityAlarmStart", &v36, &v42);
    v35 = v43[0];
    if (v43[0]) {
      atomic_fetch_add_explicit(&v43[0]->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v35) {
      sub_1902D8B58(v35);
    }

    if (v43[0]) {
      sub_1902D8B58(v43[0]);
    }
    sub_19045CCC8(&buf);
  }
  else
  {
LABEL_18:
    if (qword_1E929D738 != -1) {
      dispatch_once(&qword_1E929D738, &unk_1EDFD38A0);
    }
    v21 = qword_1E929D730;
    if (os_log_type_enabled((os_log_t)qword_1E929D730, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = objc_msgSend_trigger(a3, v22, v23);
      objc_msgSend_duration(a3, v25, v26);
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v24;
      LOWORD(v45[0]) = 2048;
      *(void *)((char *)v45 + 2) = v27;
      _os_log_impl(&dword_1902AF000, v21, OS_LOG_TYPE_DEFAULT, "#Warning Cannot unsubscribe from activity alarm (Trigger:%d, Duration:%f).  This alarm is not being listened for.", (uint8_t *)&buf, 0x12u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D738 != -1) {
        dispatch_once(&qword_1E929D738, &unk_1EDFD38A0);
      }
      int v30 = objc_msgSend_trigger(a3, v28, v29);
      objc_msgSend_duration(a3, v31, v32);
      LODWORD(v42) = 67109376;
      HIDWORD(v42) = v30;
      LOWORD(v43[0]) = 2048;
      *(std::__shared_weak_count **)((char *)v43 + 2) = v33;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMActivityAlarmProxy stopListeningForActivityAlarm:]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)&buf) {
        free(v34);
      }
    }
  }
  objc_sync_exit(self);
}

@end