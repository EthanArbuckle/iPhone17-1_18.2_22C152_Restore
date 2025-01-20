@interface BDSReadingGoalsStateInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingGoalsStateInfo)initWithBooksFinishedGoal:(id)a3 streakDayGoal:(id)a4;
- (BDSReadingGoalsStateInfo)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)booksFinishedGoal;
- (NSNumber)streakDayGoal;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBooksFinishedGoal:(id)a3;
- (void)setStreakDayGoal:(id)a3;
@end

@implementation BDSReadingGoalsStateInfo

- (BDSReadingGoalsStateInfo)initWithBooksFinishedGoal:(id)a3 streakDayGoal:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BDSReadingGoalsStateInfo;
  v9 = [(BDSReadingGoalsStateInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_booksFinishedGoal, a3);
    objc_storeStrong((id *)&v10->_streakDayGoal, a4);
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
    id v7 = [(BDSReadingGoalsStateInfo *)self booksFinishedGoal];
    uint64_t v8 = [v5 booksFinishedGoal];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BDSReadingGoalsStateInfo *)self booksFinishedGoal];
      v11 = [v5 booksFinishedGoal];
      unsigned int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        unsigned __int8 v6 = 0;
LABEL_13:

        return v6;
      }
    }
    v13 = [(BDSReadingGoalsStateInfo *)self streakDayGoal];
    v14 = [v5 streakDayGoal];
    if (v13 == v14)
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      v15 = [(BDSReadingGoalsStateInfo *)self streakDayGoal];
      v16 = [v5 streakDayGoal];
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

- (BDSReadingGoalsStateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingGoalsStateInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"booksFinishedGoal"];
    booksFinishedGoal = v5->_booksFinishedGoal;
    v5->_booksFinishedGoal = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streakDayGoal"];
    streakDayGoal = v5->_streakDayGoal;
    v5->_streakDayGoal = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSReadingGoalsStateInfo *)self booksFinishedGoal];
  [v4 encodeObject:v5 forKey:@"booksFinishedGoal"];

  id v6 = [(BDSReadingGoalsStateInfo *)self streakDayGoal];
  [v4 encodeObject:v6 forKey:@"streakDayGoal"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BDSReadingGoalsStateInfo);
  if (v4)
  {
    v5 = [(BDSReadingGoalsStateInfo *)self booksFinishedGoal];
    [(BDSReadingGoalsStateInfo *)v4 setBooksFinishedGoal:v5];

    id v6 = [(BDSReadingGoalsStateInfo *)self streakDayGoal];
    [(BDSReadingGoalsStateInfo *)v4 setStreakDayGoal:v6];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(BDSReadingGoalsStateInfo *)self booksFinishedGoal];
  v5 = [(BDSReadingGoalsStateInfo *)self streakDayGoal];
  id v6 = +[NSString stringWithFormat:@"<%@: %p booksFinishedGoal:%@, streakDayGoal:%@>", v3, self, v4, v5];

  return v6;
}

- (NSNumber)booksFinishedGoal
{
  return self->_booksFinishedGoal;
}

- (void)setBooksFinishedGoal:(id)a3
{
}

- (NSNumber)streakDayGoal
{
  return self->_streakDayGoal;
}

- (void)setStreakDayGoal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streakDayGoal, 0);
  objc_storeStrong((id *)&self->_booksFinishedGoal, 0);
}

@end