@interface _HKXPCExportedObjectProxy
- (Class)weakExportedObjectClass;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)weakExportedObject;
- (void)forwardInvocation:(id)a3;
- (void)setWeakExportedObject:(id)a3;
- (void)setWeakExportedObjectClass:(Class)a3;
@end

@implementation _HKXPCExportedObjectProxy

- (void)setWeakExportedObject:(id)a3
{
  p_weakExportedObject = &self->_weakExportedObject;
  id v5 = a3;
  objc_storeWeak(p_weakExportedObject, v5);
  uint64_t v6 = objc_opt_class();

  [(_HKXPCExportedObjectProxy *)self setWeakExportedObjectClass:v6];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5 = [(_HKXPCExportedObjectProxy *)self weakExportedObject];
  uint64_t v6 = [v5 methodSignatureForSelector:a3];

  if (!v6)
  {
    uint64_t v6 = [(objc_class *)[(_HKXPCExportedObjectProxy *)self weakExportedObjectClass] instanceMethodSignatureForSelector:a3];
  }

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  v4 = [(_HKXPCExportedObjectProxy *)self weakExportedObject];
  if (v4) {
    [v5 invokeWithTarget:v4];
  }
}

- (id)weakExportedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakExportedObject);

  return WeakRetained;
}

- (Class)weakExportedObjectClass
{
  return self->_weakExportedObjectClass;
}

- (void)setWeakExportedObjectClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakExportedObjectClass, 0);

  objc_destroyWeak(&self->_weakExportedObject);
}

@end