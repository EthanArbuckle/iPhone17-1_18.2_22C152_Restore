@interface CKVAdminServiceFactory
- (CKVAdminServiceFactory)initWithQueue:(id)a3 semAdministrator:(id)a4 taskManager:(id)a5;
- (id)adminService;
@end

@implementation CKVAdminServiceFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_semAdministrator, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

- (id)adminService
{
  v2 = [[CKVAdminServiceConnection alloc] initWithServiceQueue:self->_serviceQueue taskManager:self->_taskManager semAdministrator:self->_semAdministrator];
  return v2;
}

- (CKVAdminServiceFactory)initWithQueue:(id)a3 semAdministrator:(id)a4 taskManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKVAdminServiceFactory;
  v12 = [(CKVAdminServiceFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceQueue, a3);
    objc_storeStrong((id *)&v13->_semAdministrator, a4);
    objc_storeStrong((id *)&v13->_taskManager, a5);
  }

  return v13;
}

@end