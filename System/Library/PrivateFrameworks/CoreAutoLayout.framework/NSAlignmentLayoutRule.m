@interface NSAlignmentLayoutRule
+ (id)alignmentWithAnchors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)alignedAnchors;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (id)makeChildRules;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithAlignedAnchors:(void *)a1;
@end

@implementation NSAlignmentLayoutRule

- (void)initWithAlignedAnchors:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)NSAlignmentLayoutRule;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = [a2 copy];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSAlignmentLayoutRule;
  [(NSAlignmentLayoutRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(NSArray *)self->_alignedAnchors hash];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_8;
  }
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = [a3 isMemberOfClass:NSAlignmentLayoutRule];
  if (v5)
  {
    alignedAnchors = self->_alignedAnchors;
    if (alignedAnchors != *((NSArray **)a3 + 1))
    {
      LOBYTE(v5) = -[NSArray isEqual:](alignedAnchors, "isEqual:");
      return v5;
    }
LABEL_8:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)alignmentWithAnchors:(id)a3
{
  v4 = [NSAlignmentLayoutRule alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NSAlignmentLayoutRule;
    int v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5) {
      v5[1] = [a3 copy];
    }
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (id)makeChildRules
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_alignedAnchors count];
  NSUInteger v4 = v3 - 1;
  if (v3 > 1)
  {
    objc_super v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    alignedAnchors = self->_alignedAnchors;
    uint64_t v9 = [(NSArray *)alignedAnchors countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v11 = 0;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(alignedAnchors);
          }
          if (v11) {
            objc_msgSend(v7, "addObject:", objc_msgSend(v11, "ruleEqualToAnchor:", *(void *)(*((void *)&v14 + 1) + 8 * i)));
          }
          else {
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          }
        }
        uint64_t v10 = [(NSArray *)alignedAnchors countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[NSAlignmentLayoutRule ruleDescription](self, "ruleDescription")];
}

- (NSString)ruleDescription
{
  id v2 = [(NSArray *)self->_alignedAnchors valueForKey:@"_equationDescriptionInParent"];
  return (NSString *)[v2 componentsJoinedByString:@" == "];
}

- (NSArray)alignedAnchors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

@end