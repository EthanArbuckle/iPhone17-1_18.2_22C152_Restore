@interface MANodeFilterRelation
+ (id)scanRelationWithScanner:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MANodeFilter)nodeFilter;
- (MANodeFilterRelation)initWithNodeFilter:(id)a3;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)visualString;
- (unint64_t)hash;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MANodeFilterRelation

- (void).cxx_destruct
{
}

- (MANodeFilter)nodeFilter
{
  return self->_nodeFilter;
}

- (unint64_t)hash
{
  return [(MAElementFilter *)self->_nodeFilter hash];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (MANodeFilterRelation *)a3;
  if (v5 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = v6;
      nodeFilter = self->_nodeFilter;
      v9 = nodeFilter;
      if (!nodeFilter)
      {
        v3 = [(MANodeFilterRelation *)v6 nodeFilter];
        if (!v3)
        {
          char v11 = 1;
          goto LABEL_11;
        }
        v9 = self->_nodeFilter;
      }
      v10 = [(MANodeFilterRelation *)v7 nodeFilter];
      char v11 = [(MAElementFilter *)v9 isEqual:v10];

      if (nodeFilter)
      {
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:

      goto LABEL_12;
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (id)visualString
{
  return [(MAElementFilter *)self->_nodeFilter visualString];
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6 = a3;
  v7 = [a4 graphReference];
  v8 = [v7 concreteGraph];
  nodeFilter = self->_nodeFilter;
  v10 = [v6 targets];
  char v11 = [v8 nodeIdentifiersMatchingFilter:nodeFilter intersectingIdentifiers:v10];

  v12 = [v6 intersectingTargetsWith:v11];

  return v12;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6 = a3;
  v7 = [a4 graphReference];
  v8 = [v7 concreteGraph];
  v9 = [v8 nodeIdentifiersMatchingFilter:self->_nodeFilter intersectingIdentifiers:v6];

  v10 = +[KGDirectedBinaryAdjacency identityWith:v9];

  return v10;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = [a5 graphReference];
  v10 = [v12 concreteGraph];
  char v11 = [v10 nodeIdentifiersMatchingFilter:self->_nodeFilter intersectingIdentifiers:v9];

  [v8 unionWithIdentifierSet:v11];
}

- (MANodeFilterRelation)initWithNodeFilter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MANodeFilterRelation;
  id v6 = [(MARelation *)&v9 initForSubclassing];
  v7 = (MANodeFilterRelation *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scanLocation];
  id v5 = +[MAElementFilter scanFilterWithScanner:v3];
  if (v5)
  {
    id v6 = [[MANodeFilterRelation alloc] initWithNodeFilter:v5];
  }
  else
  {
    [v3 setScanLocation:v4];
    id v6 = 0;
  }

  return v6;
}

@end