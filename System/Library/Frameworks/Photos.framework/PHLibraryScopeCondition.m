@interface PHLibraryScopeCondition
+ (Class)_mappedPLConditionClass;
- (PHLibraryScopeCondition)init;
- (PHLibraryScopeCondition)initWithProxyObject:(id)a3;
- (PLLibraryScopeCondition)proxyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)setProxyObject:(id)a3;
@end

@implementation PHLibraryScopeCondition

- (void).cxx_destruct
{
}

- (void)setProxyObject:(id)a3
{
}

- (PLLibraryScopeCondition)proxyObject
{
  return self->_proxyObject;
}

- (id)description
{
  return (id)[(PLLibraryScopeCondition *)self->_proxyObject description];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)[(PLLibraryScopeCondition *)self->_proxyObject copyWithZone:a3];
  v7 = (void *)[v5 initWithProxyObject:v6];

  return v7;
}

- (PHLibraryScopeCondition)init
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() _mappedPLConditionClass]);
  v4 = [(PHLibraryScopeCondition *)self initWithProxyObject:v3];

  return v4;
}

- (PHLibraryScopeCondition)initWithProxyObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLibraryScopeCondition;
  v6 = [(PHLibraryScopeCondition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyObject, a3);
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_proxyObject;
}

+ (Class)_mappedPLConditionClass
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()
    || (uint64_t v3 = objc_opt_class(), v3 == objc_opt_class())
    || (uint64_t v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    id v5 = objc_opt_class();
  }
  else
  {
    id v5 = 0;
  }

  return (Class)v5;
}

@end