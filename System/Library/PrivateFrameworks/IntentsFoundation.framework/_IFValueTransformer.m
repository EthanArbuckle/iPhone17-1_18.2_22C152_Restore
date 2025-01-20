@interface _IFValueTransformer
+ (BOOL)allowsReverseTransformation;
- (_IFValueTransformer)initWithForwardTransformation:(id)a3 reverseTransformation:(id)a4;
- (id)forwardTransformation;
- (id)reverseTransformation;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation _IFValueTransformer

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  v5 = [(_IFValueTransformer *)self forwardTransformation];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)forwardTransformation
{
  return self->_forwardTransformation;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  v5 = [(_IFValueTransformer *)self reverseTransformation];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)reverseTransformation
{
  return self->_reverseTransformation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseTransformation, 0);
  objc_storeStrong(&self->_forwardTransformation, 0);
}

- (_IFValueTransformer)initWithForwardTransformation:(id)a3 reverseTransformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_IFValueTransformer;
  v8 = [(_IFValueTransformer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id forwardTransformation = v8->_forwardTransformation;
    v8->_id forwardTransformation = (id)v9;

    uint64_t v11 = [v7 copy];
    id reverseTransformation = v8->_reverseTransformation;
    v8->_id reverseTransformation = (id)v11;
  }
  return v8;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end