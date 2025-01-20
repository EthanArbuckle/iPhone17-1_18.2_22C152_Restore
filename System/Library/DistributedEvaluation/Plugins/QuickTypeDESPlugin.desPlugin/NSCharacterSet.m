@interface NSCharacterSet
+ (id)vietnameseCharacterSet;
@end

@implementation NSCharacterSet

+ (id)vietnameseCharacterSet
{
  if (qword_1F130 != -1) {
    dispatch_once(&qword_1F130, &stru_18820);
  }
  v2 = (void *)qword_1F128;

  return v2;
}

@end