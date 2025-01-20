@interface LNDailyRoutineRelevantCondition
- (LNDailyRoutineRelevantCondition)initWithSituation:(int64_t)a3;
- (int64_t)situation;
@end

@implementation LNDailyRoutineRelevantCondition

- (int64_t)situation
{
  return self->_situation;
}

- (LNDailyRoutineRelevantCondition)initWithSituation:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNDailyRoutineRelevantCondition;
  v4 = [(LNRelevantCondition *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v4->_situation = a3;
    v6 = v4;
  }

  return v5;
}

@end