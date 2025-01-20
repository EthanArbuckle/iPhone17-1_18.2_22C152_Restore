@interface GTReplayQueryPerformanceState
+ (BOOL)supportsSecureCoding;
- (GTReplayQueryPerformanceState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTReplayQueryPerformanceState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayQueryPerformanceState)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTReplayQueryPerformanceState;
  return [(GTReplayRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTReplayQueryPerformanceState;
  [(GTReplayRequest *)&v3 encodeWithCoder:a3];
}

@end