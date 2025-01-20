@interface CCMutableRepeatedInt32
+ (id)new;
- (CCMutableRepeatedInt32)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendInt32Value:(int)a3;
@end

@implementation CCMutableRepeatedInt32

- (CCMutableRepeatedInt32)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedInt32;
  return (CCMutableRepeatedInt32 *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedInt32;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendInt32Value:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = (void *)[objc_alloc(NSNumber) initWithInt:v3];
  [v5 addObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[CCRepeatedInt32 allocWithZone:](CCRepeatedInt32, "allocWithZone:");
  v6 = [(CCRepeatedFieldValue *)self values];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(CCRepeatedFieldValue *)v5 initWithMutableArray:v7];

  return v8;
}

@end