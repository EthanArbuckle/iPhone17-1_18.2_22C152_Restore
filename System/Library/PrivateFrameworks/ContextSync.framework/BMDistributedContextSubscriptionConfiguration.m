@interface BMDistributedContextSubscriptionConfiguration
- (BMDistributedContextSubscriptionConfiguration)initWithOptions:(unint64_t)a3 lastChangedDate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastChangedDate;
- (NSNumber)oneOffSubscription;
- (NSNumber)wakeState;
- (unint64_t)hash;
- (void)setLastChangedDate:(id)a3;
- (void)setOneOffSubscription:(id)a3;
- (void)setWakeState:(id)a3;
@end

@implementation BMDistributedContextSubscriptionConfiguration

- (BMDistributedContextSubscriptionConfiguration)initWithOptions:(unint64_t)a3 lastChangedDate:(id)a4
{
  unsigned int v5 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMDistributedContextSubscriptionConfiguration;
  v8 = [(BMDistributedContextSubscriptionConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithInt:(v5 >> 1) & 1];
    oneOffSubscription = v8->_oneOffSubscription;
    v8->_oneOffSubscription = (NSNumber *)v9;

    uint64_t v11 = [NSNumber numberWithInt:v5 & 1];
    wakeState = v8->_wakeState;
    v8->_wakeState = (NSNumber *)v11;

    objc_storeStrong((id *)&v8->_lastChangedDate, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 oneOffSubscription];
    if ([v6 isEqual:self->_oneOffSubscription])
    {
      id v7 = [v5 wakeState];
      char v8 = [v7 isEqual:self->_wakeState];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_oneOffSubscription hash];
  return [(NSNumber *)self->_wakeState hash] ^ v3;
}

- (NSNumber)oneOffSubscription
{
  return self->_oneOffSubscription;
}

- (void)setOneOffSubscription:(id)a3
{
}

- (NSNumber)wakeState
{
  return self->_wakeState;
}

- (void)setWakeState:(id)a3
{
}

- (NSDate)lastChangedDate
{
  return self->_lastChangedDate;
}

- (void)setLastChangedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangedDate, 0);
  objc_storeStrong((id *)&self->_wakeState, 0);
  objc_storeStrong((id *)&self->_oneOffSubscription, 0);
}

@end