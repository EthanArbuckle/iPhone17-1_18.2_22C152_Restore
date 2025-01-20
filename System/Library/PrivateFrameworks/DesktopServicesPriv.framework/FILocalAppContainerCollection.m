@interface FILocalAppContainerCollection
+ (id)appContainerForDocumentsNode:(id)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceCreateIfNeeded:(BOOL)a3;
- (BOOL)isPopulated;
- (BOOL)populate;
- (FILocalAppContainerCollection)init;
- (id).cxx_construct;
- (id)_appContainerForDocumentsNode:(id)a3;
- (id)_uiParent;
- (id)appContainerForDocumentsNode:(id)a3;
- (id)fileParent;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)nodesForSizing;
- (id)populate;
- (void)appRegistry:(id)a3 didRemoveAppsWithBundleIDs:(id)a4;
- (void)appRegistry:(id)a3 didUpdateApps:(id)a4;
- (void)dealloc;
- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4;
@end

@implementation FILocalAppContainerCollection

- (void)dealloc
{
  [*((id *)self + 14) setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)FILocalAppContainerCollection;
  [(FICustomNode *)&v3 dealloc];
}

- (FILocalAppContainerCollection)init
{
  v10.receiver = self;
  v10.super_class = (Class)FILocalAppContainerCollection;
  v2 = [(FICustomNode *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v5;

    TNode::SetInitialPopulationDeferred((TNode *)[(FIDSNode *)v2 asTNode]);
    uint64_t v7 = [(id)objc_opt_class() sharedRegistry];
    v8 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v7;
  }
  return v2;
}

- (id)_uiParent
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (id)sLocalStorageNode;
  objc_sync_exit(v2);

  return v3;
}

- (id)fileParent
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = [(id)sLocalStorageNode storageNode];
  objc_sync_exit(v2);

  return v3;
}

+ (id)sharedInstance
{
  return (id)[a1 sharedInstanceCreateIfNeeded:1];
}

+ (id)sharedInstanceCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  {
    TDSMutex::TDSMutex(&+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sLock, 0);
  }
  v9 = &+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sLock;
  char v10 = 1;
  TDSMutex::lock(&+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sLock);
  v4 = (void *)+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton;
  if (v3 && !+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton)
  {
    id v5 = objc_alloc_init(FILocalAppContainerCollection);
    v6 = (void *)+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton;
    +[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton = (uint64_t)v5;

    v4 = (void *)+[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:]::sSingleton;
  }
  id v7 = v4;
  std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&v9);
  return v7;
}

+ (id)appContainerForDocumentsNode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstanceCreateIfNeeded:0];
  v6 = [v5 appContainerForDocumentsNode:v4];

  return v6;
}

- (id)appContainerForDocumentsNode:(id)a3
{
  id v4 = a3;
  id v5 = (std::mutex *)((char *)self + 144);
  std::mutex::lock((std::mutex *)((char *)self + 144));
  v6 = [(FILocalAppContainerCollection *)self _appContainerForDocumentsNode:v4];
  std::mutex::unlock(v5);

  return v6;
}

- (id)_appContainerForDocumentsNode:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    id v6 = 0;
    goto LABEL_27;
  }
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)self + 97);
  if ((v7 & 1) == 0)
  {
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)self + 96);
    if (v8)
    {
      do
      {
        v9 = LogObj(7);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D343E000, v9, OS_LOG_TYPE_DEBUG, "AppContainerCollection waiting for population to complete", buf, 2u);
        }

        unsigned __int8 v10 = atomic_load((unsigned __int8 *)self + 96);
      }
      while ((v10 & 1) != 0);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = *((id *)self + 15);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v11);
      }
      v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      id v16 = [v15 documentsNode];
      BOOL v17 = v16 == v4;

      if (v17) {
        goto LABEL_25;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v12) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = *((id *)self + 16);
  id v6 = (id)[v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v6)
  {
    uint64_t v18 = *(void *)v24;
LABEL_18:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v11);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8 * v19);
      objc_msgSend(v15, "documentsNode", (void)v23);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v21 = v20 == v4;

      if (v21) {
        break;
      }
      if (v6 == (id)++v19)
      {
        id v6 = (id)[v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v6) {
          goto LABEL_18;
        }
        goto LABEL_26;
      }
    }
LABEL_25:
    id v6 = v15;
  }
LABEL_26:

LABEL_27:
  return v6;
}

- (BOOL)populate
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_exchange((atomic_uchar *volatile)self + 96, 1u);
  if ((v2 & 1) == 0)
  {
    unsigned __int8 v41 = v2;
    id v4 = LogObj(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_INFO, "AppCollection sync started", buf, 2u);
    }

    memset(v62, 0, sizeof(v62));
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)self + 97);
    id v6 = [(FINode *)self nodeRef];
    unsigned __int8 v8 = (const TNode *)TNode::NodeFromNodeRef((TNode *)v6, v7);
    TNodePtr::TNodePtr(&v61, v8);
    int v42 = v5 & 1;
    v45 = self;
    v55 = v45;
    v56 = v61.fFINode;
    LOBYTE(v57) = !(v5 & 1);
    *((void *)&v57 + 1) = v62;
    v58 = v45;
    TNodePtr::TNodePtr(&v59, (id *)&v56);
    long long v60 = v57;

    if ((v5 & 1) == 0)
    {
      buf[0] = 0;
      uint64_t v9 = TNodeFromFINode(v61.fFINode);
      TNode::HandleSyncStarted(v9, 0x800000, buf);
    }
    TNode::StPopulating::StPopulating((TNode::StPopulating *)v54, &v61, 0);
    __int16 v52 = 0;
    id v53 = 0;
    unsigned __int8 v10 = [*((id *)v45 + 14) listOfMonitoredApps];
    TContainerFetcher::FetchContainersAndDocumentsFolders((TContainerFetcher *)&v52, v10, (uint64_t)&v50);

    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id obj = +[FINode protectedAppIdentifiers];
    id v11 = +[FINode currentHostAppIdentifier];
    CFStringRef theString = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable((TString *)&theString, v11);

    std::mutex::lock((std::mutex *)((char *)v45 + 144));
    objc_storeStrong((id *)v45 + 17, obj);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*((void *)v45 + 15)];
    [v12 unionSet:*((void *)v45 + 16)];
    uint64_t v14 = v50;
    uint64_t v13 = v51;
    while (v14 != v13)
    {
      id v15 = *(id *)(v14 + 8);
      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator((uint64_t)buf, v12);
      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::IDContainerIteratorAdaptor((uint64_t)&v64, -1, v12);
      while (*(FINode **)buf != v64.fFINode || v74 != v65)
      {
        id v16 = *(id *)(v69 + 8 * v73);
        id v17 = [v16 documentsNode];
        BOOL v18 = v17 == v15;

        if (v18) {
          break;
        }
        uint64_t v19 = v73;
        if (v73 >= v72 - 1)
        {
          uint64_t v20 = [*(id *)buf countByEnumeratingWithState:&buf[8] objects:v71 count:4];
          uint64_t v19 = -1;
          uint64_t v72 = v20;
          uint64_t v73 = -1;
        }
        if (v71[4] != *v70)
        {
          objc_enumerationMutation(*(id *)buf);
          uint64_t v19 = v73;
        }
        uint64_t v73 = v19 + 1;
        ++v74;
      }
      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator<NSMutableSet<FILocalAppContainerNode *>>::NSForwardIterator((uint64_t)v63, (uint64_t)buf);

      IDContainerIteratorAdaptor<NSMutableSet<FILocalAppContainerNode *>>::IDContainerIteratorAdaptor((uint64_t)buf, -1, v12);
      if (v63[0] == *(id *)buf)
      {
        BOOL v21 = v63[16] == v74;

        if (v21)
        {

          id v22 = 0;
          goto LABEL_21;
        }
      }
      else
      {
      }
      id v22 = *((id *)v63[2] + (uint64_t)v63[15]);

LABEL_21:
      if (*(unsigned char *)(v14 + 40))
      {
        id v23 = *(id *)(v14 + 16);
        char v24 = [obj containsObject:v23];

        if (v24)
        {
          BOOL v25 = 0;
LABEL_26:
          *(unsigned char *)(v14 + 40) = v25;
        }
      }
      else if (CFStringGetLength(theString))
      {
        BOOL v25 = CFEqual(theString, *(CFTypeRef *)(v14 + 16)) != 0;
        goto LABEL_26;
      }
      if (v22)
      {
        int v26 = [*((id *)v45 + 16) containsObject:v22];
        int v27 = v26;
        if (*(unsigned char *)(v14 + 40))
        {
          [v12 removeObject:v22];
          [v43 addObject:v22];
          if (v27)
          {
            [*((id *)v45 + 16) removeObject:v22];
            TNodePtr::TNodePtr(&v64, (const TNode *)[v22 asTNode]);
            TNodeEvent::CreateNodeEvent(3, (id *)&v64.fFINode, 0, buf);
            TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)buf);
            TNodeEventPtr::~TNodeEventPtr((id *)buf);
          }
        }
        else if (v26)
        {
          [v12 removeObject:v22];
        }
        else
        {
          [*((id *)v45 + 16) addObject:v22];
        }
      }
      else
      {
        long long v28 = [[FILocalAppContainerNode alloc] initWithAppContainerInfo:v14];
        long long v29 = v28;
        if (v28)
        {
          if (*(unsigned char *)(v14 + 40))
          {
            long long v30 = [(FINode *)v28 nodeRef];
            v32 = (const TNode *)TNode::NodeFromNodeRef(v30, v31);
            TNodePtr::TNodePtr((TNodePtr *)buf, v32);
            [v43 addObject:v29];
            TNodeEvent::CreateNodeEvent(3, (id *)buf, 0, &v64);
            TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)&v64.fFINode);
            TNodeEventPtr::~TNodeEventPtr((id *)&v64.fFINode);
          }
          else
          {
            [*((id *)v45 + 16) addObject:v28];
          }
        }
      }
      v14 += 48;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v33 = v12;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v67 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          TNodePtr::TNodePtr(&v64, (const TNode *)[v37 asTNode]);
          TNodeEvent::CreateNodeEvent(4, (id *)&v64.fFINode, 0, buf);
          TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)buf);
          TNodeEventPtr::~TNodeEventPtr((id *)buf);

          v38 = LogObj(7);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v37 displayName];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v39;
            _os_log_impl(&dword_1D343E000, v38, OS_LOG_TYPE_DEBUG, "Local storage node removed %@", buf, 0xCu);
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v67 count:16];
      }
      while (v34);
    }

    objc_storeStrong((id *)v45 + 15, v43);
    if (v42)
    {
      TNodeEvent::CreateNodeEvent(20, (id *)&v61.fFINode, 0, buf);
      TNodeEventPtrs::AddEvent((TNodeEventPtrs *)v62, &v61, (id *)buf);
      TNodeEventPtr::~TNodeEventPtr((id *)buf);
    }

    std::mutex::unlock((std::mutex *)((char *)v45 + 144));
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

    *(void *)buf = &v50;
    std::vector<TAppContainerInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

    TNode::StPopulating::~StPopulating((TNode::StPopulating *)v54);
    StDefer<-[FILocalAppContainerCollection populate]::$_1,(void *)0>::~StDefer((id *)&v58);

    *(void *)buf = v62;
    std::vector<std::pair<TNodePtr,TNodeEventPtr>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    unsigned __int8 v2 = v41;
  }
  return (v2 & 1) == 0;
}

- (id)populate
{
  unsigned __int8 v2 = LogObj(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl(&dword_1D343E000, v2, OS_LOG_TYPE_INFO, "AppCollection sync finished", v5, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)*a1 + 97);
  atomic_store(0, (unsigned __int8 *)*a1 + 96);
  if (*((unsigned char *)a1 + 16))
  {
    objc_msgSend(*((id *)*a1 + 14), "setDelegate:");
    uint64_t v3 = TNodeFromFINode((FINode *)a1[1]);
    TNode::HandleSyncCompleted(v3, 0x800000);
  }
  else
  {
    TNodeEventPtrs::SendNotifications((id **)a1[3]);
  }

  return a1;
}

- (BOOL)isPopulated
{
  unsigned __int8 v2 = [(FIDSNode *)self asTNode];
  return TNode::IsPopulated(v2);
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(FILocalAppContainerCollection *)self isPopulated];
  if ((~v3 & 0x1040000) != 0 || !v5)
  {
    int v6 = pthread_main_np();
    BOOL v8 = (v3 & 0x40000) == 0 && v6 != 0;
    [(FILocalAppContainerCollection *)self synchronizeWithOptions:v3 async:v8];
  }
  uint64_t v9 = self;
  std::mutex::lock((std::mutex *)((char *)v9 + 144));
  unsigned __int8 v10 = (void *)[*((id *)v9 + 15) copy];
  std::mutex::unlock((std::mutex *)((char *)v9 + 144));

  id v11 = [[FIChildrenIterator alloc] initWithChildren:v10 fullyPopulated:[(FILocalAppContainerCollection *)v9 isPopulated] options:v3];
  return v11;
}

- (id)nodesForSizing
{
  uint64_t v3 = (std::mutex *)((char *)self + 144);
  std::mutex::lock((std::mutex *)((char *)self + 144));
  id v4 = (void *)[*((id *)self + 15) copy];
  std::mutex::unlock(v3);
  return v4;
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  if (a4)
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)self + 96);
    unsigned __int8 v7 = LogObj(7);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v7, OS_LOG_TYPE_DEBUG, "AppCollection sync ignored while still populating", buf, 2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v7, OS_LOG_TYPE_DEBUG, "AppCollection sync queued", buf, 2u);
      }

      TNode::GetVolumeInfo((TNode *)[(FIDSNode *)self asTNode], buf);
      unsigned __int8 v7 = TFSVolumeInfo::GetSynchingGCDQueue(*(TFSVolumeInfo **)buf);
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3321888768;
      v13[2] = __62__FILocalAppContainerCollection_synchronizeWithOptions_async___block_invoke;
      v13[3] = &__block_descriptor_48_ea8_32c75_ZTSKZ62__FILocalAppContainerCollection_synchronizeWithOptions_async__E3__4_e5_v8__0l;
      uint64_t v9 = self;
      uint64_t v14 = v9;
      unsigned int v15 = a3;
      dispatch_async(v7, v13);
    }
  }
  else if (![(FILocalAppContainerCollection *)self populate])
  {
    do
    {
      char v10 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)self + 96, (unsigned __int8 *)&v10, 1u, memory_order_release, memory_order_relaxed);
    }
    while (v10);
    std::mutex::lock((std::mutex *)((char *)self + 144));
    id v11 = (void *)*((void *)self + 17);
    uint64_t v12 = +[FINode protectedAppIdentifiers];
    LOBYTE(v11) = [v11 isEqual:v12];

    std::mutex::unlock((std::mutex *)((char *)self + 144));
    atomic_store(0, (unsigned __int8 *)self + 96);
    if ((v11 & 1) == 0)
    {
      [(FILocalAppContainerCollection *)self populate];
    }
  }
}

uint64_t __62__FILocalAppContainerCollection_synchronizeWithOptions_async___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) synchronizeWithOptions:*(unsigned int *)(a1 + 40) async:0];
}

- (void)appRegistry:(id)a3 didUpdateApps:(id)a4
{
}

- (void)appRegistry:(id)a3 didRemoveAppsWithBundleIDs:(id)a4
{
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 144));
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);
  uint64_t v3 = (void *)*((void *)self + 13);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 96) = 0;
  *((unsigned char *)self + 97) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 18) = 850045863;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((void *)self + 25) = 0;
  return self;
}

@end