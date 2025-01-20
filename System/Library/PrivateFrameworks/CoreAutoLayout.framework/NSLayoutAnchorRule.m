@interface NSLayoutAnchorRule
- (BOOL)isEqual:(id)a3;
- (NSLayoutAnchor)firstAnchor;
- (NSLayoutAnchor)secondAnchor;
- (NSString)description;
- (NSString)identifier;
- (NSString)ruleDescription;
- (double)constant;
- (double)initWithFirstAnchor:(void *)a1 secondAnchor:(void *)a2 relation:(void *)a3 multiplier:(uint64_t)a4 constant:(void *)a5 priority:(double)a6 identifier:(double)a7;
- (double)multiplier;
- (float)priority;
- (id)makeChildRules;
- (id)makeLayoutConstraint;
- (int64_t)relation;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSLayoutAnchorRule

- (double)initWithFirstAnchor:(void *)a1 secondAnchor:(void *)a2 relation:(void *)a3 multiplier:(uint64_t)a4 constant:(void *)a5 priority:(double)a6 identifier:(double)a7
{
  if (!a1) {
    return 0;
  }
  v15.receiver = a1;
  v15.super_class = (Class)NSLayoutAnchorRule;
  v13 = (double *)objc_msgSendSuper2(&v15, sel_init);
  if (v13)
  {
    *((void *)v13 + 1) = [a2 copy];
    *((void *)v13 + 2) = [a3 copy];
    *((void *)v13 + 3) = a4;
    v13[5] = a7;
    v13[6] = a6;
    *((void *)v13 + 4) = [a5 copy];
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutAnchorRule;
  [(NSLayoutAnchorRule *)&v3 dealloc];
}

- (unint64_t)hash
{
  return _NSLayoutConstraintComparableHash(1, 1, 0, self->_relation, [(NSLayoutAnchor *)self->_firstAnchor hash], [(NSLayoutAnchor *)self->_secondAnchor hash], [(NSString *)self->_identifier hash], 0, self->_constant, self->_multiplier, self->_priority, 0);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_17;
  }
  if (!a3) {
    goto LABEL_16;
  }
  int v5 = [a3 isMemberOfClass:NSLayoutAnchorRule];
  if (!v5) {
    return v5;
  }
  if (self->_relation != *((void *)a3 + 3)
    || self->_constant != *((double *)a3 + 5)
    || self->_multiplier != *((double *)a3 + 6)
    || self->_priority != *((float *)a3 + 14))
  {
LABEL_16:
    LOBYTE(v5) = 0;
    return v5;
  }
  firstAnchor = self->_firstAnchor;
  if (firstAnchor == *((NSLayoutAnchor **)a3 + 1) || (int v5 = -[NSLayoutAnchor isEqual:](firstAnchor, "isEqual:")) != 0)
  {
    secondAnchor = self->_secondAnchor;
    if (secondAnchor == *((NSLayoutAnchor **)a3 + 2)
      || (int v5 = -[NSLayoutAnchor isEqual:](secondAnchor, "isEqual:")) != 0)
    {
      identifier = self->_identifier;
      if (identifier != *((NSString **)a3 + 4))
      {
        LOBYTE(v5) = -[NSString isEqual:](identifier, "isEqual:");
        return v5;
      }
LABEL_17:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)makeLayoutConstraint
{
  objc_super v3 = +[NSLayoutConstraint constraintWithAnchor:self->_firstAnchor relatedBy:self->_relation toAnchor:self->_secondAnchor multiplier:self->_multiplier constant:self->_constant];
  v4 = v3;
  if (self->_identifier) {
    -[NSLayoutConstraint setIdentifier:](v3, "setIdentifier:");
  }
  return v4;
}

- (id)makeChildRules
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)description
{
  identifier = self->_identifier;
  v4 = NSString;
  int v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (identifier) {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p, %@ (%@)>", v6, self, self->_identifier, -[NSLayoutAnchorRule ruleDescription](self, "ruleDescription")];
  }
  else {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p, %@>", v6, self, -[NSLayoutAnchorRule ruleDescription](self, "ruleDescription"), v8];
  }
}

- (NSString)ruleDescription
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(NSLayoutAnchor *)self->_firstAnchor _equationDescriptionInParent];
  int v5 = &stru_1EFB3B738;
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", &stru_1EFB3B738, v4)];
  unint64_t v6 = self->_relation + 1;
  if (v6 > 2) {
    v7 = @"?=";
  }
  else {
    v7 = off_1E5C56800[v6];
  }
  [v3 addObject:v7];
  secondAnchor = self->_secondAnchor;
  if (secondAnchor)
  {
    double multiplier = self->_multiplier;
    if (multiplier < 0.0) {
      int v5 = @"-";
    }
    uint64_t v10 = [(NSLayoutAnchor *)secondAnchor _equationDescriptionInParent];
    double v11 = fabs(multiplier);
    if (v11 == 1.0) {
      uint64_t v12 = [NSString stringWithFormat:@"%@%@", v5, v10, v19];
    }
    else {
      uint64_t v12 = [NSString stringWithFormat:@"%@%g*%@", v5, *(void *)&v11, v10];
    }
    [v3 addObject:v12];
  }
  [(NSLayoutAnchorRule *)self constant];
  if (v13 != 0.0)
  {
    [(NSLayoutAnchorRule *)self constant];
    if (v14 >= 0.0) {
      objc_super v15 = @"+";
    }
    else {
      objc_super v15 = @"-";
    }
    [v3 addObject:v15];
    v16 = NSString;
    [(NSLayoutAnchorRule *)self constant];
    [v3 addObject:objc_msgSend(v16, "stringWithFormat:", @"%g", fabs(v17))];
  }
  return (NSString *)[v3 componentsJoinedByString:@" "];
}

- (NSLayoutAnchor)firstAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutAnchor)secondAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)relation
{
  return self->_relation;
}

- (double)constant
{
  return self->_constant;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (float)priority
{
  return self->_priority;
}

- (double)multiplier
{
  return self->_multiplier;
}

@end