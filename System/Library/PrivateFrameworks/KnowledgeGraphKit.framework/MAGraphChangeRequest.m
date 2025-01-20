@interface MAGraphChangeRequest
- (KGMutableElementIdentifierSet)edgeIdentifiersToRemove;
- (KGMutableElementIdentifierSet)nodeIdentifiersToRemove;
- (MAGraphChangeRequest)init;
- (NSMutableArray)edgesToInsert;
- (NSMutableArray)nodesToInsert;
- (unint64_t)numberOfChanges;
- (void)addEdge:(id)a3;
- (void)addNode:(id)a3;
- (void)removeEdge:(id)a3;
- (void)removeEdges:(id)a3;
- (void)removeEdgesForIdentifier:(unint64_t)a3;
- (void)removeEdgesForIdentifiers:(id)a3;
- (void)removeNode:(id)a3;
- (void)removeNodeForIdentifier:(unint64_t)a3;
- (void)removeNodes:(id)a3;
- (void)removeNodesForIdentifiers:(id)a3;
- (void)setEdgeIdentifiersToRemove:(id)a3;
- (void)setEdgesToInsert:(id)a3;
- (void)setNodeIdentifiersToRemove:(id)a3;
- (void)setNodesToInsert:(id)a3;
@end

@implementation MAGraphChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersToRemove, 0);
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

- (void)removeEdgesForIdentifier:(unint64_t)a3
{
}

- (void)removeEdges:(id)a3
{
  edgeIdentifiersToRemove = self->_edgeIdentifiersToRemove;
  id v4 = [a3 elementIdentifiers];
  [(KGMutableElementIdentifierSet *)edgeIdentifiersToRemove unionWithIdentifierSet:v4];
}

- (void)removeEdge:(id)a3
{
  edgeIdentifiersToRemove = self->_edgeIdentifiersToRemove;
  uint64_t v4 = [a3 identifier];
  [(KGMutableElementIdentifierSet *)edgeIdentifiersToRemove addIdentifier:v4];
}

- (void)addEdge:(id)a3
{
}

- (void)removeNodesForIdentifiers:(id)a3
{
}

- (void)removeNodeForIdentifier:(unint64_t)a3
{
}

- (void)removeNodes:(id)a3
{
  nodeIdentifiersToRemove = self->_nodeIdentifiersToRemove;
  id v4 = [a3 elementIdentifiers];
  [(KGMutableElementIdentifierSet *)nodeIdentifiersToRemove unionWithIdentifierSet:v4];
}

- (void)removeNode:(id)a3
{
  nodeIdentifiersToRemove = self->_nodeIdentifiersToRemove;
  uint64_t v4 = [a3 identifier];
  [(KGMutableElementIdentifierSet *)nodeIdentifiersToRemove addIdentifier:v4];
}

- (void)addNode:(id)a3
{
}

- (unint64_t)numberOfChanges
{
  uint64_t v3 = [(NSMutableArray *)self->_nodesToInsert count];
  uint64_t v4 = [(NSMutableArray *)self->_edgesToInsert count] + v3;
  unint64_t v5 = [(KGElementIdentifierSet *)self->_nodeIdentifiersToRemove count];
  return v4 + v5 + [(KGElementIdentifierSet *)self->_edgeIdentifiersToRemove count];
}

- (MAGraphChangeRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)MAGraphChangeRequest;
  v2 = [(MAGraphChangeRequest *)&v12 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nodesToInsert = v2->_nodesToInsert;
    v2->_nodesToInsert = v3;

    unint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    edgesToInsert = v2->_edgesToInsert;
    v2->_edgesToInsert = v5;

    v7 = objc_alloc_init(KGMutableElementIdentifierSet);
    nodeIdentifiersToRemove = v2->_nodeIdentifiersToRemove;
    v2->_nodeIdentifiersToRemove = v7;

    v9 = objc_alloc_init(KGMutableElementIdentifierSet);
    edgeIdentifiersToRemove = v2->_edgeIdentifiersToRemove;
    v2->_edgeIdentifiersToRemove = v9;
  }
  return v2;
}

@end