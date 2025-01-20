@interface MLCMultiheadAttentionDescriptor
+ (MLCMultiheadAttentionDescriptor)descriptorWithModelDimension:(NSUInteger)modelDimension headCount:(NSUInteger)headCount;
+ (MLCMultiheadAttentionDescriptor)descriptorWithModelDimension:(NSUInteger)modelDimension keyDimension:(NSUInteger)keyDimension valueDimension:(NSUInteger)valueDimension headCount:(NSUInteger)headCount dropout:(float)dropout hasBiases:(BOOL)hasBiases hasAttentionBiases:(BOOL)hasAttentionBiases addsZeroAttention:(BOOL)addsZeroAttention;
- (BOOL)addsZeroAttention;
- (BOOL)hasAttentionBiases;
- (BOOL)hasAttentionMask;
- (BOOL)hasBiases;
- (BOOL)hasKeyPaddingMask;
- (BOOL)isEqual:(id)a3;
- (MLCMultiheadAttentionDescriptor)initWithModelDimension:(unint64_t)a3 keyDimension:(unint64_t)a4 valueDimension:(unint64_t)a5 headCount:(unint64_t)a6 dropout:(float)a7 hasBias:(BOOL)a8 hasAttentionBias:(BOOL)a9 addsZeroAttention:(BOOL)a10;
- (NSUInteger)headCount;
- (NSUInteger)keyDimension;
- (NSUInteger)modelDimension;
- (NSUInteger)valueDimension;
- (float)dropout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setHasAttentionMask:(BOOL)a3;
- (void)setHasKeyPaddingMask:(BOOL)a3;
@end

@implementation MLCMultiheadAttentionDescriptor

+ (MLCMultiheadAttentionDescriptor)descriptorWithModelDimension:(NSUInteger)modelDimension keyDimension:(NSUInteger)keyDimension valueDimension:(NSUInteger)valueDimension headCount:(NSUInteger)headCount dropout:(float)dropout hasBiases:(BOOL)hasBiases hasAttentionBiases:(BOOL)hasAttentionBiases addsZeroAttention:(BOOL)addsZeroAttention
{
  BOOL v10 = hasAttentionBiases;
  BOOL v11 = hasBiases;
  id v17 = objc_alloc((Class)a1);
  LOBYTE(v21) = addsZeroAttention;
  *(float *)&double v18 = dropout;
  v19 = (void *)[v17 initWithModelDimension:modelDimension keyDimension:keyDimension valueDimension:valueDimension headCount:headCount dropout:v11 hasBias:v10 hasAttentionBias:v18 addsZeroAttention:v21];

  return (MLCMultiheadAttentionDescriptor *)v19;
}

+ (MLCMultiheadAttentionDescriptor)descriptorWithModelDimension:(NSUInteger)modelDimension headCount:(NSUInteger)headCount
{
  LOBYTE(v6) = 0;
  v4 = (void *)[objc_alloc((Class)a1) initWithModelDimension:modelDimension keyDimension:modelDimension valueDimension:modelDimension headCount:headCount dropout:1 hasBias:0 hasAttentionBias:0.0 addsZeroAttention:v6];

  return (MLCMultiheadAttentionDescriptor *)v4;
}

- (MLCMultiheadAttentionDescriptor)initWithModelDimension:(unint64_t)a3 keyDimension:(unint64_t)a4 valueDimension:(unint64_t)a5 headCount:(unint64_t)a6 dropout:(float)a7 hasBias:(BOOL)a8 hasAttentionBias:(BOOL)a9 addsZeroAttention:(BOOL)a10
{
  v12 = self;
  if (a7 < 0.0 || a7 > 1.0)
  {
    v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionDescriptor initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:](a2);
    }
LABEL_11:

    id v17 = 0;
    goto LABEL_12;
  }
  if (!a6 || a3 % a6)
  {
    v14 = +[MLCLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionDescriptor initWithModelDimension:keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:](a2);
    }
    goto LABEL_11;
  }
  v24.receiver = self;
  v24.super_class = (Class)MLCMultiheadAttentionDescriptor;
  v23 = [(MLCMultiheadAttentionDescriptor *)&v24 init];
  if (v23)
  {
    *((void *)v23 + 3) = a3;
    *((void *)v23 + 4) = a4;
    *((void *)v23 + 5) = a5;
    *((void *)v23 + 6) = a6;
    *((float *)v23 + 4) = a7;
    v23[8] = a8;
    v23[9] = a9;
    v23[10] = a10;
    *(_WORD *)(v23 + 11) = 0;
  }
  v12 = v23;
  id v17 = v12;
LABEL_12:

  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCMultiheadAttentionDescriptor *)self modelDimension];
  NSUInteger v7 = [(MLCMultiheadAttentionDescriptor *)self keyDimension];
  NSUInteger v8 = [(MLCMultiheadAttentionDescriptor *)self valueDimension];
  NSUInteger v9 = [(MLCMultiheadAttentionDescriptor *)self headCount];
  [(MLCMultiheadAttentionDescriptor *)self dropout];
  BOOL v11 = [v3 stringWithFormat:@"%@: { modelDimension=%lu : keyDimension=%lu : valueDimension=%lu : headCount=%lu : dropout=%f : hasBias=%d : hasAttentionBias=%d : addsZeroAttention=%d }", v5, v6, v7, v8, v9, v10, -[MLCMultiheadAttentionDescriptor hasBiases](self, "hasBiases"), -[MLCMultiheadAttentionDescriptor hasAttentionBiases](self, "hasAttentionBiases"), -[MLCMultiheadAttentionDescriptor addsZeroAttention](self, "addsZeroAttention")];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 modelDimension];
    if (v6 == [(MLCMultiheadAttentionDescriptor *)self modelDimension]
      && (uint64_t v7 = [v5 keyDimension],
          v7 == [(MLCMultiheadAttentionDescriptor *)self keyDimension])
      && (uint64_t v8 = [v5 headCount], v8 == -[MLCMultiheadAttentionDescriptor headCount](self, "headCount"))
      && ([v5 dropout], float v10 = v9, -[MLCMultiheadAttentionDescriptor dropout](self, "dropout"), v10 == v11)
      && (int v12 = [v5 hasBiases], v12 == -[MLCMultiheadAttentionDescriptor hasBiases](self, "hasBiases"))
      && (int v13 = [v5 hasAttentionBiases],
          v13 == [(MLCMultiheadAttentionDescriptor *)self hasAttentionBiases]))
    {
      int v16 = [v5 addsZeroAttention];
      int v14 = v16 ^ [(MLCMultiheadAttentionDescriptor *)self addsZeroAttention] ^ 1;
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v14 = 0;
  char v3 = [(MLCMultiheadAttentionDescriptor *)self modelDimension];
  [(MLCMultiheadAttentionDescriptor *)self keyDimension];
  [(MLCMultiheadAttentionDescriptor *)self valueDimension];
  [(MLCMultiheadAttentionDescriptor *)self headCount];
  id v4 = NSNumber;
  [(MLCMultiheadAttentionDescriptor *)self dropout];
  id v5 = objc_msgSend(v4, "numberWithFloat:");
  [v5 hash];
  [(MLCMultiheadAttentionDescriptor *)self hasBiases];
  [(MLCMultiheadAttentionDescriptor *)self hasAttentionBiases];
  [(MLCMultiheadAttentionDescriptor *)self addsZeroAttention];
  hashCombine_1(&v14, v6, v7, v8, v9, v10, v11, v12, v3);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSUInteger v5 = [(MLCMultiheadAttentionDescriptor *)self modelDimension];
  NSUInteger v6 = [(MLCMultiheadAttentionDescriptor *)self keyDimension];
  NSUInteger v7 = [(MLCMultiheadAttentionDescriptor *)self valueDimension];
  NSUInteger v8 = [(MLCMultiheadAttentionDescriptor *)self headCount];
  [(MLCMultiheadAttentionDescriptor *)self dropout];
  int v10 = v9;
  BOOL v11 = [(MLCMultiheadAttentionDescriptor *)self hasBiases];
  BOOL v12 = [(MLCMultiheadAttentionDescriptor *)self hasAttentionBiases];
  LOBYTE(v15) = [(MLCMultiheadAttentionDescriptor *)self addsZeroAttention];
  LODWORD(v13) = v10;
  return (id)[v4 initWithModelDimension:v5 keyDimension:v6 valueDimension:v7 headCount:v8 dropout:v11 hasBias:v12 hasAttentionBias:v13 addsZeroAttention:v15];
}

- (NSUInteger)modelDimension
{
  return self->_modelDimension;
}

- (NSUInteger)keyDimension
{
  return self->_keyDimension;
}

- (NSUInteger)valueDimension
{
  return self->_valueDimension;
}

- (NSUInteger)headCount
{
  return self->_headCount;
}

- (float)dropout
{
  return self->_dropout;
}

- (BOOL)hasBiases
{
  return self->_hasBiases;
}

- (BOOL)hasAttentionBiases
{
  return self->_hasAttentionBiases;
}

- (BOOL)addsZeroAttention
{
  return self->_addsZeroAttention;
}

- (BOOL)hasKeyPaddingMask
{
  return self->_hasKeyPaddingMask;
}

- (void)setHasKeyPaddingMask:(BOOL)a3
{
  self->_hasKeyPaddingMask = a3;
}

- (BOOL)hasAttentionMask
{
  return self->_hasAttentionMask;
}

- (void)setHasAttentionMask:(BOOL)a3
{
  self->_hasAttentionMask = a3;
}

- (void)initWithModelDimension:(const char *)a1 keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@ droupout is a probability between zero and one", v4, v5, v6, v7, 2u);
}

- (void)initWithModelDimension:(const char *)a1 keyDimension:valueDimension:headCount:dropout:hasBias:hasAttentionBias:addsZeroAttention:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@ model dimension must be divisible by number of heads", v4, v5, v6, v7, 2u);
}

@end