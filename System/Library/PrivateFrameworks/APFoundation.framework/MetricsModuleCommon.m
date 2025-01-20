@interface MetricsModuleCommon
+ (Class)daemonDeliveryClass;
+ (Class)metricClass;
+ (Class)notificationRegistrarClass;
+ (void)initialize;
+ (void)setDaemonDeliveryClass:(Class)a3;
+ (void)setMetricClass:(Class)a3;
+ (void)setNotificationRegistrarClass:(Class)a3;
@end

@implementation MetricsModuleCommon

+ (Class)daemonDeliveryClass
{
  return (Class)(id)qword_1EB789B08;
}

+ (void)initialize
{
  qword_1EB789B28 = (uint64_t)NSClassFromString(&cfstr_Apmetric.isa);
  qword_1EB789B08 = (uint64_t)NSClassFromString(&cfstr_Apmetricdaemon.isa);
  qword_1EB789B30 = (uint64_t)NSClassFromString(&cfstr_Apmetricnotifi.isa);
}

+ (Class)notificationRegistrarClass
{
  return (Class)(id)qword_1EB789B30;
}

+ (Class)metricClass
{
  return (Class)(id)qword_1EB789B28;
}

+ (void)setMetricClass:(Class)a3
{
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &unk_1F2EB61D0;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_1EB789B28 = (uint64_t)a3;
    }
    else
    {
      v6 = NSString;
      v7 = NSStringFromClass(a3);
      v8 = NSStringFromProtocol(proto);
      v9 = [v6 stringWithFormat:@"Class %@ does not implement the %@!", v7, v8];

      APSimulateCrash(5, v9, 0);
    }
  }
}

+ (void)setDaemonDeliveryClass:(Class)a3
{
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &unk_1F2EB2738;
    v6 = &unk_1F2EB2878;
    v7 = &unk_1F2EB2940;
    if ([(objc_class *)a3 conformsToProtocol:proto]
      && [(objc_class *)a3 conformsToProtocol:v6]
      && [(objc_class *)a3 conformsToProtocol:v7])
    {
      qword_1EB789B08 = (uint64_t)a3;
    }
    else
    {
      v8 = NSString;
      v9 = NSStringFromClass(a3);
      v10 = NSStringFromProtocol(proto);
      v11 = NSStringFromProtocol((Protocol *)v6);
      v12 = NSStringFromProtocol((Protocol *)v7);
      v13 = [v8 stringWithFormat:@"Class %@ does not implement the %@, %@ or %@ protocols!", v9, v10, v11, v12];

      APSimulateCrash(5, v13, 0);
    }
  }
}

+ (void)setNotificationRegistrarClass:(Class)a3
{
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  int v5 = [v4 isRunningTests];

  if (v5)
  {
    proto = &unk_1F2EB3220;
    v6 = &unk_1F2EB2940;
    if ([(objc_class *)a3 conformsToProtocol:proto]
      && [(objc_class *)a3 conformsToProtocol:v6])
    {
      qword_1EB789B30 = (uint64_t)a3;
    }
    else
    {
      v7 = NSString;
      v8 = NSStringFromClass(a3);
      v9 = NSStringFromProtocol(proto);
      v10 = NSStringFromProtocol((Protocol *)v6);
      v11 = [v7 stringWithFormat:@"Class %@ does not implement both the %@ or %@ protocols!", v8, v9, v10];

      APSimulateCrash(5, v11, 0);
    }
  }
}

@end