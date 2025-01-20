@interface HMMLogEventTagProcessor
- (BOOL)isActive;
- (HMMLogEvent)logEvent;
- (HMMLogEventSubmitting)submitter;
- (HMMLogEventTagProcessor)initWithSubmitter:(id)a3;
- (NSDictionary)tagProcessingBlocks;
- (int64_t)lastUpdate;
- (void)closeForReason:(unint64_t)a3;
- (void)dealloc;
- (void)setLastUpdate:(int64_t)a3;
@end

@implementation HMMLogEventTagProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_logEvent, 0);
}

- (HMMLogEventSubmitting)submitter
{
  return self->_submitter;
}

- (HMMLogEvent)logEvent
{
  return self->_logEvent;
}

- (void)setLastUpdate:(int64_t)a3
{
  self->_lastUpdate = a3;
}

- (int64_t)lastUpdate
{
  return self->_lastUpdate;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)dealloc
{
  if (self->_active) {
    [(HMMLogEventTagProcessor *)self closeForReason:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)HMMLogEventTagProcessor;
  [(HMMLogEventTagProcessor *)&v3 dealloc];
}

- (void)closeForReason:(unint64_t)a3
{
  [(HMMLogEventTagProcessor *)self setLogEventCloseReason:a3];
  v4 = [(HMMLogEventTagProcessor *)self submitter];
  v5 = [(HMMLogEventTagProcessor *)self logEvent];
  [v4 submitLogEvent:v5];

  self->_active = 0;
}

- (NSDictionary)tagProcessingBlocks
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMMLogEventTagProcessor)initWithSubmitter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMLogEventTagProcessor;
  v6 = [(HMMLogEventTagProcessor *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_submitter, a3);
    v7->_active = 1;
  }

  return v7;
}

@end