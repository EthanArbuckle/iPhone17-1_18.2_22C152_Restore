@interface BMDSLArgumentTransform
+ (BOOL)supportsSecureCoding;
+ (id)withSelector:(id)a3;
- (BMDSLArgumentSelector)selector;
- (BMDSLArgumentTransform)initWithCoder:(id)a3;
- (BMDSLArgumentTransform)initWithSelector:(id)a3;
- (BMDSLArgumentTransform)initWithSelector:(id)a3 name:(id)a4 version:(unsigned int)a5;
- (id)transformInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLArgumentTransform

- (BMDSLArgumentTransform)initWithSelector:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLArgumentTransform;
  v10 = [(BMDSLBaseCodable *)&v13 initWithName:a4 version:v5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_selector, a3);
  }

  return v11;
}

- (BMDSLArgumentTransform)initWithSelector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[BMDSLArgumentTransform alloc] initWithSelector:v4 name:@"argument" version:1];

  return v5;
}

+ (id)withSelector:(id)a3
{
  id v3 = a3;
  id v4 = [[BMDSLArgumentTransform alloc] initWithSelector:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMDSLArgumentTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(BMDSLArgumentTransform *)self selector];
  [v4 encodeObject:v5 forKey:@"selector"];
}

- (BMDSLArgumentTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLArgumentTransform;
  uint64_t v5 = [(BMDSLBaseCodable *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = +[BMDSLClasses allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"selector"];

    v8 = [(BMDSLBaseCodable *)v5 name];
    uint64_t v5 = [(BMDSLArgumentTransform *)v5 initWithSelector:v7 name:v8 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(BMDSLArgumentTransform *)self selector];
  objc_super v10 = [v9 argumentsFromInput:v8 combinedState:v7];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"BMDSLArgumentTransform.m" lineNumber:63 description:@"Expect array type"];
  }
  return v10;
}

- (BMDSLArgumentSelector)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
}

@end