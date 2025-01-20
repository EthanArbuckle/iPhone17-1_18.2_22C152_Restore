@interface LBFMLRuntimedEvent
- (BOOL)isEqual:(id)a3;
- (LBFMLRuntimedEvent)initWithScheduleStatus:(BOOL)a3;
- (LBFMLRuntimedEvent)initWithTaskCompleted:(BOOL)a3 error:(id)a4;
- (LBFMLRuntimedEvent)initWithTaskFetched:(BOOL)a3 error:(id)a4;
- (LBFMLRuntimedEvent)initWithTaskScheduled:(BOOL)a3 error:(id)a4;
- (NSNumber)errorCode;
- (NSNumber)scheduled;
- (NSNumber)succeeded;
- (NSString)errorDomain;
- (int64_t)eventType;
@end

@implementation LBFMLRuntimedEvent

- (LBFMLRuntimedEvent)initWithTaskFetched:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LBFMLRuntimedEvent;
  v10 = [(LBFMLRuntimedEvent *)&v32 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v7, v4, v8, v9);
    succeeded = v10->_succeeded;
    v10->_succeeded = (NSNumber *)v11;

    if (v6)
    {
      uint64_t v17 = objc_msgSend_domain(v6, v13, v14, v15, v16);
      errorDomain = v10->_errorDomain;
      v10->_errorDomain = (NSString *)v17;

      v19 = NSNumber;
      uint64_t v24 = objc_msgSend_code(v6, v20, v21, v22, v23);
      uint64_t v28 = objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
      errorCode = v10->_errorCode;
      v10->_errorCode = (NSNumber *)v28;
    }
    else
    {
      v30 = v10->_errorDomain;
      v10->_errorDomain = 0;

      errorCode = v10->_errorCode;
      v10->_errorCode = 0;
    }

    v10->_eventType = 2;
  }

  return v10;
}

- (LBFMLRuntimedEvent)initWithTaskScheduled:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LBFMLRuntimedEvent;
  v10 = [(LBFMLRuntimedEvent *)&v32 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v7, v4, v8, v9);
    succeeded = v10->_succeeded;
    v10->_succeeded = (NSNumber *)v11;

    if (v6)
    {
      uint64_t v17 = objc_msgSend_domain(v6, v13, v14, v15, v16);
      errorDomain = v10->_errorDomain;
      v10->_errorDomain = (NSString *)v17;

      v19 = NSNumber;
      uint64_t v24 = objc_msgSend_code(v6, v20, v21, v22, v23);
      uint64_t v28 = objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
      errorCode = v10->_errorCode;
      v10->_errorCode = (NSNumber *)v28;
    }
    else
    {
      v30 = v10->_errorDomain;
      v10->_errorDomain = 0;

      errorCode = v10->_errorCode;
      v10->_errorCode = 0;
    }

    v10->_eventType = 3;
  }

  return v10;
}

- (LBFMLRuntimedEvent)initWithTaskCompleted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LBFMLRuntimedEvent;
  v10 = [(LBFMLRuntimedEvent *)&v32 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v7, v4, v8, v9);
    succeeded = v10->_succeeded;
    v10->_succeeded = (NSNumber *)v11;

    if (v6)
    {
      uint64_t v17 = objc_msgSend_domain(v6, v13, v14, v15, v16);
      errorDomain = v10->_errorDomain;
      v10->_errorDomain = (NSString *)v17;

      v19 = NSNumber;
      uint64_t v24 = objc_msgSend_code(v6, v20, v21, v22, v23);
      uint64_t v28 = objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
      errorCode = v10->_errorCode;
      v10->_errorCode = (NSNumber *)v28;
    }
    else
    {
      v30 = v10->_errorDomain;
      v10->_errorDomain = 0;

      errorCode = v10->_errorCode;
      v10->_errorCode = 0;
    }

    v10->_eventType = 4;
  }

  return v10;
}

- (LBFMLRuntimedEvent)initWithScheduleStatus:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFMLRuntimedEvent;
  v7 = [(LBFMLRuntimedEvent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_numberWithBool_(NSNumber, v4, v3, v5, v6);
    scheduled = v7->_scheduled;
    v7->_scheduled = (NSNumber *)v8;

    v7->_eventType = 1;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (LBFMLRuntimedEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_9;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v68 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_2545866C4(v68);
    }
    goto LABEL_12;
  }
  uint64_t v10 = objc_msgSend_eventType(v5, v6, v7, v8, v9);
  if (v10 != objc_msgSend_eventType(self, v11, v12, v13, v14))
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586CBC();
    }
    goto LABEL_12;
  }
  v19 = objc_msgSend_succeeded(v5, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_succeeded(self, v20, v21, v22, v23);
  char IsEqualNumberOrNil_n2 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v25, (uint64_t)v19, (uint64_t)v24, v26);

  if ((IsEqualNumberOrNil_n2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586C14();
    }
    goto LABEL_12;
  }
  objc_super v32 = objc_msgSend_errorCode(v5, v28, v29, v30, v31);
  v37 = objc_msgSend_errorCode(self, v33, v34, v35, v36);
  char v40 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v38, (uint64_t)v32, (uint64_t)v37, v39);

  if ((v40 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586B6C();
    }
    goto LABEL_12;
  }
  v45 = objc_msgSend_errorDomain(v5, v41, v42, v43, v44);
  v50 = objc_msgSend_errorDomain(self, v46, v47, v48, v49);
  char IsEqualStringOrNil_s2 = objc_msgSend_IsEqualStringOrNil_s2_(LBFUtils, v51, (uint64_t)v45, (uint64_t)v50, v52);

  if ((IsEqualStringOrNil_s2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586AC4();
    }
    goto LABEL_12;
  }
  v58 = objc_msgSend_scheduled(v5, v54, v55, v56, v57);
  v63 = objc_msgSend_scheduled(self, v59, v60, v61, v62);
  char v66 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v64, (uint64_t)v58, (uint64_t)v63, v65);

  if ((v66 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586A1C();
    }
LABEL_12:
    BOOL v67 = 0;
    goto LABEL_13;
  }
LABEL_9:
  BOOL v67 = 1;
LABEL_13:

  return v67;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)scheduled
{
  return self->_scheduled;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduled, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
}

@end