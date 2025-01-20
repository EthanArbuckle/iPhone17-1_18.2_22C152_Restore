@interface _INCodableAttributeCustomObjectAttributeRelationshipValueTransformer
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation _INCodableAttributeCustomObjectAttributeRelationshipValueTransformer

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
  v6 = [v5 identifier];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    id v9 = v3;
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    v12 = &stru_1EDA6DB28;
    if (v11) {
      v12 = v11;
    }
    v8 = v12;
  }

  return v8;
}

@end