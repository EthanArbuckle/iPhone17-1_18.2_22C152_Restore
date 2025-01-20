@interface GTReplayQueryResourceUsage
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayQueryResourceUsage)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
@end

@implementation GTReplayQueryResourceUsage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayQueryResourceUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayQueryResourceUsage;
  v5 = [(GTReplayRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayQueryResourceUsage;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

@end