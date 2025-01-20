@interface NSStackInContainerRule
+ (id)horizontalStackWithRects:(id)a3 inContainer:(id)a4 spacing:(double)a5;
+ (id)stackWithOrientation:(int64_t)a3 stackedRects:(id)a4 inContainer:(id)a5 spacing:(double)a6;
+ (id)verticalStackWithRects:(id)a3 inContainer:(id)a4 spacing:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)stackedRects;
- (NSLayoutRect)containingRect;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (double)initWithOrientation:(void *)a3 stackedRects:(void *)a4 containingRect:(double)a5 spacing:;
- (double)spacing;
- (id)makeChildRules;
- (int64_t)orientation;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSStackInContainerRule

- (double)initWithOrientation:(void *)a3 stackedRects:(void *)a4 containingRect:(double)a5 spacing:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)NSStackInContainerRule;
  v9 = (double *)objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    *((void *)v9 + 4) = a2;
    *((void *)v9 + 1) = [a3 copy];
    *((void *)v10 + 2) = [a4 copy];
    v10[3] = a5;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSStackInContainerRule;
  [(NSStackInContainerRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  int64_t orientation = self->_orientation;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_spacing), "hash")
     - orientation
     + 32 * orientation;
  uint64_t v5 = [(NSLayoutRect *)self->_containingRect hash] - v4 + 32 * v4;
  return [(NSArray *)self->_stackedRects hash] - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_12;
  }
  if (!a3) {
    goto LABEL_13;
  }
  int v5 = [a3 isMemberOfClass:NSStackInContainerRule];
  if (!v5) {
    return v5;
  }
  if (self->_orientation != *((void *)a3 + 4) || self->_spacing != *((double *)a3 + 3))
  {
LABEL_13:
    LOBYTE(v5) = 0;
    return v5;
  }
  containingRect = self->_containingRect;
  if (containingRect == *((NSLayoutRect **)a3 + 2) || (int v5 = -[NSLayoutRect isEqual:](containingRect, "isEqual:")) != 0)
  {
    stackedRects = self->_stackedRects;
    if (stackedRects != *((NSArray **)a3 + 1))
    {
      LOBYTE(v5) = -[NSArray isEqual:](stackedRects, "isEqual:");
      return v5;
    }
LABEL_12:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)stackWithOrientation:(int64_t)a3 stackedRects:(id)a4 inContainer:(id)a5 spacing:(double)a6
{
  v6 = -[NSStackInContainerRule initWithOrientation:stackedRects:containingRect:spacing:]([NSStackInContainerRule alloc], a3, a4, a5, a6);
  return v6;
}

+ (id)horizontalStackWithRects:(id)a3 inContainer:(id)a4 spacing:(double)a5
{
  return (id)[a1 stackWithOrientation:0 stackedRects:a3 inContainer:a4 spacing:a5];
}

+ (id)verticalStackWithRects:(id)a3 inContainer:(id)a4 spacing:(double)a5
{
  return (id)[a1 stackWithOrientation:1 stackedRects:a3 inContainer:a4 spacing:a5];
}

- (id)makeChildRules
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (self->_containingRect && [(NSArray *)[(NSStackInContainerRule *)self stackedRects] count])
  {
    id v3 = [(NSArray *)[(NSStackInContainerRule *)self stackedRects] firstObject];
    id v4 = [(NSArray *)[(NSStackInContainerRule *)self stackedRects] lastObject];
    int64_t v5 = [(NSStackInContainerRule *)self orientation];
    stackedRects = self->_stackedRects;
    double spacing = self->_spacing;
    if (v5)
    {
      v12[0] = +[NSStackLayoutRule verticalStackWithRects:stackedRects spacing:spacing];
      v12[1] = objc_msgSend((id)objc_msgSend(v3, "topAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect topAnchor](self->_containingRect, "topAnchor"));
      v12[2] = objc_msgSend((id)objc_msgSend(v4, "bottomAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect bottomAnchor](self->_containingRect, "bottomAnchor"));
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v12;
    }
    else
    {
      v13[0] = +[NSStackLayoutRule horizontalStackWithRects:stackedRects spacing:spacing];
      v13[1] = objc_msgSend((id)objc_msgSend(v3, "leadingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect leadingAnchor](self->_containingRect, "leadingAnchor"));
      v13[2] = objc_msgSend((id)objc_msgSend(v4, "trailingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect trailingAnchor](self->_containingRect, "trailingAnchor"));
      v8 = (void *)MEMORY[0x1E4F1C978];
      v9 = v13;
    }
    return (id)[v8 arrayWithObjects:v9 count:3];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v10 array];
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[NSStackInContainerRule ruleDescription](self, "ruleDescription")];
}

- (NSString)ruleDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v21 = self;
  stackedRects = self->_stackedRects;
  uint64_t v5 = [(NSArray *)stackedRects countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(stackedRects);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v10 = objc_opt_respondsToSelector();
        v11 = NSString;
        if (v10) {
          uint64_t v12 = [v9 _equationDescriptionInParent];
        }
        else {
          uint64_t v12 = [v9 description];
        }
        [v3 addObject:objc_msgSend(v11, "stringWithFormat:", @"[%@]", v12)];
      }
      uint64_t v6 = [(NSArray *)stackedRects countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  int64_t orientation = v21->_orientation;
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"-(%g)-", *(void *)&v21->_spacing);
  v15 = NSString;
  char v16 = objc_opt_respondsToSelector();
  containingRect = v21->_containingRect;
  if (v16) {
    uint64_t v18 = [(NSLayoutRect *)containingRect _equationDescriptionInParent];
  }
  else {
    uint64_t v18 = [(NSLayoutRect *)containingRect description];
  }
  if (orientation) {
    v19 = @"V:|";
  }
  else {
    v19 = @"H:|";
  }
  return (NSString *)[(id)-[__CFString stringByAppendingString:](v19 stringByAppendingString:objc_msgSend(v3, "componentsJoinedByString:", v14)), "stringByAppendingString:", objc_msgSend(v15, "stringWithFormat:", @"|, '|':%@", v18)];
}

- (NSArray)stackedRects
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)spacing
{
  return self->_spacing;
}

- (NSLayoutRect)containingRect
{
  return (NSLayoutRect *)objc_getProperty(self, a2, 16, 1);
}

@end