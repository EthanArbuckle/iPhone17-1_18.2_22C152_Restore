@interface NSDate
- (id)fba_toString;
@end

@implementation NSDate

- (id)fba_toString
{
  if (qword_100123FD8 != -1) {
    dispatch_once(&qword_100123FD8, &stru_1000F2B18);
  }
  v3 = (void *)qword_100123FD0;

  return [v3 stringFromDate:self];
}

@end