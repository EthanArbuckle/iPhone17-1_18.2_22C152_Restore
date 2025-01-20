@interface IKDataSubscript
- (BOOL)isEqual:(id)a3;
- (IKDataSubscript)initWithSubscriptIndex:(int64_t)a3;
- (int64_t)subscriptIndex;
@end

@implementation IKDataSubscript

- (IKDataSubscript)initWithSubscriptIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKDataSubscript;
  result = [(IKDataSubscript *)&v5 init];
  if (result) {
    result->_subscriptIndex = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 subscriptIndex];
    BOOL v6 = v5 == [(IKDataSubscript *)self subscriptIndex];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)subscriptIndex
{
  return self->_subscriptIndex;
}

@end