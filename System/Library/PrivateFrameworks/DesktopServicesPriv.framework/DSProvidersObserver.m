@interface DSProvidersObserver
- (BOOL)populated;
- (id).cxx_construct;
- (id)providers;
- (id)providersByAddingProviderIfNeeded:(id)a3;
- (void)receivedChanges:(id)a3;
- (void)setProviders:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation DSProvidersObserver

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

void __37__DSProvidersObserver_startObserving__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if (v8)
  {
    v9 = LogObj(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_1D343E000, v9, OS_LOG_TYPE_ERROR, "-beginMonitoringProviderDomainChangesWithHandler: received an error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) receivedChanges:v7];
  }
}

- (void)receivedChanges:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26 = self;
  v28 = [(DSProvidersObserver *)self providers];
  v25 = [v4 allKeys];
  v27 = [v25 sortedArrayUsingSelector:sel_compare_];
  IDContainerIteratorAdaptor<NSArray<NSString *>>::NSForwardIterator<NSArray<NSString *>>::NSForwardIterator((uint64_t)v30, v27);
  IDContainerIteratorAdaptor<NSArray<NSString *>>::IDContainerIteratorAdaptor((uint64_t)v29, -1, v27);
  uint64_t v5 = std::distance[abi:ne180100]<IDContainerIteratorAdaptor<NSArray<NSString *>>>((uint64_t)v30, (uint64_t)v29);

  v24 = type_traits_extras::CopyAsHelper<NSMutableArray<FPProviderDomain *> * {__strong}>::MakeWithCapacity(v5);
  IDContainerIteratorAdaptor<NSArray<NSString *>>::NSForwardIterator<NSArray<NSString *>>::NSForwardIterator((uint64_t)&buf, v27);
  IDContainerIteratorAdaptor<NSArray<NSString *>>::IDContainerIteratorAdaptor((uint64_t)v31, -1, v27);
  id v6 = v24;
  while (buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value != v31[0] || v37 != v31[16])
  {
    id v7 = *(id *)(*(void *)&buf.fData.__impl_.__index + 8 * v36);
    objc_msgSend(v4, "objectForKeyedSubscript:", v7, v24);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (([v8 supportsEnumeration] & 1) == 0)
    {

LABEL_9:
      id v8 = v7;
      goto LABEL_12;
    }
    v9 = +[FIProviderDomain providerDomainForDomain:v8];
    if ([v9 isUsingFPFS])
    {
      int v10 = [v8 storageURLs];
      BOOL v11 = [v10 count] == 0;

      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v7 = v6;
    [v7 addObject:v8];
LABEL_12:

    uint64_t v12 = v36;
    if (v36 >= v35 - 1)
    {
      uint64_t v13 = [buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value countByEnumeratingWithState:&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 1 objects:v34 count:4];
      uint64_t v12 = -1;
      uint64_t v35 = v13;
      uint64_t v36 = -1;
    }
    if (v34[4] != *v33)
    {
      objc_enumerationMutation(buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
      uint64_t v12 = v36;
    }
    uint64_t v36 = v12 + 1;
    ++v37;
  }

  if (!objc_msgSend(v6, "isEqualToArray:", v28, v24)) {
    goto LABEL_23;
  }
  if ([v6 count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      v15 = [v6 objectAtIndexedSubscript:v14];
      v16 = [v28 objectAtIndexedSubscript:v14];
      BOOL HaveEquivalentProperties = FileProviderDomainsHaveEquivalentProperties(v16, v15);

      if (!HaveEquivalentProperties) {
        break;
      }
      if (++v14 >= (unint64_t)[v6 count]) {
        goto LABEL_32;
      }
    }
LABEL_23:
    v18 = LogObj(4);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543362;
      *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v6;
      _os_log_impl(&dword_1D343E000, v18, OS_LOG_TYPE_DEFAULT, "Provider list update = %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v19 = (TNode *)[(DSProvidersObserver *)self setProviders:v6];
    BOOL populated = self->_populated;
    v26->_BOOL populated = 1;
    if (TNode::IsContextOpen(v19))
    {
      if (populated)
      {
        int v21 = 0x1000000;
      }
      else
      {
        v22 = (TNode *)TNodeFromFINode(v26->fParentNode.fFINode);
        if (TNode::IsPopulated(v22)) {
          int v21 = 0x1000000;
        }
        else {
          int v21 = 20971520;
        }
      }
      LODWORD(v31[0]) = v21;
      v23 = (const TNode *)TNodeFromFINode(v26->fParentNode.fFINode);
      buf.fData.__impl_.__index = 0;
      std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, v31);
      TNode::RequestInternalTask(v23, 1000, &buf, 0);
      TPropertyValue::~TPropertyValue(&buf);
    }
  }
LABEL_32:
}

- (id)providers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSArray *)v2->_providers copy];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)populated
{
  return self->_populated;
}

- (void)setProviders:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (![(NSArray *)v5->_providers isEqualToArray:v4])
  {
    id v6 = LogObj(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1D343E000, v6, OS_LOG_TYPE_INFO, "FPProviders update: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = [v4 copy];
  providers = v5->_providers;
  v5->_providers = (NSArray *)v7;

  objc_sync_exit(v5);
}

- (void)startObserving
{
  if (!self->_token)
  {
    v3 = (void *)FPProviderDomainClass();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = __37__DSProvidersObserver_startObserving__block_invoke;
    v11[3] = &__block_descriptor_40_ea8_32c50_ZTSKZ37__DSProvidersObserver_startObserving_E3__6_e34_v24__0__NSDictionary_8__NSError_16l;
    uint64_t v12 = self;
    id v4 = v12;
    uint64_t v5 = [v3 beginMonitoringProviderDomainChangesWithHandler:v11];
    token = self->_token;
    self->_token = v5;

    if (TNode::IsContextOpen(v7))
    {
      id v8 = (const TNode *)TNodeFromFINode(v4[1]);
      int v9 = 0x800000;
      v10.fData.__impl_.__index = 0;
      std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&v10, &v9);
      TNode::RequestInternalTask(v8, 1000, &v10, 0);
      TPropertyValue::~TPropertyValue(&v10);
    }
  }
}

- (void)stopObserving
{
  [(id)FPProviderDomainClass() endMonitoringProviderDomainChanges:self->_token];
  token = self->_token;
  self->_token = 0;
}

- (id)providersByAddingProviderIfNeeded:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4 && !v5->_populated && ![(NSArray *)v5->_providers containsObject:v4])
  {
    providers = v5->_providers;
    if (providers)
    {
      uint64_t v7 = [(NSArray *)providers arrayByAddingObject:v4];
      id v8 = v5->_providers;
      v5->_providers = (NSArray *)v7;
    }
    else
    {
      v13[0] = v4;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      TPropertyValue v10 = v5->_providers;
      v5->_providers = (NSArray *)v9;
    }
  }
  uint64_t v11 = v5->_providers;
  objc_sync_exit(v5);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_token, 0);
  fFINode = self->fParentNode.fFINode;
}

@end