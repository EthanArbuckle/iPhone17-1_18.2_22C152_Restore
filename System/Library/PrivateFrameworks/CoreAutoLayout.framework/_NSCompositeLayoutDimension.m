@interface _NSCompositeLayoutDimension
- (NSArray)_childAnchors;
- (_NSCompositeLayoutDimension)initWithAnchor:(id)a3;
- (_NSCompositeLayoutDimension)initWithCoder:(id)a3;
- (_NSCompositeLayoutDimension)initWithDimension:(id)a3 plusDimension:(id)a4;
- (_NSCompositeLayoutDimension)initWithDimension:(id)a3 plusDimension:(id)a4 times:(double)a5;
- (double)_valueInEngine:(id)a3;
- (id)_expressionInContext:(id *)a3;
- (id)equationDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSCompositeLayoutDimension

- (_NSCompositeLayoutDimension)initWithDimension:(id)a3 plusDimension:(id)a4 times:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_NSCompositeLayoutDimension;
  v8 = [(NSLayoutAnchor *)&v10 init];
  if (v8)
  {
    v8->_firstLayoutDimension = (NSLayoutDimension *)[a3 copy];
    v8->_secondLayoutDimensionMultiplier = a5;
    v8->_secondLayoutDimension = (NSLayoutDimension *)[a4 copy];
  }
  return v8;
}

- (_NSCompositeLayoutDimension)initWithAnchor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutDimension;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_firstLayoutDimension = (NSLayoutDimension *)[*((id *)a3 + 8) copy];
    v4->_secondLayoutDimensionMultiplier = *((double *)a3 + 9);
    v4->_secondLayoutDimension = (NSLayoutDimension *)[*((id *)a3 + 10) copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSCompositeLayoutDimension;
  [(NSLayoutAnchor *)&v3 dealloc];
}

- (_NSCompositeLayoutDimension)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_NSCompositeLayoutDimension;
  v5 = -[NSLayoutAnchor initWithCoder:](&v12, sel_initWithCoder_);
  if (v5)
  {
    objc_super v6 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_firstChildAnchor"];
    v7 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_secondChildAnchor"];
    if (!v6) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"NSDerivativeLayoutAnchor.m", 146, @"%@ decoded with empty first dimension", v5);
    }
    if (!v7) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"NSDerivativeLayoutAnchor.m", 147, @"%@ decoded with empty second dimension", v5);
    }
    v5->_firstLayoutDimension = (NSLayoutDimension *)[v6 copy];
    v5->_secondLayoutDimension = (NSLayoutDimension *)[v7 copy];
    int v8 = [a3 containsValueForKey:@"NSLayoutAnchor_multiplier"];
    double v9 = 1.0;
    if (v8)
    {
      objc_msgSend(a3, "decodeFloatForKey:", @"NSLayoutAnchor_multiplier", 1.0);
      double v9 = v10;
    }
    v5->_secondLayoutDimensionMultiplier = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSCompositeLayoutDimension;
  -[NSLayoutAnchor encodeWithCoder:](&v6, sel_encodeWithCoder_);
  [a3 encodeObject:self->_firstLayoutDimension forKey:@"NSLayoutAnchor_firstChildAnchor"];
  [a3 encodeObject:self->_secondLayoutDimension forKey:@"NSLayoutAnchor_secondChildAnchor"];
  double secondLayoutDimensionMultiplier = self->_secondLayoutDimensionMultiplier;
  if (secondLayoutDimensionMultiplier != 1.0)
  {
    *(float *)&double secondLayoutDimensionMultiplier = secondLayoutDimensionMultiplier;
    [a3 encodeFloat:@"NSLayoutAnchor_multiplier" forKey:secondLayoutDimensionMultiplier];
  }
}

- (_NSCompositeLayoutDimension)initWithDimension:(id)a3 plusDimension:(id)a4
{
  return [(_NSCompositeLayoutDimension *)self initWithDimension:a3 plusDimension:a4 times:1.0];
}

- (id)_expressionInContext:(id *)a3
{
  firstLayoutDimension = self->_firstLayoutDimension;
  $2DD436A466EE1EEA4ACD552B66BBE03E v11 = *a3;
  id v6 = [(NSLayoutAnchor *)firstLayoutDimension _expressionInContext:&v11];
  secondLayoutDimension = self->_secondLayoutDimension;
  $2DD436A466EE1EEA4ACD552B66BBE03E v11 = *a3;
  id v8 = [(NSLayoutAnchor *)secondLayoutDimension _expressionInContext:&v11];
  id v9 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", [v8 variableCount] + objc_msgSend(v6, "variableCount"), a3->var2);
  [v9 addExpression:v6 times:1.0];
  [v9 addExpression:v8 times:self->_secondLayoutDimensionMultiplier];
  return v9;
}

- (double)_valueInEngine:(id)a3
{
  -[NSLayoutAnchor _valueInEngine:](self->_firstLayoutDimension, "_valueInEngine:");
  double v6 = v5;
  double secondLayoutDimensionMultiplier = self->_secondLayoutDimensionMultiplier;
  [(NSLayoutAnchor *)self->_secondLayoutDimension _valueInEngine:a3];
  return v6 + secondLayoutDimensionMultiplier * v8;
}

- (id)equationDescription
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"(%@"), -[NSLayoutAnchor _equationDescriptionInParent](self->_firstLayoutDimension, "_equationDescriptionInParent");
  v4 = v3;
  double secondLayoutDimensionMultiplier = self->_secondLayoutDimensionMultiplier;
  if (secondLayoutDimensionMultiplier != 0.0)
  {
    if (secondLayoutDimensionMultiplier >= 0.0) {
      double v6 = @"+";
    }
    else {
      double v6 = @"-";
    }
    [v3 appendString:v6];
    double v7 = fabs(self->_secondLayoutDimensionMultiplier);
    if (v7 != 1.0) {
      objc_msgSend(v4, "appendFormat:", @"%g*", *(void *)&v7);
    }
    [v4 appendFormat:@"%@", -[NSLayoutAnchor _equationDescriptionInParent](self->_secondLayoutDimension, "_equationDescriptionInParent")];
  }
  [v4 appendString:@""]);
  double v8 = (void *)[v4 copy];
  return v8;
}

- (NSArray)_childAnchors
{
  v4[2] = *MEMORY[0x1E4F143B8];
  secondLayoutDimension = self->_secondLayoutDimension;
  v4[0] = self->_firstLayoutDimension;
  v4[1] = secondLayoutDimension;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
}

@end