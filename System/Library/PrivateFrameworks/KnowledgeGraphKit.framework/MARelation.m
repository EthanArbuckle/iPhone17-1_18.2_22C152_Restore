@interface MARelation
+ (MARelation)relationWithVisualString:(id)a3;
+ (id)_scanNonChainRelationWithScanner:(id)a3;
+ (id)chain:(id)a3;
+ (id)scanRelationWithScanner:(id)a3;
+ (id)union:(id)a3;
- (BOOL)isTransitive;
- (MARelation)excludeSource;
- (MARelation)inverse;
- (MARelation)optionalStep;
- (MARelation)transitiveClosure;
- (NSString)visualString;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)initForSubclassing;
- (id)repeatWithCount:(unint64_t)a3;
- (id)repeatWithMinCount:(unint64_t)a3 maxCount:(unint64_t)a4;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MARelation

- (id)repeatWithMinCount:(unint64_t)a3 maxCount:(unint64_t)a4
{
  v4 = [[MAMultiStepRelation alloc] initWithBase:self minNumberOfSteps:a3 maxNumberOfSteps:a4];
  return v4;
}

- (id)repeatWithCount:(unint64_t)a3
{
  v3 = [[MAMultiStepRelation alloc] initWithBase:self numberOfSteps:a3];
  return v3;
}

- (MARelation)inverse
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (MARelation)excludeSource
{
  id v2 = [[MAExcludeSourceRelation alloc] initWithBase:self];
  return (MARelation *)v2;
}

- (MARelation)optionalStep
{
  id v2 = [[MAOptionalStepRelation alloc] initWithBase:self];
  return (MARelation *)v2;
}

- (MARelation)transitiveClosure
{
  id v2 = [[MATransitiveClosureRelation alloc] initWithBase:self];
  return (MARelation *)v2;
}

- (NSString)visualString
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  KGAbstractMethodException(self, a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (BOOL)isTransitive
{
  return 0;
}

- (id)initForSubclassing
{
  v3.receiver = self;
  v3.super_class = (Class)MARelation;
  return [(MARelation *)&v3 init];
}

+ (id)union:(id)a3
{
  id v3 = a3;
  v4 = [[MAUnionRelation alloc] initWithRelations:v3];

  return v4;
}

+ (id)chain:(id)a3
{
  id v3 = a3;
  v4 = [[MAChainRelation alloc] initWithSteps:v3];

  return v4;
}

+ (MARelation)relationWithVisualString:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:v5];

  id v7 = [a1 scanRelationWithScanner:v6];
  if ([v6 isAtEnd]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return (MARelation *)v8;
}

+ (id)scanRelationWithScanner:(id)a3
{
  return +[MAChainRelation scanRelationWithScanner:a3];
}

+ (id)_scanNonChainRelationWithScanner:(id)a3
{
  id v3 = a3;
  v4 = +[MANeighborRelation scanRelationWithScanner:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = +[MANodeFilterRelation scanRelationWithScanner:v3];
    id v8 = v7;
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      id v9 = +[MAMultiStepRelation scanRelationWithScanner:v3];
      id v10 = v9;
      if (v9)
      {
        id v6 = v9;
      }
      else
      {
        id v11 = +[MATransitiveClosureRelation scanRelationWithScanner:v3];
        id v12 = v11;
        if (v11)
        {
          id v6 = v11;
        }
        else
        {
          v13 = +[MAOptionalStepRelation scanRelationWithScanner:v3];
          v14 = v13;
          if (v13)
          {
            id v6 = v13;
          }
          else
          {
            v15 = +[MAExcludeSourceRelation scanRelationWithScanner:v3];
            v16 = v15;
            if (v15)
            {
              id v17 = v15;
            }
            else
            {
              id v17 = +[MAUnionRelation scanRelationWithScanner:v3];
            }
            id v6 = v17;
          }
        }
      }
    }
  }
  return v6;
}

@end