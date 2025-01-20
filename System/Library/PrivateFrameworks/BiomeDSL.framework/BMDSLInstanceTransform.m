@interface BMDSLInstanceTransform
+ (BOOL)supportsSecureCoding;
+ (id)withSelector:(SEL)a3;
- (BMDSLInstanceTransform)initWithCoder:(id)a3;
- (BMDSLInstanceTransform)initWithName:(id)a3 version:(unsigned int)a4 transformName:(id)a5;
- (BMDSLInstanceTransform)initWithSelector:(SEL)a3;
- (NSString)transformName;
- (id)transformInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setTransformName:(id)a3;
@end

@implementation BMDSLInstanceTransform

- (BMDSLInstanceTransform)initWithName:(id)a3 version:(unsigned int)a4 transformName:(id)a5
{
  id v8 = a5;
  if (a4 != 1)
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMDSLInstanceTransform initWithName:version:transformName:](a4, v14);
    }

    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)BMDSLInstanceTransform;
  self = [(BMDSLBaseCodable *)&v17 initWithName:a3 version:1];
  if (self)
  {
    v9 = (NSString *)[v8 copy];
    transformName = self->_transformName;
    self->_transformName = v9;

    v11 = +[BMDSLTransforms allowedTransforms];
    char v12 = [v11 containsObject:v8];

    if ((v12 & 1) == 0)
    {
      v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BMDSLInstanceTransform initWithName:version:transformName:]((uint64_t)v8, v15);
      }

LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
  }
  self = self;
  v13 = self;
LABEL_12:

  return v13;
}

- (BMDSLInstanceTransform)initWithSelector:(SEL)a3
{
  v4 = NSStringFromSelector(a3);
  v5 = [(BMDSLInstanceTransform *)self initWithName:@"transformName" version:1 transformName:v4];

  return v5;
}

+ (id)withSelector:(SEL)a3
{
  v3 = [[BMDSLInstanceTransform alloc] initWithSelector:a3];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMDSLInstanceTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v6 encodeWithCoder:v4];
  v5 = [(BMDSLInstanceTransform *)self transformName];
  [v4 encodeObject:v5 forKey:@"transformName"];
}

- (BMDSLInstanceTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLInstanceTransform;
  v5 = [(BMDSLBaseCodable *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = v5;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transformName"];
    id v8 = +[BMDSLTransforms allowedTransforms];
    char v9 = [v8 containsObject:v7];

    if (v9)
    {
      v10 = [(BMDSLBaseCodable *)v6 name];
      objc_super v6 = [(BMDSLInstanceTransform *)v6 initWithName:v10 version:[(BMDSLBaseCodable *)v6 version] transformName:v7];
      v11 = v6;
    }
    else
    {
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BMDSLInstanceTransform initWithCoder:]((uint64_t)v7, v10);
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMDSLInstanceTransform.m", 79, @"Invalid parameter not satisfying: %@", @"[input isKindOfClass:[NSArray class]]" object file lineNumber description];
  }
  if (![(BMDSLBaseCodable *)self allowsEvaluation])
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3B8];
    v22 = @"This operation has evaluation disabled.";
    goto LABEL_10;
  }
  char v9 = +[BMDSLTransforms allowedTransforms];
  v10 = [(BMDSLInstanceTransform *)self transformName];
  char v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3B8];
    v22 = @"Transform name not in allow list";
LABEL_10:
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
  char v12 = [(BMDSLInstanceTransform *)self transformName];
  SEL v13 = NSSelectorFromString(v12);

  id v14 = v7;
  v15 = [v14 firstObject];
  v16 = objc_msgSend(v14, "subarrayWithRange:", objc_msgSend(v14, "count") != 0, objc_msgSend(v14, "count") - 1);

  objc_super v17 = +[BMDSLTransformInvocation invokeTransformWithInput:v16 selector:v13 target:v15];

  return v17;
}

- (NSString)transformName
{
  return self->_transformName;
}

- (void)setTransformName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithName:(uint64_t)a1 version:(NSObject *)a2 transformName:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B3086000, a2, OS_LOG_TYPE_FAULT, "Transform name not in allow list for instance transform (%@)", (uint8_t *)&v2, 0xCu);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 transformName:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLInstanceTransform", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B3086000, a2, OS_LOG_TYPE_FAULT, "Decoded transform name not in allow list for instance transform (%@)", (uint8_t *)&v2, 0xCu);
}

@end