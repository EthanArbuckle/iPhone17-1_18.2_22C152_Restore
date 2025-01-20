@interface LNConnectionActionResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (LNConnectionActionResponse)initWithBSXPCCoder:(id)a3;
- (LNConnectionActionResponse)initWithCoder:(id)a3;
- (LNConnectionActionResponse)initWithXPCListenerEndpoint:(id)a3 auditToken:(id *)a4;
- (NSString)description;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConnectionActionResponse

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (LNConnectionActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"listenerEndpoint"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    [v7 _setEndpoint:v5];
    if (v6) {
      objc_msgSend(v6, "if_auditToken");
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    self = [(LNConnectionActionResponse *)self initWithXPCListenerEndpoint:v7 auditToken:v10];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNConnectionActionResponse)initWithXPCListenerEndpoint:(id)a3 auditToken:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LNConnectionActionResponse;
  v8 = [(LNConnectionActionResponse *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_listenerEndpoint, a3);
    long long v10 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v9->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v9->_auditToken.val[4] = v10;
    v11 = v9;
  }

  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNConnectionActionResponse *)self listenerEndpoint];
  v6 = [v5 _endpoint];
  [v4 encodeXPCObject:v6 forKey:@"listenerEndpoint"];

  id v7 = (void *)MEMORY[0x1E4F1C9B8];
  [(LNConnectionActionResponse *)self auditToken];
  v8 = objc_msgSend(v7, "if_dataWithAuditToken:", &v9);
  [v4 encodeObject:v8 forKey:@"auditToken"];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNConnectionActionResponse *)self listenerEndpoint];
  id v7 = [v3 stringWithFormat:@"<%@: %p, listenerEndpoint: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (LNConnectionActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v11);
  }
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listenerEndpoint"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "if_auditToken");
    self = [(LNConnectionActionResponse *)self initWithXPCListenerEndpoint:v5 auditToken:&v12];
    uint64_t v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = (void *)MEMORY[0x1E4F1C9B8];
  [(LNConnectionActionResponse *)self auditToken];
  v6 = objc_msgSend(v5, "if_dataWithAuditToken:", &v9);
  [v4 encodeObject:v6 forKey:@"auditToken"];

  id v7 = [(LNConnectionActionResponse *)self listenerEndpoint];
  [v4 encodeObject:v7 forKey:@"listenerEndpoint"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end