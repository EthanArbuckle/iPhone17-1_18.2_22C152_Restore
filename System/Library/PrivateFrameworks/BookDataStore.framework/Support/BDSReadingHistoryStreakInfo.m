@interface BDSReadingHistoryStreakInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryStreakInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryStreakInfo)initWithEndDate:(id)a3 length:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)length;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setLength:(int64_t)a3;
@end

@implementation BDSReadingHistoryStreakInfo

- (BDSReadingHistoryStreakInfo)initWithEndDate:(id)a3 length:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSReadingHistoryStreakInfo;
  v8 = [(BDSReadingHistoryStreakInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endDate, a3);
    v9->_length = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    BOOL v6 = 0;
    if (!self || !v5) {
      goto LABEL_10;
    }
    id v7 = [(BDSReadingHistoryStreakInfo *)self endDate];
    uint64_t v8 = [v5 endDate];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BDSReadingHistoryStreakInfo *)self endDate];
      objc_super v11 = [v5 endDate];
      unsigned int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        BOOL v6 = 0;
LABEL_10:

        return v6;
      }
    }
    id v13 = [(BDSReadingHistoryStreakInfo *)self length];
    BOOL v6 = v13 == [v5 length];
    goto LABEL_10;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryStreakInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingHistoryStreakInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v6;

    v5->_length = (int64_t)[v4 decodeIntegerForKey:@"length"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(BDSReadingHistoryStreakInfo *)self endDate];
  [v5 encodeObject:v4 forKey:@"endDate"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[BDSReadingHistoryStreakInfo length](self, "length"), @"length");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSReadingHistoryStreakInfo);
  if (v4)
  {
    id v5 = [(BDSReadingHistoryStreakInfo *)self endDate];
    [(BDSReadingHistoryStreakInfo *)v4 setEndDate:v5];

    [(BDSReadingHistoryStreakInfo *)v4 setLength:[(BDSReadingHistoryStreakInfo *)self length]];
  }
  return v4;
}

- (id)description
{
  v3 = [(BDSReadingHistoryStreakInfo *)self endDate];
  id v4 = +[NSString stringWithFormat:@"{endDate:%@, length:%ld}", v3, [(BDSReadingHistoryStreakInfo *)self length]];

  return v4;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
}

@end