@interface DAAppContext
+ (BOOL)supportsSecureCoding;
- (DAAppContext)initWithCoder:(id)a3;
- (DAAppContext)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)bundleIdentifier;
- (OS_xpc_object)xpcEndpoint;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation DAAppContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAAppContext)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)DAAppContext;
  id v3 = a3;
  v4 = [(DAAppContext *)&v18 init];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v3;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = [v5 decodeXPCObjectOfType:MEMORY[0x263EF8718] forKey:@"xpcE"];
    xpcEndpoint = v4->_xpcEndpoint;
    v4->_xpcEndpoint = (OS_xpc_object *)v6;

    v8 = v4;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v17 = DAErrorF(350001, (uint64_t)"%@ init failed", v11, v12, v13, v14, v15, v16, v10);
    [v3 failWithError:v17];

    id v3 = (id)v17;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (self->_xpcEndpoint)
  {
    BOOL v5 = (isKindOfClass & 1) == 0;
    uint64_t v6 = v7;
    if (v5) {
      uint64_t v6 = 0;
    }
    objc_msgSend(v6, "encodeXPCObject:forKey:");
  }
}

- (DAAppContext)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DAAppContext;
  id v7 = [(DAAppContext *)&v32 init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v31 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ init failed", v24, v25, v26, v27, v28, v29, v31);
LABEL_13:
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_14:
    v22 = 0;
    goto LABEL_8;
  }
  if (MEMORY[0x223C529E0](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v30);
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v14 = xpc_dictionary_get_value(v6, "xpcE");
  uint64_t v15 = (void *)v14;
  if (v14)
  {
    if (MEMORY[0x223C529E0](v14) != MEMORY[0x263EF8718])
    {
      if (a4)
      {
        DAErrorF(350001, (uint64_t)"XPC non-endpoint", v16, v17, v18, v19, v20, v21, v30);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v7->_xpcEndpoint, v15);
  }
  v22 = v7;
LABEL_7:

LABEL_8:
  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpcEndpoint = self->_xpcEndpoint;
  if (xpcEndpoint) {
    xpc_dictionary_set_value(a3, "xpcE", xpcEndpoint);
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end