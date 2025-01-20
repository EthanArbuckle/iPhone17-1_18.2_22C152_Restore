@interface MANeighborRelation
+ (id)scanRelationWithScanner:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MAEdgeFilter)edgeFilter;
- (MANeighborRelation)initWithEdgeType:(unint64_t)a3 edgeFilter:(id)a4;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4;
- (id)adjacencyWithEndNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)inverse;
- (id)transitiveClosure;
- (id)visualString;
- (unint64_t)edgeType;
- (unint64_t)hash;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MANeighborRelation

- (void).cxx_destruct
{
}

- (MAEdgeFilter)edgeFilter
{
  return self->_edgeFilter;
}

- (unint64_t)edgeType
{
  return self->_edgeType;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_edgeType + 2654435769u;
  return ((v2 << 6) + (v2 >> 2) + [(MAElementFilter *)self->_edgeFilter hash] + 2654435769u) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MANeighborRelation *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      edgeType = (void *)self->_edgeType;
      if (edgeType == (void *)[(MANeighborRelation *)v5 edgeType])
      {
        edgeFilter = self->_edgeFilter;
        v8 = edgeFilter;
        if (!edgeFilter)
        {
          edgeType = [(MANeighborRelation *)v5 edgeFilter];
          if (!edgeType)
          {
            char v10 = 1;
LABEL_14:

            goto LABEL_15;
          }
          v8 = self->_edgeFilter;
        }
        v9 = [(MANeighborRelation *)v5 edgeFilter];
        char v10 = [(MAElementFilter *)v8 isEqual:v9];

        if (!edgeFilter) {
          goto LABEL_14;
        }
      }
      else
      {
        char v10 = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
    char v10 = 0;
  }
LABEL_16:

  return v10;
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scanLocation];
  int v5 = [v3 scanString:@"<" intoString:0];
  if ([v3 scanString:@"-" intoString:0])
  {
    v6 = +[MAElementFilter scanFilterWithScanner:v3];
    if (v6
      && ([v3 scanString:@"-" intoString:0] & 1) != 0
      && (int v7 = [v3 scanString:@">" intoString:0], (v5 & v7) != 1))
    {
      uint64_t v10 = 2;
      if (!v7) {
        uint64_t v10 = 3;
      }
      if (v5) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      v8 = [[MANeighborRelation alloc] initWithEdgeType:v11 edgeFilter:v6];
    }
    else
    {
      [v3 setScanLocation:v4];
      v8 = 0;
    }
  }
  else
  {
    [v3 setScanLocation:v4];
    v8 = 0;
  }

  return v8;
}

- (id)visualString
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = v3;
  if (self->_edgeType == 1) {
    [v3 appendString:@"<"];
  }
  [v4 appendString:@"-"];
  [(MAEdgeFilter *)self->_edgeFilter appendVisualStringToString:v4];
  [v4 appendString:@"-"];
  if (self->_edgeType == 2) {
    [v4 appendString:@">"];
  }
  return v4;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MANeighborRelation *)self inverse];
  v9 = [v7 targets];
  uint64_t v10 = [v8 adjacencyWithEndNodeIdentifiers:v9 graph:v6];

  uint64_t v11 = [v7 joinOnTargetsOfAdjacency:v10];

  return v11;
}

- (id)adjacencyWithEndNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6 = a3;
  id v7 = [a4 graphReference];
  v8 = [v7 concreteGraph];
  v9 = [v8 adjacencyWithEndNodeIdentifiers:v6 edgeFilter:self->_edgeFilter edgeType:self->_edgeType];

  return v9;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6 = a3;
  id v7 = [a4 graphReference];
  v8 = [v7 concreteGraph];
  v9 = [v8 adjacencyWithStartNodeIdentifiers:v6 edgeFilter:self->_edgeFilter edgeType:self->_edgeType];

  return v9;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = [a5 graphReference];
  uint64_t v10 = [v12 concreteGraph];
  uint64_t v11 = [v10 neighborNodeIdentifiersWithStartNodeIdentifiers:v9 edgeType:self->_edgeType edgeFilter:self->_edgeFilter];

  [v8 unionWithIdentifierSet:v11];
}

- (id)transitiveClosure
{
  id v3 = [MATransitiveClosureRelation alloc];
  uint64_t v4 = [[MATransitiveNeighborRelation alloc] initWithNeighborRelation:self];
  int v5 = [(MATransitiveClosureRelation *)v3 initWithBase:v4];

  return v5;
}

- (id)inverse
{
  unint64_t v2 = self->_edgeType - 1;
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1D17CE7C0[v2];
  }
  uint64_t v4 = [[MANeighborRelation alloc] initWithEdgeType:v3 edgeFilter:self->_edgeFilter];
  return v4;
}

- (MANeighborRelation)initWithEdgeType:(unint64_t)a3 edgeFilter:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MANeighborRelation;
  id v8 = [(MARelation *)&v11 initForSubclassing];
  id v9 = v8;
  if (v8)
  {
    v8->_edgeType = a3;
    objc_storeStrong((id *)&v8->_edgeFilter, a4);
  }

  return v9;
}

@end