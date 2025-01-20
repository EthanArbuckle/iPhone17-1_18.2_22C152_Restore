@interface DSFileProgress
- (FINode)progressNode;
- (id).cxx_construct;
- (id)startObserving:;
- (uint64_t)progressChanged:(uint64_t)a1;
- (uint64_t)startObserving:;
- (void)progressChanged:(id)a3;
- (void)setProgressNode:(id)a3;
- (void)startObserving:;
- (void)startObserving:(id)a3;
- (void)stopObserving;
@end

@implementation DSFileProgress

- (void)startObserving:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  id v5 = v4;
  id v19 = v5;
  v29 = 0;
  v27 = &unk_1F2AB9740;
  objc_moveWeak(v28, &to);
  v6 = v19;
  id v19 = 0;
  v28[1] = v6;
  v29 = &v27;
  objc_destroyWeak(&to);
  AddProgressObserver(v5, (uint64_t *)&self->_observers, (uint64_t)&v27);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v27);
  objc_initWeak(&from, self);
  id v7 = v5;
  id v15 = v7;
  objc_copyWeak(&v16, &from);
  v14.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v14, (TString *)@"fileURL");
  id v12 = v15;
  objc_copyWeak(&v13, &v16);
  id v8 = v7;
  TKeyValueObserver::TKeyValueObserver((TKeyValueObserver *)v23);
  id v21 = v12;
  objc_copyWeak(&v22, &v13);
  v9 = v8;
  id v24 = v21;
  objc_copyWeak(&v25, &v22);
  v32 = 0;
  id v10 = v24;
  id v24 = 0;
  v30[0] = &unk_1F2ABAB30;
  v30[1] = v10;
  objc_moveWeak(&v31, &v25);
  v32 = v30;
  objc_destroyWeak(&v25);

  v26 = v9;
  std::unordered_set<NSObject *>::unordered_set((uint64_t)&v27, (id *)&v26, 1);
  TKeyValueObserver::CreateObserver((uint64_t)v23, (uint64_t)v30, (uint64_t)&v27, (uint64_t)&v14);
  v11 = (DS_TKeyValueObserverGlue *)objc_claimAutoreleasedReturnValue();
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&v27);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v30);
  TKeyValueObserver::StartObservingPriv((TKeyValueObserver *)v23, v11, v9, &v14, 0);

  objc_destroyWeak(&v22);
  std::vector<TKeyValueObserver>::push_back[abi:ne180100]((uint64_t *)&self->_observers, (uint64_t)v23);
  TKeyValueObserver::~TKeyValueObserver((TKeyValueObserver *)v23);
  objc_destroyWeak(&v13);

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v14.fString.fRef);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)stopObserving
{
  end = self->_observers.__end_;
  begin = self->_observers.__begin_;
  while (end != begin)
    TKeyValueObserver::~TKeyValueObserver((TKeyValueObserver *)((char *)end - 40));
  self->_observers.__end_ = begin;
}

- (void)progressChanged:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 kind];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F28898]];

    if (v7)
    {
      id v8 = [(DSFileProgress *)self progressNode];
      if (v8)
      {
        v9 = [v5 userInfo];
        OperationTypeFromProgress(v9, &v38);

        id v10 = [v5 userInfo];
        uint64_t v11 = *MEMORY[0x1E4F28868];
        id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];
        id v13 = static_objc_cast<NSString,objc_object * {__strong}>(v12);
        char v14 = [v13 isEqualToString:*MEMORY[0x1E4F28858]];

        id v15 = [v5 userInfo];
        id v16 = [v15 objectForKeyedSubscript:v11];
        v17 = static_objc_cast<NSString,objc_object * {__strong}>(v16);
        LOBYTE(v11) = [v17 isEqualToString:*MEMORY[0x1E4F28880]];

        v18 = [v5 userInfo];
        id v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28810]];
        v20 = static_objc_cast<NSString,objc_object * {__strong}>(v19);
        [v20 doubleValue];
        uint64_t v22 = v21;

        objc_initWeak(&location, v8);
        objc_copyWeak(&to, &location);
        v34 = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable((TString *)&v34, (TString *)v38.fString.fRef);
        v35 = v5;
        LOBYTE(v36) = v14;
        BYTE1(v36) = v11;
        *((void *)&v36 + 1) = v22;
        v23 = TProgressMap::GetProgressDispatchQueue(v35);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3321888768;
        block[2] = __34__DSFileProgress_progressChanged___block_invoke;
        block[3] = &__block_descriptor_72_ea8_32c47_ZTSKZ34__DSFileProgress_progressChanged__E3__3_e5_v8__0l;
        objc_copyWeak(&from, &to);
        id v25 = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable((TString *)&v25, (TString *)v34);
        v26 = v35;
        long long v27 = v36;
        objc_copyWeak(&v29, &from);
        v30.fString.fRef = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable(&v30, (TString *)v25);
        id v31 = v26;
        long long v32 = v27;
        dispatch_async(v23, block);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v25);
        objc_destroyWeak(&from);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v30.fString.fRef);
        objc_destroyWeak(&v29);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v34);
        objc_destroyWeak(&to);
        objc_destroyWeak(&location);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v38.fString.fRef);
      }
    }
  }
}

void __34__DSFileProgress_progressChanged___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  v3[2] = ___ZZ34__DSFileProgress_progressChanged__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
  v3[3] = &__block_descriptor_72_ea8_32c47_ZTSKZ34__DSFileProgress_progressChanged__E3__2_e5_v8__0l;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v5, *(TString **)(a1 + 40));
  id v6 = *(id *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 56);
  v2 = (void *)MEMORY[0x1D9436FC0](v3);

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v5.fString.fRef);
  objc_destroyWeak(&v4);
  ExceptionSafeBlock(v2);
}

- (uint64_t)progressChanged:(uint64_t)a1
{
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)(a1 + 8));
  objc_destroyWeak((id *)a1);
  return a1;
}

- (FINode)progressNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressNode);
  return (FINode *)WeakRetained;
}

- (void)setProgressNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressNode);
  p_observers = &self->_observers;
  std::vector<TKeyValueObserver>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_observers);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (uint64_t)startObserving:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)startObserving:
{
}

- (id)startObserving:
{
  *(void *)a2 = &unk_1F2AB9740;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  id result = *(id *)(a1 + 16);
  *(void *)(a2 + 16) = result;
  return result;
}

@end