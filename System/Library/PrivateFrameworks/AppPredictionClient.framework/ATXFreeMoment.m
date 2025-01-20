@interface ATXFreeMoment
+ (BOOL)supportsSecureCoding;
- (ATXFreeMoment)initWithCoder:(id)a3;
- (ATXFreeMoment)initWithDateRange:(id)a3 score:(double)a4;
- (NSDateInterval)dateRange;
- (double)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXFreeMoment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFreeMoment)initWithDateRange:(id)a3 score:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXFreeMoment;
  v8 = [(ATXFreeMoment *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateRange, a3);
    v9->_score = a4;
  }

  return v9;
}

- (ATXFreeMoment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateRange"];
  [v4 decodeDoubleForKey:@"score"];
  double v7 = v6;

  v8 = [(ATXFreeMoment *)self initWithDateRange:v5 score:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ATXFreeMoment *)self dateRange];
  [v5 encodeObject:v4 forKey:@"dateRange"];

  [(ATXFreeMoment *)self score];
  objc_msgSend(v5, "encodeDouble:forKey:", @"score");
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [(ATXFreeMoment *)self dateRange];
  double v6 = [v5 startDate];
  double v7 = [v4 localizedStringFromDate:v6 dateStyle:1 timeStyle:1];
  v8 = (void *)MEMORY[0x1E4F28C10];
  v9 = [(ATXFreeMoment *)self dateRange];
  v10 = [v9 endDate];
  objc_super v11 = [v8 localizedStringFromDate:v10 dateStyle:1 timeStyle:1];
  [(ATXFreeMoment *)self score];
  v13 = (void *)[v3 initWithFormat:@"<Start: %@, End: %@, Score: %f>", v7, v11, v12];

  return v13;
}

- (NSDateInterval)dateRange
{
  return self->_dateRange;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end