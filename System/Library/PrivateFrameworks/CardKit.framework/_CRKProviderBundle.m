@interface _CRKProviderBundle
- (NSString)providerIdentifier;
- (id)cardViewControllerForCard:(id)a3;
- (id)provider;
- (unint64_t)displayPriorityForCard:(id)a3;
- (void)_initializeProviderWithClass:(Class)a3;
- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5;
- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)unregisterCardViewController:(id)a3;
@end

@implementation _CRKProviderBundle

- (id)provider
{
  v3 = (void *)[(_CRKProviderBundle *)self principalClass];
  if (!self->_provider)
  {
    v4 = v3;
    if ([v3 conformsToProtocol:&unk_26D86DDF0]) {
      [(_CRKProviderBundle *)self _initializeProviderWithClass:v4];
    }
  }
  provider = self->_provider;

  return provider;
}

- (void)_initializeProviderWithClass:(Class)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v4 = (os_log_t *)MEMORY[0x263F31630];
  v5 = (void *)*MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = NSStringFromClass(a3);
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl(&dword_224F73000, v6, OS_LOG_TYPE_INFO, "Initializing a provider of class %@", buf, 0xCu);
  }
  v8 = (CRKProviding *)objc_alloc_init(a3);
  provider = self->_provider;
  self->_provider = v8;

  v10 = [(_CRKProviderBundle *)self infoDictionary];
  v11 = [v10 objectForKey:@"Card section view controller classes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = v11;
    v27 = v10;
    id v12 = v11;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          Class v17 = NSClassFromString(*(NSString **)(*((void *)&v29 + 1) + 8 * v16));
          int v18 = [(objc_class *)v17 isSubclassOfClass:objc_opt_class()];
          os_log_t v19 = *v4;
          if (v18)
          {
            if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
            {
              v20 = v19;
              v21 = NSStringFromClass(v17);
              *(_DWORD *)buf = 138412546;
              v34 = v21;
              __int16 v35 = 2112;
              v36 = self;
              _os_log_impl(&dword_224F73000, v20, OS_LOG_TYPE_INFO, "Registering card section view controller %@ for plugin bundle %@", buf, 0x16u);
            }
            [(objc_class *)v17 _registerWithCardKit];
          }
          else if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
          {
            v22 = v19;
            v23 = NSStringFromClass(v17);
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            *(_DWORD *)buf = 138412802;
            v34 = v23;
            __int16 v35 = 2112;
            v36 = self;
            __int16 v37 = 2112;
            v38 = v25;
            _os_log_error_impl(&dword_224F73000, v22, OS_LOG_TYPE_ERROR, "Cannot register card section view controller %@ for plugin bundle %@ as it is not a subclass of %@", buf, 0x20u);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v14);
    }

    v11 = v26;
    v10 = v27;
  }
}

- (NSString)providerIdentifier
{
  v2 = [(_CRKProviderBundle *)self bundleIdentifier];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v4 = [v5 stringWithFormat:@"%@%@", @"com.apple.cardkitbundleprovider.", v7];
  }

  return (NSString *)v4;
}

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(_CRKProviderBundle *)self provider];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(_CRKProviderBundle *)self provider];
    [v12 requestCardSectionViewProviderForCard:v13 delegate:v8 reply:v9];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    char v11 = [(_CRKProviderBundle *)self provider];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(_CRKProviderBundle *)self provider];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __85___CRKProviderBundle_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke;
      v14[3] = &unk_26470F058;
      v14[4] = self;
      id v15 = v10;
      [v13 requestCardSectionViewProviderForCard:v8 delegate:v9 reply:v14];
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (id)cardViewControllerForCard:(id)a3
{
  id v4 = a3;
  v5 = [(_CRKProviderBundle *)self provider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(_CRKProviderBundle *)self provider];
    id v8 = [v7 cardViewControllerForCard:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)unregisterCardViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(_CRKProviderBundle *)self provider];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_CRKProviderBundle *)self provider];
    [v6 unregisterCardViewController:v7];
  }
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  id v4 = a3;
  char v5 = [(_CRKProviderBundle *)self provider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(_CRKProviderBundle *)self provider];
    unint64_t v8 = [v7 displayPriorityForCard:v4];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_CRKProviderBundle *)self provider];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [(_CRKProviderBundle *)self provider];
    [v12 presentation:v13 didApplyCardSectionViewSource:v8 toCardViewController:v9];
  }
}

- (void).cxx_destruct
{
}

@end