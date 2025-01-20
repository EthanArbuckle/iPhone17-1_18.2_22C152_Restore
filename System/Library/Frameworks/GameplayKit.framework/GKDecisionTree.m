@interface GKDecisionTree
+ (BOOL)supportsSecureCoding;
- (BOOL)exportToURL:(NSURL *)url error:(NSError *)error;
- (GKDecisionNode)rootNode;
- (GKDecisionTree)init;
- (GKDecisionTree)initWithAttribute:(id)attribute;
- (GKDecisionTree)initWithCoder:(id)a3;
- (GKDecisionTree)initWithExamples:(NSArray *)examples actions:(NSArray *)actions attributes:(NSArray *)attributes;
- (GKDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7;
- (GKDecisionTree)initWithURL:(NSURL *)url error:(NSError *)error;
- (GKRandomSource)randomSource;
- (id)description;
- (id)findAccuracyWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5;
- (id)findActionForAnswers:(NSDictionary *)answers;
- (id)getFlattenedTree;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setRandomSource:(GKRandomSource *)randomSource;
- (void)setRootNode:(id)a3;
@end

@implementation GKDecisionTree

- (GKDecisionTree)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKDecisionTree;
  if ([(GKDecisionTree *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (GKDecisionTree)initWithAttribute:(id)attribute
{
  id v5 = attribute;
  v6 = [(GKDecisionTree *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)v6->_decisionTree->var0 + 6, attribute);
    v8 = [[GKDecisionNode alloc] initWithNode:v7->_decisionTree->var0 tree:v7];
    [(GKDecisionTree *)v7 setRootNode:v8];

    v7->_isInduced = 0;
  }

  return v7;
}

- (GKDecisionTree)initWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(GKDecisionTree *)self init]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(GKDecisionTree *)self randomSource];
  [v7 encodeObject:v4 forKey:@"rand"];

  id v5 = GKCDecisionTree::encodeWithCoder(self->_decisionTree, 0, 0, 0, 0);
  [v7 encodeObject:v5 forKey:@"tree"];

  uint64_t v6 = [NSNumber numberWithBool:self->_isInduced];
  [v7 encodeObject:v6 forKey:@"induced"];
}

- (void)dealloc
{
  [(GKDecisionTree *)self setRootNode:0];
  decisionTree = self->_decisionTree;
  if (decisionTree)
  {
    if (decisionTree->var0)
    {
      GKCDecisionNode::~GKCDecisionNode(decisionTree->var0);
      MEMORY[0x237DF7CA0]();
    }
    decisionTree->var0 = 0;
    decisionTree->var1 = 0;
    MEMORY[0x237DF7CA0](decisionTree, 0x20C40A4A59CD2);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKDecisionTree;
  [(GKDecisionTree *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKDecisionTree)initWithExamples:(NSArray *)examples actions:(NSArray *)actions attributes:(NSArray *)attributes
{
  return [(GKDecisionTree *)self initWithExamples:examples actions:actions attributes:attributes maxDepth:1000000000 minSamplesSplit:0];
}

- (GKDecisionTree)initWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5 maxDepth:(unint64_t)a6 minSamplesSplit:(unint64_t)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v39 = a4;
  v38 = (NSArray *)a5;
  v11 = [(GKDecisionTree *)self init];
  v12 = v11;
  if (v11)
  {
    decisionTree = v11->_decisionTree;
    if (decisionTree)
    {
      if (decisionTree->var0)
      {
        uint64_t v14 = [v10 count];
        if (v14 != [v39 count])
        {
          NSLog(&cfstr_Gkdecisiontree_4.isa, [v39 count], objc_msgSend(v10, "count"));
          operator new();
        }
        v15 = [v10 firstObject];
        uint64_t v16 = [v15 count];
        uint64_t v17 = [(NSArray *)v38 count];

        if (v16 != v17)
        {
          uint64_t v33 = [(NSArray *)v38 count];
          v34 = [v10 firstObject];
          NSLog(&cfstr_Gkdecisiontree_5.isa, v33, [v34 count]);

          operator new();
        }
        v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v19 = v39;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v20)
        {
          int v21 = 0;
          uint64_t v22 = *(void *)v41;
          do
          {
            uint64_t v23 = 0;
            uint64_t v24 = v21;
            do
            {
              if (*(void *)v41 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * v23);
              v26 = [v10 objectAtIndexedSubscript:v24 + v23];
              v27 = [v26 arrayByAddingObject:v25];
              [(NSArray *)v18 addObject:v27];

              ++v23;
            }
            while (v20 != v23);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
            int v21 = v24 + v23;
          }
          while (v20);
        }

        if (a6) {
          unint64_t v28 = a6;
        }
        else {
          unint64_t v28 = 1000000000;
        }
        GKCDecisionTree::cartTreeGrowth(v12->_decisionTree, v18, v38, v12->_decisionTree->var0, v28, a7);
        if (!a7 && v28 == 1000000000)
        {
          id v29 = objc_alloc(MEMORY[0x263F00D60]);
          v30 = GKCDecisionTree::encodeWithCoder(v12->_decisionTree, 0, 0, 0, 0);
          uint64_t v31 = [v29 _initWithFlattenedTree:v30];
          mlkitDecisionTree = v12->mlkitDecisionTree;
          v12->mlkitDecisionTree = (MLGKDecisionTree *)v31;

          v12->_isInduced = 1;
        }
      }
    }
  }

  return v12;
}

- (GKDecisionTree)initWithURL:(NSURL *)url error:(NSError *)error
{
  uint64_t v6 = url;
  id v7 = error;
  v18 = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v6 options:2 error:&v18];
  v9 = v18;

  uint64_t v17 = v9;
  id v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v17];
  v11 = v17;

  if (v11 || !v8)
  {
    v12 = objc_alloc_init(GKDecisionTree);

    v12->_isInduced = 1;
    v13 = (MLGKDecisionTree *)objc_alloc_init(MEMORY[0x263F00D60]);
    mlkitDecisionTree = v12->mlkitDecisionTree;
    v12->mlkitDecisionTree = v13;

    [(MLGKDecisionTree *)v12->mlkitDecisionTree _loadModelAssetWithModelAtPath:v6 withError:v11];
  }
  else
  {
    v12 = v10;
  }
  v15 = v12;

  return v15;
}

- (BOOL)exportToURL:(NSURL *)url error:(NSError *)error
{
  uint64_t v6 = url;
  id v7 = error;
  if (self->_isInduced)
  {
    char v8 = [(MLGKDecisionTree *)self->mlkitDecisionTree _saveModelAssetWithModelToPath:v6 withError:v7];
  }
  else
  {
    v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    v12 = v7;
    char v8 = [v9 writeToURL:v6 options:1 error:&v12];
    id v10 = v12;

    id v7 = v10;
  }

  return v8;
}

- (id)getFlattenedTree
{
  return GKCDecisionTree::encodeWithCoder(self->_decisionTree, 0, 0, 0, 0);
}

- (id)findActionForAnswers:(NSDictionary *)answers
{
  objc_super v4 = answers;
  if (self->_isInduced) {
    [(MLGKDecisionTree *)self->mlkitDecisionTree _makeInferenceFromAnswers:v4 withError:0];
  }
  else {
  id v5 = GKCDecisionTree::findActionForAnswers((uint64_t **)self->_decisionTree, v4);
  }

  return v5;
}

- (id)findAccuracyWithExamples:(id)a3 actions:(id)a4 attributes:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v28 = a4;
  id v29 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v32 = 0;
    unint64_t v9 = 0;
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v10 = 0;
      uint64_t v30 = v8;
      do
      {
        unint64_t v31 = v9;
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = v29;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v14)
        {
          uint64_t v15 = 0;
          uint64_t v16 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v34 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              id v19 = [v11 objectAtIndexedSubscript:v15 + i];
              [v12 setObject:v19 forKey:v18];
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
            v15 += i;
          }
          while (v14);
        }

        uint64_t v20 = [(GKDecisionTree *)self findActionForAnswers:v12];
        int v21 = [v28 objectAtIndexedSubscript:v32];
        unsigned int v22 = [v21 isEqual:v20];

        unint64_t v9 = v31 + v22;
        ++v32;
        ++v10;
      }
      while (v10 != v30);
      uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9 / objc_msgSend(obj, "count"));

  return v23;
}

- (id)description
{
  decisionTree = self->_decisionTree;
  if (decisionTree && decisionTree->var0)
  {
    GKCDecisionTree::printTree(decisionTree, decisionTree->var0, &stru_26E943AD0.isa, &stru_26E943AB0.isa);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = &stru_26E943AF0;
  }
  return v3;
}

- (GKDecisionNode)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
}

- (GKRandomSource)randomSource
{
  return self->_randomSource;
}

- (void)setRandomSource:(GKRandomSource *)randomSource
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomSource, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);

  objc_storeStrong((id *)&self->mlkitDecisionTree, 0);
}

@end