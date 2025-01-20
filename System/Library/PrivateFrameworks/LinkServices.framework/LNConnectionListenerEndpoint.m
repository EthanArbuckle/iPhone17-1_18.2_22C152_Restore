@interface LNConnectionListenerEndpoint
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (LNConnectionListenerEndpoint)initWithCoder:(id)a3;
- (LNConnectionListenerEndpoint)initWithProcessInstanceIdentifier:(id)a3 bundleIdentifier:(id)a4 xpcListenerEndpoint:(id)a5 auditToken:(id *)a6;
- (NSString)bundleIdentifier;
- (NSString)processInstanceIdentifier;
- (NSXPCListenerEndpoint)xpcListenerEndpoint;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConnectionListenerEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_processInstanceIdentifier, 0);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSXPCListenerEndpoint)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)processInstanceIdentifier
{
  return self->_processInstanceIdentifier;
}

- (id)description
{
  long long v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNConnectionListenerEndpoint *)self processInstanceIdentifier];
  v7 = [(LNConnectionListenerEndpoint *)self bundleIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %p, processInstanceIdentifier: %@, bundleIdentifier: %@>", v5, self, v6, v7];

  return v8;
}

- (LNConnectionListenerEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"LNConnectionListenerEndpoint can only be encoded using an NSXPCCoder" userInfo:0];
    objc_exception_throw(v12);
  }
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processInstanceIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xpcListenerEndpoint"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    objc_msgSend(v8, "if_auditToken");
    self = [(LNConnectionListenerEndpoint *)self initWithProcessInstanceIdentifier:v5 bundleIdentifier:v10 xpcListenerEndpoint:v6 auditToken:&v13];

    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"LNConnectionListenerEndpoint can only be encoded using an NSXPCCoder" userInfo:0];
    objc_exception_throw(v10);
  }
  v5 = [(LNConnectionListenerEndpoint *)self processInstanceIdentifier];
  [v4 encodeObject:v5 forKey:@"processInstanceIdentifier"];

  v6 = [(LNConnectionListenerEndpoint *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];

  uint64_t v7 = [(LNConnectionListenerEndpoint *)self xpcListenerEndpoint];
  [v4 encodeObject:v7 forKey:@"xpcListenerEndpoint"];

  v8 = (void *)MEMORY[0x1E4F1C9B8];
  [(LNConnectionListenerEndpoint *)self auditToken];
  v9 = objc_msgSend(v8, "if_dataWithAuditToken:", &v11);
  [v4 encodeObject:v9 forKey:@"auditToken"];
}

- (LNConnectionListenerEndpoint)initWithProcessInstanceIdentifier:(id)a3 bundleIdentifier:(id)a4 xpcListenerEndpoint:(id)a5 auditToken:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"LNConnectionListenerEndpoint.m", 20, @"Invalid parameter not satisfying: %@", @"processInstanceIdentifier" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"LNConnectionListenerEndpoint.m", 21, @"Invalid parameter not satisfying: %@", @"xpcListenerEndpoint" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)LNConnectionListenerEndpoint;
  v15 = [(LNConnectionListenerEndpoint *)&v25 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    processInstanceIdentifier = v15->_processInstanceIdentifier;
    v15->_processInstanceIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v15->_xpcListenerEndpoint, a5);
    long long v20 = *(_OWORD *)&a6->var0[4];
    *(_OWORD *)v15->_auditToken.val = *(_OWORD *)a6->var0;
    *(_OWORD *)&v15->_auditToken.val[4] = v20;
    v21 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end