@interface DKCloudUploadResult
+ (id)resultWithAccount:(id)a3 success:(BOOL)a4 error:(id)a5;
+ (id)resultWithSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)success;
- (NSError)error;
- (NSNumber)isPrimaryAccount;
- (NSString)username;
- (id)description;
- (void)setError:(id)a3;
- (void)setPrimaryAccount:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation DKCloudUploadResult

+ (id)resultWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = objc_alloc_init(DKCloudUploadResult);
  [(DKCloudUploadResult *)v6 setSuccess:v4];
  [(DKCloudUploadResult *)v6 setError:v5];

  return v6;
}

+ (id)resultWithAccount:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [a1 resultWithSuccess:v6 error:a5];
  v10 = [v8 username];
  [v9 setUsername:v10];

  v11 = NSNumber;
  uint64_t v12 = objc_msgSend(v8, "aa_isAccountClass:", *MEMORY[0x263F25618]);

  v13 = [v11 numberWithBool:v12];
  [v9 setPrimaryAccount:v13];

  return v9;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(DKCloudUploadResult *)self username];
  v7 = [(DKCloudUploadResult *)self isPrimaryAccount];
  BOOL v8 = [(DKCloudUploadResult *)self success];
  v9 = [(DKCloudUploadResult *)self error];
  v10 = [v3 stringWithFormat:@"<%@: %p> username: %@ isPrimaryAccount: %@ success: %d error: %@", v5, self, v6, v7, v8, v9];

  return v10;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSNumber)isPrimaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end