@interface GTReplayQuerySessionInfo
+ (BOOL)supportsSecureCoding;
- (GTReplayQuerySessionInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTReplayQuerySessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayQuerySessionInfo)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTReplayQuerySessionInfo;
  return [(GTReplayRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTReplayQuerySessionInfo;
  [(GTReplayRequest *)&v3 encodeWithCoder:a3];
}

@end