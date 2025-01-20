@interface NSWeakObjectValue
- (BOOL)isEqualToValue:(id)a3;
- (NSWeakObjectValue)initWithObject:(id)a3;
- (const)objCType;
- (id)nonretainedObjectValue;
- (id)weakObjectValue;
- (unint64_t)hash;
- (void)dealloc;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSWeakObjectValue

- (id)weakObjectValue
{
  return (id)_NSObjectLoadWeak();
}

- (NSWeakObjectValue)initWithObject:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSWeakObjectValue;
  v4 = [(NSValue *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    _NSObjectStoreWeak();
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _NSObjectStoreWeak();
  v3.receiver = self;
  v3.super_class = (Class)NSWeakObjectValue;
  [(NSWeakObjectValue *)&v3 dealloc];
}

- (BOOL)isEqualToValue:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  value = self->_value;
  return value == (void *)[a3 nonretainedObjectValue];
}

- (unint64_t)hash
{
  return (unint64_t)self->_value;
}

- (const)objCType
{
  return "@";
}

- (id)nonretainedObjectValue
{
  return self->_value;
}

- (void)getValue:(void *)a3
{
  *(void *)a3 = _NSObjectLoadWeak();
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (a4 != 8)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes", a4, [(NSWeakObjectValue *)self objCType], 8];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v4 userInfo:0]);
  }
  *(void *)a3 = _NSObjectLoadWeak();
}

@end