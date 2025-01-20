@interface MFWeakReferenceHolder
+ (id)weakReferenceWithObject:(id)a3;
- (id)_initWithObject:(id)a3;
- (id)reference;
- (id)retainedReference;
- (void)dealloc;
@end

@implementation MFWeakReferenceHolder

- (id)reference
{
  return objc_loadWeak((id *)&self->_reference);
}

- (id)retainedReference
{
  return objc_loadWeakRetained((id *)&self->_reference);
}

+ (id)weakReferenceWithObject:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&weakReferenceWithObject__lock);
  id v4 = objc_getAssociatedObject(a3, (const void *)sWeakReferenceKey);
  if (!v4) {
    id v4 = [[MFWeakReferenceHolder alloc] _initWithObject:a3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&weakReferenceWithObject__lock);
  return v4;
}

- (id)_initWithObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFWeakReferenceHolder;
  v5 = [(MFWeakReferenceHolder *)&v8 init];
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      if (!objc_storeWeak((id *)&v5->_reference, a3)) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"WeakReferences.m", 51, @"object reference %p is not compatible with objc weak references", a3);
      }
      objc_setAssociatedObject(a3, (const void *)sWeakReferenceKey, v6, (void *)1);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_reference, 0);
  v3.receiver = self;
  v3.super_class = (Class)MFWeakReferenceHolder;
  [(MFWeakReferenceHolder *)&v3 dealloc];
}

@end