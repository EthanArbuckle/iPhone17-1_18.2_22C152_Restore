@interface _PFWeakReference
+ (id)weakReferenceWithObject:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (_PFWeakReference)initWithObject:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _PFWeakReference

- (void)dealloc
{
  if (self->_objectAddress) {
    objc_storeWeakOrNil(&self->_object, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)_PFWeakReference;
  [(_PFWeakReference *)&v3 dealloc];
}

+ (id)weakReferenceWithObject:(uint64_t)a1
{
  objc_super v3 = (objc_class *)self;
  if (!a2) {
    return 0;
  }
  v4 = (void *)[[v3 alloc] initWithObject:a2];

  return v4;
}

- (_PFWeakReference)initWithObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PFWeakReference;
  v4 = [(_PFWeakReference *)&v7 init];
  v5 = v4;
  if (!a3) {
    goto LABEL_5;
  }
  if (v4)
  {
    if (objc_storeWeakOrNil(&v4->_object, a3))
    {
      v5->_objectAddress = (int64_t)a3;
      return v5;
    }
LABEL_5:

    return 0;
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && *((void *)a3 + 2) == self->_objectAddress;
}

@end