@interface FICustomNode
- (FICustomNode)init;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)nodesForSizing;
- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (void)dealloc;
@end

@implementation FICustomNode

- (FICustomNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)FICustomNode;
  v2 = [(FICustomNode *)&v5 init];
  TNode::CreateCustomNode((TNode *)v2, v3);
  return v2;
}

- (void)dealloc
{
  v3 = +[FIPresentationNodeMap shared];
  [v3 unregisterAllForPresentationNode:self];

  v4.receiver = self;
  v4.super_class = (Class)FICustomNode;
  [(FICustomNode *)&v4 dealloc];
}

- (id)iteratorWithOptions:(unsigned int)a3
{
}

- (id)nodesForSizing
{
  return 0;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  uint64_t v9 = *(void *)&a3;
  if ((int)a3 > 1819240306)
  {
    if (a3 == 1885895027) {
      goto LABEL_7;
    }
    int v11 = 1819240307;
  }
  else
  {
    if (a3 == 1667785588) {
      goto LABEL_7;
    }
    int v11 = 1684237940;
  }
  if (a3 != v11)
  {
LABEL_18:
    v30.receiver = self;
    v30.super_class = (Class)FICustomNode;
    v20 = [(FIDSNode *)&v30 propertyAsNumber:v9 async:v8 options:v7 error:a6];
    goto LABEL_33;
  }
LABEL_7:
  v12 = [(FICustomNode *)self nodesForSizing];
  if (!v12) {
    goto LABEL_18;
  }
  v13 = v12;
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)v34, v12);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v33, -1, v13);
  unint64_t v14 = std::distance[abi:ne180100]<IDContainerIteratorAdaptor<NSArray<FINode *>>>((uint64_t)v34, (uint64_t)v33);

  type_traits_extras::CopyAsHelper<std::vector<long long>>::MakeWithCapacity(v14, (uint64_t)&v31);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&v36, v13);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v35, -1, v13);
  v43 = (void **)&v31;
  if (v9 == 1684237940) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v8;
  }
  while (v36 != (id)v35[0] || v41 != v35[16])
  {
    id v15 = *(id *)(v37[1] + 8 * v40);
    v16 = [v15 propertyAsNumber:v9 async:v8 options:v7 error:0];
    uint64_t v17 = [v16 longLongValue];

    uint64_t v42 = v17;
    std::back_insert_iterator<std::vector<long long>>::operator=[abi:ne180100]((uint64_t *)&v43, &v42);

    uint64_t v18 = v40;
    if (v40 >= v39 - 1)
    {
      uint64_t v19 = [v36 countByEnumeratingWithState:v37 objects:v38 count:4];
      uint64_t v18 = -1;
      uint64_t v39 = v19;
      uint64_t v40 = -1;
    }
    if (v38[4] != *(void *)v37[2])
    {
      objc_enumerationMutation(v36);
      uint64_t v18 = v40;
    }
    uint64_t v40 = v18 + 1;
    ++v41;
  }

  v21 = v31;
  if (v31 == v32)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 0;
    v23 = v31;
    do
    {
      uint64_t v25 = *v23++;
      uint64_t v24 = v25;
      uint64_t v26 = v25 | v22;
      if (v22 >= v25) {
        uint64_t v27 = v24;
      }
      else {
        uint64_t v27 = v22;
      }
      uint64_t v28 = v24 + v22;
      if (v26 >= 0) {
        uint64_t v22 = v28;
      }
      else {
        uint64_t v22 = v27;
      }
    }
    while (v23 != v32);
  }
  v20 = [NSNumber numberWithLongLong:v22];
  if (v21) {
    operator delete(v21);
  }

LABEL_33:
  return v20;
}

@end