@interface AVRetainReleaseWeakReference
- (AVRetainReleaseWeakReference)init;
- (AVRetainReleaseWeakReference)initWithReferencedObject:(id)a3;
- (id)description;
- (id)referencedObject;
- (void)dealloc;
@end

@implementation AVRetainReleaseWeakReference

- (id)referencedObject
{
  return objc_loadWeak(&self->_weakStorage);
}

- (void)dealloc
{
  objc_storeWeak(&self->_weakStorage, 0);
  v3.receiver = self;
  v3.super_class = (Class)AVRetainReleaseWeakReference;
  [(AVRetainReleaseWeakReference *)&v3 dealloc];
}

- (AVRetainReleaseWeakReference)initWithReferencedObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVRetainReleaseWeakReference;
  v4 = [(AVRetainReleaseWeakReference *)&v8 init];
  if (v4)
  {
    id v5 = [NSString alloc];
    v6 = (objc_class *)objc_opt_class();
    v4->_cachedReferencedObjectDescription = (NSString *)[v5 initWithFormat:@"<%@: %p>", NSStringFromClass(v6), a3];
    objc_storeWeak(&v4->_weakStorage, a3);
  }
  return v4;
}

- (AVRetainReleaseWeakReference)init
{
  return [(AVRetainReleaseWeakReference *)self initWithReferencedObject:0];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, referencedObject = %@>", NSStringFromClass(v4), self, self->_cachedReferencedObjectDescription];
}

@end