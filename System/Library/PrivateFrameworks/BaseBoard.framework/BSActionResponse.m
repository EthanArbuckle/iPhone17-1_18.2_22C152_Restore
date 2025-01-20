@interface BSActionResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BSActionResponse)responseWithInfo:(id)a3;
+ (id)response;
+ (id)responseForError:(id)a3;
+ (id)responseForErrorCode:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (BSActionResponse)init;
- (BSActionResponse)initWithBSXPCCoder:(id)a3;
- (BSActionResponse)initWithInfo:(id)a3 error:(id)a4;
- (BSActionResponse)initWithXPCDictionary:(id)a3;
- (BSAuditToken)auditToken;
- (BSSettings)info;
- (NSError)error;
- (NSString)description;
- (id)_initWithInfo:(void *)a3 error:;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)hash;
- (void)_setAuditToken:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSActionResponse

- (BSActionResponse)initWithXPCDictionary:(id)a3
{
  v4 = +[BSXPCCoder coderWithMessage:a3];
  v5 = [(BSActionResponse *)self initWithBSXPCCoder:v4];

  return v5;
}

- (BSActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"info"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  v7 = (BSActionResponse *)-[BSActionResponse _initWithInfo:error:]((id *)&self->super.isa, v5, v6);

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  -[BSActionResponse encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_info forKey:@"info"];
  [v4 encodeObject:self->_error forKey:@"error"];
}

id __58__BSActionResponse_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"info"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"error" skipIfNil:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSActionResponse *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(BSActionResponse *)self succinctDescriptionBuilder];
  info = self->_info;
  if (info && ![(BSSettings *)info isEmpty])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__BSActionResponse_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E54456B8;
    id v10 = v5;
    v11 = self;
    [v10 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  }
  else
  {
    id v7 = (id)[v5 appendObject:self->_error withName:@"error" skipIfNil:1];
  }

  return v5;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)dealloc
{
  [(BSSettings *)self->_info setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)BSActionResponse;
  [(BSActionResponse *)&v3 dealloc];
}

- (void)_setAuditToken:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

+ (id)responseForErrorCode:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1E4F143B8];
  self;
  objc_super v3 = (void *)MEMORY[0x1E4F28C58];
  v9 = @"BSErrorCodeDescription";
  id v4 = NSStringFromBSActionErrorCode(a2);
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v6 = [v3 errorWithDomain:@"BSActionErrorDomain" code:a2 userInfo:v5];
  id v7 = +[BSActionResponse responseForError:v6];

  return v7;
}

+ (id)responseForError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithInfo:0 error:v4];

  return v5;
}

- (id)_initWithInfo:(void *)a3 error:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BSActionResponse;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = a1[1];
      a1[1] = (id)v7;

      [a1[1] setDescriptionProvider:a1];
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (BSActionResponse)initWithInfo:(id)a3 error:(id)a4
{
  return (BSActionResponse *)-[BSActionResponse _initWithInfo:error:]((id *)&self->super.isa, a3, a4);
}

- (NSError)error
{
  return self->_error;
}

- (BSSettings)info
{
  return self->_info;
}

- (NSString)description
{
  return (NSString *)[(BSActionResponse *)self descriptionWithMultilinePrefix:0];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (BSActionResponse)init
{
  return [(BSActionResponse *)self initWithInfo:0 error:0];
}

+ (id)response
{
  id v2 = (void *)[objc_alloc((Class)a1) initWithInfo:0 error:0];
  return v2;
}

+ (BSActionResponse)responseWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithInfo:v4 error:0];

  return (BSActionResponse *)v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (unint64_t)hash
{
  objc_super v3 = +[BSHashBuilder builder];
  id v4 = [v3 appendObject:self->_info];
  id v5 = [v4 appendObject:self->_error];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSActionResponse *)a3;
  id v5 = v4;
  BOOL v7 = 1;
  if (self != v4)
  {
    if (!v4
      || (uint64_t v6 = objc_opt_class(), v6 != objc_opt_class())
      || (info = self->_info, info != v5->_info) && !-[BSSettings isEqual:](info, "isEqual:")
      || (error = self->_error, error != v5->_error) && !-[NSError isEqual:](error, "isEqual:"))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)succinctDescription
{
  id v2 = [(BSActionResponse *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

@end