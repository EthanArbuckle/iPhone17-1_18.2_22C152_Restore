@interface IMSandboxingUtils
+ (BOOL)enterSandboxWithBundleIdentifier:(const char *)a3;
+ (OS_os_log)logger;
- (id)logger;
@end

@implementation IMSandboxingUtils

+ (OS_os_log)logger
{
  if (qword_1EB4A6308 != -1) {
    dispatch_once(&qword_1EB4A6308, &unk_1EF2BF3C0);
  }
  v2 = (void *)qword_1E94FF4F0;

  return (OS_os_log *)v2;
}

- (id)logger
{
  v2 = objc_opt_class();

  return (id)[v2 logger];
}

+ (BOOL)enterSandboxWithBundleIdentifier:(const char *)a3
{
  return 1;
}

@end