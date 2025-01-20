@interface _HKInteractiveChartDistributionStyleKey
- (BOOL)isEqual:(id)a3;
- (NSString)predicateName;
- (_HKInteractiveChartDistributionStyleKey)initWithDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 predicateName:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (int64_t)timeScope;
- (unint64_t)hash;
- (void)setPredicateName:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTimeScope:(int64_t)a3;
@end

@implementation _HKInteractiveChartDistributionStyleKey

- (_HKInteractiveChartDistributionStyleKey)initWithDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 predicateName:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HKInteractiveChartDistributionStyleKey;
  v10 = [(_HKInteractiveChartDistributionStyleKey *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_style = a3;
    v10->_timeScope = a4;
    objc_storeStrong((id *)&v10->_predicateName, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
    int64_t v6 = [(_HKInteractiveChartDistributionStyleKey *)self style];
    if (v6 == [v5 style]
      && (int64_t v7 = [(_HKInteractiveChartDistributionStyleKey *)self timeScope],
          v7 == [v5 timeScope]))
    {
      v8 = [(_HKInteractiveChartDistributionStyleKey *)self predicateName];
      id v9 = [v5 predicateName];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(_HKInteractiveChartDistributionStyleKey *)self style];
  int64_t v4 = [(_HKInteractiveChartDistributionStyleKey *)self timeScope] ^ v3;
  id v5 = [(_HKInteractiveChartDistributionStyleKey *)self predicateName];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [_HKInteractiveChartDistributionStyleKey alloc];
  int64_t v5 = [(_HKInteractiveChartDistributionStyleKey *)self style];
  int64_t v6 = [(_HKInteractiveChartDistributionStyleKey *)self timeScope];
  int64_t v7 = [(_HKInteractiveChartDistributionStyleKey *)self predicateName];
  v8 = [(_HKInteractiveChartDistributionStyleKey *)v4 initWithDistributionStyle:v5 timeScope:v6 predicateName:v7];

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (NSString)predicateName
{
  return self->_predicateName;
}

- (void)setPredicateName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end