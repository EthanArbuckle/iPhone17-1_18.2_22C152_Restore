@interface _NSDistanceLayoutDimension
+ (id)distanceFromAnchor:(id)a3 toAnchor:(id)a4;
- (NSArray)_childAnchors;
- (_NSDistanceLayoutDimension)initWithAnchor:(id)a3;
- (_NSDistanceLayoutDimension)initWithCoder:(id)a3;
- (_NSDistanceLayoutDimension)initWithMinuend:(id)a3 subtrahend:(id)a4;
- (double)_valueInEngine:(id)a3;
- (id)_expressionInContext:(id *)a3;
- (id)equationDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSDistanceLayoutDimension

+ (id)distanceFromAnchor:(id)a3 toAnchor:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithMinuend:a4 subtrahend:a3];
  return v4;
}

- (_NSDistanceLayoutDimension)initWithMinuend:(id)a3 subtrahend:(id)a4
{
  if (!a3 || !a4)
  {
    v9 = self;
    if (a3)
    {
      if (a4) {
        goto LABEL_10;
      }
    }
    else
    {
      if (a4) {
        goto LABEL_10;
      }
    }
    goto LABEL_10;
  }
  if ([a3 isCompatibleWithAnchor:a4])
  {
    v12.receiver = self;
    v12.super_class = (Class)_NSDistanceLayoutDimension;
    v8 = [(NSLayoutAnchor *)&v12 init];
    if (v8)
    {
      v8->_minuend = (NSLayoutAnchor *)[a3 copy];
      v8->_subtrahend = (NSLayoutAnchor *)[a4 copy];
    }
    return v8;
  }
  v10 = self;
LABEL_10:
  if (([a3 isCompatibleWithAnchor:a4] & 1) == 0) {
  return 0;
  }
}

- (_NSDistanceLayoutDimension)initWithAnchor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSDistanceLayoutDimension;
  v4 = -[NSLayoutAnchor initWithAnchor:](&v6, sel_initWithAnchor_);
  if (v4)
  {
    v4->_minuend = (NSLayoutAnchor *)[*((id *)a3 + 8) copy];
    v4->_subtrahend = (NSLayoutAnchor *)[*((id *)a3 + 9) copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSDistanceLayoutDimension;
  [(NSLayoutAnchor *)&v3 dealloc];
}

- (_NSDistanceLayoutDimension)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NSDistanceLayoutDimension;
  v5 = -[NSLayoutAnchor initWithCoder:](&v9, sel_initWithCoder_);
  if (v5)
  {
    objc_super v6 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_firstChildAnchor"];
    v7 = (void *)[a3 decodeObjectForKey:@"NSLayoutAnchor_secondChildAnchor"];
    if (!v6) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"NSDerivativeLayoutAnchor.m", 249, @"%@ decoded with empty first anchor (minuend)", v5);
    }
    if (!v7) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"NSDerivativeLayoutAnchor.m", 250, @"%@ decoded with empty second anchor (subtrahend)", v5);
    }
    v5->_minuend = (NSLayoutAnchor *)[v6 copy];
    v5->_subtrahend = (NSLayoutAnchor *)[v7 copy];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NSDistanceLayoutDimension;
  -[NSLayoutAnchor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_minuend forKey:@"NSLayoutAnchor_firstChildAnchor"];
  [a3 encodeObject:self->_subtrahend forKey:@"NSLayoutAnchor_secondChildAnchor"];
}

- (id)_expressionInContext:(id *)a3
{
  minuend = self->_minuend;
  $2DD436A466EE1EEA4ACD552B66BBE03E v18 = *a3;
  id v6 = [(NSLayoutAnchor *)minuend _expressionInContext:&v18];
  subtrahend = self->_subtrahend;
  $2DD436A466EE1EEA4ACD552B66BBE03E v18 = *a3;
  id v8 = [(NSLayoutAnchor *)subtrahend _expressionInContext:&v18];
  double v9 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    int64_t var0 = a3->var0;
    uint64_t v11 = [(NSLayoutAnchor *)self->_minuend _directionAbstraction];
    uint64_t v12 = [(NSLayoutAnchor *)self->_subtrahend _directionAbstraction];
    if (var0 != 1
      || (v11 != 1 ? (BOOL v13 = v12 == 1) : (BOOL v13 = 1),
          v13 ? (char v14 = 0) : (char v14 = 1),
          (double v9 = -1.0, v11) ? (v15 = v12 == 0) : (v15 = 1),
          !v15 && (v14 & 1) == 0))
    {
      double v9 = 1.0;
    }
  }
  id v16 = +[NSISLinearExpression newExpressionWithCapacity:engine:](NSISLinearExpression, "newExpressionWithCapacity:engine:", [v8 variableCount] + objc_msgSend(v6, "variableCount"), a3->var2);
  [v16 addExpression:v6 times:v9];
  [v16 addExpression:v8 times:-v9];
  return v16;
}

- (double)_valueInEngine:(id)a3
{
  -[NSLayoutAnchor _valueInEngine:](self->_minuend, "_valueInEngine:");
  double v6 = v5;
  [(NSLayoutAnchor *)self->_subtrahend _valueInEngine:a3];
  return v6 - v7;
}

- (id)equationDescription
{
  return (id)[NSString stringWithFormat:@"(%@ - %@)", -[NSLayoutAnchor _equationDescriptionInParent](self->_minuend, "_equationDescriptionInParent"), -[NSLayoutAnchor _equationDescriptionInParent](self->_subtrahend, "_equationDescriptionInParent")];
}

- (NSArray)_childAnchors
{
  v4[2] = *MEMORY[0x1E4F143B8];
  subtrahend = self->_subtrahend;
  v4[0] = self->_minuend;
  v4[1] = subtrahend;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
}

@end