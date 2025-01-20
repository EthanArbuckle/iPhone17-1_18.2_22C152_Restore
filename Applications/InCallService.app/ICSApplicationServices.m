@interface ICSApplicationServices
+ (id)sharedInstance;
@end

@implementation ICSApplicationServices

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7E68;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100326340 != -1) {
    dispatch_once(&qword_100326340, block);
  }
  v2 = (void *)qword_100326338;

  return v2;
}

@end