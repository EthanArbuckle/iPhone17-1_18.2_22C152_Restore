@interface CASPasswordCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CASPasswordCredential)initWithCoder:(id)a3;
- (CASPasswordCredential)initWithUser:(id)a3 password:(id)a4;
- (NSString)password;
- (NSString)user;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CASPasswordCredential

- (CASPasswordCredential)initWithUser:(id)a3 password:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"user != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CASPasswordCredential initWithUser:password:](a2, (uint64_t)self, (uint64_t)v16);
    }
LABEL_11:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24A68E75CLL);
  }
  v9 = v8;
  if (!v8)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"password != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CASPasswordCredential initWithUser:password:](a2, (uint64_t)self, (uint64_t)v16);
    }
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)CASPasswordCredential;
  v10 = [(CASPasswordCredential *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    user = v10->_user;
    v10->_user = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    password = v10->_password;
    v10->_password = (NSString *)v13;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F29C58];
  v6 = self;
  id v7 = [v5 builderWithObject:v4 ofExpectedClass:v6];

  user = self->_user;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __33__CASPasswordCredential_isEqual___block_invoke;
  v20[3] = &unk_26528A270;
  id v9 = v4;
  id v21 = v9;
  id v10 = (id)[v7 appendString:user counterpart:v20];
  password = self->_password;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  objc_super v17 = __33__CASPasswordCredential_isEqual___block_invoke_2;
  v18 = &unk_26528A270;
  id v19 = v9;
  id v12 = v9;
  id v13 = (id)[v7 appendString:password counterpart:&v15];
  LOBYTE(password) = objc_msgSend(v7, "isEqual", v15, v16, v17, v18);

  return (char)password;
}

id __33__CASPasswordCredential_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __33__CASPasswordCredential_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_user];
  id v5 = (id)[v3 appendString:self->_password];
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CASPasswordCredential)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  unint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"user"];

  if (!v6)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F70];
    uint64_t v20 = *MEMORY[0x263F08338];
    v21[0] = @"Failed to decode CASPasswordCredential: missing user value";
    id v8 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v12 = [v10 errorWithDomain:v11 code:4865 userInfo:v8];
    [v4 failWithError:v12];

LABEL_6:
    id v9 = 0;
    goto LABEL_7;
  }
  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"password"];

  if (!v8)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F07F70];
    uint64_t v18 = *MEMORY[0x263F08338];
    id v19 = @"Failed to decode CASPasswordCredential: missing password value";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v16 = [v13 errorWithDomain:v14 code:4865 userInfo:v15];
    [v4 failWithError:v16];

    goto LABEL_6;
  }
  self = [(CASPasswordCredential *)self initWithUser:v6 password:v8];
  id v9 = self;
LABEL_7:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"user"];
  [v5 encodeObject:self->_password forKey:@"password"];
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

- (void)initWithUser:(uint64_t)a3 password:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"CASPasswordCredential.m";
  __int16 v10 = 1024;
  int v11 = 19;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_24A684000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithUser:(uint64_t)a3 password:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"CASPasswordCredential.m";
  __int16 v10 = 1024;
  int v11 = 20;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_24A684000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end