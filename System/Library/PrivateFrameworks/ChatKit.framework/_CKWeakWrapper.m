@interface _CKWeakWrapper
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)class;
- (Class)targetClass;
- (IMWeakReference)weakReference;
- (_CKWeakWrapper)initWithObject:(id)a3;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)forwardInvocation:(id)a3;
- (void)setTargetClass:(Class)a3;
- (void)setWeakReference:(id)a3;
@end

@implementation _CKWeakWrapper

- (_CKWeakWrapper)initWithObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F6C428] weakRefWithObject:v4];
    weakReference = self->_weakReference;
    self->_weakReference = v5;

    objc_opt_class();
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    targetClass = self->_targetClass;
    self->_targetClass = v7;
  }
  else
  {
    targetClass = self;
    self = 0;
  }

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v3 = [(_CKWeakWrapper *)self weakReference];
  id v4 = [v3 object];

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 methodSignature];
  size_t v5 = [v4 methodReturnLength];
  if (v5)
  {
    size_t v6 = v5;
    v7 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v7, v5);
    bzero(v7, v6);
    [v3 setReturnValue:v7];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v3 = [(_CKWeakWrapper *)self weakReference];
  id v4 = [v3 object];

  if (v4) {
    char v5 = objc_opt_respondsToSelector();
  }
  else {
    char v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  char v5 = [(_CKWeakWrapper *)self weakReference];
  size_t v6 = [v5 object];

  if (v6) {
    char v7 = [v6 conformsToProtocol:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(_CKWeakWrapper *)self targetClass];

  return (id)[(objc_class *)v4 instanceMethodSignatureForSelector:a3];
}

- (unint64_t)hash
{
  v2 = [(_CKWeakWrapper *)self weakReference];
  id v3 = [v2 object];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [(_CKWeakWrapper *)self weakReference];
  size_t v6 = [v5 object];
  char v7 = [v6 isEqual:v4];

  return v7;
}

- (Class)class
{
  v2 = [(_CKWeakWrapper *)self weakReference];
  id v3 = [v2 object];
  id v4 = objc_opt_class();

  return (Class)v4;
}

- (BOOL)isKindOfClass:(Class)a3
{
  id v3 = [(_CKWeakWrapper *)self weakReference];
  id v4 = [v3 object];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)description
{
  v2 = [(_CKWeakWrapper *)self weakReference];
  id v3 = [v2 object];
  id v4 = [v3 description];

  return v4;
}

- (IMWeakReference)weakReference
{
  return self->_weakReference;
}

- (void)setWeakReference:(id)a3
{
}

- (Class)targetClass
{
  return self->_targetClass;
}

- (void)setTargetClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetClass, 0);

  objc_storeStrong((id *)&self->_weakReference, 0);
}

@end