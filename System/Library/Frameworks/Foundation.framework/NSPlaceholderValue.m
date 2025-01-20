@interface NSPlaceholderValue
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPlaceholderValue)init;
- (NSPlaceholderValue)initWithBytes:(const void *)a3 objCType:(const char *)a4;
- (NSPlaceholderValue)initWithCoder:(id)a3;
- (const)objCType;
- (unint64_t)retainCount;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSPlaceholderValue

- (NSPlaceholderValue)initWithCoder:(id)a3
{
  return (NSPlaceholderValue *)newDecodedValue(a3, self->zoneForInstance);
}

- (NSPlaceholderValue)initWithBytes:(const void *)a3 objCType:(const char *)a4
{
  return (NSPlaceholderValue *)_NSNewValue((float64x2_t *)a3, (char *)a4, self->zoneForInstance);
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (NSPlaceholderValue)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)objCType
{
  NSLog((NSString *)@"Did you forget to nest alloc and init?");
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = self;
  v6 = __SCR_NSValue;
  if (v4 == v5) {
    v6 = __SCR_NSNumber;
  }
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v6);
}

- (void)getValue:(void *)a3
{
  NSLog((NSString *)@"Did you forget to nest alloc and init?", a2, a3);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = self;
  v7 = __SCR_NSValue;
  if (v5 == v6) {
    v7 = __SCR_NSNumber;
  }
  v8 = (objc_class *)*v7;

  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  NSLog((NSString *)@"Did you forget to nest alloc and init?", a2, a3, a4);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = self;
  v8 = __SCR_NSValue;
  if (v6 == v7) {
    v8 = __SCR_NSNumber;
  }
  v9 = (objc_class *)*v8;

  NSRequestConcreteImplementation((uint64_t)self, a2, v9);
}

@end