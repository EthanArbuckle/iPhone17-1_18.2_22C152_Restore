@interface NSStackLayoutRule
+ (id)horizontalStackWithRects:(id)a3 spacing:(double)a4;
+ (id)stackWithOrientation:(int64_t)a3 stackedRects:(id)a4 spacing:(double)a5;
+ (id)verticalStackWithRects:(id)a3 spacing:(double)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)stackedRects;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (double)initWithOrientation:(void *)a3 stackedRects:(double)a4 spacing:;
- (double)spacing;
- (id)makeChildRules;
- (int64_t)orientation;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSStackLayoutRule

- (double)initWithOrientation:(void *)a3 stackedRects:(double)a4 spacing:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)NSStackLayoutRule;
  v7 = (double *)objc_msgSendSuper2(&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    *((void *)v7 + 3) = a2;
    *((void *)v7 + 1) = [a3 copy];
    v8[2] = a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSStackLayoutRule;
  [(NSStackLayoutRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  int64_t orientation = self->_orientation;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_spacing), "hash")
     - orientation
     + 32 * orientation;
  return [(NSArray *)self->_stackedRects hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_10;
  }
  if (!a3) {
    goto LABEL_11;
  }
  int v5 = [a3 isMemberOfClass:NSStackLayoutRule];
  if (!v5) {
    return v5;
  }
  if (self->_orientation != *((void *)a3 + 3) || self->_spacing != *((double *)a3 + 2))
  {
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  stackedRects = self->_stackedRects;
  if (stackedRects == *((NSArray **)a3 + 1))
  {
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  LOBYTE(v5) = -[NSArray isEqual:](stackedRects, "isEqual:");
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)stackWithOrientation:(int64_t)a3 stackedRects:(id)a4 spacing:(double)a5
{
  v8 = [NSStackLayoutRule alloc];
  if (v8)
  {
    v12.receiver = v8;
    v12.super_class = (Class)NSStackLayoutRule;
    v9 = objc_msgSendSuper2(&v12, sel_init);
    objc_super v10 = (double *)v9;
    if (v9)
    {
      v9[3] = a3;
      v9[1] = [a4 copy];
      v10[2] = a5;
    }
  }
  else
  {
    objc_super v10 = 0;
  }
  return v10;
}

+ (id)horizontalStackWithRects:(id)a3 spacing:(double)a4
{
  return (id)[a1 stackWithOrientation:0 stackedRects:a3 spacing:a4];
}

+ (id)verticalStackWithRects:(id)a3 spacing:(double)a4
{
  return (id)[a1 stackWithOrientation:1 stackedRects:a3 spacing:a4];
}

- (id)makeChildRules
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_stackedRects count];
  NSUInteger v4 = v3 - 1;
  if (v3 > 1)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    stackedRects = self->_stackedRects;
    uint64_t v9 = [(NSArray *)stackedRects countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v11 = 0;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        v14 = v11;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(stackedRects);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
          if (v14)
          {
            if ([(NSStackLayoutRule *)self orientation])
            {
              v15 = (void *)[v11 topAnchor];
              uint64_t v16 = [v14 bottomAnchor];
            }
            else
            {
              v15 = (void *)[v11 leadingAnchor];
              uint64_t v16 = [v14 trailingAnchor];
            }
            objc_msgSend(v7, "addObject:", objc_msgSend(v15, "ruleEqualToAnchor:constant:", v16, self->_spacing));
          }
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        uint64_t v10 = [(NSArray *)stackedRects countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
    return v7;
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1C978];
    return (id)objc_msgSend(v5, "array", v4);
  }
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[NSStackLayoutRule ruleDescription](self, "ruleDescription")];
}

- (NSString)ruleDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = self;
  stackedRects = self->_stackedRects;
  uint64_t v5 = [(NSArray *)stackedRects countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(stackedRects);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
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
      uint64_t v6 = [(NSArray *)stackedRects countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  if (v15->_orientation) {
    uint64_t v13 = @"V:";
  }
  else {
    uint64_t v13 = @"H:";
  }
  return (NSString *)-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", [v3 componentsJoinedByString:objc_msgSend(NSString, "stringWithFormat:", @"-(%g)-", *(void *)&v15->_spacing)]);
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

@end