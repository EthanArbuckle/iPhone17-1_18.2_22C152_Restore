@interface NSCharacterSet
+ (id)phonePadCharacterSet;
@end

@implementation NSCharacterSet

+ (id)phonePadCharacterSet
{
  if (qword_100020CD8 != -1) {
    dispatch_once(&qword_100020CD8, &stru_100018410);
  }
  v2 = (void *)qword_100020CD0;

  return v2;
}

@end