@interface MigratorPromotionTask
- (MigratorPromotionTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorPromotionTask

- (MigratorPromotionTask)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MigratorPromotionTask;
  v5 = [(MigratorTask *)&v9 initWithConfiguration:v4];
  if (v5)
  {
    id v6 = sub_1002ED13C((uint64_t)v4, @"bundleIDs");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_bundleIDs, v6);
    }
    id v7 = sub_1002ED13C((uint64_t)v4, @"options");

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_options, v7);
    }
  }
  return v5;
}

- (id)copyConfiguration
{
  v3 = sub_1002ECEFC([MigratorConfiguration alloc], @"DemotedApplications");
  sub_1002ED1A4((uint64_t)v3, self->_bundleIDs, @"bundleIDs");
  sub_1002ED1A4((uint64_t)v3, self->_options, @"options");
  return v3;
}

- (id)migratorType
{
  return @"DemotedApplications";
}

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSArray *)self->_bundleIDs componentsJoinedByString:@", "];
    int v9 = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to hydrate applications with bundleIDs: [%{public}@]", (uint8_t *)&v9, 0xCu);
  }
  id v5 = sub_1002AD490([ImportJobsForDemotedAppsTask alloc], self->_bundleIDs);
  id v6 = v5;
  if (v5) {
    *((unsigned char *)v5 + 48) = 0;
  }
  uint64_t v7 = sub_1002B2A3C();
  v8 = (void *)v7;
  if (v7) {
    [*(id *)(v7 + 8) addOperation:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end