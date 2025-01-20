@interface BSEventQueueLock
- (BSEventQueueLock)initWithEventQueue:(id)a3 reason:(id)a4;
- (NSString)reason;
- (id)description;
- (void)dealloc;
- (void)relinquish;
@end

@implementation BSEventQueueLock

- (void)dealloc
{
  [(BSEventQueueLock *)self relinquish];
  v3.receiver = self;
  v3.super_class = (Class)BSEventQueueLock;
  [(BSEventQueueLock *)&v3 dealloc];
}

- (void)relinquish
{
  if (!self->_relinquished)
  {
    self->_relinquished = 1;
    -[BSEventQueue _removeEventQueueLock:]((id *)&self->_eventQueue->super.isa, (uint64_t)self);
  }
}

- (BSEventQueueLock)initWithEventQueue:(id)a3 reason:(id)a4
{
  if (a4)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BSEventQueueLock.m", 28, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"BSEventQueueLock.m", 29, @"Invalid parameter not satisfying: %@", @"eventQueue" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)BSEventQueueLock;
  v8 = [(BSEventQueueLock *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventQueue, a3);
    -[BSEventQueue _addEventQueueLock:]((id *)&v9->_eventQueue->super.isa, (uint64_t)v9);
    uint64_t v10 = [a4 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (id)description
{
  objc_super v3 = [(BSEventQueueLock *)self reason];
  v4 = +[BSDescriptionBuilder descriptionForObject:self, v3, @"reason", 0 withObjectsAndNames];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

@end