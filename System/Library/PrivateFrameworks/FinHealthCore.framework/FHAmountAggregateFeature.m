@interface FHAmountAggregateFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHAmountAggregateFeature)initWithAmount:(unint64_t)a3 comparator:(id)a4;
- (FHAmountAggregateFeature)initWithCoder:(id)a3;
- (NSString)comparator;
- (id)description;
- (int64_t)amount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(int64_t)a3;
- (void)setComparator:(id)a3;
@end

@implementation FHAmountAggregateFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FHAmountAggregateFeature;
  id v4 = a3;
  [(FHAggregateFeature *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHAmountAggregateFeature amount](self, "amount", v6.receiver, v6.super_class), @"amount");
  v5 = [(FHAmountAggregateFeature *)self comparator];
  [v4 encodeObject:v5 forKey:@"comparator"];
}

- (FHAmountAggregateFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHAmountAggregateFeature;
  v5 = [(FHAmountAggregateFeature *)&v8 init];
  if (v5)
  {
    -[FHAmountAggregateFeature setAmount:](v5, "setAmount:", [v4 decodeIntegerForKey:@"amount"]);
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"comparator"];
    [(FHAmountAggregateFeature *)v5 setComparator:v6];
  }
  return v5;
}

- (FHAmountAggregateFeature)initWithAmount:(unint64_t)a3 comparator:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FHAmountAggregateFeature;
  objc_super v8 = [(FHAmountAggregateFeature *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FHAggregateFeature *)v8 setType:1];
    v9->_amount = a3;
    objc_storeStrong((id *)&v9->_comparator, a4);
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%lu'; ", @"amount", self->_amount];
  [v3 appendFormat:@"%@: '%@'; ", @"comparator", self->_comparator];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)FHAmountAggregateFeature;
  unint64_t v3 = [(FHAggregateFeature *)&v8 hash];
  int64_t v4 = [(FHAmountAggregateFeature *)self amount] - v3 + 32 * v3;
  v5 = [(FHAmountAggregateFeature *)self comparator];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (FHAmountAggregateFeature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v11.receiver = self,
             v11.super_class = (Class)FHAmountAggregateFeature,
             [(FHAggregateFeature *)&v11 isEqual:v5])
         && (int64_t v6 = [(FHAmountAggregateFeature *)self amount],
             v6 == [(FHAmountAggregateFeature *)v5 amount]))
  {
    id v7 = [(FHAmountAggregateFeature *)self comparator];
    objc_super v8 = [(FHAmountAggregateFeature *)v5 comparator];
    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (int64_t)amount
{
  return self->_amount;
}

- (void)setAmount:(int64_t)a3
{
  self->_amount = a3;
}

- (void).cxx_destruct
{
}

@end