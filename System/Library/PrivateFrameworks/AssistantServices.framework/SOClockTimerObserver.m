@interface SOClockTimerObserver
+ (id)sharedObserver;
@end

@implementation SOClockTimerObserver

+ (id)sharedObserver
{
  if (qword_100585930 != -1) {
    dispatch_once(&qword_100585930, &stru_100500D08);
  }
  v2 = (void *)qword_100585938;
  return v2;
}

@end