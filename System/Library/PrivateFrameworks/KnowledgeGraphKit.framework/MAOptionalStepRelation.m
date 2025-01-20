@interface MAOptionalStepRelation
+ (id)scanRelationWithScanner:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MAOptionalStepRelation)initWithBase:(id)a3;
- (MARelation)base;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)inverse;
- (id)transitiveClosure;
- (id)visualString;
- (unint64_t)hash;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MAOptionalStepRelation

- (void).cxx_destruct
{
}

- (MARelation)base
{
  return self->_base;
}

- (unint64_t)hash
{
  return [(MARelation *)self->_base hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MAOptionalStepRelation *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      base = self->_base;
      v8 = [(MAOptionalStepRelation *)v4 base];
      char v6 = [(MARelation *)base isEqual:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)transitiveClosure
{
  v2 = [(MARelation *)self->_base transitiveClosure];
  v3 = [v2 optionalStep];

  return v3;
}

- (id)visualString
{
  v3 = (void *)[@"-{" mutableCopy];
  v4 = [(MARelation *)self->_base visualString];
  [v3 appendString:v4];

  [v3 appendString:@"}?"];
  return v3;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  base = self->_base;
  id v6 = a3;
  v7 = [(MARelation *)base adjacencyByJoiningWithAdjacency:v6 graph:a4];
  v8 = (void *)[v7 mutableCopy];

  [v8 formUnionWith:v6];
  return v8;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  base = self->_base;
  id v6 = a3;
  v7 = [(MARelation *)base adjacencyWithStartNodeIdentifiers:v6 graph:a4];
  v8 = (void *)[v7 mutableCopy];

  v9 = +[KGDirectedBinaryAdjacency identityWith:v6];

  [v8 formUnionWith:v9];
  return v8;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v9 unionWithIdentifierSet:v10];
  [(MARelation *)self->_base unionAdjacencySetFromSourceNodeIdentifiers:v10 toTargetNodeIdentifiers:v9 graph:v8];
}

- (id)inverse
{
  v2 = [(MARelation *)self->_base inverse];
  v3 = [v2 optionalStep];

  return v3;
}

- (MAOptionalStepRelation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAOptionalStepRelation;
  id v6 = [(MARelation *)&v9 initForSubclassing];
  v7 = (MAOptionalStepRelation *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scanLocation];
  if ([v3 scanString:@"-{" intoString:0])
  {
    id v5 = +[MARelation scanRelationWithScanner:v3];
    if (v5 && ([v3 scanString:@"}?" intoString:0] & 1) != 0)
    {
      id v6 = [[MAOptionalStepRelation alloc] initWithBase:v5];
    }
    else
    {
      [v3 setScanLocation:v4];
      id v6 = 0;
    }
  }
  else
  {
    [v3 setScanLocation:v4];
    id v6 = 0;
  }

  return v6;
}

@end