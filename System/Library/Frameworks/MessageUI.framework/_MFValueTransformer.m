@interface _MFValueTransformer
+ (id)valueTransformer;
- (id)transformValue:(id)a3 inverse:(BOOL)a4;
@end

@implementation _MFValueTransformer

+ (id)valueTransformer
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (id)transformValue:(id)a3 inverse:(BOOL)a4
{
  id v4 = a3;

  return v4;
}

@end