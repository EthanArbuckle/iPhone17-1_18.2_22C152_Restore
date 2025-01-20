@interface _SWActionResponse
+ (BOOL)supportsSecureCoding;
+ (id)responseWithDestinationResponse:(id)a3;
+ (id)responseWithSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionResponse:(id)a3;
- (BOOL)success;
- (BSActionResponse)sourceBSActionResponse;
- (NSError)error;
- (_SWActionResponse)initWithCoder:(id)a3;
- (_SWActionResponse)initWithDestinationResponse:(id)a3;
- (_SWActionResponse)initWithSuccess:(BOOL)a3 error:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSActionResponseSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation _SWActionResponse

+ (id)responseWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithSuccess:v4 error:v6];

  return v7;
}

- (_SWActionResponse)initWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SWActionResponse;
  v8 = [(_SWActionResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (_SWActionResponse)initWithDestinationResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 info];
  [v5 flagForSetting:1];
  uint64_t IsYes = BSSettingFlagIsYes();

  id v7 = [v4 info];

  v8 = [v7 objectForSetting:1];

  v9 = [(_SWActionResponse *)self initWithSuccess:IsYes error:v8];
  return v9;
}

+ (id)responseWithDestinationResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 info];
  v5 = [v4 objectForSetting:483940];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v6 = NSClassFromString(v5),
        [(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
    && [(objc_class *)v6 instancesRespondToSelector:sel_initWithDestinationResponse_])
  {
    id v7 = (void *)[[v6 alloc] initWithDestinationResponse:v3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSActionResponseSettings:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forSetting:483940];

  objc_msgSend(v4, "setFlag:forSetting:", -[_SWActionResponse success](self, "success"), 1);
  id v7 = [(_SWActionResponse *)self error];
  [v4 setObject:v7 forSetting:1];
}

- (BSActionResponse)sourceBSActionResponse
{
  sourceBSActionResponse = self->_sourceBSActionResponse;
  if (!sourceBSActionResponse)
  {
    id v4 = objc_alloc_init(_SWBSActionResponseSettings);
    [(_SWActionResponse *)self encodeWithBSActionResponseSettings:v4];
    id v5 = objc_alloc(MEMORY[0x1E4F4F678]);
    id v6 = [(_SWBSActionResponseSettings *)v4 bsSettings];
    id v7 = (BSActionResponse *)[v5 initWithInfo:v6 error:0];
    v8 = self->_sourceBSActionResponse;
    self->_sourceBSActionResponse = v7;

    sourceBSActionResponse = self->_sourceBSActionResponse;
  }

  return sourceBSActionResponse;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SWActionResponse;
  id v5 = [(_SWActionResponse *)&v12 init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_success);
    v5->_success = [v4 decodeBoolForKey:v6];

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_error);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    error = v5->_error;
    v5->_error = (NSError *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_SWActionResponse *)self success];
  id v6 = NSStringFromSelector(sel_success);
  [v4 encodeBool:v5 forKey:v6];

  id v8 = [(_SWActionResponse *)self error];
  uint64_t v7 = NSStringFromSelector(sel_error);
  [v4 encodeObject:v8 forKey:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSuccess:", -[_SWActionResponse success](self, "success"));
  BOOL v5 = [(_SWActionResponse *)self error];
  [v4 setError:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(_SWActionResponse *)self isEqualToActionResponse:v4];

  return v5;
}

- (BOOL)isEqualToActionResponse:(id)a3
{
  BOOL v5 = (_SWActionResponse *)a3;
  if (v5 == self)
  {
    char v7 = 1;
    goto LABEL_12;
  }
  BOOL v6 = [(_SWActionResponse *)self success];
  if (v6 == [(_SWActionResponse *)v5 success])
  {
    id v8 = [(_SWActionResponse *)self error];
    if (v8 || ([(_SWActionResponse *)v5 error], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v9 = [(_SWActionResponse *)self error];
      v10 = [(_SWActionResponse *)v5 error];
      char v7 = [v9 isEqual:v10];

      if (v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v7 = 1;
    }

    goto LABEL_11;
  }
  char v7 = 0;
LABEL_12:

  return v7;
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

  objc_storeStrong((id *)&self->_sourceBSActionResponse, 0);
}

@end