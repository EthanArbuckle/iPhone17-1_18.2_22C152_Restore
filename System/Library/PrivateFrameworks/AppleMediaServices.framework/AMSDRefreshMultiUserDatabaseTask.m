@interface AMSDRefreshMultiUserDatabaseTask
- (AMSDCloudDataDatabase)database;
- (AMSDMultiUserController)controller;
@end

@implementation AMSDRefreshMultiUserDatabaseTask

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (AMSDCloudDataDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end