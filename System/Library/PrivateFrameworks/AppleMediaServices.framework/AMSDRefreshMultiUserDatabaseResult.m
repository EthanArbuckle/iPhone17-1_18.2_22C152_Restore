@interface AMSDRefreshMultiUserDatabaseResult
- (AMSDRefreshMultiUserDatabaseResult)initWithErrors:(id)a3;
- (NSArray)errors;
@end

@implementation AMSDRefreshMultiUserDatabaseResult

- (AMSDRefreshMultiUserDatabaseResult)initWithErrors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDRefreshMultiUserDatabaseResult;
  v6 = [(AMSDRefreshMultiUserDatabaseResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_errors, a3);
  }

  return v7;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
}

@end