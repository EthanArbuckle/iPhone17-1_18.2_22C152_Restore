@interface LBFTrialEvent
- (BOOL)isEqual:(id)a3;
- (LBFTrialEvent)initWithActivation:(BOOL)a3;
- (LBFTrialEvent)initWithAllocation:(BOOL)a3;
- (LBFTrialEvent)initWithDeactivation:(BOOL)a3;
- (NSNumber)succeeded;
- (int64_t)eventType;
@end

@implementation LBFTrialEvent

- (LBFTrialEvent)initWithAllocation:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFTrialEvent;
  v7 = [(LBFTrialEvent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_numberWithBool_(NSNumber, v4, v3, v5, v6);
    succeeded = v7->_succeeded;
    v7->_succeeded = (NSNumber *)v8;

    v7->_eventType = 1;
  }
  return v7;
}

- (LBFTrialEvent)initWithActivation:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFTrialEvent;
  v7 = [(LBFTrialEvent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_numberWithBool_(NSNumber, v4, v3, v5, v6);
    succeeded = v7->_succeeded;
    v7->_succeeded = (NSNumber *)v8;

    v7->_eventType = 2;
  }
  return v7;
}

- (LBFTrialEvent)initWithDeactivation:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFTrialEvent;
  v7 = [(LBFTrialEvent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_numberWithBool_(NSNumber, v4, v3, v5, v6);
    succeeded = v7->_succeeded;
    v7->_succeeded = (NSNumber *)v8;

    v7->_eventType = 3;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LBFTrialEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_6;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v29 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_25458650C(v29);
    }
    goto LABEL_9;
  }
  v10 = objc_msgSend_succeeded(v5, v6, v7, v8, v9);
  v15 = objc_msgSend_succeeded(self, v11, v12, v13, v14);
  char IsEqualNumberOrNil_n2 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v16, (uint64_t)v10, (uint64_t)v15, v17);

  if ((IsEqualNumberOrNil_n2 & 1) == 0)
  {
    v31 = (void *)LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586600(v31, v5, self);
    }
    goto LABEL_9;
  }
  uint64_t v23 = objc_msgSend_eventType(v5, v19, v20, v21, v22);
  if (v23 != objc_msgSend_eventType(self, v24, v25, v26, v27))
  {
    v32 = (void *)LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254586550(v32, v5, self);
    }
LABEL_9:
    BOOL v28 = 0;
    goto LABEL_10;
  }
LABEL_6:
  BOOL v28 = 1;
LABEL_10:

  return v28;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
}

@end