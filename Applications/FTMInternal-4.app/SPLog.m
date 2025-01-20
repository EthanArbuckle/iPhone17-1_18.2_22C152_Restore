@interface SPLog
+ (BOOL)bootstrap;
@end

@implementation SPLog

+ (BOOL)bootstrap
{
  if (qword_1002DC3A8 != -1) {
    dispatch_once(&qword_1002DC3A8, &stru_100288328);
  }
  return 1;
}

@end