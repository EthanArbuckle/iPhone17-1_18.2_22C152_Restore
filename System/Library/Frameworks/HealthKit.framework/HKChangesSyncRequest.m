@interface HKChangesSyncRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lite;
- (BOOL)pull;
- (BOOL)push;
- (HKChangesSyncRequest)init;
- (HKChangesSyncRequest)initWithCoder:(id)a3;
- (HKChangesSyncRequest)initWithPush:(BOOL)a3 pull:(BOOL)a4 lite:(BOOL)a5;
- (id)description;
- (id)requestByMergingRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKChangesSyncRequest

- (HKChangesSyncRequest)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKChangesSyncRequest)initWithPush:(BOOL)a3 pull:(BOOL)a4 lite:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HKChangesSyncRequest;
  result = [(HKChangesSyncRequest *)&v9 init];
  if (result)
  {
    result->_push = a3;
    result->_pull = a4;
    result->_lite = a5;
  }
  return result;
}

- (id)requestByMergingRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [HKChangesSyncRequest alloc];
    BOOL v6 = ([v4 push] & 1) != 0 || self->_push;
    BOOL v8 = ([v4 pull] & 1) != 0 || self->_pull;
    BOOL v9 = ([v4 lite] & 1) != 0 || self->_lite;
    v7 = [(HKChangesSyncRequest *)v5 initWithPush:v6 pull:v8 lite:v9];
  }
  else
  {
    v7 = self;
  }
  v10 = v7;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_push == [v4 push]
    && self->_pull == [v4 pull]
    && self->_lite == [v4 lite];

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
  [v5 encodeBool:self->_lite forKey:@"lite"];
}

- (HKChangesSyncRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKChangesSyncRequest;
  id v5 = [(HKChangesSyncRequest *)&v7 init];
  if (v5)
  {
    v5->_BOOL push = [v4 decodeBoolForKey:@"push"];
    v5->_pull = [v4 decodeBoolForKey:@"pull"];
    v5->_lite = [v4 decodeBoolForKey:@"lite"];
  }

  return v5;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p Push: %d, Pull: %d, Lite: %d", objc_opt_class(), self, -[HKChangesSyncRequest push](self, "push"), -[HKChangesSyncRequest pull](self, "pull"), -[HKChangesSyncRequest lite](self, "lite")];
}

- (BOOL)push
{
  return self->_push;
}

- (BOOL)pull
{
  return self->_pull;
}

- (BOOL)lite
{
  return self->_lite;
}

@end