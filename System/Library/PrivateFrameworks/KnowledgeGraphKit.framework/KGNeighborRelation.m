@interface KGNeighborRelation
- (KGEdgeFilter)edgeFilter;
- (KGNeighborRelation)initWithEdgeFilter:(id)a3 edgeDirection:(unint64_t)a4;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4;
- (id)inverse;
- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4;
- (unint64_t)edgeDirection;
@end

@implementation KGNeighborRelation

- (void).cxx_destruct
{
}

- (unint64_t)edgeDirection
{
  return self->_edgeDirection;
}

- (KGEdgeFilter)edgeFilter
{
  return self->_edgeFilter;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 targets];
  unint64_t v9 = self->_edgeDirection - 1;
  if (v9 > 2) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_1D17CE7C0[v9];
  }
  v11 = [v6 adjacencyWithTargetNodeIdentifiers:v8 edgeFilter:self->_edgeFilter edgeDirection:v10];

  v12 = [v7 joinOnTargetsOfAdjacency:v11];

  return v12;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  return (id)[a4 adjacencyWithSourceNodeIdentifiers:a3 edgeFilter:self->_edgeFilter edgeDirection:self->_edgeDirection];
}

- (id)inverse
{
  v3 = [KGNeighborRelation alloc];
  unint64_t v4 = self->_edgeDirection - 1;
  if (v4 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1D17CE7C0[v4];
  }
  id v6 = [(KGNeighborRelation *)v3 initWithEdgeFilter:self->_edgeFilter edgeDirection:v5];
  return v6;
}

- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  return (id)[a4 neighborNodeIdentifiersWithStartNodeIdentifiers:a3 edgeDirection:self->_edgeDirection edgeFilter:self->_edgeFilter];
}

- (KGNeighborRelation)initWithEdgeFilter:(id)a3 edgeDirection:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KGNeighborRelation;
  v8 = [(KGNeighborRelation *)&v11 init];
  unint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_edgeFilter, a3);
    v9->_edgeDirection = a4;
  }

  return v9;
}

@end