@interface HDHealthRecordsLegacyIngestionXPCServiceManager
- (HDHealthRecordsLegacyIngestionXPCServiceManager)init;
- (HDHealthRecordsLegacyIngestionXPCServiceManager)initWithListener:(id)a3;
- (HDXPCListener)listener;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (void)invalidate;
- (void)resume;
@end

@implementation HDHealthRecordsLegacyIngestionXPCServiceManager

- (HDHealthRecordsLegacyIngestionXPCServiceManager)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDHealthRecordsLegacyIngestionXPCServiceManager)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordsLegacyIngestionXPCServiceManager;
  v6 = [(HDHealthRecordsLegacyIngestionXPCServiceManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    [v5 setDelegate:v7];
  }

  return v7;
}

- (void)resume
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = +[NSProcessInfo processInfo];
    v8 = [v7 processName];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is resuming in process \"%{public}@\"", (uint8_t *)&v9, 0x16u);
  }
  [(HDXPCListener *)self->_listener resume];
}

- (void)invalidate
{
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  id v5 = objc_alloc_init(HDHealthRecordsLegacyIngestionXPCService);

  return v5;
}

- (HDXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
}

@end