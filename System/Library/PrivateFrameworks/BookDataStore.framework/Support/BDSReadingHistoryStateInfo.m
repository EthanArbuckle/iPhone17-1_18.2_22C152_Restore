@interface BDSReadingHistoryStateInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayInfo)today;
- (BDSReadingHistoryStateInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryStateInfo)initWithCurrentStreak:(int64_t)a3 longestStreak:(id)a4 today:(id)a5 readingHistory:(id)a6;
- (BDSReadingHistoryStreakInfo)longestStreak;
- (BOOL)isEmptyState;
- (BOOL)isEqual:(id)a3;
- (NSArray)readingHistory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)currentStreak;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentStreak:(int64_t)a3;
- (void)setLongestStreak:(id)a3;
- (void)setReadingHistory:(id)a3;
- (void)setToday:(id)a3;
@end

@implementation BDSReadingHistoryStateInfo

- (BDSReadingHistoryStateInfo)initWithCurrentStreak:(int64_t)a3 longestStreak:(id)a4 today:(id)a5 readingHistory:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BDSReadingHistoryStateInfo;
  v14 = [(BDSReadingHistoryStateInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_currentStreak = a3;
    objc_storeStrong((id *)&v14->_longestStreak, a4);
    objc_storeStrong((id *)&v15->_today, a5);
    objc_storeStrong((id *)&v15->_readingHistory, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    unsigned __int8 v6 = 0;
    if (!self || !v5) {
      goto LABEL_18;
    }
    id v7 = [(BDSReadingHistoryStateInfo *)self currentStreak];
    if (v7 == [v5 currentStreak])
    {
      v8 = [(BDSReadingHistoryStateInfo *)self longestStreak];
      uint64_t v9 = [v5 longestStreak];
      if (v8 == (void *)v9)
      {
      }
      else
      {
        v10 = (void *)v9;
        id v11 = [(BDSReadingHistoryStateInfo *)self longestStreak];
        id v12 = [v5 longestStreak];
        unsigned int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_12;
        }
      }
      v14 = [(BDSReadingHistoryStateInfo *)self today];
      uint64_t v15 = [v5 today];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        objc_super v17 = [(BDSReadingHistoryStateInfo *)self today];
        v18 = [v5 today];
        unsigned int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_12;
        }
      }
      v20 = [(BDSReadingHistoryStateInfo *)self readingHistory];
      v21 = [v5 readingHistory];
      if (v20 == v21)
      {
        unsigned __int8 v6 = 1;
      }
      else
      {
        v22 = [(BDSReadingHistoryStateInfo *)self readingHistory];
        v23 = [v5 readingHistory];
        unsigned __int8 v6 = [v22 isEqualToArray:v23];
      }
      goto LABEL_18;
    }
LABEL_12:
    unsigned __int8 v6 = 0;
LABEL_18:

    return v6;
  }
  return 1;
}

- (BOOL)isEmptyState
{
  if ([(BDSReadingHistoryStateInfo *)self currentStreak])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(BDSReadingHistoryStateInfo *)self longestStreak];
    if ([v4 length])
    {
      BOOL v3 = 0;
    }
    else
    {
      v5 = [(BDSReadingHistoryStateInfo *)self today];
      BOOL v3 = [v5 readingTime] == 0;
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned __int8 v6 = [(BDSReadingHistoryStateInfo *)self readingHistory];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v3)
        {
          id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) day];
          BOOL v3 = [v11 readingTime] == 0;
        }
        else
        {
          BOOL v3 = 0;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryStateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingHistoryStateInfo *)self init];
  if (v5)
  {
    v5->_currentStreak = (int64_t)[v4 decodeIntegerForKey:@"currentStreak"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longestStreak"];
    longestStreak = v5->_longestStreak;
    v5->_longestStreak = (BDSReadingHistoryStreakInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"today"];
    today = v5->_today;
    v5->_today = (BDSReadingHistoryDayInfo *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"readingHistory"];
    readingHistory = v5->_readingHistory;
    v5->_readingHistory = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BDSReadingHistoryStateInfo currentStreak](self, "currentStreak"), @"currentStreak");
  v5 = [(BDSReadingHistoryStateInfo *)self longestStreak];
  [v4 encodeObject:v5 forKey:@"longestStreak"];

  uint64_t v6 = [(BDSReadingHistoryStateInfo *)self today];
  [v4 encodeObject:v6 forKey:@"today"];

  id v7 = [(BDSReadingHistoryStateInfo *)self readingHistory];
  [v4 encodeObject:v7 forKey:@"readingHistory"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSReadingHistoryStateInfo);
  if (v4)
  {
    [(BDSReadingHistoryStateInfo *)v4 setCurrentStreak:[(BDSReadingHistoryStateInfo *)self currentStreak]];
    v5 = [(BDSReadingHistoryStateInfo *)self longestStreak];
    [(BDSReadingHistoryStateInfo *)v4 setLongestStreak:v5];

    uint64_t v6 = [(BDSReadingHistoryStateInfo *)self today];
    [(BDSReadingHistoryStateInfo *)v4 setToday:v6];

    id v7 = [(BDSReadingHistoryStateInfo *)self readingHistory];
    [(BDSReadingHistoryStateInfo *)v4 setReadingHistory:v7];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(BDSReadingHistoryStateInfo *)self currentStreak];
  v5 = [(BDSReadingHistoryStateInfo *)self longestStreak];
  uint64_t v6 = [(BDSReadingHistoryStateInfo *)self today];
  id v7 = [(BDSReadingHistoryStateInfo *)self readingHistory];
  uint64_t v8 = +[NSString stringWithFormat:@"<%@: %p currentStreak:%ld, longestStreak:%@, today:%@, readingHistory:%@>", v3, self, v4, v5, v6, v7];

  return v8;
}

- (int64_t)currentStreak
{
  return self->_currentStreak;
}

- (void)setCurrentStreak:(int64_t)a3
{
  self->_currentStreak = a3;
}

- (BDSReadingHistoryStreakInfo)longestStreak
{
  return self->_longestStreak;
}

- (void)setLongestStreak:(id)a3
{
}

- (BDSReadingHistoryDayInfo)today
{
  return self->_today;
}

- (void)setToday:(id)a3
{
}

- (NSArray)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_longestStreak, 0);
}

@end