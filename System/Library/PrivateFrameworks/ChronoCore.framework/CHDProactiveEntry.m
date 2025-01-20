@interface CHDProactiveEntry
- (BOOL)hasRelevance;
- (CHDProactiveEntry)initWithDate:(id)a3;
- (CHDProactiveEntry)initWithDate:(id)a3 score:(double)a4 duration:(double)a5;
- (NSDate)date;
- (double)duration;
- (double)score;
@end

@implementation CHDProactiveEntry

- (CHDProactiveEntry)initWithDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHDProactiveEntry;
  v6 = [(CHDProactiveEntry *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v7->_hasRelevance = 0;
    v7->_score = 0.0;
    v7->_duration = 0.0;
  }

  return v7;
}

- (CHDProactiveEntry)initWithDate:(id)a3 score:(double)a4 duration:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHDProactiveEntry;
  v10 = [(CHDProactiveEntry *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_date, a3);
    v11->_hasRelevance = 1;
    v11->_score = a4;
    v11->_duration = a5;
  }

  return v11;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)hasRelevance
{
  return self->_hasRelevance;
}

- (double)score
{
  return self->_score;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end