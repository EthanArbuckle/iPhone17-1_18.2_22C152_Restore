@interface BSXPCBundle
+ (id)bundleForPID:(int)a3;
+ (id)bundleWithExecutablePath:(id)a3;
+ (id)bundleWithPath:(id)a3;
+ (id)bundleWithXPCBundle:(id)a3;
+ (id)mainBundle;
- (NSDictionary)infoDictionary;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)description;
- (NSString)executablePath;
- (OS_xpc_object)xpcBundle;
- (id)_initWithXPCBundle:(id)a1;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation BSXPCBundle

+ (id)mainBundle
{
  if (qword_1EB21AF80 != -1) {
    dispatch_once(&qword_1EB21AF80, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_3;
  return v2;
}

void __25__BSXPCBundle_mainBundle__block_invoke()
{
  v0 = [BSXPCBundle alloc];
  id main = (id)xpc_bundle_create_main();
  id v1 = -[BSXPCBundle _initWithXPCBundle:](v0, main);
  v2 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v1;
}

- (id)_initWithXPCBundle:(id)a1
{
  id v4 = a2;
  v5 = v4;
  if (a1 && v4)
  {
    uint64_t v6 = [a1 init];
    v7 = (void *)v6;
    if (v6) {
      objc_storeStrong((id *)(v6 + 40), a2);
    }
    a1 = v7;
    id v8 = a1;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)bundleForPID:(int)a3
{
  v3 = BSXPCBundleForPID(*(uint64_t *)&a3);
  id v4 = +[BSXPCBundle bundleWithXPCBundle:v3];

  return v4;
}

+ (id)bundleWithPath:(id)a3
{
  v3 = BSXPCBundleForBundlePath(a3);
  id v4 = +[BSXPCBundle bundleWithXPCBundle:v3];

  return v4;
}

+ (id)bundleWithExecutablePath:(id)a3
{
  v3 = BSXPCBundleForExecutablePath(a3);
  id v4 = +[BSXPCBundle bundleWithXPCBundle:v3];

  return v4;
}

+ (id)bundleWithXPCBundle:(id)a3
{
  id v3 = a3;
  id v4 = -[BSXPCBundle _initWithXPCBundle:]([BSXPCBundle alloc], v3);

  return v4;
}

- (NSString)bundleIdentifier
{
  bundleIdentifier = self->_bundleIdentifier;
  if (!bundleIdentifier)
  {
    id v4 = BSXPCBundleGetIdentifier(self->_xpcBundle);
    v5 = (NSString *)[v4 copy];
    uint64_t v6 = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;

    bundleIdentifier = self->_bundleIdentifier;
  }
  return bundleIdentifier;
}

- (NSString)bundlePath
{
  bundlePath = self->_bundlePath;
  if (!bundlePath)
  {
    id v4 = BSXPCBundleGetBundlePath(self->_xpcBundle);
    v5 = (NSString *)[v4 copy];
    uint64_t v6 = self->_bundlePath;
    self->_bundlePath = v5;

    bundlePath = self->_bundlePath;
  }
  return bundlePath;
}

- (NSString)executablePath
{
  executablePath = self->_executablePath;
  if (!executablePath)
  {
    id v4 = BSXPCBundleGetExecutablePath(self->_xpcBundle);
    v5 = (NSString *)[v4 copy];
    uint64_t v6 = self->_executablePath;
    self->_executablePath = v5;

    executablePath = self->_executablePath;
  }
  return executablePath;
}

- (NSDictionary)infoDictionary
{
  infoDictionary = self->_infoDictionary;
  if (!infoDictionary)
  {
    id v4 = BSXPCBundleGetInfoDictionary(self->_xpcBundle);
    v5 = (NSDictionary *)[v4 copy];
    uint64_t v6 = self->_infoDictionary;
    self->_infoDictionary = v5;

    infoDictionary = self->_infoDictionary;
  }
  return infoDictionary;
}

- (NSString)description
{
  return (NSString *)[(BSXPCBundle *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSXPCBundle *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(BSXPCBundle *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"bundleID"];

  uint64_t v6 = [(BSXPCBundle *)self bundlePath];
  id v7 = (id)[v3 appendObject:v6 withName:@"path"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSXPCBundle *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v3 = [(BSXPCBundle *)self succinctDescriptionBuilder];
  return v3;
}

- (OS_xpc_object)xpcBundle
{
  return self->_xpcBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcBundle, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end