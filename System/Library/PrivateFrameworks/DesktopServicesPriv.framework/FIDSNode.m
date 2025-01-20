@interface FIDSNode
+ (id)_makeWithCoder:(id)a3;
+ (id)appContainersForContainerRoot:(id)a3 showAllFiles:(BOOL)a4 showSystemFiles:(BOOL)a5;
+ (void)registerClassForFIDSNodeCoding:(id)a3;
- (BOOL)isObserved;
- (BOOL)isObservedForAll:(unsigned int)a3;
- (BOOL)isObservedForAny:(unsigned int)a3;
- (BOOL)isObservedForNone:(unsigned int)a3;
- (BOOL)isPopulated;
- (BOOL)isValid;
- (BOOL)markAsUsed:(id *)a3;
- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (id).cxx_construct;
- (id)brContainer;
- (id)brContainerDocuments;
- (id)copyProgress;
- (id)downloadProgress;
- (id)enumeratorError;
- (id)fiDomain;
- (id)fileParent;
- (id)fileURL;
- (id)fpDomain;
- (id)fpItem;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)shortDescription;
- (shared_ptr<TFSInfo>)fsInfo;
- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4;
- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4;
- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4;
- (void)_sendNotification:(unsigned int)a3 node:(id)a4 property:(unsigned int)a5;
- (void)asTNode;
- (void)dispatchEvent:(id)a3 forObserver:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)inlineProgressCancel;
- (void)nodeRestartObservingWithOptions:(unsigned int)a3;
- (void)startObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4;
- (void)stopObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4;
- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4;
- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4;
@end

@implementation FIDSNode

- (void)asTNode
{
  return &self->_node;
}

- (id)fpItem
{
  [(FIDSNode *)self fsInfo];
  v2 = TFSInfo::GetFPItem(v4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (shared_ptr<TFSInfo>)fsInfo
{
  v3 = v2;
  v4 = [(FIDSNode *)self asTNode];
  v5 = (os_unfair_lock_s *)TNode::InfoLock(v4);
  os_unfair_lock_lock(v5);
  uint64_t v6 = *((void *)v4 + 3);
  void *v3 = *((void *)v4 + 2);
  v3[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  os_unfair_lock_unlock(v5);
  result.__cntrl_ = v8;
  result.__ptr_ = v7;
  return result;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_WORD *)self + 44) = 0;
  return self;
}

- (id)fileParent
{
  v4 = NodeCopyParentNode((TNode *)self, (OpaqueNodeRef *)a2);
  v2 = v4;
  TRef<OpaqueNodeRef *,TRetainReleasePolicy<OpaqueNodeRef *>>::~TRef((const void **)&v4);
  return v2;
}

- (id)fpDomain
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(FIDSNode *)self fiDomain];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 domain];
    if (!v4)
    {
      v5 = LogObj(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = [v3 domainID];
        v9.fString.fRef = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable(&v9, v6);

        v7 = SanitizedStr(&v9);
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_impl(&dword_1D343E000, v5, OS_LOG_TYPE_ERROR, "Found fiDomain but not FPDomain available %{public}@", buf, 0xCu);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v9.fString.fRef);
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)fiDomain
{
  v2 = [(FINode *)self nodeRef];
  return NodeGetFIProviderDomain((TNode *)v2, v3);
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  v12[1] = *(TDSNotifier **)MEMORY[0x1E4F143B8];
  id v5 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v11);
  v12[0] = *(TDSNotifier **)(TNodeEventPtr::operator->(&v11) + 64);
  TDSNotifier::AddPtrReference(v12[0]);
  uint64_t v6 = (FINode *)*((id *)v12[0] + 3);
  v7 = (TNode *)TNodeFromFINode(v6);
  v8 = FIDSNodeFromTNode(v7);

  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::~TRef(v12);
  TString v9 = (TDSNotifier *)*(id *)(TNodeEventPtr::operator->(&v11) + 8);
  switch(*(_DWORD *)TNodeEventPtr::operator->(&v11))
  {
    case 1:
      if (objc_opt_respondsToSelector())
      {
        [v5 nodeDeleted:v8];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 temporaryNodeDeleted:v8];
      }
      goto LABEL_27;
    case 2:
      if (objc_opt_respondsToSelector())
      {
        [v5 nodeChanged:v8 for:*(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16)];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 nodePropertyChanged:v8 forProperty:*(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16)];
      }
      goto LABEL_27;
    case 3:
      if (objc_opt_respondsToSelector())
      {
        v12[0] = v9;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [v5 childrenAdded:v10 to:v8];
        goto LABEL_26;
      }
      if (objc_opt_respondsToSelector())
      {
        v12[0] = v9;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [v5 childNodesAdded:v10];
        goto LABEL_26;
      }
      goto LABEL_27;
    case 4:
      if (objc_opt_respondsToSelector())
      {
        v12[0] = v9;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [v5 childrenDeleted:v10 from:v8];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_27;
        }
        v12[0] = v9;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [v5 childNodesDeleted:v10];
      }
LABEL_26:

LABEL_27:
      TNodeEventPtr::~TNodeEventPtr((id *)&v11);

      return;
    case 6:
      if (objc_opt_respondsToSelector())
      {
        [v5 childChanged:v9 in:v8 for:*(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16)];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 childNodePropertyChanged:v9 forProperty:*(unsigned int *)(TNodeEventPtr::operator->(&v11) + 16)];
      }
      goto LABEL_27;
    case 8:
      if (objc_opt_respondsToSelector())
      {
        [v5 openSyncCompleted:v8];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 nodeOpenSyncCompleted:v8];
      }
      goto LABEL_27;
    case 9:
      if (objc_opt_respondsToSelector())
      {
        [v5 openSyncStarted:v8];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 nodeOpenSyncStarted:v8];
      }
      goto LABEL_27;
    case 0x14:
      if (objc_opt_respondsToSelector()) {
        [v5 nodeShouldBeReloaded:v8];
      }
      goto LABEL_27;
    default:
      goto LABEL_27;
  }
}

- (void).cxx_destruct
{
}

- (id)shortDescription
{
  id v3 = [(FIDSNode *)self asTNode];
  v4 = (os_unfair_lock_s *)TNode::InfoLock((TNode *)v3);
  os_unfair_lock_lock(v4);
  uint64_t v6 = (TFSInfo *)*((void *)v3 + 2);
  id v5 = (std::__shared_weak_count *)*((void *)v3 + 3);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  os_unfair_lock_unlock(v4);
  int v7 = TFSInfo::IsOnSystemVolume(v6);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  v8 = [(FINode *)self displayName];
  TString v9 = v8;
  if (v7)
  {
    id v45 = v8;
  }
  else
  {
    v10 = v8;
    v54.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v54, v10);

    SanitizedStr(&v54);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v54.fString.fRef);
  }
  v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 stringWithFormat:@"<%@ %p", v13, self];
  v54.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v54, v14);

  unsigned int v15 = TNode::VirtualType((TNode *)v3);
  if (v15)
  {
    v16 = NSString;
    Description(v15, (TString *)&v52);
    v17 = [v16 stringWithFormat:@" %@:", v52];
    CFStringRef theString = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable((TString *)&theString, v17);

    TString::Append(&v54, (const TString *)&theString);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v52);
  }
  v18 = [NSString stringWithFormat:@" '%@'", v45];
  CFStringRef theString = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable((TString *)&theString, v18);

  TString::Append(&v54, (const TString *)&theString);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

  v19 = [(FINode *)self fileName];
  if (([v9 isEqualToString:v19] & 1) == 0)
  {
    v20 = NSString;
    v21 = v19;
    if ((v7 & 1) == 0)
    {
      v22 = v19;
      id v52 = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable((TString *)&v52, v22);

      v21 = SanitizedStr((TString *)&v52);
    }
    v23 = [v20 stringWithFormat:@" {raw: '%@'}", v21];
    CFStringRef theString = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable((TString *)&theString, v23);

    TString::Append(&v54, (const TString *)&theString);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

    if ((v7 & 1) == 0)
    {

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v52);
    }
  }

  v24 = [(FIDSNode *)self fileURL];
  v25 = v24;
  v26 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (v24)
  {
    if (v7)
    {
      v27 = [(NSURL *)v24 debugDescription];
      v51.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v51, v27);

      BOOL v28 = [(NSURL *)v25 isFileReferenceURL];
      if (v28)
      {
        TString::TString(&v48, " (", 2uLL);
        id v3 = [(NSURL *)v25 path];
        v47.fString.fRef = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable(&v47, (TString *)v3);

        fRef = v48.fString.fRef;
        CFTypeRef cf = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, fRef);
        if (cf) {
          CFRelease(cf);
        }
        CFTypeRef cf = MutableCopy;
        TString::Append((TString *)&cf, &v47);
        TString::TString(&v46, ")", 1uLL);
        CFStringRef v32 = (const __CFString *)cf;
        CFTypeRef v50 = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        CFMutableStringRef v33 = CFStringCreateMutableCopy(v30, 0, v32);
        if (v50) {
          CFRelease(v50);
        }
        CFTypeRef v50 = v33;
        TString::Append((TString *)&v50, &v46);
      }
      else
      {
        TString::TString((TString *)&v50, "", 0);
      }
      v37 = v51.fString.fRef;
      CFStringRef theString = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      CFStringRef v38 = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v37);
      if (theString) {
        CFRelease(theString);
      }
      CFStringRef theString = v38;
      TString::Append((TString *)&theString, (const TString *)&v50);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&v50);
      if (v28)
      {
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v46.fString.fRef);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&cf);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v47.fString.fRef);

        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v48.fString.fRef);
      }
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v51.fString.fRef);

      v26 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    }
    else
    {
      SanitizedURL(v24);
      v36 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      CFStringRef theString = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable((TString *)&theString, v36);
    }
    v39 = [NSString stringWithFormat:@", %@", (id) theString];
    v51.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v51, v39);

    TString::Append(&v54, &v51);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v51.fString.fRef);
  }
  else
  {
    TNode::Path((TNode *)v3, (CFTypeRef *)&theString);
    if (CFStringGetLength(theString))
    {
      v34 = v26;
      v35 = NSString;
      if (v7)
      {
        CFTypeRef v50 = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable((TString *)&v50, (TString *)theString);
      }
      else
      {
        SanitizedPath((TString *)&theString);
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        CFTypeRef v50 = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable((TString *)&v50, (TString *)v3);
      }
      v40 = [v35 stringWithFormat:@", '%@'", (id) v50];
      v51.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v51, v40);

      TString::Append(&v54, &v51);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v51.fString.fRef);

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&v50);
      if ((v7 & 1) == 0) {

      }
      v26 = v34;
    }
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

  if (![(FIDSNode *)self isValid]) {
    TString::Append(&v54, (const __CFString *)", **** invalid ****");
  }
  TString::TString(&v51, ">", 1uLL);
  v41 = v54.fString.fRef;
  CFStringRef theString = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  CFStringRef v42 = CFStringCreateMutableCopy(*v26, 0, v41);
  CFRelease(&stru_1F2ABD380);
  CFStringRef theString = v42;
  TString::Append((TString *)&theString, &v51);
  v43 = (id)(id)theString;
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v51.fString.fRef);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v54.fString.fRef);

  return v43;
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  v10 = [(FIDSNode *)self asTNode];
  if (v10)
  {
    uint64_t v11 = (uint64_t)v10;
    if (v9 == 1684955501)
    {
      uint64_t v12 = (os_unfair_lock_s *)TNode::InfoLock(v10);
      os_unfair_lock_lock(v12);
      uint64_t v14 = *(void *)(v11 + 16);
      v13 = *(std::__shared_weak_count **)(v11 + 24);
      if (v13) {
        atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      os_unfair_lock_unlock(v12);
      unsigned int v15 = (os_unfair_lock_s *)(v14 + 100);
      os_unfair_lock_lock((os_unfair_lock_t)(v14 + 100));
      unint64_t v16 = *(unsigned int *)(v14 + 115) | ((unint64_t)*(unsigned __int16 *)(v14 + 119) << 32);
      os_unfair_lock_unlock(v15);
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
      uint64_t v9 = 1684955501;
      if ((v16 & 0x100000000) != 0) {
        uint64_t v9 = 1886282093;
      }
    }
    v24 = 0;
    int v23 = 12;
    v22 = &v24;
    if (v8) {
      NodeCreateNewRequest(0);
    }
    v20 = 0;
    v21 = 0;
    int Property = TNode::GetProperty(v11, v9, (TPropertyReference *)&v22, &v21, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v20);
    if (Property) {
      v18 = 0;
    }
    else {
      v18 = v24;
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v24);
    if (a6) {
      goto LABEL_17;
    }
  }
  else
  {
    v18 = 0;
    int Property = -8058;
    if (a6)
    {
LABEL_17:
      ErrorWithOSStatus(Property, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v18;
}

- (id)fileURL
{
  [(FIDSNode *)self fsInfo];
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 100));
  v2 = *(void **)(v6 + 16);
  id v5 = v2;
  if (v2) {
    CFRetain(v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 100));
  id v3 = v2;
  TRef<__CFURL const*,TRetainReleasePolicy<__CFURL const*>>::~TRef(&v5);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v3;
}

- (BOOL)isValid
{
  v2 = self;
  id v3 = (void *)MEMORY[0x1D9436D80](self, a2);
  v4 = [(FIDSNode *)v2 asTNode];
  LOBYTE(v2) = TNode::Validate(v4, v5) == 0;
  return (char)v2;
}

- (void)startObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(FINode *)self nodesToObserve];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8 * v10);
        NodeRegisterChangeNotification((TNode *)objc_msgSend(v11, "nodeRef", (void)v12), (OpaqueNodeRef *)a4, v5);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  NodeObservedOptionsCountRegistry::StartedObserving(self, v5);
}

- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6 = [(FIDSNode *)self asTNode];
  if (v6) {
    int v7 = 0;
  }
  else {
    int v7 = -8058;
  }
  if (v6) {
    a3 = TNode::NodeIs((uint64_t)v6, a3);
  }
  if (a4)
  {
    ErrorWithOSStatus(v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  uint64_t v9 = 0;
  v4 = [(FINode *)self nodeRef];
  if ((a3 & 0x40000) == 0) {
    NodeCreateNewRequest(0);
  }
  uint64_t v8 = 0;
  NodeNewIterator(v4, &v9);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v8);
  if (v9)
  {
    uint64_t v5 = [FINodeIterator alloc];
    uint64_t v6 = [(FINodeIterator *)v5 initWithIterator:v9];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

void __43__FIDSNode_registerClassForFIDSNodeCoding___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)sSubclassMakeWithCoderRegistry;
  sSubclassMakeWithCoderRegistry = v0;
}

- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4
{
}

+ (void)registerClassForFIDSNodeCoding:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __43__FIDSNode_registerClassForFIDSNodeCoding___block_invoke;
  block[3] = &__block_descriptor_33_ea8_32c56_ZTSKZ43__FIDSNode_registerClassForFIDSNodeCoding__E3__2_e5_v8__0l;
  if (+[FIDSNode registerClassForFIDSNodeCoding:]::onceToken != -1) {
    dispatch_once(&+[FIDSNode registerClassForFIDSNodeCoding:]::onceToken, block);
  }
  id v4 = (id)sSubclassMakeWithCoderRegistry;
  objc_sync_enter(v4);
  [(id)sSubclassMakeWithCoderRegistry setObject:objc_opt_class() forKeyedSubscript:v3];
  objc_sync_exit(v4);
}

- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4
{
  unsigned int v8 = a3;
  uint64_t v5 = [(FIDSNode *)self asTNode];
  if (!v5)
  {
    int Permissions = -8058;
    if (!a4) {
      return v8;
    }
    goto LABEL_3;
  }
  int Permissions = TNode::GetPermissions((uint64_t)v5, (int *)&v8);
  if (a4)
  {
LABEL_3:
    ErrorWithOSStatus(Permissions, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

void __31__FIDSNode_FPv2_makeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if (v8)
  {
    uint64_t v9 = LogObj(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 64);
      int v15 = 138544130;
      id v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1D343E000, v9, OS_LOG_TYPE_ERROR, "Failed to decode FPItem to node.\n\t%{public}@\n\tfpItem: %{public}@\n\tfpDomain: %{public}@\n\terror: %{public}@", (uint8_t *)&v15, 0x2Au);
    }
  }
  uint64_t v12 = static_objc_cast<NSString,objc_object * {__strong}>(v7);
  long long v13 = *(void ***)(a1 + 40);
  long long v14 = *v13;
  std::__shared_weak_count *v13 = (void *)v12;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_makeWithCoder:(id)a3
{
  id v3 = (TNode *)a3;
  id v4 = v3;
  if (v3)
  {
    if (TNode::IsContextOpen(v3))
    {
      id v5 = [(TNode *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"FI Type"];
      id v6 = static_objc_cast<NSString,objc_object * {__strong}>(v5);

      if (![v6 length]) {
        goto LABEL_12;
      }
      id v7 = (id)sSubclassMakeWithCoderRegistry;
      objc_sync_enter(v7);
      id v8 = (id)[(id)sSubclassMakeWithCoderRegistry objectForKeyedSubscript:v6];
      objc_sync_exit(v7);

      if (!v8)
      {
        uint64_t v9 = v6;
        v15.fString.fRef = &stru_1F2ABD380;
        CFRetain(&stru_1F2ABD380);
        TString::SetStringRefAsImmutable(&v15, v9);

        unsigned int v10 = StringToFSInfoVirtualType(&v15);
        TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);
        id v8 = FIDSNodeSubclassForVirtualType(v10);
      }
      if ([v8 conformsToProtocol:&unk_1F2AC4D18])
      {
        uint64_t v11 = [v8 makeWithCoder:v4];
      }
      else
      {
LABEL_12:
        uint64_t v12 = [(TNode *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"FI URL"];
        long long v13 = static_objc_cast<NSString,objc_object * {__strong}>(v12);

        if (v13)
        {
          uint64_t v11 = +[FINode fiNodeFromURL:v13];
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
    }
    else
    {
      id v6 = LogObj(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D343E000, v6, OS_LOG_TYPE_ERROR, "Attempting to decode a node while the DesktopServices context is not open", buf, 2u);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FIDSNode;
  [(FINode *)&v22 encodeWithCoder:v4];
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1F2AC4D18])
  {
    CFStringRef theString = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    id v5 = (id)sSubclassMakeWithCoderRegistry;
    objc_sync_enter(v5);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(id)sSubclassMakeWithCoderRegistry allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v11 = [(id)sSubclassMakeWithCoderRegistry objectForKeyedSubscript:v10];
          if ([v11 isEqual:objc_opt_class()])
          {
            uint64_t v12 = v10;
            if (theString != (CFStringRef)v12) {
              TString::SetStringRefAsImmutable((TString *)&theString, v12);
            }

            goto LABEL_14;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v5);
    if (!CFStringGetLength(theString))
    {
      long long v13 = (TNode *)TNodeFromFINode(&self->super);
      long long v14 = (TString *)TNode::VirtualType(v13);
      FSInfoVirtualTypeToString(v14, (TString *)&cf);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::operator=<__CFString const*,TRetainReleasePolicy<__CFString const*>>((const void **)&theString, &cf);
      CFRetain(&stru_1F2ABD380);
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = &stru_1F2ABD380;
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&cf);
    }
    if (CFStringGetLength(theString)) {
      [v4 encodeObject:theString forKey:@"FI Type"];
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);
  }
  TString v15 = [(FIDSNode *)self fileURL];
  if (v15) {
    [v4 encodeObject:v15 forKey:@"FI URL"];
  }
}

- (void)stopObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(FINode *)self nodesToObserve];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8 * v10);
        NodeUnregisterChangeNotification((TNode *)objc_msgSend(v11, "nodeRef", (void)v12), (OpaqueNodeRef *)a4, v5);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  NodeObservedOptionsCountRegistry::StoppedObserving(self, v5);
}

- (BOOL)isObservedForAll:(unsigned int)a3
{
  return (a3 & ~NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2)) == 0;
}

- (BOOL)isObservedForAny:(unsigned int)a3
{
  return (NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2) & a3) != 0;
}

- (BOOL)isObservedForNone:(unsigned int)a3
{
  return (NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2) & a3) == 0;
}

- (BOOL)isObserved
{
  return NodeObservedOptionsCountRegistry::AllObservedOptions((NodeObservedOptionsCountRegistry *)self, (FINode *)a2) != 0;
}

- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4
{
  unsigned int v9 = a3;
  id v6 = [(FIDSNode *)self asTNode];
  if (!v6)
  {
    int v7 = -8058;
    goto LABEL_5;
  }
  int v7 = TNode::VolumeIs((uint64_t)v6, (int *)&v9);
  if (v7) {
LABEL_5:
  }
    unsigned int v9 = a3;
  if (a4)
  {
    ErrorWithOSStatus(v7, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)inlineProgressCancel
{
  v2 = [(FIDSNode *)self asTNode];
  TNode::InlineProgressCancel(v2);
}

- (id)downloadProgress
{
  v12.fFINode = 0;
  uint64_t v13 = 0;
  int v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v20[0] = 0;
  *(void *)((char *)v20 + 7) = 0;
  __int16 v21 = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  long long v22 = 0u;
  long long v23 = 0u;
  TNodePtr::TNodePtr(&v11, (const TNode *)[(FIDSNode *)self asTNode]);
  int Progress = TProgressMap::GetProgress((TProgressMap *)&v11, &v12, v3);
  if (HIDWORD(v20[0])) {
    int v5 = Progress;
  }
  else {
    int v5 = 0;
  }

  if (v5 == 1)
  {
    id v6 = (id)v23;
    int v7 = [v6 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];
    unsigned int v9 = objc_cast<NSString,objc_object * {__strong}>(v8);

    if (!v9 || ([v9 isEqualToString:*MEMORY[0x1E4F28858]] & 1) == 0)
    {

      unsigned int v9 = v6;
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  if (*((void *)&v22 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v22 + 1));
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v21);
  return v6;
}

- (id)copyProgress
{
  v11.fFINode = 0;
  uint64_t v12 = 0;
  int v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  v19[0] = 0;
  *(void *)((char *)v19 + 7) = 0;
  long long v20 = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  long long v21 = 0u;
  long long v22 = 0u;
  TNodePtr::TNodePtr(&v10, (const TNode *)[(FIDSNode *)self asTNode]);
  if (!TProgressMap::GetProgress((TProgressMap *)&v10, &v11, v3)
    || !operator==((void **)&v20, @"CopyOperationType"))
  {

    goto LABEL_8;
  }
  int v4 = HIDWORD(v19[0]);

  if (!v4)
  {
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  id v5 = (id)v22;
  id v6 = [v5 userInfo];
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];
  uint64_t v8 = objc_cast<NSString,objc_object * {__strong}>(v7);

  if (!v8 || ([v8 isEqualToString:*MEMORY[0x1E4F28858]] & 1) != 0)
  {

    goto LABEL_8;
  }

LABEL_9:
  if (*((void *)&v21 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v21 + 1));
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20);
  return v5;
}

- (BOOL)isPopulated
{
  v2 = [(FIDSNode *)self asTNode];
  return TNode::IsPopulated(v2);
}

- (id)brContainer
{
  Monitor = (void *)TNodeEvent::GetMonitor((TNodeEvent *)[(FINode *)self nodeRef]);
  return Monitor;
}

- (id)brContainerDocuments
{
  v2 = [(FIDSNode *)self asTNode];
  id v3 = v2;
  if (v2)
  {
    if (TNode::VirtualType(v2) == 25)
    {
      TNode::GetAliasTarget(v3, &v6);
      int v4 = (TNode *)TNodeFromFINode(v6);
      FIDSNodeFromTNode(v4);
      id v3 = (TNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)enumeratorError
{
  int v4 = 0;
  TNode::CopyEnumeratorError((uint64_t)[(FIDSNode *)self asTNode], &v4);
  v2 = v4;

  return v2;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  unsigned int v9 = *(OpaqueNodeRef **)&a3;
  uint64_t v17 = 0;
  int v16 = 5;
  uint64_t v15 = &v17;
  TNodePtr v10 = [(FINode *)self nodeRef];
  if (v8) {
    NodeCreateNewRequest(0);
  }
  uint64_t v14 = 0;
  Nodeint Property = GetNodeProperty((TNode *)v10, v9, (TPropertyReference *)&v15, 0, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", v17, v14);
  return v12;
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  unsigned int v9 = *(OpaqueNodeRef **)&a3;
  double v17 = 0.0;
  int v16 = 7;
  uint64_t v15 = &v17;
  TNodePtr v10 = [(FINode *)self nodeRef];
  if (v8) {
    NodeCreateNewRequest(0);
  }
  uint64_t v14 = 0;
  Nodeint Property = GetNodeProperty((TNode *)v10, v9, (TPropertyReference *)&v15, 0, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", v17, v14);
  return v12;
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = [(FIDSNode *)self asTNode];
  if (v9)
  {
    v36 = 0;
    int v35 = 17;
    v34 = &v36;
    if (v7) {
      NodeCreateNewRequest(0);
    }
    CFStringRef v32 = 0;
    CFMutableStringRef v33 = 0;
    int Property = TNode::GetProperty((uint64_t)v9, v8, (TPropertyReference *)&v34, &v33, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v32);
    if (Property)
    {
      TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>::~TRef((const void **)&v36);
      TNodePtr v11 = 0;
    }
    else
    {
      TNodePtr v11 = v36;
      TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>::~TRef((const void **)&v36);
      if (v8 == 1718903156 && [v11 count] && objc_opt_class())
      {
        v27 = objc_opt_new();
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v12);
              }
              int v16 = objc_cast<NSDictionary,objc_object * {__strong}>(*(void **)(*((void *)&v28 + 1) + 8 * i));
              double v17 = v16;
              if (v16)
              {
                uint64_t v18 = [v16 objectForKeyedSubscript:@"TagName"];
                uint64_t v19 = objc_cast<NSString,objc_object * {__strong}>(v18);

                if ([v19 length])
                {
                  long long v20 = [v17 objectForKeyedSubscript:@"TagColor"];
                  long long v21 = objc_cast<NSData,objc_object * {__strong}>(v20);

                  if ([v21 length] == 2) {
                    __int16 v22 = *(_WORD *)[v21 bytes];
                  }
                  else {
                    __int16 v22 = 0;
                  }
                  long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F25D90]) initWithLabel:v19 color:v22];
                  [v27 addObject:v23];
                }
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v13);
        }

        int Property = 0;
        TNodePtr v11 = v27;
      }
      else
      {
        int Property = 0;
      }
    }
  }
  else
  {
    TNodePtr v11 = 0;
    int Property = -8058;
  }
  if (a6)
  {
    ErrorWithOSStatus(Property, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v24 = (void *)[v11 copy];

  return v24;
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  id v11 = [(FIDSNode *)self asTNode];
  id location = 0;
  if (v11)
  {
    int v22 = 10;
    p_id location = &location;
    if (v9 == 1869769063 || v8) {
      NodeCreateNewRequest(0);
    }
    uint64_t v19 = 0;
    long long v20 = 0;
    int Property = TNode::GetProperty((uint64_t)v11, v9, (TPropertyReference *)&p_location, &v20, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v19);
    id v11 = location;
  }
  else
  {
    int Property = -8058;
  }
  uint64_t v13 = objc_cast<UTType,NSObject * {__strong}>(v11);
  uint64_t v14 = v13;
  if (v9 == 1970566256 && (!v13 || [v13 isEqual:*MEMORY[0x1E4F44408]]))
  {
    if ([(FINode *)self isPackage])
    {
      uint64_t v15 = (id *)MEMORY[0x1E4F44468];
    }
    else
    {
      BOOL v16 = [(FINode *)self isFolder];
      uint64_t v15 = (id *)MEMORY[0x1E4F44408];
      if (v16) {
        uint64_t v15 = (id *)MEMORY[0x1E4F443C8];
      }
    }
    objc_storeStrong(&location, *v15);
  }

  if (a6)
  {
    ErrorWithOSStatus(Property, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v17 = location;

  return v17;
}

- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  TNodePtr v10 = [(FIDSNode *)self asTNode];
  if (v10)
  {
    uint64_t v18 = 0;
    int v17 = 15;
    BOOL v16 = &v18;
    if (v8) {
      NodeCreateNewRequest(0);
    }
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    int Property = TNode::GetProperty((uint64_t)v10, v9, (TPropertyReference *)&v16, &v15, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
    if (Property) {
      id v12 = 0;
    }
    else {
      id v12 = v18;
    }
    TRef<__CFDictionary const*,TRetainReleasePolicy<__CFDictionary const*>>::~TRef((const void **)&v18);
    if (a6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = 0;
    int Property = -8058;
    if (a6)
    {
LABEL_10:
      ErrorWithOSStatus(Property, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(OpaqueNodeRef **)&a3;
  BOOL v16 = 0;
  int v15 = 1;
  uint64_t v14 = &v16;
  TNodePtr v10 = [(FINode *)self nodeRef];
  if (v8) {
    NodeCreateNewRequest(0);
  }
  uint64_t v13 = 0;
  Nodeint Property = GetNodeProperty((TNode *)v10, v9, (TPropertyReference *)&v14, 0, a5);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v13);
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(OpaqueNodeRef **)&a3;
  if ([(FIDSNode *)self asTNode])
  {
    uint64_t v19 = 0;
    long long v20 = 0;
    int v18 = 9;
    int v17 = &v19;
    id v11 = [(FINode *)self nodeRef];
    if (v8) {
      NodeCreateNewRequest(0);
    }
    __p[0] = 0;
    Nodeint Property = GetNodeProperty((TNode *)v11, v9, (TPropertyReference *)&v17, 0, a5);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef((TNodeRequest **)__p);
    if (NodeProperty == -8063)
    {
      std::vector<unsigned char>::vector(__p, HIDWORD(v19));
      long long v20 = __p[0];
      LODWORD(v19) = HIDWORD(v19);
      int v15 = 0;
      Nodeint Property = GetNodeProperty((TNode *)[(FINode *)self nodeRef], v9, (TPropertyReference *)&v17, 0, a5);
      TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v15);
      if (NodeProperty)
      {
        id v12 = 0;
      }
      else
      {
        id v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v20, HIDWORD(v19), v15);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
    Nodeint Property = -8058;
  }
  if (a6)
  {
    ErrorWithOSStatus(NodeProperty, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  TNodePtr v10 = *(OpaqueNodeRef **)&a3;
  CFNumberRef v12 = (const __CFNumber *)a4;
  CFNumberRef v13 = v12;
  if (v12)
  {
    CFNumberType Type = CFNumberGetType(v12);
    switch(Type)
    {
      case kCFNumberSInt16Type:
        LOWORD(v21) = [(__CFNumber *)v13 shortValue];
        int v17 = [(FINode *)self nodeRef];
        int v24 = 3;
        long long v23 = &v21;
        if (v9) {
          NodeCreateNewRequest(0);
        }
        break;
      case kCFNumberSInt32Type:
        LODWORD(v21) = [(__CFNumber *)v13 intValue];
        int v17 = [(FINode *)self nodeRef];
        int v24 = 4;
        long long v23 = &v21;
        if (v9) {
          NodeCreateNewRequest(0);
        }
        break;
      case kCFNumberSInt64Type:
        uint64_t v22 = [(__CFNumber *)v13 longLongValue];
        int v15 = [(FINode *)self nodeRef];
        int v24 = 5;
        long long v23 = &v22;
        if (v9) {
          NodeCreateNewRequest(0);
        }
        uint64_t v21 = 0;
        int v18 = SetNodeProperty((TNode *)v15, v10, (const TPropertyReference *)&v23, 0, v8);
        uint64_t v19 = (TNodeRequest **)&v21;
LABEL_18:
        TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(v19);
        if (!a7)
        {
LABEL_20:
          BOOL v16 = v18 == 0;
          goto LABEL_21;
        }
LABEL_19:
        ErrorWithOSStatus(v18, 0);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      default:
        int v18 = -8072;
        if (!a7) {
          goto LABEL_20;
        }
        goto LABEL_19;
    }
    uint64_t v22 = 0;
    int v18 = SetNodeProperty((TNode *)v17, v10, (const TPropertyReference *)&v23, 0, v8);
    uint64_t v19 = (TNodeRequest **)&v22;
    goto LABEL_18;
  }
  if (a7)
  {
    ErrorWithOSStatus(-8072, 0);
    BOOL v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_21:

  return v16;
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  TNodePtr v10 = *(OpaqueNodeRef **)&a3;
  [a4 timeIntervalSinceReferenceDate];
  uint64_t v19 = v12;
  CFNumberRef v13 = [(FINode *)self nodeRef];
  int v18 = 7;
  int v17 = &v19;
  if (v9) {
    NodeCreateNewRequest(0);
  }
  BOOL v16 = 0;
  int v14 = SetNodeProperty((TNode *)v13, v10, (const TPropertyReference *)&v17, 0, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v16);
  if (a7)
  {
    ErrorWithOSStatus(v14, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  TNodePtr v10 = *(OpaqueNodeRef **)&a3;
  uint64_t v12 = (void *)[a4 copy];
  CFNumberRef v13 = v12;
  long long v20 = v12;
  if (v12) {
    CFRetain(v12);
  }

  int v14 = [(FINode *)self nodeRef];
  int v19 = 12;
  int v18 = &v20;
  if (v9) {
    NodeCreateNewRequest(0);
  }
  int v17 = 0;
  int v15 = SetNodeProperty((TNode *)v14, v10, (const TPropertyReference *)&v18, 0, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v17);
  if (a7)
  {
    ErrorWithOSStatus(v15, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef(&v20);
  return v15 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  TNodePtr v10 = *(OpaqueNodeRef **)&a3;
  uint64_t v12 = (void *)[a4 copy];
  CFNumberRef v13 = v12;
  long long v20 = v12;
  if (v12) {
    CFRetain(v12);
  }

  int v14 = [(FINode *)self nodeRef];
  int v19 = 17;
  int v18 = &v20;
  if (v9) {
    NodeCreateNewRequest(0);
  }
  int v17 = 0;
  int v15 = SetNodeProperty((TNode *)v14, v10, (const TPropertyReference *)&v18, 0, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v17);
  if (a7)
  {
    ErrorWithOSStatus(v15, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  TRef<__CFArray const*,TRetainReleasePolicy<__CFArray const*>>::~TRef(&v20);
  return v15 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  TNodePtr v10 = *(OpaqueNodeRef **)&a3;
  BOOL v17 = a4;
  id v11 = [(FINode *)self nodeRef];
  int v16 = 1;
  int v15 = &v17;
  if (v9) {
    NodeCreateNewRequest(0);
  }
  int v14 = 0;
  int v12 = SetNodeProperty((TNode *)v11, v10, (const TPropertyReference *)&v15, 0, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v14);
  if (a7)
  {
    ErrorWithOSStatus(v12, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12 == 0;
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  TNodePtr v10 = *(OpaqueNodeRef **)&a3;
  id v12 = a4;
  CFNumberRef v13 = v12;
  if (!v12)
  {
    if (a7)
    {
      int v15 = ErrorWithOSStatus(-8072, 0);
      goto LABEL_7;
    }
LABEL_10:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  size_t v14 = [v12 length];
  if (HIDWORD(v14))
  {
    if (a7)
    {
      int v15 = ErrorWithOSStatus(-8096, 0);
LABEL_7:
      BOOL v16 = 0;
      *a7 = v15;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  v24[0] = v14;
  v24[1] = v14;
  std::vector<unsigned char>::vector(__p, v14);
  v25 = __p[0];
  objc_msgSend(v13, "getBytes:length:");
  BOOL v17 = [(FINode *)self nodeRef];
  int v22 = 9;
  uint64_t v21 = v24;
  if (v9) {
    NodeCreateNewRequest(0);
  }
  long long v20 = 0;
  int v18 = SetNodeProperty((TNode *)v17, v10, (const TPropertyReference *)&v21, 0, v8);
  TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v20);
  if (a7)
  {
    ErrorWithOSStatus(v18, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v16 = v18 == 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_15:

  return v16;
}

- (void)nodeRestartObservingWithOptions:(unsigned int)a3
{
  int v4 = [(FIDSNode *)self asTNode];
  if (v4)
  {
    TNode::RestartCollections(v4, HIBYTE(a3) & 1);
  }
}

- (BOOL)markAsUsed:(id *)a3
{
  int v4 = [(FIDSNode *)self asTNode];
  id v6 = (TNode *)TNode::Validate((TNode *)v4, v5);
  int v7 = (int)v6;
  if (!v6)
  {
    uint64_t v8 = (os_unfair_lock_s *)TNode::InfoLock(v6);
    os_unfair_lock_lock(v8);
    uint64_t v10 = *((void *)v4 + 2);
    BOOL v9 = (std::__shared_weak_count *)*((void *)v4 + 3);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      os_unfair_lock_unlock(v8);
      int v11 = *(unsigned __int8 *)(v10 + 112);
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      if (v11)
      {
LABEL_4:
        int v7 = -8072;
        goto LABEL_5;
      }
    }
    else
    {
      os_unfair_lock_unlock(v8);
      if (*(unsigned char *)(v10 + 112)) {
        goto LABEL_4;
      }
    }
    memset(&v13, 0, sizeof(v13));
    TNode::RequestInternalTask((const TNode *)v4, 1007, &v13, 0);
    TPropertyValue::~TPropertyValue(&v13);
    int v7 = 0;
    if (!a3) {
      return v7 == 0;
    }
    goto LABEL_6;
  }
LABEL_5:
  if (a3)
  {
LABEL_6:
    ErrorWithOSStatus(v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 == 0;
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(FIDSNode *)self asTNode];
  if (v6)
  {
    if (v4) {
      NodeCreateNewRequest(0);
    }
    int v7 = 0;
    uint64_t v8 = 0;
    TNode::Synchronize((uint64_t)v6, &v8, a3);
    TRef<OpaqueNodeRequest *,TRetainReleasePolicy<OpaqueNodeRequest *>>::~TRef(&v7);
  }
}

- (void)_sendNotification:(unsigned int)a3 node:(id)a4 property:(unsigned int)a5
{
  id v8 = a4;
  BOOL v9 = [(FIDSNode *)self asTNode];
  uint64_t v10 = objc_cast<FIDSNode,FINode * {__strong}>(v8);
  TNodePtr::TNodePtr(&v11, (const TNode *)[v10 asTNode]);
  TNodeEvent::CreateNodeEvent(a3, (id *)&v11.fFINode, a5, &v14);

  v11.fFINode = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  TNodePtr::TNodePtr(&v15, v9);
  TNodeEventPtrs::AddEvent((TNodeEventPtrs *)&v11, &v15, &v14);

  TNodeEventPtrs::SendNotifications((id **)&v11);
  v15.fFINode = (FINode *)&v11;
  std::vector<std::pair<TNodePtr,TNodeEventPtr>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  TNodeEventPtr::~TNodeEventPtr(&v14);
}

+ (id)appContainersForContainerRoot:(id)a3 showAllFiles:(BOOL)a4 showSystemFiles:(BOOL)a5
{
  id v7 = a3;
  TNodePtr::TNodePtr(&v16, (const TNode *)[v7 asTNode]);
  v17[0] = a4;
  v17[1] = a5;
  id v18 = 0;

  TContainerFetcher::FetchContainersAndDocumentsFolders((TContainerFetcher *)v17, &v14);
  id v8 = type_traits_extras::CopyAsHelper<NSMutableArray<FPProviderDomain *> * {__strong}>::MakeWithCapacity(0xAAAAAAAAAAAAAAABLL * ((v15 - v14) >> 4));
  uint64_t v9 = v14;
  uint64_t v10 = v15;
  id v11 = v8;
  while (v9 != v10)
  {
    id v12 = *(id *)(v9 + 8);
    [v11 addObject:v12];

    v9 += 48;
  }

  int v19 = (void **)&v14;
  std::vector<TAppContainerInfo>::__destroy_vector::operator()[abi:ne180100](&v19);

  return v11;
}

@end