@interface _CDRateLimiter
+ (id)sharedRateLimiter;
- (BOOL)credit;
- (BOOL)debited;
- (NSString)description;
- (_CDRateLimiter)init;
- (_CDRateLimiter)initWithCount:(int64_t)a3 perPeriod:(double)a4;
- (double)period;
- (int64_t)count;
- (void)recordTimeAndRefillIfNeeded;
- (void)resetRateLimitWithTimeStamp:(id)a3;
@end

@implementation _CDRateLimiter

- (void)recordTimeAndRefillIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSDate *)self->_lastRecorded timeIntervalSinceNow];
  if (fabs(v3) > self->_period)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(_CDRateLimiter *)self resetRateLimitWithTimeStamp:v4];
  }
}

- (BOOL)debited
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25___CDRateLimiter_debited__block_invoke;
  v5[3] = &unk_1E560EBD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetRateLimitWithTimeStamp:(id)a3
{
  id v4 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lastRecorded = self->_lastRecorded;
  self->_lastRecorded = v4;

  self->_balance = 0;
}

- (_CDRateLimiter)initWithCount:(int64_t)a3 perPeriod:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_CDRateLimiter;
  uint64_t v6 = [(_CDRateLimiter *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.duet.ratelimiter", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_period = a4;
    v6->_count = a3;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastRecorded = v6->_lastRecorded;
    v6->_lastRecorded = (NSDate *)v9;

    v6->_balance = 0;
  }
  return v6;
}

+ (id)sharedRateLimiter
{
  if (sharedRateLimiter_onceToken != -1) {
    dispatch_once(&sharedRateLimiter_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)sharedRateLimiter__sharedRateLimiter;
  return v2;
}

- (_CDRateLimiter)init
{
  return [(_CDRateLimiter *)self initWithCount:30 perPeriod:60.0];
}

- (BOOL)credit
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24___CDRateLimiter_credit__block_invoke;
  block[3] = &unk_1E560D578;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(_CDRateLimiter *)self period];
  dispatch_queue_t v7 = [v3 stringWithFormat:@"%@: { period=%f, count=%ld }", v5, v6, -[_CDRateLimiter count](self, "count")];

  return (NSString *)v7;
}

- (double)period
{
  return self->_period;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastRecorded, 0);
}

@end