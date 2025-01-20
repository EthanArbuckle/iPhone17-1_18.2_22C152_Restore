@interface HDHealthRecordsXPCServiceManager
- (HDHealthRecordsXPCServiceManager)initWithListener:(id)a3;
- (HDXPCListener)listener;
- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5;
- (void)invalidate;
- (void)resume;
@end

@implementation HDHealthRecordsXPCServiceManager

- (HDHealthRecordsXPCServiceManager)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHealthRecordsXPCServiceManager;
  v6 = [(HDHealthRecordsXPCServiceManager *)&v9 init];
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
}

- (void)invalidate
{
}

- (id)exportObjectForListener:(id)a3 client:(id)a4 error:(id *)a5
{
  id v5 = objc_alloc_init(HDHealthRecordsXPCService);

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