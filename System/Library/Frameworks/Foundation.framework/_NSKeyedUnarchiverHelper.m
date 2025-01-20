@interface _NSKeyedUnarchiverHelper
- (BOOL)classNameAllowed:(Class)a3;
- (NSError)decodeError;
- (_NSKeyedUnarchiverHelper)init;
- (id)allowedClassNames;
- (void)dealloc;
- (void)setAllowedClassNames:(id)a3;
- (void)setDecodeError:(id)a3;
@end

@implementation _NSKeyedUnarchiverHelper

- (BOOL)classNameAllowed:(Class)a3
{
  if (!self->_allowed) {
    return 1;
  }
  Superclass = a3;
  if (!a3) {
    return 0;
  }
  do
  {
    BOOL v5 = [(NSArray *)self->_allowed containsObject:NSStringFromClass(Superclass)];
    if (v5) {
      break;
    }
    Superclass = class_getSuperclass(Superclass);
  }
  while (Superclass);
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyedUnarchiverHelper;
  [(_NSKeyedUnarchiverHelper *)&v3 dealloc];
}

- (_NSKeyedUnarchiverHelper)init
{
  self->_allowedClasses = (NSMutableArray *)objc_opt_new();
  *(_WORD *)&self->expectsUnnestedCollection = 0;
  return self;
}

- (void)setDecodeError:(id)a3
{
}

- (id)allowedClassNames
{
  v2 = self->_allowed;

  return v2;
}

- (void)setAllowedClassNames:(id)a3
{
  allowed = self->_allowed;
  if (allowed != a3)
  {

    self->_allowed = (NSArray *)[a3 copy];
  }
}

- (NSError)decodeError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

@end