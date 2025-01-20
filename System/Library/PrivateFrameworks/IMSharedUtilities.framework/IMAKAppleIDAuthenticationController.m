@interface IMAKAppleIDAuthenticationController
+ (NSString)IMAKUserInfoChangedAltDSIDKey;
+ (NSString)IMAKUserInfoChangedNotification;
+ (NSString)IMAKUserInfoChangedSecurityLevelKey;
@end

@implementation IMAKAppleIDAuthenticationController

+ (NSString)IMAKUserInfoChangedNotification
{
  if (qword_1E94FEAC0 != -1) {
    dispatch_once(&qword_1E94FEAC0, &unk_1EF2BFC20);
  }
  v2 = (void *)qword_1E94FEFE0;

  return (NSString *)v2;
}

+ (NSString)IMAKUserInfoChangedAltDSIDKey
{
  if (qword_1E94FFC80 != -1) {
    dispatch_once(&qword_1E94FFC80, &unk_1EF2C0880);
  }
  v2 = (void *)qword_1E94FFC78;

  return (NSString *)v2;
}

+ (NSString)IMAKUserInfoChangedSecurityLevelKey
{
  if (qword_1E94FFC90[0] != -1) {
    dispatch_once(qword_1E94FFC90, &unk_1EF2C0B60);
  }
  v2 = (void *)qword_1E94FFC88;

  return (NSString *)v2;
}

@end