@interface CLKRelativeDateProgressProvider
+ (BOOL)supportsSecureCoding;
+ (id)relativeDateProgressProviderWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)_needsUpdates;
- (BOOL)isEqual:(id)a3;
- (CLKRelativeDateProgressProvider)initWithCoder:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)_progressFractionForNow:(id)a3;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_validate;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation CLKRelativeDateProgressProvider

+ (id)relativeDateProgressProviderWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setStartDate:v7];

  [v8 setEndDate:v6];

  return v8;
}

- (double)_progressFractionForNow:(id)a3
{
  id v4 = a3;
  v5 = [(CLKRelativeDateProgressProvider *)self startDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  double result = 0.0;
  if (v7 >= 0.00000011920929)
  {
    v9 = [(CLKRelativeDateProgressProvider *)self endDate];
    v10 = [(CLKRelativeDateProgressProvider *)self startDate];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    double result = 1.0;
    if (v12 >= 0.00000011920929)
    {
      double result = v7 / v12;
      if (v7 / v12 > v12 + -0.00000011920929) {
        return 1.0;
      }
    }
  }
  return result;
}

- (BOOL)_needsUpdates
{
  return 1;
}

- (void)_validate
{
  v4.receiver = self;
  v4.super_class = (Class)CLKRelativeDateProgressProvider;
  [(CLKProgressProvider *)&v4 _validate];
  if (!self->_startDate) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ startDate cannot be nil", objc_opt_class() format];
  }
  endDate = self->_endDate;
  if (!endDate)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ endDate cannot be nil", objc_opt_class() format];
    endDate = self->_endDate;
  }
  if ([(NSDate *)self->_startDate compare:endDate] == NSOrderedDescending) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ endDate cannot be older than startDate", objc_opt_class() format];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateProgressProvider;
  objc_super v4 = [(CLKProgressProvider *)&v7 copyWithZone:a3];
  p_isa = (id *)&v4->super.super.isa;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_startDate, self->_startDate);
    objc_storeStrong(p_isa + 8, self->_endDate);
  }
  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateProgressProvider;
  if ([(CLKProgressProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_startDate, v4[7]))
  {
    char v5 = CLKEqualObjects(self->_endDate, v4[8]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CLKRelativeDateProgressProvider;
  double v3 = (double)[(CLKProgressProvider *)&v6 hash];
  double v4 = v3 + (double)(unint64_t)[(NSDate *)self->_startDate hash] * 100.0;
  return (unint64_t)(v4 + (double)(unint64_t)[(NSDate *)self->_endDate hash] * 1000.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKRelativeDateProgressProvider;
  id v4 = a3;
  [(CLKProgressProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"_startDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_endDate forKey:@"_endDate"];
}

- (CLKRelativeDateProgressProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKRelativeDateProgressProvider;
  objc_super v5 = [(CLKProgressProvider *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateProgressProvider;
  double v3 = [(CLKProgressProvider *)&v7 JSONObjectRepresentation];
  id v4 = [(NSDate *)self->_startDate JSONObjectRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"startDate"];

  objc_super v5 = [(NSDate *)self->_endDate JSONObjectRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"endDate"];

  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end