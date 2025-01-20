@interface CCMutableRepeatedUInt32
+ (id)new;
- (CCMutableRepeatedUInt32)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendUInt32Value:(unsigned int)a3;
@end

@implementation CCMutableRepeatedUInt32

- (CCMutableRepeatedUInt32)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedUInt32;
  return (CCMutableRepeatedUInt32 *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedUInt32;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendUInt32Value:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v3];
  [v5 addObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[CCRepeatedUInt32 allocWithZone:](CCRepeatedUInt32, "allocWithZone:");
  v6 = [(CCRepeatedFieldValue *)self values];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(CCRepeatedFieldValue *)v5 initWithMutableArray:v7];

  return v8;
}

@end