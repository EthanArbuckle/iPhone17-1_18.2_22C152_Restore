@interface DSFPItemStatusObserver
- (BOOL)isPopulated;
- (id).cxx_construct;
- (id)fpError;
- (id)fpItems;
- (void)collection:(id)a3 didEncounterError:(id)a4;
- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6;
- (void)collection:(id)a3 didUpdateObservedItem:(id)a4;
- (void)collectionDidFinishGathering:(id)a3;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)resetError;
- (void)startObserving:(id)a3 forParent:(const TNodePtr *)a4 withQueue:(id)a5;
- (void)stopObserving;
- (void)updateFPItems:(id)a3;
- (void)updateNodesFPItemsFromCollection:(const void *)a3;
@end

@implementation DSFPItemStatusObserver

- (void)startObserving:(id)a3 forParent:(const TNodePtr *)a4 withQueue:(id)a5
{
  to[2] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a5;
  v10 = (std::mutex *)((char *)self + 40);
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v11 = (TNode *)TNodeFromFINode(a4->fFINode);
  if ((TNode::VirtualType(v11) - 23) <= 1u)
  {
    id v12 = (id)*((void *)self + 3);
    if (v12 != v8)
    {
      *((void *)self + 3) = 0;
    }
  }
  if (!*((void *)self + 3)) {
    goto LABEL_13;
  }
  v13 = LogObj(4);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> v14 = *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)self + 24);
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = v14;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2114;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v8;
    _os_log_impl(&dword_1D343E000, v13, OS_LOG_TYPE_INFO, "Reusing existing collection. Existing: %{public}@, Ignored: %{public}@", (uint8_t *)&buf, 0x16u);
  }

  if (*((void *)self + 3))
  {
    v15 = (void *)*((void *)self + 4);
    if (v15)
    {
      v16 = LogObj(4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        buf.fData.__impl_.__data.__tail.__tail.__tail.__head.__value = 0;
        _os_log_impl(&dword_1D343E000, v16, OS_LOG_TYPE_INFO, "Clearing FPError from collection status observer on reuse", (uint8_t *)&buf, 2u);
      }

      v15 = (void *)*((void *)self + 4);
    }
    *((void *)self + 4) = 0;
  }
  else
  {
LABEL_13:
    id v17 = v8;
    v15 = (void *)*((void *)self + 3);
    *((void *)self + 3) = v17;
  }

  v18 = (void *)*((void *)self + 3);
  if (v18)
  {
    [v18 setWorkingQueue:v9];
    [*((id *)self + 3) setDelegate:self];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke;
    block[3] = &__block_descriptor_40_ea8_32c74_ZTSKZ61__DSFPItemStatusObserver_startObserving_forParent_withQueue__E3__9_e5_v8__0l;
    id v19 = *((id *)self + 3);
    id v50 = v19;
    dispatch_async(v9, block);

    v20 = (TNode *)TNodeFromFINode(a4->fFINode);
    if ((TNode::VirtualType(v20) - 23) <= 1u && ICloudDriveFPFSEnabled())
    {
      objc_initWeak((id *)&buf, self);
      dispatch_time_t v21 = dispatch_time(0, 3000000000);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3321888768;
      v47[2] = __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke_31;
      v47[3] = &__block_descriptor_40_ea8_32c75_ZTSKZ61__DSFPItemStatusObserver_startObserving_forParent_withQueue__E4__10_e5_v8__0l;
      objc_copyWeak(to, (id *)&buf);
      objc_copyWeak(&v48, to);
      dispatch_after(v21, v9, v47);
      objc_destroyWeak(to);
      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)&buf);
    }
  }
  v22 = (FINode **)((char *)self + 8);
  objc_storeStrong((id *)self + 1, a4->fFINode);
  v23 = objc_cast<FPExtensionCollection,FPItemCollection * {__strong}>(*((void **)self + 3));
  v24 = v23;
  if (v23)
  {
    v25 = [v23 settings];
    v26 = [(TString *)v25 enumeratedURL];
    *((unsigned char *)self + 104) = v26 != 0;
  }
  else
  {
    uint64_t v27 = TNodeFromFINode(a4->fFINode);
    v28 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v27);
    os_unfair_lock_lock(v28);
    v30 = *(TFSInfo **)(v27 + 16);
    v29 = *(std::__shared_weak_count **)(v27 + 24);
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v28);
    TFSInfo::GetFPItem(v30);
    v25 = (TString *)objc_claimAutoreleasedReturnValue();
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
    *((unsigned char *)self + 104) = v25 == 0;
  }

  int v31 = *((unsigned __int8 *)self + 104);
  if (*((unsigned char *)self + 104))
  {
    TString::TString((TString *)&buf, "", 0);
  }
  else
  {
    uint64_t v32 = TNodeFromFINode(a4->fFINode);
    v33 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v32);
    os_unfair_lock_lock(v33);
    v35 = *(TFSInfo **)(v32 + 16);
    v34 = *(std::__shared_weak_count **)(v32 + 24);
    if (v34) {
      atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v33);
    TFSInfo::GetFPItem(v35);
    a4 = (const TNodePtr *)objc_claimAutoreleasedReturnValue();
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    v25 = [(TNodePtr *)(id)a4 itemIdentifier];
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value = (int64_t)&stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable((TString *)&buf, v25);
  }
  if ((TPropertyValue *)((char *)self + 16) != &buf)
  {
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::operator=<__CFString const*,TRetainReleasePolicy<__CFString const*>>((const void **)self + 2, (const void **)&buf);
    CFRetain(&stru_1F2ABD380);
    if (buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value) {
      CFRelease(buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
    }
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value = (int64_t)&stru_1F2ABD380;
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&buf);
  if (!v31)
  {
  }
  v36 = LogObj(4);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = TNodeFromFINode(*v22);
    v38 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v37);
    os_unfair_lock_lock(v38);
    v40 = *(TFSInfo **)(v37 + 16);
    v39 = *(std::__shared_weak_count **)(v37 + 24);
    if (v39) {
      atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v38);
    TFSInfo::dCPath(v40, 1, &buf);
    v46.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    if (*((char *)&buf.fData.__impl_.__index + 7) >= 0) {
      p_TPropertyValue buf = &buf;
    }
    else {
      p_TPropertyValue buf = (TPropertyValue *)buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value;
    }
    if (*((char *)&buf.fData.__impl_.__index + 7) >= 0) {
      CFIndex buffer = *((unsigned __int8 *)&buf.fData.__impl_.__index + 7);
    }
    else {
      CFIndex buffer = (CFIndex)buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer;
    }
    TString::SetFromUTF8(&v46, (const UInt8 *)p_buf, buffer);
    v43 = SanitizedPath(&v46);
    LODWORD(to[0]) = 138543362;
    *(id *)((char *)to + 4) = v43;
    _os_log_impl(&dword_1D343E000, v36, OS_LOG_TYPE_DEBUG, "DSFPItemStatusObserver start for %{public}@", (uint8_t *)to, 0xCu);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v46.fString.fRef);
    if (*((char *)&buf.fData.__impl_.__index + 7) < 0) {
      operator delete(buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
    }
    if (v39) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v39);
    }
  }
  if (TNode::IsContextOpen(v44))
  {
    v45 = (const TNode *)TNodeFromFINode(*v22);
    LODWORD(to[0]) = 0x800000;
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, to);
    TNode::RequestInternalTask(v45, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }
  std::mutex::unlock(v10);
}

uint64_t __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObserving];
}

void __61__DSFPItemStatusObserver_startObserving_forParent_withQueue___block_invoke_31(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[3] && ([WeakRetained isPopulated] & 1) == 0)
  {
    v3 = LogObj(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D343E000, v3, OS_LOG_TYPE_ERROR, "Library load timeout, updating items manually", v4, 2u);
    }

    [v2 updateFPItems:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)stopObserving
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = (std::mutex *)((char *)self + 40);
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v4 = LogObj(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = TNodeFromFINode(*((FINode **)self + 1));
    v6 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v5);
    os_unfair_lock_lock(v6);
    id v8 = *(TFSInfo **)(v5 + 16);
    v7 = *(std::__shared_weak_count **)(v5 + 24);
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v6);
    TFSInfo::dCPath(v8, 1, __p);
    v21.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    if ((v20 & 0x80u) == 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      CFIndex v10 = v20;
    }
    else {
      CFIndex v10 = (CFIndex)__p[1];
    }
    TString::SetFromUTF8(&v21, (const UInt8 *)v9, v10);
    v11 = SanitizedPath(&v21);
    *(_DWORD *)TPropertyValue buf = 138543362;
    v23 = v11;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_DEBUG, "DSFPItemStatusObserver stop for %{public}@", buf, 0xCu);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21.fString.fRef);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  id v12 = (void *)*((void *)self + 3);
  if (v12)
  {
    v13 = [v12 delegate];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      v15 = [*((id *)self + 3) workingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3321888768;
      block[2] = __39__DSFPItemStatusObserver_stopObserving__block_invoke;
      block[3] = &__block_descriptor_40_ea8_32c53_ZTSKZ39__DSFPItemStatusObserver_stopObserving_E4__11_e5_v8__0l;
      id v16 = *((id *)self + 3);
      id v18 = v16;
      dispatch_async(v15, block);

      [*((id *)self + 3) setDelegate:0];
    }
  }
  std::mutex::unlock(v3);
}

uint64_t __39__DSFPItemStatusObserver_stopObserving__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObserving];
}

- (BOOL)isPopulated
{
  v2 = (void *)*((void *)self + 3);
  if (v2) {
    LOBYTE(v2) = [v2 isGathering] ^ 1;
  }
  return (char)v2;
}

- (void)updateFPItems:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  v4 = LogObj(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = TNodeFromFINode(*((FINode **)self + 1));
    v6 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v5);
    os_unfair_lock_lock(v6);
    v7 = *(TFSInfo **)(v5 + 16);
    id v8 = *(std::__shared_weak_count **)(v5 + 24);
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v6);
    TFSInfo::dCPath(v7, 1, &__p);
    v41.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    if (*((char *)&__p.fData.__impl_.__index + 7) >= 0) {
      p_p = &__p;
    }
    else {
      p_p = (TPropertyValue *)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value;
    }
    if (*((char *)&__p.fData.__impl_.__index + 7) >= 0) {
      CFIndex buffer = *((unsigned __int8 *)&__p.fData.__impl_.__index + 7);
    }
    else {
      CFIndex buffer = (CFIndex)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer;
    }
    TString::SetFromUTF8(&v41, (const UInt8 *)p_p, buffer);
    v11 = SanitizedPath(&v41);
    uint64_t v12 = [v36 count];
    *(_DWORD *)TPropertyValue buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v50 = 2048;
    uint64_t v51 = v12;
    _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_DEBUG, "DSFPItemStatusObserver update for %{public}@, %ld items", buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v41.fString.fRef);
    if (*((char *)&__p.fData.__impl_.__index + 7) < 0) {
      operator delete(__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  v13 = (FINode **)((char *)self + 8);
  BOOL v14 = (TNode *)TNodeFromFINode(*((FINode **)self + 1));
  v15 = (TNode *)TNode::VirtualType(v14);
  int v16 = (int)v15;
  if (!TNode::IsContextOpen(v15)
    || ((int v17 = ICloudDriveFPFSEnabled(), (v16 - 23) < 2) ? (v18 = v17) : (v18 = 0), v18 != 1))
  {
    if (![v36 count]) {
      goto LABEL_43;
    }
    memset(&__p, 0, sizeof(__p));
    TNode::StPopulating::StPopulating((TNode::StPopulating *)buf, (const TNodePtr *)self + 1, 0);
    v38 = (id *)((char *)self + 8);
    v39 = *(TChildrenList **)(TNodeFromFINode(*v13) + 56);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v36;
    uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (!v20) {
      goto LABEL_42;
    }
    uint64_t v21 = *(void *)v44;
    v22 = (void **)((char *)self + 16);
LABEL_24:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v44 != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
      v25 = [v24 itemIdentifier];
      if ((operator==(v22, v25) & 1) == 0) {
        break;
      }
      v26 = [v24 domainIdentifier];
      v41.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v41, v26);

      uint64_t v27 = [*v38 fpItem];
      v28 = [v27 domainIdentifier];
      int v29 = operator==((void **)&v41.fString.fRef, v28);

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v41.fString.fRef);
      if (!v29) {
        goto LABEL_32;
      }
      v41.fString.fRef = (__CFString *)*v38;
      id v42 = v24;
      if (__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer >= (char *)*(void *)&__p.fData.__impl_.__index)
      {
        uint64_t v32 = (char *)std::vector<std::pair<TNodePtr,FPItem * {__strong}>>::__push_back_slow_path<std::pair<TNodePtr,FPItem * {__strong}>>(&__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value, (uint64_t)&v41);
      }
      else
      {
        v30 = TNodePtr::TNodePtr((void *)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer, (id *)&v41.fString.fRef);
        id v31 = v42;
        id v42 = 0;
        v30[1] = v31;
        uint64_t v32 = (char *)(v30 + 2);
      }
      __p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.CFIndex buffer = v32;

LABEL_40:
      if (v20 == ++v23)
      {
        uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (!v20)
        {
LABEL_42:

          TNode::StPopulating::~StPopulating((TNode::StPopulating *)buf);
          TNode::AttachFPItemsMetadata((id **)&__p, 1, 1);
          *(void *)TPropertyValue buf = &__p;
          std::vector<fstd::optional_err<FPItem * {__strong},NSError * {__strong}>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          goto LABEL_43;
        }
        goto LABEL_24;
      }
    }

LABEL_32:
    TChildrenList::FindNodeMatchingFPItem(v39, (FPItem *)v24, (TNodePtr *)&v40);
    if (TNodeFromFINode(v40))
    {
      v41.fString.fRef = (__CFString *)v40;
      id v42 = v24;
      if (__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer >= (char *)*(void *)&__p.fData.__impl_.__index)
      {
        v35 = (char *)std::vector<std::pair<TNodePtr,FPItem * {__strong}>>::__push_back_slow_path<std::pair<TNodePtr,FPItem * {__strong}>>(&__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__head.__value, (uint64_t)&v41);
      }
      else
      {
        v33 = TNodePtr::TNodePtr((void *)__p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.buffer, (id *)&v41.fString.fRef);
        id v34 = v42;
        id v42 = 0;
        v33[1] = v34;
        v35 = (char *)(v33 + 2);
      }
      __p.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__head.__value.CFIndex buffer = v35;
    }
    goto LABEL_40;
  }
  id v19 = (const TNode *)TNodeFromFINode(*v13);
  memset(&__p, 0, sizeof(__p));
  TNode::RequestInternalTask(v19, 1000, &__p, 0);
  TPropertyValue::~TPropertyValue(&__p);
LABEL_43:
}

- (id)fpItems
{
  v3 = (const TNodePtr *)((char *)self + 8);
  v4 = (TNode *)TNodeFromFINode(*((FINode **)self + 1));
  if (TNode::VirtualType(v4) - 23 > 1) {
    goto LABEL_15;
  }
  uint64_t v5 = +[FINode protectedAppIdentifiers];
  if (![v5 count])
  {

LABEL_15:
    TNode::StPopulating::StPopulating((TNode::StPopulating *)&obj, v3, 0);
    int v17 = [*((id *)self + 3) items];
    id v10 = (id)[v17 copy];

    TNode::StPopulating::~StPopulating((TNode::StPopulating *)&obj);
    goto LABEL_16;
  }
  TNode::StPopulating::StPopulating((TNode::StPopulating *)v19, v3, 0);
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7 = [*((id *)self + 3) items];
  id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v9 = [*((id *)self + 3) items];
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::NSForwardIterator<NSArray<FPItem *>>::NSForwardIterator((uint64_t)&obj, v9);
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::IDContainerIteratorAdaptor((uint64_t)v20, -1, v9);
  id v10 = v8;
  while (obj != (id)v20[0] || v28 != v20[16])
  {
    id v11 = *(id *)(v23 + 8 * v27);
    uint64_t v12 = objc_msgSend(v11, "fp_appContainerBundleIdentifier");
    char v13 = [v5 containsObject:v12];

    if ((v13 & 1) == 0)
    {
      id v14 = *(id *)(v23 + 8 * v27);
      [v10 addObject:v14];
    }
    uint64_t v15 = v27;
    if (v27 >= v26 - 1)
    {
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v25 count:4];
      uint64_t v15 = -1;
      uint64_t v26 = v16;
      uint64_t v27 = -1;
    }
    if (v25[4] != *v24)
    {
      objc_enumerationMutation(obj);
      uint64_t v15 = v27;
    }
    uint64_t v27 = v15 + 1;
    ++v28;
  }

  TNode::StPopulating::~StPopulating((TNode::StPopulating *)v19);
LABEL_16:
  return v10;
}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = LogObj(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = TNodeFromFINode(*((FINode **)self + 1));
    id v8 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v7);
    os_unfair_lock_lock(v8);
    id v10 = *(TFSInfo **)(v7 + 16);
    v9 = *(std::__shared_weak_count **)(v7 + 24);
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v8);
    TFSInfo::Name(v10, &v16);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    id v11 = SanitizedStr(&v16);
    int v12 = [*((id *)self + 3) isGathering];
    char v13 = "no";
    if (v12) {
      char v13 = "yes";
    }
    *(_DWORD *)TPropertyValue buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&unsigned char buf[12] = 2082;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1D343E000, v6, OS_LOG_TYPE_INFO, "didUpdateObservedItem - parent: %{public}@, gathering: %{public}s", buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
  }
  if (TNode::IsContextOpen(v14))
  {
    if (*((unsigned char *)self + 104) && !CFStringGetLength(*((CFStringRef *)self + 2)))
    {
      uint64_t v15 = [v5 itemIdentifier];
      if (*((TString **)self + 2) != v15) {
        TString::SetStringRefAsImmutable((TString *)self + 2, v15);
      }
    }
    id v18 = *((id *)self + 1);
    id v19 = v5;
    memset(buf, 0, sizeof(buf));
    v16.fString.fRef = (__CFString *)buf;
    char v17 = 0;
    *(void *)TPropertyValue buf = operator new(0x10uLL);
    *(void *)&buf[8] = *(void *)buf;
    *(void *)&buf[16] = *(void *)buf + 16;
    *(void *)&buf[8] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<TNodePtr,FPItem * {__strong}>>,std::pair<TNodePtr,FPItem * {__strong}> const*,std::pair<TNodePtr,FPItem * {__strong}> const*,std::pair<TNodePtr,FPItem * {__strong}>*>((uint64_t)&buf[16], &v18, (id *)buf, *(void **)buf);
    TNode::AttachFPItemsMetadata((id **)buf, 1, 1);
    v16.fString.fRef = (__CFString *)buf;
    std::vector<fstd::optional_err<FPItem * {__strong},NSError * {__strong}>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  }
}

- (void)collectionDidFinishGathering:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogObj(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = TNodeFromFINode(*((FINode **)self + 1));
    uint64_t v7 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v6);
    os_unfair_lock_lock(v7);
    v9 = *(TFSInfo **)(v6 + 16);
    id v8 = *(std::__shared_weak_count **)(v6 + 24);
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v7);
    TFSInfo::Name(v9, &v18);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    id v10 = SanitizedStr(&v18);
    int v11 = [*((id *)self + 3) isGathering];
    int v12 = "no";
    if (v11) {
      int v12 = "yes";
    }
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v10;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2082;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v12;
    _os_log_impl(&dword_1D343E000, v5, OS_LOG_TYPE_INFO, "collectionDidFinishGathering - parent: %{public}@, gathering: %{public}s", (uint8_t *)&buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v18.fString.fRef);
  }
  char v13 = [v4 items];
  [(DSFPItemStatusObserver *)self updateFPItems:v13];

  if (TNode::IsContextOpen(v14))
  {
    uint64_t v15 = (TNode *)TNodeFromFINode(*((FINode **)self + 1));
    if (TNode::IsPopulated(v15)) {
      int v16 = 0x1000000;
    }
    else {
      int v16 = 20971520;
    }
    LODWORD(v18.fString.fRef) = v16;
    char v17 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, &v18);
    TNode::RequestInternalTask(v17, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogObj(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = TNodeFromFINode(*((FINode **)self + 1));
    uint64_t v7 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v6);
    os_unfair_lock_lock(v7);
    v9 = *(TFSInfo **)(v6 + 16);
    id v8 = *(std::__shared_weak_count **)(v6 + 24);
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v7);
    TFSInfo::Name(v9, &v16);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    id v10 = SanitizedStr(&v16);
    int v11 = [*((id *)self + 3) isGathering];
    int v12 = "no";
    if (v11) {
      int v12 = "yes";
    }
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v10;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2082;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v12;
    _os_log_impl(&dword_1D343E000, v5, OS_LOG_TYPE_INFO, "dataForCollectionShouldBeReloaded - parent: %{public}@, gathering: %{public}s", (uint8_t *)&buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
  }
  char v13 = [v4 items];
  [(DSFPItemStatusObserver *)self updateFPItems:v13];

  if (TNode::IsContextOpen(v14))
  {
    uint64_t v15 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    LODWORD(v16.fString.fRef) = 256;
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, &v16);
    TNode::RequestInternalTask(v15, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }
}

- (void)updateNodesFPItemsFromCollection:(const void *)a3
{
  id v4 = objc_msgSend(*((id *)self + 3), "items", a3);
  [(DSFPItemStatusObserver *)self updateFPItems:v4];

  if (TNode::IsContextOpen(v5))
  {
    uint64_t v6 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    int v7 = 256;
    v8.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&v8, &v7);
    TNode::RequestInternalTask(v6, 1000, &v8, 0);
    TPropertyValue::~TPropertyValue(&v8);
  }
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = LogObj(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = TNodeFromFINode(*((FINode **)self + 1));
    id v14 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v13);
    os_unfair_lock_lock(v14);
    TString v16 = *(TFSInfo **)(v13 + 16);
    uint64_t v15 = *(std::__shared_weak_count **)(v13 + 24);
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v14);
    TFSInfo::Name(v16, &v23);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    char v17 = SanitizedStr(&v23);
    int v18 = [*((id *)self + 3) isGathering];
    id v19 = "no";
    if (v18) {
      id v19 = "yes";
    }
    buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v17;
    *((_WORD *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2082;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&buf.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v19;
    _os_log_impl(&dword_1D343E000, v12, OS_LOG_TYPE_INFO, "collection didUpdateItems - parent: %{public}@, gathering: %{public}s", (uint8_t *)&buf, 0x16u);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v23.fString.fRef);
  }
  [(DSFPItemStatusObserver *)self updateFPItems:v9];
  uint64_t v20 = [v10 allValues];
  [(DSFPItemStatusObserver *)self updateFPItems:v20];

  uint64_t v21 = (TNode *)[v9 count];
  if ((v21 || (uint64_t v21 = (TNode *)[v11 count]) != 0) && TNode::IsContextOpen(v21))
  {
    uint64_t v22 = (const TNode *)TNodeFromFINode(*((FINode **)self + 1));
    LODWORD(v23.fString.fRef) = 256;
    buf.fData.__impl_.__index = 0;
    std::variant<std::monostate,BOOL,unsigned char,short,int,long long,unsigned int,double,Point,Blob,NSObject * {__strong},TString,TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>,TRef<__CFNumber const*,TRetainReleasePolicy<__CFNumber const*>>,TRef<__CFData const*,TRetainReleasePolicy<__CFData const*>>,TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>,TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>,TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>,TRef<__CFFileSecurity *,TRetainReleasePolicy<__CFFileSecurity *>>,TRef<TReferenceCounted *,TRetainReleasePolicy<TReferenceCounted *>>,Property,NodeRequestOptions,NodeDSStoreStatus,DSBladeRunnerFlags>::operator=[abi:ne180100]<NodeRequestOptions const&,0,NodeRequestOptions,21ul,0>(&buf, &v23);
    TNode::RequestInternalTask(v22, 1000, &buf, 0);
    TPropertyValue::~TPropertyValue(&buf);
  }
}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  TPropertyValue v8 = LogObj(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__head.__value = 138543618;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 4) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v6;
    *((_WORD *)&v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 6) = 2112;
    *(__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags> *)((char *)&v21.fData.__impl_.__data.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail.__tail + 14) = (__union<std::__variant_detail::_Trait::_Available, 10UL, NSObject *, TString, TRef<const __CFString *>, TRef<const __CFNumber *>, TRef<const __CFData *>, TRef<const __CFDictionary *>, TRef<const __CFURL *>, TRef<const __CFArray *>, TRef<__CFFileSecurity *>, TRef<TReferenceCounted *>, Property, NodeRequestOptions, NodeDSStoreStatus, DSBladeRunnerFlags>)v7;
    _os_log_impl(&dword_1D343E000, v8, OS_LOG_TYPE_ERROR, "collection didEncounterError: %{public}@: %@", (uint8_t *)&v21, 0x16u);
  }

  BOOL IsContextOpen = TNode::IsContextOpen(v9);
  id v11 = self;
  objc_sync_enter(v11);
  int v12 = [v7 domain];
  FileProviderErrorDomain((TString *)&v21);
  if (operator==((void **)&v21, v12))
  {
    BOOL v13 = [v7 code] == -2001;
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);

    if (v13)
    {
      objc_sync_exit(v11);

      goto LABEL_17;
    }
  }
  else
  {
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);
  }
  if (*((id *)v11 + 4) == v7)
  {
    BOOL IsContextOpen = 0;
  }
  else
  {
    uint64_t v14 = [v7 copy];
    uint64_t v15 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v14;
  }
  objc_sync_exit(v11);

  if (TNode::IsContextOpen(v16))
  {
    char v17 = [v7 domain];
    FileProviderInternalErrorDomain((TString *)&v21);
    if (operator==((void **)&v21, v17))
    {
      BOOL v18 = [v7 code] == 15;
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);

      if (v18)
      {
        id v19 = (TNode *)TNodeFromFINode(*((FINode **)v11 + 1));
        TNode::ClearFPItems(v19);
        goto LABEL_17;
      }
    }
    else
    {
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);
    }
    if (IsContextOpen)
    {
      uint64_t v20 = (const TNode *)TNodeFromFINode(*((FINode **)v11 + 1));
      memset(&v21, 0, sizeof(v21));
      TNode::RequestInternalTask(v20, 1028, &v21, 0);
      TPropertyValue::~TPropertyValue(&v21);
    }
  }
LABEL_17:
}

- (void)resetError
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)*((void *)v2 + 4);
  *((void *)v2 + 4) = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    id v4 = (const TNode *)TNodeFromFINode(*((FINode **)v2 + 1));
    memset(&v5, 0, sizeof(v5));
    TNode::RequestInternalTask(v4, 1028, &v5, 0);
    TPropertyValue::~TPropertyValue(&v5);
  }
}

- (id)fpError
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *((id *)v2 + 4);
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 40));
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)self + 2);
  id v3 = (void *)*((void *)self + 1);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  *((void *)self + 5) = 850045863;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  return self;
}

@end