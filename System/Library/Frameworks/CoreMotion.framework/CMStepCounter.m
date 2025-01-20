@interface CMStepCounter
+ (BOOL)isStepCountingAvailable;
- (BOOL)enabled;
- (CMStepCounter)init;
- (CMStepCounterProxy)stepcounterProxy;
- (void)dealloc;
- (void)deleteHistory;
- (void)getTotalCountToQueue:(id)a3 withHandler:(id)a4;
- (void)queryStepCountStartingFrom:(NSDate *)start to:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMStepQueryHandler)handler;
- (void)startStepCountingUpdatesToQueue:(NSOperationQueue *)queue updateOn:(NSInteger)stepCounts withHandler:(CMStepUpdateHandler)handler;
- (void)stopStepCountingUpdates;
@end

@implementation CMStepCounter

- (CMStepCounter)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMStepCounter;
  v2 = [(CMStepCounter *)&v4 init];
  if (v2) {
    v2->_stepcounterProxy = objc_alloc_init(CMStepCounterProxy);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMStepCounter;
  [(CMStepCounter *)&v3 dealloc];
}

+ (BOOL)isStepCountingAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_isStepCountingAvailable(CMPedometer, v2, v3);
}

- (void)queryStepCountStartingFrom:(NSDate *)start to:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMStepQueryHandler)handler
{
  if (start)
  {
    if (end) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMStepCounter.mm", 218, @"Invalid parameter not satisfying: %@", @"start");
    if (end)
    {
LABEL_3:
      if (queue) {
        goto LABEL_4;
      }
LABEL_8:
      v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CMStepCounter.mm", 220, @"Invalid parameter not satisfying: %@", @"queue");
      if (handler) {
        goto LABEL_5;
      }
LABEL_9:
      v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CMStepCounter.mm", 221, @"Invalid parameter not satisfying: %@", @"handler");
      goto LABEL_5;
    }
  }
  v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CMStepCounter.mm", 219, @"Invalid parameter not satisfying: %@", @"end");
  if (!queue) {
    goto LABEL_8;
  }
LABEL_4:
  if (!handler) {
    goto LABEL_9;
  }
LABEL_5:
  v12 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, (uint64_t)start) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905B07A8;
  block[3] = &unk_1E568D3E8;
  block[4] = self;
  block[5] = start;
  block[6] = end;
  block[7] = queue;
  block[8] = handler;
  dispatch_async(v12, block);
}

- (void)startStepCountingUpdatesToQueue:(NSOperationQueue *)queue updateOn:(NSInteger)stepCounts withHandler:(CMStepUpdateHandler)handler
{
  if (!queue)
  {
    v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMStepCounter.mm", 237, @"Invalid parameter not satisfying: %@", @"queue");
    if (handler) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)queue);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMStepCounter.mm", 238, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_3;
  }
  if (!handler) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, (uint64_t)queue) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905B0A34;
  block[3] = &unk_1E568DE28;
  block[4] = self;
  block[5] = queue;
  block[6] = handler;
  block[7] = stepCounts;
  dispatch_async(v10, block);
}

- (void)stopStepCountingUpdates
{
  objc_super v4 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, v2) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905B0D8C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (BOOL)enabled
{
  return 0;
}

- (void)getTotalCountToQueue:(id)a3 withHandler:(id)a4
{
  v5 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_dateByAddingTimeInterval_(v5, v6, v7, -5184000.0);

  MEMORY[0x1F4181798](self, sel_queryStepCountStartingFrom_to_toQueue_withHandler_, v8);
}

- (void)deleteHistory
{
  objc_super v4 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, v2) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905B1150;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (CMStepCounterProxy)stepcounterProxy
{
  return self->_stepcounterProxy;
}

@end