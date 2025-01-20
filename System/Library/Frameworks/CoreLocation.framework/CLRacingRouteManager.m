@interface CLRacingRouteManager
- (BOOL)setRaceParameters:(id)a3;
- (double)recoverRaceAtTimestamp;
- (id).cxx_construct;
- (id)advanceToPoint:(id)a3;
- (id)getRaceParameters;
- (unint64_t)addRoutePoints:(id)a3;
- (unint64_t)configureWithWorkoutActivityType:(unint64_t)a3 bufferSize:(unint64_t)a4 offRouteGraceDurationInSec:(unint64_t)a5;
- (unint64_t)numberOfRoutePointsToAdd;
- (void)reset;
@end

@implementation CLRacingRouteManager

- (unint64_t)configureWithWorkoutActivityType:(unint64_t)a3 bufferSize:(unint64_t)a4 offRouteGraceDurationInSec:(unint64_t)a5
{
  if ((uint64_t)a3 > 51)
  {
    if (a3 - 70 < 2)
    {
      int v5 = 90603;
      goto LABEL_12;
    }
    if (a3 != 52)
    {
LABEL_11:
      int v5 = 62;
      goto LABEL_12;
    }
LABEL_9:
    int v5 = 4;
    goto LABEL_12;
  }
  if (a3 == 13)
  {
    int v5 = 6;
    goto LABEL_12;
  }
  if (a3 == 24) {
    goto LABEL_9;
  }
  if (a3 != 37) {
    goto LABEL_11;
  }
  int v5 = 8;
LABEL_12:
  int v9 = v5;
  int v7 = a5;
  int v8 = a4;
  return sub_19077D760((uint64_t)&self->clrr, &v9, &v8, &v7);
}

- (unint64_t)numberOfRoutePointsToAdd
{
  return (int)sub_19077A1E4((uint64_t)&self->clrr);
}

- (unint64_t)addRoutePoints:(id)a3
{
  if (a3) {
    return sub_19077A3A8((uint64_t)&self->clrr, a3);
  }
  else {
    return 4;
  }
}

- (id)advanceToPoint:(id)a3
{
  id result = [[CLRacingRoutePerformanceResults alloc] initWithTimeAhead:4 currentDistance:604800.0 referenceDistance:-1.0 currentAveragePace:-1.0 totalOverlapDistance:-1.0 state:-1.0];
  if (a3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    uint64_t v6 = sub_19077DC74((uint64_t)&self->clrr, a3, (uint64_t)v10);
    double v7 = *(double *)&v17 - *((double *)&v11 + 1);
    double v8 = *(double *)&v18;
    int v9 = [CLRacingRoutePerformanceResults alloc];
    return [(CLRacingRoutePerformanceResults *)v9 initWithTimeAhead:v6 currentDistance:v7 referenceDistance:*(double *)&v14 currentAveragePace:*((double *)&v19 + 1) totalOverlapDistance:*((double *)&v13 + 1) state:v8];
  }
  return result;
}

- (void)reset
{
}

- (id)getRaceParameters
{
  return sub_190780E98((uint64_t)&self->clrr);
}

- (BOOL)setRaceParameters:(id)a3
{
  if (a3) {
    return sub_19077FF28((uint64_t)&self->clrr, a3);
  }
  else {
    return 0;
  }
}

- (double)recoverRaceAtTimestamp
{
  return self->clrr.fTimestampOfLastMatchedPointOnReferenceRoute_s;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end