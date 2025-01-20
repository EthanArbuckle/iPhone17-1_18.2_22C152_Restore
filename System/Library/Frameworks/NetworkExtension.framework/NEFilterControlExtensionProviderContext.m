@interface NEFilterControlExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)dealloc;
- (void)dispose;
- (void)handleNewFlow:(id)a3 completionHandler:(id)a4;
- (void)handleReport:(id)a3;
- (void)notifyRulesChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopObserving;
@end

@implementation NEFilterControlExtensionProviderContext

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  id v6 = [(NEExtensionProviderContext *)self hostContext];
  [v6 provideURLAppendStringMap:v4];
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  id v6 = [(NEExtensionProviderContext *)self hostContext];
  [v6 provideRemediationMap:v4];
}

- (void)notifyRulesChanged
{
  id v2 = [(NEExtensionProviderContext *)self hostContext];
  [v2 notifyRulesChanged];
}

- (void)handleReport:(id)a3
{
  id v4 = a3;
  id v5 = [(NEExtensionProviderContext *)self _principalObject];
  [v5 handleReport:v4];
}

- (void)handleNewFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = a3;
  v8 = [(NEExtensionProviderContext *)self _principalObject];
  id v9 = v8;
  if (v7 && (v7[10] & 1) != 0) {
    [v8 handleRemediationForFlow:v7 completionHandler:v6];
  }
  else {
    [v8 handleNewFlow:v7 completionHandler:v6];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  v7 = [(NEExtensionProviderContext *)self _principalObject];
  if ([v14 isEqualToString:@"remediationMap"])
  {
    v8 = [v7 remediationMap];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [v7 remediationMap];
      [(NEFilterControlExtensionProviderContext *)self provideRemediationMap:v10];
    }
  }
  if ([v14 isEqualToString:@"URLAppendStringMap"])
  {
    v11 = [v7 URLAppendStringMap];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [v7 URLAppendStringMap];
      [(NEFilterControlExtensionProviderContext *)self provideURLAppendStringMap:v13];
    }
  }
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.filter-control";
}

- (void)dealloc
{
  -[NEFilterControlExtensionProviderContext stopObserving](self);
  v3.receiver = self;
  v3.super_class = (Class)NEFilterControlExtensionProviderContext;
  [(NEExtensionProviderContext *)&v3 dealloc];
}

- (void)stopObserving
{
  if (a1 && (a1[104] & 1) != 0)
  {
    id v2 = [a1 _principalObject];
    [v2 removeObserver:a1 forKeyPath:@"remediationMap"];
    [v2 removeObserver:a1 forKeyPath:@"URLAppendStringMap"];
    a1[104] = 0;
  }
}

- (void)dispose
{
  if (!self || !self->super.super._isDisposed)
  {
    -[NEFilterControlExtensionProviderContext stopObserving](self);
    v3.receiver = self;
    v3.super_class = (Class)NEFilterControlExtensionProviderContext;
    [(NEExtensionProviderContext *)&v3 dispose];
  }
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NEExtensionProviderContext *)self _principalObject];
  objc_initWeak(&location, v8);

  v15.receiver = self;
  v15.super_class = (Class)NEFilterControlExtensionProviderContext;
  [(NEFilterExtensionProviderContext *)&v15 startFilterWithOptions:v6 completionHandler:v7];
  objc_initWeak(&from, self);
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling startFilterWithCompletionHandler", buf, 0xCu);
  }

  id v10 = objc_loadWeakRetained(&location);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__NEFilterControlExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_1E598F940;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v10 startFilterWithCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __84__NEFilterControlExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (WeakRetained && v5)
  {
    if (v5[41])
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "The completion handler for startFilterWithOptions: was executed twice", v8, 2u);
      }
    }
    else
    {
      v5[41] = 1;
      if (!v3)
      {
        [WeakRetained addObserver:v5 forKeyPath:@"remediationMap" options:5 context:0];
        [WeakRetained addObserver:v6 forKeyPath:@"URLAppendStringMap" options:5 context:0];
        v6[104] = 1;
      }
      [v6 startedWithError:v3];
    }
  }
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3640 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3640, &__block_literal_global_69_3641);
  }
  id v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_3642;

  return v2;
}

uint64_t __74__NEFilterControlExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_3642 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0942C8];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3645 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3645, &__block_literal_global_3646);
  }
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3647;

  return v2;
}

uint64_t __76__NEFilterControlExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_3647 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094218];

  return MEMORY[0x1F41817F8]();
}

@end