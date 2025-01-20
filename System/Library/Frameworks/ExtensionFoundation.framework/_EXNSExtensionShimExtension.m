@interface _EXNSExtensionShimExtension
- (BOOL)shouldAcceptConnection:(id)a3;
- (Class)delegateClass;
- (Class)extensionContextClass;
- (Class)principalClass;
- (void)setExtensionContextClass:(Class)a3;
- (void)setPrincipalClass:(Class)a3;
- (void)willFinishLaunching;
@end

@implementation _EXNSExtensionShimExtension

- (Class)delegateClass
{
  return 0;
}

- (void)willFinishLaunching
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromClass(*a1);
  int v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "NSExtension shim launched with principal class: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  return 0;
}

- (Class)principalClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrincipalClass:(Class)a3
{
}

- (Class)extensionContextClass
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionContextClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContextClass, 0);

  objc_storeStrong((id *)&self->_principalClass, 0);
}

@end