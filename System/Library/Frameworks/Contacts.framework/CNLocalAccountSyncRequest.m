@interface CNLocalAccountSyncRequest
+ (BOOL)supportsSecureCoding;
+ (id)argumentsForRequest:(id)a3;
- (BOOL)clearify;
- (BOOL)isEqual:(id)a3;
- (BOOL)resetStandby;
- (BOOL)standby;
- (CNLocalAccountSyncRequest)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)retryCount;
- (void)encodeWithCoder:(id)a3;
- (void)setClearify:(BOOL)a3;
- (void)setResetStandby:(BOOL)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setStandby:(BOOL)a3;
@end

@implementation CNLocalAccountSyncRequest

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"retryCount" unsignedInteger:self->_retryCount];
  id v5 = (id)[v3 appendName:@"standby" BOOLValue:self->_standby];
  id v6 = (id)[v3 appendName:@"resetStandby" BOOLValue:self->_resetStandby];
  id v7 = (id)[v3 appendName:@"clearify" BOOLValue:self->_clearify];
  v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNLocalAccountSyncRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || self->_retryCount != v4->_retryCount
      || !self->_standby == v4->_standby
      || !self->_resetStandby == v4->_resetStandby)
    {
      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = !self->_clearify ^ v4->_clearify;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_standby - self->_retryCount + 32 * self->_retryCount;
  uint64_t v3 = self->_resetStandby - v2 + 32 * v2;
  return self->_clearify - v3 + 32 * v3 + 15699857;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNLocalAccountSyncRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNLocalAccountSyncRequest *)self init];
  if (v5)
  {
    -[CNLocalAccountSyncRequest setRetryCount:](v5, "setRetryCount:", [v4 decodeIntegerForKey:@"retryCount"]);
    -[CNLocalAccountSyncRequest setStandby:](v5, "setStandby:", [v4 decodeBoolForKey:@"standby"]);
    -[CNLocalAccountSyncRequest setResetStandby:](v5, "setResetStandby:", [v4 decodeBoolForKey:@"resetStandby"]);
    -[CNLocalAccountSyncRequest setClearify:](v5, "setClearify:", [v4 decodeBoolForKey:@"clearify"]);
    id v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t retryCount = self->_retryCount;
  id v5 = a3;
  [v5 encodeInteger:retryCount forKey:@"retryCount"];
  [v5 encodeBool:self->_standby forKey:@"standby"];
  [v5 encodeBool:self->_resetStandby forKey:@"resetStandby"];
  [v5 encodeBool:self->_clearify forKey:@"clearify"];
}

+ (id)argumentsForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v4 addObject:@"--tricklesync"];
  if ([v3 retryCount])
  {
    [v4 addObject:@"--retry"];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v3, "retryCount"));
    [v4 addObject:v5];
  }
  if ([v3 standby]) {
    [v4 addObject:@"--standby"];
  }
  if ([v3 resetStandby]) {
    [v4 addObject:@"--reset-standby"];
  }
  if ([v3 clearify]) {
    [v4 addObject:@"--clearify"];
  }

  return v4;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_unint64_t retryCount = a3;
}

- (BOOL)standby
{
  return self->_standby;
}

- (void)setStandby:(BOOL)a3
{
  self->_standby = a3;
}

- (BOOL)resetStandby
{
  return self->_resetStandby;
}

- (void)setResetStandby:(BOOL)a3
{
  self->_resetStandby = a3;
}

- (BOOL)clearify
{
  return self->_clearify;
}

- (void)setClearify:(BOOL)a3
{
  self->_clearify = a3;
}

@end