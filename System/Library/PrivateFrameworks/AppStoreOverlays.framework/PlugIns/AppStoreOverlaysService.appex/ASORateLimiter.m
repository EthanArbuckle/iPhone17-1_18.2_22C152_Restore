@interface ASORateLimiter
- (ASORateLimiter)init;
- (ASORateLimiter)initWithRequestsPerSecond:(double)a3 timeWindow:(double)a4;
- (BOOL)recordAttempt;
- (double)requestsPerSecond;
- (double)timeWindow;
- (void)setRequestsPerSecond:(double)a3;
- (void)setTimeWindow:(double)a3;
@end

@implementation ASORateLimiter

- (ASORateLimiter)initWithRequestsPerSecond:(double)a3 timeWindow:(double)a4
{
  return (ASORateLimiter *)sub_100011054(a3, a4);
}

- (double)requestsPerSecond
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ASORateLimiter_requestsPerSecond);
}

- (void)setRequestsPerSecond:(double)a3
{
}

- (double)timeWindow
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ASORateLimiter_timeWindow);
}

- (void)setTimeWindow:(double)a3
{
}

- (BOOL)recordAttempt
{
  v2 = self;
  BOOL v3 = sub_100011358();

  return v3;
}

- (ASORateLimiter)init
{
  result = (ASORateLimiter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR___ASORateLimiter_lastCounterUpdate;
  uint64_t v4 = sub_100018590();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASORateLimiter_requestCounterLock);
}

@end