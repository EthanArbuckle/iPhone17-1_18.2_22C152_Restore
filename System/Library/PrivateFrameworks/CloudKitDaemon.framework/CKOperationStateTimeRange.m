@interface CKOperationStateTimeRange
- (CKOperationStateTimeRange)initWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5;
- (NSDate)startDate;
- (NSString)description;
- (double)absoluteStart;
- (double)absoluteStop;
- (double)duration;
- (double)executing;
- (double)queueing;
- (double)relativeStart;
- (id)CKPropertiesDescription;
- (int64_t)compareStartTime:(id)a3;
- (int64_t)compareStopTime:(id)a3;
- (unint64_t)operationState;
@end

@implementation CKOperationStateTimeRange

- (CKOperationStateTimeRange)initWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKOperationStateTimeRange;
  v10 = [(CKOperationStateTimeRange *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_operationState = a3;
    objc_storeStrong((id *)&v10->_startDate, a4);
    v11->_duration = a5;
  }

  return v11;
}

- (double)absoluteStart
{
  v3 = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_timeIntervalSinceReferenceDate(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)queueing
{
  double result = 0.0;
  if (!self->_operationState) {
    return self->_duration;
  }
  return result;
}

- (double)executing
{
  double result = 0.0;
  if (self->_operationState == 1) {
    return self->_duration;
  }
  return result;
}

- (int64_t)compareStartTime:(id)a3
{
  id v4 = a3;
  objc_msgSend_absoluteStart(self, v5, v6);
  double v8 = v7;
  objc_msgSend_absoluteStart(v4, v9, v10);
  double v12 = v11;

  if (v8 < v12) {
    return -1;
  }
  else {
    return v8 > v12;
  }
}

- (int64_t)compareStopTime:(id)a3
{
  id v4 = a3;
  objc_msgSend_absoluteStop(self, v5, v6);
  double v8 = v7;
  objc_msgSend_absoluteStop(v4, v9, v10);
  double v12 = v11;

  if (v8 < v12) {
    return -1;
  }
  else {
    return v8 > v12;
  }
}

- (double)absoluteStop
{
  objc_msgSend_absoluteStart(self, a2, v2);
  double v5 = v4;
  objc_msgSend_duration(self, v6, v7);
  return v5 + v8;
}

- (double)relativeStart
{
  objc_msgSend_absoluteStart(self, a2, v2);
  double v4 = v3;
  double Current = *(double *)&qword_1EA3D1068;
  if (*(double *)&qword_1EA3D1068 == 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    qword_1EA3D1068 = *(void *)&Current;
  }
  return v4 - Current;
}

- (id)CKPropertiesDescription
{
  unint64_t v4 = objc_msgSend_operationState(self, a2, v2);
  if (v4 > 2) {
    uint64_t v7 = @"(UNKNOWN)";
  }
  else {
    uint64_t v7 = off_1E64F88E8[v4];
  }
  double v8 = NSString;
  id v9 = objc_msgSend_startDate(self, v5, v6);
  objc_msgSend_duration(self, v10, v11);
  v14 = objc_msgSend_stringWithFormat_(v8, v12, @"startDate=%@, duration=%0.3f, state=%@", v9, v13, v7);

  return v14;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKOperationStateTimeRange *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (unint64_t)operationState
{
  return self->_operationState;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end