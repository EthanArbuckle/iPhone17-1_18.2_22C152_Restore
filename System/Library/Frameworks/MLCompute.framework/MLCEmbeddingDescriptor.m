@interface MLCEmbeddingDescriptor
+ (MLCEmbeddingDescriptor)descriptorWithEmbeddingCount:(NSNumber *)embeddingCount embeddingDimension:(NSNumber *)embeddingDimension;
+ (MLCEmbeddingDescriptor)descriptorWithEmbeddingCount:(NSNumber *)embeddingCount embeddingDimension:(NSNumber *)embeddingDimension paddingIndex:(NSNumber *)paddingIndex maximumNorm:(NSNumber *)maximumNorm pNorm:(NSNumber *)pNorm scalesGradientByFrequency:(BOOL)scalesGradientByFrequency;
- (BOOL)isEqual:(id)a3;
- (BOOL)scalesGradientByFrequency;
- (MLCEmbeddingDescriptor)initWithEmbeddingCount:(id)a3 embeddingDimension:(id)a4 paddingIndex:(id)a5 maximumNorm:(id)a6 pNorm:(id)a7 scalesGradientByFrequency:(BOOL)a8;
- (NSNumber)embeddingCount;
- (NSNumber)embeddingDimension;
- (NSNumber)maximumNorm;
- (NSNumber)pNorm;
- (NSNumber)paddingIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCEmbeddingDescriptor

+ (MLCEmbeddingDescriptor)descriptorWithEmbeddingCount:(NSNumber *)embeddingCount embeddingDimension:(NSNumber *)embeddingDimension paddingIndex:(NSNumber *)paddingIndex maximumNorm:(NSNumber *)maximumNorm pNorm:(NSNumber *)pNorm scalesGradientByFrequency:(BOOL)scalesGradientByFrequency
{
  BOOL v8 = scalesGradientByFrequency;
  v14 = pNorm;
  v15 = maximumNorm;
  v16 = paddingIndex;
  v17 = embeddingDimension;
  v18 = embeddingCount;
  v19 = (void *)[objc_alloc((Class)a1) initWithEmbeddingCount:v18 embeddingDimension:v17 paddingIndex:v16 maximumNorm:v15 pNorm:v14 scalesGradientByFrequency:v8];

  return (MLCEmbeddingDescriptor *)v19;
}

+ (MLCEmbeddingDescriptor)descriptorWithEmbeddingCount:(NSNumber *)embeddingCount embeddingDimension:(NSNumber *)embeddingDimension
{
  v6 = embeddingDimension;
  v7 = embeddingCount;
  BOOL v8 = (void *)[objc_alloc((Class)a1) initWithEmbeddingCount:v7 embeddingDimension:v6 paddingIndex:0 maximumNorm:0 pNorm:0 scalesGradientByFrequency:0];

  return (MLCEmbeddingDescriptor *)v8;
}

- (MLCEmbeddingDescriptor)initWithEmbeddingCount:(id)a3 embeddingDimension:(id)a4 paddingIndex:(id)a5 maximumNorm:(id)a6 pNorm:(id)a7 scalesGradientByFrequency:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v14 integerValue] <= 0)
  {
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:](a2);
    }
    goto LABEL_26;
  }
  if ([v15 integerValue] <= 0)
  {
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:](a2);
    }
    goto LABEL_26;
  }
  if (v16)
  {
    if ([v16 integerValue] < 0
      || (unint64_t v19 = [v16 unsignedIntegerValue], v19 > objc_msgSend(v14, "unsignedIntegerValue") - 1))
    {
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.5(a2);
      }
LABEL_26:

      v26 = 0;
      goto LABEL_27;
    }
  }
  if (v17)
  {
    [v17 floatValue];
    if (v21 <= 0.0)
    {
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:].cold.4(a2);
      }
      goto LABEL_26;
    }
  }
  if (v18)
  {
    [v18 floatValue];
    if (v22 <= 0.0)
    {
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MLCEmbeddingDescriptor initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:](a2);
      }
      goto LABEL_26;
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)MLCEmbeddingDescriptor;
  v23 = [(MLCEmbeddingDescriptor *)&v30 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_embeddingCount, a3);
    objc_storeStrong((id *)&v24->_embeddingDimension, a4);
    objc_storeStrong((id *)&v24->_paddingIndex, a5);
    objc_storeStrong((id *)&v24->_maximumNorm, a6);
    if (v18) {
      v25 = v18;
    }
    else {
      v25 = &unk_1F3876FB0;
    }
    objc_storeStrong((id *)&v24->_pNorm, v25);
    v24->_scalesGradientByFrequency = a8;
  }
  self = v24;
  v26 = self;
LABEL_27:

  return v26;
}

- (id)description
{
  id v18 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MLCEmbeddingDescriptor *)self embeddingCount];
  uint64_t v6 = [v5 unsignedIntegerValue];
  v7 = [(MLCEmbeddingDescriptor *)self embeddingDimension];
  uint64_t v8 = [v7 unsignedIntegerValue];
  v9 = [(MLCEmbeddingDescriptor *)self paddingIndex];
  uint64_t v10 = [v9 unsignedIntegerValue];
  v11 = [(MLCEmbeddingDescriptor *)self maximumNorm];
  [v11 floatValue];
  double v13 = v12;
  id v14 = [(MLCEmbeddingDescriptor *)self pNorm];
  [v14 floatValue];
  id v16 = [v18 stringWithFormat:@"%@: { embeddingCount=%lu : embeddingDimension=%lu : paddingIndex=%lu : maximumNorm=%f : pNorm=%f : scalesGradientByFrequency=%d }", v4, v6, v8, v10, *(void *)&v13, v15, -[MLCEmbeddingDescriptor scalesGradientByFrequency](self, "scalesGradientByFrequency")];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 embeddingCount];
    v7 = [(MLCEmbeddingDescriptor *)self embeddingCount];
    if (v6 == v7)
    {
      v9 = [v5 embeddingDimension];
      uint64_t v10 = [(MLCEmbeddingDescriptor *)self embeddingDimension];
      if (v9 == v10)
      {
        v11 = [v5 paddingIndex];
        float v12 = [(MLCEmbeddingDescriptor *)self paddingIndex];
        if (v11 == v12)
        {
          uint64_t v13 = [v5 maximumNorm];
          id v14 = [(MLCEmbeddingDescriptor *)self maximumNorm];
          v23 = (void *)v13;
          if ((void *)v13 == v14)
          {
            id v22 = v14;
            uint64_t v15 = [v5 pNorm];
            id v16 = [(MLCEmbeddingDescriptor *)self pNorm];
            float v21 = (void *)v15;
            if ((void *)v15 == v16)
            {
              id v17 = v16;
              int v20 = [v5 scalesGradientByFrequency];
              int v18 = v20 ^ [(MLCEmbeddingDescriptor *)self scalesGradientByFrequency];
              id v16 = v17;
              char v8 = v18 ^ 1;
            }
            else
            {
              char v8 = 0;
            }

            id v14 = v22;
          }
          else
          {
            char v8 = 0;
          }
        }
        else
        {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v17 = 0;
  v3 = [(MLCEmbeddingDescriptor *)self embeddingCount];
  char v16 = [v3 hash];
  id v4 = [(MLCEmbeddingDescriptor *)self embeddingDimension];
  [v4 hash];
  id v5 = [(MLCEmbeddingDescriptor *)self paddingIndex];
  [v5 hash];
  uint64_t v6 = [(MLCEmbeddingDescriptor *)self maximumNorm];
  [v6 hash];
  v7 = [(MLCEmbeddingDescriptor *)self pNorm];
  [v7 hash];
  [(MLCEmbeddingDescriptor *)self scalesGradientByFrequency];
  hashCombine_6(&v17, v8, v9, v10, v11, v12, v13, v14, v16);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MLCEmbeddingDescriptor *)self embeddingCount];
  uint64_t v6 = [(MLCEmbeddingDescriptor *)self embeddingDimension];
  v7 = [(MLCEmbeddingDescriptor *)self paddingIndex];
  uint64_t v8 = [(MLCEmbeddingDescriptor *)self maximumNorm];
  uint64_t v9 = [(MLCEmbeddingDescriptor *)self pNorm];
  uint64_t v10 = objc_msgSend(v4, "initWithEmbeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:", v5, v6, v7, v8, v9, -[MLCEmbeddingDescriptor scalesGradientByFrequency](self, "scalesGradientByFrequency"));

  return v10;
}

- (NSNumber)embeddingCount
{
  return self->_embeddingCount;
}

- (NSNumber)embeddingDimension
{
  return self->_embeddingDimension;
}

- (NSNumber)paddingIndex
{
  return self->_paddingIndex;
}

- (NSNumber)maximumNorm
{
  return self->_maximumNorm;
}

- (NSNumber)pNorm
{
  return self->_pNorm;
}

- (BOOL)scalesGradientByFrequency
{
  return self->_scalesGradientByFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pNorm, 0);
  objc_storeStrong((id *)&self->_maximumNorm, 0);
  objc_storeStrong((id *)&self->_paddingIndex, 0);
  objc_storeStrong((id *)&self->_embeddingDimension, 0);

  objc_storeStrong((id *)&self->_embeddingCount, 0);
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: The number of embeddings must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: The embedding dimension must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: The p in p-norm must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: The maximum norm must be greater than zero", v4, v5, v6, v7, v8);
}

- (void)initWithEmbeddingCount:(const char *)a1 embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: The padding index must be within the number of embeddings", v4, v5, v6, v7, v8);
}

@end