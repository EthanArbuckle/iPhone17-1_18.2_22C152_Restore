@interface FILocalAppContainerNode
- (FILocalAppContainerNode)initWithAppContainerInfo:(const void *)a3;
- (FILocalAppContainerNode)initWithAppContainerRoot:(id)a3 documentsNode:(id)a4 appIdentifier:(id)a5;
- (FINode)containerRootNode;
- (NSString)appIdentifier;
- (NSString)description;
- (id)_uiParent;
- (id)fileParent;
- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (void)dealloc;
- (void)dispatchEvent:(id)a3 forObserver:(id)a4;
@end

@implementation FILocalAppContainerNode

- (FILocalAppContainerNode)initWithAppContainerRoot:(id)a3 documentsNode:(id)a4 appIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v19.receiver = self;
    v19.super_class = (Class)FILocalAppContainerNode;
    v13 = [(FIProxyNode *)&v19 initWithSubject:v9];
    self = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_appIdentifier, a5);
      static_objc_cast<NSString,objc_object * {__strong}>(v8);
      v14 = (FINode *)objc_claimAutoreleasedReturnValue();
      containerRootNode = self->_containerRootNode;
      self->_containerRootNode = v14;

      if (!self->_containerRootNode)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v16 = +[FIPresentationNodeMap shared];
      [v16 registerPresentationNode:self forNode:self->_containerRootNode];

      v17 = +[FIPresentationNodeMap shared];
      [v17 registerPresentationNode:self forNode:v9];
    }
    self = self;
    v12 = self;
  }
LABEL_9:

  return v12;
}

- (void)dealloc
{
  if (self->_shouldStopAccessingSecurityScopedURL)
  {
    v3 = [(FPAppMetadata *)self->_metaData documentsURL];
    [v3 stopAccessingSecurityScopedResource];
  }
  v4.receiver = self;
  v4.super_class = (Class)FILocalAppContainerNode;
  [(FICustomNode *)&v4 dealloc];
}

- (FILocalAppContainerNode)initWithAppContainerInfo:(const void *)a3
{
  objc_super v4 = [(FILocalAppContainerNode *)self initWithAppContainerRoot:*(void *)a3 documentsNode:*((void *)a3 + 1) appIdentifier:*((void *)a3 + 2)];
  if ([(FIDSNode *)v4 asTNode])
  {
    objc_storeStrong((id *)&v4->_metaData, *((id *)a3 + 4));
    v5 = [(FPAppMetadata *)v4->_metaData documentsURL];
    v4->_shouldStopAccessingSecurityScopedURL = [v5 startAccessingSecurityScopedResource];

    v6 = [(FPAppMetadata *)v4->_metaData displayName];
    v11.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v11, v6);

    int v10 = 11;
    id v8 = 0;
    id v9 = &v11;
    TNode::SetProperty((uint64_t)[(FIDSNode *)v4 asTNode], 1886282093, (const TPropertyReference *)&v9, &v8, 0, 0);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v11.fString.fRef);
  }
  return v4;
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a3 == 1886282093 || a3 == 1684955501)
  {
    v7 = [(FPAppMetadata *)self->_metaData displayName];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FILocalAppContainerNode;
    v7 = -[FIProxyNode propertyAsString:async:options:error:](&v9, sel_propertyAsString_async_options_error_);
  }
  return v7;
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v6 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v13);
  id obj = self;
  v12 = v13;
  TNodeEventPtr::operator->(&v13);
  v7 = (const TNode *)TNodeFromFINode((FINode *)obj);
  id v8 = *(TDSNotifier **)(TNodeEventPtr::operator->(&v12) + 64);
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

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(FINode *)self displayName];
  id v6 = [(FILocalAppContainerNode *)self documentsNode];
  v7 = [(FILocalAppContainerNode *)self appIdentifier];
  id v8 = [v3 stringWithFormat:@"%@<%@>(proxyFor=%@, containerID=%@)", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (FINode)containerRootNode
{
  return self->_containerRootNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerRootNode, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

@end