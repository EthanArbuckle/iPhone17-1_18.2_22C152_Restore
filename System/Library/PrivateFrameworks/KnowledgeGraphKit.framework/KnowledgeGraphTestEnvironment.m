@interface KnowledgeGraphTestEnvironment
+ (NSArray)matisseGraphs;
+ (NSArray)testEnvironmentsForExistingStores;
+ (NSArray)testEnvironmentsForOnDiskExistingStores;
+ (id)environmentWithTestDBWithStoreType:(Class)a3 extraOptions:(unint64_t)a4;
+ (id)temporaryURLWithFileExtension:(id)a3;
- (BOOL)deleteEdge:(id)a3;
- (BOOL)deleteNode:(id)a3;
- (KGStoredGraph)graph;
- (KnowledgeGraphTestEnvironment)initWithKGGraph:(id)a3;
- (id)addEdgeWithLabels:(id)a3 properties:(id)a4 sourceNode:(id)a5 targetNode:(id)a6;
- (id)addNodeWithLabels:(id)a3 properties:(id)a4;
- (id)placeholderEdgeWithLabels:(id)a3 properties:(id)a4 sourceNode:(id)a5 targetNode:(id)a6;
- (id)placeholderNodeWithLabels:(id)a3 properties:(id)a4;
- (id)refetchEdge:(id)a3;
- (id)refetchNode:(id)a3;
- (unint64_t)edgeCount;
- (unint64_t)nodeCount;
- (void)beginTransaction;
- (void)closeAndDeleteEnvironment;
- (void)commitTransaction;
- (void)populateGraph;
@end

@implementation KnowledgeGraphTestEnvironment

- (void).cxx_destruct
{
}

- (KGStoredGraph)graph
{
  return self->_graph;
}

- (unint64_t)edgeCount
{
  graph = self->_graph;
  v3 = +[KGElementFilter any];
  v4 = [(KGGraph *)graph edgeIdentifiersMatchingFilter:v3];
  unint64_t v5 = [v4 count];

  return v5;
}

- (unint64_t)nodeCount
{
  graph = self->_graph;
  v3 = +[KGElementFilter any];
  v4 = [(KGGraph *)graph nodeIdentifiersMatchingFilter:v3];
  unint64_t v5 = [v4 count];

  return v5;
}

- (void)populateGraph
{
  [(KnowledgeGraphTestEnvironment *)self beginTransaction];
  id v25 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F688 properties:&unk_1F280F908];
  v3 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F6A0 properties:&unk_1F280F930];
  v4 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F6B8 properties:&unk_1F280F958];
  unint64_t v5 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F6D0 properties:&unk_1F280F980];
  v24 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F6E8 properties:&unk_1F280F9A8];
  uint64_t v6 = MEMORY[0x1E4F1CC08];
  v7 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F700 properties:MEMORY[0x1E4F1CC08]];
  v23 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F718 properties:v6];
  v22 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F730 properties:v6];
  id v8 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F748 properties:v6];
  v9 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F760 properties:&unk_1F280F9D0];
  v10 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F778 properties:&unk_1F280F9F8];
  v11 = [(KnowledgeGraphTestEnvironment *)self addNodeWithLabels:&unk_1F280F790 properties:&unk_1F280FA20];
  id v12 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F7A8 properties:v6 sourceNode:v25 targetNode:v3];
  id v13 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F7C0 properties:v6 sourceNode:v25 targetNode:v4];
  id v14 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F7D8 properties:v6 sourceNode:v5 targetNode:v22];
  id v15 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F7F0 properties:v6 sourceNode:v25 targetNode:v7];
  id v16 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F808 properties:v6 sourceNode:v3 targetNode:v7];
  id v17 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F820 properties:v6 sourceNode:v4 targetNode:v23];
  id v18 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F838 properties:v6 sourceNode:v24 targetNode:v5];
  id v19 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F850 properties:&unk_1F280FA48 sourceNode:v24 targetNode:v3];
  id v20 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F868 properties:&unk_1F280FA70 sourceNode:v9 targetNode:v25];
  id v21 = [(KnowledgeGraphTestEnvironment *)self addEdgeWithLabels:&unk_1F280F880 properties:&unk_1F280FA98 sourceNode:v10 targetNode:v11];
  [(KnowledgeGraphTestEnvironment *)self commitTransaction];
}

- (BOOL)deleteEdge:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v5 removeEdge:v4];

  LOBYTE(self) = [(KGMutableGraph *)self->_graph performChangesAndWait:v5 error:0];
  return (char)self;
}

- (BOOL)deleteNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v5 removeNode:v4];

  LOBYTE(self) = [(KGMutableGraph *)self->_graph performChangesAndWait:v5 error:0];
  return (char)self;
}

- (id)refetchEdge:(id)a3
{
  graph = self->_graph;
  uint64_t v4 = [a3 identifier];
  return [(KGGraph *)graph edgeForIdentifier:v4];
}

- (id)refetchNode:(id)a3
{
  graph = self->_graph;
  uint64_t v4 = [a3 identifier];
  return [(KGGraph *)graph nodeForIdentifier:v4];
}

- (id)addEdgeWithLabels:(id)a3 properties:(id)a4 sourceNode:(id)a5 targetNode:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(KGGraphChangeRequest);
  id v15 = [(KnowledgeGraphTestEnvironment *)self placeholderEdgeWithLabels:v13 properties:v12 sourceNode:v11 targetNode:v10];

  [(KGGraphChangeRequest *)v14 insertEdge:v15];
  [(KGMutableGraph *)self->_graph performChangesAndWait:v14 error:0];

  return v15;
}

- (id)addNodeWithLabels:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(KGGraphChangeRequest);
  v9 = [(KnowledgeGraphTestEnvironment *)self placeholderNodeWithLabels:v7 properties:v6];

  [(KGGraphChangeRequest *)v8 insertNode:v9];
  [(KGMutableGraph *)self->_graph performChangesAndWait:v8 error:0];

  return v9;
}

- (id)placeholderEdgeWithLabels:(id)a3 properties:(id)a4 sourceNode:(id)a5 targetNode:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[KGPropertyValue kgPropertiesWithMAProperties:a4];
  id v14 = [(KGGraph *)self->_graph entityFactory];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];

  id v16 = [v14 edgeWithIdentifier:0 labels:v15 properties:v13 sourceNode:v11 targetNode:v10];

  return v16;
}

- (id)placeholderNodeWithLabels:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = +[KGPropertyValue kgPropertiesWithMAProperties:a4];
  id v8 = [(KGGraph *)self->_graph entityFactory];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];

  id v10 = [v8 nodeWithIdentifier:0 labels:v9 properties:v7];

  return v10;
}

- (void)commitTransaction
{
  id v2 = [(KGStoredGraph *)self->_graph store];
  [v2 commitTransactionWithError:0];
}

- (void)beginTransaction
{
  id v2 = [(KGStoredGraph *)self->_graph store];
  [v2 beginTransactionWithError:0];
}

- (void)closeAndDeleteEnvironment
{
  graph = self->_graph;
  if (graph)
  {
    uint64_t v4 = [(KGStoredGraph *)graph store];
    [v4 close];

    unint64_t v5 = [(KGStoredGraph *)self->_graph store];
    id v6 = objc_opt_class();
    id v7 = [(KGStoredGraph *)self->_graph store];
    id v8 = [v7 url];
    [v6 destroyAtURL:v8 error:0];

    v9 = self->_graph;
    self->_graph = 0;
  }
}

- (KnowledgeGraphTestEnvironment)initWithKGGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KnowledgeGraphTestEnvironment;
  id v6 = [(KnowledgeGraphTestEnvironment *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

+ (NSArray)testEnvironmentsForOnDiskExistingStores
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 testEnvironmentsForExistingStores];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "graph", (void)v14);
        id v11 = [v10 store];
        id v12 = [(id)objc_opt_class() persistentStoreFileExtension];

        if (v12) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (NSArray)testEnvironmentsForExistingStores
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = +[KnowledgeGraphTestEnvironment environmentWithTestDBWithStoreType:objc_opt_class() extraOptions:0];
  v3 = +[KnowledgeGraphTestEnvironment environmentWithTestDBWithStoreType:extraOptions:](KnowledgeGraphTestEnvironment, "environmentWithTestDBWithStoreType:extraOptions:", objc_opt_class(), 0, v2);
  v7[1] = v3;
  id v4 = +[KnowledgeGraphTestEnvironment environmentWithTestDBWithStoreType:objc_opt_class() extraOptions:0];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (NSArray)matisseGraphs
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [MAKGTestGraph alloc];
  id v4 = [a1 temporaryURLWithFileExtension:@"kgdb"];
  uint64_t v5 = [(MAGraph *)v3 initWithPersistentStoreURL:v4 options:0 error:0];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

+ (id)environmentWithTestDBWithStoreType:(Class)a3 extraOptions:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3)
  {
    id v9 = objc_alloc_init(a3);
  }
  else
  {
    uint64_t v7 = [(objc_class *)a3 persistentStoreFileExtension];
    id v8 = [a1 temporaryURLWithFileExtension:v7];

    id v9 = (id)[[a3 alloc] initWithURL:v8];
  }
  id v16 = 0;
  char v10 = [v9 openWithMode:a4 | 6 error:&v16];
  id v11 = v16;
  if (v10)
  {
    id v12 = objc_alloc_init(KGLabelBasedEntityFactory);
    id v13 = [[KGStoredGraph alloc] initGraphWithStore:v9 entityFactory:v12];
    long long v14 = (void *)[objc_alloc((Class)a1) initWithKGGraph:v13];
  }
  else
  {
    KGLoggingConnection();
    id v12 = (KGLabelBasedEntityFactory *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_error_impl(&dword_1D1654000, &v12->super, OS_LOG_TYPE_ERROR, "Error opening store %@", buf, 0xCu);
    }
    long long v14 = 0;
  }

  return v14;
}

+ (id)temporaryURLWithFileExtension:(id)a3
{
  v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = [v4 UUID];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"%@.%@", v7, v5];

  id v9 = NSTemporaryDirectory();
  char v10 = [v9 stringByAppendingString:v8];

  id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];

  return v11;
}

@end