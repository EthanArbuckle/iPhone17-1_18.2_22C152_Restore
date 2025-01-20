@interface FISleepUserDay
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (FISleepUserDay)initWithCoder:(id)a3;
- (FISleepUserDay)initWithStartOfDay:(id)a3 endOfDay:(id)a4;
- (NSDate)creationDate;
- (NSDate)endOfDay;
- (NSDate)startOfDay;
- (id)initEmptySleepUserDay;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setEndOfDay:(id)a3;
- (void)setStartOfDay:(id)a3;
@end

@implementation FISleepUserDay

- (FISleepUserDay)initWithStartOfDay:(id)a3 endOfDay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FISleepUserDay;
  v8 = [(FISleepUserDay *)&v11 init];
  if (v8)
  {
    v9 = [MEMORY[0x263EFF910] date];
    [(FISleepUserDay *)v8 setCreationDate:v9];

    [(FISleepUserDay *)v8 setStartOfDay:v6];
    [(FISleepUserDay *)v8 setEndOfDay:v7];
  }

  return v8;
}

- (id)initEmptySleepUserDay
{
  v5.receiver = self;
  v5.super_class = (Class)FISleepUserDay;
  v2 = [(FISleepUserDay *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF910] date];
    [(FISleepUserDay *)v2 setCreationDate:v3];

    [(FISleepUserDay *)v2 setStartOfDay:0];
    [(FISleepUserDay *)v2 setEndOfDay:0];
  }
  return v2;
}

- (BOOL)isEmpty
{
  v3 = [(FISleepUserDay *)self startOfDay];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_super v5 = [(FISleepUserDay *)self endOfDay];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FISleepUserDay)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(FISleepUserDay *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    [(FISleepUserDay *)v5 setCreationDate:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startOfDay"];
    [(FISleepUserDay *)v5 setStartOfDay:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endOfDay"];
    [(FISleepUserDay *)v5 setEndOfDay:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(FISleepUserDay *)self creationDate];
  [v4 encodeObject:v5 forKey:@"creationDate"];

  id v6 = [(FISleepUserDay *)self startOfDay];
  [v4 encodeObject:v6 forKey:@"startOfDay"];

  id v7 = [(FISleepUserDay *)self endOfDay];
  [v4 encodeObject:v7 forKey:@"endOfDay"];
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)startOfDay
{
  return self->_startOfDay;
}

- (void)setStartOfDay:(id)a3
{
}

- (NSDate)endOfDay
{
  return self->_endOfDay;
}

- (void)setEndOfDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endOfDay, 0);
  objc_storeStrong((id *)&self->_startOfDay, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end