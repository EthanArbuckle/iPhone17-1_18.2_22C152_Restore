@interface CCMutableRepeatedDouble
+ (id)new;
- (CCMutableRepeatedDouble)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendDoubleValue:(double)a3;
@end

@implementation CCMutableRepeatedDouble

- (CCMutableRepeatedDouble)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedDouble;
  return (CCMutableRepeatedDouble *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedDouble;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendDoubleValue:(double)a3
{
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = (void *)[objc_alloc(NSNumber) initWithDouble:a3];
  [v5 addObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[CCRepeatedDouble allocWithZone:](CCRepeatedDouble, "allocWithZone:");
  v6 = [(CCRepeatedFieldValue *)self values];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(CCRepeatedFieldValue *)v5 initWithMutableArray:v7];

  return v8;
}

@end