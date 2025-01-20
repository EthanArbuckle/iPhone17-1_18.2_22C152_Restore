@interface CCMutableRepeatedUInt64
+ (id)new;
- (CCMutableRepeatedUInt64)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendUInt64Value:(unint64_t)a3;
@end

@implementation CCMutableRepeatedUInt64

- (CCMutableRepeatedUInt64)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedUInt64;
  return (CCMutableRepeatedUInt64 *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedUInt64;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendUInt64Value:(unint64_t)a3
{
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:a3];
  [v5 addObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[CCRepeatedUInt64 allocWithZone:](CCRepeatedUInt64, "allocWithZone:");
  v6 = [(CCRepeatedFieldValue *)self values];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(CCRepeatedFieldValue *)v5 initWithMutableArray:v7];

  return v8;
}

@end