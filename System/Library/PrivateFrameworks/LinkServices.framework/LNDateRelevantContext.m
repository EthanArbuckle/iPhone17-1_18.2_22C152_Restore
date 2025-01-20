@interface LNDateRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDateRelevantContext)initWithCoder:(id)a3;
- (LNDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4;
- (LNDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4 priority:(int64_t)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)analyticsDescription;
- (id)asCondition;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDateRelevantContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (id)asCondition
{
  v3 = [LNDateRelevantCondition alloc];
  v4 = [(LNDateRelevantContext *)self startDate];
  v5 = [(LNDateRelevantContext *)self endDate];
  v6 = [(LNDateRelevantCondition *)v3 initWithStartDate:v4 endDate:v5];

  return v6;
}

- (id)analyticsDescription
{
  v2 = [(LNDateRelevantContext *)self endDate];
  if (v2) {
    v3 = @".date(from:to:)";
  }
  else {
    v3 = @".date()";
  }
  v4 = v3;

  return v4;
}

- (id)description
{
  int64_t v3 = [(LNRelevantContext *)self priority];
  v4 = @"Unknown";
  if (v3 == 2) {
    v4 = @"Default";
  }
  if (v3 == 1) {
    v4 = @"Informational";
  }
  v5 = v4;
  v6 = [(LNDateRelevantContext *)self endDate];

  v7 = NSString;
  uint64_t v8 = [(LNDateRelevantContext *)self startDate];
  v9 = (void *)v8;
  if (v6)
  {
    uint64_t v10 = [(LNDateRelevantContext *)self endDate];
    v11 = [v7 stringWithFormat:@"<date range: %@ to %@, priority: %@>", v9, v10, v5];

    v5 = (__CFString *)v10;
  }
  else
  {
    v11 = [v7 stringWithFormat:@"<date: %@, priority: %@>", v8, v5];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNDateRelevantContext *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      startDate = self->_startDate;
      if ((startDate == v5->_startDate || -[NSDate isEqual:](startDate, "isEqual:"))
        && ((endDate = self->_endDate, endDate == v5->_endDate) || -[NSDate isEqual:](endDate, "isEqual:")))
      {
        int64_t v8 = [(LNRelevantContext *)self priority];
        BOOL v9 = v8 == [(LNRelevantContext *)v5 priority];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  uint64_t v4 = [(NSDate *)self->_endDate hash] ^ v3;
  return v4 ^ [(LNRelevantContext *)self priority];
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[LNRelevantContext priority](self, "priority"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"priority"];
}

- (LNDateRelevantContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];

  uint64_t v8 = [v7 integerValue];
  if (v5)
  {
    self = [(LNDateRelevantContext *)self initWithStartDate:v5 endDate:v6 priority:v8];
    BOOL v9 = self;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (LNDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4 priority:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNRelevantContext.m", 104, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNDateRelevantContext;
  v12 = [(LNRelevantContext *)&v17 initWithPriority:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    v14 = v13;
  }

  return v13;
}

- (LNDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4
{
  return [(LNDateRelevantContext *)self initWithStartDate:a3 endDate:a4 priority:2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end