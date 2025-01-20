@interface CPSWebRequest
+ (BOOL)supportsSecureCoding;
- (ASWebAuthenticationSessionCallback)callback;
- (BOOL)isEqual:(id)a3;
- (CPSWebRequest)initWithCoder:(id)a3;
- (CPSWebRequest)initWithURL:(id)a3 callback:(id)a4 additionalHeaderFields:(id)a5;
- (CPSWebRequest)initWithURL:(id)a3 callbackScheme:(id)a4 additionalHeaderFields:(id)a5;
- (NSDictionary)additionalHeaderFields;
- (NSString)callbackScheme;
- (NSURL)URL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSWebRequest

- (CPSWebRequest)initWithURL:(id)a3 callbackScheme:(id)a4 additionalHeaderFields:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"URL != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:]();
    }
LABEL_11:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24A68C1B0);
  }
  if (!v10)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"callbackScheme != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:]();
    }
    goto LABEL_11;
  }
  v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)CPSWebRequest;
  v13 = [(CPSWebRequest *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_URL, a3);
    uint64_t v15 = [v10 copy];
    callbackScheme = v14->_callbackScheme;
    v14->_callbackScheme = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    additionalHeaderFields = v14->_additionalHeaderFields;
    v14->_additionalHeaderFields = (NSDictionary *)v17;
  }
  return v14;
}

- (CPSWebRequest)initWithURL:(id)a3 callback:(id)a4 additionalHeaderFields:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"URL != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSWebRequest initWithURL:callback:additionalHeaderFields:]();
    }
LABEL_11:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24A68C348);
  }
  if (!v10)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"callback != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSWebRequest initWithURL:callback:additionalHeaderFields:]();
    }
    goto LABEL_11;
  }
  v12 = v11;
  v19.receiver = self;
  v19.super_class = (Class)CPSWebRequest;
  v13 = [(CPSWebRequest *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_URL, a3);
    objc_storeStrong((id *)&v14->_callback, a4);
    uint64_t v15 = [v12 copy];
    additionalHeaderFields = v14->_additionalHeaderFields;
    v14->_additionalHeaderFields = (NSDictionary *)v15;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F29C58];
  v6 = self;
  v7 = [v5 builderWithObject:v4 ofExpectedClass:v6];

  URL = self->_URL;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __25__CPSWebRequest_isEqual___block_invoke;
  v29[3] = &unk_26528A220;
  id v9 = v4;
  id v30 = v9;
  id v10 = (id)[v7 appendObject:URL counterpart:v29];
  callback = self->_callback;
  if (callback)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __25__CPSWebRequest_isEqual___block_invoke_2;
    v27[3] = &unk_26528A248;
    v12 = &v28;
    id v28 = v9;
    id v13 = (id)[v7 appendObject:callback counterpart:v27];
  }
  else
  {
    callbackScheme = self->_callbackScheme;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __25__CPSWebRequest_isEqual___block_invoke_3;
    v25[3] = &unk_26528A270;
    v12 = &v26;
    id v26 = v9;
    id v15 = (id)[v7 appendString:callbackScheme counterpart:v25];
  }

  additionalHeaderFields = self->_additionalHeaderFields;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __25__CPSWebRequest_isEqual___block_invoke_4;
  v23 = &unk_26528A298;
  id v24 = v9;
  id v17 = v9;
  id v18 = (id)[v7 appendObject:additionalHeaderFields counterpart:&v20];
  LOBYTE(additionalHeaderFields) = objc_msgSend(v7, "isEqual", v20, v21, v22, v23);

  return (char)additionalHeaderFields;
}

id __25__CPSWebRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __25__CPSWebRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __25__CPSWebRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __25__CPSWebRequest_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_URL];
  if (self->_callback) {
    id v5 = (id)objc_msgSend(v3, "appendObject:");
  }
  else {
    id v6 = (id)[v3 appendString:self->_callbackScheme];
  }
  id v7 = (id)[v3 appendObject:self->_additionalHeaderFields];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = CUPrintNSObjectMasked();
  [v3 appendString:v4 withName:@"URL"];

  callback = self->_callback;
  if (callback) {
    id v6 = (id)[v3 appendObject:callback withName:@"callback"];
  }
  else {
    [v3 appendString:self->_callbackScheme withName:@"callbackScheme"];
  }
  id v7 = CUPrintNSObjectMasked();
  id v8 = (id)[v3 appendObject:v7 withName:@"additionalHeaderFields" skipIfNil:1];

  id v9 = [v3 build];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSWebRequest)initWithCoder:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"URL"];

  if (!v6)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F07F70];
    uint64_t v23 = *MEMORY[0x263F08338];
    v24[0] = @"Failed to decode CPSWebRequest: missing URL value";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v9 = [v14 errorWithDomain:v15 code:4865 userInfo:v7];
    [v4 failWithError:v9];
    goto LABEL_5;
  }
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callback"];
  id v8 = self;
  uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"callbackScheme"];

  if (!(v7 | v9))
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F70];
    uint64_t v21 = *MEMORY[0x263F08338];
    v22 = @"Failed to decode CPSWebRequest: missing callback value";
    v12 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v13 = [v10 errorWithDomain:v11 code:4865 userInfo:v12];
    [v4 failWithError:v13];

LABEL_5:
    v16 = 0;
    goto LABEL_10;
  }
  uint64_t v17 = objc_opt_class();
  id v18 = [v4 decodeDictionaryWithKeysOfClass:v17 objectsOfClass:objc_opt_class() forKey:@"additionalHeaderFields"];
  if (v7) {
    objc_super v19 = [(CPSWebRequest *)self initWithURL:v6 callback:v7 additionalHeaderFields:v18];
  }
  else {
    objc_super v19 = [(CPSWebRequest *)self initWithURL:v6 callbackScheme:v9 additionalHeaderFields:v18];
  }
  self = v19;

  v16 = self;
LABEL_10:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  URL = self->_URL;
  id v7 = a3;
  [v7 encodeObject:URL forKey:@"URL"];
  callback = self->_callback;
  if (callback)
  {
    id v6 = @"callback";
  }
  else
  {
    callback = self->_callbackScheme;
    id v6 = @"callbackScheme";
  }
  [v7 encodeObject:callback forKey:v6];
  [v7 encodeObject:self->_additionalHeaderFields forKey:@"additionalHeaderFields"];
}

- (NSString)callbackScheme
{
  return self->_callbackScheme;
}

- (ASWebAuthenticationSessionCallback)callback
{
  return self->_callback;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)additionalHeaderFields
{
  return self->_additionalHeaderFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
}

- (void)initWithURL:callbackScheme:additionalHeaderFields:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:callbackScheme:additionalHeaderFields:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:callback:additionalHeaderFields:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:callback:additionalHeaderFields:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end