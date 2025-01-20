@interface _NSCompositeLayoutXAxisAnchor
- (NSArray)_childAnchors;
- (_NSCompositeLayoutXAxisAnchor)initWithAnchor:(id)a3;
- (_NSCompositeLayoutXAxisAnchor)initWithAnchor:(id)a3 plusDimension:(id)a4 times:(double)a5 plus:(double)a6;
- (_NSCompositeLayoutXAxisAnchor)initWithCoder:(id)a3;
- (double)_valueInEngine:(id)a3;
- (id)_expressionInContext:(id *)a3;
- (id)equationDescription;
- (int64_t)_directionAbstraction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSCompositeLayoutXAxisAnchor

- (_NSCompositeLayoutXAxisAnchor)initWithAnchor:(id)a3 plusDimension:(id)a4 times:(double)a5 plus:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  v10 = [(NSLayoutAnchor *)&v14 init];
  if (v10)
  {
    v10->_xAxisAnchor = (NSLayoutXAxisAnchor *)[a3 copy];
    uint64_t v11 = [a4 copy];
    v10->_dimension = (NSLayoutDimension *)v11;
    double v12 = 0.0;
    if (v11) {
      double v12 = a5;
    }
    v10->_dimensionMultiplier = v12;
    v10->_constant = a6;
  }
  return v10;
}

- (_NSCompositeLayoutXAxisAnchor)initWithAnchor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_xAxisAnchor = (NSLayoutXAxisAnchor *)[*((id *)a3 + 8) copy];
    v4->_dimension = (NSLayoutDimension *)[*((id *)a3 + 11) copy];
    v4->_dimensionMultiplier = *((double *)a3 + 10);
    v4->_constant = *((double *)a3 + 9);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  [(NSLayoutAnchor *)&v3 dealloc];
}

- (_NSCompositeLayoutXAxisAnchor)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  v4 = -[NSLayoutAnchor initWithCoder:](&v14, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_firstChildAnchor"];
    if (!v5)
    {
      v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void _CompositeAxisAnchor_InitWithCoder(NSCoder *, NSLayoutAnchor **, NSLayoutDimension ** _Nullable, CGFloat *, CGFloat *)"), @"NSDerivativeLayoutAnchor.m", 306, @"NSLayoutAxisAnchor decoded with empty base anchor");
    }
    objc_super v6 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_secondChildAnchor"];
    v4->_xAxisAnchor = (NSLayoutXAxisAnchor *)[v5 copy];
    v4->_dimension = (NSLayoutDimension *)[v6 copy];
    if ([a3 containsValueForKey:@"NSLayoutAnchor_multiplier"])
    {
      [a3 decodeFloatForKey:@"NSLayoutAnchor_multiplier"];
      double v8 = v7;
    }
    else
    {
      double v8 = 1.0;
      if (!v4->_dimension) {
        double v8 = 0.0;
      }
    }
    v4->_dimensionMultiplier = v8;
    int v9 = [a3 containsValueForKey:@"NSLayoutAnchor_constant"];
    double v10 = 0.0;
    if (v9)
    {
      objc_msgSend(a3, "decodeFloatForKey:", @"NSLayoutAnchor_constant", 0.0);
      double v10 = v11;
    }
    v4->_constant = v10;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NSCompositeLayoutXAxisAnchor;
  -[NSLayoutAnchor encodeWithCoder:](&v9, sel_encodeWithCoder_);
  dimension = self->_dimension;
  double dimensionMultiplier = self->_dimensionMultiplier;
  double constant = self->_constant;
  [a3 encodeObject:self->_xAxisAnchor forKey:@"NSLayoutAnchor_firstChildAnchor"];
  if (dimension)
  {
    [a3 encodeObject:dimension forKey:@"NSLayoutAnchor_secondChildAnchor"];
    double v8 = 1.0;
    if (dimensionMultiplier != 1.0)
    {
      *(float *)&double v8 = dimensionMultiplier;
      [a3 encodeFloat:@"NSLayoutAnchor_multiplier" forKey:v8];
    }
  }
  if (constant != 0.0)
  {
    *(float *)&double v8 = constant;
    [a3 encodeFloat:@"NSLayoutAnchor_constant" forKey:v8];
  }
}

- (id)_expressionInContext:(id *)a3
{
  int64_t var0 = a3->var0;
  if ([(NSLayoutXAxisAnchor *)self->_xAxisAnchor _directionAbstraction] != 1 && var0 == 1) {
    double v7 = -1.0;
  }
  else {
    double v7 = 1.0;
  }
  xAxisAnchor = self->_xAxisAnchor;
  dimension = self->_dimension;
  double dimensionMultiplier = self->_dimensionMultiplier;
  double constant = self->_constant;
  id var2 = a3->var2;
  long long v21 = *(_OWORD *)&a3->var0;
  id v22 = var2;
  id v13 = -[NSLayoutAnchor _expressionInContext:](xAxisAnchor, "_expressionInContext:", &v21, v21);
  objc_super v14 = v13;
  if (dimension)
  {
    long long v21 = v20;
    id v22 = var2;
    dimension = [(NSLayoutAnchor *)dimension _expressionInContext:&v21];
    uint64_t v15 = [v14 variableCount];
    if (dimension)
    {
      uint64_t v16 = [(NSLayoutDimension *)dimension variableCount];
      char v17 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v15 = [v13 variableCount];
  }
  uint64_t v16 = 0;
  char v17 = 1;
LABEL_12:
  id v18 = +[NSISLinearExpression newExpressionWithCapacity:v16 + v15 engine:var2];
  [v18 addExpression:v14 times:1.0];
  if ((v17 & 1) == 0) {
    [v18 addExpression:dimension times:v7 * dimensionMultiplier];
  }
  [v18 incrementConstant:v7 * constant];
  return v18;
}

- (double)_valueInEngine:(id)a3
{
  dimension = self->_dimension;
  double dimensionMultiplier = self->_dimensionMultiplier;
  double constant = self->_constant;
  -[NSLayoutAnchor _valueInEngine:](self->_xAxisAnchor, "_valueInEngine:");
  double v8 = v7;
  [(NSLayoutAnchor *)dimension _valueInEngine:a3];
  return constant + v8 + dimensionMultiplier * v9;
}

- (id)equationDescription
{
  dimension = self->_dimension;
  double dimensionMultiplier = self->_dimensionMultiplier;
  double constant = self->_constant;
  v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"(%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_xAxisAnchor, "_equationDescriptionInParent");
  objc_super v6 = v5;
  if (dimension)
  {
    BOOL v7 = dimensionMultiplier < 0.0;
    if (dimensionMultiplier != 0.0)
    {
      double v8 = fabs(dimensionMultiplier);
      if (v7) {
        double v9 = @"-";
      }
      else {
        double v9 = @"+";
      }
      [v5 appendString:v9];
      if (v8 != 1.0) {
        objc_msgSend(v6, "appendFormat:", @"%g*", *(void *)&v8);
      }
      [v6 appendFormat:@"%@", -[NSLayoutAnchor _equationDescriptionInParent](dimension, "_equationDescriptionInParent")];
    }
  }
  if (constant != 0.0)
  {
    double v10 = fabs(constant);
    if (constant >= 0.0) {
      float v11 = @"+%g";
    }
    else {
      float v11 = @"-%g";
    }
    objc_msgSend(v6, "appendFormat:", v11, *(void *)&v10);
  }
  [v6 appendString:@""]);
  double v12 = (void *)[v6 copy];
  return v12;
}

- (NSArray)_childAnchors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  dimension = self->_dimension;
  if (dimension)
  {
    v6[0] = self->_xAxisAnchor;
    v6[1] = dimension;
    objc_super v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = 2;
  }
  else
  {
    v6[0] = self->_xAxisAnchor;
    objc_super v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = 1;
  }
  return (NSArray *)[v3 arrayWithObjects:v6 count:v4];
}

- (int64_t)_directionAbstraction
{
  return [(NSLayoutXAxisAnchor *)self->_xAxisAnchor _directionAbstraction];
}

@end