@interface HKContextSyncRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)pull;
- (BOOL)push;
- (HKContextSyncRequest)init;
- (HKContextSyncRequest)initWithCoder:(id)a3;
- (HKContextSyncRequest)initWithPush:(BOOL)a3 pull:(BOOL)a4;
- (id)description;
- (id)requestByMergingRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKContextSyncRequest

- (HKContextSyncRequest)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKContextSyncRequest)initWithPush:(BOOL)a3 pull:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKContextSyncRequest;
  result = [(HKContextSyncRequest *)&v7 init];
  if (result)
  {
    result->_push = a3;
    result->_pull = a4;
  }
  return result;
}

- (id)requestByMergingRequest:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [HKContextSyncRequest alloc];
    BOOL v6 = ([v4 push] & 1) != 0 || self->_push;
    char v8 = [v4 pull];

    BOOL v9 = (v8 & 1) != 0 || self->_pull;
    objc_super v7 = [(HKContextSyncRequest *)v5 initWithPush:v6 pull:v9];
  }
  else
  {
    objc_super v7 = self;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_push == [v4 push]
    && self->_pull == [v4 pull];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL push = self->_push;
  id v5 = a3;
  [v5 encodeBool:push forKey:@"push"];
  [v5 encodeBool:self->_pull forKey:@"pull"];
}

- (HKContextSyncRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKContextSyncRequest;
  id v5 = [(HKContextSyncRequest *)&v7 init];
  if (v5)
  {
    v5->_BOOL push = [v4 decodeBoolForKey:@"push"];
    v5->_pull = [v4 decodeBoolForKey:@"pull"];
  }

  return v5;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p Push: %d, Pull: %d", objc_opt_class(), self, self->_push, self->_pull];
}

- (BOOL)push
{
  return self->_push;
}

- (BOOL)pull
{
  return self->_pull;
}

@end