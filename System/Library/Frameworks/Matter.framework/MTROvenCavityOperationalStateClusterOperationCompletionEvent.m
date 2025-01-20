@interface MTROvenCavityOperationalStateClusterOperationCompletionEvent
- (MTROvenCavityOperationalStateClusterOperationCompletionEvent)init;
- (NSNumber)completionErrorCode;
- (NSNumber)pausedTime;
- (NSNumber)totalOperationalTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCompletionErrorCode:(id)a3;
- (void)setPausedTime:(id)a3;
- (void)setTotalOperationalTime:(id)a3;
@end

@implementation MTROvenCavityOperationalStateClusterOperationCompletionEvent

- (MTROvenCavityOperationalStateClusterOperationCompletionEvent)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTROvenCavityOperationalStateClusterOperationCompletionEvent;
  v2 = [(MTROvenCavityOperationalStateClusterOperationCompletionEvent *)&v8 init];
  v3 = v2;
  if (v2)
  {
    completionErrorCode = v2->_completionErrorCode;
    v2->_completionErrorCode = (NSNumber *)&unk_26F9C8620;

    totalOperationalTime = v3->_totalOperationalTime;
    v3->_totalOperationalTime = 0;

    pausedTime = v3->_pausedTime;
    v3->_pausedTime = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROvenCavityOperationalStateClusterOperationCompletionEvent);
  v7 = objc_msgSend_completionErrorCode(self, v5, v6);
  objc_msgSend_setCompletionErrorCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_totalOperationalTime(self, v9, v10);
  objc_msgSend_setTotalOperationalTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_pausedTime(self, v13, v14);
  objc_msgSend_setPausedTime_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: completionErrorCode:%@; totalOperationalTime:%@; pausedTime:%@; >",
    v5,
    self->_completionErrorCode,
    self->_totalOperationalTime,
  v7 = self->_pausedTime);

  return v7;
}

- (NSNumber)completionErrorCode
{
  return self->_completionErrorCode;
}

- (void)setCompletionErrorCode:(id)a3
{
}

- (NSNumber)totalOperationalTime
{
  return self->_totalOperationalTime;
}

- (void)setTotalOperationalTime:(id)a3
{
}

- (NSNumber)pausedTime
{
  return self->_pausedTime;
}

- (void)setPausedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedTime, 0);
  objc_storeStrong((id *)&self->_totalOperationalTime, 0);

  objc_storeStrong((id *)&self->_completionErrorCode, 0);
}

@end