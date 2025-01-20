@interface CCMutableRepeatedBool
+ (id)new;
- (CCMutableRepeatedBool)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendBoolValue:(BOOL)a3;
@end

@implementation CCMutableRepeatedBool

- (CCMutableRepeatedBool)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedBool;
  return (CCMutableRepeatedBool *)[(CCRepeatedFieldValue *)&v3 _init];
}

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedBool;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CCRepeatedFieldValue *)self values];
  v4 = (void *)[objc_alloc(NSNumber) initWithBool:v3];
  [v5 addObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[CCRepeatedBool allocWithZone:](CCRepeatedBool, "allocWithZone:");
  v6 = [(CCRepeatedFieldValue *)self values];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(CCRepeatedFieldValue *)v5 initWithMutableArray:v7];

  return v8;
}

@end