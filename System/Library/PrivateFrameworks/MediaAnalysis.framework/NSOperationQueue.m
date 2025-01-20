@interface NSOperationQueue
+ (id)vcp_sharedAnalysisQueue;
@end

@implementation NSOperationQueue

+ (id)vcp_sharedAnalysisQueue
{
  if (qword_1002523D0 != -1) {
    dispatch_once(&qword_1002523D0, &stru_100219BA8);
  }
  v2 = (void *)qword_1002523D8;
  return v2;
}

@end