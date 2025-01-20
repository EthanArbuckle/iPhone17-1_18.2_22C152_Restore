@interface NSLayoutPointRule
- (BOOL)isEqual:(id)a3;
- (NSLayoutPoint)firstLayoutPoint;
- (NSLayoutPoint)secondLayoutPoint;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (id)makeChildRules;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithFirstLayoutPoint:(void *)a3 secondLayoutPoint:;
@end

@implementation NSLayoutPointRule

- (void)initWithFirstLayoutPoint:(void *)a3 secondLayoutPoint:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)NSLayoutPointRule;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = [a2 copy];
    v5[2] = [a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutPointRule;
  [(NSLayoutPointRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSLayoutPoint *)self->_firstLayoutPoint hash];
  return [(NSLayoutPoint *)self->_secondLayoutPoint hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_10;
  }
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = [a3 isMemberOfClass:NSLayoutPointRule];
  if (v5)
  {
    firstLayoutPoint = self->_firstLayoutPoint;
    if (firstLayoutPoint == *((NSLayoutPoint **)a3 + 1)
      || (int v5 = -[NSLayoutPoint isEqual:](firstLayoutPoint, "isEqual:")) != 0)
    {
      secondLayoutPoint = self->_secondLayoutPoint;
      if (secondLayoutPoint != *((NSLayoutPoint **)a3 + 2))
      {
        LOBYTE(v5) = -[NSLayoutPoint isEqual:](secondLayoutPoint, "isEqual:");
        return v5;
      }
LABEL_10:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)makeChildRules
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = [(NSLayoutAnchor *)[(NSLayoutPoint *)self->_firstLayoutPoint xAxisAnchor] ruleEqualToAnchor:[(NSLayoutPoint *)self->_secondLayoutPoint xAxisAnchor]];
  v4[1] = [(NSLayoutAnchor *)[(NSLayoutPoint *)self->_firstLayoutPoint yAxisAnchor] ruleEqualToAnchor:[(NSLayoutPoint *)self->_secondLayoutPoint yAxisAnchor]];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
}

- (NSString)identifier
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[NSLayoutPointRule ruleDescription](self, "ruleDescription")];
}

- (NSString)ruleDescription
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v3, "addObject:", -[NSLayoutPoint description](self->_firstLayoutPoint, "description"));
  [v3 addObject:@"=="];
  objc_msgSend(v3, "addObject:", -[NSLayoutPoint description](self->_secondLayoutPoint, "description"));
  return (NSString *)[v3 componentsJoinedByString:@" "];
}

- (NSLayoutPoint)firstLayoutPoint
{
  return (NSLayoutPoint *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutPoint)secondLayoutPoint
{
  return (NSLayoutPoint *)objc_getProperty(self, a2, 16, 1);
}

@end