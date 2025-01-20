@interface LBFDprivacydEvent
- (LBFDprivacydEvent)initWithEventPhase:(int)a3 eventUUID:(id)a4 succeeded:(BOOL)a5 error:(id)a6;
- (LBFDprivacydEvent)initWithEventPhase:(int)a3 eventUUID:(id)a4 succeeded:(BOOL)a5 error:(id)a6 aggregateFunction:(int)a7 count:(int)a8;
- (NSNumber)succeeded;
- (NSString)errorMessage;
- (NSString)eventUUID;
- (int)aggregateFunction;
- (int)count;
- (int)errorCode;
- (int)eventPhase;
@end

@implementation LBFDprivacydEvent

- (LBFDprivacydEvent)initWithEventPhase:(int)a3 eventUUID:(id)a4 succeeded:(BOOL)a5 error:(id)a6
{
  return (LBFDprivacydEvent *)objc_msgSend_initWithEventPhase_eventUUID_succeeded_error_aggregateFunction_count_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, 0, 0);
}

- (LBFDprivacydEvent)initWithEventPhase:(int)a3 eventUUID:(id)a4 succeeded:(BOOL)a5 error:(id)a6 aggregateFunction:(int)a7 count:(int)a8
{
  BOOL v11 = a5;
  id v15 = a4;
  id v16 = a6;
  v35.receiver = self;
  v35.super_class = (Class)LBFDprivacydEvent;
  v17 = [(LBFDprivacydEvent *)&v35 init];
  v18 = v17;
  if (v17)
  {
    v17->_eventPhase = a3;
    objc_storeStrong((id *)&v17->_eventUUID, a4);
    uint64_t v22 = objc_msgSend_numberWithBool_(NSNumber, v19, v11, v20, v21);
    succeeded = v18->_succeeded;
    v18->_succeeded = (NSNumber *)v22;

    v18->_errorCode = objc_msgSend_code(v16, v24, v25, v26, v27);
    uint64_t v32 = objc_msgSend_localizedDescription(v16, v28, v29, v30, v31);
    errorMessage = v18->_errorMessage;
    v18->_errorMessage = (NSString *)v32;

    v18->_aggregateFunction = a7;
    v18->_count = a8;
  }

  return v18;
}

- (int)eventPhase
{
  return self->_eventPhase;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (int)aggregateFunction
{
  return self->_aggregateFunction;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_eventUUID, 0);
}

@end