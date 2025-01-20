@interface _NSKeyValueObjectAndKeyPair
- (BOOL)isEqual:(id)a3;
- (BOOL)objectWasDeallocated;
- (_Unwind_Exception)newCurrentValue;
- (id)description;
- (id)initWithObject:(void *)a3 key:(uint64_t)a4 context:;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _NSKeyValueObjectAndKeyPair

- (id)initWithObject:(void *)a3 key:(uint64_t)a4 context:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)_NSKeyValueObjectAndKeyPair;
  id v7 = objc_msgSendSuper2(&v10, sel_init);
  if (v7)
  {
    if (objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(a2, sel_allowsWeakReference))
    {
      *((void *)v7 + 2) = a2;
      *((void *)v7 + 3) = object_getClass(a2);
      objc_storeWeak((id *)v7 + 1, a2);
      uint64_t v8 = [a3 copy];
      *((void *)v7 + 4) = a4;
      *((void *)v7 + 5) = v8;
      return v7;
    }

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_object, 0);

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueObjectAndKeyPair;
  [(_NSKeyValueObjectAndKeyPair *)&v3 dealloc];
}

- (BOOL)objectWasDeallocated
{
  BOOL v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x185308110]();
    BOOL v1 = objc_loadWeak((id *)(v1 + 8)) == 0;
  }
  return v1;
}

- (_Unwind_Exception)newCurrentValue
{
  BOOL v1 = exception_object;
  if (exception_object)
  {
    v2 = (void *)MEMORY[0x185308110]();
    id v3 = objc_loadWeak((id *)&v1->exception_cleanup);
    if (v3)
    {
      BOOL v1 = (_Unwind_Exception *)[v3 valueForKey:v1[1].exception_cleanup];
      if (!v1) {
        BOOL v1 = (_Unwind_Exception *)[MEMORY[0x1E4F1CA98] null];
      }
    }
    else
    {
      BOOL v1 = 0;
    }
    uint64_t v4 = v1;
  }
  return v1;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (-[_NSKeyValueObjectAndKeyPair objectWasDeallocated]((BOOL)self)) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_objectPointer != *((void *)a3 + 2)) {
    return 0;
  }
  key = self->_key;
  uint64_t v6 = *((void *)a3 + 5);

  return [(NSString *)key isEqualToString:v6];
}

- (unint64_t)hash
{
  unint64_t objectPointer = self->_objectPointer;
  return [(NSString *)self->_key hash] ^ objectPointer;
}

- (id)description
{
  unint64_t objectPointer = self->_objectPointer;
  Class objectClass = self->_objectClass;
  BOOL v5 = -[_NSKeyValueObjectAndKeyPair objectWasDeallocated]((BOOL)self);
  uint64_t v6 = @"live";
  if (v5) {
    uint64_t v6 = @"deallocated";
  }
  return +[NSString stringWithFormat:@"<Key: 0x%llx (%@ -- %@).%@ (context: %p)>", objectPointer, objectClass, v6, self->_key, self->_context];
}

@end