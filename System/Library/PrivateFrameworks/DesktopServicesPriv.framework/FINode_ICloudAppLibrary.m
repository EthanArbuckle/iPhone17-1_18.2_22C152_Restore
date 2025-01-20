@interface FINode_ICloudAppLibrary
- (BOOL)isValid;
- (FINode)documentsFolder;
- (NSString)appIdentifier;
- (id).cxx_construct;
- (id)_uiParent;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)nodeToMoveOrDelete;
- (id)nodesToObserve;
- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)updateDocumentsFolder;
- (void)dealloc;
- (void)dispatchEvent:(id)a3 forObserver:(id)a4;
@end

@implementation FINode_ICloudAppLibrary

- (void)dealloc
{
  v3 = +[FIPresentationNodeMap shared];
  [v3 unregisterAllForPresentationNode:self];

  v4.receiver = self;
  v4.super_class = (Class)FINode_ICloudAppLibrary;
  [(FINode_ICloudAppLibrary *)&v4 dealloc];
}

- (BOOL)isValid
{
  v8.receiver = self;
  v8.super_class = (Class)FINode_ICloudAppLibrary;
  if (![(FIDSNode *)&v8 isValid]) {
    return 0;
  }
  v3 = [(FIDSNode *)self asTNode];
  objc_super v4 = (os_unfair_lock_s *)TNode::ParentLock((TNode *)v3);
  os_unfair_lock_lock(v4);
  TNodePtr::TNodePtr(&v7, *((const TNode **)v3 + 6));
  os_unfair_lock_unlock(v4);
  BOOL v5 = TNodeFromFINode(v7.fFINode) != 0;

  return v5;
}

- (NSString)appIdentifier
{
  p_appIdentifier = &self->_appIdentifier;
  if (!CFStringGetLength(self->_appIdentifier.fString.fRef))
  {
    objc_super v4 = [(FIDSNode *)self fpItem];
    BOOL v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "fp_appContainerBundleIdentifier");
      v6 = (TString *)(id)objc_claimAutoreleasedReturnValue();
      if ((TString *)p_appIdentifier->fString.fRef != v6) {
        TString::SetStringRefAsImmutable(p_appIdentifier, v6);
      }
    }
  }
  TNodePtr v7 = p_appIdentifier->fString.fRef;
  return (NSString *)v7;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v4 = [(FINode_ICloudAppLibrary *)self documentsFolder];
  BOOL v5 = [v4 iteratorWithOptions:v3];

  return v5;
}

- (id)updateDocumentsFolder
{
  if ([(FINode_ICloudAppLibrary *)self isValid])
  {
    uint64_t v3 = [(FIDSNode *)self fileURL];
    objc_super v4 = +[FINode fiNodeFromURL:v3];

    BOOL v5 = self;
    objc_sync_enter(v5);
    objc_storeWeak((id *)&v5->_documentsFolder, v4);
    objc_sync_exit(v5);
  }
  else
  {
    objc_super v4 = 0;
  }
  return v4;
}

- (FINode)documentsFolder
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_documentsFolder);
  objc_sync_exit(v2);

  if (!WeakRetained || ([WeakRetained isValid] & 1) == 0)
  {
    uint64_t v4 = [(FINode_ICloudAppLibrary *)v2 updateDocumentsFolder];

    id WeakRetained = (id)v4;
  }
  return (FINode *)WeakRetained;
}

- (id)_uiParent
{
  v2 = [(FINode_ICloudAppLibrary *)self documentsFolder];
  uint64_t v3 = [v2 fileParent];
  uint64_t v4 = [v3 parent];

  return v4;
}

- (id)nodeToMoveOrDelete
{
  v2 = [(FINode_ICloudAppLibrary *)self documentsFolder];
  uint64_t v3 = [v2 fileParent];

  return v3;
}

- (id)nodesToObserve
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FINode_ICloudAppLibrary *)self documentsFolder];
  if (!v3)
  {
    uint64_t v4 = LogObj(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = [(FINode *)self displayName];
      v9.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v9, v5);

      v6 = SanitizedStr(&v9);
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1D343E000, v4, OS_LOG_TYPE_ERROR, "Documents folder is nil for '%{public}@' returning empty nodes to observe", buf, 0xCu);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v9.fString.fRef);
    }
  }
  TNodePtr v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, 0, v9.fString.fRef);

  return v7;
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v6 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v13);
  id obj = self;
  uint64_t v12 = v13;
  TNodeEventPtr::operator->(&v13);
  TNodePtr v7 = (const TNode *)TNodeFromFINode((FINode *)obj);
  objc_super v8 = *(TDSNotifier **)(TNodeEventPtr::operator->(&v12) + 64);
  v16 = v8;
  if (v8) {
    TDSNotifier::AddPtrReference(v8);
  }
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *((void *)v8 + 1);
  uint64_t v17 = v9;
  uint64_t v18 = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  TNodePtr::TNodePtr(&v15, v7);
  TNodePtr::TNodePtr(&v14, v7);
  TDSNotifier::Make();
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  if ((int)a3 <= 1836016739)
  {
    if (a3 != 1634952036)
    {
      int v10 = 1819632756;
      goto LABEL_6;
    }
LABEL_7:
    v11 = [(FINode_ICloudAppLibrary *)self documentsFolder];
    uint64_t v12 = [v11 propertyAsDate:v9 async:v8 options:v7 error:a6];

    goto LABEL_9;
  }
  if (a3 == 1883333732) {
    goto LABEL_7;
  }
  int v10 = 1836016740;
LABEL_6:
  if (a3 == v10) {
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)FINode_ICloudAppLibrary;
  uint64_t v12 = [(FIDSNode *)&v14 propertyAsDate:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
LABEL_9:
  return v12;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  if (a3 == 1684237940 || a3 == 1885895027 || a3 == 1819240307)
  {
    uint64_t v12 = [(FINode_ICloudAppLibrary *)self documentsFolder];
    v13 = [v12 propertyAsNumber:v9 async:v8 options:v7 error:a6];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)FINode_ICloudAppLibrary;
    v13 = [(FIDSNode *)&v15 propertyAsNumber:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
  }
  return v13;
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  if (a3 == 1718903156)
  {
    uint64_t v9 = [(FINode_ICloudAppLibrary *)self documentsFolder];
    int v10 = [v9 propertyAsArray:1718903156 async:v8 options:v7 error:a6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)FINode_ICloudAppLibrary;
    int v10 = [(FIDSNode *)&v12 propertyAsArray:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
  }
  return v10;
}

- (void).cxx_destruct
{
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&self->_appIdentifier.fString.fRef);
  objc_destroyWeak((id *)&self->_documentsFolder);
}

- (id).cxx_construct
{
  self->_appIdentifier.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  return self;
}

@end