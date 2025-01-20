@interface KGGraph
- (BOOL)noFatalError;
- (KGEntityFactory)entityFactory;
- (KGGraph)initWithImplementation:(id)a3 entityFactory:(id)a4;
- (KGGraphImplementation)implementation;
- (NSUUID)graphIdentifier;
- (id)_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4;
- (id)_nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4;
- (id)adjacencyWithSourceNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeDirection:(unint64_t)a5;
- (id)adjacencyWithTargetNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeDirection:(unint64_t)a5;
- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5;
- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)edgeForIdentifier:(unint64_t)a3;
- (id)edgeIdentifiersBetweenStartNodeIdentifiers:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6;
- (id)edgeIdentifiersMatchingFilter:(id)a3;
- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4;
- (id)edgeLabels;
- (id)edgesForIdentifiers:(id)a3;
- (id)labelsOfEdgesForIdentifiers:(id)a3;
- (id)labelsOfNodesForIdentifiers:(id)a3;
- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5;
- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6;
- (id)nodeForIdentifier:(unint64_t)a3;
- (id)nodeIdentifiersMatchingFilter:(id)a3;
- (id)nodeIdentifiersOfEdgesForIdentifiers:(id)a3 edgeDirection:(unint64_t)a4;
- (id)nodeLabels;
- (id)nodesForIdentifiers:(id)a3;
- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3;
- (id)targetsBySourceWithEdgeIdentifiers:(id)a3;
- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5;
@end

@implementation KGGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityFactory, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
}

- (KGEntityFactory)entityFactory
{
  return self->_entityFactory;
}

- (KGGraphImplementation)implementation
{
  return self->_implementation;
}

- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  return (id)[(KGGraphImplementation *)self->_implementation edgeChangesAfterToken:a3 transactionLimit:a4 edgeFilter:a5 error:a6];
}

- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6
{
  return (id)[(KGGraphImplementation *)self->_implementation nodeChangesAfterToken:a3 transactionLimit:a4 nodeFilter:a5 error:a6];
}

- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5
{
  return (id)[(KGGraphImplementation *)self->_implementation changesAfterToken:a3 transactionLimit:a4 error:a5];
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  return (id)[(KGGraphImplementation *)self->_implementation labelsOfEdgesForIdentifiers:a3];
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  return (id)[(KGGraphImplementation *)self->_implementation labelsOfNodesForIdentifiers:a3];
}

- (id)edgeLabels
{
  return (id)[(KGGraphImplementation *)self->_implementation edgeLabels];
}

- (id)nodeLabels
{
  return (id)[(KGGraphImplementation *)self->_implementation nodeLabels];
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v10 = 0;
  v6 = [(KGGraphImplementation *)implementation transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:a3 edgeDirection:a4 edgeFilter:a5 error:&v10];
  id v7 = v10;
  if (!v6)
  {
    v8 = KGLoggingConnection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_1D1654000, v8, OS_LOG_TYPE_ERROR, "Error fetching transitive closure neighbor node identifiers with error(%@)", buf, 0xCu);
    }

    v6 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v6;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v10 = 0;
  v6 = [(KGGraphImplementation *)implementation neighborNodeIdentifiersWithStartNodeIdentifiers:a3 edgeDirection:a4 edgeFilter:a5 error:&v10];
  id v7 = v10;
  if (!v6)
  {
    v8 = KGLoggingConnection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_1D1654000, v8, OS_LOG_TYPE_ERROR, "Error fetching neighbor node identifiers with error(%@)", buf, 0xCu);
    }

    v6 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v6;
}

- (id)edgeIdentifiersBetweenStartNodeIdentifiers:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v11 = 0;
  id v7 = [(KGGraphImplementation *)implementation edgeIdentifiersBetween:a3 endNodeIdentifiers:a4 edgeFilter:a5 edgeDirection:a6 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    v9 = KGLoggingConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_error_impl(&dword_1D1654000, v9, OS_LOG_TYPE_ERROR, "Error fetching edge identifiers for nodes with error(%@)", buf, 0xCu);
    }

    id v7 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v7;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v9 = 0;
  v5 = [(KGGraphImplementation *)implementation edgeIdentifiersWithStartNodeIdentifiers:a3 edgeDirection:a4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = KGLoggingConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1D1654000, v7, OS_LOG_TYPE_ERROR, "Error fetching edge identifiers for nodes with error(%@)", buf, 0xCu);
    }

    v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v9 = 0;
  v5 = [(KGGraphImplementation *)implementation edgeIdentifiersMatchingFilter:a3 intersectingIdentifiers:a4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = KGLoggingConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1D1654000, v7, OS_LOG_TYPE_ERROR, "Error fetching edge identifiers with error(%@)", buf, 0xCu);
    }

    v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3
{
  return [(KGGraph *)self _edgeIdentifiersMatchingFilter:a3 intersectingIdentifiers:0];
}

- (id)adjacencyWithTargetNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeDirection:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ((v5 & 2) != 0)
  {
    id v11 = [(KGGraph *)self edgeIdentifiersWithStartNodeIdentifiers:v8 edgeDirection:1];
    uint64_t v12 = [(KGGraph *)self edgeIdentifiersMatchingFilter:v9 intersectingIdentifiers:v11];

    id v13 = [(KGGraph *)self targetsBySourceWithEdgeIdentifiers:v12];

    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    id v10 = v13;
  }
  else
  {
    if ((v5 & 1) == 0)
    {
LABEL_10:
      id v13 = objc_alloc_init(KGDirectedBinaryAdjacency);
      goto LABEL_12;
    }
    id v10 = 0;
  }
  uint64_t v14 = [(KGGraph *)self edgeIdentifiersWithStartNodeIdentifiers:v8 edgeDirection:2];
  v15 = [(KGGraph *)self edgeIdentifiersMatchingFilter:v9 intersectingIdentifiers:v14];

  id v13 = [(KGGraph *)self sourcesByTargetWithEdgeIdentifiers:v15];

  if (!v10)
  {
LABEL_9:
    if (v13) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (v13)
  {
    uint64_t v16 = [(KGDirectedBinaryAdjacency *)v10 unionWith:v13];

    id v13 = (KGDirectedBinaryAdjacency *)v16;
  }
  else
  {
    id v13 = v10;
  }
LABEL_12:

  return v13;
}

- (id)adjacencyWithSourceNodeIdentifiers:(id)a3 edgeFilter:(id)a4 edgeDirection:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(KGDirectedBinaryAdjacency);
  id v11 = objc_alloc_init(KGDirectedBinaryAdjacency);
  if ((v5 & 2) != 0)
  {
    uint64_t v12 = [(KGGraph *)self edgeIdentifiersWithStartNodeIdentifiers:v8 edgeDirection:2];
    id v13 = [(KGGraph *)self edgeIdentifiersMatchingFilter:v9 intersectingIdentifiers:v12];

    uint64_t v14 = [(KGGraph *)self targetsBySourceWithEdgeIdentifiers:v13];

    id v10 = (KGDirectedBinaryAdjacency *)v14;
  }
  if (v5)
  {
    v15 = [(KGGraph *)self edgeIdentifiersWithStartNodeIdentifiers:v8 edgeDirection:1];
    uint64_t v16 = [(KGGraph *)self edgeIdentifiersMatchingFilter:v9 intersectingIdentifiers:v15];

    uint64_t v17 = [(KGGraph *)self sourcesByTargetWithEdgeIdentifiers:v16];

    id v11 = (KGDirectedBinaryAdjacency *)v17;
  }
  v18 = [(KGDirectedBinaryAdjacency *)v10 unionWith:v11];

  return v18;
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v8 = 0;
  v4 = [(KGGraphImplementation *)implementation sourcesByTargetWithEdgeIdentifiers:a3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = KGLoggingConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "Error fetching sources by target adjacency with error(%@)", buf, 0xCu);
    }

    v4 = objc_alloc_init(KGDirectedBinaryAdjacency);
  }

  return v4;
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v8 = 0;
  v4 = [(KGGraphImplementation *)implementation targetsBySourceWithEdgeIdentifiers:a3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = KGLoggingConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "Error fetching targets by source adjacency with error(%@)", buf, 0xCu);
    }

    v4 = objc_alloc_init(KGDirectedBinaryAdjacency);
  }

  return v4;
}

- (id)nodeIdentifiersOfEdgesForIdentifiers:(id)a3 edgeDirection:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v9 = 0;
  id v5 = [(KGGraphImplementation *)implementation nodeIdentifiersOfEdgesWithIdentifiers:a3 edgeDirection:a4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = KGLoggingConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1D1654000, v7, OS_LOG_TYPE_ERROR, "Error fetching nodes of edges with error(%@)", buf, 0xCu);
    }

    id v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)_nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  implementation = self->_implementation;
  id v9 = 0;
  id v5 = [(KGGraphImplementation *)implementation nodeIdentifiersMatchingFilter:a3 intersectingIdentifiers:a4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = KGLoggingConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1D1654000, v7, OS_LOG_TYPE_ERROR, "Error fetching node identifiers with error(%@)", buf, 0xCu);
    }

    id v5 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v5;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3
{
  return [(KGGraph *)self _nodeIdentifiersMatchingFilter:a3 intersectingIdentifiers:0];
}

- (id)edgesForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(KGElementCollection *)[KGEdgeCollection alloc] initWithIdentifiers:v4 graph:self];

  return v5;
}

- (id)nodesForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(KGElementCollection *)[KGNodeCollection alloc] initWithIdentifiers:v4 graph:self];

  return v5;
}

- (id)edgeForIdentifier:(unint64_t)a3
{
  id v4 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a3];
  id v5 = [(KGGraph *)self edgesForIdentifiers:v4];
  id v6 = [v5 anyObject];

  return v6;
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  id v4 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a3];
  id v5 = [(KGGraph *)self nodesForIdentifiers:v4];
  id v6 = [v5 anyObject];

  return v6;
}

- (BOOL)noFatalError
{
  return [(KGGraphImplementation *)self->_implementation noFatalError];
}

- (NSUUID)graphIdentifier
{
  return (NSUUID *)[(KGGraphImplementation *)self->_implementation graphIdentifier];
}

- (KGGraph)initWithImplementation:(id)a3 entityFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGGraph;
  id v9 = [(KGGraph *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeStrong((id *)&v10->_entityFactory, a4);
  }

  return v10;
}

@end