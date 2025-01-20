@interface FACircleStateResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)loadSuccess;
- (BOOL)success;
- (FACircleStateResponse)initWithCoder:(id)a3;
- (FACircleStateResponse)initWithLoadSuccess:(BOOL)a3 error:(id)a4 userInfo:(id)a5;
- (NSDictionary)userInfo;
- (NSError)error;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)success;
@end

@implementation FACircleStateResponse

- (FACircleStateResponse)initWithLoadSuccess:(BOOL)a3 error:(id)a4 userInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FACircleStateResponse;
  v11 = [(FACircleStateResponse *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_loadSuccess = a3;
    objc_storeStrong((id *)&v11->_error, a4);
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL loadSuccess = self->_loadSuccess;
  id v5 = a3;
  [v5 encodeBool:loadSuccess forKey:@"loadSuccess"];
  [v5 encodeObject:self->_error forKey:@"error"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
}

- (FACircleStateResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FACircleStateResponse *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    v5->_BOOL loadSuccess = [v4 decodeBoolForKey:@"loadSuccess"];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v10 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  v3 = [(FACircleStateResponse *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"success"];
  char v5 = [v4 BOOLValue];

  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(FACircleStateResponse *)self success];
  }

  return [(FACircleStateResponse *)self loadSuccess] & v5;
}

- (id)description
{
  if (self->_loadSuccess) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"loadSuccess: %@\nerror: %@\nuserInfo: %@", v2, self->_error, self->_userInfo];
}

- (BOOL)loadSuccess
{
  return self->_loadSuccess;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)success
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 loadSuccess];
  v6 = @"NO";
  uint64_t v9 = "-[FACircleStateResponse success]";
  if (v5) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  int v8 = 136315650;
  __int16 v10 = 2112;
  v11 = v7;
  if (a2) {
    v6 = @"YES";
  }
  __int16 v12 = 2112;
  v13 = v6;
  _os_log_debug_impl(&dword_1D252C000, a3, OS_LOG_TYPE_DEBUG, "%s %@ && %@", (uint8_t *)&v8, 0x20u);
}

@end