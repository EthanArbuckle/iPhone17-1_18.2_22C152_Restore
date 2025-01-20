@interface CNWeakProxy
+ (id)weakProxyWithObject:(id)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CNWeakProxy)initWithObject:(id)a3;
- (Class)class;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)forwardInvocation:(id)a3;
@end

@implementation CNWeakProxy

+ (id)weakProxyWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return v5;
}

- (CNWeakProxy)initWithObject:(id)a3
{
  id v4 = a3;
  self->_targetClass = (Class)objc_opt_class();
  objc_storeWeak(&self->_weakReference, v4);

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);

  return WeakRetained;
}

- (void)forwardInvocation:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 methodSignature];
  size_t v5 = [v4 methodReturnLength];
  if (v5)
  {
    v6 = (char *)v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v6, v5);
    [v3 setReturnValue:v6];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  if (WeakRetained) {
    char v6 = objc_opt_respondsToSelector();
  }
  else {
    char v6 = [(objc_class *)self->_targetClass instancesRespondToSelector:a3];
  }
  char v7 = v6;

  return v7 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(objc_class *)self->_targetClass instanceMethodSignatureForSelector:a3];
}

- (BOOL)conformsToProtocol:(id)a3
{
  p_weakReference = &self->_weakReference;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_weakReference);
  char v7 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self->_targetClass;
  }
  char v8 = [WeakRetained conformsToProtocol:v5];

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  unint64_t v3 = [WeakRetained hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  p_weakReference = &self->_weakReference;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(p_weakReference);
  char v6 = [WeakRetained isEqual:v4];

  return v6;
}

- (Class)class
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  unint64_t v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)description
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  unint64_t v3 = [WeakRetained description];

  return v3;
}

- (void).cxx_destruct
{
}

@end