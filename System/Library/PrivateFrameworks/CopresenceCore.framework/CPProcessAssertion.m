@interface CPProcessAssertion
+ (id)processAssertionNameForBundleIdentifier:(id)a3;
+ (id)processAssertionWithBundleIdentifier:(id)a3;
- (BKSProcessAssertion)processAssertion;
- (BOOL)isEqual:(id)a3;
- (CPProcessAssertion)initWithBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (id)name;
- (unint64_t)hash;
- (void)acquireWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)setProcessAssertion:(id)a3;
@end

@implementation CPProcessAssertion

- (CPProcessAssertion)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPProcessAssertion;
  v6 = [(CPProcessAssertion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_processAssertion)
  {
    v3 = CPDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(CPProcessAssertion *)self bundleIdentifier];
      *(_DWORD *)buf = 136315394;
      v7 = "-[CPProcessAssertion dealloc]";
      __int16 v8 = 2112;
      objc_super v9 = v4;
      _os_log_impl(&dword_1B0DF7000, v3, OS_LOG_TYPE_INFO, "%s Invalidating process assertion for %@", buf, 0x16u);
    }
    [(BKSProcessAssertion *)self->_processAssertion invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)CPProcessAssertion;
  [(CPProcessAssertion *)&v5 dealloc];
}

- (void)acquireWithCompletionHandler:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4E280];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v9 = [(CPProcessAssertion *)self bundleIdentifier];
  v7 = [(CPProcessAssertion *)self name];
  __int16 v8 = (void *)[v6 initWithBundleIdentifier:v9 flags:11 reason:10008 name:v7 withHandler:v5];

  [(CPProcessAssertion *)self setProcessAssertion:v8];
}

+ (id)processAssertionWithBundleIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4E280];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [a1 processAssertionNameForBundleIdentifier:v5];
  __int16 v8 = (void *)[v6 initWithBundleIdentifier:v5 flags:11 reason:10008 name:v7];

  return v8;
}

+ (id)processAssertionNameForBundleIdentifier:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = [v3 stringWithFormat:@"%@-%@", objc_opt_class(), v4];

  return v5;
}

- (id)name
{
  v3 = objc_opt_class();
  id v4 = [(CPProcessAssertion *)self bundleIdentifier];
  id v5 = [v3 processAssertionNameForBundleIdentifier:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CPProcessAssertion *)self bundleIdentifier];
    id v6 = [v4 bundleIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CPProcessAssertion *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end