@interface KGNodeFilterRelation
- (KGNodeFilter)nodeFilter;
- (KGNodeFilterRelation)initWithNodeFilter:(id)a3;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4;
- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4;
@end

@implementation KGNodeFilterRelation

- (void).cxx_destruct
{
}

- (KGNodeFilter)nodeFilter
{
  return self->_nodeFilter;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4
{
  nodeFilter = self->_nodeFilter;
  id v6 = a3;
  v7 = [a4 nodeIdentifiersMatchingFilter:nodeFilter];
  v8 = [v6 intersectingTargetsWith:v7];

  return v8;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  v4 = [a4 nodeIdentifiersMatchingFilter:self->_nodeFilter];
  v5 = +[KGDirectedBinaryAdjacency identityWith:v4];

  return v5;
}

- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  return (id)[a4 nodeIdentifiersMatchingFilter:self->_nodeFilter];
}

- (KGNodeFilterRelation)initWithNodeFilter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGNodeFilterRelation;
  id v6 = [(KGNodeFilterRelation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nodeFilter, a3);
  }

  return v7;
}

@end