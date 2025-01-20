@interface BDSReadingHistoryDayInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryDayInfo)initWithReadingTime:(int64_t)a3 goal:(int64_t)a4 isStreakDay:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStreakDay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)goal;
- (int64_t)readingTime;
- (void)encodeWithCoder:(id)a3;
- (void)setGoal:(int64_t)a3;
- (void)setIsStreakDay:(BOOL)a3;
- (void)setReadingTime:(int64_t)a3;
@end

@implementation BDSReadingHistoryDayInfo

- (BDSReadingHistoryDayInfo)initWithReadingTime:(int64_t)a3 goal:(int64_t)a4 isStreakDay:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)BDSReadingHistoryDayInfo;
  result = [(BDSReadingHistoryDayInfo *)&v9 init];
  if (result)
  {
    result->_readingTime = a3;
    result->_goal = a4;
    result->_isStreakDay = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v5 = a3;
    objc_opt_class();
    v4 = BUDynamicCast();

    LOBYTE(v5) = 0;
    if (self && v4)
    {
      id v6 = [(BDSReadingHistoryDayInfo *)self readingTime];
      if (v6 == [v4 readingTime]
        && (id v7 = -[BDSReadingHistoryDayInfo goal](self, "goal"), v7 == [v4 goal]))
      {
        unsigned int v8 = [(BDSReadingHistoryDayInfo *)self isStreakDay];
        LODWORD(v5) = v8 ^ [v4 isStreakDay] ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return (char)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryDayInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSReadingHistoryDayInfo *)self init];
  if (v5)
  {
    v5->_readingTime = (int64_t)[v4 decodeIntegerForKey:@"readingTime"];
    v5->_goal = (int64_t)[v4 decodeIntegerForKey:@"goal"];
    v5->_isStreakDay = [v4 decodeBoolForKey:@"isStreakDay"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSReadingHistoryDayInfo readingTime](self, "readingTime"), @"readingTime");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSReadingHistoryDayInfo goal](self, "goal"), @"goal");
  objc_msgSend(v4, "encodeBool:forKey:", -[BDSReadingHistoryDayInfo isStreakDay](self, "isStreakDay"), @"isStreakDay");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSReadingHistoryDayInfo);
  if (v4)
  {
    [(BDSReadingHistoryDayInfo *)v4 setReadingTime:[(BDSReadingHistoryDayInfo *)self readingTime]];
    [(BDSReadingHistoryDayInfo *)v4 setGoal:[(BDSReadingHistoryDayInfo *)self goal]];
    [(BDSReadingHistoryDayInfo *)v4 setIsStreakDay:[(BDSReadingHistoryDayInfo *)self isStreakDay]];
  }
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"{readingTime:%ld, goal:%ld, isStreakDay:%d}", [(BDSReadingHistoryDayInfo *)self readingTime], [(BDSReadingHistoryDayInfo *)self goal], [(BDSReadingHistoryDayInfo *)self isStreakDay]];
}

- (int64_t)readingTime
{
  return self->_readingTime;
}

- (void)setReadingTime:(int64_t)a3
{
  self->_readingTime = a3;
}

- (int64_t)goal
{
  return self->_goal;
}

- (void)setGoal:(int64_t)a3
{
  self->_goal = a3;
}

- (BOOL)isStreakDay
{
  return self->_isStreakDay;
}

- (void)setIsStreakDay:(BOOL)a3
{
  self->_isStreakDay = a3;
}

@end