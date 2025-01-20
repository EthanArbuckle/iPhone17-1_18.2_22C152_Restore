@interface KGGraphChangeRequest
- (KGGraphChangeRequest)init;
- (KGMutableElementIdentifierSet)edgeIdentifiersToRemove;
- (KGMutableElementIdentifierSet)nodeIdentifiersToRemove;
- (NSMutableArray)edgeUpdates;
- (NSMutableArray)edgesToInsert;
- (NSMutableArray)nodeUpdates;
- (NSMutableArray)nodesToInsert;
- (unint64_t)count;
- (void)insertEdge:(id)a3;
- (void)insertNode:(id)a3;
- (void)removeEdge:(id)a3;
- (void)removeEdgesForIdentifiers:(id)a3;
- (void)removeNode:(id)a3;
- (void)removeNodesForIdentifiers:(id)a3;
- (void)setEdgeIdentifiersToRemove:(id)a3;
- (void)setEdgeUpdates:(id)a3;
- (void)setEdgesToInsert:(id)a3;
- (void)setNodeIdentifiersToRemove:(id)a3;
- (void)setNodeUpdates:(id)a3;
- (void)setNodesToInsert:(id)a3;
- (void)setResolved;
- (void)updateEdge:(id)a3 newProperties:(id)a4;
- (void)updateNode:(id)a3 newProperties:(id)a4;
@end

@implementation KGGraphChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_edgeUpdates, 0);
  objc_storeStrong((id *)&self->_nodeUpdates, 0);
  objc_storeStrong((id *)&self->_edgesToInsert, 0);
  objc_storeStrong((id *)&self->_nodesToInsert, 0);
}

- (void)setEdgeIdentifiersToRemove:(id)a3
{
}

- (KGMutableElementIdentifierSet)edgeIdentifiersToRemove
{
  return self->_edgeIdentifiersToRemove;
}

- (void)setNodeIdentifiersToRemove:(id)a3
{
}

- (KGMutableElementIdentifierSet)nodeIdentifiersToRemove
{
  return self->_nodeIdentifiersToRemove;
}

- (void)setEdgeUpdates:(id)a3
{
}

- (NSMutableArray)edgeUpdates
{
  return self->_edgeUpdates;
}

- (void)setNodeUpdates:(id)a3
{
}

- (NSMutableArray)nodeUpdates
{
  return self->_nodeUpdates;
}

- (void)setEdgesToInsert:(id)a3
{
}

- (NSMutableArray)edgesToInsert
{
  return self->_edgesToInsert;
}

- (void)setNodesToInsert:(id)a3
{
}

- (NSMutableArray)nodesToInsert
{
  return self->_nodesToInsert;
}

- (void)removeEdgesForIdentifiers:(id)a3
{
}

- (void)removeEdge:(id)a3
{
  edgeIdentifiersToRemove = self->_edgeIdentifiersToRemove;
  uint64_t v4 = [a3 identifier];
  [(KGMutableElementIdentifierSet *)edgeIdentifiersToRemove addIdentifier:v4];
}

- (void)updateEdge:(id)a3 newProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[KGEdgeChangeRequest alloc] initWithEdge:v7 properties:v6];

  [(NSMutableArray *)self->_edgeUpdates addObject:v8];
}

- (void)insertEdge:(id)a3
{
}

- (void)removeNodesForIdentifiers:(id)a3
{
}

- (void)removeNode:(id)a3
{
  nodeIdentifiersToRemove = self->_nodeIdentifiersToRemove;
  uint64_t v4 = [a3 identifier];
  [(KGMutableElementIdentifierSet *)nodeIdentifiersToRemove addIdentifier:v4];
}

- (void)updateNode:(id)a3 newProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[KGNodeChangeRequest alloc] initWithNode:v7 properties:v6];

  [(NSMutableArray *)self->_nodeUpdates addObject:v8];
}

- (void)insertNode:(id)a3
{
}

- (void)setResolved
{
  [(NSMutableArray *)self->_nodesToInsert removeAllObjects];
  [(NSMutableArray *)self->_edgesToInsert removeAllObjects];
  [(NSMutableArray *)self->_nodeUpdates removeAllObjects];
  [(NSMutableArray *)self->_edgeUpdates removeAllObjects];
  [(KGMutableElementIdentifierSet *)self->_nodeIdentifiersToRemove removeAllIdentifiers];
  edgeIdentifiersToRemove = self->_edgeIdentifiersToRemove;
  [(KGMutableElementIdentifierSet *)edgeIdentifiersToRemove removeAllIdentifiers];
}

- (unint64_t)count
{
  uint64_t v3 = [(NSMutableArray *)self->_nodesToInsert count];
  uint64_t v4 = [(NSMutableArray *)self->_edgesToInsert count] + v3;
  uint64_t v5 = [(NSMutableArray *)self->_nodeUpdates count];
  uint64_t v6 = v4 + v5 + [(NSMutableArray *)self->_edgeUpdates count];
  unint64_t v7 = [(KGElementIdentifierSet *)self->_nodeIdentifiersToRemove count];
  return v6 + v7 + [(KGElementIdentifierSet *)self->_edgeIdentifiersToRemove count];
}

- (KGGraphChangeRequest)init
{
  v16.receiver = self;
  v16.super_class = (Class)KGGraphChangeRequest;
  v2 = [(KGGraphChangeRequest *)&v16 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nodesToInsert = v2->_nodesToInsert;
    v2->_nodesToInsert = v3;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    edgesToInsert = v2->_edgesToInsert;
    v2->_edgesToInsert = v5;

    unint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nodeUpdates = v2->_nodeUpdates;
    v2->_nodeUpdates = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    edgeUpdates = v2->_edgeUpdates;
    v2->_edgeUpdates = v9;

    v11 = objc_alloc_init(KGMutableElementIdentifierSet);
    nodeIdentifiersToRemove = v2->_nodeIdentifiersToRemove;
    v2->_nodeIdentifiersToRemove = v11;

    v13 = objc_alloc_init(KGMutableElementIdentifierSet);
    edgeIdentifiersToRemove = v2->_edgeIdentifiersToRemove;
    v2->_edgeIdentifiersToRemove = v13;
  }
  return v2;
}

@end