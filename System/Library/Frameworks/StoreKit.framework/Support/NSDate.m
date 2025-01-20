@interface NSDate
- (BOOL)lib_dateHasPassed;
- (BOOL)lib_isBefore:(id)a3;
- (double)lib_timeElapsedUntilNow;
- (id)lib_loggableDate;
- (id)lib_loggableShortDate;
- (id)lib_simpleWeekDate;
- (unint64_t)lib_dispatchTime;
@end

@implementation NSDate

- (unint64_t)lib_dispatchTime
{
  [(NSDate *)self timeIntervalSinceNow];

  return dispatch_time(0, 1000000000 * (uint64_t)v2);
}

- (BOOL)lib_dateHasPassed
{
  [(NSDate *)self timeIntervalSinceNow];
  return v2 < 0.0;
}

- (BOOL)lib_isBefore:(id)a3
{
  [(NSDate *)self timeIntervalSinceDate:a3];
  return v3 < 0.0;
}

- (id)lib_loggableDate
{
  if (qword_10039FC78 != -1) {
    dispatch_once(&qword_10039FC78, &stru_100359388);
  }
  double v3 = (void *)qword_10039FC70;

  return _[v3 stringFromDate:self];
}

- (id)lib_loggableShortDate
{
  if (qword_10039FC88 != -1) {
    dispatch_once(&qword_10039FC88, &stru_1003593A8);
  }
  double v3 = (void *)qword_10039FC80;

  return _[v3 stringFromDate:self];
}

- (id)lib_simpleWeekDate
{
  if (qword_10039FC98 != -1) {
    dispatch_once(&qword_10039FC98, &stru_1003593C8);
  }
  double v3 = (void *)qword_10039FC90;

  return _[v3 stringFromDate:self];
}

- (double)lib_timeElapsedUntilNow
{
  [(NSDate *)self timeIntervalSinceNow];
  return -v2;
}

@end