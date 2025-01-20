@interface MATransitiveNeighborRelation
- (BOOL)isTransitive;
- (MATransitiveNeighborRelation)initWithEdgeType:(unint64_t)a3 edgeFilter:(id)a4;
- (MATransitiveNeighborRelation)initWithNeighborRelation:(id)a3;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MATransitiveNeighborRelation

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v14 = [a5 graphReference];
  v10 = [v14 concreteGraph];
  unint64_t v11 = [(MANeighborRelation *)self edgeType];
  v12 = [(MANeighborRelation *)self edgeFilter];
  v13 = [v10 transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:v9 edgeType:v11 edgeFilter:v12];

  [v8 unionWithIdentifierSet:v13];
}

- (BOOL)isTransitive
{
  return 1;
}

- (MATransitiveNeighborRelation)initWithNeighborRelation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 edgeType];
  v6 = [v4 edgeFilter];

  v7 = [(MATransitiveNeighborRelation *)self initWithEdgeType:v5 edgeFilter:v6];
  return v7;
}

- (MATransitiveNeighborRelation)initWithEdgeType:(unint64_t)a3 edgeFilter:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MATransitiveNeighborRelation;
  return [(MANeighborRelation *)&v5 initWithEdgeType:a3 edgeFilter:a4];
}

@end