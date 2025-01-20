@interface LNDailyRoutineRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDailyRoutineRelevantContext)initWithCoder:(id)a3;
- (LNDailyRoutineRelevantContext)initWithSituation:(int64_t)a3;
- (id)analyticsDescription;
- (id)asCondition;
- (id)description;
- (int64_t)situation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDailyRoutineRelevantContext

- (int64_t)situation
{
  return self->_situation;
}

- (id)asCondition
{
  v2 = [[LNDailyRoutineRelevantCondition alloc] initWithSituation:[(LNDailyRoutineRelevantContext *)self situation]];
  return v2;
}

- (id)analyticsDescription
{
  int64_t v2 = [(LNDailyRoutineRelevantContext *)self situation];
  if ((unint64_t)(v2 - 1) > 0xE) {
    return @".sleep(.wakeup)";
  }
  else {
    return off_1E5B39110[v2 - 1];
  }
}

- (id)description
{
  int64_t v2 = NSString;
  int64_t v3 = [(LNDailyRoutineRelevantContext *)self situation];
  if ((unint64_t)(v3 - 1) > 0xE) {
    v4 = @".sleep(.wakeup)";
  }
  else {
    v4 = off_1E5B39110[v3 - 1];
  }
  v5 = v4;
  v6 = [v2 stringWithFormat:@"<routine: %@>", v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNDailyRoutineRelevantContext *)a3;
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

- (void)encodeWithCoder:(id)a3
{
}

- (LNDailyRoutineRelevantContext)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"situation"];
  return [(LNDailyRoutineRelevantContext *)self initWithSituation:v4];
}

- (LNDailyRoutineRelevantContext)initWithSituation:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNDailyRoutineRelevantContext;
  uint64_t v4 = [(LNRelevantContext *)&v8 _init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_situation = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end