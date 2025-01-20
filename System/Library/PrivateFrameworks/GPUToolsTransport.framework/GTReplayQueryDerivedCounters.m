@interface GTReplayQueryDerivedCounters
+ (BOOL)supportsSecureCoding;
- (GTReplayQueryDerivedCounters)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTReplayQueryDerivedCounters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayQueryDerivedCounters)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTReplayQueryDerivedCounters;
  return [(GTReplayRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTReplayQueryDerivedCounters;
  [(GTReplayRequest *)&v3 encodeWithCoder:a3];
}

@end