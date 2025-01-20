@interface MLCLossDescriptor
+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType;
+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight;
+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount;
+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount epsilon:(float)epsilon delta:(float)delta;
- (BOOL)isEqual:(id)a3;
- (MLCLossDescriptor)initWithLossDescriptorWithType:(int)a3 reductionType:(int)a4 weight:(float)a5;
- (MLCLossDescriptor)initWithLossDescriptorWithType:(int)a3 reductionType:(int)a4 weight:(float)a5 labelSmoothing:(float)a6 classCount:(unint64_t)a7 epsilon:(float)a8 delta:(float)a9;
- (MLCLossType)lossType;
- (MLCReductionType)reductionType;
- (NSUInteger)classCount;
- (float)delta;
- (float)epsilon;
- (float)labelSmoothing;
- (float)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCLossDescriptor

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType
{
  uint64_t v4 = *(void *)&reductionType;
  uint64_t v5 = *(void *)&lossType;
  id v6 = objc_alloc((Class)a1);
  LODWORD(v7) = 1.0;
  v8 = (void *)[v6 initWithLossDescriptorWithType:v5 reductionType:v4 weight:v7];

  return (MLCLossDescriptor *)v8;
}

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight
{
  uint64_t v6 = *(void *)&reductionType;
  uint64_t v7 = *(void *)&lossType;
  id v8 = objc_alloc((Class)a1);
  *(float *)&double v9 = weight;
  v10 = (void *)[v8 initWithLossDescriptorWithType:v7 reductionType:v6 weight:v9];

  return (MLCLossDescriptor *)v10;
}

- (MLCLossDescriptor)initWithLossDescriptorWithType:(int)a3 reductionType:(int)a4 weight:(float)a5
{
  return -[MLCLossDescriptor initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](self, "initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:", *(void *)&a3, *(void *)&a4, 1);
}

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount
{
  uint64_t v10 = *(void *)&reductionType;
  uint64_t v11 = *(void *)&lossType;
  id v12 = objc_alloc((Class)a1);
  LODWORD(v13) = 869711765;
  LODWORD(v14) = 1.0;
  *(float *)&double v15 = weight;
  *(float *)&double v16 = labelSmoothing;
  v17 = (void *)[v12 initWithLossDescriptorWithType:v11 reductionType:v10 weight:classCount labelSmoothing:v15 classCount:v16 epsilon:v13 delta:v14];

  return (MLCLossDescriptor *)v17;
}

+ (MLCLossDescriptor)descriptorWithType:(MLCLossType)lossType reductionType:(MLCReductionType)reductionType weight:(float)weight labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount epsilon:(float)epsilon delta:(float)delta
{
  uint64_t v14 = *(void *)&reductionType;
  uint64_t v15 = *(void *)&lossType;
  id v16 = objc_alloc((Class)a1);
  *(float *)&double v17 = weight;
  *(float *)&double v18 = labelSmoothing;
  *(float *)&double v19 = epsilon;
  *(float *)&double v20 = delta;
  v21 = (void *)[v16 initWithLossDescriptorWithType:v15 reductionType:v14 weight:classCount labelSmoothing:v17 classCount:v18 epsilon:v19 delta:v20];

  return (MLCLossDescriptor *)v21;
}

- (MLCLossDescriptor)initWithLossDescriptorWithType:(int)a3 reductionType:(int)a4 weight:(float)a5 labelSmoothing:(float)a6 classCount:(unint64_t)a7 epsilon:(float)a8 delta:(float)a9
{
  if (a4 >= 3)
  {
    double v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCLossDescriptor initWithLossDescriptorWithType:reductionType:weight:labelSmoothing:classCount:epsilon:delta:](a2, a4, v18);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)MLCLossDescriptor;
  result = [(MLCLossDescriptor *)&v20 init];
  if (result)
  {
    result->_lossType = a3;
    result->_reductionType = a4;
    result->_weight = a5;
    result->_labelSmoothing = a6;
    result->_classCount = a7;
    result->_epsilon = a8;
    result->_delta = a9;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCLossDescriptor *)self lossType];
  uint64_t v7 = [(MLCLossDescriptor *)self reductionType];
  [(MLCLossDescriptor *)self weight];
  double v9 = v8;
  [(MLCLossDescriptor *)self labelSmoothing];
  double v11 = v10;
  NSUInteger v12 = [(MLCLossDescriptor *)self classCount];
  [(MLCLossDescriptor *)self epsilon];
  double v14 = v13;
  [(MLCLossDescriptor *)self delta];
  id v16 = [v3 stringWithFormat:@"%@: { lossType=%d : reductionType=%d : weight=%f : labelSmoothing=%f : numberOfClasses=%lu : epsilon=%f : delta=%f }", v5, v6, v7, *(void *)&v9, *(void *)&v11, v12, *(void *)&v14, v15];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 lossType];
    if (v6 != [(MLCLossDescriptor *)self lossType]) {
      goto LABEL_10;
    }
    int v7 = [v5 reductionType];
    if (v7 != [(MLCLossDescriptor *)self reductionType]) {
      goto LABEL_10;
    }
    [v5 weight];
    float v9 = v8;
    [(MLCLossDescriptor *)self weight];
    if (v9 != v10) {
      goto LABEL_10;
    }
    [v5 labelSmoothing];
    float v12 = v11;
    [(MLCLossDescriptor *)self labelSmoothing];
    if (v12 == v13
      && (uint64_t v14 = [v5 classCount], v14 == -[MLCLossDescriptor classCount](self, "classCount"))
      && ([v5 epsilon], float v16 = v15, -[MLCLossDescriptor epsilon](self, "epsilon"), v16 == v17))
    {
      [v5 delta];
      float v19 = v18;
      [(MLCLossDescriptor *)self delta];
      BOOL v21 = v19 == v20;
    }
    else
    {
LABEL_10:
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  unint64_t v20 = 0;
  char v19 = [(MLCLossDescriptor *)self lossType];
  [(MLCLossDescriptor *)self reductionType];
  v3 = NSNumber;
  [(MLCLossDescriptor *)self weight];
  id v4 = objc_msgSend(v3, "numberWithFloat:");
  [v4 hash];
  id v5 = NSNumber;
  [(MLCLossDescriptor *)self labelSmoothing];
  int v6 = objc_msgSend(v5, "numberWithFloat:");
  [v6 hash];
  [(MLCLossDescriptor *)self classCount];
  int v7 = NSNumber;
  [(MLCLossDescriptor *)self epsilon];
  float v8 = objc_msgSend(v7, "numberWithFloat:");
  [v8 hash];
  float v9 = NSNumber;
  [(MLCLossDescriptor *)self delta];
  float v10 = objc_msgSend(v9, "numberWithFloat:");
  [v10 hash];
  hashCombine_3(&v20, v11, v12, v13, v14, v15, v16, v17, v19);

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(MLCLossDescriptor *)self lossType];
  uint64_t v6 = [(MLCLossDescriptor *)self reductionType];
  [(MLCLossDescriptor *)self weight];
  int v8 = v7;
  [(MLCLossDescriptor *)self labelSmoothing];
  int v10 = v9;
  NSUInteger v11 = [(MLCLossDescriptor *)self classCount];
  [(MLCLossDescriptor *)self epsilon];
  int v13 = v12;
  [(MLCLossDescriptor *)self delta];
  LODWORD(v14) = LODWORD(v15);
  LODWORD(v15) = v8;
  LODWORD(v16) = v10;
  LODWORD(v17) = v13;

  return (id)[v4 initWithLossDescriptorWithType:v5 reductionType:v6 weight:v11 labelSmoothing:v15 classCount:v16 epsilon:v17 delta:v14];
}

- (MLCLossType)lossType
{
  return self->_lossType;
}

- (MLCReductionType)reductionType
{
  return self->_reductionType;
}

- (float)weight
{
  return self->_weight;
}

- (float)labelSmoothing
{
  return self->_labelSmoothing;
}

- (NSUInteger)classCount
{
  return self->_classCount;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (float)delta
{
  return self->_delta;
}

- (void)initWithLossDescriptorWithType:(NSObject *)a3 reductionType:weight:labelSmoothing:classCount:epsilon:delta:.cold.1(const char *a1, int a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: reduction type is not supported, using MLCReductionTypeNone instead = %d", (uint8_t *)&v6, 0x12u);
}

@end