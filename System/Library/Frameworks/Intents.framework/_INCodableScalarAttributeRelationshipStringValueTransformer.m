@interface _INCodableScalarAttributeRelationshipStringValueTransformer
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation _INCodableScalarAttributeRelationshipStringValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = v5;
  if (!v5) {
    v5 = &stru_1EDA6DB28;
  }
  v7 = v5;

  return v7;
}

@end