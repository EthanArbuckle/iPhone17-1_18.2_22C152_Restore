@interface NSLayoutRect
+ (NSLayoutRect)layoutRectWithCenterLayoutPoint:(id)a3 widthAnchor:(id)a4 heightAnchor:(id)a5;
+ (NSLayoutRect)layoutRectWithCenterXAnchor:(void *)a3 centerYAnchor:(uint64_t)a4 widthAnchor:(uint64_t)a5 heightAnchor:;
+ (NSLayoutRect)layoutRectWithLeadingAnchor:(id)a3 topAnchor:(id)a4 trailingAnchor:(id)a5 bottomAnchor:(id)a6;
+ (NSLayoutRect)layoutRectWithLeadingAnchor:(id)a3 topAnchor:(id)a4 widthAnchor:(id)a5 heightAnchor:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)nsli_isLegalConstraintItem;
- (CGRect)valueInItem:(id)a3;
- (NSLayoutDimension)heightAnchor;
- (NSLayoutDimension)widthAnchor;
- (NSLayoutPoint)centerLayoutPoint;
- (NSLayoutRect)_rectangleBySlicingWithDimension:(uint64_t)a3 plusConstant:(double)a4 fromEdge:;
- (NSLayoutRect)initWithCoder:(id)a3;
- (NSLayoutRect)initWithLeadingAnchor:(id)a3 topAnchor:(id)a4 widthAnchor:(id)a5 heightAnchor:(id)a6;
- (NSLayoutRect)layoutRectWithName:(id)a3;
- (NSLayoutXAxisAnchor)centerXAnchor;
- (NSLayoutXAxisAnchor)leadingAnchor;
- (NSLayoutXAxisAnchor)trailingAnchor;
- (NSLayoutYAxisAnchor)bottomAnchor;
- (NSLayoutYAxisAnchor)centerYAnchor;
- (NSLayoutYAxisAnchor)topAnchor;
- (id)_equationDescriptionInParent;
- (id)constraintsContainingWithinLayoutRect:(id)a3;
- (id)constraintsEqualToLayoutRect:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)layoutRectByInsettingTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6;
- (id)layoutRectByInsettingTopWithDimension:(id)a3 leadingWithDimension:(id)a4 bottomWithDimension:(id)a5 trailingWithDimension:(id)a6;
- (id)layoutRectBySlicingWithDimension:(id)a3 fromEdge:(int64_t)a4;
- (id)layoutRectBySlicingWithDistance:(double)a3 fromEdge:(int64_t)a4;
- (id)layoutRectBySlicingWithProportion:(double)a3 fromEdge:(int64_t)a4;
- (id)nsli_superitem;
- (id)observableValueInItem:(id)a3;
- (id)ruleContainingLayoutRect:(id)a3;
- (id)ruleEqualToLayoutRect:(id)a3;
- (uint64_t)isEqualToRectangle:(uint64_t)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithLeadingAnchor:(void *)a3 topAnchor:(void *)a4 widthAnchor:(void *)a5 heightAnchor:(void *)a6 name:;
@end

@implementation NSLayoutRect

- (id)nsli_superitem
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "_nearestAncestorLayoutItem"), "nsli_ancestorSharedWithItem:", -[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect topAnchor](self, "topAnchor"), "_nearestAncestorLayoutItem")), "nsli_ancestorSharedWithItem:", -[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect widthAnchor](self, "widthAnchor"), "_nearestAncestorLayoutItem")), "nsli_ancestorSharedWithItem:", -[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect heightAnchor](self, "heightAnchor"), "_nearestAncestorLayoutItem"));
  return (id)objc_msgSend(v2, "nsli_superitem");
}

- (BOOL)nsli_isLegalConstraintItem
{
  return 1;
}

- (id)ruleEqualToLayoutRect:(id)a3
{
  v3 = -[NSLayoutRectRule initWithFirstLayoutRect:secondLayoutRect:]([NSLayoutRectRule alloc], self, a3);
  return v3;
}

- (id)ruleContainingLayoutRect:(id)a3
{
  v3 = -[NSLayoutRectRule initWithFirstLayoutRect:secondLayoutRect:relation:]([NSLayoutRectRule alloc], self, a3, 1);
  return v3;
}

- (NSLayoutRect)initWithLeadingAnchor:(id)a3 topAnchor:(id)a4 widthAnchor:(id)a5 heightAnchor:(id)a6
{
  return (NSLayoutRect *)-[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:name:](self, a3, a4, a5, a6, 0);
}

- (void)initWithLeadingAnchor:(void *)a3 topAnchor:(void *)a4 widthAnchor:(void *)a5 heightAnchor:(void *)a6 name:
{
  v6 = a1;
  if (!a1) {
    return v6;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, a1, @"NSLayoutGeometry.m", 129, @"Invalid parameter not satisfying: %@", @"leading != nil");
    if (a3)
    {
LABEL_4:
      if (a4) {
        goto LABEL_5;
      }
LABEL_16:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, v6, @"NSLayoutGeometry.m", 131, @"Invalid parameter not satisfying: %@", @"width != nil");
      if (a5) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, v6, @"NSLayoutGeometry.m", 130, @"Invalid parameter not satisfying: %@", @"top != nil");
  if (!a4) {
    goto LABEL_16;
  }
LABEL_5:
  if (a5) {
    goto LABEL_6;
  }
LABEL_17:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, v6, @"NSLayoutGeometry.m", 132, @"Invalid parameter not satisfying: %@", @"height != nil");
LABEL_6:
  v14.receiver = v6;
  v14.super_class = (Class)NSLayoutRect;
  v6 = objc_msgSendSuper2(&v14, sel_init);
  if (v6)
  {
    if (![a6 length]) {
      a6 = 0;
    }
    if (a6)
    {
      v6[1] = (id)[a2 anchorWithName:objc_msgSend(NSString, "stringWithFormat:", @"%@.leading", a6)];
      v6[2] = (id)[a3 anchorWithName:objc_msgSend(NSString, "stringWithFormat:", @"%@.top", a6)];
      v6[4] = (id)[a4 anchorWithName:objc_msgSend(NSString, "stringWithFormat:", @"%@.width", a6)];
      id v12 = (id)[a5 anchorWithName:objc_msgSend(NSString, "stringWithFormat:", @"%@.height", a6)];
    }
    else
    {
      v6[1] = [a2 copy];
      v6[2] = [a3 copy];
      v6[4] = [a4 copy];
      id v12 = (id)[a5 copy];
    }
    v6[3] = v12;
    v6[5] = [a6 copy];
  }
  return v6;
}

- (NSLayoutRect)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSLayoutRect;
  v4 = [(NSLayoutRect *)&v6 init];
  if (v4)
  {
    v4->_leadingAnchor = (NSLayoutXAxisAnchor *)(id)[a3 decodeObjectForKey:@"NSLayoutLeadingAnchor"];
    v4->_topAnchor = (NSLayoutYAxisAnchor *)(id)[a3 decodeObjectForKey:@"NSLayoutTopAnchor"];
    v4->_widthAnchor = (NSLayoutDimension *)(id)[a3 decodeObjectForKey:@"NSLayoutWidthAnchor"];
    v4->_heightAnchor = (NSLayoutDimension *)(id)[a3 decodeObjectForKey:@"NSLayoutHeightAnchor"];
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"NSLayoutName"), "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_leadingAnchor forKey:@"NSLayoutLeadingAnchor"];
  [a3 encodeObject:self->_topAnchor forKey:@"NSLayoutTopAnchor"];
  [a3 encodeObject:self->_widthAnchor forKey:@"NSLayoutWidthAnchor"];
  [a3 encodeObject:self->_heightAnchor forKey:@"NSLayoutHeightAnchor"];
  if (self->_name)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutRect;
  [(NSLayoutRect *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return -[NSLayoutRect isEqualToRectangle:]((uint64_t)self, a3);
}

- (uint64_t)isEqualToRectangle:(uint64_t)result
{
  if (result)
  {
    objc_super v3 = (void *)result;
    result = objc_msgSend((id)objc_msgSend((id)result, "leadingAnchor"), "isEqual:", objc_msgSend(a2, "leadingAnchor"));
    if (result)
    {
      result = objc_msgSend((id)objc_msgSend(v3, "topAnchor"), "isEqual:", objc_msgSend(a2, "topAnchor"));
      if (result)
      {
        result = objc_msgSend((id)objc_msgSend(v3, "widthAnchor"), "isEqual:", objc_msgSend(a2, "widthAnchor"));
        if (result)
        {
          result = objc_msgSend((id)objc_msgSend(v3, "heightAnchor"), "isEqual:", objc_msgSend(a2, "heightAnchor"));
          if (result)
          {
            uint64_t v4 = v3[5];
            uint64_t v5 = a2[5];
            if (v4 == v5)
            {
              return 1;
            }
            else
            {
              result = 0;
              if (v4 && v5)
              {
                objc_super v6 = (void *)v3[5];
                return objc_msgSend(v6, "isEqualToString:");
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)description
{
  if (self->_name)
  {
    objc_super v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    return (id)[v3 stringWithFormat:@"<%@:%p '%@'>", NSStringFromClass(v4), self, self->_name];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSLayoutRect;
    return [(NSLayoutRect *)&v6 description];
  }
}

- (id)debugDescription
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSLayoutRect description](self, "description"), "stringByAppendingFormat:", @"\n -Leading: %@", -[NSLayoutRect leadingAnchor](self, "leadingAnchor")), "stringByAppendingFormat:", @"\n -Width: %@", -[NSLayoutRect widthAnchor](self, "widthAnchor")), "stringByAppendingFormat:", @"\n -Top: %@", -[NSLayoutRect topAnchor](self, "topAnchor")), "stringByAppendingFormat:", @"\n -Height: %@", -[NSLayoutRect heightAnchor](self, "heightAnchor"));
}

- (id)_equationDescriptionInParent
{
  name = self->_name;
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (name) {
    return (id)[v4 stringWithFormat:@"%@:%p'%@'", v5, self, self->_name];
  }
  else {
    return (id)[v4 stringWithFormat:@"%@:%p", v5, self, v7];
  }
}

- (NSLayoutYAxisAnchor)topAnchor
{
  v2 = self->_topAnchor;
  return v2;
}

- (NSLayoutYAxisAnchor)centerYAnchor
{
  result = [(NSLayoutYAxisAnchor *)self->_topAnchor anchorByOffsettingWithDimension:self->_heightAnchor multiplier:0.5 constant:0.0];
  uint64_t v4 = result;
  if (self->_name)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@.centerY", self->_name];
    return [(NSLayoutAnchor *)v4 anchorWithName:v5];
  }
  return result;
}

- (NSLayoutYAxisAnchor)bottomAnchor
{
  result = [(NSLayoutYAxisAnchor *)self->_topAnchor anchorByOffsettingWithDimension:self->_heightAnchor multiplier:1.0 constant:0.0];
  uint64_t v4 = result;
  if (self->_name)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@.bottom", self->_name];
    return [(NSLayoutAnchor *)v4 anchorWithName:v5];
  }
  return result;
}

- (NSLayoutXAxisAnchor)leadingAnchor
{
  v2 = self->_leadingAnchor;
  return v2;
}

- (NSLayoutXAxisAnchor)centerXAnchor
{
  result = [(NSLayoutXAxisAnchor *)self->_leadingAnchor anchorByOffsettingWithDimension:self->_widthAnchor multiplier:0.5 constant:0.0];
  uint64_t v4 = result;
  if (self->_name)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@.centerX", self->_name];
    return [(NSLayoutAnchor *)v4 anchorWithName:v5];
  }
  return result;
}

- (NSLayoutXAxisAnchor)trailingAnchor
{
  result = [(NSLayoutXAxisAnchor *)self->_leadingAnchor anchorByOffsettingWithDimension:self->_widthAnchor multiplier:1.0 constant:0.0];
  uint64_t v4 = result;
  if (self->_name)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@.trailing", self->_name];
    return [(NSLayoutAnchor *)v4 anchorWithName:v5];
  }
  return result;
}

- (NSLayoutDimension)widthAnchor
{
  v2 = self->_widthAnchor;
  return v2;
}

- (NSLayoutDimension)heightAnchor
{
  v2 = self->_heightAnchor;
  return v2;
}

- (NSLayoutPoint)centerLayoutPoint
{
  objc_super v3 = [(NSLayoutRect *)self centerXAnchor];
  uint64_t v4 = [(NSLayoutRect *)self centerYAnchor];
  return +[NSLayoutPoint layoutPointWithXAxisAnchor:v3 yAxisAnchor:v4];
}

+ (NSLayoutRect)layoutRectWithLeadingAnchor:(id)a3 topAnchor:(id)a4 widthAnchor:(id)a5 heightAnchor:(id)a6
{
  objc_super v6 = [[NSLayoutRect alloc] initWithLeadingAnchor:a3 topAnchor:a4 widthAnchor:a5 heightAnchor:a6];
  return v6;
}

+ (NSLayoutRect)layoutRectWithLeadingAnchor:(id)a3 topAnchor:(id)a4 trailingAnchor:(id)a5 bottomAnchor:(id)a6
{
  objc_super v6 = -[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:]([NSLayoutRect alloc], "initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", a3, a4, [a3 anchorWithOffsetToAnchor:a5], objc_msgSend(a4, "anchorWithOffsetToAnchor:", a6));
  return v6;
}

+ (NSLayoutRect)layoutRectWithCenterXAnchor:(void *)a3 centerYAnchor:(uint64_t)a4 widthAnchor:(uint64_t)a5 heightAnchor:
{
  self;
  v9 = -[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:]([NSLayoutRect alloc], "initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", [a2 anchorByOffsettingWithDimension:a4 multiplier:-0.5 constant:0.0], objc_msgSend(a3, "anchorByOffsettingWithDimension:multiplier:constant:", a5, -0.5, 0.0), a4, a5);
  return v9;
}

+ (NSLayoutRect)layoutRectWithCenterLayoutPoint:(id)a3 widthAnchor:(id)a4 heightAnchor:(id)a5
{
  v8 = (void *)[a3 xAxisAnchor];
  v9 = (void *)[a3 yAxisAnchor];
  return +[NSLayoutRect layoutRectWithCenterXAnchor:centerYAnchor:widthAnchor:heightAnchor:]((uint64_t)NSLayoutRect, v8, v9, (uint64_t)a4, (uint64_t)a5);
}

- (id)layoutRectByInsettingTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6
{
  v11 = [(NSLayoutRect *)self topAnchor];
  uint64_t v12 = (uint64_t)v11;
  if (a3 != 0.0) {
    uint64_t v12 = [(NSLayoutYAxisAnchor *)v11 anchorByOffsettingWithConstant:a3];
  }
  v13 = [(NSLayoutRect *)self leadingAnchor];
  uint64_t v14 = (uint64_t)v13;
  if (a4 != 0.0) {
    uint64_t v14 = [(NSLayoutXAxisAnchor *)v13 anchorByOffsettingWithConstant:a4];
  }
  v15 = [(NSLayoutRect *)self bottomAnchor];
  uint64_t v16 = (uint64_t)v15;
  if (a5 != 0.0) {
    uint64_t v16 = [(NSLayoutYAxisAnchor *)v15 anchorByOffsettingWithConstant:-a5];
  }
  v17 = [(NSLayoutRect *)self trailingAnchor];
  uint64_t v18 = (uint64_t)v17;
  if (a6 != 0.0) {
    uint64_t v18 = [(NSLayoutXAxisAnchor *)v17 anchorByOffsettingWithConstant:-a6];
  }
  v19 = objc_opt_class();
  return (id)[v19 layoutRectWithLeadingAnchor:v14 topAnchor:v12 trailingAnchor:v18 bottomAnchor:v16];
}

- (id)layoutRectByInsettingTopWithDimension:(id)a3 leadingWithDimension:(id)a4 bottomWithDimension:(id)a5 trailingWithDimension:(id)a6
{
  v11 = [(NSLayoutRect *)self topAnchor];
  uint64_t v12 = (uint64_t)v11;
  if (a3) {
    uint64_t v12 = [(NSLayoutYAxisAnchor *)v11 anchorByOffsettingWithDimension:a3];
  }
  v13 = [(NSLayoutRect *)self leadingAnchor];
  uint64_t v14 = (uint64_t)v13;
  if (a4) {
    uint64_t v14 = [(NSLayoutXAxisAnchor *)v13 anchorByOffsettingWithDimension:a4];
  }
  v15 = [(NSLayoutRect *)self bottomAnchor];
  uint64_t v16 = (uint64_t)v15;
  if (a5) {
    uint64_t v16 = [(NSLayoutYAxisAnchor *)v15 anchorByOffsettingWithDimension:a5 multiplier:-1.0 constant:0.0];
  }
  v17 = [(NSLayoutRect *)self trailingAnchor];
  uint64_t v18 = (uint64_t)v17;
  if (a6) {
    uint64_t v18 = [(NSLayoutXAxisAnchor *)v17 anchorByOffsettingWithDimension:a6 multiplier:-1.0 constant:0.0];
  }
  v19 = objc_opt_class();
  return (id)[v19 layoutRectWithLeadingAnchor:v14 topAnchor:v12 trailingAnchor:v18 bottomAnchor:v16];
}

- (NSLayoutRect)_rectangleBySlicingWithDimension:(uint64_t)a3 plusConstant:(double)a4 fromEdge:
{
  if (result)
  {
    objc_super v6 = result;
    switch(a3)
    {
      case 0:
        uint64_t v7 = [(NSLayoutRect *)result leadingAnchor];
        uint64_t v8 = [(NSLayoutRect *)v6 widthAnchor];
        uint64_t v9 = [(NSLayoutRect *)v6 topAnchor];
        if (a2) {
          goto LABEL_9;
        }
        goto LABEL_15;
      case 1:
        uint64_t v9 = [(NSLayoutRect *)result topAnchor];
        uint64_t v10 = [(NSLayoutRect *)v6 heightAnchor];
        uint64_t v7 = [(NSLayoutRect *)v6 leadingAnchor];
        if (!a2) {
          goto LABEL_18;
        }
        goto LABEL_12;
      case 2:
        uint64_t v7 = [(NSLayoutRect *)result leadingAnchor];
        uint64_t v8 = [(NSLayoutRect *)v6 widthAnchor];
        v11 = [(NSLayoutRect *)v6 bottomAnchor];
        if (a2)
        {
          uint64_t v9 = [(NSLayoutYAxisAnchor *)v11 anchorByOffsettingWithDimension:a2 multiplier:-1.0 constant:-a4];
LABEL_9:
          id v12 = a2;
        }
        else
        {
          uint64_t v9 = [(NSLayoutYAxisAnchor *)v11 anchorByOffsettingWithConstant:-a4];
LABEL_15:
          id v12 = [(NSLayoutDimension *)[(NSLayoutRect *)v6 heightAnchor] anchorByMultiplyingByConstant:0.0];
        }
        uint64_t v10 = [v12 anchorByAddingConstant:a4];
        goto LABEL_20;
      case 3:
        uint64_t v9 = [(NSLayoutRect *)result topAnchor];
        uint64_t v10 = [(NSLayoutRect *)v6 heightAnchor];
        v13 = [(NSLayoutRect *)v6 trailingAnchor];
        if (a2)
        {
          uint64_t v7 = [(NSLayoutXAxisAnchor *)v13 anchorByOffsettingWithDimension:a2 multiplier:-1.0 constant:-a4];
LABEL_12:
          id v14 = a2;
        }
        else
        {
          uint64_t v7 = [(NSLayoutXAxisAnchor *)v13 anchorByOffsettingWithConstant:-a4];
LABEL_18:
          id v14 = [(NSLayoutDimension *)[(NSLayoutRect *)v6 widthAnchor] anchorByMultiplyingByConstant:0.0];
        }
        uint64_t v8 = [v14 anchorByAddingConstant:a4];
LABEL_20:
        result = +[NSLayoutRect layoutRectWithLeadingAnchor:v7 topAnchor:v9 widthAnchor:v8 heightAnchor:v10];
        break;
      default:
        uint64_t v7 = 0;
        uint64_t v9 = 0;
        uint64_t v8 = 0;
        uint64_t v10 = 0;
        goto LABEL_20;
    }
  }
  return result;
}

- (id)layoutRectBySlicingWithDistance:(double)a3 fromEdge:(int64_t)a4
{
  return -[NSLayoutRect _rectangleBySlicingWithDimension:plusConstant:fromEdge:](self, 0, a4, a3);
}

- (id)layoutRectBySlicingWithDimension:(id)a3 fromEdge:(int64_t)a4
{
  return -[NSLayoutRect _rectangleBySlicingWithDimension:plusConstant:fromEdge:](self, a3, a4, 0.0);
}

- (id)layoutRectBySlicingWithProportion:(double)a3 fromEdge:(int64_t)a4
{
  uint64_t v15 = v8;
  uint64_t v16 = v5;
  uint64_t v17 = v4;
  id v12 = self;
  switch(a4)
  {
    case 0:
    case 2:
      v13 = (void *)[self heightAnchor];
      goto LABEL_4;
    case 1:
    case 3:
      v13 = (void *)[self widthAnchor];
LABEL_4:
      uint64_t v14 = objc_msgSend(v13, "anchorByMultiplyingByConstant:", a3, v9, v15, v16, v17, v6);
      self = (id)[v12 layoutRectBySlicingWithDimension:v14 fromEdge:a4];
      break;
    default:
      return self;
  }
  return self;
}

- (id)constraintsEqualToLayoutRect:(id)a3
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "constraintEqualToAnchor:", [a3 leadingAnchor]);
  v6[1] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect trailingAnchor](self, "trailingAnchor"), "constraintEqualToAnchor:", [a3 trailingAnchor]);
  v6[2] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect topAnchor](self, "topAnchor"), "constraintEqualToAnchor:", [a3 topAnchor]);
  v6[3] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect bottomAnchor](self, "bottomAnchor"), "constraintEqualToAnchor:", [a3 bottomAnchor]);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
}

- (id)constraintsContainingWithinLayoutRect:(id)a3
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = -[NSLayoutAnchor constraintGreaterThanOrEqualToAnchor:](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "constraintGreaterThanOrEqualToAnchor:", [a3 leadingAnchor]);
  v6[1] = -[NSLayoutAnchor constraintLessThanOrEqualToAnchor:](-[NSLayoutRect trailingAnchor](self, "trailingAnchor"), "constraintLessThanOrEqualToAnchor:", [a3 trailingAnchor]);
  v6[2] = -[NSLayoutAnchor constraintGreaterThanOrEqualToAnchor:](-[NSLayoutRect topAnchor](self, "topAnchor"), "constraintGreaterThanOrEqualToAnchor:", [a3 topAnchor]);
  v6[3] = -[NSLayoutAnchor constraintLessThanOrEqualToAnchor:](-[NSLayoutRect bottomAnchor](self, "bottomAnchor"), "constraintLessThanOrEqualToAnchor:", [a3 bottomAnchor]);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
}

- (NSLayoutRect)layoutRectWithName:(id)a3
{
  objc_super v3 = -[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:name:]([NSLayoutRect alloc], self->_leadingAnchor, self->_topAnchor, self->_widthAnchor, self->_heightAnchor, a3);
  return (NSLayoutRect *)v3;
}

- (CGRect)valueInItem:(id)a3
{
  [(NSLayoutAnchor *)[(NSLayoutRect *)self leadingAnchor] valueInItem:a3];
  double v6 = v5;
  [(NSLayoutAnchor *)[(NSLayoutRect *)self trailingAnchor] valueInItem:a3];
  double v8 = v7;
  [(NSLayoutAnchor *)[(NSLayoutRect *)self topAnchor] valueInItem:a3];
  double v10 = v9;
  [(NSLayoutAnchor *)[(NSLayoutRect *)self bottomAnchor] valueInItem:a3];
  double v12 = v11;
  double v13 = v8 - v6;
  double v14 = v6 - v8;
  if (v6 <= v8)
  {
    double v15 = v8 - v6;
  }
  else
  {
    double v6 = v8;
    double v15 = v14;
  }
  int v16 = objc_msgSend(a3, "nsli_isFlipped", v13);
  if (v16) {
    double v17 = v10;
  }
  else {
    double v17 = v12;
  }
  if (v16) {
    double v18 = v12 - v10;
  }
  else {
    double v18 = v10 - v12;
  }
  double v19 = v6;
  double v20 = v15;
  result.size.height = v18;
  result.size.width = v20;
  result.origin.y = v17;
  result.origin.x = v19;
  return result;
}

- (id)observableValueInItem:(id)a3
{
  if (!objc_msgSend(a3, "nsli_layoutEngine")) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutGeometry.m", 416, @"Requires layout item to have layout engine");
  }
  return +[_NSLayoutRectObservable observableForRect:self inItem:a3];
}

@end