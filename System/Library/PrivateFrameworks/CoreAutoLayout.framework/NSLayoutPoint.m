@interface NSLayoutPoint
+ (NSLayoutPoint)layoutPointWithXAxisAnchor:(id)a3 yAxisAnchor:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)valueInItem:(id)a3;
- (NSLayoutPoint)initWithCoder:(id)a3;
- (NSLayoutXAxisAnchor)xAxisAnchor;
- (NSLayoutYAxisAnchor)yAxisAnchor;
- (id)constraintsEqualToLayoutPoint:(id)a3;
- (id)layoutPointByOffsettingWithXOffset:(double)a3 yOffset:(double)a4;
- (id)layoutPointByOffsettingWithXOffsetDimension:(id)a3 yOffsetDimension:(id)a4;
- (id)ruleEqualToLayoutPoint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithXAxisAnchor:(void *)a3 yAxisAnchor:;
@end

@implementation NSLayoutPoint

- (id)ruleEqualToLayoutPoint:(id)a3
{
  v3 = -[NSLayoutPointRule initWithFirstLayoutPoint:secondLayoutPoint:]([NSLayoutPointRule alloc], self, a3);
  return v3;
}

- (void)initWithXAxisAnchor:(void *)a3 yAxisAnchor:
{
  v3 = a1;
  if (!a1) {
    return v3;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithXAxisAnchor_yAxisAnchor_, a1, @"NSLayoutGeometry.m", 27, @"Invalid parameter not satisfying: %@", @"xAxisAnchor != nil");
    if (a3) {
      goto LABEL_4;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithXAxisAnchor_yAxisAnchor_, v3, @"NSLayoutGeometry.m", 28, @"Invalid parameter not satisfying: %@", @"yAxisAnchor != nil");
LABEL_4:
  v7.receiver = v3;
  v7.super_class = (Class)NSLayoutPoint;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v3[1] = [a2 copy];
    v3[2] = [a3 copy];
  }
  return v3;
}

- (NSLayoutPoint)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSLayoutPoint;
  v4 = [(NSLayoutPoint *)&v6 init];
  if (v4)
  {
    v4->_xAxisAnchor = (NSLayoutXAxisAnchor *)(id)[a3 decodeObjectForKey:@"NSLayoutXAxisAnchor"];
    v4->_yAxisAnchor = (NSLayoutYAxisAnchor *)(id)[a3 decodeObjectForKey:@"NSLayoutYAxisAnchor"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_xAxisAnchor forKey:@"NSLayoutXAxisAnchor"];
  yAxisAnchor = self->_yAxisAnchor;
  [a3 encodeObject:yAxisAnchor forKey:@"NSLayoutYAxisAnchor"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutPoint;
  [(NSLayoutPoint *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(NSLayoutAnchor *)self->_xAxisAnchor isEqual:*((void *)a3 + 1)];
    if (v5)
    {
      yAxisAnchor = self->_yAxisAnchor;
      uint64_t v7 = *((void *)a3 + 2);
      LOBYTE(v5) = [(NSLayoutAnchor *)yAxisAnchor isEqual:v7];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (NSLayoutPoint)layoutPointWithXAxisAnchor:(id)a3 yAxisAnchor:(id)a4
{
  v4 = -[NSLayoutPoint initWithXAxisAnchor:yAxisAnchor:]([NSLayoutPoint alloc], a3, a4);
  return (NSLayoutPoint *)v4;
}

- (id)layoutPointByOffsettingWithXOffset:(double)a3 yOffset:(double)a4
{
  xAxisAnchor = self->_xAxisAnchor;
  if (a3 != 0.0) {
    xAxisAnchor = -[NSLayoutXAxisAnchor anchorByOffsettingWithConstant:](self->_xAxisAnchor, "anchorByOffsettingWithConstant:");
  }
  yAxisAnchor = self->_yAxisAnchor;
  if (a4 != 0.0) {
    yAxisAnchor = [(NSLayoutYAxisAnchor *)self->_yAxisAnchor anchorByOffsettingWithConstant:a4];
  }
  return +[NSLayoutPoint layoutPointWithXAxisAnchor:xAxisAnchor yAxisAnchor:yAxisAnchor];
}

- (id)layoutPointByOffsettingWithXOffsetDimension:(id)a3 yOffsetDimension:(id)a4
{
  xAxisAnchor = self->_xAxisAnchor;
  if (a3) {
    xAxisAnchor = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:](self->_xAxisAnchor, "anchorByOffsettingWithDimension:");
  }
  yAxisAnchor = self->_yAxisAnchor;
  if (a4) {
    yAxisAnchor = [(NSLayoutYAxisAnchor *)self->_yAxisAnchor anchorByOffsettingWithDimension:a4];
  }
  return +[NSLayoutPoint layoutPointWithXAxisAnchor:xAxisAnchor yAxisAnchor:yAxisAnchor];
}

- (id)constraintsEqualToLayoutPoint:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutPoint xAxisAnchor](self, "xAxisAnchor"), "constraintEqualToAnchor:", [a3 xAxisAnchor]);
  v6[1] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutPoint yAxisAnchor](self, "yAxisAnchor"), "constraintEqualToAnchor:", [a3 yAxisAnchor]);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
}

- (NSLayoutXAxisAnchor)xAxisAnchor
{
  return (NSLayoutXAxisAnchor *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutYAxisAnchor)yAxisAnchor
{
  return (NSLayoutYAxisAnchor *)objc_getProperty(self, a2, 16, 1);
}

- (CGPoint)valueInItem:(id)a3
{
  [(NSLayoutAnchor *)[(NSLayoutPoint *)self xAxisAnchor] valueInItem:a3];
  double v6 = v5;
  [(NSLayoutAnchor *)[(NSLayoutPoint *)self yAxisAnchor] valueInItem:a3];
  double v8 = v7;
  double v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

@end