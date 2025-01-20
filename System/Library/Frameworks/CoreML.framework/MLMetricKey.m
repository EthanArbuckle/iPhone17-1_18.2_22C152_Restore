@interface MLMetricKey
+ (MLMetricKey)epochIndex;
+ (MLMetricKey)lossValue;
+ (MLMetricKey)miniBatchIndex;
- (MLMetricKey)initWithKeyName:(id)a3;
@end

@implementation MLMetricKey

- (MLMetricKey)initWithKeyName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MLMetricKey;
  return [(MLKey *)&v4 initWithKeyName:a3];
}

+ (MLMetricKey)miniBatchIndex
{
  v2 = [[MLMetricKey alloc] initWithKeyName:@"miniBatchIndex"];

  return v2;
}

+ (MLMetricKey)epochIndex
{
  v2 = [[MLMetricKey alloc] initWithKeyName:@"epochIndex"];

  return v2;
}

+ (MLMetricKey)lossValue
{
  v2 = [[MLMetricKey alloc] initWithKeyName:@"lossValue"];

  return v2;
}

@end