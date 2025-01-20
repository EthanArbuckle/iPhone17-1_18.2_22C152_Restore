@interface CPSSharingRequest
+ (BOOL)supportsSecureCoding;
- (CPSSharingRequest)initWithCoder:(id)a3;
- (CPSSharingRequest)initWithData:(id)a3;
- (NSArray)customSharingMethods;
- (NSData)requestData;
- (NSString)customTitleText;
- (int64_t)authType;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomSharingMethods:(id)a3;
- (void)setCustomTitleText:(id)a3;
@end

@implementation CPSSharingRequest

- (CPSSharingRequest)initWithData:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)CPSSharingRequest;
    v8 = [(CPSAuthenticationRequest *)&v12 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_requestData, a3);
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"data != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(CPSSharingRequest *)a2 initWithData:(uint64_t)v11];
    }
    [v11 UTF8String];
    result = (CPSSharingRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (int64_t)authType
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSharingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSSharingRequest;
  v5 = [(CPSAuthenticationRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"requestData"];
    requestData = v5->_requestData;
    v5->_requestData = (NSData *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:v9 forKey:@"customSharingMethods"];
    customSharingMethods = v5->_customSharingMethods;
    v5->_customSharingMethods = (NSArray *)v10;

    objc_super v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"customTitleText"];
    customTitleText = v5->_customTitleText;
    v5->_customTitleText = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSSharingRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestData, @"requestData", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_customSharingMethods forKey:@"customSharingMethods"];
  [v4 encodeObject:self->_customTitleText forKey:@"customTitleText"];
}

- (NSData)requestData
{
  return self->_requestData;
}

- (NSArray)customSharingMethods
{
  return self->_customSharingMethods;
}

- (void)setCustomSharingMethods:(id)a3
{
}

- (NSString)customTitleText
{
  return self->_customTitleText;
}

- (void)setCustomTitleText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTitleText, 0);
  objc_storeStrong((id *)&self->_customSharingMethods, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

- (void)initWithData:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"CPSSharingRequest.m";
  __int16 v16 = 1024;
  int v17 = 19;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_24A684000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end