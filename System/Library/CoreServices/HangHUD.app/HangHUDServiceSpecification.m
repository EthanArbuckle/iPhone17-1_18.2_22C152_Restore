@interface HangHUDServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)clientContextIdentifierKey;
+ (NSString)domainName;
+ (NSString)identifier;
+ (NSString)machName;
@end

@implementation HangHUDServiceSpecification

+ (NSString)domainName
{
  return (NSString *)@"com.apple.HangHUD";
}

+ (NSString)machName
{
  return (NSString *)@"com.apple.HangHUD";
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.HangHUD.service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)+[BSServiceQuality userInteractive];
}

+ (BSServiceInterface)interface
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001349C;
  block[3] = &unk_100030840;
  block[4] = a1;
  if (qword_10003EA28 != -1) {
    dispatch_once(&qword_10003EA28, block);
  }
  v2 = (void *)qword_10003EA20;

  return (BSServiceInterface *)v2;
}

+ (NSString)clientContextIdentifierKey
{
  return (NSString *)@"identifier";
}

@end