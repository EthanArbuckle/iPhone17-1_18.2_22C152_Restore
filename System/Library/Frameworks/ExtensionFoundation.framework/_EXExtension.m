@interface _EXExtension
- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken;
- (BOOL)hasSwiftEntryPoint;
- (BOOL)loadDelegate;
- (BOOL)shouldAcceptConnection:(id)a3;
- (Class)delegateClass;
- (NSString)bundleIdentifier;
- (_EXExtensionConfigurationProviding)configuration;
- (_EXExtensionIdentity)internalRep;
- (id)delegate;
- (id)strongDelegate;
- (void)didFinishLaunching;
- (void)loadDelegate;
- (void)prepareForSceneConnectionWithConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasSwiftEntryPoint:(BOOL)a3;
- (void)setInternalRep:(id)a3;
- (void)setStrongDelegate:(id)a3;
- (void)willFinishLaunching;
@end

@implementation _EXExtension

- (void)setHasSwiftEntryPoint:(BOOL)a3
{
  self->_hasSwiftEntryPoint = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(_EXExtensionIdentity *)self->_internalRep bundleIdentifier];
}

- (_EXExtensionConfigurationProviding)configuration
{
  return (_EXExtensionConfigurationProviding *)self->_internalRep;
}

- (Class)delegateClass
{
  v2 = [(_EXExtension *)self internalRep];
  v3 = [v2 configuration];
  v4 = [v3 principalClass];

  return (Class)v4;
}

- (BOOL)loadDelegate
{
  v3 = [(_EXExtension *)self delegateClass];
  v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(_EXExtension *)v3 loadDelegate];
  }

  id v5 = objc_alloc_init(v3);
  if (v5)
  {
    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(_EXExtension *)(uint64_t)v5 loadDelegate];
    }

    [(_EXExtension *)self setDelegate:v5];
    [(_EXExtension *)self setStrongDelegate:v5];
  }

  return v5 != 0;
}

- (void)setStrongDelegate:(id)a3
{
  id v5 = a3;
  if (self->_strongDelegate != v5)
  {
    objc_storeWeak(&self->_delegate, v5);
    objc_storeStrong(&self->_strongDelegate, a3);
  }

  MEMORY[0x1F41817F8]();
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id strongDelegate = self->_strongDelegate;
    if (strongDelegate)
    {
      self->_id strongDelegate = 0;
    }
    objc_storeWeak(&self->_delegate, obj);
    id v5 = obj;
  }
}

- (void)willFinishLaunching
{
  v3 = [(_EXExtension *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_EXExtension *)self delegate];
    [v5 extensionWillFinishLaunching:self];
  }
}

- (void)didFinishLaunching
{
  v3 = [(_EXExtension *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_EXExtension *)self delegate];
    [v5 extensionDidFinishLaunching:self];
  }
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  return 0;
}

- (void)prepareForSceneConnectionWithConfiguration:(id)a3
{
  id v7 = a3;
  char v4 = [(_EXExtension *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(_EXExtension *)self delegate];
    [v6 extension:self prepareForSceneConnectionWithConfiguration:v7];
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  char v4 = +[_EXRunningExtension sharedInstance];
  if (v4)
  {
    v6 = v4;
    [v4 hostAuditToken];
    char v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)strongDelegate
{
  return self->_strongDelegate;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (BOOL)hasSwiftEntryPoint
{
  return self->_hasSwiftEntryPoint;
}

- (_EXExtensionIdentity)internalRep
{
  return self->_internalRep;
}

- (void)setInternalRep:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRep, 0);
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong(&self->_strongDelegate, 0);
}

- (void)loadDelegate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromClass(a1);
  int v4 = 138543362;
  char v5 = v3;
}

@end