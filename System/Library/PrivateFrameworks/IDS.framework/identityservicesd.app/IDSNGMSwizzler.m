@interface IDSNGMSwizzler
+ (id)lastPrKey;
+ (void)installMethods;
+ (void)uninstallMethods;
@end

@implementation IDSNGMSwizzler

+ (void)installMethods
{
  os_unfair_lock_lock(&stru_100A4A608);
  if ((byte_100A4A60C & 1) == 0)
  {
    v2 = NSClassFromString(@"NGMFullPrekey");
    InstanceMethod = class_getInstanceMethod(v2, "dhKey");
    qword_100A4A610 = (uint64_t)method_getImplementation(InstanceMethod);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000D1F7C;
    v6[3] = &unk_1009817B0;
    v6[4] = qword_100A4A610;
    v6[5] = "dhKey";
    v4 = objc_retainBlock(v6);
    v5 = imp_implementationWithBlock(v4);

    method_setImplementation(InstanceMethod, v5);
    byte_100A4A60C = 1;
  }
  os_unfair_lock_unlock(&stru_100A4A608);
}

+ (void)uninstallMethods
{
  os_unfair_lock_lock(&stru_100A4A608);
  if (byte_100A4A60C == 1)
  {
    v2 = NSClassFromString(@"NGMFullPrekey");
    InstanceMethod = class_getInstanceMethod(v2, "dhKey");
    method_setImplementation(InstanceMethod, (IMP)qword_100A4A610);
    byte_100A4A60C = 0;
    v4 = (void *)qword_100A4A600;
    qword_100A4A600 = 0;
  }

  os_unfair_lock_unlock(&stru_100A4A608);
}

+ (id)lastPrKey
{
  return (id)qword_100A4A600;
}

@end