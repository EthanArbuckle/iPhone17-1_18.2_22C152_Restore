@interface VSOptional
+ (BOOL)supportsSecureCoding;
+ (VSOptional)optionalWithObject:(id)a3;
+ (id)decodableClasses;
- (BOOL)isEqual:(id)a3;
- (VSOptional)init;
- (VSOptional)initWithCoder:(id)a3;
- (VSOptional)initWithObject:(id)a3;
- (id)description;
- (id)forceUnwrapObject;
- (id)object;
- (id)unwrapWithFallback:(id)a3;
- (unint64_t)hash;
- (void)conditionallyUnwrapObject:(id)a3;
- (void)conditionallyUnwrapObject:(id)a3 otherwise:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)forceUnwrapObject;
- (void)setObject:(id)a3;
@end

@implementation VSOptional

+ (id)decodableClasses
{
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (id)objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

+ (VSOptional)optionalWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return (VSOptional *)v5;
}

- (VSOptional)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSOptional;
  uint64_t v6 = [(VSOptional *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (VSOptional)init
{
  return [(VSOptional *)self initWithObject:0];
}

- (void)conditionallyUnwrapObject:(id)a3
{
}

- (void)conditionallyUnwrapObject:(id)a3 otherwise:(id)a4
{
  uint64_t v8 = (void (**)(id, void *))a3;
  uint64_t v6 = (void (**)(void))a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The conditionalBlock parameter must not be nil."];
  }
  uint64_t v7 = [(VSOptional *)self object];
  if (v7)
  {
    v8[2](v8, v7);
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (id)forceUnwrapObject
{
  uint64_t v3 = [(VSOptional *)self object];
  if (v3)
  {
    return v3;
  }
  else
  {
    id v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(VSOptional *)(uint64_t)self forceUnwrapObject];
    }

    __break(1u);
  }
  return result;
}

- (id)unwrapWithFallback:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The fallback parameter must not be nil."];
  }
  id v5 = [(VSOptional *)self object];
  if (!v5)
  {
    id v6 = v4;
    if (v4)
    {
      id v5 = v6;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The objectOrNil parameter must not be nil."];
      id v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  id v5 = [(VSOptional *)self object];
  [v4 encodeObject:v5 forKey:@"VSOptionalObject"];
}

- (VSOptional)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  id v5 = [(id)objc_opt_class() decodableClasses];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"VSOptionalObject"];

  uint64_t v7 = [(VSOptional *)self initWithObject:v6];
  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = [(VSOptional *)self object];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [(VSOptional *)self object];
    uint64_t v7 = [v5 object];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
      if (v8 && v9) {
        char v11 = [v8 isEqual:v9];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VSOptional;
  id v4 = [(VSOptional *)&v8 description];
  id v5 = [(VSOptional *)self object];
  id v6 = [v3 stringWithFormat:@"<%@ object=%@>", v4, v5];

  return v6;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)forceUnwrapObject
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Failed to force unwrap optional %p.", (uint8_t *)&v2, 0xCu);
}

@end