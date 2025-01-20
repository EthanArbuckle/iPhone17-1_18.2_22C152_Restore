@interface JavaNioByteOrder
+ (BOOL)isLittleEndian;
+ (const)__metadata;
+ (id)nativeOrder;
+ (void)initialize;
- (JavaNioByteOrder)initWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (id)description;
- (void)dealloc;
@end

@implementation JavaNioByteOrder

+ (BOOL)isLittleEndian
{
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 1;
}

- (JavaNioByteOrder)initWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  self->needsSwap_ = a4;
  return self;
}

+ (id)nativeOrder
{
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560B28;
}

- (id)description
{
  return self->name_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioByteOrder;
  [(JavaNioByteOrder *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v2 = [JavaNioByteOrder alloc];
    JreStrongAssign((id *)&v2->name_, @"BIG_ENDIAN");
    v2->needsSwap_ = 1;
    JreStrongAssignAndConsume((id *)&JavaNioByteOrder_BIG_ENDIAN__, v2);
    objc_super v3 = [JavaNioByteOrder alloc];
    JreStrongAssign((id *)&v3->name_, @"LITTLE_ENDIAN");
    v3->needsSwap_ = 0;
    JreStrongAssignAndConsume((id *)&JavaNioByteOrder_LITTLE_ENDIAN__, v3);
    JreStrongAssign((id *)&qword_100560B28, (void *)JavaNioByteOrder_LITTLE_ENDIAN__);
    atomic_store(1u, (unsigned __int8 *)JavaNioByteOrder__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041D0A0;
}

@end