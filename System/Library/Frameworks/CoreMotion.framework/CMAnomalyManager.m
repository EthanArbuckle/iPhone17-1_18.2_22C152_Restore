@interface CMAnomalyManager
+ (BOOL)isAnomalyDetectionAvailable;
+ (int64_t)getAnomalyFeatureEnablingStrategyForUserAge:(id)a3;
- (CMAnomalyDelegate)delegate;
- (CMAnomalyManager)init;
- (void)_registerForAnomalyDetection:(BOOL)a3;
- (void)_sendRegistrationForAnomalyEvent:(id)a3;
- (void)ackAnomalyEvent:(id)a3 withResolution:(int64_t)a4;
- (void)dealloc;
- (void)resolveAnomalyEvent:(id)a3 withResolution:(int64_t)a4;
- (void)respondToAnomalyEvent:(id)a3 withResponse:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)startAnomalyDetection;
- (void)stopAnomalyDetection;
- (void)updateAnomalyEventSOSCallState:(id)a3 withSOSSCallState:(int64_t)a4;
@end

@implementation CMAnomalyManager

- (void)setDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_delegate)
  {
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
    v5 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_INFO))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code unregistered delegate, unregistering for anomaly detection\"}", (uint8_t *)&v9, 0x12u);
    }
    objc_msgSend__registerForAnomalyDetection_(self, v6, 0);
  }

  self->fLastReceivedEvent = objc_alloc_init(CMAnomalyEvent);
  self->fLastDispatchedEvent = objc_alloc_init(CMAnomalyEvent);
  self->_delegate = (CMAnomalyDelegate *)a3;
  if (a3)
  {
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
    v7 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_INFO))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code registered delegate, registering for anomaly detection\"}", (uint8_t *)&v9, 0x12u);
    }
    objc_msgSend__registerForAnomalyDetection_(self, v8, 1);
  }
}

+ (BOOL)isAnomalyDetectionAvailable
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((sub_1902CD6B0() & 0x8000000000) != 0)
  {
    BOOL v2 = 1;
  }
  else
  {
    if (qword_1EB3BF330 != -1) {
      dispatch_once(&qword_1EB3BF330, &unk_1EDFD1DC0);
    }
    BOOL v2 = byte_1EB3BF328 != 0;
  }
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  v3 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289538;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 1026;
    BOOL v9 = v2;
    __int16 v10 = 1026;
    int v11 = byte_1EB3BF328;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMAnomalyManager: checking availability\", \"available\":%{public}hhd, \"forced\":%{public}hhd}", (uint8_t *)v5, 0x1Eu);
  }
  return v2;
}

- (CMAnomalyManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CMAnomalyManager;
  BOOL v2 = [(CMAnomalyManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->fRegisteredForNotification = 0;
    v2->fLastReceivedEvent = objc_alloc_init(CMAnomalyEvent);
    v3->fLastDispatchedEvent = objc_alloc_init(CMAnomalyEvent);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMAnomalyManagerPrivateQueue", v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->fAppQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMAnomalyManagerAppQueue", v5);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_msgSend__registerForAnomalyDetection_(self, a2, 0);
  sub_1902C3F54(&__p, "kCLConnectionMessageAnomalyEvent");
  CLConnectionClient::setHandlerForMessage();
  if (v8 < 0) {
    operator delete(__p);
  }
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
  fPrivateQueue = self->fPrivateQueue;
  if (fPrivateQueue)
  {
    dispatch_release(fPrivateQueue);
    self->fPrivateQueue = 0;
  }
  fAppQueue = self->fAppQueue;
  if (fAppQueue)
  {
    dispatch_release(fAppQueue);
    self->fAppQueue = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CMAnomalyManager;
  [(CMAnomalyManager *)&v6 dealloc];
}

- (void)startAnomalyDetection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  BOOL v2 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_FAULT))
  {
    int v4 = 68289026;
    int v5 = 0;
    __int16 v6 = 2082;
    objc_super v7 = "";
    _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to startAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
  }
  uint64_t v3 = qword_1E929D8F0;
  if (os_signpost_enabled((os_log_t)qword_1E929D8F0))
  {
    int v4 = 68289026;
    int v5 = 0;
    __int16 v6 = 2082;
    objc_super v7 = "";
    _os_signpost_emit_with_name_impl(&dword_1902AF000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMAnomalyManager: client code tried to startAnomalyDetection which was deprecated", "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to startAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
  }
}

- (void)stopAnomalyDetection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  BOOL v2 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_FAULT))
  {
    int v4 = 68289026;
    int v5 = 0;
    __int16 v6 = 2082;
    objc_super v7 = "";
    _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to stopAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
  }
  uint64_t v3 = qword_1E929D8F0;
  if (os_signpost_enabled((os_log_t)qword_1E929D8F0))
  {
    int v4 = 68289026;
    int v5 = 0;
    __int16 v6 = 2082;
    objc_super v7 = "";
    _os_signpost_emit_with_name_impl(&dword_1902AF000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMAnomalyManager: client code tried to stopAnomalyDetection which was deprecated", "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to stopAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
  }
}

- (void)_registerForAnomalyDetection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  int v5 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    BOOL v9 = "";
    __int16 v10 = 1026;
    BOOL v11 = v3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: registering for anomaly detection\", \"registerFlag\":%{public}hhd}", (uint8_t *)v7, 0x18u);
  }
  self->fRegisteredForNotification = v3;
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v6, (uint64_t)self->fLastReceivedEvent);
}

- (void)ackAnomalyEvent:(id)a3 withResolution:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  int v4 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_FAULT))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    BOOL v9 = "";
    _os_log_impl(&dword_1902AF000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to ackAnomalyEvent which was deprecated\"}", (uint8_t *)&v6, 0x12u);
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
  }
  int v5 = qword_1E929D8F0;
  if (os_signpost_enabled((os_log_t)qword_1E929D8F0))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    BOOL v9 = "";
    _os_signpost_emit_with_name_impl(&dword_1902AF000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMAnomalyManager: client code tried to ackAnomalyEvent which was deprecated", "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to ackAnomalyEvent which was deprecated\"}", (uint8_t *)&v6, 0x12u);
  }
}

- (void)_sendRegistrationForAnomalyEvent:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_identifier(a3, a2, (uint64_t)a3))
  {
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
    uint64_t v5 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
    {
      BOOL fRegisteredForNotification = self->fRegisteredForNotification;
      uint64_t v9 = objc_msgSend_identifier(a3, v6, v7);
      objc_msgSend_absoluteTimestamp(a3, v10, v11);
      uint64_t v13 = v12;
      objc_msgSend_updateTimestamp(a3, v14, v15);
      *(_DWORD *)buf = 68291075;
      int v37 = 0;
      __int16 v38 = 2082;
      v39 = "";
      __int16 v40 = 1026;
      BOOL v41 = fRegisteredForNotification;
      __int16 v42 = 2050;
      uint64_t v43 = v9;
      __int16 v44 = 2049;
      uint64_t v45 = v13;
      __int16 v46 = 2049;
      uint64_t v47 = v24;
      __int16 v48 = 2049;
      uint64_t v49 = objc_msgSend_state(a3, v16, v17);
      __int16 v50 = 2049;
      uint64_t v51 = objc_msgSend_response(a3, v18, v19);
      __int16 v52 = 2049;
      uint64_t v53 = objc_msgSend_resolution(a3, v20, v21);
      __int16 v54 = 2049;
      uint64_t v55 = objc_msgSend_sosState(a3, v22, v23);
      v25 = "{\"msg%{public}.0s\":\"CMAnomalyManager: sendRegistrationForAnomalyEvent with event\", \"registerFlag\":%{pu"
            "blic}hhd, \"identifier\":%{public}llu, \"anomaly timestamp\":\"%{private}f\", \"update timestamp\":\"%{priva"
            "te}f\", \"state\":%{private}ld, \"response\":%{private}ld, \"resolution\":%{private}ld, \"sosState\":%{private}ld}";
      v26 = v5;
      uint32_t v27 = 94;
LABEL_10:
      _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
    }
  }
  else
  {
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
    }
    uint64_t v28 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
    {
      BOOL v29 = self->fRegisteredForNotification;
      *(_DWORD *)buf = 68289282;
      int v37 = 0;
      __int16 v38 = 2082;
      v39 = "";
      __int16 v40 = 1026;
      BOOL v41 = v29;
      v25 = "{\"msg%{public}.0s\":\"CMAnomalyManager: sendRegistrationForAnomalyEvent with no event\", \"registerFlag\":%{public}hhd}";
      v26 = v28;
      uint32_t v27 = 24;
      goto LABEL_10;
    }
  }
  v30 = objc_msgSend_copy(a3, v6, v7);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_setUpdateTimestamp_(v30, v32, v33, Current);
  fPrivateQueue = self->fPrivateQueue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_190505C6C;
  v35[3] = &unk_1E568D190;
  v35[4] = self;
  v35[5] = v30;
  dispatch_async(fPrivateQueue, v35);
}

+ (int64_t)getAnomalyFeatureEnablingStrategyForUserAge:(id)a3
{
  objc_msgSend_doubleValue(a3, a2, (uint64_t)a3);
  int64_t result = 0;
  if (a3 && v4 >= 0.0)
  {
    if (v4 >= 18.0)
    {
      if (v4 >= 55.0)
      {
        if (v4 >= 65.0) {
          return 5;
        }
        else {
          return 4;
        }
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)respondToAnomalyEvent:(id)a3 withResponse:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CMAnomalyManager.mm", 246, @"Invalid parameter not satisfying: %@", @"event");
  }
  if (objc_msgSend_response(a3, a2, (uint64_t)a3) && objc_msgSend_response(a3, v8, v9) != a4)
  {
    uint64_t v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMAnomalyManager.mm", 248, @"Invalid parameter not satisfying: %@", @"event.response == CMAnomalyEventResponseNone || event.response == response");
  }
  if (!objc_msgSend_identifier(a3, v8, v9))
  {
    v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CMAnomalyManager.mm", 250, @"Invalid parameter not satisfying: %@", @"event.identifier != 0");
  }
  if (a4 <= 0)
  {
    v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CMAnomalyManager.mm", 252, @"Invalid parameter not satisfying: %@", @"response > CMAnomalyEventResponseNone");
  }
  else if ((unint64_t)a4 >= 6)
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CMAnomalyManager.mm", 254, @"Invalid parameter not satisfying: %@", @"response <= CMAnomalyEventResponseAutomaticActionRequested");
  }
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  uint64_t v12 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289539;
    int v27 = 0;
    __int16 v28 = 2082;
    BOOL v29 = "";
    __int16 v30 = 2050;
    uint64_t v31 = objc_msgSend_identifier(a3, v13, v14);
    __int16 v32 = 2049;
    int64_t v33 = a4;
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: respondToAnomalyEvent\", \"identifier\":%{public}llu, \"response\":%{private}ld}", buf, 0x26u);
  }
  objc_msgSend_setResponse_(a3, v13, a4);
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v15, (uint64_t)a3);
}

- (void)resolveAnomalyEvent:(id)a3 withResolution:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CMAnomalyManager.mm", 268, @"Invalid parameter not satisfying: %@", @"event");
  }
  if (objc_msgSend_resolution(a3, a2, (uint64_t)a3) && objc_msgSend_resolution(a3, v8, v9) != a4)
  {
    uint64_t v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMAnomalyManager.mm", 270, @"Invalid parameter not satisfying: %@", @"event.resolution == CMAnomalyEventResolutionNone || event.resolution == resolution");
  }
  if (!objc_msgSend_identifier(a3, v8, v9))
  {
    v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CMAnomalyManager.mm", 272, @"Invalid parameter not satisfying: %@", @"event.identifier != 0");
  }
  if (a4 <= 0)
  {
    v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CMAnomalyManager.mm", 274, @"Invalid parameter not satisfying: %@", @"resolution > CMAnomalyEventResolutionNone");
  }
  else if ((unint64_t)a4 >= 3)
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CMAnomalyManager.mm", 276, @"Invalid parameter not satisfying: %@", @"resolution <= CMAnomalyEventResolutionCanceled");
  }
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  uint64_t v12 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289539;
    int v27 = 0;
    __int16 v28 = 2082;
    BOOL v29 = "";
    __int16 v30 = 2050;
    uint64_t v31 = objc_msgSend_identifier(a3, v13, v14);
    __int16 v32 = 2049;
    int64_t v33 = a4;
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: resolveAnomalyEvent\", \"identifier\":%{public}llu, \"resolution\":%{private}ld}", buf, 0x26u);
  }
  objc_msgSend_setResolution_(a3, v13, a4);
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v15, (uint64_t)a3);
}

- (void)updateAnomalyEventSOSCallState:(id)a3 withSOSSCallState:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMAnomalyManager.mm", 288, @"Invalid parameter not satisfying: %@", @"event");
  }
  if (!objc_msgSend_identifier(a3, a2, (uint64_t)a3))
  {
    v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, @"CMAnomalyManager.mm", 291, @"Invalid parameter not satisfying: %@", @"event.identifier != 0");
  }
  if ((unint64_t)(a4 - 5) <= 0xFFFFFFFFFFFFFFFBLL)
  {
    __int16 v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CMAnomalyManager.mm", 295, @"Invalid parameter not satisfying: %@", @"(sosCallState >= CMAnomalyEventResponseSOSCallInitiated) && (sosCallState <= CMAnomalyEventResponseSOSCallFailed)");
  }
  if (objc_msgSend_resolution(a3, v8, v9) != 1)
  {
    __int16 v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, @"CMAnomalyManager.mm", 298, @"Invalid parameter not satisfying: %@", @"event.resolution == CMAnomalyEventResolutionCompleted");
  }
  if (objc_msgSend_response(a3, v10, v11) != 1 && objc_msgSend_response(a3, v12, v13) != 5)
  {
    __int16 v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, @"CMAnomalyManager.mm", 302, @"Invalid parameter not satisfying: %@", @"(event.response == CMAnomalyEventResponseConfirmedActionRequested) || (event.response == CMAnomalyEventResponseAutomaticActionRequested)");
  }
  if ((unint64_t)(a4 - 2) >= 3)
  {
    if (a4 == 1 && objc_msgSend_sosState(a3, v12, v13))
    {
      uint64_t v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, self, @"CMAnomalyManager.mm", 313, @"Invalid parameter not satisfying: %@", @"event.sosState == CMAnomalyEventResponseSOSCallNone");
    }
  }
  else if (objc_msgSend_sosState(a3, v12, v13) != 1)
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CMAnomalyManager.mm", 308, @"Invalid parameter not satisfying: %@", @"event.sosState == CMAnomalyEventResponseSOSCallInitiated");
  }
  if (qword_1E929D8E8 != -1) {
    dispatch_once(&qword_1E929D8E8, &unk_1EDFD2E20);
  }
  v20 = qword_1E929D8F0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289539;
    int v37 = 0;
    __int16 v38 = 2082;
    v39 = "";
    __int16 v40 = 2050;
    uint64_t v41 = objc_msgSend_identifier(a3, v21, v22);
    __int16 v42 = 2049;
    int64_t v43 = a4;
    _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: updateAnomalyEventSOSCallState\", \"identifier\":%{public}llu, \"sosCallState\":%{private}ld}", buf, 0x26u);
  }
  objc_msgSend_setSosState_(a3, v21, a4);
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v23, (uint64_t)a3);
}

- (CMAnomalyDelegate)delegate
{
  return self->_delegate;
}

@end