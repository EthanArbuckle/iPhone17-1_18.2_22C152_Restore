@interface HMDValueTransformerAdapater
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (Class)valueClass;
- (BOOL)isKindOfTransformer:(Class)a3;
- (HMDValueTransformerAdapater)initWithTransformer:(id)a3;
- (id)reverseTransformedValue:(id)a3;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDValueTransformerAdapater

- (void).cxx_destruct
{
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(HMDValueTransformerAdapater *)self reverseTransformedValue:v5];

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  return [(NSValueTransformer *)self->_transformer reverseTransformedValue:a3];
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(HMDValueTransformerAdapater *)self transformedValue:v5];

  return v6;
}

- (id)transformedValue:(id)a3
{
  return [(NSValueTransformer *)self->_transformer transformedValue:a3];
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDValueTransformerAdapater;
  if (-[HMDValueTransformer isKindOfTransformer:](&v5, sel_isKindOfTransformer_)) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (HMDValueTransformerAdapater)initWithTransformer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDValueTransformerAdapater;
  v6 = [(HMDValueTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transformer, a3);
  }

  return v7;
}

+ (BOOL)allowsReverseTransformation
{
}

+ (Class)transformedValueClass
{
}

+ (Class)valueClass
{
}

@end