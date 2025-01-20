@interface SHCloudContainer
+ (CKContainer)sharedContainer;
@end

@implementation SHCloudContainer

+ (CKContainer)sharedContainer
{
  if (qword_100090A60 != -1) {
    dispatch_once(&qword_100090A60, &stru_1000751D8);
  }
  v2 = (void *)qword_100090A58;

  return (CKContainer *)v2;
}

@end