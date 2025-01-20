@interface FICompoundNode
- (FICompoundNode)initWithFINodes:(id)a3;
- (NSArray)nodes;
- (id).cxx_construct;
- (id)fileURL;
- (id)fpItem;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)longDescription;
- (id)nodesToObserve;
- (id)shortDescription;
- (void)dispatchEvent:(id)a3 forObserver:(id)a4;
- (void)dispatchEvent:forObserver:;
- (void)startObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4;
- (void)stopObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4;
- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4;
@end

@implementation FICompoundNode

- (FICompoundNode)initWithFINodes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FICompoundNode;
  v5 = [(FICustomNode *)&v9 init];
  uint64_t v6 = [v4 copy];
  nodes = v5->_nodes;
  v5->_nodes = (NSArray *)v6;

  return v5;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  std::__hash_table<TNodePtr,std::hash<TNodePtr>,std::equal_to<TNodePtr>,std::allocator<TNodePtr>>::~__hash_table((uint64_t)&self->_nodesToComplete);
}

- (id)nodesToObserve
{
  return self->_nodes;
}

- (id)fileURL
{
  NSUInteger v3 = [(NSArray *)self->_nodes count];
  nodes = self->_nodes;
  if (v3 < 2) {
    [(NSArray *)nodes firstObject];
  }
  else {
  v5 = [(NSArray *)nodes objectAtIndexedSubscript:1];
  }
  uint64_t v6 = [v5 fileURL];

  return v6;
}

- (id)fpItem
{
  return 0;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  NSUInteger v3 = [[FICompoundNodeIterator alloc] initWithFINodes:self->_nodes options:*(void *)&a3];
  return v3;
}

- (id)longDescription
{
  NSUInteger v3 = [(FICompoundNode *)self nodes];
  TString::TString(&v15, "\n\t", 2uLL);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&obj, v3);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v17, -1, v3);
  CFStringRef theString = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  while (obj != (id)v17[0] || v23 != v17[16])
  {
    id v4 = *(id *)(v19[1] + 8 * v22);
    v5 = [v4 longDescription];
    v24.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v24, v5);

    if (CFStringGetLength(theString) && CFStringGetLength(v24.fString.fRef)) {
      TString::Append((TString *)&theString, &v15);
    }
    TString::Append((TString *)&theString, &v24);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v24.fString.fRef);
    uint64_t v6 = v22;
    if (v22 >= v21 - 1)
    {
      uint64_t v7 = [obj countByEnumeratingWithState:v19 objects:v20 count:4];
      uint64_t v6 = -1;
      uint64_t v21 = v7;
      uint64_t v22 = -1;
    }
    if (v20[4] != *(void *)v19[2])
    {
      objc_enumerationMutation(obj);
      uint64_t v6 = v22;
    }
    uint64_t v22 = v6 + 1;
    ++v23;
  }

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);
  v8 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)FICompoundNode;
  objc_super v9 = [(FINode *)&v14 longDescription];
  v10 = [(FICompoundNode *)self nodes];
  uint64_t v11 = [v10 count];
  v12 = [v8 stringWithFormat:@"<%@ (%ld sub-nodes):\n\t%@>", v9, v11, (id) theString];

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);
  return v12;
}

- (id)shortDescription
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FICompoundNode;
  id v4 = [(FIDSNode *)&v8 shortDescription];
  v5 = [(FICompoundNode *)self nodes];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ (%ld sub-nodes)>", v4, objc_msgSend(v5, "count")];

  return v6;
}

- (void)startObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = [(FIDSNode *)self isObservedForAll:1];
  v14.receiver = self;
  v14.super_class = (Class)FICompoundNode;
  [(FIDSNode *)&v14 startObserving:v5 with:a4];
  if (!v7 && [(FIDSNode *)self isObservedForAll:1])
  {
    objc_super v8 = self;
    objc_sync_enter(v8);
    objc_super v9 = [(FICompoundNode *)v8 nodesToObserve];
    IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&obj, v9);
    IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v15, -1, v9);
    while (obj != (id)v15[0] || v23 != v15[16])
    {
      id v10 = *(id *)(v18 + 8 * v22);
      char v11 = [v10 isPopulated];

      if ((v11 & 1) == 0)
      {
        id v24 = *(id *)(v18 + 8 * v22);
        std::__hash_table<FINode * {__strong},std::hash<FINode * {__strong}>,std::equal_to<FINode * {__strong}>,std::allocator<FINode * {__strong}>>::__emplace_unique_key_args<FINode * {__strong},FINode * {__strong}>((uint64_t)&v8->_nodesToComplete, &v24, (uint64_t *)&v24);
      }
      uint64_t v12 = v22;
      if (v22 >= v21 - 1)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v17 objects:v20 count:4];
        uint64_t v12 = -1;
        uint64_t v21 = v13;
        uint64_t v22 = -1;
      }
      if (v20[4] != *v19)
      {
        objc_enumerationMutation(obj);
        uint64_t v12 = v22;
      }
      uint64_t v22 = v12 + 1;
      ++v23;
    }

    objc_sync_exit(v8);
  }
}

- (void)stopObserving:(unsigned int)a3 with:(OpaqueEventNotifier *)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = [(FIDSNode *)self isObservedForAll:1];
  v9.receiver = self;
  v9.super_class = (Class)FICompoundNode;
  [(FIDSNode *)&v9 stopObserving:v5 with:a4];
  if (v7)
  {
    if ([(FIDSNode *)self isObservedForNone:1])
    {
      objc_super v8 = self;
      objc_sync_enter(v8);
      std::__hash_table<FINode * {__strong},std::hash<FINode * {__strong}>,std::equal_to<FINode * {__strong}>,std::allocator<FINode * {__strong}>>::clear((uint64_t)&v8->_nodesToComplete);
      objc_sync_exit(v8);
    }
  }
}

- (void)dispatchEvent:(id)a3 forObserver:(id)a4
{
  id v6 = a4;
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v15);
  uint64_t v13 = self;
  objc_super v14 = v15;
  BOOL v7 = v13;
  TNodeEventPtr::TNodeEventPtr((TNodeEventPtr *)&location, 0);
  switch(*(_DWORD *)TNodeEventPtr::operator->(&v15))
  {
    case 1:
    case 2:
      goto LABEL_14;
    case 3:
    case 4:
    case 6:
      objc_super v8 = v7;
      objc_sync_enter(v8);
      if (!v8[15].super.isa) {
        -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v13);
      }
      goto LABEL_13;
    case 8:
      objc_super v8 = v7;
      objc_sync_enter(v8);
      if (v8[15].super.isa)
      {
        id v11 = *(id *)(TNodeEventPtr::operator->(&v15) + 8);
        std::__hash_table<FINode * {__strong},std::hash<FINode * {__strong}>,std::equal_to<FINode * {__strong}>,std::allocator<FINode * {__strong}>>::__erase_unique<FINode * {__strong}>(&v8[12].super.isa, &v11);

        if (!v8[15].super.isa) {
          -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v13);
        }
      }
      goto LABEL_13;
    case 9:
      objc_super v8 = v7;
      objc_sync_enter(v8);
      if (v8[15].super.isa)
      {
        int isa_low = LOBYTE(v8[17].super.isa);
        LOBYTE(v8[17].super.isa) = 1;
        if (!isa_low) {
          -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v13);
        }
      }
      goto LABEL_13;
    case 0x14:
      objc_super v8 = v7;
      objc_sync_enter(v8);
      if (!v8[15].super.isa) {
        -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v13);
      }
LABEL_13:
      objc_sync_exit(v8);

LABEL_14:
      if (TNodeEventPtr::operator->(&location))
      {
        v10.receiver = v7;
        v10.super_class = (Class)FICompoundNode;
        [(FIDSNode *)&v10 dispatchEvent:location forObserver:v6];
      }
      TNodeEventPtr::~TNodeEventPtr(&location);

      TNodeEventPtr::~TNodeEventPtr((id *)&v14);
      TNodeEventPtr::~TNodeEventPtr((id *)&v15);

      return;
    default:
      -[FICompoundNode dispatchEvent:forObserver:]::$_2::operator()((FINode **)&v13);
  }
}

- (void)dispatchEvent:forObserver:
{
  v1 = a1 + 1;
  v2 = (const TNode *)TNodeFromFINode(*a1);
  NSUInteger v3 = *(TDSNotifier **)(TNodeEventPtr::operator->(v1) + 64);
  objc_super v8 = v3;
  if (v3) {
    TDSNotifier::AddPtrReference(v3);
  }
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *((void *)v3 + 1);
  uint64_t v9 = v4;
  uint64_t v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  TNodePtr::TNodePtr(&v7, v2);
  TNodePtr::TNodePtr(&v6, v2);
  TDSNotifier::Make();
}

- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  TNodePtr v6 = self->_nodes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v9);
        objc_msgSend(v10, "synchronizeChildren:events:", v5, a4, (void)v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSArray)nodes
{
  return self->_nodes;
}

@end