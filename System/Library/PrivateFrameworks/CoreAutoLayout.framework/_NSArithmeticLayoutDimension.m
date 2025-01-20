@interface _NSArithmeticLayoutDimension
- (NSArray)_childAnchors;
- (_NSArithmeticLayoutDimension)initWithAnchor:(id)a3;
- (_NSArithmeticLayoutDimension)initWithCoder:(id)a3;
- (_NSArithmeticLayoutDimension)initWithMultiplier:(double)a3 dimension:(id)a4 constant:(double)a5;
- (double)_valueInEngine:(id)a3;
- (id)_expressionInContext:(id *)a3;
- (id)_nearestAncestorLayoutItem;
- (id)equationDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSArithmeticLayoutDimension

- (_NSArithmeticLayoutDimension)initWithMultiplier:(double)a3 dimension:(id)a4 constant:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_NSArithmeticLayoutDimension;
  v8 = [(NSLayoutAnchor *)&v10 init];
  if (v8)
  {
    v8->_rootLayoutDimension = (NSLayoutDimension *)[a4 copy];
    v8->_multiplier = a3;
    v8->_constant = a5;
  }
  return v8;
}

- (_NSArithmeticLayoutDimension)initWithAnchor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSArithmeticLayoutDimension;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_rootLayoutDimension = (NSLayoutDimension *)[*((id *)a3 + 8) copy];
    v4->_multiplier = *((double *)a3 + 9);
    v4->_constant = *((double *)a3 + 10);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSArithmeticLayoutDimension;
  [(NSLayoutAnchor *)&v3 dealloc];
}

- (_NSArithmeticLayoutDimension)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_NSArithmeticLayoutDimension;
  v5 = -[NSLayoutAnchor initWithCoder:](&v14, sel_initWithCoder_);
  if (v5)
  {
    objc_super v6 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_firstChildAnchor"];
    if (!v6) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"NSDerivativeLayoutAnchor.m", 52, @"%@ decoded with empty root dimension", v5);
    }
    v5->_rootLayoutDimension = (NSLayoutDimension *)[v6 copy];
    int v7 = [a3 containsValueForKey:@"NSLayoutAnchor_multiplier"];
    double v8 = 1.0;
    if (v7)
    {
      objc_msgSend(a3, "decodeFloatForKey:", @"NSLayoutAnchor_multiplier", 1.0);
      double v8 = v9;
    }
    v5->_multiplier = v8;
    int v10 = [a3 containsValueForKey:@"NSLayoutAnchor_constant"];
    double v11 = 0.0;
    if (v10)
    {
      objc_msgSend(a3, "decodeFloatForKey:", @"NSLayoutAnchor_constant", 0.0);
      double v11 = v12;
    }
    v5->_constant = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NSArithmeticLayoutDimension;
  -[NSLayoutAnchor encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [a3 encodeObject:self->_rootLayoutDimension forKey:@"NSLayoutAnchor_firstChildAnchor"];
  double multiplier = self->_multiplier;
  if (multiplier != 1.0)
  {
    *(float *)&double multiplier = multiplier;
    [a3 encodeFloat:@"NSLayoutAnchor_multiplier" forKey:multiplier];
  }
  double constant = self->_constant;
  if (constant != 0.0)
  {
    *(float *)&double constant = constant;
    [a3 encodeFloat:@"NSLayoutAnchor_constant" forKey:constant];
  }
}

- (id)_nearestAncestorLayoutItem
{
  return [(NSLayoutAnchor *)self->_rootLayoutDimension _nearestAncestorLayoutItem];
}

- (id)_expressionInContext:(id *)a3
{
  rootLayoutDimension = self->_rootLayoutDimension;
  $2DD436A466EE1EEA4ACD552B66BBE03E v9 = *a3;
  id v6 = [(NSLayoutAnchor *)rootLayoutDimension _expressionInContext:&v9];
  id v7 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", [v6 variableCount], a3->var2);
  [v7 addExpression:v6 times:self->_multiplier];
  [v7 incrementConstant:self->_constant];
  return v7;
}

- (double)_valueInEngine:(id)a3
{
  double multiplier = self->_multiplier;
  [(NSLayoutAnchor *)self->_rootLayoutDimension _valueInEngine:a3];
  return self->_constant + multiplier * v5;
}

- (id)equationDescription
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  v4 = v3;
  double multiplier = self->_multiplier;
  if (multiplier != 0.0)
  {
    if (multiplier < 0.0)
    {
      [v3 appendString:@"-"];
      double multiplier = self->_multiplier;
    }
    double v6 = fabs(multiplier);
    if (v6 != 1.0) {
      objc_msgSend(v4, "appendFormat:", @"%g*", *(void *)&v6);
    }
    [v4 appendFormat:@"%@", -[NSLayoutAnchor _equationDescriptionInParent](self->_rootLayoutDimension, "_equationDescriptionInParent")];
  }
  double constant = self->_constant;
  if (constant != 0.0)
  {
    double v8 = fabs(constant);
    if (constant >= 0.0) {
      $2DD436A466EE1EEA4ACD552B66BBE03E v9 = @"+%g";
    }
    else {
      $2DD436A466EE1EEA4ACD552B66BBE03E v9 = @"-%g";
    }
    objc_msgSend(v4, "appendFormat:", v9, *(void *)&v8);
  }
  [v4 appendString:@""]);
  int v10 = (void *)[v4 copy];
  return v10;
}

- (NSArray)_childAnchors
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_rootLayoutDimension;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

@end