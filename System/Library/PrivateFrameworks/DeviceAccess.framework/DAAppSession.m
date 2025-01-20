@interface DAAppSession
- (DAAppSession)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)bundleIdentifier;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation DAAppSession

- (DAAppSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DAAppSession;
  v7 = [(DAAppSession *)&v24 init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v23 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ init failed", v16, v17, v18, v19, v20, v21, v23);
LABEL_9:
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_4;
  }
  if (MEMORY[0x223C529E0](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
      DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v22);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v14 = v7;
LABEL_4:

  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end