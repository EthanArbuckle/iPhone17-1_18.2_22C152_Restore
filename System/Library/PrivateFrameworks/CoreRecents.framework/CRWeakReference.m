@interface CRWeakReference
+ (id)weakReferenceWithObject:(id)a3;
- (CRWeakReference)initWithObject:(id)a3;
- (id)object;
- (void)dealloc;
@end

@implementation CRWeakReference

+ (id)weakReferenceWithObject:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithObject:a3];
  return v3;
}

- (CRWeakReference)initWithObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRWeakReference;
  v4 = [(CRWeakReference *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak(&v4->_weakRef, a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_storeWeak(&self->_weakRef, 0);
  v3.receiver = self;
  v3.super_class = (Class)CRWeakReference;
  [(CRWeakReference *)&v3 dealloc];
}

- (id)object
{
  return objc_loadWeak(&self->_weakRef);
}

@end