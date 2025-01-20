@interface NSBundle
+ (id)_ma_bundle;
@end

@implementation NSBundle

+ (id)_ma_bundle
{
  if (qword_55C98 != -1) {
    dispatch_once(&qword_55C98, &stru_307B8);
  }
  v2 = (void *)qword_55C90;

  return v2;
}

@end