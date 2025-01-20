@interface BDSReadingHistoryDayEntryInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayEntryInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryDayEntryInfo)initWithDate:(id)a3 day:(id)a4;
- (BDSReadingHistoryDayInfo)day;
- (BOOL)isEqual:(id)a3;
- (NSString)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setDay:(id)a3;
@end

@implementation BDSReadingHistoryDayEntryInfo

- (BDSReadingHistoryDayEntryInfo)initWithDate:(id)a3 day:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BDSReadingHistoryDayEntryInfo;
  v9 = [(BDSReadingHistoryDayEntryInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_day, a4);
  }

  return v10;
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
      goto LABEL_13;
    }
    id v7 = [(BDSReadingHistoryDayEntryInfo *)self date];
    uint64_t v8 = [v5 date];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BDSReadingHistoryDayEntryInfo *)self date];
      v11 = [v5 date];
      unsigned int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        unsigned __int8 v6 = 0;
LABEL_13:

        return v6;
      }
    }
    v13 = [(BDSReadingHistoryDayEntryInfo *)self day];
    v14 = [v5 day];
    if (v13 == v14)
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      v15 = [(BDSReadingHistoryDayEntryInfo *)self day];
      v16 = [v5 day];
      unsigned __int8 v6 = [v15 isEqual:v16];
    }
    goto LABEL_13;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryDayEntryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingHistoryDayEntryInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"day"];
    day = v5->_day;
    v5->_day = (BDSReadingHistoryDayInfo *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingHistoryDayEntryInfo *)self date];
  [v4 encodeObject:v5 forKey:@"date"];

  id v6 = [(BDSReadingHistoryDayEntryInfo *)self day];
  [v4 encodeObject:v6 forKey:@"day"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSReadingHistoryDayEntryInfo);
  if (v4)
  {
    v5 = [(BDSReadingHistoryDayEntryInfo *)self date];
    [(BDSReadingHistoryDayEntryInfo *)v4 setDate:v5];

    id v6 = [(BDSReadingHistoryDayEntryInfo *)self day];
    [(BDSReadingHistoryDayEntryInfo *)v4 setDay:v6];
  }
  return v4;
}

- (id)description
{
  v3 = [(BDSReadingHistoryDayEntryInfo *)self date];
  id v4 = [(BDSReadingHistoryDayEntryInfo *)self day];
  v5 = +[NSString stringWithFormat:@"{%@: %@}", v3, v4];

  return v5;
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BDSReadingHistoryDayInfo)day
{
  return self->_day;
}

- (void)setDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end