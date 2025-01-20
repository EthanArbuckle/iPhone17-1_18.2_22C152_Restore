@interface LBFLighthouseEvent
- (BOOL)isEqual:(id)a3;
- (LBFLighthouseEvent)initWithPerformTaskStatus:(BOOL)a3 error:(id)a4;
- (LBFLighthouseEvent)initWithPerformTrialTaskStatus:(BOOL)a3 error:(id)a4;
- (LBFLighthouseEvent)initWithPerformTrialTaskStatus:(BOOL)a3 error:(id)a4 usePrivateUpload:(BOOL)a5;
- (LBFLighthouseEvent)initWithStop:(BOOL)a3 error:(id)a4;
- (NSNumber)errorCode;
- (NSNumber)succeeded;
- (NSNumber)usePrivateUpload;
- (NSString)errorDomain;
- (int64_t)eventType;
@end

@implementation LBFLighthouseEvent

- (LBFLighthouseEvent)initWithPerformTaskStatus:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)LBFLighthouseEvent;
  v10 = [(LBFLighthouseEvent *)&v37 init];
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

    uint64_t v34 = objc_msgSend_numberWithBool_(NSNumber, v31, 0, v32, v33);
    usePrivateUpload = v10->_usePrivateUpload;
    v10->_usePrivateUpload = (NSNumber *)v34;

    v10->_eventType = 1;
  }

  return v10;
}

- (LBFLighthouseEvent)initWithPerformTrialTaskStatus:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)LBFLighthouseEvent;
  v10 = [(LBFLighthouseEvent *)&v37 init];
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

    uint64_t v34 = objc_msgSend_numberWithBool_(NSNumber, v31, 0, v32, v33);
    usePrivateUpload = v10->_usePrivateUpload;
    v10->_usePrivateUpload = (NSNumber *)v34;

    v10->_eventType = 2;
  }

  return v10;
}

- (LBFLighthouseEvent)initWithStop:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)LBFLighthouseEvent;
  v10 = [(LBFLighthouseEvent *)&v37 init];
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

    uint64_t v34 = objc_msgSend_numberWithBool_(NSNumber, v31, 0, v32, v33);
    usePrivateUpload = v10->_usePrivateUpload;
    v10->_usePrivateUpload = (NSNumber *)v34;

    v10->_eventType = 3;
  }

  return v10;
}

- (LBFLighthouseEvent)initWithPerformTrialTaskStatus:(BOOL)a3 error:(id)a4 usePrivateUpload:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)LBFLighthouseEvent;
  v12 = [(LBFLighthouseEvent *)&v39 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v9, v6, v10, v11);
    succeeded = v12->_succeeded;
    v12->_succeeded = (NSNumber *)v13;

    if (v8)
    {
      uint64_t v19 = objc_msgSend_domain(v8, v15, v16, v17, v18);
      errorDomain = v12->_errorDomain;
      v12->_errorDomain = (NSString *)v19;

      uint64_t v21 = NSNumber;
      uint64_t v26 = objc_msgSend_code(v8, v22, v23, v24, v25);
      uint64_t v30 = objc_msgSend_numberWithInteger_(v21, v27, v26, v28, v29);
      errorCode = v12->_errorCode;
      v12->_errorCode = (NSNumber *)v30;
    }
    else
    {
      uint64_t v32 = v12->_errorDomain;
      v12->_errorDomain = 0;

      errorCode = v12->_errorCode;
      v12->_errorCode = 0;
    }

    uint64_t v36 = objc_msgSend_numberWithBool_(NSNumber, v33, v5, v34, v35);
    usePrivateUpload = v12->_usePrivateUpload;
    v12->_usePrivateUpload = (NSNumber *)v36;

    v12->_eventType = 2;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (LBFLighthouseEvent *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    goto LABEL_8;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v55 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_2545866C4(v55);
    }
    goto LABEL_11;
  }
  uint64_t v10 = objc_msgSend_succeeded(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_succeeded(self, v11, v12, v13, v14);
  char IsEqualNumberOrNil_n2 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v16, (uint64_t)v10, (uint64_t)v15, v17);

  if ((IsEqualNumberOrNil_n2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_2545868FC();
    }
    goto LABEL_11;
  }
  uint64_t v23 = objc_msgSend_errorCode(v5, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_errorCode(self, v24, v25, v26, v27);
  char v31 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v29, (uint64_t)v23, (uint64_t)v28, v30);

  if ((v31 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586854();
    }
    goto LABEL_11;
  }
  uint64_t v36 = objc_msgSend_errorDomain(v5, v32, v33, v34, v35);
  v41 = objc_msgSend_errorDomain(self, v37, v38, v39, v40);
  char IsEqualStringOrNil_s2 = objc_msgSend_IsEqualStringOrNil_s2_(LBFUtils, v42, (uint64_t)v36, (uint64_t)v41, v43);

  if ((IsEqualStringOrNil_s2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_2545867AC();
    }
    goto LABEL_11;
  }
  uint64_t v49 = objc_msgSend_eventType(v5, v45, v46, v47, v48);
  if (v49 != objc_msgSend_eventType(self, v50, v51, v52, v53))
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586708();
    }
LABEL_11:
    BOOL v54 = 0;
    goto LABEL_12;
  }
LABEL_8:
  BOOL v54 = 1;
LABEL_12:

  return v54;
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

- (NSNumber)usePrivateUpload
{
  return self->_usePrivateUpload;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usePrivateUpload, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
}

@end