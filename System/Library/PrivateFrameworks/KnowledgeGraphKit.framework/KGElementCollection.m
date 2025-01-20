@interface KGElementCollection
- (BOOL)containsCollection:(id)a3;
- (BOOL)intersectsCollection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCollection:(id)a3;
- (BOOL)isSubsetOfCollection:(id)a3;
- (KGElement)anyObject;
- (KGElementCollection)initWithIdentifiers:(id)a3 graph:(id)a4;
- (KGElementIdentifierSet)identifiers;
- (KGGraph)graph;
- (NSArray)allObjects;
- (NSSet)set;
- (id)collectionByFormingUnionWithCollection:(id)a3;
- (id)collectionByIntersectingCollection:(id)a3;
- (id)collectionBySubtractingCollection:(id)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)enumerateElementIdentifierBatchesWithBatchSize:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4;
@end

@implementation KGElementCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (KGGraph)graph
{
  return self->_graph;
}

- (KGElementIdentifierSet)identifiers
{
  return self->_identifiers;
}

- (BOOL)containsCollection:(id)a3
{
  identifiers = self->_identifiers;
  v4 = [a3 identifiers];
  LOBYTE(identifiers) = [(KGElementIdentifierSet *)identifiers containsIdentifierSet:v4];

  return (char)identifiers;
}

- (BOOL)isSubsetOfCollection:(id)a3
{
  identifiers = self->_identifiers;
  v4 = [a3 identifiers];
  LOBYTE(identifiers) = [(KGElementIdentifierSet *)identifiers isSubsetOfIdentifierSet:v4];

  return (char)identifiers;
}

- (BOOL)intersectsCollection:(id)a3
{
  identifiers = self->_identifiers;
  v4 = [a3 identifiers];
  LOBYTE(identifiers) = [(KGElementIdentifierSet *)identifiers intersectsIdentifierSet:v4];

  return (char)identifiers;
}

- (id)collectionBySubtractingCollection:(id)a3
{
  identifiers = self->_identifiers;
  v5 = [a3 identifiers];
  v6 = [(KGElementIdentifierSet *)identifiers identifierSetBySubtractingIdentifierSet:v5];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifiers:v6 graph:self->_graph];
  return v7;
}

- (id)collectionByIntersectingCollection:(id)a3
{
  identifiers = self->_identifiers;
  v5 = [a3 identifiers];
  v6 = [(KGElementIdentifierSet *)identifiers identifierSetByIntersectingIdentifierSet:v5];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifiers:v6 graph:self->_graph];
  return v7;
}

- (id)collectionByFormingUnionWithCollection:(id)a3
{
  identifiers = self->_identifiers;
  v5 = [a3 identifiers];
  v6 = [(KGElementIdentifierSet *)identifiers identifierSetByFormingUnion:v5];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifiers:v6 graph:self->_graph];
  return v7;
}

- (unint64_t)hash
{
  return [(KGElementIdentifierSet *)self->_identifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KGElementCollection *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)KGElementCollection;
    if ([(KGElementCollection *)&v7 isEqual:v4]) {
      BOOL v5 = [(KGElementCollection *)self isEqualToCollection:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4 = a3;
  identifiers = self->_identifiers;
  v6 = [v4 identifiers];
  LODWORD(identifiers) = [(KGElementIdentifierSet *)identifiers isEqualToElementIdentifierSet:v6];

  if (identifiers)
  {
    objc_super v7 = [(KGGraph *)self->_graph implementation];
    v8 = [v4 graph];
    v9 = [v8 implementation];
    char v10 = [v7 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  v2 = [(KGElementCollection *)self set];
  v3 = [v2 description];

  return v3;
}

- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  KGAbstractMethodException(self, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)enumerateElementIdentifierBatchesWithBatchSize:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  id v7 = [(KGElementCollection *)self identifiers];
  id v8 = (void *)[v7 mutableCopy];

  unsigned __int8 v12 = 0;
  do
  {
    if ([v8 isEmpty]) {
      break;
    }
    id v9 = (void *)MEMORY[0x1D25FA040]();
    char v10 = [v8 prefix:a3];
    [v8 subtractIdentifierSet:v10];
    v6[2](v6, v10, &v12);
    int v11 = v12;
  }
  while (!v11);
}

- (NSArray)allObjects
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KGElement)anyObject
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__4347;
  id v9 = __Block_byref_object_dispose__4348;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__KGElementCollection_anyObject__block_invoke;
  v4[3] = &unk_1E68DC1C8;
  v4[4] = &v5;
  [(KGElementCollection *)self enumerateElementsWithBatchSize:1 usingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (KGElement *)v2;
}

void __32__KGElementCollection_anyObject__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (unint64_t)count
{
  return [(KGElementIdentifierSet *)self->_identifiers count];
}

- (NSSet)set
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[KGElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__KGElementCollection_set__block_invoke;
  v6[3] = &unk_1E68DC1A0;
  id v4 = v3;
  id v7 = v4;
  [(KGElementCollection *)self enumerateElementsWithBatchSize:256 usingBlock:v6];

  return (NSSet *)v4;
}

uint64_t __26__KGElementCollection_set__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (KGElementCollection)initWithIdentifiers:(id)a3 graph:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGElementCollection;
  id v9 = [(KGElementCollection *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    objc_storeStrong((id *)&v10->_graph, a4);
  }

  return v10;
}

@end