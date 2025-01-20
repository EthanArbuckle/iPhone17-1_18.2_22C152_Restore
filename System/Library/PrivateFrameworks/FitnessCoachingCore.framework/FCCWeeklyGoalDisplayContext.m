@interface FCCWeeklyGoalDisplayContext
- (FCCWeeklyGoalDisplayContext)initWithDictionary:(id)a3;
- (FCCWeeklyGoalDisplayContext)initWithDisplayCount:(int64_t)a3 lastDisplayDate:(id)a4;
- (NSDate)lastDisplayDate;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)displayCount;
@end

@implementation FCCWeeklyGoalDisplayContext

- (FCCWeeklyGoalDisplayContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"DisplayCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = [v5 integerValue];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [v4 objectForKeyedSubscript:@"LastDate"];
  v8 = [(FCCWeeklyGoalDisplayContext *)self initWithDisplayCount:v6 lastDisplayDate:v7];

  return v8;
}

- (FCCWeeklyGoalDisplayContext)initWithDisplayCount:(int64_t)a3 lastDisplayDate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCCWeeklyGoalDisplayContext;
  v8 = [(FCCWeeklyGoalDisplayContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_displayCount = a3;
    objc_storeStrong((id *)&v8->_lastDisplayDate, a4);
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"DisplayCount";
  v3 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  v6[1] = @"LastDate";
  v7[0] = v3;
  v7[1] = self->_lastDisplayDate;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FCCWeeklyGoalDisplayContext<%p>: displayCount: %d, last display date: %@", self, self->_displayCount, self->_lastDisplayDate];
}

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (NSDate)lastDisplayDate
{
  return self->_lastDisplayDate;
}

- (void).cxx_destruct
{
}

@end