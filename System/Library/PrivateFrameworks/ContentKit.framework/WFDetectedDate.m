@interface WFDetectedDate
+ (BOOL)supportsSecureCoding;
- (BOOL)timeIsSignificant;
- (NSDate)date;
- (WFDetectedDate)initWithCoder:(id)a3;
- (WFDetectedDate)initWithDate:(id)a3 timeIsSignificant:(BOOL)a4;
- (WFDetectedDate)initWithDateCheckingResult:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDetectedDate

- (void).cxx_destruct
{
}

- (BOOL)timeIsSignificant
{
  return self->_timeIsSignificant;
}

- (NSDate)date
{
  return self->_date;
}

- (WFDetectedDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v6 = [v4 decodeBoolForKey:@"timeIsSignificant"];

  v7 = [(WFDetectedDate *)self initWithDate:v5 timeIsSignificant:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WFDetectedDate *)self date];
  [v5 encodeObject:v4 forKey:@"date"];

  objc_msgSend(v5, "encodeBool:forKey:", -[WFDetectedDate timeIsSignificant](self, "timeIsSignificant"), @"timeIsSignificant");
}

- (WFDetectedDate)initWithDateCheckingResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 date];
  uint64_t v6 = [v4 timeIsSignificant];

  v7 = [(WFDetectedDate *)self initWithDate:v5 timeIsSignificant:v6];
  return v7;
}

- (WFDetectedDate)initWithDate:(id)a3 timeIsSignificant:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFDateDetector.m", 54, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFDetectedDate;
  v9 = [(WFDetectedDate *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    v10->_timeIsSignificant = a4;
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end