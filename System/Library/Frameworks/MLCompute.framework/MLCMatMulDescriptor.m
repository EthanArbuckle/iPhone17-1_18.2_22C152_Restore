@interface MLCMatMulDescriptor
+ (MLCMatMulDescriptor)descriptor;
+ (MLCMatMulDescriptor)descriptorWithAlpha:(float)alpha transposesX:(BOOL)transposesX transposesY:(BOOL)transposesY;
- (BOOL)isEqual:(id)a3;
- (BOOL)transposesX;
- (BOOL)transposesY;
- (MLCMatMulDescriptor)initWithAlpha:(float)a3 transposesX:(BOOL)a4 transposesY:(BOOL)a5;
- (float)alpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCMatMulDescriptor

+ (MLCMatMulDescriptor)descriptor
{
  id v2 = objc_alloc((Class)a1);
  LODWORD(v3) = 1.0;
  v4 = (void *)[v2 initWithAlpha:0 transposesX:0 transposesY:v3];

  return (MLCMatMulDescriptor *)v4;
}

+ (MLCMatMulDescriptor)descriptorWithAlpha:(float)alpha transposesX:(BOOL)transposesX transposesY:(BOOL)transposesY
{
  BOOL v5 = transposesY;
  BOOL v6 = transposesX;
  id v8 = objc_alloc((Class)a1);
  *(float *)&double v9 = alpha;
  v10 = (void *)[v8 initWithAlpha:v6 transposesX:v5 transposesY:v9];

  return (MLCMatMulDescriptor *)v10;
}

- (MLCMatMulDescriptor)initWithAlpha:(float)a3 transposesX:(BOOL)a4 transposesY:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MLCMatMulDescriptor;
  result = [(MLCMatMulDescriptor *)&v9 init];
  if (result)
  {
    result->_alpha = a3;
    result->_transposesX = a4;
    result->_transposesY = a5;
  }
  return result;
}

- (id)description
{
  double v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [(MLCMatMulDescriptor *)self alpha];
  v7 = [v3 stringWithFormat:@"%@: { alpha=%f : transposesX=%d : transposesY=%d }", v5, v6, -[MLCMatMulDescriptor transposesX](self, "transposesX"), -[MLCMatMulDescriptor transposesY](self, "transposesY")];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 alpha];
    float v7 = v6;
    [(MLCMatMulDescriptor *)self alpha];
    if (v7 == v8
      && (int v9 = [v5 transposesX], v9 == -[MLCMatMulDescriptor transposesX](self, "transposesX")))
    {
      int v11 = [v5 transposesY];
      int v10 = v11 ^ [(MLCMatMulDescriptor *)self transposesY] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v14 = 0;
  double v3 = NSNumber;
  [(MLCMatMulDescriptor *)self alpha];
  id v4 = objc_msgSend(v3, "numberWithFloat:");
  char v5 = [v4 hash];
  [(MLCMatMulDescriptor *)self transposesX];
  [(MLCMatMulDescriptor *)self transposesY];
  hashCombine_7(&v14, v6, v7, v8, v9, v10, v11, v12, v5);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(MLCMatMulDescriptor *)self alpha];
  int v6 = v5;
  BOOL v7 = [(MLCMatMulDescriptor *)self transposesY];
  BOOL v8 = [(MLCMatMulDescriptor *)self transposesY];
  LODWORD(v9) = v6;

  return (id)[v4 initWithAlpha:v7 transposesX:v8 transposesY:v9];
}

- (float)alpha
{
  return self->_alpha;
}

- (BOOL)transposesX
{
  return self->_transposesX;
}

- (BOOL)transposesY
{
  return self->_transposesY;
}

@end