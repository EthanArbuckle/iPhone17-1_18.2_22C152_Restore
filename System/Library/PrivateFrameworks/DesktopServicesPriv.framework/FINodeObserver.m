@interface FINodeObserver
+ (id)observerForFINode:(id)a3 withObserver:(id)a4;
+ (id)observerForProxy:(id)a3 subjectNode:(id)a4;
+ (id)propertyName:(unsigned int)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)startObserving:(unsigned int)a3;
- (void)stopObserving:(unsigned int)a3;
@end

@implementation FINodeObserver

void __49__FINodeObserver_observerForFINode_withObserver___block_invoke(uint64_t a1, unint64_t a2)
{
}

void __49__FINodeObserver_observerForFINode_withObserver___block_invoke_27(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_cast<FIDSNode,FINode * {__strong}>(WeakRetained);

  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = v5;
  if (v4 && v5) {
    [v4 dispatchEvent:v7 forObserver:v5];
  }
}

+ (id)observerForFINode:(id)a3 withObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    v18[2] = __49__FINodeObserver_observerForFINode_withObserver___block_invoke;
    v18[3] = &__block_descriptor_33_ea8_32c62_ZTSKZ49__FINodeObserver_observerForFINode_withObserver__E3__1_e27_v16__0__OpaqueEventQueue__8l;
    +[FINodeObserver observerForFINode:withObserver:]::sNodeEventQueue = NodeNewEventQueueWithTickleBlock(v18);
  }
  objc_initWeak(&location, v6);
  objc_initWeak(&from, v7);
  v8 = objc_alloc_init(FINodeObserver);
  objc_storeStrong((id *)&v8->_observedNode, a3);
  uint64_t v9 = +[FINodeObserver observerForFINode:withObserver:]::sNodeEventQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __49__FINodeObserver_observerForFINode_withObserver___block_invoke_27;
  v13[3] = &__block_descriptor_48_ea8_32c62_ZTSKZ49__FINodeObserver_observerForFINode_withObserver__E3__2_e21_v16__0__FINodeEvent_8l;
  objc_copyWeak(&to, &from);
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v14, &to);
  objc_copyWeak(&v15, &v12);
  v8->_notifier = (OpaqueEventNotifier *)NodeNewChangeHandlerOnQueue(v9, v13, MEMORY[0x1E4F14428]);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&to);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

- (void)startObserving:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = LogObj(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FINode *)self->_observedNode debugDescription];
    id v7 = ShortDescription(v3);
    int v16 = 138413058;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v6;
    __int16 v20 = 2114;
    v21 = v7;
    __int16 v22 = 1024;
    int v23 = v3;
    _os_log_impl(&dword_1D343E000, v5, OS_LOG_TYPE_DEFAULT, "[%@] startObserving %{public}@: '%{public}@' (0x%x)", (uint8_t *)&v16, 0x26u);
  }
  v8 = objc_cast<FIDSNode,FINode * {__strong}>(self->_observedNode);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 startObserving:v3 with:self->_notifier];
    if ((v3 & 0x10) != 0 && ![(FINode *)self->_observedNode isFolder])
    {
      v10 = self;
      objc_sync_enter(v10);
      v11 = [(FINode *)self->_observedNode fileParent];
      if (v11 || v10->_parentObserver)
      {
        int parentUbiquityCount = v10->_parentUbiquityCount;
        v10->_int parentUbiquityCount = parentUbiquityCount + 1;
        if (!parentUbiquityCount)
        {
          v13 = objc_alloc_init(_FINullObserver);
          uint64_t v14 = +[FINodeObserver observerForFINode:v11 withObserver:v13];
          parentObserver = v10->_parentObserver;
          v10->_parentObserver = (FINodeObserver *)v14;

          [(FINodeObserver *)v10->_parentObserver startObserving:18];
        }
      }

      objc_sync_exit(v10);
    }
  }
}

+ (id)observerForProxy:(id)a3 subjectNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3321888768;
    v14[2] = __47__FINodeObserver_observerForProxy_subjectNode___block_invoke;
    v14[3] = &__block_descriptor_33_ea8_32c60_ZTSKZ47__FINodeObserver_observerForProxy_subjectNode__E3__3_e27_v16__0__OpaqueEventQueue__8l;
    +[FINodeObserver observerForProxy:subjectNode:]::sNodeEventQueue = NodeNewEventQueueWithTickleBlock(v14);
  }
  objc_initWeak(&location, v5);
  id v7 = objc_alloc_init(FINodeObserver);
  objc_storeStrong((id *)&v7->_observedNode, a4);
  uint64_t v8 = +[FINodeObserver observerForProxy:subjectNode:]::sNodeEventQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __47__FINodeObserver_observerForProxy_subjectNode___block_invoke_33;
  v11[3] = &__block_descriptor_40_ea8_32c60_ZTSKZ47__FINodeObserver_observerForProxy_subjectNode__E3__4_e21_v16__0__FINodeEvent_8l;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v12, &v10);
  v7->_notifier = (OpaqueEventNotifier *)NodeNewChangeHandlerOnQueue(v8, v11, MEMORY[0x1E4F14428]);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

void __47__FINodeObserver_observerForProxy_subjectNode___block_invoke(uint64_t a1, unint64_t a2)
{
}

void __47__FINodeObserver_observerForProxy_subjectNode___block_invoke_33(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained dispatchNodeEvent:v3];
}

- (void)stopObserving:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = LogObj(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FINode *)self->_observedNode debugDescription];
    id v7 = ShortDescription(v3);
    int v14 = 138413058;
    id v15 = self;
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2114;
    v19 = v7;
    __int16 v20 = 1024;
    int v21 = v3;
    _os_log_impl(&dword_1D343E000, v5, OS_LOG_TYPE_DEFAULT, "[%@] stopObserving %{public}@: '%{public}@' (0x%x)", (uint8_t *)&v14, 0x26u);
  }
  uint64_t v8 = objc_cast<FIDSNode,FINode * {__strong}>(self->_observedNode);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 stopObserving:v3 with:self->_notifier];
    if ((v3 & 0x10) != 0)
    {
      id v10 = self;
      objc_sync_enter(v10);
      parentObserver = v10->_parentObserver;
      if (parentObserver)
      {
        int v12 = v10->_parentUbiquityCount - 1;
        v10->_int parentUbiquityCount = v12;
        if (!v12)
        {
          [(FINodeObserver *)parentObserver stopObserving:18];
          v13 = v10->_parentObserver;
          v10->_parentObserver = 0;
        }
      }
      objc_sync_exit(v10);
    }
  }
}

+ (id)propertyName:(unsigned int)a3
{
  TCFURLInfo::PropertyToString(a3, (TString *)&v5);
  id v3 = v5;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v5);
  return v3;
}

- (void)dealloc
{
  NodeDisposeNotifier((uint64_t)self->_notifier);
  v3.receiver = self;
  v3.super_class = (Class)FINodeObserver;
  [(FINodeObserver *)&v3 dealloc];
}

- (id)debugDescription
{
  v14.receiver = self;
  v14.super_class = (Class)FINodeObserver;
  objc_super v3 = [(FINodeObserver *)&v14 debugDescription];
  v15.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v15, v3);

  TString::TString(&v13, " ", 1uLL);
  fRef = v15.fString.fRef;
  v16.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, fRef);
  CFRelease(&stru_1F2ABD380);
  v16.fString.fRef = MutableCopy;
  TString::Append(&v16, &v13);
  id v7 = [(FINode *)self->_observedNode debugDescription];
  v12.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v12, v7);

  uint64_t v8 = v16.fString.fRef;
  id v17 = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  CFMutableStringRef v9 = CFStringCreateMutableCopy(v5, 0, v8);
  CFRelease(&stru_1F2ABD380);
  id v17 = v9;
  TString::Append((TString *)&v17, &v12);
  id v10 = v17;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v17);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v12.fString.fRef);

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v13.fString.fRef);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentObserver, 0);
  objc_storeStrong((id *)&self->_observedNode, 0);
}

@end