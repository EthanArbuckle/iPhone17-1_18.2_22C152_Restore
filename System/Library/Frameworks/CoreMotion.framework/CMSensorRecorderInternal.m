@interface CMSensorRecorderInternal
- (BOOL)setSensorSampleRate:(unsigned int)a3 forType:(int)a4;
- (BOOL)writeSensorDataToFile:(id)a3 from:(double)a4 to:(double)a5 forType:(int)a6;
- (CMSensorRecorderInternal)init;
- (id)_newMetaUsingMessage:(const char *)a3 withIdentifier:(unint64_t)a4 forType:(int)a5;
- (id)newDataByID:(unint64_t)a3 metaID:(unint64_t)a4 forType:(int)a5;
- (id)newMetaByID:(unint64_t)a3 forType:(int)a4;
- (id)newMetaFrom:(double)a3 to:(double)a4 forType:(int)a5;
- (id)newMetaSinceID:(unint64_t)a3 forType:(int)a4;
- (void)dealloc;
- (void)teardown;
@end

@implementation CMSensorRecorderInternal

- (CMSensorRecorderInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSensorRecorderInternal;
  v2 = [(CMSensorRecorderInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSensorRecorderInternal", 0);
    operator new();
  }
  return 0;
}

- (void)teardown
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904859C4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)dealloc
{
  self->fInternalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMSensorRecorderInternal;
  [(CMSensorRecorderInternal *)&v3 dealloc];
}

- (id)newMetaByID:(unint64_t)a3 forType:(int)a4
{
  return (id)MEMORY[0x1F4181798](self, sel__newMetaUsingMessage_withIdentifier_forType_, "kCLConnectionMessageSensorRecorderGetMetaByID");
}

- (id)newMetaSinceID:(unint64_t)a3 forType:(int)a4
{
  return (id)MEMORY[0x1F4181798](self, sel__newMetaUsingMessage_withIdentifier_forType_, "kCLConnectionMessageSensorRecorderGetMetaSinceID");
}

- (id)_newMetaUsingMessage:(const char *)a3 withIdentifier:(unint64_t)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v8 = objc_alloc_init(CLSensorRecorderSensorMetaRequestById);
  objc_msgSend_setIdentifier_(v8, v9, a4);
  objc_msgSend_setDataType_(v8, v10, v5);
  v11 = (std::__shared_weak_count *)operator new(0x70uLL);
  v11->__shared_owners_ = 0;
  v11->__shared_weak_owners_ = 0;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, (char *)a3);
  MEMORY[0x192FCC420](&v11[1], __p, v8);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessageSync();
  if (v11) {
    sub_1902D8B58(v11);
  }

  if (!v18
    || (v12 = (const std::string *)CLConnectionMessage::name(v18),
        !std::string::compare(v12, "kCLConnectionMessageError")))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v15 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_FAULT, "Error occurred while trying to retrieve accelerometer record!", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorRecorderInternal _newMetaUsingMessage:withIdentifier:forType:]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)__p) {
        free(v17);
      }
    }
    id v14 = 0;
  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    id v14 = (id)CLConnectionMessage::getObjectOfClass(v18, v13);
  }
  if (v19) {
    sub_1902D8B58(v19);
  }
  sub_1902D8B58(v11);
  return v14;
}

- (id)newMetaFrom:(double)a3 to:(double)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v8 = objc_alloc_init(CLSensorRecorderSensorMetaRequestByDateRange);
  objc_msgSend_setStartTime_(v8, v9, v10, a3);
  objc_msgSend_setEndTime_(v8, v11, v12, a4);
  objc_msgSend_setDataType_(v8, v13, v5);
  id v14 = (std::__shared_weak_count *)operator new(0x70uLL);
  v14->__shared_owners_ = 0;
  v14->__shared_weak_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageSensorRecorderGetMetasByDateRange");
  MEMORY[0x192FCC420](&v14[1], __p, v8);
  if (v28 < 0) {
    operator delete(__p[0]);
  }
  atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessageSync();
  if (v14) {
    sub_1902D8B58(v14);
  }

  if (!v25
    || (v15 = (const std::string *)CLConnectionMessage::name(v25),
        !std::string::compare(v15, "kCLConnectionMessageError")))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    uint64_t v22 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_FAULT, "Error occurred while trying to retrieve accelerometer records!", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorRecorderInternal newMetaFrom:to:forType:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)__p) {
        free(v24);
      }
    }
    id v21 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v20 = (NSSet *)objc_msgSend_setWithObjects_(v16, v19, v17, v18, 0);
    id v21 = (id)CLConnectionMessage::getObjectOfClasses(v25, v20);
  }
  if (v26) {
    sub_1902D8B58(v26);
  }
  sub_1902D8B58(v14);
  return v21;
}

- (BOOL)writeSensorDataToFile:(id)a3 from:(double)a4 to:(double)a5 forType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_alloc_init(CLSensorRecorderWriteSensorDataToFileForDateRange);
  objc_msgSend_setStartTime_(v10, v11, v12, a4);
  objc_msgSend_setEndTime_(v10, v13, v14, a5);
  objc_msgSend_setDataType_(v10, v15, v6);
  v16 = (char *)operator new(0x70uLL);
  *((void *)v16 + 1) = 0;
  *((void *)v16 + 2) = 0;
  *(void *)v16 = &unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageSensorRecorderWriteSensorDataToFileByDateRange");
  MEMORY[0x192FCC420](v16 + 24, __p, v10);
  if (v29 < 0) {
    operator delete(__p[0]);
  }
  objc_msgSend_fileDescriptor(a3, v17, v18);
  CLConnectionMessage::setFileDescriptor((CLConnectionMessage *)(v16 + 24));
  atomic_fetch_add_explicit((atomic_ullong *volatile)v16 + 1, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessageSync();
  if (v16) {
    sub_1902D8B58((std::__shared_weak_count *)v16);
  }

  if (!v26
    || (v19 = (const std::string *)CLConnectionMessage::name(v26),
        !std::string::compare(v19, "kCLConnectionMessageError")))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    uint64_t v22 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_FAULT, "Error occurred while trying to write accelerometer data to file!", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorRecorderInternal writeSensorDataToFile:from:to:forType:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)__p) {
        free(v24);
      }
    }
    BOOL v21 = 0;
  }
  else
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v20 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_DEBUG, "Successfully wrote accelerometer data to file.", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSensorRecorderInternal writeSensorDataToFile:from:to:forType:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)__p) {
        free(v25);
      }
    }
    BOOL v21 = 1;
  }
  if (v27) {
    sub_1902D8B58(v27);
  }
  sub_1902D8B58((std::__shared_weak_count *)v16);
  return v21;
}

- (BOOL)setSensorSampleRate:(unsigned int)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_alloc_init(CLSensorRecorderSensorSampleRate);
  objc_msgSend_setRate_(v6, v7, v5);
  objc_msgSend_setDataType_(v6, v8, v4);
  v9 = (std::__shared_weak_count *)operator new(0x70uLL);
  v9->__shared_owners_ = 0;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageSensorRecorderSetSensorSampleRate");
  MEMORY[0x192FCC420](&v9[1], __p, v6);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessageSync();
  if (v9) {
    sub_1902D8B58(v9);
  }

  if (!v17
    || (uint64_t v10 = (const std::string *)CLConnectionMessage::name(v17),
        !std::string::compare(v10, "kCLConnectionMessageError")))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v13 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_FAULT, "Error occurred while trying to set sensor sample rate!", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorRecorderInternal setSensorSampleRate:forType:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)__p) {
        free(v15);
      }
    }
    BOOL v12 = 0;
  }
  else
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v11 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_INFO, "Successfully set sensor sample rate.", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSensorRecorderInternal setSensorSampleRate:forType:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)__p) {
        free(v16);
      }
    }
    BOOL v12 = 1;
  }
  if (v18) {
    sub_1902D8B58(v18);
  }
  sub_1902D8B58(v9);
  return v12;
}

- (id)newDataByID:(unint64_t)a3 metaID:(unint64_t)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v8 = objc_alloc_init(CLSensorRecorderSensorDataRequestById);
  objc_msgSend_setIdentifier_(v8, v9, a3);
  objc_msgSend_setMetaIdentifier_(v8, v10, a4);
  objc_msgSend_setDataType_(v8, v11, v5);
  BOOL v12 = (std::__shared_weak_count *)operator new(0x70uLL);
  v12->__shared_owners_ = 0;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageSensorRecorderGetDataByID");
  MEMORY[0x192FCC420](&v12[1], __p, v8);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  CLConnectionClient::sendMessageSync();
  if (v12) {
    sub_1902D8B58(v12);
  }

  if (!v18
    || (v13 = (const std::string *)CLConnectionMessage::name(v18),
        !std::string::compare(v13, "kCLConnectionMessageError")))
  {
    if (qword_1E929D908 != -1) {
      dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
    }
    v15 = qword_1E929D910;
    if (os_log_type_enabled((os_log_t)qword_1E929D910, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_FAULT, "Error occurred while trying to retrieve accelerometer data!", (uint8_t *)__p, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1E929D908 != -1) {
        dispatch_once(&qword_1E929D908, &unk_1EDFD34E0);
      }
      uint64_t v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSensorRecorderInternal newDataByID:metaID:forType:]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)__p) {
        free(v17);
      }
    }
    id v14 = 0;
  }
  else
  {
    id v14 = (id)CLConnectionMessage::getRawPayload(v18);
  }
  if (v19) {
    sub_1902D8B58(v19);
  }
  sub_1902D8B58(v12);
  return v14;
}

@end