@interface MAGraph
+ (BOOL)copyPersistentStoreFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)destroyPersistentStoreAtURL:(id)a3 error:(id *)a4;
+ (BOOL)migratePersistentStoreFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)populateGraph:(id)a3 withDefinitions:(id)a4 constraints:(id)a5 error:(id *)a6;
+ (BOOL)scanGraphElementOptionsString:(id)a3 minimum:(unint64_t *)a4 maximum:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)scanGraphElementString:(id)a3 type:(unint64_t *)a4 optionalName:(id *)a5 label:(id *)a6 optionalDomains:(id *)a7 optionalProperties:(id *)a8 error:(id *)a9;
+ (BOOL)scanMatchString:(id)a3 definitions:(id *)a4 constraints:(id *)a5 forCreation:(BOOL)a6 error:(id *)a7;
+ (MAGraph)graphWithDefinitions:(id)a3 constraints:(id)a4 error:(id *)a5;
+ (MAGraph)graphWithMergedGraphs:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5;
+ (MAGraph)graphWithVisualString:(id)a3 error:(id *)a4;
+ (id)defaultSpecification;
+ (id)graph;
+ (id)graphJSONURLWithPath:(id)a3 andName:(id)a4;
+ (id)graphMLURLWithPath:(id)a3 andName:(id)a4;
+ (id)persistentStoreFileExtension;
+ (id)persistentStoreURLWithPath:(id)a3 andName:(id)a4;
+ (id)scanGraphConstraintString:(id)a3 error:(id *)a4;
+ (id)visualStringWithFormat:(id)a3 elements:(id)a4;
+ (void)initialize;
- (BOOL)_matchNode:(id)a3 usingAbstractNode:(id)a4 fromEdge:(id)a5 atIteration:(unint64_t)a6 withDefinitions:(id)a7 constraints:(id)a8 unusedConstraints:(id)a9 andSubGraph:(id)a10 matchingNodeQueue:(id)a11;
- (BOOL)_shouldFail;
- (BOOL)compareWithPersistedState;
- (BOOL)conformsToGraphSchema:(id)a3;
- (BOOL)copyPersistentStoreToURL:(id)a3 error:(id *)a4;
- (BOOL)edgesStoreWeakReferencesToNodes;
- (BOOL)findAndResolveUniqueEdge:(id)a3;
- (BOOL)findAndResolveUniqueNode:(id)a3;
- (BOOL)hasPendingRead;
- (BOOL)hasPendingWrite;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)migratePersistentStoreToURL:(id)a3 error:(id *)a4;
- (BOOL)noFatalError;
- (BOOL)savePersistentStore;
- (BOOL)updateGraphWithVisualString:(id)a3;
- (BOOL)usesClassADataProtection;
- (BOOL)usesClassBDataProtection;
- (BOOL)usesClassCDataProtection;
- (BOOL)writeDataToURL:(id)a3 error:(id *)a4;
- (BOOL)writeGraphJSONToURL:(id)a3 error:(id *)a4;
- (Class)nodeClass;
- (KGStoredGraph)graph;
- (MAGraph)init;
- (MAGraph)initWithDataURL:(id)a3 error:(id *)a4;
- (MAGraph)initWithGraphJSONURL:(id)a3 error:(id *)a4;
- (MAGraph)initWithGraphMLURL:(id)a3 error:(id *)a4;
- (MAGraph)initWithPersistenceOptions:(int64_t)a3;
- (MAGraph)initWithPersistentStoreURL:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (MAGraph)initWithSpecification:(id)a3;
- (MAGraph)initWithSpecification:(id)a3 dataURL:(id)a4 error:(id *)a5;
- (MAGraph)initWithSpecification:(id)a3 persistenceStoreURL:(id)a4 error:(id *)a5;
- (MAGraph)initWithSpecification:(id)a3 persistenceStoreURL:(id)a4 progressReporter:(id)a5;
- (MAGraphReference)graphReference;
- (MAGraphSpecification)specification;
- (NSUUID)identifier;
- (id)_addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (id)_addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (id)_anyEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (id)_constraintAbstractEdgesFromAbstractNode:(id)a3 inConstraints:(id *)a4;
- (id)_edgeIdentifiersWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)_graphDictionary;
- (id)_graphJSONDictionary;
- (id)_instantiateGraphWithStoreAtURL:(id)a3 error:(id *)a4;
- (id)_nodeIdentifiersWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)abstractEdges;
- (id)addEdgeFromBase:(id)a3 sourceNode:(id)a4 targetNode:(id)a5;
- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5;
- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (id)addNodeFromBase:(id)a3;
- (id)addNodeWithLabel:(id)a3;
- (id)addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (id)addUniqueNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6 didCreate:(BOOL *)a7;
- (id)addUniquelyIdentifiedNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6 didCreate:(BOOL *)a7;
- (id)adjacencyWithEndNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeType:(unint64_t)a5;
- (id)adjacencyWithSources:(id)a3 relation:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeType:(unint64_t)a5;
- (id)allEdges;
- (id)allNodes;
- (id)anyEdgeMatchingFilter:(id)a3;
- (id)anyNodeForLabel:(id)a3;
- (id)anyNodeForLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)anyNodeForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)anyNodeMatchingFilter:(id)a3;
- (id)databaseURL;
- (id)description;
- (id)edgeForIdentifier:(unint64_t)a3;
- (id)edgeFromFetchedRowWithIdentifier:(int)a3 domain:(signed __int16)a4 label:(id)a5 weight:(float)a6 properties:(id)a7 sourceNodeIdentifier:(int)a8 targetNodeIdentifier:(int)a9;
- (id)edgeIdentifiersMatchingFilter:(id)a3;
- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4;
- (id)edgeIdentifiersOfType:(unint64_t)a3 betweenNodesForIdentifiers:(id)a4 andNodesForIdentifiers:(id)a5 matchingFilter:(id)a6;
- (id)edgeIdentifiersOfType:(unint64_t)a3 onNodesForIdentifiers:(id)a4 matchingFilter:(id)a5;
- (id)edgeIdentifiersOfType:(unint64_t)a3 sourceNodeIdentifier:(unint64_t)a4 targetNodeIdentifier:(unint64_t)a5;
- (id)edgeSchemeWithLabel:(id)a3 domain:(unsigned __int16)a4 sourceNode:(id)a5 targetNode:(id)a6;
- (id)edgesDomains;
- (id)edgesForIdentifiers:(id)a3;
- (id)edgesForLabel:(id)a3;
- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)edgesLabels;
- (id)graphNode;
- (id)labelsForLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)matchWithDefinitions:(id)a3 constraints:(id)a4 error:(id *)a5;
- (id)matchWithVisualFormat:(id)a3 elements:(id)a4 error:(id *)a5;
- (id)matchWithVisualString:(id)a3 error:(id *)a4;
- (id)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5;
- (id)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 saveToDatabase:(BOOL)a6;
- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeType:(unint64_t)a4 edgeFilter:(id)a5;
- (id)nodeForIdentifier:(unint64_t)a3;
- (id)nodeFromFetchedRowWithIdentifier:(int)a3 domain:(signed __int16)a4 label:(id)a5 weight:(float)a6 properties:(id)a7;
- (id)nodeIdentifiersMatchingFilter:(id)a3;
- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4;
- (id)nodeIdentifiersOfEdgeIdentifiers:(id)a3 ofType:(unint64_t)a4;
- (id)nodeIdentifiersRelatedToSourceNodeIdentifiers:(id)a3 relation:(id)a4;
- (id)nodeSchemeWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)nodesDomains;
- (id)nodesForDomain:(unsigned __int16)a3;
- (id)nodesForDomain:(unsigned __int16)a3 properties:(id)a4;
- (id)nodesForIdentifiers:(id)a3;
- (id)nodesForLabel:(id)a3;
- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)nodesLabels;
- (id)orphanNodes;
- (id)schema:(id)a3;
- (id)selectBestRootNodeForPath:(id)a3 withDefinitions:(id)a4;
- (id)shortestPathFromNode:(id)a3 toNode:(id)a4 directed:(BOOL)a5;
- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3;
- (id)targetsBySourceWithEdgeIdentifiers:(id)a3;
- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeType:(unint64_t)a4 edgeFilter:(id)a5;
- (unint64_t)databaseStatus;
- (unint64_t)edgesCount;
- (unint64_t)edgesCountForLabel:(id)a3;
- (unint64_t)edgesCountForLabel:(id)a3 domain:(unsigned __int16)a4;
- (unint64_t)edgesCountForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (unint64_t)hash;
- (unint64_t)nodesCount;
- (unint64_t)nodesCountForDomain:(unsigned __int16)a3;
- (unint64_t)nodesCountForLabel:(id)a3;
- (unint64_t)nodesCountForLabel:(id)a3 domain:(unsigned __int16)a4;
- (unint64_t)nodesCountForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (unint64_t)numberOfEdgesMatchingFilter:(id)a3;
- (unint64_t)numberOfNodesMatchingFilter:(id)a3;
- (unint64_t)version;
- (void)_loadWithGraphDictionary:(id)a3;
- (void)addUniqueNode:(id)a3 didInsert:(BOOL *)a4;
- (void)breadthFirstSearchFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5;
- (void)closePersistentStore;
- (void)dealloc;
- (void)depthFirstSearchFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5;
- (void)enterBatch;
- (void)enumerateDoublePropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateDoublePropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateEdgesInDomain:(unsigned __int16)a3 usingBlock:(id)a4;
- (void)enumerateEdgesMatchingFilter:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesWithBlock:(id)a3;
- (void)enumerateEdgesWithIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 usingBlock:(id)a6;
- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateIntegerPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateIntegerPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateNodeIdentifiers:(id)a3 sortedByDoublePropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateNodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateNodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateNodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateNodesInDomain:(unsigned __int16)a3 usingBlock:(id)a4;
- (void)enumerateNodesMatchingFilter:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesWithBlock:(id)a3;
- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 usingBlock:(id)a5;
- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 usingBlock:(id)a5;
- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 usingBlock:(id)a5;
- (void)enumerateNodesWithIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 usingBlock:(id)a6;
- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumeratePropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumeratePropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateStringPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateStringPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5;
- (void)executeGraphChangeRequest:(id)a3;
- (void)labelAndDomainFromLabels:(id)a3 outLabel:(id *)a4 outDomain:(unsigned __int16 *)a5;
- (void)labelsAndDomainsOfEdgesForIdentifiers:(id)a3 labels:(id *)a4 domains:(id *)a5;
- (void)labelsAndDomainsOfNodesForIdentifiers:(id)a3 labels:(id *)a4 domains:(id *)a5;
- (void)leaveBatch;
- (void)legacyRemoveEdges:(id)a3;
- (void)legacyRemoveNodes:(id)a3;
- (void)loadDomains:(id)a3;
- (void)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 createdNodes:(id *)a6 createdEdges:(id *)a7;
- (void)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 saveToDatabase:(BOOL)a6 createdNodes:(id *)a7 createdEdges:(id *)a8;
- (void)persistModelProperties:(id)a3 forEdgeWithIdentifier:(unint64_t)a4 clobberExisting:(BOOL)a5;
- (void)persistModelProperties:(id)a3 forNodeWithIdentifier:(unint64_t)a4 clobberExisting:(BOOL)a5;
- (void)persistModelProperty:(id)a3 forKey:(id)a4 forEdgeWithIdentifier:(unint64_t)a5;
- (void)persistModelProperty:(id)a3 forKey:(id)a4 forNodeWithIdentifier:(unint64_t)a5;
- (void)persistWeight:(float)a3 forEdgeWithIdentifier:(unint64_t)a4;
- (void)persistWeight:(float)a3 forNodeWithIdentifier:(unint64_t)a4;
- (void)readUsingBlock:(id)a3;
- (void)removeModelPropertiesForEdgeWithIdentifier:(unint64_t)a3;
- (void)removeModelPropertiesForNodeWithIdentifier:(unint64_t)a3;
- (void)removeModelPropertyForKey:(id)a3 forEdgeWithIdentifier:(unint64_t)a4;
- (void)removeModelPropertyForKey:(id)a3 forNodeWithIdentifier:(unint64_t)a4;
- (void)rollbackBatch;
- (void)setHadFatalError;
- (void)setVersion:(unint64_t)a3;
- (void)unloadDomains:(id)a3;
- (void)unloadEdge:(id)a3;
- (void)waitUntilQuiescentUsingBlock:(id)a3;
- (void)writeUsingBlock:(id)a3;
@end

@implementation MAGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_domainByLabel, 0);
  objc_storeStrong((id *)&self->_labelByDomain, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (unint64_t)databaseStatus
{
  return self->_databaseStatus;
}

- (KGStoredGraph)graph
{
  return self->_graph;
}

- (MAGraphSpecification)specification
{
  return (MAGraphSpecification *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)hash
{
  v2 = [(MAGraph *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MAGraph *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(MAGraph *)self identifier];
      v9 = [(MAGraph *)v7 identifier];

      char v6 = [v8 isEqual:v9];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)nodeIdentifiersOfEdgeIdentifiers:(id)a3 ofType:(unint64_t)a4
{
  return [(KGGraph *)self->_graph nodeIdentifiersOfEdgesForIdentifiers:a3 edgeDirection:a4];
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 betweenNodesForIdentifiers:(id)a4 andNodesForIdentifiers:(id)a5 matchingFilter:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x1D25FA040]();
  if (([v10 isEmpty] & 1) != 0 || objc_msgSend(v11, "isEmpty"))
  {
    v14 = objc_alloc_init(KGElementIdentifierSet);
  }
  else
  {
    graph = self->_graph;
    v16 = [v12 kgEdgeFilter];
    v14 = [(KGGraph *)graph edgeIdentifiersBetweenStartNodeIdentifiers:v10 endNodeIdentifiers:v11 edgeFilter:v16 edgeDirection:a3];
  }

  return v14;
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 onNodesForIdentifiers:(id)a4 matchingFilter:(id)a5
{
  graph = self->_graph;
  id v9 = a5;
  id v10 = [(KGGraph *)graph edgeIdentifiersWithStartNodeIdentifiers:a4 edgeDirection:a3];
  id v11 = self->_graph;
  id v12 = [v9 kgEdgeFilter];

  v13 = [(KGGraph *)v11 edgeIdentifiersMatchingFilter:v12 intersectingIdentifiers:v10];

  return v13;
}

- (id)nodeIdentifiersRelatedToSourceNodeIdentifiers:(id)a3 relation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(KGMutableElementIdentifierSet);
  [v6 unionAdjacencySetFromSourceNodeIdentifiers:v7 toTargetNodeIdentifiers:v8 graph:self];

  return v8;
}

- (id)anyEdgeMatchingFilter:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__MAGraph_anyEdgeMatchingFilter___block_invoke;
  v7[3] = &unk_1E68DC9D0;
  v7[4] = &v8;
  [(MAGraph *)self enumerateEdgesMatchingFilter:v4 usingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__MAGraph_anyEdgeMatchingFilter___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 sourceNodeIdentifier:(unint64_t)a4 targetNodeIdentifier:(unint64_t)a5
{
  id v9 = (void *)MEMORY[0x1D25FA040](self, a2);
  if (a3 - 1 > 2) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_1D17CE7C0[a3 - 1];
  }
  id v11 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a4];
  id v12 = [(KGGraph *)self->_graph edgeIdentifiersWithStartNodeIdentifiers:v11 edgeDirection:a3];
  if ([v12 isEmpty])
  {
    if (v12) {
      id v13 = v12;
    }
    else {
      id v13 = objc_alloc_init(KGElementIdentifierSet);
    }
    v19 = v13;
  }
  else
  {
    v14 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a5];
    v15 = [(KGGraph *)self->_graph edgeIdentifiersWithStartNodeIdentifiers:v14 edgeDirection:v10];
    v16 = [v15 identifierSetByIntersectingIdentifierSet:v12];
    v17 = v16;
    if (v16) {
      v18 = v16;
    }
    else {
      v18 = objc_alloc_init(KGElementIdentifierSet);
    }
    v19 = v18;
  }
  return v19;
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3
{
  return [(KGGraph *)self->_graph sourcesByTargetWithEdgeIdentifiers:a3];
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3
{
  return [(KGGraph *)self->_graph targetsBySourceWithEdgeIdentifiers:a3];
}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofEdgesWithIdentifiers:a4 usingBlock:v10];
}

void __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if ([v7 kgPropertyType] == 4 || objc_msgSend(v7, "kgPropertyType") == 1) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v7 unsignedLongLongValue], a4);
  }
}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofEdgesWithIdentifiers:a4 usingBlock:v10];
}

void __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if ([v7 kgPropertyType] == 4 || objc_msgSend(v7, "kgPropertyType") == 1) {
    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v7 unsignedIntValue], a4);
  }
}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateDoublePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofEdgesWithIdentifiers:a4 usingBlock:v10];
}

void __81__MAGraph_enumerateDoublePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  if ([v8 kgPropertyType] == 2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    [v8 doubleValue];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a4);
  }
}

- (void)enumerateStringPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateStringPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofEdgesWithIdentifiers:a4 usingBlock:v10];
}

void __81__MAGraph_enumerateStringPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 kgPropertyType] == 3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofEdgesWithIdentifiers:a4 usingBlock:v10];
}

void __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if ([v7 kgPropertyType] == 1) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v7 integerValue], a4);
  }
}

- (void)enumeratePropertyValuesForKey:(id)a3 ofEdgesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(KGElementCollection *)[KGEdgeCollection alloc] initWithIdentifiers:v9 graph:self->_graph];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__MAGraph_enumeratePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke;
  v13[3] = &unk_1E68DAA88;
  id v14 = v8;
  id v12 = v8;
  [(KGEdgeCollection *)v11 enumeratePropertyValuesForKey:v10 withBlock:v13];
}

uint64_t __75__MAGraph_enumeratePropertyValuesForKey_ofEdgesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 kgPropertyValue];
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return MEMORY[0x1F4181820]();
}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofNodesWithIdentifiers:a4 usingBlock:v10];
}

void __91__MAGraph_enumerateUnsignedLongLongPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if ([v7 kgPropertyType] == 4 || objc_msgSend(v7, "kgPropertyType") == 1) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v7 unsignedLongLongValue], a4);
  }
}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofNodesWithIdentifiers:a4 usingBlock:v10];
}

void __90__MAGraph_enumerateUnsignedIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if ([v7 kgPropertyType] == 4 || objc_msgSend(v7, "kgPropertyType") == 1) {
    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v7 unsignedIntValue], a4);
  }
}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateDoublePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofNodesWithIdentifiers:a4 usingBlock:v10];
}

void __81__MAGraph_enumerateDoublePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  if ([v8 kgPropertyType] == 2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    [v8 doubleValue];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a4);
  }
}

- (void)enumerateStringPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__MAGraph_enumerateStringPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofNodesWithIdentifiers:a4 usingBlock:v10];
}

void __81__MAGraph_enumerateStringPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 kgPropertyType] == 3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v10[3] = &unk_1E68DAAB0;
  id v11 = v8;
  id v9 = v8;
  [(MAGraph *)self enumeratePropertyValuesForKey:a3 ofNodesWithIdentifiers:a4 usingBlock:v10];
}

void __82__MAGraph_enumerateIntegerPropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if ([v7 kgPropertyType] == 1) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v7 integerValue], a4);
  }
}

- (void)enumeratePropertyValuesForKey:(id)a3 ofNodesWithIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(KGElementCollection *)[KGNodeCollection alloc] initWithIdentifiers:v9 graph:self->_graph];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__MAGraph_enumeratePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke;
  v13[3] = &unk_1E68DAA88;
  id v14 = v8;
  id v12 = v8;
  [(KGNodeCollection *)v11 enumeratePropertyValuesForKey:v10 withBlock:v13];
}

uint64_t __75__MAGraph_enumeratePropertyValuesForKey_ofNodesWithIdentifiers_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 kgPropertyValue];
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return MEMORY[0x1F4181820]();
}

- (id)abstractEdges
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__MAGraph_abstractEdges__block_invoke;
  v6[3] = &unk_1E68DCA20;
  id v4 = v3;
  id v7 = v4;
  [(MAGraph *)v2 enumerateEdgesWithBlock:v6];

  objc_sync_exit(v2);
  return v4;
}

void __24__MAGraph_abstractEdges__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = @"*";
  id v4 = @"*";
  id v5 = [v12 label];

  if (v5)
  {
    id v3 = [v12 label];
  }
  id v6 = [MAAbstractEdge alloc];
  uint64_t v7 = [v12 domain];
  LODWORD(v8) = 1.0;
  id v9 = [(MAAbstractEdge *)v6 initWithLabel:v3 domain:v7 weight:MEMORY[0x1E4F1CC08] properties:v8];
  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = v10;
    [v10 addObject:v12];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v9];
  }
}

- (id)allEdges
{
  return [(MAGraph *)self edgesForLabel:0 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (void)enumerateEdgesWithBlock:(id)a3
{
}

- (void)enumerateEdgesInDomain:(unsigned __int16)a3 usingBlock:(id)a4
{
}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 usingBlock:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v12 domain:v7 properties:v11];

  [(MAGraph *)self enumerateEdgesMatchingFilter:v13 usingBlock:v10];
}

- (void)enumerateEdgesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(MAGraph *)self edgeIdentifiersMatchingFilter:a3];
  [(MAGraph *)self enumerateEdgesWithIdentifiers:v7 usingBlock:v6];
}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
}

- (void)enumerateEdgesWithIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25FA040]();
  double v8 = [(KGGraph *)self->_graph edgesForIdentifiers:v9];
  [v8 enumerateEdgesUsingBlock:v6];
}

- (unint64_t)edgesCountForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v5 = [(MAGraph *)self _edgeIdentifiersWithLabel:a3 domain:a4 properties:a5];
  unint64_t v6 = [v5 count];

  return v6;
}

- (unint64_t)edgesCountForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MAGraph *)self edgesCountForLabel:a3 domain:a4 properties:MEMORY[0x1E4F1CC08]];
}

- (id)edgesDomains
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(KGGraph *)self->_graph edgeLabels];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF beginswith 'domain'"];
  id v4 = [v2 filteredSetUsingPredicate:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "substringFromIndex:", 7, (void)v13);
        objc_msgSend(v5, "addIndex:", objc_msgSend(v11, "integerValue"));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)edgesLabels
{
  v2 = [(KGGraph *)self->_graph edgeLabels];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (SELF beginswith 'domain')"];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return v4;
}

- (unint64_t)edgesCountForLabel:(id)a3
{
  return [(MAGraph *)self edgesCountForLabel:a3 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (unint64_t)edgesCount
{
  return [(MAGraph *)self edgesCountForLabel:0 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v18 = (void *)MEMORY[0x1D25FA040]();
  *(float *)&double v19 = a7;
  v20 = [(MAGraph *)self _anyEdgeWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 weight:v17 properties:v19];
  if (!v20)
  {
    if (v17) {
      id v22 = v17;
    }
    else {
      id v22 = (id)MEMORY[0x1E4F1CC08];
    }
    *(float *)&double v21 = a7;
    v20 = [(MAGraph *)self _addEdgeWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 weight:v22 properties:v21];
  }

  return v20;
}

- (id)_anyEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v9 = a6;
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  id v16 = a4;
  id v17 = [KGElementIdentifierSet alloc];
  uint64_t v18 = [v16 identifier];

  double v19 = [(KGElementIdentifierSet *)v17 initWithElementIdentifier:v18];
  v20 = [(KGGraph *)self->_graph edgeIdentifiersWithStartNodeIdentifiers:v19 edgeDirection:2];
  if ([(KGElementIdentifierSet *)v19 isEmpty])
  {
    double v21 = 0;
  }
  else
  {
    id v22 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", [v14 identifier]);
    v23 = [(KGGraph *)self->_graph edgeIdentifiersWithStartNodeIdentifiers:v22 edgeDirection:1];
    if ([(KGElementIdentifierSet *)v22 isEmpty])
    {
      double v21 = 0;
    }
    else
    {
      v24 = [v23 identifierSetByIntersectingIdentifierSet:v20];
      if ([v24 isEmpty])
      {
        double v21 = 0;
      }
      else
      {
        v27 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v13 domain:v9 properties:v15];
        v25 = [(MAGraph *)self edgeIdentifiersMatchingFilter:v27 intersectingIdentifiers:v24];
        double v21 = -[KGGraph edgeForIdentifier:](self->_graph, "edgeForIdentifier:", [v25 firstElement]);
      }
    }
  }
  return v21;
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = [(MAGraph *)self _edgeIdentifiersWithLabel:a3 domain:a4 properties:a5];
  uint64_t v7 = [(KGGraph *)self->_graph edgesForIdentifiers:v6];
  uint64_t v8 = [v7 set];

  return v8;
}

- (id)_edgeIdentifiersWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [MAEdgeFilter alloc];
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = (id)MEMORY[0x1E4F1CC08];
  }
  id v12 = [(MAElementFilter *)v10 initWithLabel:v9 domain:v5 properties:v11];

  id v13 = [(MAGraph *)self edgeIdentifiersMatchingFilter:v12];

  return v13;
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MAGraph *)self edgesForLabel:a3 domain:a4 properties:MEMORY[0x1E4F1CC08]];
}

- (id)edgesForLabel:(id)a3
{
  return [(MAGraph *)self edgesForLabel:a3 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (unint64_t)numberOfEdgesMatchingFilter:(id)a3
{
  id v3 = [(MAGraph *)self edgeIdentifiersMatchingFilter:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  graph = self->_graph;
  id v6 = a4;
  uint64_t v7 = [a3 kgEdgeFilter];
  id v8 = [(KGGraph *)graph edgeIdentifiersMatchingFilter:v7 intersectingIdentifiers:v6];

  return v8;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3
{
  graph = self->_graph;
  unint64_t v4 = [a3 kgEdgeFilter];
  uint64_t v5 = [(KGGraph *)graph edgeIdentifiersMatchingFilter:v4];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = objc_alloc_init(KGElementIdentifierSet);
  }
  id v8 = v7;

  return v8;
}

- (id)edgesForIdentifiers:(id)a3
{
  id v3 = [(KGGraph *)self->_graph edgesForIdentifiers:a3];
  unint64_t v4 = [v3 set];

  return v4;
}

- (id)edgeForIdentifier:(unint64_t)a3
{
  return [(KGGraph *)self->_graph edgeForIdentifier:a3];
}

- (void)legacyRemoveEdges:(id)a3
{
  id v4 = a3;
  id v6 = [(MAElementCollection *)[MAEdgeCollection alloc] initWithSet:v4 graph:self];

  uint64_t v5 = objc_alloc_init(MAGraphChangeRequest);
  [(MAGraphChangeRequest *)v5 removeEdges:v6];
  [(MAGraph *)self executeGraphChangeRequest:v5];
}

- (id)addEdgeFromBase:(id)a3 sourceNode:(id)a4 targetNode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 label];
  uint64_t v12 = [v10 domain];
  [v10 weight];
  int v14 = v13;
  id v15 = [v10 propertyDictionary];

  LODWORD(v16) = v14;
  id v17 = [(MAGraph *)self addEdgeWithLabel:v11 sourceNode:v9 targetNode:v8 domain:v12 weight:v15 properties:v16];

  return v17;
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5
{
  LODWORD(v5) = 1.0;
  return [(MAGraph *)self addEdgeWithLabel:a3 sourceNode:a4 targetNode:a5 domain:1 weight:MEMORY[0x1E4F1CC08] properties:v5];
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v18 = self;
  objc_sync_enter(v18);
  if (v17) {
    id v20 = v17;
  }
  else {
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }
  *(float *)&double v19 = a7;
  double v21 = [(MAGraph *)v18 _addEdgeWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 weight:v20 properties:v19];
  objc_sync_exit(v18);

  return v21;
}

- (id)_addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v9 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(MAGraph *)self specification];
  double v19 = (objc_class *)[v18 edgeClassWithLabel:v17 domain:v9];

  id v20 = [v19 alloc];
  *(float *)&double v21 = a7;
  id v22 = (void *)[v20 initWithLabel:v17 sourceNode:v16 targetNode:v15 domain:v9 weight:v14 properties:v21];

  v23 = [(MAGraph *)self graphReference];
  [v22 setGraphReference:v23];

  v24 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v24 insertEdge:v22];
  graph = self->_graph;
  id v29 = 0;
  LOBYTE(v17) = [(KGMutableGraph *)graph performChangesAndWait:v24 error:&v29];
  id v26 = v29;
  if (v17)
  {
    id v27 = v22;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v26;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error adding edge: %@", buf, 0xCu);
    }
    [(MAGraph *)self setHadFatalError];
    id v27 = 0;
  }

  return v27;
}

- (BOOL)edgesStoreWeakReferencesToNodes
{
  return 0;
}

- (id)graphNode
{
  id v3 = [MAAbstractNode alloc];
  id v4 = [(MAGraph *)self identifier];
  double v5 = [v4 UUIDString];
  LODWORD(v6) = 1.0;
  uint64_t v7 = [(MAAbstractNode *)v3 initWithLabel:v5 domain:1 weight:MEMORY[0x1E4F1CC08] properties:v6];

  return v7;
}

- (id)orphanNodes
{
  id v3 = (void *)MEMORY[0x1D25FA040](self, a2);
  id v4 = [MEMORY[0x1E4F1CA80] set];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__MAGraph_orphanNodes__block_invoke;
  v8[3] = &unk_1E68DC550;
  id v9 = v4;
  id v5 = v4;
  [(MAGraph *)self enumerateNodesWithBlock:v8];
  double v6 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];

  return v6;
}

void __22__MAGraph_orphanNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isOrphan]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeType:(unint64_t)a4 edgeFilter:(id)a5
{
  graph = self->_graph;
  id v8 = a3;
  id v9 = [a5 kgEdgeFilter];
  uint64_t v10 = [(KGGraph *)graph transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:v8 edgeDirection:a4 edgeFilter:v9];

  return v10;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeType:(unint64_t)a4 edgeFilter:(id)a5
{
  graph = self->_graph;
  id v8 = a3;
  id v9 = [a5 kgEdgeFilter];
  uint64_t v10 = [(KGGraph *)graph neighborNodeIdentifiersWithStartNodeIdentifiers:v8 edgeDirection:a4 edgeFilter:v9];

  return v10;
}

- (id)allNodes
{
  return [(MAGraph *)self nodesForLabel:0 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (void)enumerateNodesWithBlock:(id)a3
{
}

- (void)enumerateNodesInDomain:(unsigned __int16)a3 usingBlock:(id)a4
{
}

- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 usingBlock:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  int v13 = [(MAElementFilter *)[MANodeFilter alloc] initWithLabel:v12 domain:v7 properties:v11];

  [(MAGraph *)self enumerateNodesMatchingFilter:v13 usingBlock:v10];
}

- (void)enumerateNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(MAGraph *)self nodeIdentifiersMatchingFilter:a3];
  [(MAGraph *)self enumerateNodesWithIdentifiers:v7 usingBlock:v6];
}

- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1D25FA040]();
  int v13 = [(KGGraph *)self->_graph nodesForIdentifiers:v14];
  [v13 enumerateIdentifiersSortedByUnsignedIntegerPropertyForName:v10 ascending:v7 usingBlock:v11];
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByDoublePropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1D25FA040]();
  int v13 = [(KGGraph *)self->_graph nodesForIdentifiers:v14];
  [v13 enumerateIdentifiersSortedByDoublePropertyForName:v10 ascending:v7 usingBlock:v11];
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1D25FA040]();
  int v13 = [(KGGraph *)self->_graph nodesForIdentifiers:v14];
  [v13 enumerateIdentifiersSortedByIntegerPropertyForName:v10 ascending:v7 usingBlock:v11];
}

- (void)enumerateNodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1D25FA040]();
  int v13 = [(KGGraph *)self->_graph nodesForIdentifiers:v14];
  [v13 enumerateIdentifiersSortedByStringPropertyForName:v10 ascending:v7 usingBlock:v11];
}

- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 usingBlock:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D25FA040]();
  id v11 = [(KGGraph *)self->_graph nodesForIdentifiers:v12];
  [v11 enumerateNodesSortedByFloatPropertyForName:v8 usingBlock:v9];
}

- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 usingBlock:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D25FA040]();
  id v11 = [(KGGraph *)self->_graph nodesForIdentifiers:v12];
  [v11 enumerateNodesSortedByIntegerPropertyForName:v8 usingBlock:v9];
}

- (void)enumerateNodesWithIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 usingBlock:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D25FA040]();
  id v11 = [(KGGraph *)self->_graph nodesForIdentifiers:v12];
  [v11 enumerateNodesSortedByStringPropertyForName:v8 usingBlock:v9];
}

- (void)enumerateNodesWithIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1D25FA040]();
  id v8 = [(KGGraph *)self->_graph nodesForIdentifiers:v9];
  [v8 enumerateNodesUsingBlock:v6];
}

- (id)adjacencyWithEndNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeType:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(KGDirectedBinaryAdjacency);
  id v11 = objc_alloc_init(KGDirectedBinaryAdjacency);
  if ((v5 & 2) != 0)
  {
    id v12 = [(MAGraph *)self edgeIdentifiersOfType:1 onNodesForIdentifiers:v8 matchingFilter:v9];
    uint64_t v13 = [(MAGraph *)self targetsBySourceWithEdgeIdentifiers:v12];

    id v10 = (KGDirectedBinaryAdjacency *)v13;
  }
  if (v5)
  {
    id v14 = [(MAGraph *)self edgeIdentifiersOfType:2 onNodesForIdentifiers:v8 matchingFilter:v9];
    uint64_t v15 = [(MAGraph *)self sourcesByTargetWithEdgeIdentifiers:v14];

    id v11 = (KGDirectedBinaryAdjacency *)v15;
  }
  id v16 = [(KGDirectedBinaryAdjacency *)v10 unionWith:v11];

  return v16;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeType:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(KGDirectedBinaryAdjacency);
  id v11 = objc_alloc_init(KGDirectedBinaryAdjacency);
  if ((v5 & 2) != 0)
  {
    id v12 = [(MAGraph *)self edgeIdentifiersOfType:2 onNodesForIdentifiers:v8 matchingFilter:v9];
    uint64_t v13 = [(MAGraph *)self targetsBySourceWithEdgeIdentifiers:v12];

    id v10 = (KGDirectedBinaryAdjacency *)v13;
  }
  if (v5)
  {
    id v14 = [(MAGraph *)self edgeIdentifiersOfType:1 onNodesForIdentifiers:v8 matchingFilter:v9];
    uint64_t v15 = [(MAGraph *)self sourcesByTargetWithEdgeIdentifiers:v14];

    id v11 = (KGDirectedBinaryAdjacency *)v15;
  }
  id v16 = [(KGDirectedBinaryAdjacency *)v10 unionWith:v11];

  return v16;
}

- (id)adjacencyWithSources:(id)a3 relation:(id)a4
{
  return (id)[a4 adjacencyWithStartNodeIdentifiers:a3 graph:self];
}

- (void)labelsAndDomainsOfEdgesForIdentifiers:(id)a3 labels:(id *)a4 domains:(id *)a5
{
  id v7 = [(KGGraph *)self->_graph labelsOfEdgesForIdentifiers:a3];
  MALabelsAndDomainsFromKGLabels(v7, a4, a5);
}

- (void)labelsAndDomainsOfNodesForIdentifiers:(id)a3 labels:(id *)a4 domains:(id *)a5
{
  id v7 = [(KGGraph *)self->_graph labelsOfNodesForIdentifiers:a3];
  MALabelsAndDomainsFromKGLabels(v7, a4, a5);
}

- (id)nodesDomains
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(KGGraph *)self->_graph nodeLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = +[MAKGDomainConversion maDomainForKGLabel:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9 != 0xFFFF) {
          [v3 addIndex:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)nodesLabels
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(KGGraph *)self->_graph nodeLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (+[MAKGDomainConversion maDomainForKGLabel:v9] == 0xFFFF) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)nodesCount
{
  return [(MAGraph *)self nodesCountForLabel:0 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (unint64_t)nodesCountForDomain:(unsigned __int16)a3
{
  return [(MAGraph *)self nodesCountForLabel:0 domain:a3 properties:MEMORY[0x1E4F1CC08]];
}

- (id)nodesForDomain:(unsigned __int16)a3 properties:(id)a4
{
  return [(MAGraph *)self nodesForLabel:0 domain:a3 properties:a4];
}

- (id)nodesForDomain:(unsigned __int16)a3
{
  return [(MAGraph *)self nodesForLabel:0 domain:a3 properties:MEMORY[0x1E4F1CC08]];
}

- (unint64_t)nodesCountForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5 = [(MAGraph *)self _nodeIdentifiersWithLabel:a3 domain:a4 properties:a5];
  unint64_t v6 = [v5 count];

  return v6;
}

- (unint64_t)numberOfNodesMatchingFilter:(id)a3
{
  id v3 = [(MAGraph *)self nodeIdentifiersMatchingFilter:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  unint64_t v6 = [(MAGraph *)self _nodeIdentifiersWithLabel:a3 domain:a4 properties:a5];
  uint64_t v7 = [(KGGraph *)self->_graph nodesForIdentifiers:v6];
  id v8 = [v7 set];

  return v8;
}

- (id)anyNodeForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MAElementFilter *)[MANodeFilter alloc] initWithLabel:v9 domain:v5 properties:v8];

  long long v11 = [(MAGraph *)self anyNodeMatchingFilter:v10];

  return v11;
}

- (id)anyNodeMatchingFilter:(id)a3
{
  unint64_t v4 = [(MAGraph *)self nodeIdentifiersMatchingFilter:a3];
  uint64_t v5 = -[KGGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", [v4 firstElement]);

  return v5;
}

- (id)_nodeIdentifiersWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [MANodeFilter alloc];
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = (id)MEMORY[0x1E4F1CC08];
  }
  long long v12 = [(MAElementFilter *)v10 initWithLabel:v9 domain:v5 properties:v11];

  long long v13 = [(MAGraph *)self nodeIdentifiersMatchingFilter:v12];

  return v13;
}

- (unint64_t)nodesCountForLabel:(id)a3
{
  return [(MAGraph *)self nodesCountForLabel:a3 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (unint64_t)nodesCountForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MAGraph *)self nodesCountForLabel:a3 domain:a4 properties:MEMORY[0x1E4F1CC08]];
}

- (id)anyNodeForLabel:(id)a3
{
  return [(MAGraph *)self anyNodeForLabel:a3 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (id)anyNodeForLabel:(id)a3 domain:(unsigned __int16)a4
{
  unint64_t v4 = [(MAGraph *)self nodesForLabel:a3 domain:a4];
  uint64_t v5 = [v4 anyObject];

  return v5;
}

- (id)nodesForLabel:(id)a3
{
  return [(MAGraph *)self nodesForLabel:a3 domain:0 properties:MEMORY[0x1E4F1CC08]];
}

- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MAGraph *)self nodesForLabel:a3 domain:a4 properties:MEMORY[0x1E4F1CC08]];
}

- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  graph = self->_graph;
  id v6 = a4;
  uint64_t v7 = [a3 kgNodeFilter];
  id v8 = [(KGGraph *)graph nodeIdentifiersMatchingFilter:v7 intersectingIdentifiers:v6];

  return v8;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3
{
  graph = self->_graph;
  unint64_t v4 = [a3 kgNodeFilter];
  uint64_t v5 = [(KGGraph *)graph nodeIdentifiersMatchingFilter:v4];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = objc_alloc_init(KGElementIdentifierSet);
  }
  id v8 = v7;

  return v8;
}

- (id)nodesForIdentifiers:(id)a3
{
  id v3 = [(KGGraph *)self->_graph nodesForIdentifiers:a3];
  unint64_t v4 = [v3 set];

  return v4;
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  return [(KGGraph *)self->_graph nodeForIdentifier:a3];
}

- (void)legacyRemoveNodes:(id)a3
{
  id v4 = a3;
  id v6 = [(MAElementCollection *)[MANodeCollection alloc] initWithSet:v4 graph:self];

  uint64_t v5 = objc_alloc_init(MAGraphChangeRequest);
  [(MAGraphChangeRequest *)v5 removeNodes:v6];
  [(MAGraph *)self executeGraphChangeRequest:v5];
}

- (id)addUniquelyIdentifiedNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6 didCreate:(BOOL *)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  long long v14 = (void *)MEMORY[0x1D25FA040]();
  uint64_t v15 = [(MAGraph *)self nodesForLabel:v12 domain:v10 properties:MEMORY[0x1E4F1CC08]];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__MAGraph_addUniquelyIdentifiedNodeWithLabel_domain_weight_properties_didCreate___block_invoke;
  v31[3] = &unk_1E68DAA60;
  id v16 = v13;
  id v32 = v16;
  v33 = &v34;
  [v15 enumerateObjectsUsingBlock:v31];
  uint64_t v18 = v35[5];
  if (v18)
  {
    double v19 = [(id)v35[5] changingPropertiesWithProperties:v16];
    if ([v19 count])
    {
      uint64_t v20 = [(id)v35[5] identifier];
      [(MAGraph *)self persistModelProperties:v19 forNodeWithIdentifier:v20 clobberExisting:0];
      id v29 = v14;
      v30 = [(id)v35[5] graphReference];
      double v21 = [(id)v35[5] propertyDictionary];
      id v22 = (void *)[v21 mutableCopy];

      [v22 addEntriesFromDictionary:v19];
      id v23 = objc_alloc((Class)objc_opt_class());
      v24 = [(id)v35[5] label];
      *(float *)&double v25 = a5;
      uint64_t v26 = [v23 initWithLabel:v24 domain:v10 weight:v22 properties:v25];
      id v27 = (void *)v35[5];
      v35[5] = v26;

      [(id)v35[5] setIdentifier:v20];
      [(id)v35[5] setGraphReference:v30];

      long long v14 = v29;
    }
  }
  else
  {
    if (a7) {
      *a7 = 1;
    }
    *(float *)&double v17 = a5;
    uint64_t v10 = [(MAGraph *)self _addNodeWithLabel:v12 domain:v10 weight:v16 properties:v17];
  }

  if (v18) {
    uint64_t v10 = (uint64_t)(id)v35[5];
  }
  _Block_object_dispose(&v34, 8);

  return (id)v10;
}

void __81__MAGraph_addUniquelyIdentifiedNodeWithLabel_domain_weight_properties_didCreate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isIdentifiedByProperties:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)addUniqueNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6 didCreate:(BOOL *)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a6;
  long long v14 = [(MAGraph *)self nodesForLabel:v12 domain:v10 properties:v13];
  uint64_t v15 = [v14 anyObject];

  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    if (a7) {
      *a7 = 1;
    }
    if (v13) {
      id v18 = v13;
    }
    else {
      id v18 = (id)MEMORY[0x1E4F1CC08];
    }
    *(float *)&double v16 = a5;
    id v17 = [(MAGraph *)self _addNodeWithLabel:v12 domain:v10 weight:v18 properties:v16];
  }
  double v19 = v17;

  return v19;
}

- (BOOL)findAndResolveUniqueEdge:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D25FA040]();
  id v6 = [v4 sourceNode];
  uint64_t v7 = [v6 identifier];

  id v8 = [v4 targetNode];
  uint64_t v9 = [v8 identifier];

  BOOL v10 = 0;
  if (v7 && v9)
  {
    id v11 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:v7];
    id v12 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:v9];
    id v13 = [v4 uniquelyIdentifyingFilter];
    long long v14 = [(MAGraph *)self edgeIdentifiersOfType:2 betweenNodesForIdentifiers:v11 andNodesForIdentifiers:v12 matchingFilter:v13];
    uint64_t v15 = [v14 count];
    BOOL v10 = v15 != 0;
    if (v15)
    {
      uint64_t v16 = v15;
      if (v15 != 1)
      {
        id v17 = KGLoggingConnection();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          int v20 = 134218242;
          uint64_t v21 = v16;
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_fault_impl(&dword_1D1654000, v17, OS_LOG_TYPE_FAULT, "(%lu) edges found for unique insert with filter %@", (uint8_t *)&v20, 0x16u);
        }
      }
      id v18 = [(MAGraph *)self graphReference];
      [v4 setGraphReference:v18];

      objc_msgSend(v4, "resolveIdentifier:", objc_msgSend(v14, "firstElement"));
    }
  }

  return v10;
}

- (void)addUniqueNode:(id)a3 didInsert:(BOOL *)a4
{
  id v8 = a3;
  BOOL v6 = -[MAGraph findAndResolveUniqueNode:](self, "findAndResolveUniqueNode:");
  if (a4) {
    *a4 = !v6;
  }
  if (!v6)
  {
    uint64_t v7 = objc_alloc_init(MAGraphChangeRequest);
    [(MAGraphChangeRequest *)v7 addNode:v8];
    [(MAGraph *)self executeGraphChangeRequest:v7];
  }
}

- (BOOL)findAndResolveUniqueNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uniquelyIdentifyingFilter];
  BOOL v6 = [(MAGraph *)self nodeIdentifiersMatchingFilter:v5];
  uint64_t v7 = [v6 count];
  uint64_t v8 = v7;
  if (v7)
  {
    if (v7 != 1)
    {
      uint64_t v9 = KGLoggingConnection();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v12 = 134218242;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        _os_log_fault_impl(&dword_1D1654000, v9, OS_LOG_TYPE_FAULT, "(%lu) nodes found for unique insert with filter %@", (uint8_t *)&v12, 0x16u);
      }
    }
    BOOL v10 = [(MAGraph *)self graphReference];
    [v4 setGraphReference:v10];

    objc_msgSend(v4, "resolveIdentifier:", objc_msgSend(v6, "firstElement"));
  }

  return v8 != 0;
}

- (id)addNodeFromBase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 label];
  uint64_t v6 = [v4 domain];
  [v4 weight];
  int v8 = v7;
  uint64_t v9 = [v4 propertyDictionary];

  LODWORD(v10) = v8;
  id v11 = [(MAGraph *)self _addNodeWithLabel:v5 domain:v6 weight:v9 properties:v10];

  return v11;
}

- (id)addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  if (!a6) {
    a6 = (id)MEMORY[0x1E4F1CC08];
  }
  return -[MAGraph _addNodeWithLabel:domain:weight:properties:](self, "_addNodeWithLabel:domain:weight:properties:", a3, a4, a6);
}

- (id)addNodeWithLabel:(id)a3
{
  LODWORD(v3) = 1.0;
  return [(MAGraph *)self addNodeWithLabel:a3 domain:1 weight:MEMORY[0x1E4F1CC08] properties:v3];
}

- (id)_addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a3;
  int v12 = [(MAGraph *)self specification];
  uint64_t v13 = (objc_class *)[v12 nodeClassWithLabel:v11 domain:v7];

  id v14 = [v13 alloc];
  *(float *)&double v15 = a5;
  uint64_t v16 = (void *)[v14 initWithLabel:v11 domain:v7 weight:v10 properties:v15];

  id v17 = [(MAGraph *)self graphReference];
  [v16 setGraphReference:v17];

  id v18 = objc_alloc_init(MAGraphChangeRequest);
  [(MAGraphChangeRequest *)v18 addNode:v16];
  [(MAGraph *)self executeGraphChangeRequest:v18];

  return v16;
}

- (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (void)executeGraphChangeRequest:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(KGGraphChangeRequest);
  if ([v4 numberOfChanges])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [v4 nodesToInsert];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          [(KGGraphChangeRequest *)v5 insertNode:v11];
          int v12 = [(MAGraph *)self specification];
          uint64_t v13 = [v12 rootGraphReference];
          [v11 setGraphReference:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v8);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = [v4 edgesToInsert];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          [(KGGraphChangeRequest *)v5 insertEdge:v19];
          int v20 = [(MAGraph *)self specification];
          uint64_t v21 = [v20 rootGraphReference];
          [v19 setGraphReference:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v16);
    }

    __int16 v22 = [v4 nodeIdentifiersToRemove];
    if ([v22 count]) {
      [(KGGraphChangeRequest *)v5 removeNodesForIdentifiers:v22];
    }
    id v23 = [v4 edgeIdentifiersToRemove];
    if ([v23 count]) {
      [(KGGraphChangeRequest *)v5 removeEdgesForIdentifiers:v23];
    }
    graph = self->_graph;
    id v27 = 0;
    BOOL v25 = [(KGMutableGraph *)graph performChangesAndWait:v5 error:&v27];
    id v26 = v27;
    if (!v25)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v26;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error executing request: %@", buf, 0xCu);
      }
      [(MAGraph *)self setHadFatalError];
    }
  }
}

- (BOOL)usesClassCDataProtection
{
  v2 = [(MAGraph *)self specification];
  unint64_t v3 = ((unint64_t)[v2 persistenceOptions] >> 5) & 1;

  return v3;
}

- (BOOL)usesClassBDataProtection
{
  v2 = [(MAGraph *)self specification];
  unint64_t v3 = ((unint64_t)[v2 persistenceOptions] >> 4) & 1;

  return v3;
}

- (BOOL)usesClassADataProtection
{
  v2 = [(MAGraph *)self specification];
  unint64_t v3 = ((unint64_t)[v2 persistenceOptions] >> 3) & 1;

  return v3;
}

- (BOOL)isReadOnly
{
  v2 = [(MAGraph *)self specification];
  unint64_t v3 = ((unint64_t)[v2 persistenceOptions] >> 2) & 1;

  return v3;
}

- (void)rollbackBatch
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(KGStoredGraph *)self->_graph store];
  id v6 = 0;
  char v4 = [v3 rollbackTransactionWithError:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0)
  {
    [(MAGraph *)self setHadFatalError];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error rolling back transaction: %@", buf, 0xCu);
    }
  }
}

- (void)leaveBatch
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(KGStoredGraph *)self->_graph store];
  id v6 = 0;
  char v4 = [v3 commitTransactionWithError:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0)
  {
    [(MAGraph *)self setHadFatalError];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error committing transaction: %@", buf, 0xCu);
    }
  }
}

- (void)enterBatch
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(KGStoredGraph *)self->_graph store];
  id v6 = 0;
  char v4 = [v3 beginTransactionWithError:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0)
  {
    [(MAGraph *)self setHadFatalError];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error beginning transaction: %@", buf, 0xCu);
    }
  }
}

- (NSUUID)identifier
{
  v2 = [(KGStoredGraph *)self->_graph store];
  unint64_t v3 = [v2 graphIdentifier];

  return (NSUUID *)v3;
}

- (void)setVersion:(unint64_t)a3
{
  id v4 = [(KGStoredGraph *)self->_graph store];
  [v4 setGraphVersion:a3];
}

- (unint64_t)version
{
  v2 = [(KGStoredGraph *)self->_graph store];
  unint64_t v3 = [v2 graphVersion];

  return v3;
}

- (id)description
{
  return (id)[(KGStoredGraph *)self->_graph description];
}

- (void)labelAndDomainFromLabels:(id)a3 outLabel:(id *)a4 outDomain:(unsigned __int16 *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_labelMapLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [(NSMutableDictionary *)self->_domainByLabel objectForKeyedSubscript:v13];
        if (v14)
        {
          uint64_t v15 = v14;
          unsigned __int16 v16 = [v14 unsignedShortValue];
        }
        else
        {
          uint64_t v17 = +[MAKGDomainConversion maDomainForKGLabel:v13];
          if (v17 == 0xFFFF)
          {
            uint64_t v15 = v10;
            unsigned __int16 v16 = -1;
            id v10 = v13;
          }
          else
          {
            unsigned __int16 v16 = v17;
            uint64_t v15 = [NSNumber numberWithUnsignedShort:v17];
            [(NSMutableDictionary *)self->_domainByLabel setObject:v15 forKeyedSubscript:v13];
            [(NSMutableDictionary *)self->_labelByDomain setObject:v13 forKeyedSubscript:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
    unsigned __int16 v16 = -1;
  }

  os_unfair_lock_unlock(&self->_labelMapLock);
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v16;
  }
}

- (id)labelsForLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  if (v4 >= 2)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedShort:v4];
    os_unfair_lock_lock(&self->_labelMapLock);
    uint64_t v9 = [(NSMutableDictionary *)self->_labelByDomain objectForKeyedSubscript:v8];
    if (!v9)
    {
      uint64_t v9 = +[MAKGDomainConversion kgLabelForMADomain:v4];
      [(NSMutableDictionary *)self->_labelByDomain setObject:v9 forKeyedSubscript:v8];
      [(NSMutableDictionary *)self->_domainByLabel setObject:v8 forKeyedSubscript:v9];
    }
    os_unfair_lock_unlock(&self->_labelMapLock);
    [v7 addObject:v9];
  }
  if ([v6 length]) {
    [v7 addObject:v6];
  }

  return v7;
}

- (void)setHadFatalError
{
  self->_databaseStatus = 0;
}

- (BOOL)noFatalError
{
  unint64_t databaseStatus = self->_databaseStatus;
  if (databaseStatus == 1)
  {
    if ([(KGGraph *)self->_graph noFatalError])
    {
      unint64_t databaseStatus = self->_databaseStatus;
    }
    else
    {
      unint64_t databaseStatus = 0;
      self->_unint64_t databaseStatus = 0;
    }
  }
  return databaseStatus == 1;
}

- (MAGraphReference)graphReference
{
  return [(MAGraphSpecification *)self->_specification rootGraphReference];
}

- (void)dealloc
{
  [(MAGraph *)self closePersistentStore];
  v3.receiver = self;
  v3.super_class = (Class)MAGraph;
  [(MAGraph *)&v3 dealloc];
}

- (MAGraph)init
{
  return [(MAGraph *)self initWithSpecification:0];
}

- (MAGraph)initWithPersistenceOptions:(int64_t)a3
{
  uint64_t v4 = [(MAGraph *)self init];
  id v5 = v4;
  if (v4) {
    [(MAGraphSpecification *)v4->_specification setPersistenceOptions:a3];
  }
  return v5;
}

- (MAGraph)initWithSpecification:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MAGraph;
  id v5 = [(MAGraph *)&v20 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      uint64_t v6 = [(id)objc_opt_class() defaultSpecification];
    }
    specification = v5->_specification;
    v5->_specification = (MAGraphSpecification *)v6;

    uint64_t v8 = [[MAGraphReference alloc] initWithGraph:v5];
    [(MAGraphSpecification *)v5->_specification setRootGraphReference:v8];

    uint64_t v9 = [MAKGEntityFactory alloc];
    id v10 = [(MAGraph *)v5 specification];
    uint64_t v11 = [(MAKGEntityFactory *)v9 initWithSpecification:v10];

    int v12 = objc_alloc_init(KGMemoryGraphStore);
    uint64_t v13 = [[KGStoredGraph alloc] initGraphWithStore:v12 entityFactory:v11];
    graph = v5->_graph;
    v5->_graph = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    labelByDomain = v5->_labelByDomain;
    v5->_labelByDomain = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    domainByLabel = v5->_domainByLabel;
    v5->_domainByLabel = (NSMutableDictionary *)v17;

    v5->_labelMapLock._os_unfair_lock_opaque = 0;
    v5->_unint64_t databaseStatus = 1;
  }
  return v5;
}

+ (id)defaultSpecification
{
  v2 = objc_alloc_init(MAGraphSpecification);
  return v2;
}

+ (id)graph
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_445);
  }
}

- (void)waitUntilQuiescentUsingBlock:(id)a3
{
}

- (void)readUsingBlock:(id)a3
{
}

- (void)writeUsingBlock:(id)a3
{
}

- (BOOL)hasPendingWrite
{
  return 1;
}

- (BOOL)hasPendingRead
{
  return 1;
}

- (void)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 saveToDatabase:(BOOL)a6 createdNodes:(id *)a7 createdEdges:(id *)a8
{
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA80];
  id v14 = a3;
  uint64_t v15 = [v13 set];
  unsigned __int16 v16 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke;
  v27[3] = &unk_1E68DBC30;
  BOOL v30 = a4;
  v27[4] = self;
  id v18 = v17;
  id v28 = v18;
  id v19 = v15;
  id v29 = v19;
  [v14 enumerateNodesWithBlock:v27];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2;
  v22[3] = &unk_1E68DBC88;
  BOOL v26 = a5;
  id v23 = v18;
  uint64_t v24 = self;
  id v20 = v16;
  id v25 = v20;
  id v21 = v18;
  [v14 enumerateEdgesWithBlock:v22];

  if (a7) {
    *a7 = v19;
  }
  if (a8) {
    *a8 = v20;
  }
}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__2869;
    id v23 = __Block_byref_object_dispose__2870;
    objc_msgSend(*(id *)(a1 + 32), "nodeForIdentifier:", objc_msgSend(v3, "identifier"));
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v20;
    id v7 = (void *)v20[5];
    if (v7)
    {
      char v8 = [v7 isEqualToNode:v4];
      uint64_t v6 = v20;
      if (v8)
      {
        [*(id *)(a1 + 40) setObject:v20[5] forKey:v4];
        _Block_object_dispose(&v19, 8);

        goto LABEL_3;
      }
      uint64_t v9 = (void *)v20[5];
    }
    else
    {
      uint64_t v9 = 0;
    }
    v6[5] = 0;

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v4 label];
    uint64_t v12 = [v4 domain];
    uint64_t v13 = [v4 propertyDictionary];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2;
    v15[3] = &unk_1E68DBC08;
    id v16 = *(id *)(a1 + 40);
    id v17 = v4;
    id v18 = &v19;
    [v10 enumerateNodesWithLabel:v11 domain:v12 properties:v13 usingBlock:v15];

    uint64_t v14 = v20[5];
    _Block_object_dispose(&v19, 8);

    if (v14) {
      goto LABEL_3;
    }
  }
  id v5 = [*(id *)(a1 + 32) addNodeFromBase:v4];
  [*(id *)(a1 + 48) addObject:v5];
  [*(id *)(a1 + 40) setObject:v5 forKey:v4];

LABEL_3:
}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 sourceNode];
  uint64_t v6 = [v4 objectForKey:v5];

  id v7 = *(void **)(a1 + 32);
  char v8 = [v3 targetNode];
  uint64_t v9 = [v7 objectForKey:v8];

  if (!v6 || !v9)
  {
    [MEMORY[0x1E4F1CA00] raise:@"MAGraphInvalidGraph", @"Graph invalid for edge \"%@\"", v3 format];
    goto LABEL_7;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "edgeForIdentifier:", objc_msgSend(v3, "identifier"));
    id v10 = v11;
    if (v11 && ([v11 isEqualToEdge:v3] & 1) != 0) {
      goto LABEL_5;
    }
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__2869;
    id v23 = __Block_byref_object_dispose__2870;
    id v24 = 0;
    uint64_t v12 = [v3 label];
    uint64_t v13 = [v3 domain];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_3;
    v15[3] = &unk_1E68DBC60;
    id v16 = v9;
    id v17 = v3;
    id v18 = &v19;
    [v6 enumerateEdgesWithLabel:v12 domain:v13 usingBlock:v15];

    uint64_t v14 = v20[5];
    _Block_object_dispose(&v19, 8);

    if (v14) {
      goto LABEL_5;
    }
  }
  id v10 = [*(id *)(a1 + 40) addEdgeFromBase:v3 sourceNode:v6 targetNode:v9];
  [*(id *)(a1 + 48) addObject:v10];
LABEL_5:

LABEL_7:
}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_3(void *a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  uint64_t v6 = [v8 targetNode];
  int v7 = [v6 isEqualToNode:a1[4]];

  if (v7 && [v8 isEqualToEdge:a1[5]])
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
}

void __106__MAGraph_Merge_Private__mergeWithGraph_strictNodes_strictEdges_saveToDatabase_createdNodes_createdEdges___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setObject:v5 forKey:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (void)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 createdNodes:(id *)a6 createdEdges:(id *)a7
{
}

- (id)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5 saveToDatabase:(BOOL)a6
{
  id v8 = 0;
  [(MAGraph *)self mergeWithGraph:a3 strictNodes:a4 strictEdges:a5 saveToDatabase:a6 createdNodes:&v8 createdEdges:0];
  id v6 = v8;
  return v6;
}

- (id)mergeWithGraph:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5
{
  return [(MAGraph *)self mergeWithGraph:a3 strictNodes:a4 strictEdges:a5 saveToDatabase:1];
}

+ (MAGraph)graphWithMergedGraphs:(id)a3 strictNodes:(BOOL)a4 strictEdges:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a1 graph];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (id)objc_msgSend(v9, "mergeWithGraph:strictNodes:strictEdges:", *(void *)(*((void *)&v17 + 1) + 8 * i), v6, v5, (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (MAGraph *)v9;
}

- (void)persistWeight:(float)a3 forEdgeWithIdentifier:(unint64_t)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(KGGraph *)self->_graph edgeForIdentifier:a4];
  [v6 weight];
  float v8 = v7;
  uint64_t v9 = objc_alloc_init(KGGraphChangeRequest);
  id v27 = @"__weight";
  double v10 = a3;
  uint64_t v11 = [[KGDoublePropertyValue alloc] initWithValue:v10];
  v28[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [(KGGraphChangeRequest *)v9 updateEdge:v6 newProperties:v12];

  graph = self->_graph;
  id v16 = 0;
  LOBYTE(v12) = [(KGMutableGraph *)graph performChangesAndWait:v9 error:&v16];
  id v14 = v16;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v6 identifier];
      *(_DWORD *)buf = 138413314;
      long long v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      double v22 = v8;
      __int16 v23 = 2048;
      double v24 = v10;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting weight for edge(%@) identifier(%lu) old weight(%f) new weight(%f) error(%@)", buf, 0x34u);
    }
    [(MAGraph *)self setHadFatalError];
  }
}

- (void)persistWeight:(float)a3 forNodeWithIdentifier:(unint64_t)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(KGGraph *)self->_graph nodeForIdentifier:a4];
  [v6 weight];
  float v8 = v7;
  uint64_t v9 = objc_alloc_init(KGGraphChangeRequest);
  id v27 = @"__weight";
  double v10 = a3;
  uint64_t v11 = [[KGDoublePropertyValue alloc] initWithValue:v10];
  v28[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [(KGGraphChangeRequest *)v9 updateNode:v6 newProperties:v12];

  graph = self->_graph;
  id v16 = 0;
  LOBYTE(v12) = [(KGMutableGraph *)graph performChangesAndWait:v9 error:&v16];
  id v14 = v16;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v6 identifier];
      *(_DWORD *)buf = 138413314;
      long long v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v15;
      __int16 v21 = 2048;
      double v22 = v8;
      __int16 v23 = 2048;
      double v24 = v10;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting weight for node(%@) identifier(%lu) old weight(%f) new weight(%f) error(%@)", buf, 0x34u);
    }
    [(MAGraph *)self setHadFatalError];
  }
}

- (void)removeModelPropertiesForEdgeWithIdentifier:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(KGGraph *)self->_graph edgeForIdentifier:a3];
  BOOL v5 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v5 updateEdge:v4 newProperties:MEMORY[0x1E4F1CC08]];
  graph = self->_graph;
  id v9 = 0;
  BOOL v7 = [(KGMutableGraph *)graph performChangesAndWait:v5 error:&v9];
  id v8 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting node properties for edge %@", buf, 0xCu);
    }
    [(MAGraph *)self setHadFatalError];
  }
}

- (void)removeModelPropertyForKey:(id)a3 forEdgeWithIdentifier:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  graph = self->_graph;
  id v7 = a3;
  id v8 = [(KGGraph *)graph edgeForIdentifier:a4];
  id v9 = [v8 properties];
  double v10 = (void *)[v9 mutableCopy];

  [v10 removeObjectForKey:v7];
  uint64_t v11 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v11 updateEdge:v8 newProperties:v10];
  uint64_t v12 = self->_graph;
  id v15 = 0;
  BOOL v13 = [(KGMutableGraph *)v12 performChangesAndWait:v11 error:&v15];
  id v14 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v17 = v8;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting edge properties for node %@", buf, 0xCu);
    }
    [(MAGraph *)self setHadFatalError];
  }
}

- (void)persistModelProperties:(id)a3 forEdgeWithIdentifier:(unint64_t)a4 clobberExisting:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = +[KGPropertyValue kgPropertiesWithMAProperties:a3];
  if (v8)
  {
    id v9 = (void *)v8;
    double v10 = [(KGGraph *)self->_graph edgeForIdentifier:a4];
    uint64_t v11 = v10;
    if (!a5)
    {
      uint64_t v12 = [v10 properties];
      BOOL v13 = (void *)[v12 mutableCopy];

      [v13 addEntriesFromDictionary:v9];
      id v9 = v13;
    }
    id v14 = objc_alloc_init(KGGraphChangeRequest);
    [(KGGraphChangeRequest *)v14 updateEdge:v11 newProperties:v9];
    graph = self->_graph;
    id v18 = 0;
    BOOL v16 = [(KGMutableGraph *)graph performChangesAndWait:v14 error:&v18];
    id v17 = v18;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v11;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting edge properties for edge %@", buf, 0xCu);
      }
      [(MAGraph *)self setHadFatalError];
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = 0;
    __int16 v21 = 2112;
    double v22 = v9;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting edge properties %@ for edge with identifier %@", buf, 0x16u);
LABEL_9:
  }
}

- (void)persistModelProperty:(id)a3 forKey:(id)a4 forEdgeWithIdentifier:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = +[KGPropertyValue kgPropertyValueWithMAPropertyValue:v8];
  if (v10)
  {
    uint64_t v11 = [(KGGraph *)self->_graph edgeForIdentifier:a5];
    uint64_t v12 = [v11 properties];
    BOOL v13 = (void *)[v12 mutableCopy];

    [v13 setObject:v10 forKeyedSubscript:v9];
    id v14 = objc_alloc_init(KGGraphChangeRequest);
    [(KGGraphChangeRequest *)v14 updateEdge:v11 newProperties:v13];
    graph = self->_graph;
    id v19 = 0;
    BOOL v16 = [(KGMutableGraph *)graph performChangesAndWait:v14 error:&v19];
    id v17 = v19;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting edge property for edge %@", buf, 0xCu);
      }
      [(MAGraph *)self setHadFatalError];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = [NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting edge property %@ for edge with identifier %@", buf, 0x16u);
  }
}

- (void)removeModelPropertiesForNodeWithIdentifier:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(KGGraph *)self->_graph nodeForIdentifier:a3];
  BOOL v5 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v5 updateNode:v4 newProperties:MEMORY[0x1E4F1CC08]];
  graph = self->_graph;
  id v9 = 0;
  BOOL v7 = [(KGMutableGraph *)graph performChangesAndWait:v5 error:&v9];
  id v8 = v9;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error removing node properties for node %@", buf, 0xCu);
    }
    [(MAGraph *)self setHadFatalError];
  }
}

- (void)removeModelPropertyForKey:(id)a3 forNodeWithIdentifier:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  graph = self->_graph;
  id v7 = a3;
  id v8 = [(KGGraph *)graph nodeForIdentifier:a4];
  id v9 = [v8 properties];
  double v10 = (void *)[v9 mutableCopy];

  [v10 removeObjectForKey:v7];
  uint64_t v11 = objc_alloc_init(KGGraphChangeRequest);
  [(KGGraphChangeRequest *)v11 updateNode:v8 newProperties:v10];
  uint64_t v12 = self->_graph;
  id v15 = 0;
  BOOL v13 = [(KGMutableGraph *)v12 performChangesAndWait:v11 error:&v15];
  id v14 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error removing node property for node %@", buf, 0xCu);
    }
    [(MAGraph *)self setHadFatalError];
  }
}

- (void)persistModelProperties:(id)a3 forNodeWithIdentifier:(unint64_t)a4 clobberExisting:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = +[KGPropertyValue kgPropertiesWithMAProperties:a3];
  if (v8)
  {
    id v9 = (void *)v8;
    double v10 = [(KGGraph *)self->_graph nodeForIdentifier:a4];
    uint64_t v11 = v10;
    if (!a5)
    {
      uint64_t v12 = [v10 properties];
      BOOL v13 = (void *)[v12 mutableCopy];

      [v13 addEntriesFromDictionary:v9];
      id v9 = v13;
    }
    id v14 = objc_alloc_init(KGGraphChangeRequest);
    [(KGGraphChangeRequest *)v14 updateNode:v11 newProperties:v9];
    graph = self->_graph;
    id v18 = 0;
    BOOL v16 = [(KGMutableGraph *)graph performChangesAndWait:v14 error:&v18];
    id v17 = v18;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v11;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting node properties for node %@", buf, 0xCu);
      }
      [(MAGraph *)self setHadFatalError];
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = 0;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting node properties %@ for node with identifier %@", buf, 0x16u);
LABEL_9:
  }
}

- (void)persistModelProperty:(id)a3 forKey:(id)a4 forNodeWithIdentifier:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = +[KGPropertyValue kgPropertyValueWithMAPropertyValue:v8];
  if (v10)
  {
    uint64_t v11 = [(KGGraph *)self->_graph nodeForIdentifier:a5];
    uint64_t v12 = [v11 properties];
    BOOL v13 = (void *)[v12 mutableCopy];

    [v13 setObject:v10 forKeyedSubscript:v9];
    id v14 = objc_alloc_init(KGGraphChangeRequest);
    [(KGGraphChangeRequest *)v14 updateNode:v11 newProperties:v13];
    graph = self->_graph;
    id v19 = 0;
    BOOL v16 = [(KGMutableGraph *)graph performChangesAndWait:v14 error:&v19];
    id v17 = v19;
    if (!v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting node property for node %@", buf, 0xCu);
      }
      [(MAGraph *)self setHadFatalError];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = [NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error persisting node property %@ for node with identifier %@", buf, 0x16u);
  }
}

- (BOOL)compareWithPersistedState
{
  return 1;
}

- (BOOL)copyPersistentStoreToURL:(id)a3 error:(id *)a4
{
  graph = self->_graph;
  id v6 = a3;
  id v7 = [(KGStoredGraph *)graph store];
  LOBYTE(a4) = [v7 copyToURL:v6 error:a4];

  return (char)a4;
}

- (void)closePersistentStore
{
  id v3 = [(KGStoredGraph *)self->_graph store];
  [v3 close];

  graph = self->_graph;
  self->_graph = 0;
}

- (BOOL)migratePersistentStoreToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KGStoredGraph *)self->_graph store];
  id v8 = [v7 url];

  id v9 = [(KGStoredGraph *)self->_graph store];
  [v9 close];

  graph = self->_graph;
  self->_graph = 0;

  if ([(id)objc_opt_class() migratePersistentStoreFromURL:v8 toURL:v6 error:a4])
  {
    uint64_t v11 = [(MAGraph *)self _instantiateGraphWithStoreAtURL:v6 error:a4];
    uint64_t v12 = self->_graph;
    self->_graph = v11;

    BOOL v13 = self->_graph != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)savePersistentStore
{
  return 1;
}

- (void)unloadDomains:(id)a3
{
  id v5 = a3;
  KGMethodNotImplentedException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)unloadEdge:(id)a3
{
  id v5 = a3;
  KGMethodNotImplentedException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)loadDomains:(id)a3
{
  id v5 = a3;
  KGMethodNotImplentedException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)databaseURL
{
  id v2 = [(KGStoredGraph *)self->_graph store];
  id v3 = [v2 url];

  return v3;
}

- (MAGraph)initWithSpecification:(id)a3 persistenceStoreURL:(id)a4 progressReporter:(id)a5
{
  return [(MAGraph *)self initWithSpecification:a3 persistenceStoreURL:a4 error:0];
}

- (MAGraph)initWithSpecification:(id)a3 persistenceStoreURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(MAGraph *)self initWithSpecification:a3];
  double v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(MAGraph *)v9 _instantiateGraphWithStoreAtURL:v8 error:a5];
    graph = v10->_graph;
    v10->_graph = (KGStoredGraph *)v11;

    if (!v10->_graph)
    {

      double v10 = 0;
    }
  }

  return v10;
}

- (MAGraph)initWithPersistentStoreURL:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(id)objc_opt_class() defaultSpecification];
  [v9 setPersistenceOptions:a4];
  double v10 = [(MAGraph *)self initWithSpecification:v9 persistenceStoreURL:v8 error:a5];

  return v10;
}

- (id)_instantiateGraphWithStoreAtURL:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MAKGEntityFactory alloc];
  id v8 = [(MAGraph *)self specification];
  id v9 = [(MAKGEntityFactory *)v7 initWithSpecification:v8];

  double v10 = [[KGDegasGraphStore alloc] initWithURL:v6];
  if ([(MAGraph *)self isReadOnly]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 6;
  }
  if ([(MAGraph *)self usesClassCDataProtection])
  {
    v11 |= 0x10uLL;
  }
  else if ([(MAGraph *)self usesClassBDataProtection])
  {
    v11 |= 0x20uLL;
  }
  else if ([(MAGraph *)self usesClassADataProtection])
  {
    v11 |= 0x40uLL;
  }
  if ([(MAGraph *)self _shouldFail]) {
    uint64_t v12 = v11 | 0x10000;
  }
  else {
    uint64_t v12 = v11;
  }
  id v18 = 0;
  BOOL v13 = [(KGDegasGraphStore *)v10 openWithMode:v12 error:&v18];
  id v14 = v18;
  if (v13)
  {
    id v15 = [[KGStoredGraph alloc] initGraphWithStore:v10 entityFactory:v9];
  }
  else
  {
    BOOL v16 = KGLoggingConnection();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_error_impl(&dword_1D1654000, v16, OS_LOG_TYPE_ERROR, "Opening graph store failed: %@", buf, 0xCu);
    }

    [(MAGraph *)self setHadFatalError];
    id v15 = 0;
    if (a4) {
      *a4 = v14;
    }
  }

  return v15;
}

- (BOOL)_shouldFail
{
  id v2 = [(MAGraph *)self specification];
  unint64_t v3 = ((unint64_t)[v2 persistenceOptions] >> 8) & 1;

  return v3;
}

- (id)edgeFromFetchedRowWithIdentifier:(int)a3 domain:(signed __int16)a4 label:(id)a5 weight:(float)a6 properties:(id)a7 sourceNodeIdentifier:(int)a8 targetNodeIdentifier:(int)a9
{
  id v12 = a5;
  id v13 = a7;
  KGMethodNotImplentedException(self, a2);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v14);
}

- (id)nodeFromFetchedRowWithIdentifier:(int)a3 domain:(signed __int16)a4 label:(id)a5 weight:(float)a6 properties:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  KGMethodNotImplentedException(self, a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

+ (BOOL)destroyPersistentStoreAtURL:(id)a3 error:(id *)a4
{
  return +[KGDegasGraphStore destroyAtURL:a3 error:a4];
}

+ (BOOL)migratePersistentStoreFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDegasGraphStore migrateFromURL:a3 toURL:a4 error:a5];
}

+ (BOOL)copyPersistentStoreFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDegasGraphStore copyFromURL:a3 toURL:a4 error:a5];
}

+ (id)persistentStoreURLWithPath:(id)a3 andName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 persistentStoreFileExtension];
  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];

  id v10 = [v9 URLByAppendingPathComponent:v6];

  id v11 = [v10 URLByAppendingPathExtension:v8];

  return v11;
}

+ (id)persistentStoreFileExtension
{
  return +[KGDegasGraphStore persistentStoreFileExtension];
}

- (BOOL)writeGraphJSONToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MAGraph *)self _graphJSONDictionary];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v9 = [v6 URLByDeletingLastPathComponent];
  id v10 = [v9 path];
  char v11 = [v8 fileExistsAtPath:v10];

  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    id v18 = 0;
    [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v12 = v18;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v6 append:0];
  id v14 = v13;
  if (v12 || !v13)
  {
    if (a4)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      BOOL v16 = [NSString stringWithFormat:@"Cannot write data to URL %@", v6];
      *a4 = [v15 errorWithDescription:v16];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    [v13 open];
    a4 = (id *)[MEMORY[0x1E4F28D90] writeJSONObject:v7 toStream:v14 options:0 error:a4];
    [v14 close];
    if (a4) {
      LOBYTE(a4) = 1;
    }
    else {
      [v8 removeItemAtURL:v6 error:0];
    }
  }

  return (char)a4;
}

- (id)_graphJSONDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MAGraph *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"id"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MAGraph version](self, "version"));
  [v3 setObject:v6 forKey:@"version"];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__MAGraph_File_Private___graphJSONDictionary__block_invoke;
  v17[3] = &unk_1E68DC550;
  id v18 = v7;
  id v8 = v7;
  [(MAGraph *)self enumerateNodesWithBlock:v17];
  [v3 setObject:v8 forKey:@"nodes"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __45__MAGraph_File_Private___graphJSONDictionary__block_invoke_2;
  id v15 = &unk_1E68DCA20;
  id v16 = v9;
  id v10 = v9;
  [(MAGraph *)self enumerateEdgesWithBlock:&v12];
  objc_msgSend(v3, "setObject:forKey:", v10, @"edges", v12, v13, v14, v15);

  return v3;
}

void __45__MAGraph_File_Private___graphJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v14 = objc_alloc_init(v3);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  [v14 setObject:v5 forKey:@"id"];

  id v6 = [v4 label];
  [v14 setObject:v6 forKey:@"name"];

  id v7 = [v4 propertyDictionary];
  [v14 setObject:v7 forKey:@"properties"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  [v14 setObject:v8 forKey:@"domain"];

  id v9 = NSNumber;
  [v4 weight];
  id v10 = objc_msgSend(v9, "numberWithFloat:");
  [v14 setObject:v10 forKey:@"weight"];

  char v11 = NSNumber;
  uint64_t v12 = [v4 domain];

  uint64_t v13 = [v11 numberWithUnsignedShort:v12];
  [v14 setObject:v13 forKey:@"cluster"];

  [*(id *)(a1 + 32) addObject:v14];
}

void __45__MAGraph_File_Private___graphJSONDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v17 = objc_alloc_init(v3);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  [v17 setObject:v5 forKey:@"id"];

  id v6 = [v4 label];
  [v17 setObject:v6 forKey:@"name"];

  id v7 = [v4 propertyDictionary];
  [v17 setObject:v7 forKey:@"properties"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  [v17 setObject:v8 forKey:@"domain"];

  id v9 = NSNumber;
  [v4 weight];
  id v10 = objc_msgSend(v9, "numberWithFloat:");
  [v17 setObject:v10 forKey:@"weight"];

  char v11 = NSNumber;
  uint64_t v12 = [v4 sourceNode];
  uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
  [v17 setObject:v13 forKey:@"source"];

  id v14 = NSNumber;
  id v15 = [v4 targetNode];

  id v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "identifier"));
  [v17 setObject:v16 forKey:@"target"];

  [*(id *)(a1 + 32) addObject:v17];
}

- (MAGraph)initWithGraphJSONURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  KGMethodNotImplentedException(self, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (MAGraph)initWithGraphMLURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  KGMethodNotImplentedException(self, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (MAGraph)initWithDataURL:(id)a3 error:(id *)a4
{
  return [(MAGraph *)self initWithSpecification:0 dataURL:a3 error:a4];
}

- (MAGraph)initWithSpecification:(id)a3 dataURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(MAGraph *)self initWithSpecification:a3];
  if (!v9)
  {
LABEL_5:
    char v11 = v9;
    goto LABEL_10;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v8];
  [v10 open];
  if (v10)
  {
    char v11 = [MEMORY[0x1E4F28F98] propertyListWithStream:v10 options:0 format:0 error:a5];
    [v10 close];
    if (!v11)
    {

      goto LABEL_10;
    }
    [(MAGraph *)v9 _loadWithGraphDictionary:v11];

    goto LABEL_5;
  }
  uint64_t v12 = +[MALogging sharedLogging];
  uint64_t v13 = [v12 loggingConnection];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v15 = 0;
    _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "Bad data URL", v15, 2u);
  }

  char v11 = 0;
LABEL_10:

  return v11;
}

- (void)_loadWithGraphDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v43 = v4;
  obuint64_t j = [v4 objectForKey:@"nodes"];
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        char v11 = [v10 objectForKey:@"label"];
        uint64_t v12 = [v10 objectForKey:@"domain"];
        unsigned __int16 v13 = [v12 unsignedIntegerValue];

        id v14 = [v10 objectForKey:@"weight"];
        [v14 floatValue];
        int v16 = v15;

        id v17 = [v10 objectForKey:@"properties"];
        LODWORD(v18) = v16;
        id v19 = [(MAGraph *)self addNodeWithLabel:v11 domain:v13 weight:v17 properties:v18];
        id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier"));
        uint64_t v21 = [v10 objectForKeyedSubscript:@"identifier"];
        [v5 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v7);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v44 = [v43 objectForKey:@"edges"];
  uint64_t v22 = [v44 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id obja = *(id *)v48;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(id *)v48 != obja) {
          objc_enumerationMutation(v44);
        }
        __int16 v25 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        id v26 = [v25 objectForKey:@"sourceNodeIdentifier"];
        id v27 = [v5 objectForKeyedSubscript:v26];
        uint64_t v28 = [v27 unsignedIntegerValue];

        id v29 = [v25 objectForKey:@"targetNodeIdentifier"];
        BOOL v30 = [v5 objectForKeyedSubscript:v29];
        uint64_t v31 = [v30 unsignedIntegerValue];

        long long v32 = [v25 objectForKey:@"label"];
        long long v33 = [v25 objectForKey:@"domain"];
        unsigned __int16 v34 = [v33 unsignedIntegerValue];

        long long v35 = [v25 objectForKey:@"weight"];
        [v35 floatValue];
        int v37 = v36;

        v38 = [v25 objectForKey:@"properties"];
        id v39 = [(MAGraph *)self nodeForIdentifier:v28];
        uint64_t v40 = [(MAGraph *)self nodeForIdentifier:v31];
        LODWORD(v41) = v37;
        id v42 = [(MAGraph *)self addEdgeWithLabel:v32 sourceNode:v39 targetNode:v40 domain:v34 weight:v38 properties:v41];
      }
      uint64_t v23 = [v44 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v23);
  }
}

- (BOOL)writeDataToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MAGraph *)self _graphDictionary];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v9 = [v6 URLByDeletingLastPathComponent];
  id v10 = [v9 path];
  char v11 = [v8 fileExistsAtPath:v10];

  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    id v18 = 0;
    [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v12 = v18;
  }
  unsigned __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v6 append:0];
  id v14 = v13;
  if (v12 || !v13)
  {
    if (a4)
    {
      int v15 = (void *)MEMORY[0x1E4F28C58];
      int v16 = [NSString stringWithFormat:@"Cannot write data to URL %@", v6];
      *a4 = [v15 errorWithDescription:v16];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    [v13 open];
    a4 = (id *)[MEMORY[0x1E4F28F98] writePropertyList:v7 toStream:v14 format:200 options:0 error:a4];
    [v14 close];
    if (a4) {
      LOBYTE(a4) = 1;
    }
    else {
      [v8 removeItemAtURL:v6 error:0];
    }
  }

  return (char)a4;
}

- (id)_graphDictionary
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MAGraph *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"identifier"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MAGraph version](self, "version"));
  [v3 setObject:v6 forKey:@"version"];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__MAGraph_File_Private___graphDictionary__block_invoke;
  v21[3] = &unk_1E68DC550;
  id v22 = v7;
  id v8 = v7;
  [(MAGraph *)self enumerateNodesWithBlock:v21];
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  v23[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

  char v11 = [v8 sortedArrayUsingDescriptors:v10];
  [v3 setObject:v11 forKey:@"nodes"];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __41__MAGraph_File_Private___graphDictionary__block_invoke_2;
  id v19 = &unk_1E68DCA20;
  id v20 = v12;
  id v13 = v12;
  [(MAGraph *)self enumerateEdgesWithBlock:&v16];
  id v14 = objc_msgSend(v13, "sortedArrayUsingDescriptors:", v10, v16, v17, v18, v19);
  [v3 setObject:v14 forKey:@"edges"];

  return v3;
}

void __41__MAGraph_File_Private___graphDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v14 = objc_alloc_init(v3);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  [v14 setObject:v5 forKey:@"identifier"];

  id v6 = [v4 label];
  [v14 setObject:v6 forKey:@"label"];

  id v7 = [v4 propertyDictionary];
  [v14 setObject:v7 forKey:@"properties"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  [v14 setObject:v8 forKey:@"domain"];

  id v9 = NSNumber;
  [v4 weight];
  int v11 = v10;

  LODWORD(v12) = v11;
  id v13 = [v9 numberWithFloat:v12];
  [v14 setObject:v13 forKey:@"weight"];

  [*(id *)(a1 + 32) addObject:v14];
}

void __41__MAGraph_File_Private___graphDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v17 = objc_alloc_init(v3);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
  [v17 setObject:v5 forKey:@"identifier"];

  id v6 = [v4 label];
  [v17 setObject:v6 forKey:@"label"];

  id v7 = [v4 propertyDictionary];
  [v17 setObject:v7 forKey:@"properties"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "domain"));
  [v17 setObject:v8 forKey:@"domain"];

  id v9 = NSNumber;
  [v4 weight];
  int v10 = objc_msgSend(v9, "numberWithFloat:");
  [v17 setObject:v10 forKey:@"weight"];

  int v11 = NSNumber;
  double v12 = [v4 sourceNode];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
  [v17 setObject:v13 forKey:@"sourceNodeIdentifier"];

  id v14 = NSNumber;
  int v15 = [v4 targetNode];

  uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "identifier"));
  [v17 setObject:v16 forKey:@"targetNodeIdentifier"];

  [*(id *)(a1 + 32) addObject:v17];
}

+ (id)graphJSONURLWithPath:(id)a3 andName:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a4;
  id v7 = [v5 fileURLWithPath:a3];
  id v8 = [v7 URLByAppendingPathComponent:v6];

  id v9 = [v8 URLByAppendingPathExtension:@"json"];

  return v9;
}

+ (id)graphMLURLWithPath:(id)a3 andName:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a4;
  id v7 = [v5 fileURLWithPath:a3];
  id v8 = [v7 URLByAppendingPathComponent:v6];

  id v9 = [v8 URLByAppendingPathExtension:@"graphml"];

  return v9;
}

- (id)schema:(id)a3
{
  id v4 = a3;
  id v5 = +[MAGraph graph];
  id v6 = [(MAGraph *)self edgesLabels];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__MAGraph_Schema_Private__schema___block_invoke;
  v14[3] = &unk_1E68DC868;
  v14[4] = self;
  id v15 = v4;
  id v16 = v7;
  id v8 = v5;
  id v17 = v8;
  id v9 = v7;
  id v10 = v4;
  [v6 enumerateObjectsUsingBlock:v14];
  int v11 = v17;
  id v12 = v8;

  return v12;
}

void __34__MAGraph_Schema_Private__schema___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v73 = a2;
  v67 = objc_msgSend(*(id *)(a1 + 32), "edgesForLabel:");
  [v67 valueForKeyPath:@"domain"];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v68 = [obj countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v92;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v92 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v3;
        id v4 = *(void **)(*((void *)&v91 + 1) + 8 * v3);
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __34__MAGraph_Schema_Private__schema___block_invoke_2;
        v90[3] = &unk_1E68DC840;
        v75 = v4;
        v90[4] = v4;
        id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v90];
        id v6 = [v67 filteredSetUsingPredicate:v5];

        v80 = [MEMORY[0x1E4F1CA80] set];
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v72 = v6;
        uint64_t v7 = [v72 countByEnumeratingWithState:&v86 objects:v105 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v78 = *(void *)v87;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v87 != v78) {
                objc_enumerationMutation(v72);
              }
              id v10 = *(void **)(*((void *)&v86 + 1) + 8 * i);
              int v11 = [v10 sourceNode];
              id v12 = [v10 targetNode];
              id v13 = [v11 label];
              v104[0] = v13;
              id v14 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v11, "domain"));
              v104[1] = v14;
              id v15 = [v12 label];
              v104[2] = v15;
              id v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v12, "domain"));
              v104[3] = v16;
              id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:4];
              [v80 addObject:v17];
            }
            uint64_t v8 = [v72 countByEnumeratingWithState:&v86 objects:v105 count:16];
          }
          while (v8);
        }

        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v71 = v80;
        uint64_t v76 = [v71 countByEnumeratingWithState:&v82 objects:v103 count:16];
        if (v76)
        {
          uint64_t v74 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v76; ++j)
            {
              if (*(void *)v83 != v74) {
                objc_enumerationMutation(v71);
              }
              id v19 = *(void **)(*((void *)&v82 + 1) + 8 * j);
              uint64_t v20 = [v19 objectAtIndexedSubscript:0];
              uint64_t v21 = [v19 objectAtIndexedSubscript:1];
              uint64_t v22 = [v21 unsignedShortValue];

              v81 = [v19 objectAtIndexedSubscript:2];
              uint64_t v23 = [v19 objectAtIndexedSubscript:3];
              uint64_t v24 = [v23 unsignedShortValue];

              v79 = (void *)v20;
              __int16 v25 = [NSString stringWithFormat:@"NODE %@ %u", v20, v22];
              id v26 = *(void **)(a1 + 40);
              if (v26 && ([v26 containsIndex:v22] & 1) != 0)
              {
                BOOL v27 = 0;
              }
              else
              {
                uint64_t v28 = [*(id *)(a1 + 32) nodesForDomain:v22];
                id v29 = [v28 valueForKeyPath:@"label"];

                unint64_t v30 = [v29 count];
                BOOL v27 = v30 > 1;
                if (v30 >= 2)
                {
                  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"NODE %u", v22);

                  __int16 v25 = (void *)v31;
                }
              }
              long long v32 = [*(id *)(a1 + 48) objectForKey:v25];
              if (!v32)
              {
                long long v33 = *(void **)(a1 + 56);
                if (v27)
                {
                  uint64_t v34 = [v33 nodesCountForLabel:0 domain:v22 properties:MEMORY[0x1E4F1CC08]];
                  long long v35 = *(void **)(a1 + 56);
                  v101 = @"cid";
                  int v36 = [NSNumber numberWithUnsignedInteger:v34];
                  v102 = v36;
                  int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
                  LODWORD(v38) = 1.0;
                  [v35 addUniqueNodeWithLabel:0 domain:v22 weight:v37 properties:0 didCreate:v38];
                }
                else
                {
                  uint64_t v39 = [v33 nodesCountForLabel:v79 domain:v22 properties:MEMORY[0x1E4F1CC08]];
                  uint64_t v40 = *(void **)(a1 + 56);
                  v99 = @"cid";
                  int v36 = [NSNumber numberWithUnsignedInteger:v39];
                  v100 = v36;
                  int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                  LODWORD(v41) = 1.0;
                  [v40 addNodeWithLabel:v79 domain:v22 weight:v37 properties:v41];
                long long v32 = };

                [*(id *)(a1 + 48) setObject:v32 forKey:v25];
              }
              id v42 = [NSString stringWithFormat:@"NODE %@ %u", v81, v24];
              v43 = *(void **)(a1 + 40);
              v77 = v25;
              if (v43 && ([v43 containsIndex:v24] & 1) != 0)
              {
                BOOL v44 = 0;
              }
              else
              {
                v45 = [*(id *)(a1 + 32) nodesForDomain:v24];
                v46 = [v45 valueForKeyPath:@"label"];

                unint64_t v47 = [v46 count];
                BOOL v44 = v47 > 1;
                if (v47 >= 2)
                {
                  uint64_t v48 = objc_msgSend(NSString, "stringWithFormat:", @"NODE %u", v24);

                  id v42 = (void *)v48;
                }
              }
              long long v49 = [*(id *)(a1 + 48) objectForKey:v42];
              int v50 = [v79 isEqualToString:v81];
              if (v22 == v24) {
                int v51 = v50;
              }
              else {
                int v51 = 0;
              }
              if (!v49 || v51)
              {
                long long v53 = *(void **)(a1 + 56);
                if ((!v44 | v51))
                {
                  uint64_t v54 = [v53 nodesCountForLabel:v81 domain:v24 properties:MEMORY[0x1E4F1CC08]];
                  v70 = *(void **)(a1 + 56);
                  v95 = @"cid";
                  v55 = [NSNumber numberWithUnsignedInteger:v54];
                  v96 = v55;
                  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
                  LODWORD(v57) = 1.0;
                  [v70 addNodeWithLabel:v81 domain:v24 weight:v56 properties:v57];
                }
                else
                {
                  uint64_t v58 = [v53 nodesCountForLabel:0 domain:v24 properties:MEMORY[0x1E4F1CC08]];
                  v59 = *(void **)(a1 + 56);
                  v97 = @"cid";
                  v55 = [NSNumber numberWithUnsignedInteger:v58];
                  v98 = v55;
                  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
                  LODWORD(v60) = 1.0;
                  [v59 addUniqueNodeWithLabel:0 domain:v24 weight:v56 properties:0 didCreate:v60];
                long long v52 = };

                if ((v51 & 1) == 0) {
                  [*(id *)(a1 + 48) setObject:v52 forKey:v42];
                }
              }
              else
              {
                long long v52 = v49;
              }
              v61 = *(void **)(a1 + 56);
              unsigned __int16 v62 = [v75 intValue];
              LODWORD(v63) = 1.0;
              id v64 = (id)[v61 addUniqueEdgeWithLabel:v73 sourceNode:v32 targetNode:v52 domain:v62 weight:MEMORY[0x1E4F1CC08] properties:v63];
            }
            uint64_t v76 = [v71 countByEnumeratingWithState:&v82 objects:v103 count:16];
          }
          while (v76);
        }

        uint64_t v3 = v69 + 1;
      }
      while (v69 + 1 != v68);
      uint64_t v68 = [obj countByEnumeratingWithState:&v91 objects:v106 count:16];
    }
    while (v68);
  }
}

BOOL __34__MAGraph_Schema_Private__schema___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = [a2 domain];
  return v3 == (unsigned __int16)[*(id *)(a1 + 32) intValue];
}

- (BOOL)conformsToGraphSchema:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __49__MAGraph_Schema_Private__conformsToGraphSchema___block_invoke;
  id v16 = &unk_1E68DC818;
  id v6 = v4;
  id v17 = v6;
  id v19 = &v21;
  uint64_t v20 = &v25;
  id v7 = v5;
  id v18 = v7;
  [(MAGraph *)self enumerateNodesWithBlock:&v13];
  uint64_t v8 = objc_msgSend(v7, "count", v13, v14, v15, v16);
  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v7;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not verified nodes:%@\n", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v9 = (void *)v26[3];
    *(_DWORD *)buf = 134217984;
    id v30 = v9;
    _os_log_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Verified %lu nodes", buf, 0xCu);
  }
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *((unsigned char *)v22 + 24) == 0;
  }
  BOOL v11 = !v10;
  *((unsigned char *)v22 + 24) = v11;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __49__MAGraph_Schema_Private__conformsToGraphSchema___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 label];
  uint64_t v8 = objc_msgSend(v6, "nodesForLabel:domain:", v7, objc_msgSend(v5, "domain"));
  id v9 = [v8 anyObject];

  if (!v9)
  {
    id v12 = objc_msgSend(*(id *)(a1 + 32), "nodesForDomain:", objc_msgSend(v5, "domain"));
    id v9 = [v12 anyObject];

    uint64_t v13 = [v9 label];
    char v14 = [v13 isEqualToString:@"*"];

    if (v14)
    {
      if (v9) {
        goto LABEL_2;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 40) addObject:v5];
    id v9 = 0;
    goto LABEL_10;
  }
LABEL_2:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 conformsToNodeSchema:v9];
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v10 = nodePrintableSchema(v5, @"REAL_NODE");
    BOOL v11 = nodePrintableSchema(v9, @"DEFINITION_NODE");
    int v15 = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to verify:\n%@\n%@\n", (uint8_t *)&v15, 0x16u);
  }
LABEL_10:
}

- (id)edgeSchemeWithLabel:(id)a3 domain:(unsigned __int16)a4 sourceNode:(id)a5 targetNode:(id)a6
{
  uint64_t v8 = a4;
  BOOL v10 = (__CFString *)a3;
  if (!v10)
  {
    BOOL v10 = @"*";
    id v12 = @"*";
  }
  LODWORD(v11) = 1.0;
  uint64_t v13 = [(MAGraph *)self addUniqueEdgeWithLabel:v10 sourceNode:a5 targetNode:a6 domain:v8 weight:MEMORY[0x1E4F1CC08] properties:v11];

  return v13;
}

- (id)nodeSchemeWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = (__CFString *)a3;
  if (!v6)
  {
    id v6 = @"*";
    uint64_t v8 = @"*";
  }
  LODWORD(v7) = 1.0;
  id v9 = [(MAGraph *)self addUniqueNodeWithLabel:v6 domain:v4 weight:MEMORY[0x1E4F1CC08] properties:0 didCreate:v7];

  return v9;
}

- (id)matchWithDefinitions:(id)a3 constraints:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (v7 && [v7 count])
    {
      id v8 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v7];
      id v9 = +[MASubGraph subGraphWithGraph:self];
      if ([v8 count])
      {
        int v51 = v8;
        id v52 = v6;
        id v46 = v7;
        long long v53 = v9;
        while (1)
        {
          uint64_t v10 = [v8 firstObject];
          if (!v10) {
            break;
          }
          double v11 = (void *)v10;
          id v12 = [(MAGraph *)self selectBestRootNodeForPath:v10 withDefinitions:v6];
          if (!v12) {
            goto LABEL_39;
          }
          uint64_t v13 = v12;
          char v14 = [v12 label];
          int v15 = [v6 objectForKey:v14];

          if (![v15 count])
          {

LABEL_39:
            break;
          }
          unint64_t v47 = v11;
          id v16 = [MEMORY[0x1E4F1CA80] set];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          obuint64_t j = v15;
          uint64_t v17 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v60 != v19) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                uint64_t v22 = -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", [v21 identifier]);
                if ([v22 isEqualToNode:v21]
                  && (uint64_t v23 = [v22 edgesCount], v23 == objc_msgSend(v21, "edgesCount")))
                {
                  char v24 = [MEMORY[0x1E4F1CAD0] setWithObject:v21];
                }
                else
                {
                  uint64_t v25 = [v21 label];
                  if ([v25 isEqualToString:@"*"])
                  {

                    uint64_t v25 = 0;
                  }
                  uint64_t v26 = [v21 domain];
                  uint64_t v27 = [v21 propertyDictionary];
                  char v24 = [(MAGraph *)self nodesForLabel:v25 domain:v26 properties:v27];
                }
                [v16 unionSet:v24];
              }
              uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
            }
            while (v18);
          }

          uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v48 = v16;
          uint64_t v29 = [v48 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v50 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v56 != v50) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v32 = *(void *)(*((void *)&v55 + 1) + 8 * j);
                long long v33 = (void *)MEMORY[0x1D25FA040]();
                uint64_t v34 = [MEMORY[0x1E4F1CA80] set];
                long long v35 = (void *)MEMORY[0x1E4F1CA48];
                v65[0] = @"node";
                v65[1] = @"label";
                v66[0] = v32;
                int v36 = [v13 label];
                v66[1] = v36;
                int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
                double v38 = [v35 arrayWithObject:v37];

                uint64_t v39 = [v51 array];
                LODWORD(v37) = [(MAGraph *)self _matchNode:v32 usingAbstractNode:v13 fromEdge:0 atIteration:0 withDefinitions:v52 constraints:v39 unusedConstraints:v34 andSubGraph:v53 matchingNodeQueue:v38];

                if (v37)
                {
                  uint64_t v40 = [v13 label];
                  [v53 _addNode:v32 withName:v40];
                }
                if ([v28 count]) {
                  [v28 intersectSet:v34];
                }
                else {
                  [v28 unionSet:v34];
                }
              }
              uint64_t v30 = [v48 countByEnumeratingWithState:&v55 objects:v67 count:16];
            }
            while (v30);
          }

          id v8 = v51;
          [v51 intersectSet:v28];

          id v6 = v52;
          id v9 = v53;
          id v7 = v46;
          if (![v51 count]) {
            goto LABEL_35;
          }
        }
        id v41 = 0;
      }
      else
      {
LABEL_35:
        id v41 = v9;
      }
    }
    else
    {
      id v42 = +[MASubGraph subGraphWithGraph:self];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke;
      v63[3] = &unk_1E68DC980;
      v63[4] = self;
      id v43 = v42;
      id v64 = v43;
      [v6 enumerateKeysAndObjectsUsingBlock:v63];
      BOOL v44 = v64;
      id v8 = v43;

      id v41 = v8;
    }
  }
  else
  {
    id v41 = 0;
  }

  return v41;
}

void __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        char v12 = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          id v13 = v10;
          char v14 = [v13 label];
          if ([v14 isEqualToString:@"*"])
          {

            char v14 = 0;
          }
          int v15 = *(void **)(a1 + 32);
          uint64_t v16 = [v13 domain];
          uint64_t v17 = [v13 propertyDictionary];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_2;
          v27[3] = &unk_1E68DC930;
          id v28 = *(id *)(a1 + 40);
          id v29 = v5;
          [v15 enumerateNodesWithLabel:v14 domain:v16 properties:v17 usingBlock:v27];
          uint64_t v19 = &v29;
          uint64_t v18 = &v28;
        }
        else
        {
          if ((v12 & 1) == 0) {
            continue;
          }
          id v20 = v10;
          char v14 = [v20 label];
          if ([v14 isEqualToString:@"*"])
          {

            char v14 = 0;
          }
          uint64_t v21 = *(void **)(a1 + 32);
          uint64_t v22 = [v20 domain];
          uint64_t v17 = [v20 propertyDictionary];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_3;
          v24[3] = &unk_1E68DC958;
          id v25 = *(id *)(a1 + 40);
          id v26 = v5;
          [v21 enumerateEdgesWithLabel:v14 domain:v22 properties:v17 usingBlock:v24];
          uint64_t v19 = &v26;
          uint64_t v18 = &v25;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
}

uint64_t __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addNode:a2 withName:*(void *)(a1 + 40)];
}

uint64_t __65__MAGraph_QueryInternal__matchWithDefinitions_constraints_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addEdge:a2 withName:*(void *)(a1 + 40)];
}

- (id)matchWithVisualString:(id)a3 error:(id *)a4
{
  return [(MAGraph *)self matchWithVisualFormat:a3 elements:MEMORY[0x1E4F1CC08] error:a4];
}

- (id)matchWithVisualFormat:(id)a3 elements:(id)a4 error:(id *)a5
{
  char v24 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  context = (void *)MEMORY[0x1D25FA040]();
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = [v6 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        char v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, v24);
        int v36 = v14;
        int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        [v7 setObject:v15 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }

  id v30 = 0;
  id v31 = v7;
  id v29 = 0;
  int v16 = [(id)objc_opt_class() scanMatchString:v27 definitions:&v31 constraints:&v30 forCreation:0 error:&v29];
  id v17 = v31;

  id v18 = v30;
  id v19 = v29;
  id v20 = v19;
  if (v16)
  {
    id v28 = v19;
    uint64_t v21 = [(MAGraph *)v24 matchWithDefinitions:v17 constraints:v18 error:&v28];
    id v22 = v28;

    id v20 = v22;
  }
  else
  {
    uint64_t v21 = 0;
  }

  if (a5) {
    *a5 = v20;
  }

  return v21;
}

- (id)selectBestRootNodeForPath:(id)a3 withDefinitions:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sourceNode];
  uint64_t v9 = [v8 label];
  uint64_t v10 = [v7 objectForKey:v9];

  v45 = v6;
  uint64_t v11 = [v6 targetNode];
  char v12 = [v11 label];
  BOOL v44 = v7;
  long long v49 = [v7 objectForKey:v12];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v13)
  {
    unint64_t v15 = 0;
    unint64_t v51 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  unint64_t v15 = 0;
  unint64_t v51 = 0;
  uint64_t v16 = *(void *)v57;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v57 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      uint64_t v19 = [v18 edgesCount];
      id v20 = [v18 graphReference];

      if (!v20) {
        goto LABEL_13;
      }
      uint64_t v21 = -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", [v18 identifier]);
      if (([v21 isEqualToNode:v18] & 1) == 0)
      {

LABEL_13:
        id v25 = [v18 label];
        if ([v25 isEqualToString:@"*"])
        {

          id v25 = 0;
        }
        uint64_t v26 = [v18 domain];
        id v27 = [v18 propertyDictionary];
        v51 += [(MAGraph *)self nodesCountForLabel:v25 domain:v26 properties:v27];

        goto LABEL_16;
      }
      uint64_t v22 = [v21 edgesCount];
      uint64_t v23 = [v18 edgesCount];

      unint64_t v24 = v51;
      if (v22 == v23) {
        unint64_t v24 = v51 + 1;
      }
      unint64_t v51 = v24;
      if (v22 != v23) {
        goto LABEL_13;
      }
LABEL_16:
      v15 += v19;
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  }
  while (v14);
LABEL_20:

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v46 = v49;
  uint64_t v50 = [v46 countByEnumeratingWithState:&v52 objects:v60 count:16];
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  if (v50)
  {
    uint64_t v48 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v53 != v48) {
          objc_enumerationMutation(v46);
        }
        id v31 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        uint64_t v32 = [v31 edgesCount];
        long long v33 = [v31 graphReference];

        if (v33)
        {
          long long v34 = -[MAGraph nodeForIdentifier:](self, "nodeForIdentifier:", [v31 identifier]);
          if ([v34 isEqualToNode:v31])
          {
            uint64_t v35 = [v34 edgesCount];
            uint64_t v36 = [v31 edgesCount];

            if (v35 == v36)
            {
              ++v28;
              goto LABEL_33;
            }
          }
          else
          {
          }
        }
        int v37 = [v31 label];
        if ([v37 isEqualToString:@"*"])
        {

          int v37 = 0;
        }
        uint64_t v38 = [v31 domain];
        uint64_t v39 = [v31 propertyDictionary];
        v28 += [(MAGraph *)self nodesCountForLabel:v37 domain:v38 properties:v39];

LABEL_33:
        v29 += v32;
      }
      uint64_t v50 = [v46 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v50);
  }

  if (v51 > v28 || v51 >= v28 && v15 >= v29)
  {
    uint64_t v40 = v45;
    uint64_t v41 = [v45 targetNode];
  }
  else
  {
    uint64_t v40 = v45;
    uint64_t v41 = [v45 sourceNode];
  }
  id v42 = (void *)v41;

  return v42;
}

- (BOOL)_matchNode:(id)a3 usingAbstractNode:(id)a4 fromEdge:(id)a5 atIteration:(unint64_t)a6 withDefinitions:(id)a7 constraints:(id)a8 unusedConstraints:(id)a9 andSubGraph:(id)a10 matchingNodeQueue:(id)a11
{
  uint64_t v257 = *MEMORY[0x1E4F143B8];
  id v167 = a3;
  id v17 = a4;
  id v162 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v124 = a10;
  id v159 = a11;
  id v242 = v19;
  id v21 = v19;
  v153 = self;
  uint64_t v22 = [(MAGraph *)self _constraintAbstractEdgesFromAbstractNode:v17 inConstraints:&v242];
  id v152 = v242;

  v166 = v17;
  v125 = v21;
  if (![v22 count])
  {
    [v20 addObjectsFromArray:v21];
    v114 = [v17 label];
    v115 = [v18 objectForKey:v114];

    uint64_t v116 = [v17 hasProperties];
    long long v238 = 0u;
    long long v239 = 0u;
    long long v240 = 0u;
    long long v241 = 0u;
    id v113 = v115;
    uint64_t v117 = [v113 countByEnumeratingWithState:&v238 objects:v256 count:16];
    if (v117)
    {
      uint64_t v118 = v117;
      uint64_t v119 = *(void *)v239;
      while (2)
      {
        for (uint64_t i = 0; i != v118; ++i)
        {
          if (*(void *)v239 != v119) {
            objc_enumerationMutation(v113);
          }
          if ([v167 matchesNode:*(void *)(*((void *)&v238 + 1) + 8 * i) includingProperties:v116])
          {
            BOOL v112 = 1;
            goto LABEL_148;
          }
        }
        uint64_t v118 = [v113 countByEnumeratingWithState:&v238 objects:v256 count:16];
        if (v118) {
          continue;
        }
        break;
      }
      BOOL v112 = 0;
LABEL_148:
      v131 = v113;
      id v17 = v166;
    }
    else
    {
      BOOL v112 = 0;
      v131 = v113;
    }
    goto LABEL_153;
  }
  v131 = objc_opt_new();
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  obuint64_t j = v22;
  uint64_t v130 = [obj countByEnumeratingWithState:&v234 objects:v255 count:16];
  if (v130)
  {
    uint64_t v127 = 0;
    unint64_t v135 = a6 + 1;
    uint64_t v129 = *(void *)v235;
    v123 = v208;
    id v157 = v18;
    id v158 = v20;
    v151 = v22;
LABEL_4:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v235 != v129) {
        objc_enumerationMutation(obj);
      }
      uint64_t v132 = v23;
      unint64_t v24 = *(void **)(*((void *)&v234 + 1) + 8 * v23);
      v133 = (void *)MEMORY[0x1D25FA040]();
      v160 = +[MASubGraph subGraphWithGraph:v153];
      objc_msgSend(v131, "addObject:");
      id v25 = [v24 oppositeNode:v17];
      v172 = v24;
      uint64_t v26 = [v24 label];
      id v27 = [v18 objectForKey:v26];

      v134 = v27;
      if (![v27 count])
      {
        BOOL v62 = 1;
        goto LABEL_127;
      }
      unint64_t v28 = [v25 label];
      unint64_t v29 = [v18 objectForKey:v28];

      v147 = v29;
      if ([v29 count]) {
        break;
      }
      BOOL v62 = 1;
LABEL_126:

LABEL_127:
      if (v62)
      {
        BOOL v112 = 0;
        id v113 = obj;
        goto LABEL_153;
      }
      uint64_t v23 = v132 + 1;
      if (v132 + 1 == v130)
      {
        uint64_t v111 = [obj countByEnumeratingWithState:&v234 objects:v255 count:16];
        uint64_t v130 = v111;
        if (!v111) {
          goto LABEL_144;
        }
        goto LABEL_4;
      }
    }
    unint64_t v30 = [v172 minimum];
    unint64_t v31 = [v172 maximum];
    char v163 = [v172 isDirected];
    uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
    unint64_t v33 = v135;
    id v136 = (id)v31;
    v161 = v25;
    id v165 = v32;
    if (v135 >= v31)
    {
      uint64_t v63 = 0;
    }
    else
    {
      unint64_t v126 = v30;
      long long v233 = 0u;
      long long v232 = 0u;
      long long v231 = 0u;
      long long v230 = 0u;
      id v168 = v134;
      uint64_t v34 = [v168 countByEnumeratingWithState:&v230 objects:v254 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v231;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v231 != v36) {
              objc_enumerationMutation(v168);
            }
            uint64_t v38 = *(void **)(*((void *)&v230 + 1) + 8 * j);
            uint64_t v39 = (void *)MEMORY[0x1D25FA040]();
            uint64_t v40 = [v38 label];
            if ([v40 isEqualToString:@"*"])
            {

              uint64_t v40 = 0;
            }
            char v229 = 0;
            uint64_t v41 = [v38 propertyDictionary];
            if ([v166 hasEdge:v172 isIn:&v229])
            {
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke;
              aBlock[3] = &unk_1E68DC8B8;
              id v223 = v162;
              id v224 = v41;
              id v42 = v167;
              id v225 = v42;
              char v227 = v163;
              char v228 = v229;
              id v226 = v165;
              id v43 = _Block_copy(aBlock);
              objc_msgSend(v42, "enumerateEdgesWithLabel:domain:usingBlock:", v40, objc_msgSend(v38, "domain"), v43);
            }
          }
          uint64_t v35 = [v168 countByEnumeratingWithState:&v230 objects:v254 count:16];
        }
        while (v35);
      }

      if (![v165 count])
      {
        BOOL v62 = 1;
        uint64_t v32 = v165;
        id v17 = v166;
        id v18 = v157;
        uint64_t v22 = v151;
        id v25 = v161;
LABEL_125:

        goto LABEL_126;
      }
      context = [MEMORY[0x1E4F1CA48] array];
      long long v218 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v44 = v125;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v218 objects:v253 count:16];
      id v18 = v157;
      uint64_t v22 = v151;
      id v25 = v161;
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v219;
        do
        {
          for (uint64_t k = 0; k != v46; ++k)
          {
            if (*(void *)v219 != v47) {
              objc_enumerationMutation(v44);
            }
            long long v49 = *(void **)(*((void *)&v218 + 1) + 8 * k);
            if ([v49 containsEdge:v172]) {
              [context addObject:v49];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v218 objects:v253 count:16];
        }
        while (v46);
      }

      v144 = [MEMORY[0x1E4F1CA48] array];
      long long v214 = 0u;
      long long v215 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      id v141 = v165;
      id v169 = (id)[v141 countByEnumeratingWithState:&v214 objects:v252 count:16];
      if (v169)
      {
        uint64_t v139 = 0;
        uint64_t v154 = *(void *)v215;
        do
        {
          for (m = 0; m != v169; m = (char *)m + 1)
          {
            if (*(void *)v215 != v154) {
              objc_enumerationMutation(v141);
            }
            unint64_t v51 = *(void **)(*((void *)&v214 + 1) + 8 * (void)m);
            long long v52 = (void *)MEMORY[0x1D25FA040]();
            long long v53 = [v51 oppositeNode:v167];
            long long v210 = 0u;
            long long v211 = 0u;
            long long v212 = 0u;
            long long v213 = 0u;
            id v54 = v159;
            uint64_t v55 = [v54 countByEnumeratingWithState:&v210 objects:v251 count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              uint64_t v57 = *(void *)v211;
              while (2)
              {
                for (uint64_t n = 0; n != v56; ++n)
                {
                  if (*(void *)v211 != v57) {
                    objc_enumerationMutation(v54);
                  }
                  long long v59 = [*(id *)(*((void *)&v210 + 1) + 8 * n) objectForKeyedSubscript:@"node"];
                  char v60 = [v59 isEqual:v53];

                  if (v60)
                  {

                    id v18 = v157;
                    id v20 = v158;
                    goto LABEL_47;
                  }
                }
                uint64_t v56 = [v54 countByEnumeratingWithState:&v210 objects:v251 count:16];
                if (v56) {
                  continue;
                }
                break;
              }
            }

            id v122 = v54;
            id v18 = v157;
            id v20 = v158;
            if (-[MAGraph _matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:](v153, "_matchNode:usingAbstractNode:fromEdge:atIteration:withDefinitions:constraints:unusedConstraints:andSubGraph:matchingNodeQueue:", v53, v166, v51, v135, v157, context, v158, v160, v122, v123))
            {
              ++v139;
              long long v61 = [v172 label];
              [v160 _addEdge:v51 withName:v61];
            }
            else
            {
LABEL_47:
              [v144 addObject:v51];
            }
            uint64_t v22 = v151;
            id v25 = v161;
          }
          id v169 = (id)[v141 countByEnumeratingWithState:&v214 objects:v252 count:16];
        }
        while (v169);
      }
      else
      {
        uint64_t v139 = 0;
      }

      v207[0] = MEMORY[0x1E4F143A8];
      v207[1] = 3221225472;
      v208[0] = __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_2;
      v208[1] = &unk_1E68DC8E0;
      id v209 = v141;
      [v144 enumerateObjectsUsingBlock:v207];

      uint64_t v32 = v165;
      id v17 = v166;
      unint64_t v33 = v135;
      uint64_t v63 = v139;
      unint64_t v30 = v126;
    }
    if (v33 < v30 || v33 > (unint64_t)v136)
    {
LABEL_122:
      BOOL v62 = v63 == 0;
      uint64_t v110 = v127;
      if (v63) {
        uint64_t v110 = v127 + 1;
      }
      uint64_t v127 = v110;
    }
    else
    {
      uint64_t v140 = v63;
      long long v205 = 0u;
      long long v206 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      id v137 = v134;
      uint64_t v145 = [v137 countByEnumeratingWithState:&v203 objects:v250 count:16];
      if (v145)
      {
        id v142 = *(id *)v204;
        do
        {
          uint64_t v64 = 0;
          do
          {
            if (*(id *)v204 != v142) {
              objc_enumerationMutation(v137);
            }
            v65 = *(void **)(*((void *)&v203 + 1) + 8 * v64);
            contexta = (void *)MEMORY[0x1D25FA040]();
            uint64_t v66 = [v65 label];
            uint64_t v155 = v64;
            if ([v66 isEqualToString:@"*"])
            {

              uint64_t v66 = 0;
            }
            long long v201 = 0u;
            long long v202 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            id v170 = v147;
            uint64_t v67 = [v170 countByEnumeratingWithState:&v199 objects:v249 count:16];
            if (v67)
            {
              uint64_t v68 = v67;
              uint64_t v69 = *(void *)v200;
              do
              {
                for (iuint64_t i = 0; ii != v68; ++ii)
                {
                  if (*(void *)v200 != v69) {
                    objc_enumerationMutation(v170);
                  }
                  id v71 = *(void **)(*((void *)&v199 + 1) + 8 * ii);
                  char v229 = 0;
                  if ([v17 hasEdge:v172 isIn:&v229])
                  {
                    id v72 = v66;
                    id v73 = [v65 propertyDictionary];
                    uint64_t v74 = [v71 graphReference];
                    BOOL v75 = v74 == 0;

                    if (v74) {
                      LOBYTE(v76) = 0;
                    }
                    else {
                      uint64_t v76 = [v71 hasProperties];
                    }
                    v189[0] = MEMORY[0x1E4F143A8];
                    v189[1] = 3221225472;
                    v189[2] = __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_3;
                    v189[3] = &unk_1E68DC908;
                    id v190 = v162;
                    id v191 = v73;
                    id v77 = v167;
                    char v195 = v163;
                    char v196 = v229;
                    BOOL v197 = v75;
                    id v192 = v77;
                    v193 = v71;
                    char v198 = v76;
                    id v194 = v165;
                    id v78 = v73;
                    v79 = _Block_copy(v189);
                    uint64_t v66 = v72;
                    objc_msgSend(v77, "enumerateEdgesWithLabel:domain:usingBlock:", v72, objc_msgSend(v65, "domain"), v79);

                    id v17 = v166;
                  }
                }
                uint64_t v68 = [v170 countByEnumeratingWithState:&v199 objects:v249 count:16];
              }
              while (v68);
            }

            uint64_t v64 = v155 + 1;
            id v20 = v158;
            uint64_t v22 = v151;
          }
          while (v155 + 1 != v145);
          uint64_t v145 = [v137 countByEnumeratingWithState:&v203 objects:v250 count:16];
        }
        while (v145);
      }

      if ([v165 count])
      {
        long long v187 = 0u;
        long long v188 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        id v138 = v165;
        id v18 = v157;
        id v25 = v161;
        uint64_t v146 = [v138 countByEnumeratingWithState:&v185 objects:v248 count:16];
        if (!v146) {
          goto LABEL_121;
        }
        id v143 = *(id *)v186;
        while (1)
        {
          for (juint64_t j = 0; jj != (void *)v146; juint64_t j = (char *)jj + 1)
          {
            if (*(id *)v186 != v143) {
              objc_enumerationMutation(v138);
            }
            v156 = *(void **)(*((void *)&v185 + 1) + 8 * (void)jj);
            v81 = [v156 oppositeNode:v167];
            long long v181 = 0u;
            long long v182 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            id v164 = v147;
            uint64_t v82 = [v164 countByEnumeratingWithState:&v181 objects:v247 count:16];
            if (!v82)
            {
              id v18 = v157;
              id v25 = v161;
              goto LABEL_119;
            }
            uint64_t v83 = v82;
            contextb = jj;
            uint64_t v84 = *(void *)v182;
            while (2)
            {
              for (kuint64_t k = 0; kk != v83; ++kk)
              {
                if (*(void *)v182 != v84) {
                  objc_enumerationMutation(v164);
                }
                long long v86 = *(void **)(*((void *)&v181 + 1) + 8 * kk);
                long long v87 = (void *)MEMORY[0x1D25FA040]();
                long long v88 = [v86 graphReference];

                if (v88)
                {
                  if (![v81 isSameNodeAsNode:v86]) {
                    goto LABEL_106;
                  }
                }
                else if ((objc_msgSend(v81, "matchesNode:includingProperties:", v86, objc_msgSend(v86, "hasProperties")) & 1) == 0)
                {
                  goto LABEL_106;
                }
                id v171 = v87;
                uint64_t v89 = v83;
                long long v179 = 0u;
                long long v180 = 0u;
                long long v177 = 0u;
                long long v178 = 0u;
                id v90 = v159;
                uint64_t v91 = [v90 countByEnumeratingWithState:&v177 objects:v246 count:16];
                if (v91)
                {
                  uint64_t v92 = v91;
                  uint64_t v93 = *(void *)v178;
                  while (2)
                  {
                    for (uint64_t mm = 0; mm != v92; ++mm)
                    {
                      if (*(void *)v178 != v93) {
                        objc_enumerationMutation(v90);
                      }
                      v95 = [*(id *)(*((void *)&v177 + 1) + 8 * mm) objectForKeyedSubscript:@"node"];
                      char v96 = [v95 isEqual:v81];

                      if (v96)
                      {

                        uint64_t v83 = v89;
                        long long v87 = v171;
                        goto LABEL_106;
                      }
                    }
                    uint64_t v92 = [v90 countByEnumeratingWithState:&v177 objects:v246 count:16];
                    if (v92) {
                      continue;
                    }
                    break;
                  }
                }

                v245[0] = v81;
                v244[0] = @"node";
                v244[1] = @"label";
                v97 = [v161 label];
                v245[1] = v97;
                v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v245 forKeys:v244 count:2];
                [v90 addObject:v98];

                LODWORD(v97) = [(MAGraph *)v153 _matchNode:v81 usingAbstractNode:v161 fromEdge:v156 atIteration:0 withDefinitions:v157 constraints:v152 unusedConstraints:v158 andSubGraph:v160 matchingNodeQueue:v90];
                [v90 removeLastObject];
                uint64_t v83 = v89;
                long long v87 = v171;
                if (v97)
                {
                  long long v175 = 0u;
                  long long v176 = 0u;
                  long long v173 = 0u;
                  long long v174 = 0u;
                  id v99 = v90;
                  uint64_t v100 = [v99 countByEnumeratingWithState:&v173 objects:v243 count:16];
                  if (v100)
                  {
                    uint64_t v101 = v100;
                    uint64_t v102 = *(void *)v174;
                    do
                    {
                      for (nuint64_t n = 0; nn != v101; ++nn)
                      {
                        if (*(void *)v174 != v102) {
                          objc_enumerationMutation(v99);
                        }
                        v104 = *(void **)(*((void *)&v173 + 1) + 8 * nn);
                        v105 = [v104 objectForKeyedSubscript:@"node"];
                        v106 = [v104 objectForKeyedSubscript:@"label"];
                        [v160 _addNode:v105 withName:v106 forKeyNode:v81];
                        uint64_t v107 = [v161 label];
                        [v160 _addNode:v81 withName:v107 forKeyNode:v105];
                      }
                      uint64_t v101 = [v99 countByEnumeratingWithState:&v173 objects:v243 count:16];
                    }
                    while (v101);
                  }
                  ++v140;

                  id v25 = v161;
                  v108 = [v161 label];
                  [v160 _addNode:v81 withName:v108];

                  v109 = [v172 label];
                  [v160 _addEdge:v156 withName:v109];

                  id v17 = v166;
                  uint64_t v22 = v151;
                  id v18 = v157;
                  goto LABEL_117;
                }
LABEL_106:
              }
              uint64_t v83 = [v164 countByEnumeratingWithState:&v181 objects:v247 count:16];
              if (v83) {
                continue;
              }
              break;
            }
            id v17 = v166;
            id v18 = v157;
            uint64_t v22 = v151;
            id v25 = v161;
LABEL_117:
            juint64_t j = contextb;
LABEL_119:
          }
          uint64_t v146 = [v138 countByEnumeratingWithState:&v185 objects:v248 count:16];
          if (!v146)
          {
LABEL_121:

            id v20 = v158;
            uint64_t v32 = v165;
            uint64_t v63 = v140;
            goto LABEL_122;
          }
        }
      }
      BOOL v62 = 1;
      id v18 = v157;
      id v25 = v161;
      uint64_t v32 = v165;
    }
    goto LABEL_125;
  }
  uint64_t v127 = 0;
LABEL_144:

  if (v127 == [obj count])
  {
    if ([v131 count] == 1) {
      [v131 firstObject];
    }
    else {
    id v113 = +[MASubGraph subGraphIntersectionsWithSubGraphs:v131];
    }
    [v124 mergeWithSubGraph:v113];
    BOOL v112 = 1;
LABEL_153:

    goto LABEL_154;
  }
  BOOL v112 = 0;
LABEL_154:

  return v112;
}

void __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    if ([v5 hasProperties:*(void *)(a1 + 40)])
    {
      int v3 = [v5 targetNode];
      int v4 = [v3 isSameNodeAsNode:*(void *)(a1 + 48)];

      if (!*(unsigned char *)(a1 + 64) || *(unsigned __int8 *)(a1 + 65) == v4) {
        [*(id *)(a1 + 56) addObject:v5];
      }
    }
  }
}

uint64_t __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

void __144__MAGraph_Query___matchNode_usingAbstractNode_fromEdge_atIteration_withDefinitions_constraints_unusedConstraints_andSubGraph_matchingNodeQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (([v11 isEqual:*(void *)(a1 + 32)] & 1) == 0
    && [v11 hasProperties:*(void *)(a1 + 40)])
  {
    int v3 = [v11 sourceNode];
    int v4 = [v11 targetNode];
    int v5 = [v4 isSameNodeAsNode:*(void *)(a1 + 48)];
    int v6 = v5;
    if (*(unsigned char *)(a1 + 72))
    {
      int v7 = *(unsigned __int8 *)(a1 + 73);
      if (v5) {
        uint64_t v8 = v3;
      }
      else {
        uint64_t v8 = v4;
      }
      id v9 = v8;
      if (v7 != v6) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v5) {
        uint64_t v10 = v3;
      }
      else {
        uint64_t v10 = v4;
      }
      id v9 = v10;
    }
    if (!*(unsigned char *)(a1 + 74)) {
      goto LABEL_24;
    }
    if ([v9 matchesNode:*(void *)(a1 + 56) includingProperties:*(unsigned __int8 *)(a1 + 75)])
    {
LABEL_17:
      [*(id *)(a1 + 64) addObject:v11];
      goto LABEL_18;
    }
    if (!*(unsigned char *)(a1 + 74))
    {
LABEL_24:
      if ([v9 isSameNodeAsNode:*(void *)(a1 + 56)]) {
        goto LABEL_17;
      }
    }
LABEL_18:
  }
}

- (id)_constraintAbstractEdgesFromAbstractNode:(id)a3 inConstraints:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA80] set];
  unint64_t v24 = a4;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *a4;
  uint64_t v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v5, "hasProperties", v24);
        uint64_t v9 = [v7 nodesCount];
        if (!v9)
        {
          char v12 = 0;
LABEL_19:
          [v27 addObject:v7];
          goto LABEL_20;
        }
        unint64_t v10 = v9;
        unint64_t v11 = 0;
        char v12 = 0;
        uint64_t v13 = 1;
        uint64_t v14 = v9;
        while (1)
        {
          unint64_t v15 = v12;
          char v12 = [v7 nodeAtIndex:v11];

          if ([v12 matchesNode:v5 includingProperties:v8]) {
            break;
          }
          ++v11;
          --v14;
          ++v13;
          if (v10 == v11) {
            goto LABEL_19;
          }
        }
        if (!v12) {
          goto LABEL_19;
        }
        if (v11)
        {
          uint64_t v16 = [v7 edgeAtIndex:v11 - 1];
          [v25 addObject:v16];

          id v17 = (void *)[v7 copy];
          if (v11 < v10)
          {
            do
            {
              [v17 removeLastEdge];
              --v14;
            }
            while (v14);
          }
          if ([v17 edgesCount]) {
            [v27 addObject:v17];
          }

          unint64_t v18 = v11;
        }
        else
        {
          unint64_t v18 = 0;
        }
        if (v11 < v10 - 1)
        {
          id v19 = [v7 edgeAtIndex:v18];
          [v25 addObject:v19];

          id v20 = (void *)[v7 copy];
          do
          {
            [v20 removeFirstEdge];
            --v13;
          }
          while (v13);
          if ([v20 edgesCount]) {
            [v27 addObject:v20];
          }
        }
LABEL_20:

        ++v6;
      }
      while (v6 != v29);
      uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v29 = v21;
    }
    while (v21);
  }

  id v22 = v27;
  id *v24 = v22;

  return v25;
}

- (BOOL)updateGraphWithVisualString:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  id v15 = 0;
  id v13 = 0;
  int v5 = [(id)objc_opt_class() scanMatchString:v4 definitions:&v15 constraints:&v14 forCreation:1 error:&v13];

  id v6 = v15;
  id v7 = v14;
  id v8 = v13;
  if (v5)
  {
    id v12 = v8;
    char v9 = [(id)objc_opt_class() populateGraph:self withDefinitions:v6 constraints:v7 error:&v12];
    id v10 = v12;

    id v8 = v10;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)scanGraphElementOptionsString:(id)a3 minimum:(unint64_t *)a4 maximum:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = 0;
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"[\\w\\d\\,\\-\\ \\:\\{\\'\\;\\}\\#\\%\\+\\$\\^\\/\\(\\)\\?\\=]+\\](?:\\*(\\d+)\\.\\.(\\d+))?",
    0,
  char v9 = &v31);
  id v10 = v31;
  unint64_t v11 = v10;
  *a4 = 1;
  *a5 = 1;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v14 = objc_msgSend(v9, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    id v15 = v14;
    if (v14)
    {
      memset(v30, 0, sizeof(v30));
      uint64_t v17 = [v14 countByEnumeratingWithState:v30 objects:v32 count:16];
      if (v17)
      {
        unint64_t v18 = (void *)**((void **)&v30[0] + 1);
        if ([**((id **)&v30[0] + 1) numberOfRanges] == 3)
        {
          uint64_t v19 = [v18 rangeAtIndex:1];
          uint64_t v21 = v20;
          uint64_t v22 = [v18 rangeAtIndex:2];
          char v16 = 0;
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v21)
            {
              uint64_t v24 = v22;
              if (v22 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v23)
                {
                  uint64_t v25 = v21;
                  uint64_t v26 = v23;
                  id v27 = objc_msgSend(v8, "substringWithRange:", v19, v25);
                  uint64_t v28 = objc_msgSend(v8, "substringWithRange:", v24, v26);
                  *a4 = [v27 integerValue];
                  *a5 = [v28 integerValue];

                  char v16 = 1;
                }
              }
            }
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      BOOL v13 = (v17 != 0) & v16;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)scanGraphConstraintString:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", @"(")
    && [v4 hasSuffix:@""]))
  {
    int v5 = objc_opt_new();
    id v29 = 0;
    objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(\\(|<?-\\[)([\\w\\d\\,\\-\\ \\:\\{\\'\\;\\}\\#\\%\\+\\$\\^\\/\\(\\)\\?\\=]+)(\\)|\\](?:\\*\\d+\\.\\.\\d+)?->?)",
      0,
    id v6 = &v29);
    id v7 = v29;
    id v8 = v7;
    id v9 = 0;
    if (v6 && !v7)
    {
      id v10 = objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      unint64_t v11 = v10;
      if (v10)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          uint64_t v24 = v11;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if ([v17 numberOfRanges] != 4
                || ((uint64_t v18 = [v17 rangeAtIndex:0], v18 != 0x7FFFFFFFFFFFFFFFLL)
                  ? (BOOL v20 = v19 == 0)
                  : (BOOL v20 = 1),
                    v20))
              {

                id v9 = 0;
                unint64_t v11 = v24;
                goto LABEL_25;
              }
              uint64_t v21 = objc_msgSend(v4, "substringWithRange:", v18, v19);
              [v5 addObject:v21];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
            unint64_t v11 = v24;
            if (v14) {
              continue;
            }
            break;
          }
        }

        if ([v5 count]) {
          uint64_t v22 = v5;
        }
        else {
          uint64_t v22 = 0;
        }
        id v9 = v22;
      }
      else
      {
        id v9 = 0;
      }
LABEL_25:
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)scanGraphElementString:(id)a3 type:(unint64_t *)a4 optionalName:(id *)a5 label:(id *)a6 optionalDomains:(id *)a7 optionalProperties:(id *)a8 error:(id *)a9
{
  v76[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = [MEMORY[0x1E4F28FE8] scannerWithString:v13];
  uint64_t v15 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
  [v15 addCharactersInString:@"_"];
  [v15 removeCharactersInString:@"([:{';}])"];
  char v16 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
  [v16 addCharactersInString:@"_ -%:/+*.$^(?)><="];
  [v16 removeCharactersInString:@"[{';}]"];
  if (objc_msgSend(v14, "scanString:intoString:", @"("), 0
    && [v14 scanLocation] == 1)
  {
    int v63 = 0;
    BOOL v17 = 1;
    uint64_t v18 = 1;
  }
  else
  {
    if (![v14 scanString:@"[" intoString:0])
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v67 = 0;
      id v19 = 0;
      uint64_t v23 = 0;
      BOOL v17 = 0;
      goto LABEL_79;
    }
    BOOL v17 = 0;
    if ([v14 scanLocation] != 1)
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v67 = 0;
      id v19 = 0;
      uint64_t v23 = 0;
      goto LABEL_79;
    }
    int v63 = 1;
    uint64_t v18 = 2;
  }
  uint64_t v65 = v18;
  id v74 = 0;
  [v14 scanCharactersFromSet:v15 intoString:&v74];
  id v19 = v74;
  if ([v14 scanString:@":" intoString:0])
  {
    id v73 = 0;
    [v14 scanCharactersFromSet:v15 intoString:&v73];
    BOOL v20 = (__CFString *)v73;
    uint64_t v21 = @"*";
    if (v20) {
      uint64_t v21 = v20;
    }
    uint64_t v68 = v21;
    long long v61 = a5;
    id v62 = v19;
    if (![v14 scanString:@":" intoString:0])
    {
      uint64_t v67 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
LABEL_26:
      uint64_t v69 = 0;
      if ([v14 scanString:@"{" intoString:0])
      {
        uint64_t v57 = a6;
        long long v58 = a7;
        long long v59 = a8;
        id v60 = v13;
        uint64_t v69 = [MEMORY[0x1E4F1CA60] dictionary];
        id v25 = 0;
        long long v26 = 0;
        while (1)
        {
          long long v27 = v25;
          id v71 = v25;
          int v28 = [v14 scanCharactersFromSet:v15 intoString:&v71];
          id v25 = v71;

          if (!v28
            || ([v14 scanString:@":" intoString:0] & 1) == 0
            && ![v14 scanUpToString:@":" intoString:0]
            || ([v14 scanString:@"'" intoString:0] & 1) == 0
            && ![v14 scanUpToString:@"'" intoString:0])
          {
            goto LABEL_59;
          }
          id v29 = v15;
          id v70 = v26;
          long long v30 = v16;
          int v31 = [v14 scanCharactersFromSet:v16 intoString:&v70];
          id v32 = v70;

          if (!v31 || ![v14 scanString:@"'" intoString:0])
          {
            long long v26 = v32;
            char v16 = v30;
            uint64_t v15 = v29;
LABEL_59:
            id v19 = v62;
            goto LABEL_60;
          }
          uint64_t v33 = @">";
          if (([v32 hasPrefix:@">"] & 1) == 0
            && ![v32 hasPrefix:@"<"])
          {
            id v36 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
            uint64_t v37 = [v36 numberFromString:v32];
            uint64_t v38 = (void *)v37;
            if (v37) {
              id v39 = (id)v37;
            }
            else {
              id v39 = v32;
            }
            [v69 setObject:v39 forKey:v25];
            long long v26 = v32;
            char v16 = v30;
            goto LABEL_53;
          }
          uint64_t v34 = @">=";
          if (([v32 hasPrefix:@">="] & 1) != 0
            || (uint64_t v34 = @"<=", ([v32 hasPrefix:@"<="] & 1) != 0))
          {
            uint64_t v35 = 2;
            uint64_t v64 = v34;
          }
          else
          {
            if ([v32 hasPrefix:@">"])
            {
              uint64_t v35 = 1;
            }
            else
            {
              uint64_t v33 = @"<";
              uint64_t v35 = 1;
              if (![v32 hasPrefix:@"<"])
              {
                uint64_t v64 = 0;
                long long v26 = v32;
                goto LABEL_49;
              }
            }
            uint64_t v64 = v33;
          }
          long long v26 = [v32 substringFromIndex:v35];

          LOBYTE(v35) = 0;
LABEL_49:
          id v36 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          uint64_t v40 = [v36 numberFromString:v26];
          uint64_t v38 = (void *)v40;
          char v16 = v30;
          if ((v35 & 1) != 0 || !v40)
          {
            [v69 setObject:v26 forKey:v25];
          }
          else
          {
            v75[0] = @"operator";
            v75[1] = @"value";
            v76[0] = v64;
            v76[1] = v40;
            uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
            [v69 setObject:v41 forKey:v25];
          }
LABEL_53:
          uint64_t v15 = v29;

          if (([v14 scanString:@";" intoString:0] & 1) == 0)
          {
            char v43 = [v14 scanString:@"}" intoString:0];
            id v19 = v62;
            if (v43)
            {

              a8 = v59;
              id v13 = v60;
              a6 = v57;
              a7 = v58;
              a5 = v61;
              break;
            }
LABEL_60:

            BOOL v17 = 0;
            a8 = v59;
            id v13 = v60;
            a6 = v57;
            a7 = v58;
            a5 = v61;
            goto LABEL_74;
          }
        }
      }
      if (!v17 || objc_msgSend(v14, "scanString:intoString:", @""), 0))
      {
        if (!v63 || [v14 scanString:@"]" intoString:0])
        {
          id v44 = v19;
          uint64_t v45 = [v14 scanLocation];
          BOOL v46 = v45 == [v13 length];
          id v19 = v44;
          BOOL v17 = v46;
          goto LABEL_74;
        }
        goto LABEL_78;
      }
LABEL_77:
      BOOL v17 = 0;
      uint64_t v23 = 1;
      goto LABEL_79;
    }
    uint64_t v72 = 0;
    [v14 scanInteger:&v72];
    uint64_t v22 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v72];
    if ([v14 scanString:@"," intoString:0])
    {
      do
      {
        [v14 scanInteger:&v72];
        [v22 addIndex:v72];
      }
      while (([v14 scanString:@"," intoString:0] & 1) != 0);
    }
    if ((unint64_t)[v22 count] < 2
      || [(__CFString *)v68 isEqualToString:@"*"])
    {
      uint64_t v67 = (void *)[v22 copy];

      id v19 = v62;
      goto LABEL_26;
    }

    uint64_t v69 = 0;
    uint64_t v67 = 0;
    BOOL v17 = 0;
LABEL_63:
    id v42 = a4;
    id v19 = v62;
    goto LABEL_75;
  }
  if (!v19)
  {
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v67 = 0;
    BOOL v17 = 0;
LABEL_74:
    id v42 = a4;
LABEL_75:
    uint64_t v23 = v65;
    if (!v42) {
      goto LABEL_83;
    }
    goto LABEL_80;
  }
  if (v17 && (objc_msgSend(v14, "scanString:intoString:", @""), 0) & 1) != 0) {
    goto LABEL_22;
  }
  if (!v63)
  {
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v67 = 0;
    goto LABEL_77;
  }
  if ([v14 scanString:@"]" intoString:0])
  {
LABEL_22:
    id v62 = v19;
    uint64_t v24 = [v14 scanLocation];
    if (v24 == [v13 length])
    {
      uint64_t v67 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      BOOL v17 = 1;
    }
    else
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v67 = 0;
      BOOL v17 = 0;
    }
    goto LABEL_63;
  }
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v67 = 0;
LABEL_78:
  BOOL v17 = 0;
  uint64_t v23 = 2;
LABEL_79:
  id v42 = a4;
  if (!a4) {
    goto LABEL_83;
  }
LABEL_80:
  if (!v17) {
    uint64_t v23 = 0;
  }
  *id v42 = v23;
LABEL_83:
  if (a5)
  {
    if (v17) {
      uint64_t v47 = v19;
    }
    else {
      uint64_t v47 = 0;
    }
    *a5 = v47;
  }
  if (a6)
  {
    if (v17) {
      uint64_t v48 = v68;
    }
    else {
      uint64_t v48 = 0;
    }
    *a6 = v48;
  }
  if (a7)
  {
    if (v17) {
      long long v49 = v67;
    }
    else {
      long long v49 = 0;
    }
    *a7 = v49;
  }
  if (a8)
  {
    if (v17)
    {
      if ([v69 count]) {
        uint64_t v50 = v69;
      }
      else {
        uint64_t v50 = 0;
      }
    }
    else
    {
      uint64_t v50 = 0;
    }
    *a8 = v50;
  }
  if (a9) {
    char v51 = v17;
  }
  else {
    char v51 = 1;
  }
  if ((v51 & 1) == 0)
  {
    id v52 = v19;
    long long v53 = (void *)MEMORY[0x1E4F28C58];
    id v54 = [NSString stringWithFormat:@"'%@' do not match element requirement.", v13];
    uint64_t v55 = v53;
    id v19 = v52;
    *a9 = [v55 errorWithDescription:v54];
  }
  return v17;
}

+ (BOOL)scanMatchString:(id)a3 definitions:(id *)a4 constraints:(id *)a5 forCreation:(BOOL)a6 error:(id *)a7
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  if (a4 && *a4)
  {
    uint64_t v10 = [*a4 mutableCopy];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  unint64_t v11 = (void *)v10;
  id v78 = [MEMORY[0x1E4F1CA48] array];
  id v12 = objc_alloc_init(MAAbstractGraph);
  id v13 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"([\\(|\\[](?:[\\w\\|\\*\\ \\.;\\'\\{\\}\\:\\(\\)\\-\\>\\<\\[\\]\\%\\+\\$\\^\\/\\?\\=]|\\d,)+[\\)|\\]])",
    0,
  uint64_t v14 = a7);
  if (v14)
  {
    uint64_t v15 = objc_msgSend(v14, "matchesInString:options:range:", v83, 0, 0, objc_msgSend(v83, "length"));
    char v16 = v15;
    if (v15)
    {
      uint64_t v68 = a4;
      uint64_t v69 = a5;
      id v71 = v14;
      uint64_t v72 = v12;
      id v73 = v13;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v70 = v15;
      obuint64_t j = v15;
      uint64_t v75 = [obj countByEnumeratingWithState:&v105 objects:v110 count:16];
      if (v75)
      {
        BOOL v17 = off_1E68DA000;
        uint64_t v76 = *(void *)v106;
        uint64_t v18 = 1;
        uint64_t v82 = v11;
        uint64_t v84 = a7;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v106 != v76)
            {
              uint64_t v20 = v19;
              objc_enumerationMutation(obj);
              uint64_t v19 = v20;
            }
            uint64_t v77 = v19;
            uint64_t v21 = *(void **)(*((void *)&v105 + 1) + 8 * v19);
            if ((unint64_t)[v21 numberOfRanges] >= 2)
            {
              unint64_t v22 = 1;
              long long v85 = v21;
              while (2)
              {
                if ([v21 rangeAtIndex:v22] == 0x7FFFFFFFFFFFFFFFLL || !v23) {
                  goto LABEL_64;
                }
                uint64_t v24 = [v21 rangeAtIndex:v22];
                uint64_t v26 = objc_msgSend(v83, "substringWithRange:", v24, v25);
                id v103 = 0;
                uint64_t v104 = 0;
                id v101 = 0;
                id v102 = 0;
                id v100 = 0;
                long long v86 = (void *)v26;
                int v27 = objc_msgSend(a1, "scanGraphElementString:type:optionalName:label:optionalDomains:optionalProperties:error:", 0);
                id v96 = v103;
                id v28 = v102;
                id v95 = v101;
                id v93 = v100;
                long long v94 = v28;
                unint64_t v87 = v22;
                if (v27 && v28)
                {
                  if (v104 != 2)
                  {
                    if (v104 == 1)
                    {
                      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v95, "count"));
                      id v29 = (id)objc_claimAutoreleasedReturnValue();
                      unsigned __int16 v30 = [v95 firstIndex];
                      while (v30 != 0xFFFF)
                      {
                        int v31 = v29;
                        id v32 = [MAAbstractNode alloc];
                        LODWORD(v33) = 1.0;
                        uint64_t v34 = [(MAAbstractNode *)v32 initWithLabel:v94 domain:v30 weight:v93 properties:v33];
                        [(MANode *)v34 setIdentifier:v18];
                        uint64_t v35 = (uint64_t)v96;
                        if (!v96)
                        {
                          uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"#NodeID%ld", -[MANode identifier](v34, "identifier"));
                        }
                        ++v18;
                        id v96 = (id)v35;
                        id v36 = [v11 objectForKey:v35];

                        if (v36)
                        {
                          if (!a7) {
                            goto LABEL_72;
                          }
                          int v63 = (void *)MEMORY[0x1E4F28C58];
                          [NSString stringWithFormat:@"Query string malformed, node named '%@' has no matching definition.", v96];
                          goto LABEL_71;
                        }
                        id v29 = v31;
                        [v31 addObject:v34];
                        unsigned __int16 v30 = [v95 indexGreaterThanIndex:v30];
                      }
                      goto LABEL_54;
                    }
                    if (a7)
                    {
                      id v62 = (void *)MEMORY[0x1E4F28C58];
                      id v29 = [NSString stringWithFormat:@"Query string malformed, element '%@' doesn't match any type.", v86];
                      [v62 errorWithDescription:v29];
                      BOOL v56 = 0;
                      *a7 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_62;
                    }
                    BOOL v56 = 0;
LABEL_63:

                    if (!v56)
                    {

                      id v12 = v72;
                      id v13 = v73;
                      goto LABEL_88;
                    }
LABEL_64:
                    ++v22;
                    uint64_t v21 = v85;
                    if (v22 >= [v85 numberOfRanges]) {
                      goto LABEL_73;
                    }
                    continue;
                  }
                  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v95, "count"));
                  id v29 = (id)objc_claimAutoreleasedReturnValue();
                  unsigned __int16 v57 = [v95 firstIndex];
                  while (v57 != 0xFFFF)
                  {
                    int v31 = v29;
                    id v58 = objc_alloc(v17[15]);
                    LODWORD(v59) = 1.0;
                    uint64_t v34 = (MAAbstractNode *)[v58 initWithLabel:v94 domain:v57 weight:v93 properties:v59];
                    [(MANode *)v34 setIdentifier:v18];
                    uint64_t v60 = (uint64_t)v96;
                    if (!v96)
                    {
                      uint64_t v60 = objc_msgSend(NSString, "stringWithFormat:", @"#EdgeID%ld", -[MANode identifier](v34, "identifier"));
                    }
                    ++v18;
                    id v96 = (id)v60;
                    long long v61 = [v11 objectForKey:v60];

                    if (v61)
                    {
                      if (a7)
                      {
                        int v63 = (void *)MEMORY[0x1E4F28C58];
                        [NSString stringWithFormat:@"Query string malformed, edge named '%@' has no matching definition.", v96];
                        uint64_t v64 = LABEL_71:;
                        *a7 = [v63 errorWithDescription:v64];
                      }
LABEL_72:

                      BOOL v56 = 0;
                      unint64_t v22 = v87;
                      id v29 = v31;
                      goto LABEL_62;
                    }
                    id v29 = v31;
                    [v31 addObject:v34];
                    unsigned __int16 v57 = [v95 indexGreaterThanIndex:v57];
                  }
LABEL_54:
                  [v11 setObject:v29 forKey:v96];
                  BOOL v56 = 1;
                  unint64_t v22 = v87;
LABEL_62:

                  goto LABEL_63;
                }
                break;
              }
              uint64_t v37 = [a1 scanGraphConstraintString:v86 error:a7];
              uint64_t v38 = objc_opt_new();
              id v39 = +[MAPath path];
              uint64_t v98 = 1;
              uint64_t v99 = 1;
              memset(v97, 0, sizeof(v97));
              id v29 = v37;
              if ([v29 countByEnumeratingWithState:v97 objects:v109 count:16])
              {
                v79 = v39;
                v80 = v38;
                uint64_t v40 = v29;
                uint64_t v41 = (void *)**((void **)&v97[0] + 1);
                objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"(\\(|\\[)([\\w\\d\\,\\-\\ \\:\\{\\'\\;\\}\\#\\%\\+\\$\\^\\/\\(\\)\\?\\=]+)(\\)|\\])",
                  0,
                id v42 = a7);
                if (!v42) {
                  goto LABEL_44;
                }
                char v43 = v42;
                id v44 = objc_msgSend(v42, "matchesInString:options:range:", v41, 0, 0, objc_msgSend(v41, "length"));
                if ([v44 count] != 1)
                {
                  unint64_t v11 = v82;
                  if (a7)
                  {
                    *a7 = [MEMORY[0x1E4F28C58] errorWithDescription:@"Query string malformed, constraintString should match exactly once."];
                  }

                  goto LABEL_60;
                }
                uint64_t v45 = [v44 firstObject];
                if ([v45 numberOfRanges] != 4)
                {
                  if (a7)
                  {
                    *a7 = [MEMORY[0x1E4F28C58] errorWithDescription:@"Query string malformed, constraint result has wrong number of ranges."];
                  }
                  goto LABEL_40;
                }
                uint64_t v46 = [v45 rangeAtIndex:0];
                uint64_t v88 = objc_msgSend(v41, "substringWithRange:", v46, v47);
                int v48 = objc_msgSend(a1, "scanGraphElementString:type:optionalName:label:optionalDomains:optionalProperties:error:", a7);
                unint64_t v49 = (unint64_t)0;
                unint64_t v50 = (unint64_t)0;
                id v91 = 0;
                id v51 = 0;
                id v90 = (void *)v50;
                if (v48)
                {
                  if (v50 | v49)
                  {
                    unint64_t v22 = v87;
                    uint64_t v92 = (void *)v49;
                    if (v84)
                    {
                      long long v53 = (void *)MEMORY[0x1E4F28C58];
                      id v81 = v51;
                      id v52 = (void *)v88;
                      id v54 = [NSString stringWithFormat:@"Query string malformed, element '%@' has no matching type.", v88];
                      uint64_t v55 = v53;
                      unint64_t v22 = v87;
                      *uint64_t v84 = [v55 errorWithDescription:v54];

                      id v51 = v81;
                    }
                    else
                    {
                      id v52 = (void *)v88;
                    }
LABEL_39:

                    a7 = v84;
LABEL_40:

LABEL_44:
                    unint64_t v11 = v82;
LABEL_60:
                    id v29 = v40;

                    BOOL v56 = 0;
LABEL_61:
                    BOOL v17 = off_1E68DA000;
                    goto LABEL_62;
                  }
                  uint64_t v92 = 0;
                }
                else
                {
                  uint64_t v92 = (void *)v49;
                }
                unint64_t v22 = v87;
                id v52 = (void *)v88;
                goto LABEL_39;
              }

              [v78 addObject:v38];
              if (([v39 isEmpty] & 1) == 0) {
                [v73 addObject:v39];
              }

              BOOL v56 = 1;
              unint64_t v11 = v82;
              goto LABEL_61;
            }
LABEL_73:
            uint64_t v19 = v77 + 1;
          }
          while (v77 + 1 != v75);
          uint64_t v75 = [obj countByEnumeratingWithState:&v105 objects:v110 count:16];
        }
        while (v75);
      }

      if (v68)
      {
        if ([v11 count]) {
          uint64_t v65 = v11;
        }
        else {
          uint64_t v65 = 0;
        }
        *uint64_t v68 = v65;
      }
      id v12 = v72;
      id v13 = v73;
      if (v69)
      {
        if ([v73 count]) {
          uint64_t v66 = v73;
        }
        else {
          uint64_t v66 = 0;
        }
        *uint64_t v69 = v66;
      }
      LOBYTE(v56) = 1;
LABEL_88:
      char v16 = v70;
      uint64_t v14 = v71;
    }
    else if (a7)
    {
      [MEMORY[0x1E4F28C58] errorWithDescription:@"Query string malformed, not matching any expression."];
      LOBYTE(v56) = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v56) = 0;
    }
  }
  else
  {
    LOBYTE(v56) = 0;
  }

  return v56;
}

+ (id)visualStringWithFormat:(id)a3 elements:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28E78] stringWithString:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = [v5 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v5 objectForKeyedSubscript:v11];
        id v13 = [v12 visualString];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v14 = [v12 visualStringWithName:v11];

          id v13 = (void *)v14;
        }
        uint64_t v15 = [NSString stringWithFormat:@"(%@)", v11];
        objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v15, v13, 0, 0, objc_msgSend(v6, "length"));
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (MAGraph)graphWithDefinitions:(id)a3 constraints:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() graph];
  LODWORD(a5) = [a1 populateGraph:v10 withDefinitions:v9 constraints:v8 error:a5];

  if (a5) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (MAGraph *)v11;
}

+ (BOOL)populateGraph:(id)a3 withDefinitions:(id)a4 constraints:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  uint64_t v32 = 0;
  double v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = a5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke;
        v24[3] = &unk_1E68DC890;
        id v12 = v19;
        id v25 = v12;
        int v27 = &v32;
        id v13 = v18;
        id v26 = v13;
        [v11 enumerateWithBlock:v24];
        if (!*((unsigned char *)v33 + 24))
        {

          goto LABEL_12;
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke_2;
        v20[3] = &unk_1E68DC890;
        id v21 = v12;
        uint64_t v23 = &v32;
        id v22 = v13;
        [v11 enumerateWithBlock:v20];
        BOOL v14 = *((unsigned char *)v33 + 24) == 0;

        if (v14) {
          goto LABEL_12;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  BOOL v15 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);

  return v15;
}

void __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = [a2 label];
    uint64_t v8 = [v6 objectForKey:v7];

    if ([v8 count])
    {
      id v21 = a4;
      id v22 = v8;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            BOOL v15 = (void *)a1[5];
            char v16 = objc_msgSend(v14, "label", v21);
            uint64_t v17 = [v14 domain];
            id v18 = [v14 propertyDictionary];
            LODWORD(v19) = 1.0;
            long long v20 = [v15 addUniqueNodeWithLabel:v16 domain:v17 weight:v18 properties:0 didCreate:v19];

            if (!v20)
            {
              *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
              *id v21 = 1;
              goto LABEL_13;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      uint64_t v8 = v22;
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void __66__MAGraph_Query__populateGraph_withDefinitions_constraints_error___block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_44;
  }
  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = [v5 label];
  id v9 = [v7 objectForKey:v8];

  uint64_t v10 = [v6 sourceNode];
  uint64_t v11 = [v6 targetNode];
  if (![v9 count])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_43;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (!v13) {
    goto LABEL_42;
  }
  uint64_t v14 = *(void *)v74;
  long long v53 = v9;
  id v54 = v6;
  id v51 = v10;
  id v52 = v12;
  uint64_t v48 = *(void *)v74;
  do
  {
    uint64_t v15 = 0;
    uint64_t v49 = v13;
    do
    {
      if (*(void *)v74 != v14) {
        objc_enumerationMutation(v12);
      }
      uint64_t v50 = v15;
      char v16 = *(void **)(*((void *)&v73 + 1) + 8 * v15);
      uint64_t v17 = (void *)a1[4];
      id v18 = [v10 label];
      id v19 = [v17 objectForKey:v18];

      if (![v19 count])
      {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
        goto LABEL_41;
      }
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v19 = v19;
      uint64_t v60 = [v19 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (!v60) {
        goto LABEL_35;
      }
      uint64_t v59 = *(void *)v70;
      id v55 = v19;
      BOOL v56 = v11;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v70 != v59) {
            objc_enumerationMutation(v19);
          }
          id v21 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          id v22 = (void *)a1[5];
          long long v23 = [v21 label];
          uint64_t v24 = [v21 domain];
          long long v25 = [v21 propertyDictionary];
          long long v26 = [v22 nodesForLabel:v23 domain:v24 properties:v25];

          if ([v26 count] != 1)
          {
            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
            *a4 = 1;

LABEL_40:
LABEL_41:
            uint64_t v10 = v51;

            id v9 = v53;
            id v6 = v54;
            id v12 = v52;
            goto LABEL_42;
          }
          uint64_t v64 = [v26 anyObject];
          int v27 = (void *)a1[4];
          uint64_t v28 = [v11 label];
          long long v29 = [v27 objectForKey:v28];

          if (![v29 count])
          {
            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
            int v47 = 1;
            *a4 = 1;
            goto LABEL_32;
          }
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          obuint64_t j = v29;
          uint64_t v30 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
          if (!v30)
          {
            int v47 = 0;
            goto LABEL_31;
          }
          uint64_t v31 = v30;
          uint64_t v63 = *(void *)v66;
          unsigned __int16 v57 = v29;
          uint64_t v58 = i;
          while (2)
          {
            uint64_t v32 = 0;
            double v33 = v26;
            do
            {
              if (*(void *)v66 != v63) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = *(void **)(*((void *)&v65 + 1) + 8 * v32);
              char v35 = (void *)a1[5];
              id v36 = [v34 label];
              uint64_t v37 = [v34 domain];
              uint64_t v38 = [v34 propertyDictionary];
              long long v26 = [v35 nodesForLabel:v36 domain:v37 properties:v38];

              if ([v26 count] != 1)
              {
                *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
                int v47 = 1;
                *a4 = 1;
LABEL_30:
                id v19 = v55;
                uint64_t v11 = v56;
                long long v29 = v57;
                uint64_t i = v58;
                goto LABEL_31;
              }
              id v39 = [v26 anyObject];
              uint64_t v40 = a1;
              uint64_t v41 = (void *)a1[5];
              id v42 = [v16 label];
              uint64_t v43 = [v16 domain];
              id v44 = [v16 propertyDictionary];
              LODWORD(v45) = 1.0;
              uint64_t v46 = [v41 addUniqueEdgeWithLabel:v42 sourceNode:v64 targetNode:v39 domain:v43 weight:v44 properties:v45];

              if (!v46)
              {
                a1 = v40;
                *(unsigned char *)(*(void *)(v40[6] + 8) + 24) = 0;
                int v47 = 1;
                *a4 = 1;

                goto LABEL_30;
              }

              ++v32;
              double v33 = v26;
              a1 = v40;
            }
            while (v31 != v32);
            uint64_t v31 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
            int v47 = 0;
            id v19 = v55;
            uint64_t v11 = v56;
            long long v29 = v57;
            uint64_t i = v58;
            if (v31) {
              continue;
            }
            break;
          }
LABEL_31:

LABEL_32:
          if (v47) {
            goto LABEL_40;
          }
        }
        uint64_t v60 = [v19 countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v60);
LABEL_35:

      uint64_t v15 = v50 + 1;
      id v9 = v53;
      id v6 = v54;
      uint64_t v10 = v51;
      id v12 = v52;
      uint64_t v14 = v48;
    }
    while (v50 + 1 != v49);
    uint64_t v13 = [v52 countByEnumeratingWithState:&v73 objects:v79 count:16];
  }
  while (v13);
LABEL_42:

LABEL_43:
LABEL_44:
}

+ (MAGraph)graphWithVisualString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  id v13 = 0;
  int v7 = [(id)objc_opt_class() scanMatchString:v6 definitions:&v13 constraints:&v12 forCreation:1 error:a4];

  id v8 = v13;
  id v9 = v12;
  uint64_t v10 = 0;
  if (v7)
  {
    uint64_t v10 = [a1 graphWithDefinitions:v8 constraints:v9 error:a4];
  }

  return (MAGraph *)v10;
}

- (void)breadthFirstSearchFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, void *, unsigned char *))a5;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  char v19 = 0;
  [v9 addObject:v7];
  if ([v9 count])
  {
    while (1)
    {
      uint64_t v11 = [v9 firstObject];
      if ([v10 containsObject:v11]) {
        goto LABEL_8;
      }
      int v12 = v8[2](v8, v11, &v19);
      if (v19)
      {

        goto LABEL_12;
      }
      int v13 = v12;
      [v10 addObject:v11];
      if (v13) {
        break;
      }
LABEL_9:

      if (![v9 count]) {
        goto LABEL_12;
      }
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke;
    v17[3] = &unk_1E68DCA20;
    id v14 = v9;
    id v18 = v14;
    [v11 enumerateOutEdgesUsingBlock:v17];
    if (!a4)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke_2;
      v15[3] = &unk_1E68DCA20;
      id v16 = v14;
      [v11 enumerateInEdgesUsingBlock:v15];
    }
LABEL_8:
    [v9 removeObject:v11];
    goto LABEL_9;
  }
LABEL_12:
}

void __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 targetNode];
  [v2 addObject:v3];
}

void __69__MAGraph_Traversal__breadthFirstSearchFromNode_directed_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 sourceNode];
  [v2 addObject:v3];
}

- (void)depthFirstSearchFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, void *, unsigned char *))a5;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  char v20 = 0;
  [v9 addObject:v7];
  if ([v9 count])
  {
    while (1)
    {
      uint64_t v11 = [v9 lastObject];
      uint64_t v12 = [v9 count];
      if ([v10 containsObject:v11]) {
        goto LABEL_8;
      }
      int v13 = v8[2](v8, v11, &v20);
      if (v20)
      {

        goto LABEL_12;
      }
      int v14 = v13;
      [v10 addObject:v11];
      if (v14) {
        break;
      }
LABEL_9:

      if (![v9 count]) {
        goto LABEL_12;
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke;
    v18[3] = &unk_1E68DCA20;
    id v15 = v9;
    id v19 = v15;
    [v11 enumerateOutEdgesUsingBlock:v18];
    if (!a4)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke_2;
      v16[3] = &unk_1E68DCA20;
      id v17 = v15;
      [v11 enumerateInEdgesUsingBlock:v16];
    }
LABEL_8:
    [v9 removeObjectAtIndex:v12 - 1];
    goto LABEL_9;
  }
LABEL_12:
}

void __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 targetNode];
  [v2 addObject:v3];
}

void __67__MAGraph_Traversal__depthFirstSearchFromNode_directed_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 sourceNode];
  [v2 addObject:v3];
}

- (id)shortestPathFromNode:(id)a3 toNode:(id)a4 directed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v24 = a4;
  id v21 = +[MAPath path];
  long long v23 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v8 = objc_opt_new();
  id v22 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v9 = v7;
  [v8 setObject:&unk_1F280F670 forKey:v9];
  if (v5) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  id v19 = v9;
  while ((objc_msgSend(v9, "isEqual:", v24, v19) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke;
    aBlock[3] = &unk_1E68DC9A8;
    id v11 = v23;
    BOOL v50 = v5;
    id v46 = v11;
    id v47 = v9;
    id v12 = v22;
    id v48 = v12;
    id v49 = v8;
    id v13 = v9;
    int v14 = _Block_copy(aBlock);
    [v13 enumerateEdgesOfType:v10 usingBlock:v14];
    id v9 = [v12 firstObject];

    if (v9) {
      [v12 removeObject:v9];
    }
    else {
      id v20 = v21;
    }

    if (!v9) {
      goto LABEL_17;
    }
  }
  id v15 = v24;

  do
  {
    if (!v15) {
      break;
    }
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__6257;
    id v42 = __Block_byref_object_dispose__6258;
    id v43 = 0;
    uint64_t v32 = 0;
    double v33 = &v32;
    uint64_t v34 = 0x3032000000;
    char v35 = __Block_byref_object_copy__6257;
    id v36 = __Block_byref_object_dispose__6258;
    id v37 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_5;
    v25[3] = &unk_1E68DC9F8;
    id v16 = v15;
    id v26 = v16;
    id v27 = v8;
    uint64_t v28 = v44;
    long long v29 = &v38;
    uint64_t v30 = &v32;
    BOOL v31 = v5;
    [v16 enumerateNeighborNodesUsingBlock:v25];
    if (v33[5]) {
      objc_msgSend(v21, "addFirstEdge:");
    }
    id v15 = (id)v39[5];

    int v17 = [v15 isEqual:v19];
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v44, 8);
  }
  while (!v17);
  id v20 = v21;

LABEL_17:
  return v20;
}

uint64_t __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  if (([*(id *)(a1 + 32) containsObject:v18] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v18];
    id v3 = [v18 targetNode];
    id v4 = v3;
    if (!*(unsigned char *)(a1 + 64) && [v3 isEqual:*(void *)(a1 + 40)])
    {
      uint64_t v5 = [v18 sourceNode];

      id v4 = (void *)v5;
    }
    if (([*(id *)(a1 + 48) containsObject:v4] & 1) == 0) {
      [*(id *)(a1 + 48) addObject:v4];
    }
    id v6 = [*(id *)(a1 + 56) objectForKey:*(void *)(a1 + 40)];
    [v6 doubleValue];
    double v8 = v7;
    [v18 weight];
    double v10 = v8 + v9;

    id v11 = [*(id *)(a1 + 56) objectForKey:v4];
    [v11 doubleValue];
    double v13 = v12;

    if (v10 < v13
      || ([*(id *)(a1 + 56) objectForKey:v4],
          int v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v14))
    {
      id v15 = *(void **)(a1 + 56);
      id v16 = [NSNumber numberWithDouble:v10];
      [v15 setObject:v16 forKey:v4];
    }
  }
  return MEMORY[0x1F41817F8]();
}

void __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(id *)(a1 + 32) != v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) objectForKey:v4];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) objectForKey:v4];
      [v6 doubleValue];
      double v8 = v7;

      if (v8 < *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
        || !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
        double v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;

        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
        id v11 = (void *)MEMORY[0x1E4F1CA80];
        double v12 = [*(id *)(a1 + 32) edgesFromNode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        double v13 = [v11 setWithSet:v12];

        if (!*(unsigned char *)(a1 + 72))
        {
          int v14 = [*(id *)(a1 + 32) edgesTowardNode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          [v13 unionSet:v14];
        }
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_2;
        v15[3] = &unk_1E68DC9D0;
        void v15[4] = *(void *)(a1 + 64);
        [v13 enumerateObjectsUsingBlock:v15];
      }
    }
  }
}

void __59__MAGraph_Traversal__shortestPathFromNode_toNode_directed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  uint64_t v5 = (void **)(v4 + 40);
  id v14 = v3;
  if (v6)
  {
    [v3 weight];
    float v8 = v7;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) weight];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = v14;
    if ((float)(v8 - v9) >= 0.0) {
      id v11 = *(void **)(v10 + 40);
    }
    uint64_t v5 = (void **)(v10 + 40);
  }
  else
  {
    id v11 = v3;
  }
  id v12 = v11;
  double v13 = *v5;
  *uint64_t v5 = v12;
}

@end