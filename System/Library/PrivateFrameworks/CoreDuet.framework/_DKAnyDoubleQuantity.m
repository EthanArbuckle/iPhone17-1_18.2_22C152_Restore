@interface _DKAnyDoubleQuantity
+ (id)type;
+ (id)withValue:(double)a3;
@end

@implementation _DKAnyDoubleQuantity

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:a1];
}

+ (id)withValue:(double)a3
{
  v4 = [a1 type];
  v5 = +[_DKQuantity quantityWithDouble:v4 type:a3];

  return v5;
}

@end