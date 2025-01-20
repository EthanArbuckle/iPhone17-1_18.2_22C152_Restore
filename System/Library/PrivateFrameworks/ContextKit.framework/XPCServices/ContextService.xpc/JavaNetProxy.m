@interface JavaNetProxy
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaNetProxy)init;
- (JavaNetProxy)initWithJavaNetProxy_TypeEnum:(id)a3 withJavaNetSocketAddress:(id)a4;
- (id)address;
- (id)description;
- (id)type;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaNetProxy

- (JavaNetProxy)initWithJavaNetProxy_TypeEnum:(id)a3 withJavaNetSocketAddress:(id)a4
{
  return self;
}

- (JavaNetProxy)init
{
  return self;
}

- (id)type
{
  return self->type_;
}

- (id)address
{
  return self->address_;
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  type = self->type_;
  if (type) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:[(JavaLangEnum *)type description]];
  }
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"@"];
  v5 = self->type_;
  if ((atomic_load_explicit(JavaNetProxy_TypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v5 != (JavaNetProxy_TypeEnum *)JavaNetProxy_TypeEnum_values_)
  {
    address = self->address_;
    if (address) {
      [(JavaLangStringBuilder *)v3 appendWithNSString:[(JavaNetSocketAddress *)address description]];
    }
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_13;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->type_ != (JavaNetProxy_TypeEnum *)*((void *)a3 + 1)) {
    return 0;
  }
  address = self->address_;
  if (!address) {
LABEL_13:
  }
    JreThrowNullPointerException();
  uint64_t v7 = *((void *)a3 + 2);
  return [(JavaNetSocketAddress *)address isEqual:v7];
}

- (unint64_t)hash
{
  type = self->type_;
  if (!type) {
    JreThrowNullPointerException();
  }
  signed int v4 = [(JavaLangEnum *)type hash];
  address = self->address_;
  if (address) {
    v4 += [(JavaNetSocketAddress *)address hash];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetProxy;
  [(JavaNetProxy *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaNetProxy alloc];
    sub_1001B1C40((uint64_t)v2);
    JreStrongAssignAndConsume(&JavaNetProxy_NO_PROXY_, v2);
    atomic_store(1u, JavaNetProxy__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100419D98;
}

@end