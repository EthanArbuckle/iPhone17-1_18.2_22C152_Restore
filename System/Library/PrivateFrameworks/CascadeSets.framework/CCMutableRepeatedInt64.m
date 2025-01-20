@interface CCMutableRepeatedInt64
+ (id)new;
- (CCMutableRepeatedInt64)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendInt64Value:(int64_t)a3;
@end

@implementation CCMutableRepeatedInt64

- (CCMutableRepeatedInt64)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedInt64;
  return (CCMutableRepeatedInt64 *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedInt64;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendInt64Value:(int64_t)a3
{
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = (void *)[objc_alloc(NSNumber) initWithLongLong:a3];
  [v5 addObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[CCRepeatedInt64 allocWithZone:](CCRepeatedInt64, "allocWithZone:");
  v6 = [(CCRepeatedFieldValue *)self values];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(CCRepeatedFieldValue *)v5 initWithMutableArray:v7];

  return v8;
}

@end