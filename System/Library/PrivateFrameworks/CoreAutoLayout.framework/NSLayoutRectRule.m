@interface NSLayoutRectRule
- (BOOL)isEqual:(id)a3;
- (NSLayoutRect)firstLayoutRect;
- (NSLayoutRect)secondLayoutRect;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (id)makeChildRules;
- (int64_t)relation;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithFirstLayoutRect:(void *)a3 secondLayoutRect:;
- (void)initWithFirstLayoutRect:(void *)a3 secondLayoutRect:(uint64_t)a4 relation:;
- (void)setRelation:(int64_t)a3;
@end

@implementation NSLayoutRectRule

- (void)initWithFirstLayoutRect:(void *)a3 secondLayoutRect:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)NSLayoutRectRule;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = [a2 copy];
    v5[2] = [a3 copy];
    v5[3] = 0;
  }
  return v5;
}

- (void)initWithFirstLayoutRect:(void *)a3 secondLayoutRect:(uint64_t)a4 relation:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)NSLayoutRectRule;
  objc_super v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = [a2 copy];
    v7[2] = [a3 copy];
    v7[3] = a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutRectRule;
  [(NSLayoutRectRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSLayoutRect *)self->_firstLayoutRect hash];
  return [(NSLayoutRect *)self->_secondLayoutRect hash] - v3 + 32 * v3;
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
  int v5 = [a3 isMemberOfClass:NSLayoutRectRule];
  if (v5)
  {
    firstLayoutRect = self->_firstLayoutRect;
    if (firstLayoutRect == *((NSLayoutRect **)a3 + 1)
      || (int v5 = -[NSLayoutRect isEqual:](firstLayoutRect, "isEqual:")) != 0)
    {
      secondLayoutRect = self->_secondLayoutRect;
      if (secondLayoutRect != *((NSLayoutRect **)a3 + 2))
      {
        LOBYTE(v5) = -[NSLayoutRect isEqual:](secondLayoutRect, "isEqual:");
        return v5;
      }
LABEL_10:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

- (id)makeChildRules
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = [(NSLayoutAnchor *)[(NSLayoutRect *)self->_firstLayoutRect leadingAnchor] ruleEqualToAnchor:[(NSLayoutRect *)self->_secondLayoutRect leadingAnchor]];
  v4[1] = [(NSLayoutAnchor *)[(NSLayoutRect *)self->_firstLayoutRect leadingAnchor] ruleEqualToAnchor:[(NSLayoutRect *)self->_secondLayoutRect leadingAnchor]];
  v4[2] = [(NSLayoutAnchor *)[(NSLayoutRect *)self->_firstLayoutRect leadingAnchor] ruleEqualToAnchor:[(NSLayoutRect *)self->_secondLayoutRect leadingAnchor]];
  v4[3] = [(NSLayoutAnchor *)[(NSLayoutRect *)self->_firstLayoutRect leadingAnchor] ruleEqualToAnchor:[(NSLayoutRect *)self->_secondLayoutRect leadingAnchor]];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[NSLayoutRectRule ruleDescription](self, "ruleDescription")];
}

- (NSString)ruleDescription
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v3, "addObject:", -[NSLayoutRect description](self->_firstLayoutRect, "description"));
  int64_t relation = self->_relation;
  if (relation)
  {
    if (relation != 1) {
      goto LABEL_6;
    }
    int v5 = @"contains";
  }
  else
  {
    int v5 = @"==";
  }
  [v3 addObject:v5];
LABEL_6:
  objc_msgSend(v3, "addObject:", -[NSLayoutRect description](self->_secondLayoutRect, "description"));
  return (NSString *)[v3 componentsJoinedByString:@" "];
}

- (NSLayoutRect)firstLayoutRect
{
  return (NSLayoutRect *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutRect)secondLayoutRect
{
  return (NSLayoutRect *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)relation
{
  return self->_relation;
}

- (void)setRelation:(int64_t)a3
{
  self->_int64_t relation = a3;
}

@end