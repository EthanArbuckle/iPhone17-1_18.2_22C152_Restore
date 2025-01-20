@interface SunMiscUnsafe
+ (const)__metadata;
+ (id)getUnsafe;
+ (int)getArrayBaseOffsetForComponentTypeWithIOSClass:(id)a3;
+ (int)getArrayIndexScaleForComponentTypeWithIOSClass:(id)a3;
+ (int64_t)objectFieldOffset0WithJavaLangReflectField:(id)a3;
+ (void)initialize;
- (BOOL)compareAndSwapIntWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5 withInt:(int)a6;
- (BOOL)compareAndSwapLongWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6;
- (BOOL)compareAndSwapObjectWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5 withId:(id)a6;
- (id)allocateInstanceWithIOSClass:(id)a3;
- (id)getObjectVolatileWithId:(id)a3 withLong:(int64_t)a4;
- (id)getObjectWithId:(id)a3 withLong:(int64_t)a4;
- (int)arrayBaseOffsetWithIOSClass:(id)a3;
- (int)arrayIndexScaleWithIOSClass:(id)a3;
- (int)getIntVolatileWithId:(id)a3 withLong:(int64_t)a4;
- (int)getIntWithId:(id)a3 withLong:(int64_t)a4;
- (int64_t)getLongVolatileWithId:(id)a3 withLong:(int64_t)a4;
- (int64_t)getLongWithId:(id)a3 withLong:(int64_t)a4;
- (int64_t)objectFieldOffsetWithJavaLangReflectField:(id)a3;
- (void)parkWithBoolean:(BOOL)a3 withLong:(int64_t)a4;
- (void)putIntVolatileWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)putIntWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)putLongVolatileWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (void)putLongWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (void)putObjectVolatileWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5;
- (void)putObjectWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5;
- (void)putOrderedIntWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)putOrderedLongWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (void)putOrderedObjectWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5;
- (void)unparkWithId:(id)a3;
@end

@implementation SunMiscUnsafe

+ (id)getUnsafe
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&SunMiscUnsafe__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100562F58;
}

- (int64_t)objectFieldOffsetWithJavaLangReflectField:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (JavaLangReflectModifier_isStaticWithInt_([a3 getModifiers]))
  {
    v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"valid for instance fields only");
    objc_exception_throw(v5);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&SunMiscUnsafe__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (int)[a3 unsafeOffset];
}

+ (int64_t)objectFieldOffset0WithJavaLangReflectField:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&SunMiscUnsafe__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (int)[a3 unsafeOffset];
}

- (int)arrayBaseOffsetWithIOSClass:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v3 = [a3 getComponentType];
  if (!v3)
  {
    CFStringRef v12 = JreStrcat("$@", v4, v5, v6, v7, v8, v9, v10, @"Valid for array classes only: ");
    v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  return sub_10029C5C0(v3);
}

+ (int)getArrayBaseOffsetForComponentTypeWithIOSClass:(id)a3
{
  return sub_10029C5C0(a3);
}

- (int)arrayIndexScaleWithIOSClass:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v3 = [a3 getComponentType];
  if (!v3)
  {
    CFStringRef v13 = JreStrcat("$@", v4, v5, v6, v7, v8, v9, v10, @"Valid for array classes only: ");
    v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  v11 = v3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&SunMiscUnsafe__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [v11 getSizeof];
}

+ (int)getArrayIndexScaleForComponentTypeWithIOSClass:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&SunMiscUnsafe__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [a3 getSizeof];
}

- (BOOL)compareAndSwapIntWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = (atomic_uint *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 3) != 0) {
    sub_10029C74C((uint64_t)v6);
  }
  int v7 = a5;
  atomic_compare_exchange_strong(v6, (unsigned int *)&v7, a6);
  return v7 == a5;
}

- (BOOL)compareAndSwapLongWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6
{
  uint64_t v6 = (atomic_ullong *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v6);
  }
  int64_t v7 = a5;
  atomic_compare_exchange_strong(v6, (unint64_t *)&v7, a6);
  return v7 == a5;
}

- (BOOL)compareAndSwapObjectWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5 withId:(id)a6
{
  uint64_t v6 = (atomic_ullong *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)a3 + a4);
  }
  id v9 = a6;
  id v10 = a5;
  atomic_compare_exchange_strong(v6, (unint64_t *)&v10, (unint64_t)a6);
  BOOL v11 = v10 == a5;
  if (v10 == a5) {
    id v12 = a5;
  }
  else {

  }
  return v11;
}

- (int)getIntVolatileWithId:(id)a3 withLong:(int64_t)a4
{
  uint64_t v4 = (unsigned int *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 3) != 0) {
    sub_10029C74C((uint64_t)v4);
  }
  return atomic_load(v4);
}

- (void)putIntVolatileWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  uint64_t v5 = (unsigned int *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 3) != 0) {
    sub_10029C74C((uint64_t)v5);
  }
  atomic_store(a5, v5);
}

- (int64_t)getLongVolatileWithId:(id)a3 withLong:(int64_t)a4
{
  uint64_t v4 = (unint64_t *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v4);
  }
  return atomic_load(v4);
}

- (void)putLongVolatileWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  uint64_t v5 = (unint64_t *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v5);
  }
  atomic_store(a5, v5);
}

- (id)getObjectVolatileWithId:(id)a3 withLong:(int64_t)a4
{
  uint64_t v4 = (unint64_t *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v4);
  }
  return (id)atomic_load(v4);
}

- (void)putObjectVolatileWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5
{
  uint64_t v5 = (atomic_ullong *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)a3 + a4);
  }
  id v7 = a5;
  uint64_t v8 = (void *)atomic_exchange(v5, (unint64_t)a5);
  id v9 = v8;
}

- (int)getIntWithId:(id)a3 withLong:(int64_t)a4
{
  uint64_t v4 = (int *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 3) != 0) {
    sub_10029C74C((uint64_t)v4);
  }
  return *v4;
}

- (void)putIntWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  uint64_t v5 = (int *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 3) != 0) {
    sub_10029C74C((uint64_t)v5);
  }
  int *v5 = a5;
}

- (void)putOrderedIntWithId:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  uint64_t v5 = (unsigned int *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 3) != 0) {
    sub_10029C74C((uint64_t)v5);
  }
  atomic_store(a5, v5);
}

- (int64_t)getLongWithId:(id)a3 withLong:(int64_t)a4
{
  uint64_t v4 = (int64_t *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v4);
  }
  return *v4;
}

- (void)putLongWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  uint64_t v5 = (int64_t *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v5);
  }
  int64_t *v5 = a5;
}

- (void)putOrderedLongWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  uint64_t v5 = (unint64_t *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v5);
  }
  atomic_store(a5, v5);
}

- (id)getObjectWithId:(id)a3 withLong:(int64_t)a4
{
  uint64_t v4 = (id *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)v4);
  }
  return *v4;
}

- (void)putObjectWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5
{
  uint64_t v5 = (unsigned int *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)a3 + a4);
  }
  id v6 = a5;
  __swp(v6, v5);
  id v7 = v6;
}

- (void)putOrderedObjectWithId:(id)a3 withLong:(int64_t)a4 withId:(id)a5
{
  uint64_t v5 = (atomic_ullong *)((char *)a3 + a4);
  if ((((unint64_t)a3 + a4) & 7) != 0) {
    sub_10029C74C((uint64_t)a3 + a4);
  }
  id v7 = a5;
  uint64_t v8 = (void *)atomic_exchange_explicit(v5, (unint64_t)a5, memory_order_release);
  id v9 = v8;
}

- (void)parkWithBoolean:(BOOL)a3 withLong:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = JavaLangThread_currentThread();
  if (v5)
  {
    if (v6)
    {
      [(JavaLangThread *)v6 parkUntilWithLong:a4];
      return;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  if (!v6) {
    goto LABEL_10;
  }
  [(JavaLangThread *)v6 parkForWithLong:a4];
}

- (void)unparkWithId:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v4 = new_JavaLangIllegalArgumentException_initWithNSString_(@"valid for Threads only");
    objc_exception_throw(v4);
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [a3 unpark];
}

- (id)allocateInstanceWithIOSClass:(id)a3
{
  id v3 = (objc_class *)[a3 objcClass];
  return [v3 alloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100562F58, [SunMiscUnsafe alloc]);
    JreStrongAssign(&qword_100562F60, (void *)qword_100562F58);
    atomic_store(1u, (unsigned __int8 *)&SunMiscUnsafe__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100489520;
}

@end