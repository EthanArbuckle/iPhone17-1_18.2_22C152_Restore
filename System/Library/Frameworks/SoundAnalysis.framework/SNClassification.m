@interface SNClassification
+ (BOOL)supportsSecureCoding;
+ (SNClassification)new;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (SNClassification)init;
- (SNClassification)initWithCoder:(id)a3;
- (SNClassification)initWithIdentifier:(id)a3 confidence:(double)a4;
- (SNClassification)initWithImpl:(id)a3;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)impl;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SNClassification

- (NSString)identifier
{
  return (NSString *)MEMORY[0x1F4181798](self->_impl, sel_identifier);
}

- (double)confidence
{
  MEMORY[0x1F4181798](self->_impl, sel_confidence);
  return result;
}

- (SNClassification)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init is not a valid initializer for the class SNClassification" userInfo:0];
  objc_exception_throw(v2);
}

+ (SNClassification)new
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"+new is not a valid class method for the class SNClassification" userInfo:0];
  objc_exception_throw(v2);
}

- (SNClassification)initWithIdentifier:(id)a3 confidence:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SNClassification;
  v7 = [(SNClassification *)&v11 init];
  if (v7)
  {
    v8 = [[_SNClassification alloc] initWithIdentifier:v6 confidence:a4];
    impl = v7->_impl;
    v7->_impl = v8;

    if (!v7->_impl)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (SNClassification)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNClassification;
  id v6 = [(SNClassification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(_SNClassification *)self->_impl copyWithZone:a3];
  v7 = (void *)[v5 initWithImpl:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SNClassification *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(_SNClassification *)self->_impl isEqual:v5->_impl];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return MEMORY[0x1F4181798](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNClassification)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SNClassification;
  id v5 = [(SNClassification *)&v10 init];
  BOOL v6 = v5;
  if (!v4
    || v5
    && (v7 = [[_SNClassification alloc] initWithCoder:v4],
        impl = v6->_impl,
        v6->_impl = v7,
        impl,
        !v6->_impl))
  {

    BOOL v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_impl, sel_encodeWithCoder_);
  }
}

- (id)description
{
  return (id)MEMORY[0x1F4181798](self->_impl, sel_description);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
}

@end