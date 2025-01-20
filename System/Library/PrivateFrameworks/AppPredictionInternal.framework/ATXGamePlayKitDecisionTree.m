@interface ATXGamePlayKitDecisionTree
+ (BOOL)supportsSecureCoding;
+ (void)configureKeyedArchiver:(id)a3;
+ (void)configureKeyedUnarchiver:(id)a3;
- (ATXGamePlayKitDecisionNode)rootNode;
- (ATXGamePlayKitDecisionTree)init;
- (ATXGamePlayKitDecisionTree)initWithAttribute:(id)a3;
- (ATXGamePlayKitDecisionTree)initWithCoder:(id)a3;
- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5;
- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7;
- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7 ratioForLeafNodeDecision:(double)a8;
- (ATXGamePlayKitDecisionTree)initWithURL:(id)a3 error:(id)a4;
- (ATXGamePlayKitRandomSource)randomSource;
- (BOOL)exportToURL:(id)a3 error:(id)a4;
- (id).cxx_construct;
- (id)description;
- (id)findAccuracyWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5;
- (id)findActionForAnswers:(id)a3;
- (id)getFlattenedTree;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setRandomSource:(id)a3;
- (void)setRootNode:(id)a3;
@end

@implementation ATXGamePlayKitDecisionTree

- (ATXGamePlayKitDecisionTree)init
{
  v15.receiver = self;
  v15.super_class = (Class)ATXGamePlayKitDecisionTree;
  v2 = [(ATXGamePlayKitDecisionTree *)&v15 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v14);
    long long v3 = v14;
    long long v14 = 0uLL;
    v4 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v14 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
      }
    }
    v5 = [ATXGamePlayKitDecisionNode alloc];
    v6 = (uint64_t *)*((void *)v2 + 1);
    uint64_t v8 = *v6;
    v7 = (std::__shared_weak_count *)v6[1];
    uint64_t v12 = v8;
    v13 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = [(ATXGamePlayKitDecisionNode *)v5 initWithNode:&v12 tree:v2];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    v2[24] = 0;
  }
  return (ATXGamePlayKitDecisionTree *)v2;
}

- (ATXGamePlayKitDecisionTree)initWithAttribute:(id)a3
{
  id v5 = a3;
  v6 = [(ATXGamePlayKitDecisionTree *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)v6->_decisionTree.__ptr_ + 56), a3);
    uint64_t v8 = [ATXGamePlayKitDecisionNode alloc];
    ptr = v7->_decisionTree.__ptr_;
    uint64_t v11 = *(void *)ptr;
    v10 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v14 = v11;
    objc_super v15 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = [(ATXGamePlayKitDecisionNode *)v8 initWithNode:&v14 tree:v7];
    -[ATXGamePlayKitDecisionTree setRootNode:](v7, "setRootNode:", v12, v14);

    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    v7->_isInduced = 0;
  }

  return v7;
}

+ (void)configureKeyedArchiver:(id)a3
{
  id v3 = a3;
  [v3 setClassName:@"GKDecisionTree" forClass:NSClassFromString(&cfstr_Atxgameplaykit_3.isa)];
  [v3 setClassName:@"GKRandomSource" forClass:NSClassFromString(&cfstr_Atxgameplaykit_4.isa)];
  [v3 setClassName:@"GKRandomDistribution" forClass:NSClassFromString(&cfstr_Atxgameplaykit_5.isa)];
  [v3 setClassName:@"GKARC4RandomSource" forClass:NSClassFromString(&cfstr_Atxgameplaykit_6.isa)];
  [v3 setClassName:@"GKSystemArc4RandomSource" forClass:NSClassFromString(&cfstr_Atxgameplaykit_7.isa)];
}

+ (void)configureKeyedUnarchiver:(id)a3
{
  id v3 = a3;
  [v3 setClass:NSClassFromString(&cfstr_Atxgameplaykit_3.isa) forClassName:@"GKDecisionTree"];
  [v3 setClass:NSClassFromString(&cfstr_Atxgameplaykit_4.isa) forClassName:@"GKRandomSource"];
  [v3 setClass:NSClassFromString(&cfstr_Atxgameplaykit_5.isa) forClassName:@"GKRandomDistribution"];
  [v3 setClass:NSClassFromString(&cfstr_Atxgameplaykit_6.isa) forClassName:@"GKARC4RandomSource"];
  [v3 setClass:NSClassFromString(&cfstr_Atxgameplaykit_7.isa) forClassName:@"GKSystemArc4RandomSource"];
}

- (ATXGamePlayKitDecisionTree)initWithCoder:(id)a3
{
  v33[15] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXGamePlayKitDecisionTree *)self init];
  if (v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v32);
    shared_ptr<ATXGamePlayKitCDecisionTree> v6 = v32;
    shared_ptr<ATXGamePlayKitCDecisionTree> v32 = (shared_ptr<ATXGamePlayKitCDecisionTree>)0;
    cntrl = (std::__shared_weak_count *)v5->_decisionTree.__cntrl_;
    v5->_decisionTree = v6;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      if (v32.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v32.__cntrl_);
      }
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rand"];
    [(ATXGamePlayKitDecisionTree *)v5 setRandomSource:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    v33[6] = objc_opt_class();
    v33[7] = objc_opt_class();
    v33[8] = objc_opt_class();
    v33[9] = objc_opt_class();
    v33[10] = objc_opt_class();
    v33[11] = objc_opt_class();
    v33[12] = objc_opt_class();
    v33[13] = objc_opt_class();
    v33[14] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:15];
    [v9 addObjectsFromArray:v10];

    uint64_t v11 = [v4 allowedClasses];
    [v9 unionSet:v11];

    id v31 = 0;
    uint64_t v12 = [v4 decodeTopLevelObjectOfClasses:v9 forKey:@"tree" error:&v31];
    id v13 = v31;
    NSLog(&cfstr_Atxgameplaykit_8.isa, v13);
    ATXGamePlayKitCDecisionTree::decode(v5->_decisionTree.__ptr_, v12);
    uint64_t v14 = [ATXGamePlayKitDecisionNode alloc];
    ptr = v5->_decisionTree.__ptr_;
    uint64_t v17 = *(void *)ptr;
    v16 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v29 = v17;
    v30 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v18 = [(ATXGamePlayKitDecisionNode *)v14 initWithNode:&v29 tree:v5];
    [(ATXGamePlayKitDecisionTree *)v5 setRootNode:v18];

    if (v30) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    }
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"induced"];
    int v20 = [v19 BOOLValue];
    v5->_isInduced = v20;
    if (v20)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1E958]);
      uint64_t v22 = (uint64_t)v5->_decisionTree.__ptr_;
      v27 = 0;
      v28 = 0;
      v23 = ATXGamePlayKitCDecisionTree::encodeWithCoder(v22, &v27, 0, 0, 0);
      uint64_t v24 = [v21 _initWithFlattenedTree:v23];
      mlkitDecisionTree = v5->mlkitDecisionTree;
      v5->mlkitDecisionTree = (MLGKDecisionTree *)v24;

      if (v28) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v28);
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXGamePlayKitDecisionTree *)self randomSource];
  [v4 encodeObject:v5 forKey:@"rand"];

  ptr = self->_decisionTree.__ptr_;
  id v9 = 0;
  v10 = 0;
  v7 = ATXGamePlayKitCDecisionTree::encodeWithCoder((uint64_t)ptr, &v9, 0, 0, 0);
  [v4 encodeObject:v7 forKey:@"tree"];

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  uint64_t v8 = [NSNumber numberWithBool:self->_isInduced];
  [v4 encodeObject:v8 forKey:@"induced"];
}

- (void)dealloc
{
  [(ATXGamePlayKitDecisionTree *)self setRootNode:0];
  v3.receiver = self;
  v3.super_class = (Class)ATXGamePlayKitDecisionTree;
  [(ATXGamePlayKitDecisionTree *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5
{
  return [(ATXGamePlayKitDecisionTree *)self initWithExamples:a3 actions:a4 attributes:a5 maxDepth:1000000000 minSamplesSplit:0];
}

- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7
{
  return [(ATXGamePlayKitDecisionTree *)self initWithExamples:a3 actions:a4 attributes:a5 maxDepth:a6 minSamplesSplit:a7 ratioForLeafNodeDecision:0.5];
}

- (ATXGamePlayKitDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7 ratioForLeafNodeDecision:(double)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v46 = a4;
  id v45 = a5;
  id v13 = [(ATXGamePlayKitDecisionTree *)self init];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_31;
  }
  ptr = v13->_decisionTree.__ptr_;
  if (!ptr || !*(void *)ptr) {
    goto LABEL_31;
  }
  uint64_t v16 = [v12 count];
  if (v16 == [v46 count])
  {
    uint64_t v17 = [v12 firstObject];
    uint64_t v18 = [v17 count];
    uint64_t v19 = [v45 count];

    if (v18 == v19)
    {
      int v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v21 = v46;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v22)
      {
        int v23 = 0;
        uint64_t v24 = *(void *)v52;
        do
        {
          uint64_t v25 = 0;
          uint64_t v26 = v23;
          do
          {
            if (*(void *)v52 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v27 = *(void *)(*((void *)&v51 + 1) + 8 * v25);
            v28 = [v12 objectAtIndexedSubscript:v26 + v25];
            uint64_t v29 = [v28 arrayByAddingObject:v27];
            [v20 addObject:v29];

            ++v25;
          }
          while (v22 != v25);
          uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v56 count:16];
          int v23 = v26 + v25;
        }
        while (v22);
      }

      if (a6) {
        unint64_t v30 = a6;
      }
      else {
        unint64_t v30 = 1000000000;
      }
      id v31 = v14->_decisionTree.__ptr_;
      shared_ptr<ATXGamePlayKitCDecisionTree> v32 = (std::__shared_weak_count *)*((void *)v31 + 1);
      uint64_t v49 = *(void *)v31;
      v50 = v32;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      ATXGamePlayKitCDecisionTree::cartTreeGrowth(v31, v20, v45, &v49, v30, a7, a8);
      if (v50) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v50);
      }
      if (!a7 && v30 == 1000000000)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F1E958]);
        uint64_t v34 = (uint64_t)v14->_decisionTree.__ptr_;
        v47 = 0;
        v48 = 0;
        v35 = ATXGamePlayKitCDecisionTree::encodeWithCoder(v34, &v47, 0, 0, 0);
        uint64_t v36 = [v33 _initWithFlattenedTree:v35];
        mlkitDecisionTree = v14->mlkitDecisionTree;
        v14->mlkitDecisionTree = (MLGKDecisionTree *)v36;

        if (v48) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v48);
        }
        v14->_isInduced = 1;
      }

      goto LABEL_31;
    }
    uint64_t v38 = [v45 count];
    v39 = [v12 firstObject];
    NSLog(&cfstr_Atxgameplaykit_10.isa, v38, [v39 count]);

    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v55);
  }
  else
  {
    NSLog(&cfstr_Atxgameplaykit_9.isa, [v46 count], objc_msgSend(v12, "count"));
    _ZNSt3__115allocate_sharedB8ne180100I27ATXGamePlayKitCDecisionTreeNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v55);
  }
  shared_ptr<ATXGamePlayKitCDecisionTree> v40 = v55;
  shared_ptr<ATXGamePlayKitCDecisionTree> v55 = (shared_ptr<ATXGamePlayKitCDecisionTree>)0;
  cntrl = (std::__shared_weak_count *)v14->_decisionTree.__cntrl_;
  v14->_decisionTree = v40;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    if (v55.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v55.__cntrl_);
    }
  }
LABEL_31:

  return v14;
}

- (ATXGamePlayKitDecisionTree)initWithURL:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
  id v19 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6 options:2 error:&v19];
  id v10 = v19;

  id v18 = v10;
  uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v18];
  id v12 = v18;

  if (v12 || !v9)
  {
    id v13 = objc_alloc_init(ATXGamePlayKitDecisionTree);

    v13->_isInduced = 1;
    uint64_t v14 = (MLGKDecisionTree *)objc_alloc_init(MEMORY[0x1E4F1E958]);
    mlkitDecisionTree = v13->mlkitDecisionTree;
    v13->mlkitDecisionTree = v14;

    [(MLGKDecisionTree *)v13->mlkitDecisionTree _loadModelAssetWithModelAtPath:v6 withError:v12];
  }
  else
  {
    id v13 = v11;
  }
  uint64_t v16 = v13;

  return v16;
}

- (BOOL)exportToURL:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
  if (self->_isInduced)
  {
    char v9 = [(MLGKDecisionTree *)self->mlkitDecisionTree _saveModelAssetWithModelToPath:v6 withError:v7];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    id v13 = v7;
    char v9 = [v10 writeToURL:v6 options:1 error:&v13];
    id v11 = v13;

    id v7 = v11;
  }

  return v9;
}

- (id)getFlattenedTree
{
  ptr = self->_decisionTree.__ptr_;
  id v5 = 0;
  id v6 = 0;
  objc_super v3 = ATXGamePlayKitCDecisionTree::encodeWithCoder((uint64_t)ptr, &v5, 0, 0, 0);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v3;
}

- (id)findActionForAnswers:(id)a3
{
  id v4 = a3;
  if (self->_isInduced)
  {
    id v5 = objc_opt_new();
    id v6 = [(MLGKDecisionTree *)self->mlkitDecisionTree _makeInferenceFromAnswers:v4 withError:v5];
  }
  else
  {
    id v6 = ATXGamePlayKitCDecisionTree::findActionForAnswers(self->_decisionTree.__ptr_, v4);
  }

  return v6;
}

- (id)findAccuracyWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v29 = a4;
  id v30 = a5;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v33 = 0;
    uint64_t v9 = 0;
    uint64_t v28 = *(void *)v39;
    do
    {
      uint64_t v10 = 0;
      uint64_t v31 = v8;
      do
      {
        uint64_t v32 = v9;
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v13 = v30;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = 0;
          uint64_t v16 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              id v19 = [v11 objectAtIndexedSubscript:v15 + i];
              [v12 setObject:v19 forKey:v18];
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
            v15 += i;
          }
          while (v14);
        }

        int v20 = [(ATXGamePlayKitDecisionTree *)self findActionForAnswers:v12];
        id v21 = [v29 objectAtIndexedSubscript:v33];
        unsigned int v22 = [v21 isEqual:v20];

        uint64_t v9 = v32 + v22;
        ++v33;
        ++v10;
      }
      while (v10 != v31);
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
    double v23 = (double)v9;
  }
  else
  {
    double v23 = 0.0;
  }

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithDouble:", v23 / ((double)(unint64_t)objc_msgSend(obj, "count") + 0.000001));

  return v24;
}

- (id)description
{
  ptr = self->_decisionTree.__ptr_;
  if (ptr && *(void *)ptr)
  {
    objc_super v3 = (std::__shared_weak_count *)*((void *)ptr + 1);
    id v6 = *(void **)ptr;
    id v7 = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ATXGamePlayKitCDecisionTree::printTree((uint64_t)ptr, &v6, @"\t", @"-");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  else
  {
    id v4 = &stru_1F2740B58;
  }
  return v4;
}

- (ATXGamePlayKitDecisionNode)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
}

- (ATXGamePlayKitRandomSource)randomSource
{
  return self->_randomSource;
}

- (void)setRandomSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomSource, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->mlkitDecisionTree, 0);
  cntrl = self->_decisionTree.__cntrl_;
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