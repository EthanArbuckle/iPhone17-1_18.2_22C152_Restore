@interface MABinaryAdjacency
+ (id)adjacencyWithSources:(id)a3 relation:(id)a4 targetsClass:(Class)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAdjacency:(id)a3;
- (Class)sourcesClass;
- (Class)targetsClass;
- (KGDirectedBinaryAdjacency)adjacency;
- (MABinaryAdjacency)initWithAdjacency:(id)a3 graph:(id)a4 sourcesClass:(Class)a5 targetsClass:(Class)a6;
- (MABinaryAdjacency)initWithAdjacency:(id)a3 graphReference:(id)a4 sourcesClass:(Class)a5 targetsClass:(Class)a6;
- (MAGraphReference)graphReference;
- (MANodeCollection)sources;
- (MANodeCollection)targets;
- (id)differenceWith:(id)a3;
- (id)intersectingSourcesWith:(id)a3;
- (id)intersectingTargetsWith:(id)a3;
- (id)subtractingSourcesWith:(id)a3;
- (id)subtractingTargetsWith:(id)a3;
- (id)targetsForSourceIdentifier:(unint64_t)a3;
- (id)targetsForSources:(id)a3;
- (id)targetsWithMinimumCount:(unint64_t)a3;
- (id)transposed;
- (unint64_t)hash;
- (unint64_t)sourcesCount;
- (void)enumerateTargetsBySourceWithBlock:(id)a3;
@end

@implementation MABinaryAdjacency

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsClass, 0);
  objc_storeStrong((id *)&self->_sourcesClass, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
  objc_storeStrong((id *)&self->_adjacency, 0);
}

- (Class)targetsClass
{
  return self->_targetsClass;
}

- (Class)sourcesClass
{
  return self->_sourcesClass;
}

- (MAGraphReference)graphReference
{
  return self->_graphReference;
}

- (KGDirectedBinaryAdjacency)adjacency
{
  return self->_adjacency;
}

- (unint64_t)hash
{
  return [(KGDirectedBinaryAdjacency *)self->_adjacency hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MABinaryAdjacency *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && [(MABinaryAdjacency *)self isEqualToAdjacency:v4];
  }

  return v7;
}

- (BOOL)isEqualToAdjacency:(id)a3
{
  return (MAGraphReference *)*((void *)a3 + 2) == self->_graphReference
      && [(KGDirectedBinaryAdjacency *)self->_adjacency isEqual:*((void *)a3 + 1)];
}

- (id)subtractingSourcesWith:(id)a3
{
  id v4 = a3;
  v5 = [(MABinaryAdjacency *)self adjacency];
  v6 = [v4 elementIdentifiers];

  BOOL v7 = [v5 subtractingSourcesWith:v6];

  v8 = [[MABinaryAdjacency alloc] initWithAdjacency:v7 graphReference:self->_graphReference sourcesClass:self->_sourcesClass targetsClass:self->_targetsClass];
  return v8;
}

- (id)subtractingTargetsWith:(id)a3
{
  id v4 = a3;
  v5 = [(MABinaryAdjacency *)self adjacency];
  v6 = [v4 elementIdentifiers];

  BOOL v7 = [v5 subtractingTargetsWith:v6];

  v8 = [[MABinaryAdjacency alloc] initWithAdjacency:v7 graphReference:self->_graphReference sourcesClass:self->_sourcesClass targetsClass:self->_targetsClass];
  return v8;
}

- (id)intersectingSourcesWith:(id)a3
{
  id v4 = a3;
  v5 = [(MABinaryAdjacency *)self adjacency];
  v6 = [v4 elementIdentifiers];

  BOOL v7 = [v5 intersectingSourcesWith:v6];

  v8 = [[MABinaryAdjacency alloc] initWithAdjacency:v7 graphReference:self->_graphReference sourcesClass:self->_sourcesClass targetsClass:self->_targetsClass];
  return v8;
}

- (id)intersectingTargetsWith:(id)a3
{
  id v4 = a3;
  v5 = [(MABinaryAdjacency *)self adjacency];
  v6 = [v4 elementIdentifiers];

  BOOL v7 = [v5 intersectingTargetsWith:v6];

  v8 = [[MABinaryAdjacency alloc] initWithAdjacency:v7 graphReference:self->_graphReference sourcesClass:self->_sourcesClass targetsClass:self->_targetsClass];
  return v8;
}

- (id)differenceWith:(id)a3
{
  id v4 = a3;
  v5 = [(MABinaryAdjacency *)self adjacency];
  v6 = [v4 adjacency];

  BOOL v7 = [v5 differenceWith:v6];

  v8 = [[MABinaryAdjacency alloc] initWithAdjacency:v7 graphReference:self->_graphReference sourcesClass:self->_sourcesClass targetsClass:self->_targetsClass];
  return v8;
}

- (id)transposed
{
  v3 = [(MABinaryAdjacency *)self adjacency];
  id v4 = [v3 transposed];

  v5 = [[MABinaryAdjacency alloc] initWithAdjacency:v4 graphReference:self->_graphReference sourcesClass:self->_targetsClass targetsClass:self->_sourcesClass];
  return v5;
}

- (id)targetsWithMinimumCount:(unint64_t)a3
{
  id v5 = objc_alloc(self->_targetsClass);
  graphReference = self->_graphReference;
  BOOL v7 = [(KGDirectedBinaryAdjacency *)self->_adjacency targetsWithMinimumCount:a3];
  v8 = (void *)[v5 initWithGraphReference:graphReference elementIdentifiers:v7];

  return v8;
}

- (id)targetsForSourceIdentifier:(unint64_t)a3
{
  id v5 = objc_alloc(self->_targetsClass);
  graphReference = self->_graphReference;
  BOOL v7 = [(KGDirectedBinaryAdjacency *)self->_adjacency targetsForSourceIdentifier:a3];
  v8 = (void *)[v5 initWithGraphReference:graphReference elementIdentifiers:v7];

  return v8;
}

- (id)targetsForSources:(id)a3
{
  targetsClass = self->_targetsClass;
  id v5 = a3;
  id v6 = [targetsClass alloc];
  p_adjacency = &self->_adjacency;
  adjacency = self->_adjacency;
  v8 = p_adjacency[1];
  v10 = [v5 elementIdentifiers];

  v11 = [(KGDirectedBinaryAdjacency *)adjacency targetsForSources:v10];
  v12 = (void *)[v6 initWithGraphReference:v8 elementIdentifiers:v11];

  return v12;
}

- (void)enumerateTargetsBySourceWithBlock:(id)a3
{
  id v4 = a3;
  adjacency = self->_adjacency;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MABinaryAdjacency_enumerateTargetsBySourceWithBlock___block_invoke;
  v7[3] = &unk_1E68DC7C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(KGDirectedBinaryAdjacency *)adjacency enumerateTargetsBySourceWith:v7];
}

void __55__MABinaryAdjacency_enumerateTargetsBySourceWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = (void *)MEMORY[0x1D25FA040]();
  id v6 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  BOOL v7 = (void *)[objc_alloc(*(Class *)(*(void *)(a1 + 32) + 24)) initWithGraphReference:*(void *)(*(void *)(a1 + 32) + 16) elementIdentifiers:v6];
  id v8 = (void *)[objc_alloc(*(Class *)(*(void *)(a1 + 32) + 32)) initWithGraphReference:*(void *)(*(void *)(a1 + 32) + 16) elementIdentifiers:v9];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)sourcesCount
{
  return [(KGDirectedBinaryAdjacency *)self->_adjacency sourcesCount];
}

- (MANodeCollection)targets
{
  id v3 = objc_alloc(self->_targetsClass);
  graphReference = self->_graphReference;
  id v5 = [(KGDirectedBinaryAdjacency *)self->_adjacency targets];
  id v6 = (void *)[v3 initWithGraphReference:graphReference elementIdentifiers:v5];

  return (MANodeCollection *)v6;
}

- (MANodeCollection)sources
{
  id v3 = objc_alloc(self->_sourcesClass);
  graphReference = self->_graphReference;
  id v5 = [(KGDirectedBinaryAdjacency *)self->_adjacency sources];
  id v6 = (void *)[v3 initWithGraphReference:graphReference elementIdentifiers:v5];

  return (MANodeCollection *)v6;
}

- (MABinaryAdjacency)initWithAdjacency:(id)a3 graph:(id)a4 sourcesClass:(Class)a5 targetsClass:(Class)a6
{
  id v10 = a3;
  v11 = [a4 graphReference];
  v12 = [(MABinaryAdjacency *)self initWithAdjacency:v10 graphReference:v11 sourcesClass:a5 targetsClass:a6];

  return v12;
}

- (MABinaryAdjacency)initWithAdjacency:(id)a3 graphReference:(id)a4 sourcesClass:(Class)a5 targetsClass:(Class)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MABinaryAdjacency;
  v13 = [(MABinaryAdjacency *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adjacency, a3);
    objc_storeStrong((id *)&v14->_graphReference, a4);
    objc_storeStrong((id *)&v14->_sourcesClass, a5);
    objc_storeStrong((id *)&v14->_targetsClass, a6);
  }

  return v14;
}

+ (id)adjacencyWithSources:(id)a3 relation:(id)a4 targetsClass:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 graphReference];
  id v11 = [v10 concreteGraph];
  id v12 = [v9 elementIdentifiers];
  v13 = [v11 adjacencyWithSources:v12 relation:v8];

  id v14 = objc_alloc((Class)a1);
  uint64_t v15 = objc_opt_class();

  objc_super v16 = (void *)[v14 initWithAdjacency:v13 graphReference:v10 sourcesClass:v15 targetsClass:a5];
  return v16;
}

@end