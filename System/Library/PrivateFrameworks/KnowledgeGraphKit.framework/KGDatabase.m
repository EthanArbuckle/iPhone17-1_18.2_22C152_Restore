@interface KGDatabase
+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4;
+ (BOOL)emptyDatabaseExistsAtURL:(id)a3 error:(id *)a4;
+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (void)deleteClosedDatabaseFilesAtStoreURL:(id)a3;
+ (void)initialize;
- (AttributeValueCursor)edgeAttributeValueCursorWithIdentifiers:(id)a3;
- (AttributeValueCursor)edgeAttributeValueCursorWithIdentifiers:(id)a3 propertyName:(id)a4;
- (AttributeValueCursor)nodeAttributeValueCursorWithIdentifiers:(id)a3;
- (AttributeValueCursor)nodeAttributeValueCursorWithIdentifiers:(id)a3 propertyName:(id)a4;
- (AttributeValueCursor)tombstoneEdgeAttributeValueCursorWithIdentifiers:(id)a3;
- (AttributeValueCursor)tombstoneNodeAttributeValueCursorWithIdentifiers:(id)a3;
- (BOOL)addEdges:(id)a3 error:(id *)a4;
- (BOOL)addNodes:(id)a3 error:(id *)a4;
- (BOOL)appendNodeIdentifiersOfEdgesWithIdentifiers:(id)a3 sourceNodeIdentifiers:(id)a4 targetNodeIdentifiers:(id)a5 error:(id *)a6;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)labelIdentifiers:(void *)a3 forLabels:(id)a4;
- (BOOL)noFatalError;
- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeEdge:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeEdges:(id)a3 error:(id *)a4;
- (BOOL)removeNode:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeNodes:(id)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)setEdgeProperties:(id)a3 forIdentifier:(unint64_t)a4 error:(id *)a5;
- (BOOL)setNodeProperties:(id)a3 forIdentifier:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateLabelReferencesWithError:(id *)a3;
- (Bitmap)upsertLabels:(SEL)a3;
- (EdgeCursor)edgeCursorWithIdentifiers:(id)a3;
- (EdgeCursor)tombstoneEdgeCursorWithIdentifiers:(id)a3;
- (KGDatabase)initWithURL:(id)a3;
- (NSURL)url;
- (NSUUID)graphIdentifier;
- (NodeCursor)nodeCursorWithIdentifiers:(id)a3;
- (NodeCursor)tombstoneNodeCursorWithIdentifiers:(id)a3;
- (id)allEdgesForEdgeTable:(const void *)a3 withError:(id *)a4;
- (id)allEdgesWithError:(id *)a3;
- (id)allNodeIdentifiersOfEdgesWithIdentifiers:(id)a3 error:(id *)a4;
- (id)allNodesForTable:(const void *)a3 error:(id *)a4;
- (id)allNodesWithError:(id *)a3;
- (id)allTombstoneEdgesWithError:(id *)a3;
- (id)allTombstoneNodesWithError:(id *)a3;
- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 error:(id *)a4;
- (id)edgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7;
- (id)edgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6;
- (id)edgeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5;
- (id)edgeIdentifiersSortedByPropertyForName:(id)a3 dataType:(int64_t)a4 ascending:(BOOL)a5 limit:(int64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8;
- (id)edgeIdentifiersWithLabels:(id)a3 direction:(unint64_t)a4 forNodeIdentifier:(unint64_t)a5 error:(id *)a6;
- (id)edgeLabels;
- (id)elementIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9;
- (id)elementIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 valueTable:(const void *)a6 rowCount:(unint64_t)a7 error:(id *)a8;
- (id)elementIdentifiersForPropertyName:(id)a3 values:(id)a4 valueTable:(const void *)a5 rowCount:(unint64_t)a6 error:(id *)a7;
- (id)filterEdgeIdentifiersBetween:(id)a3 targetNodeIdentifiers:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6;
- (id)filterEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8;
- (id)filterEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterElementIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 elementIdentifiers:(id)a7 valueTable:(const void *)a8 rowCount:(unint64_t)a9 error:(id *)a10;
- (id)filterElementIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 elementIdentifiers:(id)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9;
- (id)filterElementIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 elementIdentifiers:(id)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9;
- (id)filterInEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5;
- (id)filterNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8;
- (id)filterNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterOutEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5;
- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8;
- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8;
- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7;
- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7;
- (id)inEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 error:(id *)a4;
- (id)intersectionOfEdgesForEdgeTable:(const void *)a3 withLabels:(id)a4 filterEdgeIdentifiers:(id)a5 overrideIndex:(BOOL)a6 error:(id *)a7;
- (id)intersectionOfEdgesWithLabels:(id)a3 error:(id *)a4;
- (id)intersectionOfEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5;
- (id)intersectionOfNodesForNodeTable:(const void *)a3 withLabels:(id)a4 filterNodeIdentifiers:(id)a5 overrideIndex:(BOOL)a6 error:(id *)a7;
- (id)intersectionOfNodesWithLabels:(id)a3 error:(id *)a4;
- (id)intersectionOfNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5;
- (id)intersectionOfTombstoneEdgesWithLabels:(id)a3 error:(id *)a4;
- (id)intersectionOfTombstoneEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5;
- (id)intersectionOfTombstoneNodesWithLabels:(id)a3 error:(id *)a4;
- (id)intersectionOfTombstoneNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5;
- (id)labelIdentifierForLabelName:(id)a3;
- (id)labelNameForLabelIdentifier:(unint64_t)a3;
- (id)labelsOfEdgesForIdentifiers:(id)a3;
- (id)labelsOfNodesForIdentifiers:(id)a3;
- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)neighborNodesOfNodesForIdentifiers:(id)a3 throughEdgesForIdentifiers:(id)a4 direction:(unint64_t)a5 error:(id *)a6;
- (id)neighborNodesOfNodesForIdentifiers:(id)a3 throughEdgesWithLabels:(id)a4 direction:(unint64_t)a5 error:(id *)a6;
- (id)noIndexIntersectionOfEdgesWithLabels:(id)a3 error:(id *)a4;
- (id)noIndexIntersectionOfNodesWithLabels:(id)a3 error:(id *)a4;
- (id)nodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7;
- (id)nodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6;
- (id)nodeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5;
- (id)nodeIdentifiersSortedByPropertyForName:(id)a3 dataType:(int64_t)a4 ascending:(BOOL)a5 limit:(int64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8;
- (id)nodeIdentifiersWhereNoEdgesWithError:(id *)a3;
- (id)nodeIdentifiersWhereNoInEdgesWithError:(id *)a3;
- (id)nodeIdentifiersWhereNoOutEdgesWithError:(id *)a3;
- (id)nodeLabels;
- (id)openModeDescription:(unint64_t)a3;
- (id)outEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 error:(id *)a4;
- (id)propertyNameForAttrIdentifier:(unint64_t)a3;
- (id)propertyValueForCursor:(void *)a3;
- (id)reportLabelIdentifiersByName;
- (id)reportLabelNamesByIdentifier;
- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7;
- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6;
- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5;
- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7;
- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6;
- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5;
- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)unionOfEdgesForEdgeTable:(const void *)a3 withLabels:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6;
- (id)unionOfEdgesWithLabels:(id)a3 error:(id *)a4;
- (id)unionOfEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5;
- (id)unionOfNodesForNodeTable:(const void *)a3 withLabels:(id)a4 filterNodeIdentifiers:(id)a5 error:(id *)a6;
- (id)unionOfNodesWithLabels:(id)a3 error:(id *)a4;
- (id)unionOfNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5;
- (id)unionOfTombstoneEdgesWithLabels:(id)a3 error:(id *)a4;
- (id)unionOfTombstoneEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5;
- (id)unionOfTombstoneNodesWithLabels:(id)a3 error:(id *)a4;
- (id)unionOfTombstoneNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5;
- (int)degasEdgeDirectionFromKG:(unint64_t)a3;
- (shared_ptr<degas::Predicate>)degasPredicateForAllLabels:(void *)a3 elementType:(int)a4;
- (shared_ptr<degas::Predicate>)degasPredicateForAnyLabels:(void *)a3 elementType:(int)a4;
- (shared_ptr<degas::Predicate>)degasPredicateFromKGFilter:(id)a3 elementType:(int)a4;
- (shared_ptr<degas::Predicate>)degasPredicateFromValue:(id)a3 comparator:(unint64_t)a4 attrId:(unint64_t)a5 elementType:(int)a6;
- (shared_ptr<degas::Predicate>)degasPredicateFromValueArray:(id)a3 attrId:(unint64_t)a4 elementType:(int)a5;
- (shared_ptr<degas::Predicate>)degasRangePredicateFromValue1:(id)a3 value2:(id)a4 comparator:(unint64_t)a5 attrId:(unint64_t)a6 elementType:(int)a7;
- (uint64_t)transactionChangesAfterTransactionId:limit:block:;
- (unint64_t)addEdgeWithLabels:(id)a3 properties:(id)a4 sourceNodeIdentifier:(unint64_t)a5 targetNodeIdentifier:(unint64_t)a6 error:(id *)a7;
- (unint64_t)addNodeWithLabels:(id)a3 properties:(id)a4 error:(id *)a5;
- (unint64_t)attributeIdentifierForPropertyName:(id)a3;
- (unint64_t)databaseStatus;
- (unint64_t)edgeCount;
- (unint64_t)graphVersion;
- (unint64_t)insertNewLabel:(id)a3;
- (unint64_t)nodeCount;
- (unint64_t)upsertLabel:(id)a3;
- (void)_enumerateEdgeTableWithEdgeCursor:(void *)a3 block:(id)a4;
- (void)_enumerateEdgesWithEdgeCursor:(void *)a3 propertiesCursor:(void *)a4 block:(id)a5;
- (void)_enumerateNodeTableWithNodeCursor:(void *)a3 block:(id)a4;
- (void)_enumerateNodesWithNodeCursor:(void *)a3 propertiesCursor:(void *)a4 block:(id)a5;
- (void)_enumeratePropertiesForCursor:(void *)a3 block:(id)a4;
- (void)_enumeratePropertiesWithCursor:(void *)a3 withBlock:(id)a4;
- (void)close;
- (void)database;
- (void)dealloc;
- (void)distributeValuesByType:(id)a3 toIntegerValues:(id)a4 floatValues:(id)a5 stringValues:(id)a6;
- (void)enumerateEdgesWithIdentifiers:(id)a3 block:(id)a4;
- (void)enumerateNodesWithIdentifiers:(id)a3 block:(id)a4;
- (void)enumeratePropertyValuesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 withBlock:(id)a5;
- (void)enumeratePropertyValuesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 withBlock:(id)a5;
- (void)enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:(id)a3 block:(id)a4;
- (void)enumerateTombstoneEdgesWithIdentifiers:(id)a3 block:(id)a4;
- (void)enumerateTombstoneNodesWithIdentifiers:(id)a3 block:(id)a4;
- (void)setFatalError:(id)a3;
- (void)setGraphVersion:(unint64_t)a3;
- (void)transactionChangesAfterTransactionId:(unint64_t)a3 limit:(int64_t)a4 block:(id)a5;
- (void)transactionChangesAfterTransactionId:limit:block:;
@end

@implementation KGDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_lockFile, 0);
  objc_storeStrong((id *)&self->_nameCache, 0);
}

- (unint64_t)databaseStatus
{
  return self->_databaseStatus;
}

- (NSURL)url
{
  return self->_url;
}

- (id)reportLabelNamesByIdentifier
{
  return [(KGDatabaseNameCache *)self->_nameCache reportLabelNamesByIdentifier];
}

- (id)reportLabelIdentifiersByName
{
  return [(KGDatabaseNameCache *)self->_nameCache reportLabelIdentifiersByName];
}

- (BOOL)validateLabelReferencesWithError:(id *)a3
{
}

- (void)database
{
  return self->_database;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  int v5 = degas::Database::rollbackTransaction((degas::Database *)self->_database);
  [(KGDatabaseNameCache *)self->_nameCache unloadCache];
  if (a3 && v5)
  {
    if ((v5 - 2) > 8) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = qword_1D17CE530[v5 - 2];
    }
    kg_errorWithCode(v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(KGDatabaseNameCache *)self->_nameCache transactionEnd];
  return v5 == 0;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  int v5 = degas::Database::commitTransaction((degas::Database *)self->_database);
  if (v5)
  {
    [(KGDatabaseNameCache *)self->_nameCache unloadCache];
    if (a3)
    {
      if ((v5 - 2) > 8) {
        uint64_t v6 = -1;
      }
      else {
        uint64_t v6 = qword_1D17CE530[v5 - 2];
      }
      kg_errorWithCode(v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  [(KGDatabaseNameCache *)self->_nameCache transactionEnd];
  return v5 == 0;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  int v5 = degas::Database::beginTransaction((sqlite3 **)self->_database);
  int v6 = v5;
  if (a3 && v5)
  {
    if ((v5 - 2) > 8) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = qword_1D17CE530[v5 - 2];
    }
    kg_errorWithCode(v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(KGDatabaseNameCache *)self->_nameCache transactionBegin];
  return v6 == 0;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  [(KGDatabase *)self degasPredicateFromKGFilter:a5 elementType:2];
  degas::NeighborQuery::NeighborQuery((uint64_t)&v18, &v20, (uint64_t)self->_database);
  *(_OWORD *)v17 = 0u;
  int v11 = degas::NeighborQuery::transitiveClosureNeighbors(&v18, (degas::Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(void *)&v17[15]), -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a4), &v15);
  if (v11)
  {
    if (a6)
    {
      if ((v11 - 2) > 8) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = qword_1D17CE530[v11 - 2];
      }
      kg_errorWithCode(v12);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = [[KGElementIdentifierSet alloc] initWithBitmap:&v15];
  }
  v22 = (void **)&v16;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v22);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }

  return v13;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  [(KGDatabase *)self degasPredicateFromKGFilter:a5 elementType:2];
  degas::NeighborQuery::NeighborQuery((uint64_t)&v18, &v20, (uint64_t)self->_database);
  *(_OWORD *)v17 = 0u;
  int v11 = degas::NeighborQuery::neighbors(&v18, (degas::Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(void *)&v17[15]), -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a4), (degas::Bitmap *)&v15);
  if (v11)
  {
    if (a6)
    {
      if ((v11 - 2) > 8) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = qword_1D17CE530[v11 - 2];
      }
      kg_errorWithCode(v12);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = [[KGElementIdentifierSet alloc] initWithBitmap:&v15];
  }
  v22 = (void **)&v16;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v22);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }

  return v13;
}

- (shared_ptr<degas::Predicate>)degasPredicateFromKGFilter:(id)a3 elementType:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v7 = v4;
  id v8 = a3;
  long long v73 = 0uLL;
  long long v72 = 0uLL;
  long long v71 = 0uLL;
  long long v69 = 0u;
  memset(v70, 0, 25);
  long long v67 = 0u;
  memset(v68, 0, 25);
  v9 = [v8 requiredLabels];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    int v11 = [v8 requiredLabels];
    BOOL v12 = [(KGDatabase *)self labelIdentifiers:&v69 forLabels:v11];

    if (!v12) {
      operator new();
    }
  }
  v13 = [v8 optionalLabels];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v16 = [v8 optionalLabels];
    [(KGDatabase *)self labelIdentifiers:&v67 forLabels:v16];

    uint64_t v17 = v67;
    if ((void)v67 == 0xFFFFFFFFLL)
    {
      v18 = (uint64_t *)v68[0];
      v19 = (uint64_t *)v68[1];
      if (v68[0] == v68[1])
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = 0;
        do
        {
          uint64_t v20 = *v18;
          unsigned int v21 = *(_DWORD *)(*v18 + 4);
          if (v21 == -1)
          {
            uint64_t v22 = 0;
            int32x4_t v15 = 0uLL;
            do
            {
              do
              {
                int32x4_t v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v20 + 4 * v22 + 16))));
                v22 += 4;
              }
              while (v22 != 32);
              uint64_t v22 = 0;
              unsigned int v21 = vaddvq_s32(v15);
              int32x4_t v15 = 0uLL;
            }
            while (v21 == -1);
            *(_DWORD *)(v20 + 4) = v21;
          }
          v17 += v21;
          v18 += 2;
        }
        while (v18 != v19);
      }
      *(void *)&long long v67 = v17;
    }
    if (!v17) {
      operator new();
    }
  }
  else
  {
    uint64_t v17 = v67;
  }
  if (v17 == 0xFFFFFFFFLL)
  {
    v23 = (uint64_t *)v68[0];
    v24 = (uint64_t *)v68[1];
    if (v68[0] == v68[1])
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      do
      {
        uint64_t v25 = *v23;
        unsigned int v26 = *(_DWORD *)(*v23 + 4);
        if (v26 == -1)
        {
          uint64_t v27 = 0;
          int32x4_t v15 = 0uLL;
          do
          {
            do
            {
              int32x4_t v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v25 + 4 * v27 + 16))));
              v27 += 4;
            }
            while (v27 != 32);
            uint64_t v27 = 0;
            unsigned int v26 = vaddvq_s32(v15);
            int32x4_t v15 = 0uLL;
          }
          while (v26 == -1);
          *(_DWORD *)(v25 + 4) = v26;
        }
        v17 += v26;
        v23 += 2;
      }
      while (v23 != v24);
    }
    *(void *)&long long v67 = v17;
  }
  if (v17 == 1)
  {
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v69, (uint64_t)&v67);
    long long v67 = 0uLL;
    uint64_t v28 = v68[0];
    for (uint64_t i = v68[1]; i != v28; i -= 16)
    {
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
      *(void *)(i - 8) = 0;
    }
    v68[1] = v28;
  }
  uint64_t v30 = v69;
  if ((void)v69 == 0xFFFFFFFFLL)
  {
    v31 = (uint64_t *)v70[0];
    v32 = (uint64_t *)v70[1];
    if (v70[0] == v70[1])
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = 0;
      do
      {
        uint64_t v33 = *v31;
        unsigned int v34 = *(_DWORD *)(*v31 + 4);
        if (v34 == -1)
        {
          uint64_t v35 = 0;
          int32x4_t v15 = 0uLL;
          do
          {
            do
            {
              int32x4_t v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v33 + 4 * v35 + 16))));
              v35 += 4;
            }
            while (v35 != 32);
            uint64_t v35 = 0;
            unsigned int v34 = vaddvq_s32(v15);
            int32x4_t v15 = 0uLL;
          }
          while (v34 == -1);
          *(_DWORD *)(v33 + 4) = v34;
        }
        v30 += v34;
        v31 += 2;
      }
      while (v31 != v32);
    }
    *(void *)&long long v69 = v30;
  }
  v57 = v7;
  if (v30)
  {
    -[KGDatabase degasPredicateForAllLabels:elementType:](self, "degasPredicateForAllLabels:elementType:", &v69, v5, *(double *)v15.i64);
    uint64_t v37 = *((void *)&v61 + 1);
    uint64_t v36 = v61;
    long long v73 = v61;
    unsigned int v38 = 1;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v36 = 0;
    unsigned int v38 = 0;
  }
  uint64_t v39 = v67;
  if ((void)v67 == 0xFFFFFFFFLL)
  {
    v40 = (uint64_t *)v68[0];
    v41 = (uint64_t *)v68[1];
    if (v68[0] == v68[1])
    {
      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = 0;
      do
      {
        uint64_t v42 = *v40;
        unsigned int v43 = *(_DWORD *)(*v40 + 4);
        if (v43 == -1)
        {
          uint64_t v44 = 0;
          int32x4_t v15 = 0uLL;
          do
          {
            do
            {
              int32x4_t v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v42 + 4 * v44 + 16))));
              v44 += 4;
            }
            while (v44 != 32);
            uint64_t v44 = 0;
            unsigned int v43 = vaddvq_s32(v15);
            int32x4_t v15 = 0uLL;
          }
          while (v43 == -1);
          *(_DWORD *)(v42 + 4) = v43;
        }
        v39 += v43;
        v40 += 2;
      }
      while (v40 != v41);
    }
    *(void *)&long long v67 = v39;
  }
  if (v39)
  {
    -[KGDatabase degasPredicateForAnyLabels:elementType:](self, "degasPredicateForAnyLabels:elementType:", &v67, v5, *(double *)v15.i64);
    uint64_t v45 = *((void *)&v61 + 1);
    uint64_t v46 = v61;
    long long v72 = v61;
    ++v38;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v46 = 0;
  }
  *(void *)&long long v61 = 0;
  *((void *)&v61 + 1) = &v61;
  uint64_t v62 = 0x4812000000;
  v63 = __Block_byref_object_copy__128;
  v64 = __Block_byref_object_dispose__129;
  v65 = &unk_1D17EE929;
  memset(v66, 0, sizeof(v66));
  v47 = [v8 properties];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __53__KGDatabase_degasPredicateFromKGFilter_elementType___block_invoke;
  v59[3] = &unk_1E68DB9C8;
  int v60 = v5;
  v59[4] = self;
  v59[5] = &v61;
  [v47 enumerateKeysAndObjectsUsingBlock:v59];

  v48 = *(uint64_t **)(*((void *)&v61 + 1) + 48);
  unint64_t v49 = *(void *)(*((void *)&v61 + 1) + 56) - (void)v48;
  if (v49 >= 0x11) {
    operator new();
  }
  if (v49 == 16)
  {
    uint64_t v51 = *v48;
    uint64_t v50 = v48[1];
    if (v50) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v50 + 8), 1uLL, memory_order_relaxed);
    }
    v52 = (std::__shared_weak_count *)*((void *)&v71 + 1);
    *(void *)&long long v71 = v51;
    *((void *)&v71 + 1) = v50;
    if (v52) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v52);
    }
    ++v38;
  }
  if (v38 >= 2)
  {
    memset(v58, 0, sizeof(v58));
    if (v36) {
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)v58, &v73);
    }
    if (v46) {
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)v58, &v72);
    }
    if ((void)v71) {
      std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)v58, &v71);
    }
    operator new();
  }
  if (v36)
  {
    void *v57 = v36;
    v57[1] = v37;
    long long v73 = 0uLL;
  }
  else if (v46)
  {
    void *v57 = v46;
    v57[1] = v45;
    long long v72 = 0uLL;
  }
  else if ((void)v71)
  {
    uint64_t v56 = *((void *)&v71 + 1);
    void *v57 = v71;
    v57[1] = v56;
    long long v71 = 0uLL;
  }
  else
  {
    void *v57 = 0;
    v57[1] = 0;
  }
  _Block_object_dispose(&v61, 8);
  v58[0] = (void **)v66;
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](v58);
  v53 = (std::__shared_weak_count *)*((void *)&v71 + 1);
  *(void *)&long long v61 = v68;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
  *(void *)&long long v61 = v70;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
  if (v53) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v53);
  }
  if (*((void *)&v72 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v72 + 1));
  }
  if (*((void *)&v73 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v73 + 1));
  }

  result.var1 = v55;
  result.var0 = v54;
  return result;
}

void __53__KGDatabase_degasPredicateFromKGFilter_elementType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) attributeIdentifierForPropertyName:a2];
  long long v22 = 0uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 allObjects];

    id v5 = (id)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    if ([v8 count])
    {
      v9 = *(void **)(a1 + 32);
      if (v9)
      {
        [v9 degasPredicateFromValueArray:v8 attrId:v6 elementType:*(unsigned int *)(a1 + 48)];
        int v11 = v20;
        uint64_t v10 = v21;
      }
      else
      {
        uint64_t v10 = 0;
        int v11 = 0;
      }
      *(void *)&long long v22 = v11;
      *((void *)&v22 + 1) = v10;
    }
    else
    {
      uint64_t v10 = 0;
      int v11 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      BOOL v12 = *(void **)(a1 + 32);
      v13 = [v8 value];
      uint64_t v14 = [v8 comparator];
      if (v12)
      {
        [v12 degasPredicateFromValue:v13 comparator:v14 attrId:v6 elementType:*(unsigned int *)(a1 + 48)];
        int v11 = v20;
        uint64_t v10 = v21;
      }
      else
      {
        uint64_t v10 = 0;
        int v11 = 0;
      }
      uint64_t v20 = 0;
      unsigned int v21 = 0;
      *(void *)&long long v22 = v11;
      *((void *)&v22 + 1) = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v17 = *(void **)(a1 + 32);
        if (v17)
        {
          [v17 degasPredicateFromValue:v5 comparator:1 attrId:v6 elementType:*(unsigned int *)(a1 + 48)];
          v18 = v20;
          uint64_t v10 = v21;
        }
        else
        {
          uint64_t v10 = 0;
          v18 = 0;
        }
        *(void *)&long long v22 = v18;
        *((void *)&v22 + 1) = v10;
        if (v18) {
          goto LABEL_29;
        }
        goto LABEL_22;
      }
      id v8 = v5;
      int v11 = *(void **)(a1 + 32);
      v13 = [v8 value1];
      int32x4_t v15 = [v8 value2];
      uint64_t v16 = [v8 comparator];
      if (v11)
      {
        [v11 degasRangePredicateFromValue1:v13 value2:v15 comparator:v16 attrId:v6 elementType:*(unsigned int *)(a1 + 48)];
        int v11 = v20;
        uint64_t v10 = v21;
      }
      else
      {
        uint64_t v10 = 0;
      }
      uint64_t v20 = 0;
      unsigned int v21 = 0;
      *(void *)&long long v22 = v11;
      *((void *)&v22 + 1) = v10;
    }
  }

  if (v11)
  {
LABEL_29:
    std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)(*(void *)(*(void *)(a1 + 40) + 8) + 48), &v22);
    goto LABEL_30;
  }
LABEL_22:
  v19 = KGLoggingConnection();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    _os_log_error_impl(&dword_1D1654000, v19, OS_LOG_TYPE_ERROR, "unexpected null predicate", (uint8_t *)&v20, 2u);
  }

LABEL_30:
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (shared_ptr<degas::Predicate>)degasPredicateForAnyLabels:(void *)a3 elementType:(int)a4
{
  id v5 = v4;
  switch(a4)
  {
    case 0:
      uint64_t v6 = KGLoggingConnection();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "unable to provide useful predicate for None element type", v7, 2u);
      }

      break;
    case 1:
      operator new();
    case 2:
      operator new();
    case 3:
      operator new();
    case 4:
      operator new();
    default:
      break;
  }
  *id v5 = 0;
  v5[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

- (shared_ptr<degas::Predicate>)degasPredicateForAllLabels:(void *)a3 elementType:(int)a4
{
  id v5 = v4;
  switch(a4)
  {
    case 0:
      uint64_t v6 = KGLoggingConnection();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "unable to provide useful predicate for None element type", v7, 2u);
      }

      break;
    case 1:
      operator new();
    case 2:
      operator new();
    case 3:
      operator new();
    case 4:
      operator new();
    default:
      break;
  }
  *id v5 = 0;
  v5[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (Predicate *)self;
  return result;
}

- (shared_ptr<degas::Predicate>)degasRangePredicateFromValue1:(id)a3 value2:(id)a4 comparator:(unint64_t)a5 attrId:(unint64_t)a6 elementType:(int)a7
{
  int v11 = v7;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v24 = 0u;
  memset(v25, 0, 25);
  uint64_t v14 = [v12 kgPropertyType];
  if (v14 == [v13 kgPropertyType])
  {
    switch(a7)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        rowCountForElementType(a7, (degas::Database *)self->_database);
        switch(v14)
        {
          case 0:
            uint64_t v20 = KGLoggingConnection();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf[0]) = 138412290;
              *(NSString *)((char *)buf + 4) = v12;
              _os_log_error_impl(&dword_1D1654000, v20, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", (uint8_t *)buf, 0xCu);
            }

            break;
          case 1:
          case 4:
            v12;
            id v17 = v13;
            operator new();
          case 2:
            id v21 = v12;
            id v22 = v13;
            operator new();
          case 3:
            id v18 = v12;
            id v19 = v13;
            stringNSToStd(buf, v18);
            stringNSToStd(__p, v19);
            operator new();
          default:
            goto LABEL_5;
        }
        return result;
      default:
        abort();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "selecting in a range with mismatched types", (uint8_t *)buf, 2u);
  }
LABEL_5:
  *int v11 = 0;
  v11[1] = 0;
  buf[0] = v25;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (shared_ptr<degas::Predicate>)degasPredicateFromValue:(id)a3 comparator:(unint64_t)a4 attrId:(unint64_t)a5 elementType:(int)a6
{
  v9 = v6;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [v10 kgPropertyType];
  switch(a6)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      rowCountForElementType(a6, (degas::Database *)self->_database);
      switch(v11)
      {
        case 0:
          id v12 = KGLoggingConnection();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = 138412290;
            *(NSString *)((char *)buf + 4) = v10;
            _os_log_error_impl(&dword_1D1654000, v12, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", (uint8_t *)buf, 0xCu);
          }

          break;
        case 1:
        case 4:
          [v10 longLongValue];
          operator new();
        case 2:
          [v10 doubleValue];
          operator new();
        case 3:
          stringNSToStd(buf, v10);
          operator new();
        default:
          break;
      }
      void *v9 = 0;
      v9[1] = 0;

      result.var1 = v14;
      result.var0 = v13;
      return result;
    default:
      abort();
  }
}

- (shared_ptr<degas::Predicate>)degasPredicateFromValueArray:(id)a3 attrId:(unint64_t)a4 elementType:(int)a5
{
  id v8 = v5;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[KGDatabase distributeValuesByType:toIntegerValues:floatValues:stringValues:](self, "distributeValuesByType:toIntegerValues:floatValues:stringValues:", v60, v62);
  switch(a5)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      rowCountForElementType(a5, (degas::Database *)self->_database);
      v80 = 0;
      uint64_t v81 = 0;
      uint64_t v82 = 0;
      if ([v63 count])
      {
        v77 = 0;
        v78 = 0;
        unint64_t v79 = 0;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        obuint64_t j = v63;
        uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v74 != v10) {
                objc_enumerationMutation(obj);
              }
              std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[*(id *)(*((void *)&v73 + 1) + 8 * i) UTF8String]);
              id v12 = v78;
              if ((unint64_t)v78 >= v79)
              {
                unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v78 - (char *)v77) >> 3);
                unint64_t v15 = v14 + 1;
                if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((uint64_t)(v79 - (void)v77) >> 3) > v15) {
                  unint64_t v15 = 0x5555555555555556 * ((uint64_t)(v79 - (void)v77) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v79 - (void)v77) >> 3) >= 0x555555555555555) {
                  unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v16 = v15;
                }
                if (v16) {
                  unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v16);
                }
                else {
                  uint64_t v17 = 0;
                }
                unint64_t v18 = v16 + 24 * v14;
                long long v19 = __p;
                *(void *)(v18 + 16) = v84;
                *(_OWORD *)unint64_t v18 = v19;
                uint64_t v84 = 0;
                long long __p = 0uLL;
                uint64_t v20 = (char *)(v18 + 24);
                id v21 = v77;
                id v22 = (void **)v78;
                if (v78 == (char *)v77)
                {
                  v77 = (void **)v18;
                  v78 = (char *)(v18 + 24);
                  unint64_t v79 = v16 + 24 * v17;
                }
                else
                {
                  do
                  {
                    long long v23 = *(_OWORD *)(v22 - 3);
                    *(void *)(v18 - 8) = *(v22 - 1);
                    *(_OWORD *)(v18 - 24) = v23;
                    v18 -= 24;
                    *(v22 - 2) = 0;
                    *(v22 - 1) = 0;
                    *(v22 - 3) = 0;
                    v22 -= 3;
                  }
                  while (v22 != v21);
                  id v22 = v77;
                  long long v24 = (void **)v78;
                  v77 = (void **)v18;
                  v78 = v20;
                  unint64_t v79 = v16 + 24 * v17;
                  while (v24 != v22)
                  {
                    if (*((char *)v24 - 1) < 0) {
                      operator delete(*(v24 - 3));
                    }
                    v24 -= 3;
                  }
                }
                if (v22) {
                  operator delete(v22);
                }
                v78 = v20;
                if (SHIBYTE(v84) < 0) {
                  operator delete((void *)__p);
                }
              }
              else
              {
                long long v13 = __p;
                *((void *)v78 + 2) = v84;
                *id v12 = v13;
                v78 = (char *)v12 + 24;
              }
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
          }
          while (v9);
        }

        operator new();
      }
      if ([v62 count])
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v25 = v62;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        uint64_t v28 = [v25 countByEnumeratingWithState:&v69 objects:v86 count:16];
        if (v28)
        {
          unint64_t v29 = 0;
          uint64_t v30 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v70 != v30) {
                objc_enumerationMutation(v25);
              }
              uint64_t v32 = [*(id *)(*((void *)&v69 + 1) + 8 * j) longLongValue];
              uint64_t v33 = v32;
              if ((unint64_t)v27 >= v29)
              {
                uint64_t v34 = v27 - v26;
                unint64_t v35 = v34 + 1;
                if ((unint64_t)(v34 + 1) >> 61) {
                  std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v29 - (void)v26) >> 2 > v35) {
                  unint64_t v35 = (uint64_t)(v29 - (void)v26) >> 2;
                }
                if (v29 - (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v36 = v35;
                }
                if (v36) {
                  unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v36);
                }
                else {
                  uint64_t v37 = 0;
                }
                unsigned int v38 = (uint64_t *)(v36 + 8 * v34);
                *unsigned int v38 = v33;
                uint64_t v39 = v38 + 1;
                while (v27 != v26)
                {
                  uint64_t v40 = *--v27;
                  *--unsigned int v38 = v40;
                }
                unint64_t v29 = v36 + 8 * v37;
                if (v26) {
                  operator delete(v26);
                }
                unsigned int v26 = v38;
                uint64_t v27 = v39;
              }
              else
              {
                *v27++ = v32;
              }
            }
            uint64_t v28 = [v25 countByEnumeratingWithState:&v69 objects:v86 count:16];
          }
          while (v28);
        }

        operator new();
      }
      if ([v61 count])
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v41 = v61;
        uint64_t v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = [v41 countByEnumeratingWithState:&v65 objects:v85 count:16];
        if (v44)
        {
          unint64_t v45 = 0;
          uint64_t v46 = *(void *)v66;
          do
          {
            for (uint64_t k = 0; k != v44; ++k)
            {
              if (*(void *)v66 != v46) {
                objc_enumerationMutation(v41);
              }
              [*(id *)(*((void *)&v65 + 1) + 8 * k) doubleValue];
              uint64_t v49 = v48;
              if ((unint64_t)v43 >= v45)
              {
                uint64_t v50 = (v43 - v42) >> 3;
                unint64_t v51 = v50 + 1;
                if ((unint64_t)(v50 + 1) >> 61) {
                  std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v45 - (void)v42) >> 2 > v51) {
                  unint64_t v51 = (uint64_t)(v45 - (void)v42) >> 2;
                }
                if (v45 - (unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v52 = v51;
                }
                if (v52) {
                  unint64_t v52 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v52);
                }
                else {
                  uint64_t v53 = 0;
                }
                v54 = (char *)(v52 + 8 * v50);
                *(void *)v54 = v49;
                v55 = v54 + 8;
                while (v43 != v42)
                {
                  uint64_t v56 = *((void *)v43 - 1);
                  v43 -= 8;
                  *((void *)v54 - 1) = v56;
                  v54 -= 8;
                }
                unint64_t v45 = v52 + 8 * v53;
                if (v42) {
                  operator delete(v42);
                }
                uint64_t v42 = v54;
                unsigned int v43 = v55;
              }
              else
              {
                *(void *)unsigned int v43 = v48;
                v43 += 8;
              }
            }
            uint64_t v44 = [v41 countByEnumeratingWithState:&v65 objects:v85 count:16];
          }
          while (v44);
        }

        operator new();
      }
      if ((unint64_t)(v81 - (void)v80) >= 0x11) {
        operator new();
      }
      if (v81 - (void)v80 == 16)
      {
        uint64_t v57 = v80[1];
        *id v8 = *v80;
        v8[1] = v57;
        if (v57) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v57 + 8), 1uLL, memory_order_relaxed);
        }
      }
      else
      {
        *id v8 = 0;
        v8[1] = 0;
      }
      *(void *)&long long __p = &v80;
      std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

      result.var1 = v59;
      result.var0 = v58;
      return result;
    default:
      abort();
  }
}

- (id)neighborNodesOfNodesForIdentifiers:(id)a3 throughEdgesForIdentifiers:(id)a4 direction:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v16 = 0u;
  memset(v17, 0, 25);
  int v12 = degas::Database::nodeNeighborsViaEdges((uint64_t)self->_database, (Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(void *)&v17[24]), (Bitmap *)objc_msgSend(v11, "bitmap"), (degas::Bitmap *)&v16, -[KGDatabase degasEdgeDirectionFromKG:](self, "degasEdgeDirectionFromKG:", a5));
  if (v12)
  {
    if (a6)
    {
      if ((v12 - 2) > 8) {
        uint64_t v13 = -1;
      }
      else {
        uint64_t v13 = qword_1D17CE530[v12 - 2];
      }
      kg_errorWithCode(v13);
      unint64_t v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v14 = 0;
    }
  }
  else
  {
    unint64_t v14 = [[KGElementIdentifierSet alloc] initWithBitmap:&v16];
  }
  unint64_t v18 = (void **)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);

  return v14;
}

- (id)neighborNodesOfNodesForIdentifiers:(id)a3 throughEdgesWithLabels:(id)a4 direction:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = [(KGDatabase *)self degasEdgeDirectionFromKG:a5];
  long long v19 = 0u;
  memset(v20, 0, 25);
  if ([(KGDatabase *)self labelIdentifiers:&v19 forLabels:v11])
  {
    long long v17 = 0u;
    memset(v18, 0, 25);
    int v13 = degas::Database::nodeNeighbors((uint64_t)self->_database, (Bitmap *)objc_msgSend(v10, "bitmap", 0, 0, 0, 0, 0, *(void *)&v18[24]), (degas::Bitmap *)&v17, (const degas::Bitmap *)&v19, v12);
    if (v13)
    {
      if (a6)
      {
        if ((v13 - 2) > 8) {
          uint64_t v14 = -1;
        }
        else {
          uint64_t v14 = qword_1D17CE530[v13 - 2];
        }
        kg_errorWithCode(v14);
        unint64_t v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v15 = 0;
      }
    }
    else
    {
      unint64_t v15 = [[KGElementIdentifierSet alloc] initWithBitmap:&v17];
    }
    id v21 = (void **)v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v21);
  }
  else
  {
    unint64_t v15 = objc_alloc_init(KGElementIdentifierSet);
  }
  *(void *)&long long v17 = v20;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);

  return v15;
}

- (id)edgeIdentifiersWithLabels:(id)a3 direction:(unint64_t)a4 forNodeIdentifier:(unint64_t)a5 error:(id *)a6
{
  [(KGDatabase *)self intersectionOfEdgesWithLabels:a3 error:a6];
  if (objc_claimAutoreleasedReturnValue())
  {
    [(KGDatabase *)self degasEdgeDirectionFromKG:a4];
    degas::Database::edgesOfNode();
  }

  return 0;
}

- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 error:(id *)a4
{
  long long v5 = 0u;
  memset(v6, 0, sizeof(v6));
  degas::Database::edgesOfNode();
}

- (id)allNodeIdentifiersOfEdgesWithIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  long long v8 = 0u;
  memset(v9, 0, 25);
  degas::Database::appendAllNodesForEdges((degas::Database *)self->_database, (Bitmap *)objc_msgSend(v5, "bitmap", 0, 0, 0, 0, 0, *(void *)&v9[24]), (degas::Bitmap *)&v8);
  uint64_t v6 = [[KGElementIdentifierSet alloc] initWithBitmap:&v8];
  id v10 = (void **)v9;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v10);

  return v6;
}

- (BOOL)appendNodeIdentifiersOfEdgesWithIdentifiers:(id)a3 sourceNodeIdentifiers:(id)a4 targetNodeIdentifiers:(id)a5 error:(id *)a6
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  unsigned int v12 = (void *)v11;
  if (v10 | v11)
  {
    database = (degas::Database *)self->_database;
    if (v10)
    {
      if (v11) {
        degas::Database::appendSourceAndTargetNodesForEdges(database, (Bitmap *)[v9 bitmap], (degas::Bitmap *)objc_msgSend((id)v10, "mutableBitmap"), (degas::Bitmap *)objc_msgSend((id)v11, "mutableBitmap"));
      }
      else {
        degas::Database::appendSourceNodesForEdges(database, (Bitmap *)[v9 bitmap], (degas::Bitmap *)objc_msgSend((id)v10, "mutableBitmap"));
      }
    }
    else
    {
      degas::Database::appendTargetNodesForEdges(database, (Bitmap *)[v9 bitmap], (degas::Bitmap *)objc_msgSend((id)v11, "mutableBitmap"));
    }
  }

  return 1;
}

- (id)filterEdgeIdentifiersBetween:(id)a3 targetNodeIdentifiers:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  memset(v14, 0, 41);
  database = (degas::Database *)self->_database;
  if (v11) {
    degas::Database::filterEdgesBetweenNodes(database, (const degas::Bitmap *)objc_msgSend(v9, "bitmap", *(_OWORD *)v14, *(void *)&v14[16], *(_OWORD *)&v14[24], *(void *)&v14[40]), (const degas::Bitmap *)objc_msgSend(v10, "bitmap"), (const degas::Bitmap *)objc_msgSend(v11, "bitmap"), (degas::Bitmap *)v14);
  }
  degas::Database::edgesBetweenNodes(database, (const degas::Bitmap *)objc_msgSend(v9, "bitmap", *(_OWORD *)v14, *(void *)&v14[16], *(_OWORD *)&v14[24], *(void *)&v14[40]), (const degas::Bitmap *)objc_msgSend(v10, "bitmap"), (degas::Bitmap *)v14);
}

- (id)filterInEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  *(_OWORD *)id v9 = 0u;
  objc_msgSend(v6, "bitmap", 0, 0, 0, 0, 0, *(void *)&v9[15]);
  [v7 bitmap];
  degas::Database::filterEdgesOfNodes();
}

- (id)filterOutEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  *(_OWORD *)id v9 = 0u;
  objc_msgSend(v6, "bitmap", 0, 0, 0, 0, 0, *(void *)&v9[15]);
  [v7 bitmap];
  degas::Database::filterEdgesOfNodes();
}

- (id)inEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 error:(id *)a4
{
  *(_OWORD *)id v5 = 0u;
  objc_msgSend(a3, "bitmap", 0, 0, 0, 0, 0, *(void *)&v5[15]);
  degas::Database::edgesOfNodes();
}

- (id)outEdgeIdentifiersOfNodesWithIdentifiers:(id)a3 error:(id *)a4
{
  *(_OWORD *)id v5 = 0u;
  objc_msgSend(a3, "bitmap", 0, 0, 0, 0, 0, *(void *)&v5[15]);
  degas::Database::edgesOfNodes();
}

- (void)transactionChangesAfterTransactionId:(unint64_t)a3 limit:(int64_t)a4 block:(id)a5
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  database = self->_database;
  v10[0] = &unk_1F2801468;
  v10[1] = &v9;
  v10[3] = v10;
  degas::Database::enumerateTransactionChangesAfterTransactionId((uint64_t)database, a3, v8, (uint64_t)v10);
  std::__function::__value_func<void ()(unsigned long long,degas::Database::TransactionChanges const&)>::~__value_func[abi:ne180100](v10);
}

- (void)transactionChangesAfterTransactionId:limit:block:
{
}

- (uint64_t)transactionChangesAfterTransactionId:limit:block:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F2801468;
  a2[1] = v2;
  return result;
}

- (id)unionOfTombstoneEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self unionOfEdgesForEdgeTable:(char *)self->_database + 864 withLabels:a3 filterEdgeIdentifiers:a4 error:a5];
  return v5;
}

- (id)unionOfTombstoneEdgesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self unionOfEdgesForEdgeTable:(char *)self->_database + 864 withLabels:a3 filterEdgeIdentifiers:0 error:a4];
  return v4;
}

- (id)unionOfEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self unionOfEdgesForEdgeTable:(char *)self->_database + 248 withLabels:a3 filterEdgeIdentifiers:a4 error:a5];
  return v5;
}

- (id)unionOfEdgesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self unionOfEdgesForEdgeTable:(char *)self->_database + 248 withLabels:a3 filterEdgeIdentifiers:0 error:a4];
  return v4;
}

- (id)unionOfEdgesForEdgeTable:(const void *)a3 withLabels:(id)a4 filterEdgeIdentifiers:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  long long v26 = 0u;
  memset(v27, 0, 25);
  memset(&v25, 0, 41);
  [(KGDatabase *)self labelIdentifiers:&v25 forLabels:v10];
  if (v25._bitSets.__begin_ == v25._bitSets.__end_
    || (database = (void **)self->_database,
        v24[0] = (void **)a3,
        v24[1] = database,
        (int v14 = degas::EdgeLabelQuery::edgesForAnyLabels((const degas::EdgeTable **)v24, &v25, (degas::Bitmap *)&v26)) == 0))
  {
    if (v11)
    {
      uint64_t v16 = v26;
      if ((void)v26 == 0xFFFFFFFFLL)
      {
        long long v17 = (uint64_t *)v27[0];
        unint64_t v18 = (uint64_t *)v27[1];
        if (v27[0] == v27[1])
        {
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v16 = 0;
          do
          {
            uint64_t v19 = *v17;
            unsigned int v20 = *(_DWORD *)(*v17 + 4);
            if (v20 == -1)
            {
              uint64_t v21 = 0;
              int32x4_t v12 = 0uLL;
              do
              {
                do
                {
                  int32x4_t v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                  v21 += 4;
                }
                while (v21 != 32);
                uint64_t v21 = 0;
                unsigned int v20 = vaddvq_s32(v12);
                int32x4_t v12 = 0uLL;
              }
              while (v20 == -1);
              *(_DWORD *)(v19 + 4) = v20;
            }
            v16 += v20;
            v17 += 2;
          }
          while (v17 != v18);
        }
        *(void *)&long long v26 = v16;
      }
      if (v16) {
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v26, (degas::Bitmap *)objc_msgSend(v11, "bitmap", *(double *)v12.i64));
      }
    }
    id v22 = [[KGElementIdentifierSet alloc] initWithBitmap:&v26];
  }
  else if (a6)
  {
    if ((v14 - 2) > 8) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = qword_1D17CE530[v14 - 2];
    }
    kg_errorWithCode(v15);
    id v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }
  v24[0] = (void **)&v25._bitSets.__begin_;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v24);
  v25._bitCount = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

  return v22;
}

- (id)intersectionOfTombstoneEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self intersectionOfEdgesForEdgeTable:(char *)self->_database + 864 withLabels:a3 filterEdgeIdentifiers:a4 overrideIndex:0 error:a5];
  return v5;
}

- (id)intersectionOfTombstoneEdgesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self intersectionOfEdgesForEdgeTable:(char *)self->_database + 864 withLabels:a3 filterEdgeIdentifiers:0 overrideIndex:0 error:a4];
  return v4;
}

- (id)intersectionOfEdgesWithLabels:(id)a3 filterEdgeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self intersectionOfEdgesForEdgeTable:(char *)self->_database + 248 withLabels:a3 filterEdgeIdentifiers:a4 overrideIndex:0 error:a5];
  return v5;
}

- (id)noIndexIntersectionOfEdgesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self intersectionOfEdgesForEdgeTable:(char *)self->_database + 248 withLabels:a3 filterEdgeIdentifiers:0 overrideIndex:1 error:a4];
  return v4;
}

- (id)intersectionOfEdgesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self intersectionOfEdgesForEdgeTable:(char *)self->_database + 248 withLabels:a3 filterEdgeIdentifiers:0 overrideIndex:0 error:a4];
  return v4;
}

- (id)intersectionOfEdgesForEdgeTable:(const void *)a3 withLabels:(id)a4 filterEdgeIdentifiers:(id)a5 overrideIndex:(BOOL)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  long long v29 = 0u;
  memset(v30, 0, 25);
  long long v27 = 0u;
  memset(v28, 0, 25);
  if ([(KGDatabase *)self labelIdentifiers:&v27 forLabels:v12]
    && (database = (void **)self->_database,
        v26[0] = (void **)a3,
        v26[1] = database,
        (int v16 = degas::EdgeLabelQuery::edgesForAllLabels((const degas::EdgeTable **)v26, (const degas::Bitmap *)&v27, (degas::Bitmap *)&v29, a6)) != 0))
  {
    if (a7)
    {
      if ((v16 - 2) > 8) {
        uint64_t v17 = -1;
      }
      else {
        uint64_t v17 = qword_1D17CE530[v16 - 2];
      }
      kg_errorWithCode(v17);
      long long v24 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v24 = 0;
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v18 = v29;
      if ((void)v29 == 0xFFFFFFFFLL)
      {
        uint64_t v19 = (uint64_t *)v30[0];
        unsigned int v20 = (uint64_t *)v30[1];
        if (v30[0] == v30[1])
        {
          uint64_t v18 = 0;
        }
        else
        {
          uint64_t v18 = 0;
          do
          {
            uint64_t v21 = *v19;
            unsigned int v22 = *(_DWORD *)(*v19 + 4);
            if (v22 == -1)
            {
              uint64_t v23 = 0;
              int32x4_t v14 = 0uLL;
              do
              {
                do
                {
                  int32x4_t v14 = (int32x4_t)vpadalq_u16((uint32x4_t)v14, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v21 + 4 * v23 + 16))));
                  v23 += 4;
                }
                while (v23 != 32);
                uint64_t v23 = 0;
                unsigned int v22 = vaddvq_s32(v14);
                int32x4_t v14 = 0uLL;
              }
              while (v22 == -1);
              *(_DWORD *)(v21 + 4) = v22;
            }
            v18 += v22;
            v19 += 2;
          }
          while (v19 != v20);
        }
        *(void *)&long long v29 = v18;
      }
      if (v18) {
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v29, (degas::Bitmap *)objc_msgSend(v13, "bitmap", *(double *)v14.i64));
      }
    }
    long long v24 = [[KGElementIdentifierSet alloc] initWithBitmap:&v29];
  }
  v26[0] = (void **)v28;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v26);
  *(void *)&long long v27 = v30;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);

  return v24;
}

- (id)allTombstoneEdgesWithError:(id *)a3
{
  return [(KGDatabase *)self allEdgesForEdgeTable:(char *)self->_database + 864 withError:a3];
}

- (id)allEdgesWithError:(id *)a3
{
  return [(KGDatabase *)self allEdgesForEdgeTable:(char *)self->_database + 248 withError:a3];
}

- (id)allEdgesForEdgeTable:(const void *)a3 withError:(id *)a4
{
  long long v11 = 0u;
  memset(v12, 0, 25);
  database = (void **)self->_database;
  v10[0] = (void **)a3;
  v10[1] = database;
  int v6 = degas::EdgeLabelQuery::allEdges((const degas::EdgeTable **)v10, (degas::Bitmap *)&v11);
  if (v6)
  {
    if (a4)
    {
      if ((v6 - 2) > 8) {
        uint64_t v7 = -1;
      }
      else {
        uint64_t v7 = qword_1D17CE530[v6 - 2];
      }
      kg_errorWithCode(v7);
      unsigned int v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = [[KGElementIdentifierSet alloc] initWithBitmap:&v11];
  }
  v10[0] = (void **)v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v10);
  return v8;
}

- (id)edgeIdentifiersSortedByPropertyForName:(id)a3 dataType:(int64_t)a4 ascending:(BOOL)a5 limit:(int64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sqlite3_int64 v17 = [(KGDatabase *)self attributeIdentifierForPropertyName:v14];
  int v18 = 6;
  switch(a4)
  {
    case 0:
      goto LABEL_7;
    case 1:
    case 4:
      database = self->_database;
      unsigned int v20 = (Bitmap *)[v15 bitmap];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke;
      v33[3] = &unk_1E68DB950;
      id v34 = v16;
      int v18 = degas::Database::sortEdgesByIntAttribute((uint64_t)database, v17, v11, a6, v20, (uint64_t)v33);
      uint64_t v21 = &v34;
      goto LABEL_6;
    case 2:
      unsigned int v22 = self->_database;
      uint64_t v23 = (Bitmap *)[v15 bitmap];
      long long v24 = v32;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_2;
      v32[3] = &unk_1E68DB978;
      v32[4] = v16;
      int v25 = degas::Database::sortEdgesByRealAttribute((uint64_t)v22, v17, v11, a6, v23, (uint64_t)v32);
      goto LABEL_5;
    case 3:
      long long v26 = self->_database;
      long long v27 = (Bitmap *)[v15 bitmap];
      long long v24 = v31;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_3;
      v31[3] = &unk_1E68DB9A0;
      v31[4] = v16;
      int v25 = degas::Database::sortEdgesByStringAttribute((uint64_t)v26, v17, v11, a6, v27, (uint64_t)v31);
LABEL_5:
      int v18 = v25;
      uint64_t v21 = (id *)(v24 + 4);
LABEL_6:

      if (!v18) {
        goto LABEL_10;
      }
LABEL_7:
      if (a8)
      {
        if ((v18 - 2) > 8) {
          uint64_t v28 = -1;
        }
        else {
          uint64_t v28 = qword_1D17CE530[v18 - 2];
        }
        kg_errorWithCode(v28);
        id v29 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v29 = 0;
      }
      break;
    default:
LABEL_10:
      id v29 = v16;
      break;
  }

  return v29;
}

void __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

void __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

void __100__KGDatabase_edgeIdentifiersSortedByPropertyForName_dataType_ascending_limit_edgeIdentifiers_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8
{
  unsigned int v8 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:a3 rangeValue1:a4 rangeValue2:a5 comparator:a6 elementIdentifiers:a7 valueTable:(char *)self->_database + 1088 rowCount:1000 error:a8];
  return v8;
}

- (id)filterEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 edgeIdentifiers:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  int v18 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:v14 rangeValue1:v15 rangeValue2:v16 comparator:a6 elementIdentifiers:v17 valueTable:(char *)self->_database + 528 rowCount:degas::Database::edgeCount((degas::Database *)self->_database) error:a8];

  return v18;
}

- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  uint64_t v7 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:a3 values:a4 comparator:a5 elementIdentifiers:a6 valueTable:(char *)self->_database + 1088 rowCount:1000 error:a7];
  return v7;
}

- (id)filterEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:v12 values:v13 comparator:a5 elementIdentifiers:v14 valueTable:(char *)self->_database + 528 rowCount:degas::Database::edgeCount((degas::Database *)self->_database) error:a7];

  return v15;
}

- (id)filterTombstoneEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  uint64_t v7 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:a3 value:a4 comparator:a5 elementIdentifiers:a6 valueTable:(char *)self->_database + 1088 rowCount:1000 error:a7];
  return v7;
}

- (id)filterEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 edgeIdentifiers:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:v12 value:v13 comparator:a5 elementIdentifiers:v14 valueTable:(char *)self->_database + 528 rowCount:degas::Database::edgeCount((degas::Database *)self->_database) error:a7];

  return v15;
}

- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self elementIdentifiersForPropertyName:a3 values:a4 valueTable:(char *)self->_database + 1088 rowCount:1000 error:a5];
  return v5;
}

- (id)edgeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(KGDatabase *)self elementIdentifiersForPropertyName:v8 values:v9 valueTable:(char *)self->_database + 528 rowCount:degas::Database::edgeCount((degas::Database *)self->_database) error:a5];

  return v10;
}

- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7 = [(KGDatabase *)self elementIdentifiersForPropertyName:a3 rangeValue1:a4 rangeValue2:a5 comparator:a6 valueTable:(char *)self->_database + 1088 rowCount:1000 error:a7];
  return v7;
}

- (id)edgeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(KGDatabase *)self elementIdentifiersForPropertyName:v12 rangeValue1:v13 rangeValue2:v14 comparator:a6 valueTable:(char *)self->_database + 528 rowCount:degas::Database::edgeCount((degas::Database *)self->_database) error:a7];

  return v15;
}

- (id)tombstoneEdgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  int v6 = [(KGDatabase *)self elementIdentifiersForPropertyName:a3 value:a4 comparator:a5 valueTable:(char *)self->_database + 1088 rowCount:1000 error:a6];
  return v6;
}

- (id)edgeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(KGDatabase *)self elementIdentifiersForPropertyName:v10 value:v11 comparator:a5 valueTable:(char *)self->_database + 528 rowCount:degas::Database::edgeCount((degas::Database *)self->_database) error:a6];

  return v12;
}

- (id)unionOfTombstoneNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self unionOfNodesForNodeTable:(char *)self->_database + 808 withLabels:a3 filterNodeIdentifiers:a4 error:a5];
  return v5;
}

- (id)unionOfTombstoneNodesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self unionOfNodesForNodeTable:(char *)self->_database + 808 withLabels:a3 filterNodeIdentifiers:0 error:a4];
  return v4;
}

- (id)unionOfNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self unionOfNodesForNodeTable:(char *)self->_database + 192 withLabels:a3 filterNodeIdentifiers:a4 error:a5];
  return v5;
}

- (id)unionOfNodesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self unionOfNodesForNodeTable:(char *)self->_database + 192 withLabels:a3 filterNodeIdentifiers:0 error:a4];
  return v4;
}

- (id)unionOfNodesForNodeTable:(const void *)a3 withLabels:(id)a4 filterNodeIdentifiers:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  long long v26 = 0u;
  memset(v27, 0, 25);
  memset(&v25, 0, 41);
  [(KGDatabase *)self labelIdentifiers:&v25 forLabels:v10];
  if (v25._bitSets.__begin_ == v25._bitSets.__end_
    || (database = (void **)self->_database,
        v24[0] = (void **)a3,
        v24[1] = database,
        (int v14 = degas::NodeLabelQuery::nodesForAnyLabels((const degas::NodeTable **)v24, &v25, (degas::Bitmap *)&v26)) == 0))
  {
    if (v11)
    {
      uint64_t v16 = v26;
      if ((void)v26 == 0xFFFFFFFFLL)
      {
        id v17 = (uint64_t *)v27[0];
        int v18 = (uint64_t *)v27[1];
        if (v27[0] == v27[1])
        {
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v16 = 0;
          do
          {
            uint64_t v19 = *v17;
            unsigned int v20 = *(_DWORD *)(*v17 + 4);
            if (v20 == -1)
            {
              uint64_t v21 = 0;
              int32x4_t v12 = 0uLL;
              do
              {
                do
                {
                  int32x4_t v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v19 + 4 * v21 + 16))));
                  v21 += 4;
                }
                while (v21 != 32);
                uint64_t v21 = 0;
                unsigned int v20 = vaddvq_s32(v12);
                int32x4_t v12 = 0uLL;
              }
              while (v20 == -1);
              *(_DWORD *)(v19 + 4) = v20;
            }
            v16 += v20;
            v17 += 2;
          }
          while (v17 != v18);
        }
        *(void *)&long long v26 = v16;
      }
      if (v16) {
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v26, (degas::Bitmap *)objc_msgSend(v11, "bitmap", *(double *)v12.i64));
      }
    }
    unsigned int v22 = [[KGElementIdentifierSet alloc] initWithBitmap:&v26];
  }
  else if (a6)
  {
    if ((v14 - 2) > 8) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = qword_1D17CE530[v14 - 2];
    }
    kg_errorWithCode(v15);
    unsigned int v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v22 = 0;
  }
  v24[0] = (void **)&v25._bitSets.__begin_;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v24);
  v25._bitCount = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

  return v22;
}

- (id)intersectionOfTombstoneNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self intersectionOfNodesForNodeTable:(char *)self->_database + 808 withLabels:a3 filterNodeIdentifiers:a4 overrideIndex:0 error:a5];
  return v5;
}

- (id)intersectionOfTombstoneNodesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self intersectionOfNodesForNodeTable:(char *)self->_database + 808 withLabels:a3 filterNodeIdentifiers:0 overrideIndex:0 error:a4];
  return v4;
}

- (id)intersectionOfNodesWithLabels:(id)a3 filterNodeIdentifiers:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self intersectionOfNodesForNodeTable:(char *)self->_database + 192 withLabels:a3 filterNodeIdentifiers:a4 overrideIndex:0 error:a5];
  return v5;
}

- (id)noIndexIntersectionOfNodesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self intersectionOfNodesForNodeTable:(char *)self->_database + 192 withLabels:a3 filterNodeIdentifiers:0 overrideIndex:1 error:a4];
  return v4;
}

- (id)intersectionOfNodesWithLabels:(id)a3 error:(id *)a4
{
  v4 = [(KGDatabase *)self intersectionOfNodesForNodeTable:(char *)self->_database + 192 withLabels:a3 filterNodeIdentifiers:0 overrideIndex:0 error:a4];
  return v4;
}

- (id)intersectionOfNodesForNodeTable:(const void *)a3 withLabels:(id)a4 filterNodeIdentifiers:(id)a5 overrideIndex:(BOOL)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  long long v29 = 0u;
  memset(v30, 0, 25);
  long long v27 = 0u;
  memset(v28, 0, 25);
  if ([(KGDatabase *)self labelIdentifiers:&v27 forLabels:v12]
    && (database = (void **)self->_database,
        v26[0] = (void **)a3,
        v26[1] = database,
        (int v16 = degas::NodeLabelQuery::nodesForAllLabels((const degas::NodeTable **)v26, (const degas::Bitmap *)&v27, (degas::Bitmap *)&v29, a6)) != 0))
  {
    if (a7)
    {
      if ((v16 - 2) > 8) {
        uint64_t v17 = -1;
      }
      else {
        uint64_t v17 = qword_1D17CE530[v16 - 2];
      }
      kg_errorWithCode(v17);
      long long v24 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v24 = 0;
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v18 = v29;
      if ((void)v29 == 0xFFFFFFFFLL)
      {
        uint64_t v19 = (uint64_t *)v30[0];
        unsigned int v20 = (uint64_t *)v30[1];
        if (v30[0] == v30[1])
        {
          uint64_t v18 = 0;
        }
        else
        {
          uint64_t v18 = 0;
          do
          {
            uint64_t v21 = *v19;
            unsigned int v22 = *(_DWORD *)(*v19 + 4);
            if (v22 == -1)
            {
              uint64_t v23 = 0;
              int32x4_t v14 = 0uLL;
              do
              {
                do
                {
                  int32x4_t v14 = (int32x4_t)vpadalq_u16((uint32x4_t)v14, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v21 + 4 * v23 + 16))));
                  v23 += 4;
                }
                while (v23 != 32);
                uint64_t v23 = 0;
                unsigned int v22 = vaddvq_s32(v14);
                int32x4_t v14 = 0uLL;
              }
              while (v22 == -1);
              *(_DWORD *)(v21 + 4) = v22;
            }
            v18 += v22;
            v19 += 2;
          }
          while (v19 != v20);
        }
        *(void *)&long long v29 = v18;
      }
      if (v18) {
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v29, (degas::Bitmap *)objc_msgSend(v13, "bitmap", *(double *)v14.i64));
      }
    }
    long long v24 = [[KGElementIdentifierSet alloc] initWithBitmap:&v29];
  }
  v26[0] = (void **)v28;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v26);
  *(void *)&long long v27 = v30;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);

  return v24;
}

- (id)allTombstoneNodesWithError:(id *)a3
{
  return [(KGDatabase *)self allNodesForTable:(char *)self->_database + 808 error:a3];
}

- (id)nodeIdentifiersWhereNoOutEdgesWithError:(id *)a3
{
  id v5 = (degas::NodeCursor *)degas::NodeCursor::NodeCursor(v14);
  degas::NodeCursor::setForNoOutEdges(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  long long v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    int v6 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v6 != 1) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v7);
  }
  unsigned int v8 = v6 - 2;
  if (v6 == 2)
  {
    id v9 = [[KGElementIdentifierSet alloc] initWithBitmap:&v12];
  }
  else if (a3)
  {
    if (v8 > 8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = qword_1D17CE530[v8];
    }
    kg_errorWithCode(v10);
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v15 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  degas::Cursor::~Cursor(v14);
  return v9;
}

- (id)nodeIdentifiersWhereNoInEdgesWithError:(id *)a3
{
  id v5 = (degas::NodeCursor *)degas::NodeCursor::NodeCursor(v14);
  degas::NodeCursor::setForNoInEdges(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  long long v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    int v6 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v6 != 1) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v7);
  }
  unsigned int v8 = v6 - 2;
  if (v6 == 2)
  {
    id v9 = [[KGElementIdentifierSet alloc] initWithBitmap:&v12];
  }
  else if (a3)
  {
    if (v8 > 8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = qword_1D17CE530[v8];
    }
    kg_errorWithCode(v10);
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v15 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  degas::Cursor::~Cursor(v14);
  return v9;
}

- (id)nodeIdentifiersWhereNoEdgesWithError:(id *)a3
{
  id v5 = (degas::NodeCursor *)degas::NodeCursor::NodeCursor(v14);
  degas::NodeCursor::setForNoEdges(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  long long v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    int v6 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    if (v6 != 1) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v7);
  }
  unsigned int v8 = v6 - 2;
  if (v6 == 2)
  {
    id v9 = [[KGElementIdentifierSet alloc] initWithBitmap:&v12];
  }
  else if (a3)
  {
    if (v8 > 8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = qword_1D17CE530[v8];
    }
    kg_errorWithCode(v10);
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v15 = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  degas::Cursor::~Cursor(v14);
  return v9;
}

- (id)allNodesWithError:(id *)a3
{
  return [(KGDatabase *)self allNodesForTable:(char *)self->_database + 192 error:a3];
}

- (id)allNodesForTable:(const void *)a3 error:(id *)a4
{
  long long v11 = 0u;
  memset(v12, 0, 25);
  database = (void **)self->_database;
  v10[0] = (void **)a3;
  v10[1] = database;
  int v6 = degas::NodeLabelQuery::allNodes((const degas::NodeTable **)v10, (degas::Bitmap *)&v11);
  if (v6)
  {
    if (a4)
    {
      if ((v6 - 2) > 8) {
        uint64_t v7 = -1;
      }
      else {
        uint64_t v7 = qword_1D17CE530[v6 - 2];
      }
      kg_errorWithCode(v7);
      unsigned int v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = [[KGElementIdentifierSet alloc] initWithBitmap:&v11];
  }
  v10[0] = (void **)v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v10);
  return v8;
}

- (id)nodeIdentifiersSortedByPropertyForName:(id)a3 dataType:(int64_t)a4 ascending:(BOOL)a5 limit:(int64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sqlite3_int64 v17 = [(KGDatabase *)self attributeIdentifierForPropertyName:v14];
  int v18 = 6;
  switch(a4)
  {
    case 0:
      goto LABEL_7;
    case 1:
    case 4:
      database = self->_database;
      unsigned int v20 = (Bitmap *)[v15 bitmap];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke;
      v33[3] = &unk_1E68DB950;
      id v34 = v16;
      int v18 = degas::Database::sortNodesByIntAttribute((uint64_t)database, v17, v11, a6, v20, (uint64_t)v33);
      uint64_t v21 = &v34;
      goto LABEL_6;
    case 2:
      unsigned int v22 = self->_database;
      uint64_t v23 = (Bitmap *)[v15 bitmap];
      long long v24 = v32;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_2;
      v32[3] = &unk_1E68DB978;
      v32[4] = v16;
      int v25 = degas::Database::sortNodesByRealAttribute((uint64_t)v22, v17, v11, a6, v23, (uint64_t)v32);
      goto LABEL_5;
    case 3:
      long long v26 = self->_database;
      long long v27 = (Bitmap *)[v15 bitmap];
      long long v24 = v31;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_3;
      v31[3] = &unk_1E68DB9A0;
      v31[4] = v16;
      int v25 = degas::Database::sortNodesByStringAttribute((uint64_t)v26, v17, v11, a6, v27, (uint64_t)v31);
LABEL_5:
      int v18 = v25;
      uint64_t v21 = (id *)(v24 + 4);
LABEL_6:

      if (!v18) {
        goto LABEL_10;
      }
LABEL_7:
      if (a8)
      {
        if ((v18 - 2) > 8) {
          uint64_t v28 = -1;
        }
        else {
          uint64_t v28 = qword_1D17CE530[v18 - 2];
        }
        kg_errorWithCode(v28);
        id v29 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v29 = 0;
      }
      break;
    default:
LABEL_10:
      id v29 = v16;
      break;
  }

  return v29;
}

void __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

void __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

void __100__KGDatabase_nodeIdentifiersSortedByPropertyForName_dataType_ascending_limit_nodeIdentifiers_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(v2, "addObject:");
}

- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8
{
  unsigned int v8 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:a3 rangeValue1:a4 rangeValue2:a5 comparator:a6 elementIdentifiers:a7 valueTable:(char *)self->_database + 1032 rowCount:1000 error:a8];
  return v8;
}

- (id)filterNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 nodeIdentifiers:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  int v18 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:v14 rangeValue1:v15 rangeValue2:v16 comparator:a6 elementIdentifiers:v17 valueTable:(char *)self->_database + 472 rowCount:degas::Database::nodeCount((degas::Database *)self->_database) error:a8];

  return v18;
}

- (id)filterElementIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 elementIdentifiers:(id)a7 valueTable:(const void *)a8 rowCount:(unint64_t)a9 error:(id *)a10
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  sqlite3_int64 v20 = [(KGDatabase *)self attributeIdentifierForPropertyName:v16];
  if (!v20)
  {
    int v25 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_41;
  }
  long long v44 = 0u;
  memset(v45, 0, 25);
  uint64_t v21 = [v17 kgPropertyType];
  if (v21 == [v18 kgPropertyType])
  {
    if (a6 >= 9) {
      LODWORD(a6) = 1;
    }
    v43[0] = (uint64_t)a8;
    v43[1] = a9;
    switch(v21)
    {
      case 0:
        long long v27 = KGLoggingConnection();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v17;
          _os_log_error_impl(&dword_1D1654000, v27, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", buf, 0xCu);
        }

        goto LABEL_26;
      case 1:
      case 4:
        id v22 = v17;
        id v23 = v18;
        if (v19) {
          int v24 = degas::AttributeQuery::filterElementsForAttributeValueRange(v43, v20, objc_msgSend(v22, "longLongValue", v22), objc_msgSend(v23, "longLongValue"), a6, (Bitmap *)objc_msgSend(v19, "bitmap"), (degas::AggregateValueCursor *)&v44);
        }
        else {
          int v24 = degas::AttributeQuery::elementsForAttributeValueRange(v43, v20, objc_msgSend(v22, "longLongValue", v22), objc_msgSend(v23, "longLongValue"), a6, (degas::Bitmap *)&v44);
        }
        goto LABEL_22;
      case 2:
        id v28 = v17;
        id v29 = v18;
        [v28 doubleValue];
        double v31 = v30;
        [v29 doubleValue];
        if (v19) {
          int v24 = degas::AttributeQuery::filterElementsForAttributeValueRange(v43, v20, a6, (Bitmap *)[v19 bitmap], (degas::AggregateValueCursor *)&v44, v31, v32);
        }
        else {
          int v24 = degas::AttributeQuery::elementsForAttributeValueRange(v43, v20, a6, (degas::Bitmap *)&v44, v31, v32);
        }
LABEL_22:
        int v36 = v24;
        goto LABEL_23;
      case 3:
        id v33 = v17;
        id v34 = v18;
        stringNSToStd((NSString *)buf, v33);
        stringNSToStd(__p, v34);
        if (v19) {
          int v35 = degas::AttributeQuery::filterElementsForAttributeValueRange(v43, v20, (uint64_t)buf, (uint64_t)__p, a6, (Bitmap *)[v19 bitmap], (degas::AggregateValueCursor *)&v44);
        }
        else {
          int v35 = degas::AttributeQuery::elementsForAttributeValueRange(v43, v20, (uint64_t)buf, (uint64_t)__p, a6, (degas::Bitmap *)&v44);
        }
        int v36 = v35;
        if (v42 < 0) {
          operator delete(__p[0]);
        }
        if (v47 < 0) {
          operator delete(*(void **)buf);
        }
LABEL_23:

        unsigned int v37 = v36 - 2;
        if (v36 == 2) {
          goto LABEL_26;
        }
        if (!v36)
        {
          unsigned int v38 = [[KGElementIdentifierSet alloc] initWithBitmap:&v44];
LABEL_27:
          int v25 = v38;
          goto LABEL_40;
        }
        if (!a10) {
          goto LABEL_39;
        }
        if (v37 > 8) {
          uint64_t v39 = -1;
        }
        else {
          uint64_t v39 = qword_1D17CE530[v37];
        }
        kg_errorWithCode(v39);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_26:
        unsigned int v38 = objc_alloc_init(KGElementIdentifierSet);
        goto LABEL_27;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "selecting in a range with mismatched types", buf, 2u);
    if (a10) {
      goto LABEL_11;
    }
LABEL_39:
    int v25 = 0;
    goto LABEL_40;
  }
  if (!a10) {
    goto LABEL_39;
  }
LABEL_11:
  kg_errorWithCode(5004);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  int v25 = 0;
  *a10 = v26;
LABEL_40:
  *(void *)buf = v45;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_41:

  return v25;
}

- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  uint64_t v7 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:a3 values:a4 comparator:a5 elementIdentifiers:a6 valueTable:(char *)self->_database + 1032 rowCount:1000 error:a7];
  return v7;
}

- (id)filterNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:v12 values:v13 comparator:a5 elementIdentifiers:v14 valueTable:(char *)self->_database + 472 rowCount:degas::Database::nodeCount((degas::Database *)self->_database) error:a7];

  return v15;
}

- (id)filterElementIdentifiersForPropertyName:(id)a3 values:(id)a4 comparator:(unint64_t)a5 elementIdentifiers:(id)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v63 = a4;
  id v64 = a6;
  id v61 = v15;
  sqlite3_int64 v16 = [(KGDatabase *)self attributeIdentifierForPropertyName:v15];
  long long v80 = 0u;
  memset(v81, 0, 25);
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[KGDatabase distributeValuesByType:toIntegerValues:floatValues:stringValues:](self, "distributeValuesByType:toIntegerValues:floatValues:stringValues:", v63, v66);
  v79[0] = (void **)a7;
  v79[1] = (void **)a8;
  unint64_t v17 = [v65 count];
  unint64_t v18 = v17;
  if (v17)
  {
    v58 = a7;
    unint64_t v59 = a5;
    unint64_t v57 = a8;
    if (v17 >> 61) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    sqlite3_int64 v60 = v16;
    id v19 = (char *)operator new(8 * v17);
    bzero(v19, 8 * v18);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v20 = v65;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v21)
    {
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v76 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          size_t v26 = [v25 lengthOfBytesUsingEncoding:4] + 1;
          long long v27 = malloc_type_malloc(v26, 0x69A9D275uLL);
          *(void *)&v19[8 * v22 + 8 * i] = v27;
          [v25 getCString:v27 maxLength:v26 encoding:4];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v75 objects:v84 count:16];
        v22 += i;
      }
      while (v21);
    }

    sqlite3_int64 v16 = v60;
    if (v59 >= 9) {
      int v28 = 1;
    }
    else {
      int v28 = v59;
    }
    if (v64) {
      int v29 = degas::implFilterElementsForAttributeValues<char const*>(v60, v19, v18, v28, (Bitmap *)[v64 bitmap], (degas::AggregateValueCursor *)&v80, (uint64_t)v58, v57);
    }
    else {
      int v29 = degas::implElementsForAttributeValues<char const*>(v60, v19, v18, v28, (degas::Bitmap *)&v80, (uint64_t)v58);
    }
    int v30 = v29;
    uint64_t v31 = 0;
    if (v18 <= 1) {
      unint64_t v18 = 1;
    }
    do
    {
      free(*(void **)&v19[8 * v31]);
      *(void *)&v19[8 * v31++] = 0;
    }
    while (v18 != v31);
    if ((v30 & 0xFFFFFFFD) != 0)
    {
      if (a9)
      {
        if ((v30 - 2) > 8) {
          uint64_t v32 = -1;
        }
        else {
          uint64_t v32 = qword_1D17CE530[v30 - 2];
        }
        kg_errorWithCode(v32);
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_69;
    }
    operator delete(v19);
  }
  unint64_t v33 = [v66 count];
  unint64_t v34 = v33;
  if (v33)
  {
    if (v33 >> 61) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    id v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v33);
    bzero(v19, 8 * v34);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v35 = v66;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v36)
    {
      uint64_t v37 = 0;
      uint64_t v38 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v72 != v38) {
            objc_enumerationMutation(v35);
          }
          *(void *)&v19[8 * v37 + 8 * j] = [*(id *)(*((void *)&v71 + 1) + 8 * j) longLongValue];
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v83 count:16];
        v37 += j;
      }
      while (v36);
    }

    uint64_t v40 = &v19[8 * v34];
    if (v64) {
      int v41 = degas::AttributeQuery::filterElementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v40 - v19) >> 3, 1, (Bitmap *)[v64 bitmap], (degas::AggregateValueCursor *)&v80);
    }
    else {
      int v41 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v40 - v19) >> 3, 1, (degas::Bitmap *)&v80);
    }
    if ((v41 & 0xFFFFFFFD) != 0)
    {
      if (!a9) {
        goto LABEL_68;
      }
      if ((v41 - 2) > 8) {
        uint64_t v42 = -1;
      }
      else {
        uint64_t v42 = qword_1D17CE530[v41 - 2];
      }
      kg_errorWithCode(v42);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    }
    if (v19) {
      operator delete(v19);
    }
  }
  unint64_t v43 = [v62 count];
  unint64_t v44 = v43;
  if (!v43)
  {
LABEL_62:
    v54 = [[KGElementIdentifierSet alloc] initWithBitmap:&v80];
    goto LABEL_71;
  }
  if (v43 >> 61) {
    std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
  }
  id v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v43);
  bzero(v19, 8 * v44);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v45 = v62;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v67 objects:v82 count:16];
  if (v46)
  {
    uint64_t v47 = 0;
    uint64_t v48 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v68 != v48) {
          objc_enumerationMutation(v45);
        }
        [*(id *)(*((void *)&v67 + 1) + 8 * k) doubleValue];
        *(void *)&v19[8 * v47 + 8 * k] = v50;
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v67 objects:v82 count:16];
      v47 += k;
    }
    while (v46);
  }

  unint64_t v51 = &v19[8 * v44];
  if (v64) {
    int v52 = degas::AttributeQuery::filterElementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v51 - v19) >> 3, 1, (Bitmap *)[v64 bitmap], (degas::AggregateValueCursor *)&v80);
  }
  else {
    int v52 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v16, v19, (unint64_t)(v51 - v19) >> 3, 1, (degas::Bitmap *)&v80);
  }
  if ((v52 & 0xFFFFFFFD) == 0)
  {
    if (v19) {
      operator delete(v19);
    }
    goto LABEL_62;
  }
  if (!a9) {
    goto LABEL_68;
  }
  if ((v52 - 2) > 8) {
    uint64_t v53 = -1;
  }
  else {
    uint64_t v53 = qword_1D17CE530[v52 - 2];
  }
  kg_errorWithCode(v53);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:
  *a9 = v55;
LABEL_68:
  if (v19) {
LABEL_69:
  }
    operator delete(v19);
  v54 = 0;
LABEL_71:

  v79[0] = (void **)v81;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v79);

  return v54;
}

- (id)filterTombstoneNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  uint64_t v7 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:a3 value:a4 comparator:a5 elementIdentifiers:a6 valueTable:(char *)self->_database + 1032 rowCount:1000 error:a7];
  return v7;
}

- (id)filterNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 nodeIdentifiers:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(KGDatabase *)self filterElementIdentifiersForPropertyName:v12 value:v13 comparator:a5 elementIdentifiers:v14 valueTable:(char *)self->_database + 472 rowCount:degas::Database::nodeCount((degas::Database *)self->_database) error:a7];

  return v15;
}

- (id)filterElementIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 elementIdentifiers:(id)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (a5 == 8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v18 = [(KGDatabase *)self filterNodeIdentifiersForPropertyName:v15 values:v16 comparator:8 nodeIdentifiers:v17 error:a9];
    }
    else
    {
      uint64_t v23 = KGLoggingConnection();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v16;
        _os_log_error_impl(&dword_1D1654000, v23, OS_LOG_TYPE_ERROR, "Case insensitive In expects an array of values, not %@", buf, 0xCu);
      }

      unint64_t v18 = objc_alloc_init(KGElementIdentifierSet);
    }
    goto LABEL_14;
  }
  sqlite3_int64 v19 = [(KGDatabase *)self attributeIdentifierForPropertyName:v15];
  if (!v19)
  {
    unint64_t v18 = objc_alloc_init(KGElementIdentifierSet);
LABEL_14:
    int v24 = v18;
    goto LABEL_31;
  }
  *(_OWORD *)buf = 0u;
  memset(v38, 0, 25);
  uint64_t v20 = [v16 kgPropertyType];
  if (a5 >= 8) {
    LODWORD(a5) = 1;
  }
  unint64_t v33 = a7;
  unint64_t v34 = a8;
  switch(v20)
  {
    case 0:
      int v25 = KGLoggingConnection();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long __p = 138412290;
        *(void *)&__p[4] = v16;
        _os_log_error_impl(&dword_1D1654000, v25, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", __p, 0xCu);
      }

      goto LABEL_28;
    case 1:
    case 4:
      id v21 = v16;
      if (v17) {
        int v22 = degas::AttributeQuery::filterElementsForAttributeValue((uint64_t *)&v33, v19, objc_msgSend(v21, "longLongValue", v33, v34), a5, (Bitmap *)objc_msgSend(v17, "bitmap"), (degas::AggregateValueCursor *)buf);
      }
      else {
        int v22 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v33, v19, objc_msgSend(v21, "longLongValue", v33, v34), a5, (degas::Bitmap *)buf);
      }
      goto LABEL_24;
    case 2:
      objc_msgSend(v16, "doubleValue", v33, v34);
      if (v17) {
        int v22 = degas::AttributeQuery::filterElementsForAttributeValue((uint64_t *)&v33, v19, a5, (Bitmap *)[v17 bitmap], (degas::AggregateValueCursor *)buf, v26);
      }
      else {
        int v22 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v33, v19, a5, (degas::Bitmap *)buf, v26);
      }
LABEL_24:
      int v28 = v22;
      goto LABEL_25;
    case 3:
      stringNSToStd((NSString *)__p, v16);
      if (v17) {
        int v27 = degas::AttributeQuery::filterElementsForAttributeValue((uint64_t *)&v33, v19, (uint64_t)__p, a5, (Bitmap *)objc_msgSend(v17, "bitmap", v33, v34), (degas::AggregateValueCursor *)buf);
      }
      else {
        int v27 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v33, v19, (uint64_t)__p, a5, (degas::Bitmap *)buf);
      }
      int v28 = v27;
      if (v36 < 0) {
        operator delete(*(void **)__p);
      }
LABEL_25:

      unsigned int v29 = v28 - 2;
      if (v28 == 2) {
        goto LABEL_28;
      }
      if (v28)
      {
        if (a9)
        {
          if (v29 > 8) {
            uint64_t v32 = -1;
          }
          else {
            uint64_t v32 = qword_1D17CE530[v29];
          }
          kg_errorWithCode(v32);
          int v24 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          int v24 = 0;
        }
      }
      else
      {
        int v30 = [[KGElementIdentifierSet alloc] initWithBitmap:buf];
LABEL_29:
        int v24 = v30;
      }
      *(void *)long long __p = v38;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      break;
    default:
LABEL_28:
      int v30 = objc_alloc_init(KGElementIdentifierSet);
      goto LABEL_29;
  }
LABEL_31:

  return v24;
}

- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  id v5 = [(KGDatabase *)self elementIdentifiersForPropertyName:a3 values:a4 valueTable:(char *)self->_database + 1032 rowCount:0 error:a5];
  return v5;
}

- (id)nodeIdentifiersForPropertyName:(id)a3 values:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(KGDatabase *)self elementIdentifiersForPropertyName:v8 values:v9 valueTable:(char *)self->_database + 472 rowCount:degas::Database::nodeCount((degas::Database *)self->_database) error:a5];

  return v10;
}

- (id)elementIdentifiersForPropertyName:(id)a3 values:(id)a4 valueTable:(const void *)a5 rowCount:(unint64_t)a6 error:(id *)a7
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v66 = a4;
  id v63 = v12;
  unint64_t v13 = [(KGDatabase *)self attributeIdentifierForPropertyName:v12];
  if (!v13)
  {
    int v30 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_52;
  }
  long long v80 = 0u;
  memset(v81, 0, 25);
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[KGDatabase distributeValuesByType:toIntegerValues:floatValues:stringValues:](self, "distributeValuesByType:toIntegerValues:floatValues:stringValues:", v66, v65);
  v79[0] = (void **)a5;
  v79[1] = (void **)a6;
  uint64_t v14 = [v64 count];
  sqlite3_int64 v60 = v13;
  if (v14)
  {
    v58 = a5;
    unint64_t v59 = a7;
    id v61 = &v57;
    uint64_t v57 = v14;
    MEMORY[0x1F4188790](v14, v15);
    id v17 = (void **)((char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v16 >= 0x200) {
      size_t v18 = 512;
    }
    else {
      size_t v18 = v16;
    }
    bzero((char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v19 = v64;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v76 != v22) {
            objc_enumerationMutation(v19);
          }
          int v24 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          size_t v25 = [v24 lengthOfBytesUsingEncoding:4] + 1;
          double v26 = malloc_type_malloc(v25, 0x415BD0F9uLL);
          *(&v17[v21] + i) = v26;
          [v24 getCString:v26 maxLength:v25 encoding:4];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v84 count:16];
        v21 += i;
      }
      while (v20);
    }

    a7 = v59;
    unint64_t v27 = v57;
    int v28 = degas::implElementsForAttributeValues<char const*>(v60, v17, v57, 1, (degas::Bitmap *)&v80, (uint64_t)v58);
    if (v27 <= 1) {
      unint64_t v27 = 1;
    }
    do
    {
      free(*v17);
      *v17++ = 0;
      --v27;
    }
    while (v27);
    if ((v28 & 0xFFFFFFFD) != 0)
    {
      if (a7)
      {
        if ((v28 - 2) > 8) {
          uint64_t v29 = -1;
        }
        else {
          uint64_t v29 = qword_1D17CE530[v28 - 2];
        }
LABEL_49:
        kg_errorWithCode(v29);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
      goto LABEL_50;
    }
  }
  uint64_t v31 = [v65 count];
  int v33 = v31;
  if (v31)
  {
    unint64_t v34 = a7;
    id v61 = &v57;
    MEMORY[0x1F4188790](v31, v32);
    char v36 = (char *)&v57 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v37 = v65;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v38)
    {
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v72 != v40) {
            objc_enumerationMutation(v37);
          }
          *(void *)&v36[8 * v39 + 8 * j] = [*(id *)(*((void *)&v71 + 1) + 8 * j) longLongValue];
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v71 objects:v83 count:16];
        v39 += j;
      }
      while (v38);
    }

    a7 = v34;
    int v42 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v60, v36, v33, 1, (degas::Bitmap *)&v80);
    if ((v42 & 0xFFFFFFFD) != 0)
    {
      if (v34)
      {
        if ((v42 - 2) > 8) {
          uint64_t v29 = -1;
        }
        else {
          uint64_t v29 = qword_1D17CE530[v42 - 2];
        }
        goto LABEL_49;
      }
LABEL_50:
      int v30 = 0;
      goto LABEL_51;
    }
  }
  uint64_t v43 = [v62 count];
  int v45 = v43;
  if (v43)
  {
    uint64_t v46 = a7;
    id v61 = &v57;
    MEMORY[0x1F4188790](v43, v44);
    uint64_t v48 = (char *)&v57 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v49 = v62;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v67 objects:v82 count:16];
    if (v50)
    {
      uint64_t v51 = 0;
      uint64_t v52 = *(void *)v68;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v68 != v52) {
            objc_enumerationMutation(v49);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * k) doubleValue];
          *(void *)&v48[8 * v51 + 8 * k] = v54;
        }
        uint64_t v50 = [v49 countByEnumeratingWithState:&v67 objects:v82 count:16];
        v51 += k;
      }
      while (v50);
    }

    a7 = v46;
    int v55 = degas::AttributeQuery::elementsForAttributeValues((uint64_t *)v79, v60, v48, v45, 1, (degas::Bitmap *)&v80);
    if ((v55 & 0xFFFFFFFD) != 0)
    {
      if (v46)
      {
        if ((v55 - 2) > 8) {
          uint64_t v29 = -1;
        }
        else {
          uint64_t v29 = qword_1D17CE530[v55 - 2];
        }
        goto LABEL_49;
      }
      goto LABEL_50;
    }
  }
  int v30 = [[KGElementIdentifierSet alloc] initWithBitmap:&v80];
LABEL_51:

  v79[0] = (void **)v81;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v79);
LABEL_52:

  return v30;
}

- (void)distributeValuesByType:(id)a3 toIntegerValues:(id)a4 floatValues:(id)a5 stringValues:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v14)
  {
    uint64_t v16 = *(void *)v22;
    *(void *)&long long v15 = 138412290;
    long long v20 = v15;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        size_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        switch(objc_msgSend(v18, "kgPropertyType", v20, (void)v21))
        {
          case 0:
            id v19 = KGLoggingConnection();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              double v26 = v18;
              _os_log_error_impl(&dword_1D1654000, v19, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", buf, 0xCu);
            }
            goto LABEL_12;
          case 1:
          case 4:
            id v19 = v18;
            [v10 addObject:v19];
            goto LABEL_12;
          case 2:
            id v19 = v18;
            [v11 addObject:v19];
            goto LABEL_12;
          case 3:
            id v19 = v18;
            [v12 addObject:v19];
LABEL_12:

            break;
          default:
            continue;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v14);
  }
}

- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7 = [(KGDatabase *)self elementIdentifiersForPropertyName:a3 rangeValue1:a4 rangeValue2:a5 comparator:a6 valueTable:(char *)self->_database + 1032 rowCount:0 error:a7];
  return v7;
}

- (id)nodeIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  long long v15 = [(KGDatabase *)self elementIdentifiersForPropertyName:v12 rangeValue1:v13 rangeValue2:v14 comparator:a6 valueTable:(char *)self->_database + 472 rowCount:degas::Database::nodeCount((degas::Database *)self->_database) error:a7];

  return v15;
}

- (id)elementIdentifiersForPropertyName:(id)a3 rangeValue1:(id)a4 rangeValue2:(id)a5 comparator:(unint64_t)a6 valueTable:(const void *)a7 rowCount:(unint64_t)a8 error:(id *)a9
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  sqlite3_int64 v18 = [(KGDatabase *)self attributeIdentifierForPropertyName:v15];
  if (!v18)
  {
    long long v21 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_34;
  }
  long long v39 = 0u;
  memset(v40, 0, 25);
  uint64_t v19 = [v16 kgPropertyType];
  if (v19 == [v17 kgPropertyType])
  {
    if (a6 >= 9) {
      LODWORD(a6) = 1;
    }
    v38[0] = (uint64_t)a7;
    v38[1] = a8;
    switch(v19)
    {
      case 0:
        double v26 = KGLoggingConnection();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_error_impl(&dword_1D1654000, v26, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", buf, 0xCu);
        }

        goto LABEL_24;
      case 1:
      case 4:
        int v20 = degas::AttributeQuery::elementsForAttributeValueRange(v38, v18, [v16 longLongValue], objc_msgSend(v17, "longLongValue"), a6, (degas::Bitmap *)&v39);
        goto LABEL_20;
      case 2:
        id v27 = v16;
        id v28 = v17;
        [v27 doubleValue];
        double v30 = v29;
        [v28 doubleValue];
        int v20 = degas::AttributeQuery::elementsForAttributeValueRange(v38, v18, a6, (degas::Bitmap *)&v39, v30, v31);
LABEL_20:
        int v25 = v20;
        goto LABEL_21;
      case 3:
        id v23 = v16;
        id v24 = v17;
        stringNSToStd((NSString *)buf, v23);
        stringNSToStd(__p, v24);
        int v25 = degas::AttributeQuery::elementsForAttributeValueRange(v38, v18, (uint64_t)buf, (uint64_t)__p, a6, (degas::Bitmap *)&v39);
        if (v37 < 0) {
          operator delete(__p[0]);
        }
        if (v42 < 0) {
          operator delete(*(void **)buf);
        }
LABEL_21:

        unsigned int v32 = v25 - 2;
        if (v25 == 2) {
          goto LABEL_24;
        }
        if (!v25)
        {
          int v33 = [[KGElementIdentifierSet alloc] initWithBitmap:&v39];
LABEL_25:
          long long v21 = v33;
          goto LABEL_33;
        }
        if (!a9) {
          goto LABEL_32;
        }
        if (v32 > 8) {
          uint64_t v34 = -1;
        }
        else {
          uint64_t v34 = qword_1D17CE530[v32];
        }
        kg_errorWithCode(v34);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_24:
        int v33 = objc_alloc_init(KGElementIdentifierSet);
        goto LABEL_25;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "selecting in a range with mismatched types", buf, 2u);
    if (a9) {
      goto LABEL_10;
    }
LABEL_32:
    long long v21 = 0;
    goto LABEL_33;
  }
  if (!a9) {
    goto LABEL_32;
  }
LABEL_10:
  kg_errorWithCode(5004);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  long long v21 = 0;
  *a9 = v22;
LABEL_33:
  *(void *)buf = v40;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_34:

  return v21;
}

- (id)tombstoneNodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  int v6 = [(KGDatabase *)self elementIdentifiersForPropertyName:a3 value:a4 comparator:a5 valueTable:(char *)self->_database + 1032 rowCount:0 error:a6];
  return v6;
}

- (id)nodeIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(KGDatabase *)self elementIdentifiersForPropertyName:v10 value:v11 comparator:a5 valueTable:(char *)self->_database + 472 rowCount:degas::Database::nodeCount((degas::Database *)self->_database) error:a6];

  return v12;
}

- (id)elementIdentifiersForPropertyName:(id)a3 value:(id)a4 comparator:(unint64_t)a5 valueTable:(const void *)a6 rowCount:(unint64_t)a7 error:(id *)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  sqlite3_int64 v16 = [(KGDatabase *)self attributeIdentifierForPropertyName:v14];
  if (v16)
  {
    long long v29 = 0u;
    memset(v30, 0, 25);
    uint64_t v17 = [v15 kgPropertyType];
    if (a5 >= 9) {
      LODWORD(a5) = 1;
    }
    id v27 = a6;
    unint64_t v28 = a7;
    switch(v17)
    {
      case 0:
        sqlite3_int64 v18 = KGLoggingConnection();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long __p = 138412290;
          *(void *)&__p[4] = v15;
          _os_log_error_impl(&dword_1D1654000, v18, OS_LOG_TYPE_ERROR, "unable to interpret value <%@> as valid property value", __p, 0xCu);
        }

        goto LABEL_17;
      case 1:
      case 4:
        int v21 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v27, v16, objc_msgSend(v15, "longLongValue", v27, v28), a5, (degas::Bitmap *)&v29);
        goto LABEL_13;
      case 2:
        objc_msgSend(v15, "doubleValue", v27, v28);
        int v21 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v27, v16, a5, (degas::Bitmap *)&v29, v20);
LABEL_13:
        int v22 = v21;
        goto LABEL_14;
      case 3:
        stringNSToStd((NSString *)__p, v15);
        int v22 = degas::AttributeQuery::elementsForAttributeValue((uint64_t *)&v27, v16, (uint64_t)__p, a5, (degas::Bitmap *)&v29);
        if (v32 < 0) {
          operator delete(*(void **)__p);
        }
LABEL_14:

        unsigned int v23 = v22 - 2;
        if (v22 == 2) {
          goto LABEL_17;
        }
        if (v22)
        {
          if (a8)
          {
            if (v23 > 8) {
              uint64_t v26 = -1;
            }
            else {
              uint64_t v26 = qword_1D17CE530[v23];
            }
            kg_errorWithCode(v26);
            uint64_t v19 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v19 = 0;
          }
        }
        else
        {
          id v24 = [[KGElementIdentifierSet alloc] initWithBitmap:&v29];
LABEL_18:
          uint64_t v19 = v24;
        }
        *(void *)long long __p = v30;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        break;
      default:
LABEL_17:
        id v24 = objc_alloc_init(KGElementIdentifierSet);
        goto LABEL_18;
    }
  }
  else
  {
    uint64_t v19 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v19;
}

- (unint64_t)edgeCount
{
  return degas::Database::edgeCount((degas::Database *)self->_database);
}

- (unint64_t)nodeCount
{
  return degas::Database::nodeCount((degas::Database *)self->_database);
}

- (BOOL)removeEdges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = degas::Database::removeEdges((degas::Database *)self->_database, (Bitmap *)[v6 bitmap]);
  int v8 = v7;
  if (a4 && v7)
  {
    if ((v7 - 2) > 8) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = qword_1D17CE530[v7 - 2];
    }
    kg_errorWithCode(v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 0;
}

- (BOOL)removeNodes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = degas::Database::removeNodes((degas::Database *)self->_database, (Bitmap *)[v6 bitmap]);
  int v8 = v7;
  if (a4 && v7)
  {
    if ((v7 - 2) > 8) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = qword_1D17CE530[v7 - 2];
    }
    kg_errorWithCode(v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 0;
}

- (BOOL)removeEdge:(unint64_t)a3 error:(id *)a4
{
  int v5 = degas::Database::removeEdge((degas::Database *)self->_database, a3, 0);
  int v6 = v5;
  if (a4 && v5)
  {
    if ((v5 - 2) > 8) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = qword_1D17CE530[v5 - 2];
    }
    kg_errorWithCode(v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (BOOL)removeNode:(unint64_t)a3 error:(id *)a4
{
  int v5 = degas::Database::removeNode((degas::Database *)self->_database, a3);
  int v6 = v5;
  if (a4 && v5)
  {
    if ((v5 - 2) > 8) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = qword_1D17CE530[v5 - 2];
    }
    kg_errorWithCode(v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (unint64_t)addEdgeWithLabels:(id)a3 properties:(id)a4 sourceNodeIdentifier:(unint64_t)a5 targetNodeIdentifier:(unint64_t)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  [(KGDatabase *)self upsertLabels:a3];
  sqlite3_int64 v18 = v26;
  long long v19 = 0u;
  long long v20 = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v19 + 8, v27, v28, v28 - v27);
  char v21 = v29;
  v22[0] = 0;
  v22[1] = v18;
  memset(&v22[2], 0, 32);
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v22[3], *((long long **)&v19 + 1), (long long *)v20, (uint64_t)(v20 - *((void *)&v19 + 1)) >> 4);
  char v23 = v21;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  *(void *)buf = (char *)&v19 + 8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  int inserted = degas::Database::insertEdge((uint64_t)self->_database, (sqlite3_int64 *)v22);
  if (inserted)
  {
    id v14 = KGLoggingConnection();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void ***)&uint8_t buf[4] = v22[0];
      _os_log_error_impl(&dword_1D1654000, v14, OS_LOG_TYPE_ERROR, "Error adding edge for identifier \"%llu\"", buf, 0xCu);
    }

    if (a7)
    {
      if ((inserted - 2) > 8) {
        uint64_t v15 = -1;
      }
      else {
        uint64_t v15 = qword_1D17CE530[inserted - 2];
      }
      kg_errorWithCode(v15);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (v12
    && ![(KGDatabase *)self setEdgeProperties:v12 forIdentifier:v22[0] error:a7])
  {
LABEL_12:
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  unint64_t v16 = (unint64_t)v22[0];
LABEL_13:
  *(void *)buf = &v22[3];
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v22[0] = (void **)&v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v22);

  return v16;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  uint64_t v44 = a4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  memset(v70, 0, sizeof(v70));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v4)
  {
    uint64_t v47 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v67 != v47) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "labels", v44);
        [(KGDatabase *)self upsertLabels:v7];

        uint64_t v53 = v62;
        long long v54 = 0u;
        long long v55 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v54 + 8, v63, v64, v64 - v63);
        char v56 = v65;
        int v8 = [v6 sourceNode];
        uint64_t v9 = [v8 identifier];
        id v10 = [v6 targetNode];
        uint64_t v11 = [v10 identifier];
        *(void *)buf = 0;
        *(void *)&buf[8] = v53;
        long long v58 = 0u;
        long long v59 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v58 + 8, *((long long **)&v54 + 1), (long long *)v55, (uint64_t)(v55 - *((void *)&v54 + 1)) >> 4);
        char v60 = v56;
        *(void *)&long long v61 = v9;
        *((void *)&v61 + 1) = v11;

        long long v71 = (void **)&v54 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v71);
        uint64_t v12 = *(void *)&v70[8];
        if (*(void *)&v70[8] >= *(void *)&v70[16])
        {
          unint64_t v15 = 0x8E38E38E38E38E39 * ((uint64_t)(*(void *)&v70[8] - *(void *)v70) >> 3);
          unint64_t v16 = v15 + 1;
          if (v15 + 1 > 0x38E38E38E38E38ELL) {
            std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
          }
          if (0x1C71C71C71C71C72 * ((uint64_t)(*(void *)&v70[16] - *(void *)v70) >> 3) > v16) {
            unint64_t v16 = 0x1C71C71C71C71C72 * ((uint64_t)(*(void *)&v70[16] - *(void *)v70) >> 3);
          }
          if (0x8E38E38E38E38E39 * ((uint64_t)(*(void *)&v70[16] - *(void *)v70) >> 3) >= 0x1C71C71C71C71C7) {
            unint64_t v17 = 0x38E38E38E38E38ELL;
          }
          else {
            unint64_t v17 = v16;
          }
          long long v73 = &v70[16];
          if (v17)
          {
            if (v17 > 0x38E38E38E38E38ELL) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            sqlite3_int64 v18 = (void **)operator new(72 * v17);
          }
          else
          {
            sqlite3_int64 v18 = 0;
          }
          long long v19 = &v18[9 * v15];
          long long v71 = v18;
          *(void *)long long v72 = v19;
          *(void *)&v72[8] = v19;
          *(void *)&v72[16] = &v18[9 * v17];
          *(_OWORD *)long long v19 = *(_OWORD *)buf;
          *((_OWORD *)v19 + 1) = 0u;
          *((_OWORD *)v19 + 2) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)v19 + 24, *((long long **)&v58 + 1), (long long *)v59, (uint64_t)(v59 - *((void *)&v58 + 1)) >> 4);
          long long v20 = &v18[9 * v15];
          *((unsigned char *)v20 + 48) = v60;
          *(_OWORD *)(v20 + 7) = v61;
          uint64_t v21 = *(void *)v72;
          *(void *)&v72[8] += 72;
          uint64_t v23 = *(void *)&v70[8];
          uint64_t v22 = *(void *)v70;
          *(void *)&long long v77 = *(void *)v72;
          *((void *)&v77 + 1) = *(void *)v72;
          long long v76 = v77;
          v74[0] = &v70[16];
          v74[1] = &v76;
          v74[2] = &v77;
          char v75 = 0;
          if (*(void *)&v70[8] != *(void *)v70)
          {
            uint64_t v24 = *(void *)&v70[8];
            do
            {
              long long v25 = *(_OWORD *)(v24 - 72);
              v24 -= 72;
              *(_OWORD *)(v21 - 72) = v25;
              *(_OWORD *)(v21 - 56) = 0u;
              *(_OWORD *)(v21 - 40) = 0u;
              std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v21 - 48), *(long long **)(v24 + 24), *(long long **)(v24 + 32), (uint64_t)(*(void *)(v24 + 32) - *(void *)(v24 + 24)) >> 4);
              *(unsigned char *)(v21 - 24) = *(unsigned char *)(v23 - 24);
              *(_OWORD *)(v21 - 16) = *(_OWORD *)(v23 - 16);
              uint64_t v21 = *((void *)&v77 + 1) - 72;
              *((void *)&v77 + 1) -= 72;
              uint64_t v23 = v24;
            }
            while (v24 != v22);
          }
          char v75 = 1;
          std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<degas::EdgeCreationRequest>,std::reverse_iterator<degas::EdgeCreationRequest*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v74);
          uint64_t v26 = *(void *)&v70[16];
          uint64_t v46 = *(void *)&v72[8];
          long long v27 = *(_OWORD *)&v72[8];
          long long v28 = *(_OWORD *)v70;
          *(void *)long long v70 = v21;
          *(_OWORD *)long long v72 = v28;
          *(_OWORD *)&v70[8] = v27;
          *(void *)&v72[16] = v26;
          long long v71 = (void **)v28;
          std::__split_buffer<degas::EdgeCreationRequest>::~__split_buffer((uint64_t)&v71);
          uint64_t v14 = v46;
        }
        else
        {
          id v13 = (char *)(*(void *)&v70[8] + 24);
          **(_OWORD **)&v70[8] = *(_OWORD *)buf;
          *(_OWORD *)(v12 + 16) = 0u;
          *(_OWORD *)(v12 + 32) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(v13, *((long long **)&v58 + 1), (long long *)v59, (uint64_t)(v59 - *((void *)&v58 + 1)) >> 4);
          *(unsigned char *)(v12 + 48) = v60;
          *(_OWORD *)(v12 + 56) = v61;
          uint64_t v14 = v12 + 72;
        }
        *(void *)&v70[8] = v14;
        long long v71 = (void **)&v58 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v71);
        *(void *)buf = &v63;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v4);
  }

  int inserted = degas::Database::insertEdges((sqlite3 **)self->_database, (sqlite3_int64 **)v70);
  if (inserted)
  {
    double v30 = KGLoggingConnection();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1654000, v30, OS_LOG_TYPE_ERROR, "Error adding edges", buf, 2u);
    }

    if (v44)
    {
      if ((inserted - 2) > 8) {
        uint64_t v31 = -1;
      }
      else {
        uint64_t v31 = qword_1D17CE530[inserted - 2];
      }
      kg_errorWithCode(v31);
      BOOL v42 = 0;
      *uint64_t v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v42 = 0;
    }
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v32 = obj;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v78 count:16];
    if (v33)
    {
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v50;
      while (2)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 72 * v34;
        do
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v38 = *(void **)(*((void *)&v49 + 1) + 8 * v36);
          uint64_t v39 = *(void *)(*(void *)v70 + v37);
          objc_msgSend(v38, "resolveIdentifier:", v39, v44);
          uint64_t v40 = [v38 properties];
          int v41 = (void *)[v40 mutableCopy];

          [v41 setObject:0 forKeyedSubscript:@"__weight"];
          LOBYTE(v39) = [(KGDatabase *)self setEdgeProperties:v41 forIdentifier:v39 error:v44];

          if ((v39 & 1) == 0)
          {
            BOOL v42 = 0;
            goto LABEL_41;
          }
          ++v36;
          v37 += 72;
        }
        while (v33 != v36);
        uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v78 count:16];
        v34 += v36;
        if (v33) {
          continue;
        }
        break;
      }
    }
    BOOL v42 = 1;
LABEL_41:
  }
  *(void *)buf = v70;
  std::vector<degas::EdgeCreationRequest>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v42;
}

- (BOOL)setEdgeProperties:(id)a3 forIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x6012000000;
  v18[3] = __Block_byref_object_copy__2278;
  v18[4] = __Block_byref_object_dispose__2279;
  v18[5] = &unk_1D17EE929;
  long long v19 = 0u;
  memset(v20, 0, 25);
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  int v9 = (*(uint64_t (**)(char *, unint64_t))(*((void *)self->_database + 52) + 24))((char *)self->_database + 416, a4);
  *((_DWORD *)v15 + 6) = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__KGDatabase_setEdgeProperties_forIdentifier_error___block_invoke;
  v13[3] = &unk_1E68DB928;
  v13[4] = self;
  v13[5] = v18;
  v13[6] = &v14;
  v13[7] = a4;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
  int v10 = *((_DWORD *)v15 + 6);
  if (a5 && v10)
  {
    if ((v10 - 2) > 8) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = qword_1D17CE530[v10 - 2];
    }
    kg_errorWithCode(v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  uint64_t v14 = (void **)v20;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);

  return v10 == 0;
}

void __52__KGDatabase_setEdgeProperties_forIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 dataType];
  uint64_t v10 = [*(id *)(a1 + 32) attributeIdentifierForPropertyName:v7];
  degas::Bitmap::setBit((degas::Bitmap *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v10);
  switch(v9)
  {
    case 0:
      id v11 = v8;
      int v12 = degas::Database::setEdgeAttributeValue(*(degas::Database **)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 56), v10, [v11 value]);
      goto LABEL_8;
    case 1:
      id v11 = v8;
      int v12 = degas::Database::setEdgeAttributeValueUnsigned(*(degas::Database **)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 56), v10, [v11 value]);
      goto LABEL_8;
    case 2:
      id v11 = v8;
      id v13 = *(degas::Database **)(*(void *)(a1 + 32) + 8);
      unint64_t v14 = *(void *)(a1 + 56);
      [v11 value];
      int v12 = degas::Database::setEdgeAttributeValue(v13, v14, v10, v15);
LABEL_8:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
      goto LABEL_9;
    case 3:
      id v11 = v8;
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v17 = *(void *)(a1 + 56);
      id v18 = [v11 value];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 cStringUsingEncoding:4]);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = degas::Database::setEdgeAttributeValue(v16, v17, v10, (uint64_t *)__p);
      if (v20 < 0) {
        operator delete(__p[0]);
      }

LABEL_9:
      break;
    default:
      break;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

- (unint64_t)addNodeWithLabels:(id)a3 properties:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(KGDatabase *)self upsertLabels:a3];
  unint64_t v14 = v20;
  long long v15 = 0u;
  long long v16 = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v15 + 8, v21, v22, v22 - v21);
  char v17 = v23;
  v18[0] = 0;
  v18[1] = v14;
  memset(&v18[2], 0, 32);
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v18[3], *((long long **)&v15 + 1), (long long *)v16, (uint64_t)(v16 - *((void *)&v15 + 1)) >> 4);
  char v19 = v17;
  *(void *)buf = (char *)&v15 + 8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  int inserted = degas::Database::insertNode((degas::Database *)self->_database, (sqlite3_int64 *)v18);
  if (inserted)
  {
    uint64_t v10 = KGLoggingConnection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v18[0];
      _os_log_error_impl(&dword_1D1654000, v10, OS_LOG_TYPE_ERROR, "Error adding node for identifier \"%llu\"", buf, 0xCu);
    }

    if (a5)
    {
      if ((inserted - 2) > 8) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = qword_1D17CE530[inserted - 2];
      }
      kg_errorWithCode(v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if ([(KGDatabase *)self setNodeProperties:v8 forIdentifier:v18[0] error:a5])
  {
    unint64_t v12 = v18[0];
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(void *)buf = &v18[3];
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v18[0] = (unint64_t)&v21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v18);

  return v12;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  memset(v63, 0, sizeof(v63));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v60 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [*(id *)(*((void *)&v59 + 1) + 8 * i) labels];
        [(KGDatabase *)self upsertLabels:v8];

        uint64_t v47 = v55;
        long long v48 = 0u;
        long long v49 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v48 + 8, v56, v57, v57 - v56);
        char v50 = v58;
        *(void *)buf = 0;
        *(void *)&buf[8] = v47;
        long long v52 = 0u;
        long long v53 = 0u;
        std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v52 + 8, *((long long **)&v48 + 1), (long long *)v49, (uint64_t)(v49 - *((void *)&v48 + 1)) >> 4);
        char v54 = v50;
        id v64 = (void **)&v48 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v64);
        uint64_t v9 = *(void *)&v63[8];
        if (*(void *)&v63[8] >= *(void *)&v63[16])
        {
          unint64_t v12 = self;
          uint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)&v63[8] - *(void *)v63) >> 3);
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) > 0x492492492492492) {
            std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)&v63[16] - *(void *)v63) >> 3) > v14) {
            unint64_t v14 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)&v63[16] - *(void *)v63) >> 3);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)&v63[16] - *(void *)v63) >> 3)) >= 0x249249249249249) {
            unint64_t v15 = 0x492492492492492;
          }
          else {
            unint64_t v15 = v14;
          }
          long long v66 = &v63[16];
          if (v15)
          {
            if (v15 > 0x492492492492492) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            long long v16 = (void **)operator new(56 * v15);
          }
          else
          {
            long long v16 = 0;
          }
          char v17 = &v16[7 * v13];
          id v64 = v16;
          *(void *)char v65 = v17;
          *(void *)&v65[8] = v17;
          *(void *)&v65[16] = &v16[7 * v15];
          *(_OWORD *)char v17 = *(_OWORD *)buf;
          *((_OWORD *)v17 + 1) = 0u;
          *((_OWORD *)v17 + 2) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)v17 + 24, *((long long **)&v52 + 1), (long long *)v53, (uint64_t)(v53 - *((void *)&v52 + 1)) >> 4);
          LOBYTE(v16[7 * v13 + 6]) = v54;
          uint64_t v18 = *(void *)v65;
          *(void *)&v65[8] += 56;
          uint64_t v19 = *(void *)&v63[8];
          uint64_t v20 = *(void *)v63;
          *(void *)&long long v70 = *(void *)v65;
          *((void *)&v70 + 1) = *(void *)v65;
          long long v69 = v70;
          v67[0] = &v63[16];
          v67[1] = &v69;
          v67[2] = &v70;
          char v68 = 0;
          if (*(void *)&v63[8] != *(void *)v63)
          {
            uint64_t v21 = *(void *)&v63[8];
            do
            {
              long long v22 = *(_OWORD *)(v21 - 56);
              v21 -= 56;
              *(_OWORD *)(v18 - 56) = v22;
              *(_OWORD *)(v18 - 40) = 0u;
              *(_OWORD *)(v18 - 24) = 0u;
              std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(v18 - 32), *(long long **)(v21 + 24), *(long long **)(v21 + 32), (uint64_t)(*(void *)(v21 + 32) - *(void *)(v21 + 24)) >> 4);
              *(unsigned char *)(v18 - 8) = *(unsigned char *)(v19 - 8);
              uint64_t v18 = *((void *)&v70 + 1) - 56;
              *((void *)&v70 + 1) -= 56;
              uint64_t v19 = v21;
            }
            while (v21 != v20);
          }
          char v68 = 1;
          std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<degas::NodeCreationRequest>,std::reverse_iterator<degas::NodeCreationRequest*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v67);
          uint64_t v23 = *(void *)&v63[16];
          uint64_t v42 = *(void *)&v65[8];
          long long v24 = *(_OWORD *)&v65[8];
          long long v25 = *(_OWORD *)v63;
          *(void *)id v63 = v18;
          *(_OWORD *)char v65 = v25;
          *(_OWORD *)&v63[8] = v24;
          *(void *)&v65[16] = v23;
          id v64 = (void **)v25;
          std::__split_buffer<degas::NodeCreationRequest>::~__split_buffer((uint64_t)&v64);
          uint64_t v11 = v42;
          self = v12;
        }
        else
        {
          uint64_t v10 = (char *)(*(void *)&v63[8] + 24);
          **(_OWORD **)&v63[8] = *(_OWORD *)buf;
          *(_OWORD *)(v9 + 16) = 0u;
          *(_OWORD *)(v9 + 32) = 0u;
          std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(v10, *((long long **)&v52 + 1), (long long *)v53, (uint64_t)(v53 - *((void *)&v52 + 1)) >> 4);
          *(unsigned char *)(v9 + 48) = v54;
          uint64_t v11 = v9 + 56;
        }
        *(void *)&v63[8] = v11;
        id v64 = (void **)&v52 + 1;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v64);
        *(void *)buf = &v56;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v5);
  }

  int inserted = degas::Database::insertNodes((sqlite3 **)self->_database, (sqlite3_int64 **)v63);
  if (inserted)
  {
    long long v27 = KGLoggingConnection();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1654000, v27, OS_LOG_TYPE_ERROR, "Error adding nodes", buf, 2u);
    }

    if (a4)
    {
      if ((inserted - 2) > 8) {
        uint64_t v28 = -1;
      }
      else {
        uint64_t v28 = qword_1D17CE530[inserted - 2];
      }
      kg_errorWithCode(v28);
      BOOL v38 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v38 = 0;
    }
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v29 = obj;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v71 count:16];
    if (v30)
    {
      uint64_t v31 = 0;
      uint64_t v32 = *(void *)v44;
      while (2)
      {
        uint64_t v33 = 0;
        uint64_t v34 = 56 * v31;
        do
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v35 = *(void **)(*((void *)&v43 + 1) + 8 * v33);
          uint64_t v36 = *(void *)(*(void *)v63 + v34);
          [v35 resolveIdentifier:v36];
          uint64_t v37 = [v35 properties];
          LOBYTE(v36) = [(KGDatabase *)self setNodeProperties:v37 forIdentifier:v36 error:a4];

          if ((v36 & 1) == 0)
          {
            BOOL v38 = 0;
            goto LABEL_41;
          }
          ++v33;
          v34 += 56;
        }
        while (v30 != v33);
        uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v71 count:16];
        v31 += v33;
        if (v30) {
          continue;
        }
        break;
      }
    }
    BOOL v38 = 1;
LABEL_41:
  }
  *(void *)buf = v63;
  std::vector<degas::NodeCreationRequest>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v38;
}

- (BOOL)setNodeProperties:(id)a3 forIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x6012000000;
  v17[3] = __Block_byref_object_copy__2278;
  v17[4] = __Block_byref_object_dispose__2279;
  v17[5] = &unk_1D17EE929;
  long long v18 = 0u;
  memset(v19, 0, 25);
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  (*(void (**)(char *, unint64_t))(*((void *)self->_database + 45) + 24))((char *)self->_database + 360, a4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__KGDatabase_setNodeProperties_forIdentifier_error___block_invoke;
  v12[3] = &unk_1E68DB928;
  v12[4] = self;
  v12[5] = v17;
  v12[6] = &v13;
  v12[7] = a4;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
  int v9 = *((_DWORD *)v14 + 6);
  if (a5 && v9)
  {
    if ((v9 - 2) > 8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = qword_1D17CE530[v9 - 2];
    }
    kg_errorWithCode(v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  uint64_t v13 = (void **)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v9 == 0;
}

void __52__KGDatabase_setNodeProperties_forIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 dataType];
  uint64_t v10 = [*(id *)(a1 + 32) attributeIdentifierForPropertyName:v7];
  degas::Bitmap::setBit((degas::Bitmap *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v10);
  switch(v9)
  {
    case 0:
      id v11 = v8;
      int v12 = degas::Database::setNodeAttributeValue(*(degas::Database **)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 56), v10, [v11 value]);
      goto LABEL_8;
    case 1:
      id v11 = v8;
      int v12 = degas::Database::setNodeAttributeValueUnsigned(*(degas::Database **)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 56), v10, [v11 value]);
      goto LABEL_8;
    case 2:
      id v11 = v8;
      uint64_t v13 = *(degas::Database **)(*(void *)(a1 + 32) + 8);
      unint64_t v14 = *(void *)(a1 + 56);
      [v11 value];
      int v12 = degas::Database::setNodeAttributeValue(v13, v14, v10, v15);
LABEL_8:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
      goto LABEL_9;
    case 3:
      id v11 = v8;
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v17 = *(void *)(a1 + 56);
      id v18 = [v11 value];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 cStringUsingEncoding:4]);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = degas::Database::setNodeAttributeValue(v16, v17, v10, (uint64_t *)__p);
      if (v20 < 0) {
        operator delete(__p[0]);
      }

LABEL_9:
      break;
    default:
      break;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)_enumeratePropertiesWithCursor:(void *)a3 withBlock:(id)a4
{
  uint64_t v5 = (void (**)(id, sqlite3_int64, KGInt64PropertyValue *, unsigned char *))a4;
  char v17 = 0;
  do
  {
    if (degas::Statement::next(*(sqlite3_stmt ***)a3) != 1) {
      break;
    }
    switch(sqlite3_column_int64(**(sqlite3_stmt ***)a3, 5))
    {
      case 1u:
        uint64_t v6 = [[KGInt64PropertyValue alloc] initWithValue:sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2)];
        sqlite3_int64 v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v7, v6, &v17);
        goto LABEL_12;
      case 2u:
        uint64_t v6 = [[KGDoublePropertyValue alloc] initWithValue:sqlite3_column_double(**(sqlite3_stmt ***)a3, 3)];
        sqlite3_int64 v8 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v8, v6, &v17);
        goto LABEL_12;
      case 3u:
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v16 = 0;
        degas::Statement::stringColumnValue(*(sqlite3_stmt ***)a3, 4, (uint64_t)__p);
        id v9 = [NSString alloc];
        if (v16 >= 0) {
          uint64_t v10 = __p;
        }
        else {
          uint64_t v10 = (void **)__p[0];
        }
        id v11 = (void *)[v9 initWithUTF8String:v10];
        int v12 = [[KGStringPropertyValue alloc] initWithValue:v11];
        sqlite3_int64 v13 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v13, (KGInt64PropertyValue *)v12, &v17);

        if (SHIBYTE(v16) < 0) {
          operator delete(__p[0]);
        }
        break;
      case 4u:
        uint64_t v6 = [[KGUInt64PropertyValue alloc] initWithValue:sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2)];
        sqlite3_int64 v14 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
        v5[2](v5, v14, v6, &v17);
LABEL_12:

        break;
      default:
        break;
    }
  }
  while (!v17);
}

- (void)_enumeratePropertiesForCursor:(void *)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, sqlite3_int64, void *, unsigned char *))a4;
  sqlite3_int64 v7 = 0;
  sqlite3_int64 v8 = 0;
  char v14 = 0;
  while (degas::Statement::next(*(sqlite3_stmt ***)a3) == 1)
  {
    sqlite3_int64 v9 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
    if (v9 != v8)
    {
      if (v7) {
        v6[2](v6, v8, v7, &v14);
      }
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

      sqlite3_int64 v7 = v10;
      sqlite3_int64 v8 = v9;
    }
    sqlite3_int64 v11 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 1);
    int v12 = [(KGDatabase *)self propertyValueForCursor:a3];
    if (v12)
    {
      sqlite3_int64 v13 = [(KGDatabase *)self propertyNameForAttrIdentifier:v11];
      if (v13) {
        [v7 setObject:v12 forKeyedSubscript:v13];
      }
    }
  }
  if (v7) {
    v6[2](v6, v8, v7, &v14);
  }
}

- (id)propertyValueForCursor:(void *)a3
{
  switch(sqlite3_column_int64(**(sqlite3_stmt ***)a3, 5))
  {
    case 0u:
      uint64_t v4 = KGLoggingConnection();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_error_impl(&dword_1D1654000, v4, OS_LOG_TYPE_ERROR, "unsupported data type for attribute value", (uint8_t *)__p, 2u);
      }

      goto LABEL_5;
    case 1u:
      sqlite3_int64 v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2);
      sqlite3_int64 v8 = KGInt64PropertyValue;
      goto LABEL_9;
    case 2u:
      uint64_t v6 = [[KGDoublePropertyValue alloc] initWithValue:sqlite3_column_double(**(sqlite3_stmt ***)a3, 3)];
      goto LABEL_10;
    case 3u:
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v14 = 0;
      degas::Statement::stringColumnValue(*(sqlite3_stmt ***)a3, 4, (uint64_t)__p);
      id v10 = [NSString alloc];
      if (v14 >= 0) {
        sqlite3_int64 v11 = __p;
      }
      else {
        sqlite3_int64 v11 = (void **)__p[0];
      }
      int v12 = (void *)[v10 initWithUTF8String:v11];
      uint64_t v5 = [[KGStringPropertyValue alloc] initWithValue:v12];

      if (SHIBYTE(v14) < 0) {
        operator delete(__p[0]);
      }
      break;
    case 4u:
      sqlite3_int64 v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2);
      sqlite3_int64 v8 = KGUInt64PropertyValue;
LABEL_9:
      uint64_t v6 = (KGDoublePropertyValue *)[[v8 alloc] initWithValue:v7];
LABEL_10:
      uint64_t v5 = (KGStringPropertyValue *)v6;
      break;
    default:
LABEL_5:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (void)_enumerateEdgesWithEdgeCursor:(void *)a3 propertiesCursor:(void *)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v26 = MEMORY[0x1D25FA040]();
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke;
  v12[3] = &unk_1E68DB888;
  v12[4] = self;
  char v17 = a3;
  id v9 = v8;
  id v13 = v9;
  uint64_t v14 = &v19;
  double v15 = v18;
  uint64_t v16 = &v23;
  [(KGDatabase *)self _enumeratePropertiesForCursor:a4 block:v12];
  if (!*((unsigned char *)v20 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_3;
    v10[3] = &unk_1E68DB900;
    id v11 = v9;
    [(KGDatabase *)self _enumerateEdgeTableWithEdgeCursor:a3 block:v10];
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  char v17 = __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_2;
  id v18 = &unk_1E68DB8D8;
  uint64_t v22 = a2;
  id v10 = v7;
  id v19 = v10;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v20 = v11;
  uint64_t v21 = v12;
  [v8 _enumerateEdgeTableWithEdgeCursor:v9 block:&v15];
  if ((objc_msgSend(*(id *)(a1 + 32), "noFatalError", v15, v16, v17, v18) & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void *)(v13 + 24) + 1;
  *(void *)(v13 + 24) = v14;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v14, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = MEMORY[0x1D25FA040]();
  }
}

uint64_t __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__KGDatabase__enumerateEdgesWithEdgeCursor_propertiesCursor_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, BOOL *a6)
{
  id v11 = a3;
  if (*(void *)(a1 + 56) == a2) {
    id v9 = *(id *)(a1 + 32);
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *(void *)(a1 + 56) == a2;
  }
  *a6 = v10;
}

- (void)_enumerateNodesWithNodeCursor:(void *)a3 propertiesCursor:(void *)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v26 = MEMORY[0x1D25FA040]();
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke;
  v12[3] = &unk_1E68DB888;
  v12[4] = self;
  char v17 = a3;
  id v9 = v8;
  id v13 = v9;
  uint64_t v14 = &v19;
  uint64_t v15 = v18;
  uint64_t v16 = &v23;
  [(KGDatabase *)self _enumeratePropertiesForCursor:a4 block:v12];
  if (!*((unsigned char *)v20 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_3;
    v10[3] = &unk_1E68DB8B0;
    id v11 = v9;
    [(KGDatabase *)self _enumerateNodeTableWithNodeCursor:a3 block:v10];
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  char v17 = __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_2;
  id v18 = &unk_1E68DB860;
  uint64_t v22 = a2;
  id v10 = v7;
  id v19 = v10;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v20 = v11;
  uint64_t v21 = v12;
  [v8 _enumerateNodeTableWithNodeCursor:v9 block:&v15];
  if ((objc_msgSend(*(id *)(a1 + 32), "noFatalError", v15, v16, v17, v18) & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void *)(v13 + 24) + 1;
  *(void *)(v13 + 24) = v14;
  if (__ROR8__(0x8F5C28F5C28F5C29 * v14, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = MEMORY[0x1D25FA040]();
  }
}

uint64_t __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__KGDatabase__enumerateNodesWithNodeCursor_propertiesCursor_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  id v9 = a3;
  if (*(void *)(a1 + 56) == a2) {
    id v7 = *(id *)(a1 + 32);
  }
  else {
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *(void *)(a1 + 56) == a2;
  }
  *a4 = v8;
}

- (void)_enumerateEdgeTableWithEdgeCursor:(void *)a3 block:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v24 = (void (**)(id, sqlite3_int64, id, sqlite3_int64, sqlite3_int64, char *))a4;
  char v32 = 0;
  do
  {
    if (degas::Statement::next(*(sqlite3_stmt ***)a3) != 1) {
      break;
    }
    sqlite3_int64 v6 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
    long long v30 = 0u;
    memset(v31, 0, 25);
    degas::Statement::bitmapColumnValue(*(sqlite3_stmt ***)a3, 1, (degas::Bitmap *)&v30);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    degas::Bitmap::begin(&v30, &v27);
    uint64_t v8 = v31[1];
    while (1)
    {
      uint64_t v9 = v28;
      BOOL v10 = (long long *)v27 == &v30 && v28 == -1;
      if (v10 && v29 == v8) {
        break;
      }
      nameCache = self->_nameCache;
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v28];
      uint64_t v14 = [(KGDatabaseNameCache *)nameCache labelNameForIdentifier:v13 database:self];

      if (!v14)
      {
        uint64_t v15 = KGLoggingConnection();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)&v30);
          id v19 = __p;
          if (v26 < 0) {
            id v19 = (void **)__p[0];
          }
          database = (char *)self->_database;
          uint64_t v21 = database;
          if (database[23] < 0) {
            uint64_t v21 = *(char **)database;
          }
          BOOL v10 = database[32] == 0;
          uint64_t v22 = "true";
          if (v10) {
            uint64_t v22 = "false";
          }
          unint64_t databaseStatus = self->_databaseStatus;
          *(_DWORD *)buf = 134219522;
          *(void *)&uint8_t buf[4] = v9;
          __int16 v34 = 2048;
          sqlite3_int64 v35 = v6;
          __int16 v36 = 2112;
          id v37 = v7;
          __int16 v38 = 2080;
          uint64_t v39 = v19;
          __int16 v40 = 2080;
          int v41 = v21;
          __int16 v42 = 2080;
          long long v43 = v22;
          __int16 v44 = 2048;
          unint64_t v45 = databaseStatus;
          _os_log_fault_impl(&dword_1D1654000, v15, OS_LOG_TYPE_FAULT, "reading edge with unrecognised label identifier %lld, edge identifier %lld, labels %@, labels description %s with database url=%s, readonly=%s, database status=%ld", buf, 0x48u);
          if (v26 < 0) {
            operator delete(__p[0]);
          }
        }

        [(KGDatabase *)self setFatalError:@"missing label"];
        char v32 = 1;
        break;
      }
      [v7 addObject:v14];

      degas::Bitmap::iterator::operator++(&v27);
    }
    sqlite3_int64 v16 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 2);
    sqlite3_int64 v17 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 3);
    if ([(KGDatabase *)self noFatalError]) {
      v24[2](v24, v6, v7, v16, v17, &v32);
    }
    BOOL v18 = v32 == 0;

    *(void *)buf = v31;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  while (v18);
}

- (void)enumeratePropertyValuesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  [(KGDatabase *)self edgeAttributeValueCursorWithIdentifiers:a3 propertyName:a4];
  [(KGDatabase *)self _enumeratePropertiesWithCursor:v9 withBlock:v8];
  degas::Cursor::~Cursor(v9);
}

- (AttributeValueCursor)edgeAttributeValueCursorWithIdentifiers:(id)a3 propertyName:(id)a4
{
  id v7 = v4;
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = degas::AttributeValueTable::prepareStatementToReadByBitmapAndAttrIdIdentifier((degas::AttributeValueTable *)((char *)self->_database + 416), (Bitmap *)[v13 bitmap], -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v8));
  uint64_t v10 = v9[1];
  *id v7 = *v9;
  v7[1] = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }

  result.var0.var1 = v12;
  result.var0.var0 = v11;
  return result;
}

- (AttributeValueCursor)tombstoneEdgeAttributeValueCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v6 = a3;
  id v11 = v6;
  if (v6)
  {
    if ([v6 count] == 1) {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, [v11 firstElement], (const degas::AttributeValueTable *)((char *)self->_database + 976));
    }
    else {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, (Bitmap *)[v11 bitmap], (const degas::AttributeValueTable *)((char *)self->_database + 976));
    }
  }
  else
  {
    AllStatement = degas::AttributeValueTable::readAllStatement((degas::AttributeValueTable *)((char *)self->_database
                                                                                             + 976));
    uint64_t v8 = AllStatement[1];
    *uint64_t v5 = *AllStatement;
    v5[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
  }

  result.var0.var1 = v10;
  result.var0.var0 = v9;
  return result;
}

- (AttributeValueCursor)edgeAttributeValueCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v6 = a3;
  id v11 = v6;
  if (v6)
  {
    if ([v6 count] == 1) {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, [v11 firstElement], (const degas::AttributeValueTable *)((char *)self->_database + 416));
    }
    else {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, (Bitmap *)[v11 bitmap], (const degas::AttributeValueTable *)((char *)self->_database + 416));
    }
  }
  else
  {
    AllStatement = degas::AttributeValueTable::readAllStatement((degas::AttributeValueTable *)((char *)self->_database
                                                                                             + 416));
    uint64_t v8 = AllStatement[1];
    *uint64_t v5 = *AllStatement;
    v5[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
  }

  result.var0.var1 = v10;
  result.var0.var0 = v9;
  return result;
}

- (EdgeCursor)tombstoneEdgeCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v8 = a3;
  degas::EdgeCursor::EdgeCursor(v5);
  if (v8)
  {
    if ([v8 count] == 1) {
      degas::EdgeCursor::setForIdentifier(v5, [v8 firstElement], (const degas::EdgeTable *)((char *)self->_database + 864));
    }
    else {
      degas::EdgeCursor::setForIdentifiers(v5, (Bitmap *)[v8 bitmap], (const degas::EdgeTable *)((char *)self->_database + 864));
    }
  }
  else
  {
    degas::EdgeCursor::setForSelectAll(v5, (const degas::EdgeTable *)((char *)self->_database + 864));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (EdgeCursor)edgeCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v8 = a3;
  degas::EdgeCursor::EdgeCursor(v5);
  if (v8)
  {
    if ([v8 count] == 1) {
      degas::EdgeCursor::setForIdentifier(v5, [v8 firstElement], (const degas::EdgeTable *)((char *)self->_database + 248));
    }
    else {
      degas::EdgeCursor::setForIdentifiers(v5, (Bitmap *)[v8 bitmap], (const degas::EdgeTable *)((char *)self->_database + 248));
    }
  }
  else
  {
    degas::EdgeCursor::setForSelectAll(v5, (const degas::EdgeTable *)((char *)self->_database + 248));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (void)_enumerateNodeTableWithNodeCursor:(void *)a3 block:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v24 = (void (**)(id, sqlite3_int64, id, char *))a4;
  char v32 = 0;
  *(void *)&long long v6 = 134219522;
  long long v23 = v6;
  do
  {
    if (degas::Statement::next(*(sqlite3_stmt ***)a3) != 1) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(**(sqlite3_stmt ***)a3, 0);
    long long v30 = 0u;
    memset(v31, 0, 25);
    degas::Statement::bitmapColumnValue(*(sqlite3_stmt ***)a3, 1, (degas::Bitmap *)&v30);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    degas::Bitmap::begin(&v30, &v27);
    uint64_t v9 = v31[1];
    while (1)
    {
      uint64_t v10 = v28;
      BOOL v11 = (long long *)v27 == &v30 && v28 == -1;
      if (v11 && v29 == v9) {
        break;
      }
      nameCache = self->_nameCache;
      uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v28];
      uint64_t v15 = [(KGDatabaseNameCache *)nameCache labelNameForIdentifier:v14 database:self];

      if (!v15)
      {
        sqlite3_int64 v16 = KGLoggingConnection();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)&v30);
          BOOL v18 = __p;
          if (v26 < 0) {
            BOOL v18 = (void **)__p[0];
          }
          database = (char *)self->_database;
          id v20 = database;
          if (database[23] < 0) {
            id v20 = *(char **)database;
          }
          BOOL v11 = database[32] == 0;
          uint64_t v21 = "true";
          if (v11) {
            uint64_t v21 = "false";
          }
          unint64_t databaseStatus = self->_databaseStatus;
          *(_DWORD *)buf = v23;
          *(void *)&uint8_t buf[4] = v10;
          __int16 v34 = 2048;
          sqlite3_int64 v35 = v7;
          __int16 v36 = 2112;
          id v37 = v8;
          __int16 v38 = 2080;
          uint64_t v39 = v18;
          __int16 v40 = 2080;
          int v41 = v20;
          __int16 v42 = 2080;
          long long v43 = v21;
          __int16 v44 = 2048;
          unint64_t v45 = databaseStatus;
          _os_log_fault_impl(&dword_1D1654000, v16, OS_LOG_TYPE_FAULT, "reading node with unrecognised label identifier %lld, node identifier %lld, labels %@, labels description %s database url=%s, readonly=%s, database status=%ld", buf, 0x48u);
          if (v26 < 0) {
            operator delete(__p[0]);
          }
        }

        [(KGDatabase *)self setFatalError:@"missing label"];
        char v32 = 1;
        break;
      }
      [v8 addObject:v15];

      degas::Bitmap::iterator::operator++(&v27);
    }
    if ([(KGDatabase *)self noFatalError]) {
      v24[2](v24, v7, v8, &v32);
    }
    BOOL v17 = v32 == 0;

    *(void *)buf = v31;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  while (v17);
}

- (void)enumeratePropertyValuesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  [(KGDatabase *)self nodeAttributeValueCursorWithIdentifiers:a3 propertyName:a4];
  [(KGDatabase *)self _enumeratePropertiesWithCursor:v9 withBlock:v8];
  degas::Cursor::~Cursor(v9);
}

- (AttributeValueCursor)nodeAttributeValueCursorWithIdentifiers:(id)a3 propertyName:(id)a4
{
  sqlite3_int64 v7 = v4;
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = degas::AttributeValueTable::prepareStatementToReadByBitmapAndAttrIdIdentifier((degas::AttributeValueTable *)((char *)self->_database + 360), (Bitmap *)[v13 bitmap], -[KGDatabase attributeIdentifierForPropertyName:](self, "attributeIdentifierForPropertyName:", v8));
  uint64_t v10 = v9[1];
  *sqlite3_int64 v7 = *v9;
  v7[1] = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }

  result.var0.var1 = v12;
  result.var0.var0 = v11;
  return result;
}

- (AttributeValueCursor)tombstoneNodeAttributeValueCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v6 = a3;
  id v11 = v6;
  if (v6)
  {
    if ([v6 count] == 1) {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, [v11 firstElement], (const degas::AttributeValueTable *)((char *)self->_database + 920));
    }
    else {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, (Bitmap *)[v11 bitmap], (const degas::AttributeValueTable *)((char *)self->_database + 920));
    }
  }
  else
  {
    AllStatement = degas::AttributeValueTable::readAllStatement((degas::AttributeValueTable *)((char *)self->_database
                                                                                             + 360));
    uint64_t v8 = AllStatement[1];
    *uint64_t v5 = *AllStatement;
    v5[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
  }

  result.var0.var1 = v10;
  result.var0.var0 = v9;
  return result;
}

- (AttributeValueCursor)nodeAttributeValueCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v6 = a3;
  id v11 = v6;
  if (v6)
  {
    if ([v6 count] == 1) {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, [v11 firstElement], (const degas::AttributeValueTable *)((char *)self->_database + 360));
    }
    else {
      degas::AttributeValueCursor::AttributeValueCursor((degas::AttributeValueCursor *)v5, (Bitmap *)[v11 bitmap], (const degas::AttributeValueTable *)((char *)self->_database + 360));
    }
  }
  else
  {
    AllStatement = degas::AttributeValueTable::readAllStatement((degas::AttributeValueTable *)((char *)self->_database
                                                                                             + 360));
    uint64_t v8 = AllStatement[1];
    *uint64_t v5 = *AllStatement;
    v5[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
  }

  result.var0.var1 = v10;
  result.var0.var0 = v9;
  return result;
}

- (NodeCursor)tombstoneNodeCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v8 = a3;
  degas::NodeCursor::NodeCursor(v5);
  if (v8)
  {
    if ([v8 count] == 1) {
      degas::NodeCursor::setForIdentifier(v5, [v8 firstElement], (const degas::NodeTable *)((char *)self->_database + 808));
    }
    else {
      degas::NodeCursor::setForIdentifiers(v5, (Bitmap *)[v8 bitmap], (const degas::NodeTable *)((char *)self->_database + 808));
    }
  }
  else
  {
    degas::NodeCursor::setForSelectAll(v5, (const degas::NodeTable *)((char *)self->_database + 808));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (NodeCursor)nodeCursorWithIdentifiers:(id)a3
{
  uint64_t v5 = v3;
  id v8 = a3;
  degas::NodeCursor::NodeCursor(v5);
  if (v8)
  {
    if ([v8 count] == 1) {
      degas::NodeCursor::setForIdentifier(v5, [v8 firstElement], (const degas::NodeTable *)((char *)self->_database + 192));
    }
    else {
      degas::NodeCursor::setForIdentifiers(v5, (Bitmap *)[v8 bitmap], (const degas::NodeTable *)((char *)self->_database + 192));
    }
  }
  else
  {
    degas::NodeCursor::setForSelectAll(v5, (const degas::NodeTable *)((char *)self->_database + 192));
  }

  result.var0.var1 = v7;
  result.var0.var0 = v6;
  return result;
}

- (void)enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:(id)a3 block:(id)a4
{
  id v6 = (void (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, unsigned char *))a4;
  [(KGDatabase *)self edgeCursorWithIdentifiers:a3];
  char v10 = 0;
  do
  {
    if (degas::Statement::next((sqlite3_stmt **)v11) != 1) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v11, 0);
    sqlite3_int64 v8 = sqlite3_column_int64(*(sqlite3_stmt **)v11, 2);
    sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11, 3);
    v6[2](v6, v7, v8, v9, &v10);
  }
  while (!v10);
  degas::Cursor::~Cursor(&v11);
}

- (void)enumerateTombstoneEdgesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(KGDatabase *)self tombstoneEdgeCursorWithIdentifiers:v6];
  [(KGDatabase *)self tombstoneEdgeAttributeValueCursorWithIdentifiers:v6];
  [(KGDatabase *)self _enumerateEdgesWithEdgeCursor:v9 propertiesCursor:v8 block:v7];
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);
}

- (void)enumerateTombstoneNodesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(KGDatabase *)self tombstoneNodeCursorWithIdentifiers:v6];
  [(KGDatabase *)self tombstoneNodeAttributeValueCursorWithIdentifiers:v6];
  [(KGDatabase *)self _enumerateNodesWithNodeCursor:v9 propertiesCursor:v8 block:v7];
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);
}

- (void)enumerateEdgesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(KGDatabase *)self edgeCursorWithIdentifiers:v6];
  [(KGDatabase *)self edgeAttributeValueCursorWithIdentifiers:v6];
  [(KGDatabase *)self _enumerateEdgesWithEdgeCursor:v9 propertiesCursor:v8 block:v7];
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);
}

- (void)enumerateNodesWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(KGDatabase *)self nodeCursorWithIdentifiers:v6];
  [(KGDatabase *)self nodeAttributeValueCursorWithIdentifiers:v6];
  [(KGDatabase *)self _enumerateNodesWithNodeCursor:v9 propertiesCursor:v8 block:v7];
  degas::Cursor::~Cursor(v8);
  degas::Cursor::~Cursor(v9);
}

- (int)degasEdgeDirectionFromKG:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 < 3) {
    return 3 - a3;
  }
  int v4 = a3;
  uint64_t v5 = KGLoggingConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_error_impl(&dword_1D1654000, v5, OS_LOG_TYPE_ERROR, "invalid edge direction: %d", (uint8_t *)v6, 8u);
  }

  return 0;
}

- (id)propertyNameForAttrIdentifier:(unint64_t)a3
{
  nameCache = self->_nameCache;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [(KGDatabaseNameCache *)nameCache propertyNameForIdentifier:v5 database:self];

  return v6;
}

- (unint64_t)attributeIdentifierForPropertyName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(KGDatabaseNameCache *)self->_nameCache attrIdentifierForPropertyName:v4 database:self];
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntegerValue];
    goto LABEL_7;
  }
  stringNSToStd(__p, v4);
  database = self->_database;
  if (*((unsigned char *)database + 32)) {
    goto LABEL_4;
  }
  *(void *)buf = 0;
  int v10 = degas::AttributeTable::insert((sqlite3 **)database + 38, (sqlite3_int64 *)buf, (uint64_t *)__p);
  if (v10)
  {
    if (v10 != 8)
    {
      id v11 = KGLoggingConnection();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_error_impl(&dword_1D1654000, v11, OS_LOG_TYPE_ERROR, "failed to create new attribute %@", buf, 0xCu);
      }
    }
LABEL_4:
    id v6 = 0;
    unint64_t v7 = 0;
    goto LABEL_5;
  }
  unint64_t v7 = *(void *)buf;
  id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)buf];
  -[KGDatabaseNameCache addPropertyName:identifier:database:](self->_nameCache, "addPropertyName:identifier:database:", v4);
LABEL_5:
  if (v13 < 0) {
    operator delete(__p[0]);
  }
LABEL_7:

  return v7;
}

- (NSUUID)graphIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v10[0] = 0;
  v10[1] = 0;
  uint64_t v11 = 0;
  int v3 = degas::Database::metadataValue((uint64_t)self->_database, 2, (uint64_t)v10);
  int v4 = v3;
  if (v3)
  {
    if (v3 == 2)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F29128]);
      id v6 = [v5 UUIDString];
      stringNSToStd(__p, v6);
      database = (char *)self->_database;
      if (!database[32]) {
        degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(database + 136), 2, (uint64_t *)__p);
      }
      if (v13 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      id v6 = KGLoggingConnection();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__p[0]) = 67109120;
        HIDWORD(__p[0]) = v4;
        _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "failed reading graph identifier metadata rc=%d", (uint8_t *)__p, 8u);
      }
      id v5 = 0;
    }
  }
  else
  {
    if (v11 >= 0) {
      sqlite3_int64 v8 = v10;
    }
    else {
      sqlite3_int64 v8 = (void **)v10[0];
    }
    id v6 = [NSString stringWithUTF8String:v8];
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }

  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
  return (NSUUID *)v5;
}

- (void)setGraphVersion:(unint64_t)a3
{
  database = (char *)self->_database;
  if (!database[32]) {
    degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(database + 136), 1, a3);
  }
}

- (unint64_t)graphVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = 0;
  int v2 = degas::Database::metadataValue((degas::Database *)self->_database, 1, (sqlite3_int64 *)&v6);
  if (v2 != 2)
  {
    int v3 = v2;
    if (!v2) {
      return v6;
    }
    id v5 = KGLoggingConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v3;
      _os_log_error_impl(&dword_1D1654000, v5, OS_LOG_TYPE_ERROR, "failed reading graph version metadata rc=%d", buf, 8u);
    }
  }
  return 0;
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  memset(v13, 0, 25);
  degas::EdgeCursor::EdgeCursor(v11);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v11, (Bitmap *)[v4 bitmap], (const degas::EdgeTable *)((char *)self->_database + 248));
  while (degas::Statement::next((sqlite3_stmt **)v11[0]) == 1)
  {
    long long v9 = 0u;
    memset(v10, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v11[0], 1, (degas::Bitmap *)&v9);
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v12, (uint64_t)&v9);
    uint64_t v14 = (void **)v10;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  degas::Bitmap::begin(&v12, &v9);
  while (1)
  {
    BOOL v6 = (long long *)v9 == &v12 && *((void *)&v9 + 1) == -1;
    if (v6 && v10[0] == v13[1]) {
      break;
    }
    unint64_t v7 = -[KGDatabase labelNameForLabelIdentifier:](self, "labelNameForLabelIdentifier:");
    if (v7) {
      [v5 addObject:v7];
    }

    degas::Bitmap::iterator::operator++((unint64_t *)&v9);
  }
  degas::Cursor::~Cursor(v11);
  *(void *)&long long v9 = v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);

  return v5;
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  memset(v13, 0, 25);
  degas::NodeCursor::NodeCursor(v11);
  degas::NodeCursor::setForIdentifiers((degas::NodeCursor *)v11, (Bitmap *)[v4 bitmap], (const degas::NodeTable *)((char *)self->_database + 192));
  while (degas::Statement::next((sqlite3_stmt **)v11[0]) == 1)
  {
    long long v9 = 0u;
    memset(v10, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v11[0], 1, (degas::Bitmap *)&v9);
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v12, (uint64_t)&v9);
    uint64_t v14 = (void **)v10;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  degas::Bitmap::begin(&v12, &v9);
  while (1)
  {
    BOOL v6 = (long long *)v9 == &v12 && *((void *)&v9 + 1) == -1;
    if (v6 && v10[0] == v13[1]) {
      break;
    }
    unint64_t v7 = -[KGDatabase labelNameForLabelIdentifier:](self, "labelNameForLabelIdentifier:");
    if (v7) {
      [v5 addObject:v7];
    }

    degas::Bitmap::iterator::operator++((unint64_t *)&v9);
  }
  degas::Cursor::~Cursor(v11);
  *(void *)&long long v9 = v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);

  return v5;
}

- (id)edgeLabels
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  AllStatement = degas::LabelTable::readAllStatement((degas::LabelTable *)((char *)self->_database + 80));
  id v5 = (degas::Statement *)*AllStatement;
  BOOL v6 = (atomic_ullong *)AllStatement[1];
  v15[0] = v5;
  v15[1] = (degas::Statement *)v6;
  if (v6) {
    atomic_fetch_add_explicit(v6 + 1, 1uLL, memory_order_relaxed);
  }
  while (degas::Statement::next((sqlite3_stmt **)v5) == 1)
  {
    long long v13 = 0u;
    memset(v14, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 3, (degas::Bitmap *)&v13);
    if (v14[0] != v14[1])
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v12 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v15[0], 1, (uint64_t)__p);
      id v7 = [NSString alloc];
      if (v12 >= 0) {
        int v8 = __p;
      }
      else {
        int v8 = (void **)__p[0];
      }
      long long v9 = (void *)[v7 initWithUTF8String:v8];
      [v3 addObject:v9];

      if (SHIBYTE(v12) < 0) {
        operator delete(__p[0]);
      }
    }
    __p[0] = v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    id v5 = v15[0];
  }
  degas::Cursor::~Cursor(v15);
  return v3;
}

- (id)nodeLabels
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  AllStatement = degas::LabelTable::readAllStatement((degas::LabelTable *)((char *)self->_database + 80));
  id v5 = (degas::Statement *)*AllStatement;
  BOOL v6 = (atomic_ullong *)AllStatement[1];
  v15[0] = v5;
  v15[1] = (degas::Statement *)v6;
  if (v6) {
    atomic_fetch_add_explicit(v6 + 1, 1uLL, memory_order_relaxed);
  }
  while (degas::Statement::next((sqlite3_stmt **)v5) == 1)
  {
    long long v13 = 0u;
    memset(v14, 0, 25);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 2, (degas::Bitmap *)&v13);
    if (v14[0] != v14[1])
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v12 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v15[0], 1, (uint64_t)__p);
      id v7 = [NSString alloc];
      if (v12 >= 0) {
        int v8 = __p;
      }
      else {
        int v8 = (void **)__p[0];
      }
      long long v9 = (void *)[v7 initWithUTF8String:v8];
      [v3 addObject:v9];

      if (SHIBYTE(v12) < 0) {
        operator delete(__p[0]);
      }
    }
    __p[0] = v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    id v5 = v15[0];
  }
  degas::Cursor::~Cursor(v15);
  return v3;
}

- (id)labelIdentifierForLabelName:(id)a3
{
  id v3 = [(KGDatabaseNameCache *)self->_nameCache labelIdentifierForName:a3 database:self];
  return v3;
}

- (id)labelNameForLabelIdentifier:(unint64_t)a3
{
  nameCache = self->_nameCache;
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  BOOL v6 = [(KGDatabaseNameCache *)nameCache labelNameForIdentifier:v5 database:self];

  return v6;
}

- (BOOL)labelIdentifiers:(void *)a3 forLabels:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[KGDatabaseNameCache labelIdentifierForName:database:](self->_nameCache, "labelIdentifierForName:database:", *(void *)(*((void *)&v14 + 1) + 8 * i), self, (void)v14);
        uint64_t v12 = v11;
        if (v11) {
          degas::Bitmap::setBit((degas::Bitmap *)a3, [v11 unsignedIntegerValue]);
        }
        else {
          char v9 = 0;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    char v9 = 1;
  }

  return v9 & 1;
}

- (Bitmap)upsertLabels:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  *(_OWORD *)&retstr->_bitCount = 0u;
  *(_OWORD *)&retstr->_bitSets.__begin_ = 0u;
  *(_OWORD *)((char *)&retstr->_bitSets.__end_ + 1) = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
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
        degas::Bitmap::setBit((degas::Bitmap *)retstr, -[KGDatabase upsertLabel:](self, "upsertLabel:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12));
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return result;
}

- (unint64_t)upsertLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(KGDatabaseNameCache *)self->_nameCache labelIdentifierForName:v4 database:self];
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = [(KGDatabase *)self insertNewLabel:v4];
    nameCache = self->_nameCache;
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v7];
    [(KGDatabaseNameCache *)nameCache addLabelName:v4 identifier:v9 database:self];
  }
  return v7;
}

- (unint64_t)insertNewLabel:(id)a3
{
  stringNSToStd(__p, a3);
  sqlite3_int64 v4 = degas::Database::addLabel((uint64_t)self->_database, (uint64_t)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 isEqual:self->_url])
  {
    database = self->_database;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 fileSystemRepresentation]);
    int v9 = degas::Database::copyDatabase((uint64_t)database, __p);
    if (v13 < 0)
    {
      operator delete(__p[0]);
      if (!a4)
      {
LABEL_14:
        BOOL v7 = v9 == 0;
        goto LABEL_15;
      }
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    if (v9)
    {
      if ((v9 - 2) > 8) {
        uint64_t v10 = -1;
      }
      else {
        uint64_t v10 = qword_1D17CE530[v9 - 2];
      }
      kg_errorWithCode(v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  if (a4)
  {
    kg_errorWithCode(5003);
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_15:

  return v7;
}

- (void)close
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(KGGraphLockFile *)self->_lockFile unlock];
  degas::Database::close((degas::Database *)self->_database);
  database = (void **)self->_database;
  if (database)
  {
    degas::Database::~Database(database);
    MEMORY[0x1D25F9A90]();
  }
  sqlite3_int64 v4 = KGLoggingConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    url = self->_url;
    int v6 = 138412290;
    BOOL v7 = url;
    _os_log_impl(&dword_1D1654000, v4, OS_LOG_TYPE_INFO, "closing graph database at path %@", (uint8_t *)&v6, 0xCu);
  }

  self->_database = 0;
  +[KGElementIdentifierSet drainBitsetPool];
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (id)openModeDescription:(unint64_t)a3
{
  int v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = v4;
  if (v3)
  {
    int v6 = @"read-only";
  }
  else
  {
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    int v6 = @"read-write";
  }
  [v4 appendString:v6];
LABEL_6:
  if ((v3 & 4) != 0) {
    [v5 appendString:@" create"];
  }
  if ((v3 & 0x40) != 0)
  {
    BOOL v7 = @" protection class A";
  }
  else if ((v3 & 0x20) != 0)
  {
    BOOL v7 = @" protection class B";
  }
  else
  {
    if ((v3 & 0x10) == 0) {
      goto LABEL_15;
    }
    BOOL v7 = @" protection class C";
  }
  [v5 appendString:v7];
LABEL_15:
  if ((v3 & 0x80) != 0) {
    [v5 appendString:@" (track changes)"];
  }
  if ((v3 & 0x10000) != 0) {
    [v5 appendString:@" (test mode - should fail)"];
  }
  return v5;
}

- (void)setFatalError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  self->_unint64_t databaseStatus = 0;
  if (!*((unsigned char *)self->_database + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
    degas::Database::setDatabaseFatalProblem((uint64_t)self->_database, (uint64_t *)__p);
    if (v8 < 0) {
      operator delete(*(void **)__p);
    }
  }
  int v6 = KGLoggingConnection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long __p = 138412290;
    *(void *)&__p[4] = v5;
    _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "fatal error detected: %@", __p, 0xCu);
  }
}

- (BOOL)noFatalError
{
  return self->_databaseStatus == 1;
}

- (void)dealloc
{
  if (self->_database) {
    __assert_rtn("-[KGDatabase dealloc]", "KGDatabase.mm", 460, "_database == NULL");
  }
  v2.receiver = self;
  v2.super_class = (Class)KGDatabase;
  [(KGDatabase *)&v2 dealloc];
}

- (KGDatabase)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KGDatabase;
  int v6 = [(KGDatabase *)&v11 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    char v8 = objc_alloc_init(KGDatabaseNameCache);
    nameCache = v7->_nameCache;
    v7->_nameCache = v8;

    v7->_unint64_t databaseStatus = 1;
  }

  return v7;
}

+ (void)deleteClosedDatabaseFilesAtStoreURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  if ([v4 fileExistsAtPath:v5])
  {
    id v16 = 0;
    int v6 = [v4 removeItemAtPath:v5 error:&v16];
    id v7 = v16;
    if (v6)
    {
      char v8 = [v5 stringByAppendingString:@"-wal"];
      id v15 = v7;
      int v9 = [v4 removeItemAtPath:v8 error:&v15];
      id v10 = v15;

      if (v9)
      {
        objc_super v11 = [v5 stringByAppendingString:@"-shm"];
        id v14 = v10;
        char v12 = [v4 removeItemAtPath:v11 error:&v14];
        id v7 = v14;

        if (v12) {
          goto LABEL_11;
        }
      }
      else
      {
        id v7 = v10;
      }
    }
    char v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed deleting database files: %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = 0;
  }
LABEL_11:
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  std::string::basic_string[abi:ne180100]<0>(v17, (char *)[v10 fileSystemRepresentation]);
  id v11 = v9;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 fileSystemRepresentation]);
  int v12 = degas::Database::copyDatabaseFromTo((const char *)v17, __p);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if ((v18 & 0x80000000) == 0)
  {
    if (v12) {
      goto LABEL_5;
    }
LABEL_9:
    [a1 destroyAtURL:v10 error:a5];
    goto LABEL_12;
  }
  operator delete(v17[0]);
  if (!v12) {
    goto LABEL_9;
  }
LABEL_5:
  if (a5)
  {
    if ((v12 - 2) > 8) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = qword_1D17CE530[v12 - 2];
    }
    kg_errorWithCode(v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v12 == 0;
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  degas::Database::Database((degas::Database *)v19);
  id v9 = v7;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 fileSystemRepresentation]);
  int Only = degas::Database::openReadOnly((std::string::size_type)v19, (std::string::size_type)__p);
  int v11 = Only;
  if ((v18 & 0x80000000) == 0)
  {
    if (Only) {
      goto LABEL_3;
    }
LABEL_7:
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 fileSystemRepresentation]);
    int v13 = degas::Database::backupDatabase((uint64_t)v19, (uint64_t)__p);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!a5)
      {
LABEL_19:
        degas::Database::close((degas::Database *)v19);
        BOOL v14 = v13 == 0;
        goto LABEL_20;
      }
    }
    else if (!a5)
    {
      goto LABEL_19;
    }
    if (v13)
    {
      if ((v13 - 2) > 8) {
        uint64_t v15 = -1;
      }
      else {
        uint64_t v15 = qword_1D17CE530[v13 - 2];
      }
      kg_errorWithCode(v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  operator delete(__p[0]);
  if (!v11) {
    goto LABEL_7;
  }
LABEL_3:
  if (a5)
  {
    if ((v11 - 2) > 8) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = qword_1D17CE530[v11 - 2];
    }
    kg_errorWithCode(v12);
    BOOL v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_20:
  degas::Database::~Database(v19);

  return v14;
}

+ (BOOL)emptyDatabaseExistsAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 fileSystemRepresentation]);
  int isEmptyDatabaseAtPath = degas::Database::isEmptyDatabaseAtPath((const char *)__p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  unsigned int v7 = isEmptyDatabaseAtPath - 2;
  if (isEmptyDatabaseAtPath != 2 && a4 && isEmptyDatabaseAtPath != 1)
  {
    if (v7 > 8) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = qword_1D17CE530[v7];
    }
    kg_errorWithCode(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return isEmptyDatabaseAtPath == 2;
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = [v5 path];
  unsigned int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v7 fileExistsAtPath:v6])
  {
    id v8 = v5;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 fileSystemRepresentation]);
    int v9 = degas::Database::truncateDatabaseAtPath((uint64_t *)__p);
    int v10 = v9;
    if ((v13 & 0x80000000) == 0)
    {
      if (!v9) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    operator delete(__p[0]);
    if (v10) {
LABEL_6:
    }
      [a1 deleteClosedDatabaseFilesAtStoreURL:v8];
  }
LABEL_7:

  return 1;
}

+ (void)initialize
{
  objc_super v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"com.apple.knowledgegraph.explainmode"];

  if (v3 == 1)
  {
    id v4 = &degas::sExplainQuery;
    id v5 = &degas::sExplainQueryPlan;
  }
  else
  {
    if (v3 != 2) {
      goto LABEL_6;
    }
    id v4 = &degas::sExplainQueryPlan;
    id v5 = &degas::sExplainQuery;
  }
  *id v5 = 1;
  char *v4 = 0;
LABEL_6:
  int v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v7 = [v6 integerForKey:@"com.apple.knowledgegraph.querylogging"];

  if (v7 == 1)
  {
    id v8 = &degas::sQueryLogging;
  }
  else
  {
    if (v7 != 2) {
      goto LABEL_11;
    }
    id v8 = &degas::sQueryProfiling;
  }
  *id v8 = 1;
LABEL_11:
  int v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v10 = [v9 BOOLForKey:@"com.apple.knowledgegraph.instrumentedtraversal"];

  if (v10) {
    degas::sInstrumentTraversal = 1;
  }
  char v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v12 = [v11 BOOLForKey:@"com.apple.knowledgegraph.insertlabeltracking"];

  if (v12) {
    degas::sDatabaseInsertLabelTracking = 1;
  }
  char v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v14 = [v13 BOOLForKey:@"com.apple.knowledgegraph.labelreferencechecking"];

  if (v14) {
    degas::sDatabaseLabelReferenceChecking = 1;
  }
}

@end