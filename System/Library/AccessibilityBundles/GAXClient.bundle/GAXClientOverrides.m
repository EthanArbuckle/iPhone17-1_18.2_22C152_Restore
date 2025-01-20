@interface GAXClientOverrides
+ (void)validateAndInstall;
+ (void)validateAndInstallForStoreKit;
+ (void)validateAndInstallForWebKit;
@end

@implementation GAXClientOverrides

+ (void)validateAndInstall
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D78;
  block[3] = &unk_14928;
  block[4] = a1;
  if (qword_1BC90 != -1) {
    dispatch_once(&qword_1BC90, block);
  }
}

+ (void)validateAndInstallForStoreKit
{
}

+ (void)validateAndInstallForWebKit
{
  if (qword_1BCA0 != -1) {
    dispatch_once(&qword_1BCA0, &stru_149E8);
  }
}

@end