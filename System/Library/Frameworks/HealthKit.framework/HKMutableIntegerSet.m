@interface HKMutableIntegerSet
+ (BOOL)supportsSecureCoding;
- (HKMutableIntegerSet)initWithCapacity:(unint64_t)a3;
- (void)addInteger:(int64_t)a3;
- (void)enumerateIntegersUsingBlock:(id)a3;
- (void)removeInteger:(int64_t)a3;
@end

@implementation HKMutableIntegerSet

- (HKMutableIntegerSet)initWithCapacity:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMutableIntegerSet;
  return [(HKIntegerSet *)&v4 initWithCapacity:a3];
}

- (void)enumerateIntegersUsingBlock:(id)a3
{
  self->_enumerating = 1;
  v4.receiver = self;
  v4.super_class = (Class)HKMutableIntegerSet;
  [(HKIntegerSet *)&v4 enumerateIntegersUsingBlock:a3];
  self->_enumerating = 0;
}

- (void)addInteger:(int64_t)a3
{
  if (!self->super._set)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a2);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 268, @"_set is nil", v8);
  }
  if (self->_enumerating)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"HKMutableIntegerSetMutationWhileEnumeratingExceptionName" reason:@"you shouldn't mutate a set while enumerating it" userInfo:0];
    objc_exception_throw(v9);
  }
  set = self->super._set;

  CFSetAddValue(set, (const void *)a3);
}

- (void)removeInteger:(int64_t)a3
{
  if (!self->super._set)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a2);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKIntegerSet.m", 278, @"_set is nil", v8);
  }
  if (self->_enumerating)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"HKMutableIntegerSetMutationWhileEnumeratingExceptionName" reason:@"you shouldn't mutate a set while enumerating it" userInfo:0];
    objc_exception_throw(v9);
  }
  set = self->super._set;

  CFSetRemoveValue(set, (const void *)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end