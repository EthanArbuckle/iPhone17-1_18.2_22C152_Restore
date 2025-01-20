@interface INDailyRoutineRelevanceProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDailyRoutineRelevanceProvider)initWithCoder:(id)a3;
- (INDailyRoutineRelevanceProvider)initWithSituation:(INDailyRoutineSituation)situation;
- (INDailyRoutineSituation)situation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INDailyRoutineRelevanceProvider

- (INDailyRoutineSituation)situation
{
  return self->_situation;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INDailyRoutineRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_situation == v4->_situation;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_situation;
}

- (INDailyRoutineRelevanceProvider)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"situation"];

  return [(INDailyRoutineRelevanceProvider *)self initWithSituation:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (INDailyRoutineRelevanceProvider)initWithSituation:(INDailyRoutineSituation)situation
{
  v8.receiver = self;
  v8.super_class = (Class)INDailyRoutineRelevanceProvider;
  uint64_t v4 = [(INRelevanceProvider *)&v8 _init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_situation = situation;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end