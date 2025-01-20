@interface HNDRepostedButtonEventInfo
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)buttonMask;
- (void)setButtonMask:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation HNDRepostedButtonEventInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(HNDRepostedButtonEventInfo *)self timestamp];
    if (v6 == [v5 timestamp])
    {
      unsigned int v7 = [(HNDRepostedButtonEventInfo *)self buttonMask];
      BOOL v8 = v7 == [v5 buttonMask];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HNDRepostedButtonEventInfo *)self timestamp];
  return v3 ^ [(HNDRepostedButtonEventInfo *)self buttonMask];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)HNDRepostedButtonEventInfo;
  unint64_t v3 = [(HNDRepostedButtonEventInfo *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" - timestamp: %llu, buttonMask: %u", -[HNDRepostedButtonEventInfo timestamp](self, "timestamp"), -[HNDRepostedButtonEventInfo buttonMask](self, "buttonMask")];

  return v4;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unsigned)buttonMask
{
  return self->_buttonMask;
}

- (void)setButtonMask:(unsigned int)a3
{
  self->_buttonMask = a3;
}

@end