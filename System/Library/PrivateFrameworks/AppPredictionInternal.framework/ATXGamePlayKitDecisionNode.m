@interface ATXGamePlayKitDecisionNode
- (ATXGamePlayKitDecisionNode)initWithNode:(shared_ptr<ATXGamePlayKitCDecisionNode>)a3 tree:(id)a4;
- (id).cxx_construct;
- (id)attribute;
- (id)branches;
- (id)createBranchWithPredicate:(id)a3 attribute:(id)a4;
- (id)createBranchWithValue:(id)a3 attribute:(id)a4;
- (id)createBranchWithWeight:(int64_t)a3 attribute:(id)a4;
- (id)createChildWithAttribute:(id)a3 randomSource:(id)a4 withBranch:(id)a5;
- (id)description;
- (id)getNodeAtBranch:(id)a3;
- (void)dealloc;
- (void)setAttribute:(id)a3;
@end

@implementation ATXGamePlayKitDecisionNode

- (ATXGamePlayKitDecisionNode)initWithNode:(shared_ptr<ATXGamePlayKitCDecisionNode>)a3 tree:(id)a4
{
  ptr = a3.__ptr_;
  v6 = a3.__cntrl_;
  v13.receiver = self;
  v13.super_class = (Class)ATXGamePlayKitDecisionNode;
  v7 = [(ATXGamePlayKitDecisionNode *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v9 = *(ATXGamePlayKitCDecisionNode **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v7->_node.__cntrl_;
    v8->_node.__ptr_ = v9;
    v8->_node.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      v9 = v8->_node.__ptr_;
    }
    objc_storeWeak((id *)v9 + 11, v8);
    objc_storeWeak((id *)&v8->_tree, v6);
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ATXGamePlayKitDecisionNode;
  [(ATXGamePlayKitDecisionNode *)&v2 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"attribute: %@, child count: %lu\n", *((void *)self->_node.__ptr_ + 7), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*((void *)self->_node.__ptr_ + 1) - *(void *)self->_node.__ptr_) >> 3)];
}

- (id)branches
{
  return ATXGamePlayKitCDecisionNode::branches(self->_node.__ptr_);
}

- (void)setAttribute:(id)a3
{
  id v5 = a3;
  ptr = self->_node.__ptr_;
  if (ptr)
  {
    id v7 = v5;
    objc_storeStrong((id *)ptr + 7, a3);
    id v5 = v7;
  }
}

- (id)attribute
{
  ptr = self->_node.__ptr_;
  if (ptr) {
    id v3 = *((id *)ptr + 7);
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (id)createChildWithAttribute:(id)a3 randomSource:(id)a4 withBranch:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  ptr = self->_node.__ptr_;
  if (!ptr)
  {
    [NSString stringWithFormat:@"ATXGamePlayKitDecisionTree: Cannot create new child with branch: %@ and attribute: %@ from nil node.", v11, v9, v10, v9];
    id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v40);
  }
  if (*((void *)ptr + 1) != *(void *)ptr)
  {
    [**(id **)ptr superclass];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [NSString stringWithFormat:@"ATXGamePlayKitDecisionTree: Cannot create child for node type: %@, with branch: %@", objc_msgSend(**(id **)self->_node.__ptr_, "superclass"), v11];
      id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v41);
    }
    ptr = self->_node.__ptr_;
    uint64_t v13 = *((void *)ptr + 9);
    if (!v10 && v13)
    {
      [NSString stringWithFormat:@"ATXGamePlayKitDecisionTree: Cannot create child for random node type with branch: %@", v11];
      id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v42);
    }
    if (v10 && !v13)
    {
      [NSString stringWithFormat:@"ATXGamePlayKitDecisionTree: Cannot create child for node type: %@ with random branch", objc_msgSend(**(id **)ptr, "superclass")];
      id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v43);
    }
  }
  if (v10)
  {
    if (*((void *)ptr + 9)) {
      v14 = -[ATXGamePlayKitRandomDistribution initWithRandomSource:lowestValue:highestValue:]([ATXGamePlayKitRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, [v11 integerValue] + objc_msgSend(*((id *)self->_node.__ptr_ + 9), "highestValue"));
    }
    else {
      v14 = -[ATXGamePlayKitRandomDistribution initWithRandomSource:lowestValue:highestValue:]([ATXGamePlayKitRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, [v11 integerValue]);
    }
    v23 = self->_node.__ptr_;
    v24 = (void *)*((void *)v23 + 9);
    *((void *)v23 + 9) = v14;

    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionNodeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v52);
    objc_storeStrong((id *)(v52 + 56), a3);
    objc_storeStrong((id *)self->_node.__ptr_ + 10, a4);
    v25 = (uint64_t *)self->_node.__ptr_;
    id v26 = v11;
    uint64_t v28 = v52;
    v27 = v53;
    if (v53) {
      atomic_fetch_add_explicit(&v53->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v48 = 0;
    id v50 = v26;
    *(void *)&long long v51 = v28;
    *((void *)&v51 + 1) = v27;
    long long v49 = 0uLL;
    std::vector<std::pair<objc_object * {__strong},std::shared_ptr<ATXGamePlayKitCDecisionNode>>>::push_back[abi:ne180100](v25, (long long *)&v50);
    if (*((void *)&v51 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v51 + 1));
    }

    v29 = [ATXGamePlayKitDecisionNode alloc];
    uint64_t v46 = v52;
    v47 = v53;
    if (v53) {
      atomic_fetch_add_explicit(&v53->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
    v31 = [(ATXGamePlayKitDecisionNode *)v29 initWithNode:&v46 tree:WeakRetained];

    if (v47) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v47);
    }
    v32 = v53;
    if (!v53) {
      goto LABEL_50;
    }
LABEL_49:
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    goto LABEL_50;
  }
  v16 = ptr;
  v15 = *(id **)ptr;
  if (*((id **)v16 + 1) == v15)
  {
    v19 = 0;
LABEL_34:
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionNodeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v50);
    v20 = (id *)v50;
    v33 = (std::__shared_weak_count *)v51;
    id v50 = 0;
    *(void *)&long long v51 = 0;
    if (v19)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      if ((void)v51) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v51);
      }
    }
    v19 = v33;
    goto LABEL_38;
  }
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  v19 = 0;
  v20 = 0;
  do
  {
    if ([v11 isEqual:v15[v17]])
    {
      uint64_t v21 = *(void *)self->_node.__ptr_ + v17 * 8;
      v20 = *(id **)(v21 + 8);
      v22 = *(std::__shared_weak_count **)(v21 + 16);
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      v19 = v22;
    }
    ++v18;
    v15 = *(id **)self->_node.__ptr_;
    v17 += 3;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)self->_node.__ptr_ + 1) - (void)v15) >> 3) > v18);
  id v10 = 0;
  if (!v20) {
    goto LABEL_34;
  }
LABEL_38:
  objc_storeStrong(v20 + 7, a3);
  v34 = (uint64_t *)self->_node.__ptr_;
  id v35 = v11;
  *(void *)&long long v49 = v20;
  *((void *)&v49 + 1) = v19;
  if (v19)
  {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    long long v36 = v49;
  }
  else
  {
    long long v36 = (unint64_t)v20;
  }
  uint64_t v48 = 0;
  id v50 = v35;
  long long v51 = v36;
  long long v49 = 0uLL;
  std::vector<std::pair<objc_object * {__strong},std::shared_ptr<ATXGamePlayKitCDecisionNode>>>::push_back[abi:ne180100](v34, (long long *)&v50);
  if (*((void *)&v51 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v51 + 1));
  }

  v37 = [ATXGamePlayKitDecisionNode alloc];
  v44 = v20;
  v45 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v38 = objc_loadWeakRetained((id *)&self->_tree);
  v31 = [(ATXGamePlayKitDecisionNode *)v37 initWithNode:&v44 tree:v38];

  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
  if (v19)
  {
    v32 = v19;
    goto LABEL_49;
  }
LABEL_50:

  return v31;
}

- (id)createBranchWithValue:(id)a3 attribute:(id)a4
{
  v4 = [(ATXGamePlayKitDecisionNode *)self createChildWithAttribute:a4 randomSource:0 withBranch:a3];
  return v4;
}

- (id)createBranchWithPredicate:(id)a3 attribute:(id)a4
{
  v4 = [(ATXGamePlayKitDecisionNode *)self createChildWithAttribute:a4 randomSource:0 withBranch:a3];
  return v4;
}

- (id)createBranchWithWeight:(int64_t)a3 attribute:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
  v8 = [WeakRetained randomSource];

  if (!v8)
  {
    id v9 = +[ATXGamePlayKitRandomSource sharedRandom];
    id v10 = objc_loadWeakRetained((id *)&self->_tree);
    [v10 setRandomSource:v9];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_tree);
  v12 = [v11 randomSource];
  uint64_t v13 = [NSNumber numberWithInteger:a3];
  v14 = [(ATXGamePlayKitDecisionNode *)self createChildWithAttribute:v6 randomSource:v12 withBranch:v13];

  return v14;
}

- (id)getNodeAtBranch:(id)a3
{
  id v4 = a3;
  ptr = self->_node.__ptr_;
  uint64_t v7 = *(void *)ptr;
  uint64_t v6 = *((void *)ptr + 1);
  while (1)
  {
    if (v7 == v6)
    {
      v8 = 0;
      goto LABEL_12;
    }
    if ([*(id *)v7 isEqual:v4]) {
      break;
    }
    v7 += 24;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v7 + 8) + 88));

  if (WeakRetained)
  {
    v8 = (ATXGamePlayKitDecisionNode *)objc_loadWeakRetained((id *)(*(void *)(v7 + 8) + 88));
  }
  else
  {
    id v10 = [ATXGamePlayKitDecisionNode alloc];
    id v11 = *(std::__shared_weak_count **)(v7 + 16);
    uint64_t v14 = *(void *)(v7 + 8);
    v15 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v12 = objc_loadWeakRetained((id *)&self->_tree);
    v8 = [(ATXGamePlayKitDecisionNode *)v10 initWithNode:&v14 tree:v12];

    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
LABEL_12:

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tree);
  cntrl = self->_node.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end