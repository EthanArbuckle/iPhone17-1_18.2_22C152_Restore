@interface BMDSLClassTransform
+ (BOOL)supportsSecureCoding;
+ (id)withClassName:(id)a3 selector:(SEL)a4;
+ (id)withClassName:(id)a3 transformName:(id)a4;
- (BMDSLClassTransform)initWithClassName:(id)a3 selector:(SEL)a4;
- (BMDSLClassTransform)initWithClassName:(id)a3 transformName:(id)a4;
- (BMDSLClassTransform)initWithCoder:(id)a3;
- (BMDSLClassTransform)initWithName:(id)a3 version:(unsigned int)a4 className:(id)a5 transformName:(id)a6;
- (NSString)className;
- (NSString)transformName;
- (id)transformInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setClassName:(id)a3;
- (void)setTransformName:(id)a3;
@end

@implementation BMDSLClassTransform

- (BMDSLClassTransform)initWithName:(id)a3 version:(unsigned int)a4 className:(id)a5 transformName:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a4 == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)BMDSLClassTransform;
    v12 = [(BMDSLBaseCodable *)&v20 initWithName:a3 version:1];
    if (v12)
    {
      uint64_t v13 = [v10 copy];
      className = v12->_className;
      v12->_className = (NSString *)v13;

      uint64_t v15 = [v11 copy];
      transformName = v12->_transformName;
      v12->_transformName = (NSString *)v15;
    }
    self = v12;
    v17 = self;
  }
  else
  {
    v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMDSLClassTransform initWithName:version:className:transformName:](a4, v18);
    }

    v17 = 0;
  }

  return v17;
}

- (BMDSLClassTransform)initWithClassName:(id)a3 transformName:(id)a4
{
  return [(BMDSLClassTransform *)self initWithName:@"transformName" version:1 className:a3 transformName:a4];
}

- (BMDSLClassTransform)initWithClassName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v7 = NSStringFromSelector(a4);
  v8 = [(BMDSLClassTransform *)self initWithClassName:v6 transformName:v7];

  return v8;
}

+ (id)withClassName:(id)a3 selector:(SEL)a4
{
  id v5 = a3;
  id v6 = [[BMDSLClassTransform alloc] initWithClassName:v5 selector:a4];

  return v6;
}

+ (id)withClassName:(id)a3 transformName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BMDSLClassTransform alloc] initWithClassName:v6 transformName:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMDSLClassTransform;
  [(BMDSLBaseCodable *)&v8 encodeWithCoder:v4];
  id v5 = [(BMDSLClassTransform *)self className];

  if (v5)
  {
    id v6 = [(BMDSLClassTransform *)self className];
    [v4 encodeObject:v6 forKey:@"className"];
  }
  v7 = [(BMDSLClassTransform *)self transformName];
  [v4 encodeObject:v7 forKey:@"transformName"];
}

- (BMDSLClassTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BMDSLClassTransform;
  id v5 = [(BMDSLBaseCodable *)&v20 initWithCoder:v4];
  if (v5)
  {
    id v6 = v5;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
    objc_super v8 = +[BMDSLTransforms allowedClasses];
    char v9 = [v8 containsObject:v7];

    if (v9)
    {
      id v10 = v7;
      Class v11 = objc_lookUpClass((const char *)[v10 UTF8String]);
      if (v11)
      {
        v12 = v11;
        uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transformName"];
        v14 = +[BMDSLTransforms allowedTransforms];
        char v15 = [v14 containsObject:v13];

        if (v15)
        {
          v16 = NSSelectorFromString((NSString *)&v13->isa);
          if (objc_opt_respondsToSelector())
          {
            if (class_getClassMethod(v12, v16))
            {
              v17 = [(BMDSLBaseCodable *)v6 name];
              id v6 = [(BMDSLClassTransform *)v6 initWithName:v17 version:[(BMDSLBaseCodable *)v6 version] className:v10 transformName:v13];
              v18 = v6;
LABEL_21:

              goto LABEL_22;
            }
            v17 = __biome_log_for_category();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
              -[BMDSLClassTransform initWithCoder:]();
            }
          }
          else
          {
            v17 = __biome_log_for_category();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
              -[BMDSLClassTransform initWithCoder:]();
            }
          }
        }
        else
        {
          v17 = __biome_log_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            -[BMDSLClassTransform initWithCoder:].cold.4();
          }
        }
        v18 = 0;
        goto LABEL_21;
      }
      uint64_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BMDSLClassTransform initWithCoder:]();
      }
    }
    else
    {
      uint64_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BMDSLClassTransform initWithCoder:].cold.5();
      }
    }
    v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(BMDSLBaseCodable *)self allowsEvaluation])
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This operation has evaluation disabled." userInfo:0];
    objc_exception_throw(v21);
  }
  objc_super v8 = +[BMDSLTransforms allowedClasses];
  char v9 = [(BMDSLClassTransform *)self className];
  char v10 = [v8 containsObject:v9];

  if (v10)
  {
    Class v11 = +[BMDSLTransforms allowedTransforms];
    v12 = [(BMDSLClassTransform *)self transformName];
    char v13 = [v11 containsObject:v12];

    if (v13)
    {
      v14 = [(BMDSLClassTransform *)self className];
      Class v15 = NSClassFromString(v14);

      v16 = [(BMDSLClassTransform *)self transformName];
      SEL v17 = NSSelectorFromString(v16);

      v18 = +[BMDSLTransformInvocation invokeTransformWithInput:v6 selector:v17 target:v15];
      goto LABEL_10;
    }
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BMDSLClassTransform transformInput:combinedState:](self, v19);
    }
  }
  else
  {
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BMDSLClassTransform transformInput:combinedState:](self, v19);
    }
  }

  v18 = 0;
LABEL_10:

  return v18;
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
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
  objc_storeStrong((id *)&self->_transformName, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 className:transformName:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLClassTransform", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_1B3086000, v0, v1, "%@ is an unknown class.", v2);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1B3086000, v0, v1, "Unable to get method for realized class. (%@, %@)");
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1B3086000, v0, v1, "%@ does not respond to selector %@");
}

- (void)initWithCoder:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_1B3086000, v0, v1, "Transform name not in allow list %@", v2);
}

- (void)initWithCoder:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_1B3086000, v0, v1, "Class name not in allow list %@", v2);
}

- (void)transformInput:(void *)a1 combinedState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 transformName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_1B3086000, a2, v4, "Transform name not in allow list %@", v5);
}

- (void)transformInput:(void *)a1 combinedState:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 className];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_1B3086000, a2, v4, "Class name not in allow list %@", v5);
}

@end