@interface _INCodableObjectAttributeRelationshipNumberValueTransformer
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation _INCodableObjectAttributeRelationshipNumberValueTransformer

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
  id v5 = v4;
  v6 = v5;
  if (!v5) {
    id v5 = &unk_1EDBA7960;
  }
  id v7 = v5;

  return v7;
}

@end