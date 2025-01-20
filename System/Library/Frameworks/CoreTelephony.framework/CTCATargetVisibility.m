@interface CTCATargetVisibility
+ (BOOL)supportsSecureCoding;
- (CTCATargetVisibility)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)aggregateVisibility;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregateVisibility:(int64_t)a3;
@end

@implementation CTCATargetVisibility

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTCATargetVisibility *)self aggregateVisibility];
  if (v4 > 3) {
    v5 = "???";
  }
  else {
    v5 = off_1E5266B08[v4];
  }
  [v3 appendFormat:@", aggregateVisibility=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAggregateVisibility:", -[CTCATargetVisibility aggregateVisibility](self, "aggregateVisibility"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTCATargetVisibility aggregateVisibility](self, "aggregateVisibility"), @"aggregateVisibility");
}

- (CTCATargetVisibility)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCATargetVisibility;
  v5 = [(CTCATargetVisibility *)&v7 init];
  if (v5) {
    v5->_aggregateVisibility = [v4 decodeIntegerForKey:@"aggregateVisibility"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)aggregateVisibility
{
  return self->_aggregateVisibility;
}

- (void)setAggregateVisibility:(int64_t)a3
{
  self->_aggregateVisibility = a3;
}

@end