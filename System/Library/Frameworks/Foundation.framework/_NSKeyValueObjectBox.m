@interface _NSKeyValueObjectBox
- (BOOL)isEqual:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation _NSKeyValueObjectBox

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_object, 0);
  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueObjectBox;
  [(_NSKeyValueObjectBox *)&v3 dealloc];
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
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return self->_objectPointer == *((void *)a3 + 2);
}

- (id)description
{
  unint64_t objectPointer = self->_objectPointer;
  Class objectClass = self->_objectClass;
  id v4 = objc_loadWeak(&self->_object);
  v5 = @"live";
  if (!v4) {
    v5 = @"deallocated";
  }
  return +[NSString stringWithFormat:@"<Object: 0x%llx (%@ — %@)>", objectPointer, objectClass, v5];
}

@end