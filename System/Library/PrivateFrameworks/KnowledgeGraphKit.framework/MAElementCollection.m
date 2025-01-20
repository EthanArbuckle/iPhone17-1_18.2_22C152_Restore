@interface MAElementCollection
- (BOOL)containsCollection:(id)a3;
- (BOOL)intersectsCollection:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubsetOfCollection:(id)a3;
- (KGElementIdentifierSet)elementIdentifiers;
- (MAElementCollection)initWithArray:(id)a3 graph:(id)a4;
- (MAElementCollection)initWithGraph:(id)a3;
- (MAElementCollection)initWithGraph:(id)a3 elementIdentifiers:(id)a4;
- (MAElementCollection)initWithGraphReference:(id)a3 elementIdentifiers:(id)a4;
- (MAElementCollection)initWithSet:(id)a3 graph:(id)a4;
- (MAGraphProxy)graph;
- (MAGraphReference)graphReference;
- (NSSet)labels;
- (id)_anyElement;
- (id)array;
- (id)collectionByFormingUnionWith:(id)a3;
- (id)collectionByIntersecting:(id)a3;
- (id)collectionBySubtracting:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteredCollectionUsingBlock:(id)a3;
- (id)set;
- (id)sortedArrayUsingDescriptors:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)_enumerateUsingBlock:(id)a3;
- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateIdentifiersAsCollectionsWithBlock:(id)a3;
- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4;
@end

@implementation MAElementCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifiers, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
}

- (KGElementIdentifierSet)elementIdentifiers
{
  return self->_elementIdentifiers;
}

- (MAGraphReference)graphReference
{
  return (MAGraphReference *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  graphReference = self->_graphReference;
  id v7 = [(KGElementIdentifierSet *)self->_elementIdentifiers copyWithZone:a3];
  v8 = (void *)[v5 initWithGraphReference:graphReference elementIdentifiers:v7];

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MAGraphReference *)self->_graphReference hash] + 2654435769u;
  return ([(KGElementIdentifierSet *)self->_elementIdentifiers hash] + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MAElementCollection *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      graphReference = self->_graphReference;
      id v7 = [(MAElementCollection *)v5 graphReference];

      if (graphReference == v7)
      {
        v9 = [(MAElementCollection *)self elementIdentifiers];
        v10 = [(MAElementCollection *)v5 elementIdentifiers];
        char v8 = [v9 isEqualToElementIdentifierSet:v10];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)containsCollection:(id)a3
{
  return [(KGElementIdentifierSet *)self->_elementIdentifiers containsIdentifierSet:*((void *)a3 + 2)];
}

- (BOOL)isSubsetOfCollection:(id)a3
{
  return [(KGElementIdentifierSet *)self->_elementIdentifiers isSubsetOfIdentifierSet:*((void *)a3 + 2)];
}

- (BOOL)intersectsCollection:(id)a3
{
  return [(KGElementIdentifierSet *)self->_elementIdentifiers intersectsIdentifierSet:*((void *)a3 + 2)];
}

- (id)collectionBySubtracting:(id)a3
{
  elementIdentifiers = self->_elementIdentifiers;
  v5 = [a3 elementIdentifiers];
  v6 = [(KGElementIdentifierSet *)elementIdentifiers identifierSetBySubtractingIdentifierSet:v5];

  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:self->_graphReference elementIdentifiers:v6];
  return v7;
}

- (id)collectionByIntersecting:(id)a3
{
  elementIdentifiers = self->_elementIdentifiers;
  v5 = [a3 elementIdentifiers];
  v6 = [(KGElementIdentifierSet *)elementIdentifiers identifierSetByIntersectingIdentifierSet:v5];

  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:self->_graphReference elementIdentifiers:v6];
  return v7;
}

- (id)collectionByFormingUnionWith:(id)a3
{
  elementIdentifiers = self->_elementIdentifiers;
  v5 = [a3 elementIdentifiers];
  v6 = [(KGElementIdentifierSet *)elementIdentifiers identifierSetByFormingUnion:v5];

  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:self->_graphReference elementIdentifiers:v6];
  return v7;
}

- (id)_anyElement
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1994;
  v9 = __Block_byref_object_dispose__1995;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MAElementCollection__anyElement__block_invoke;
  v4[3] = &unk_1E68DB538;
  v4[4] = &v5;
  [(MAElementCollection *)self _enumerateUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__MAElementCollection__anyElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)set
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__MAElementCollection_set__block_invoke;
  v6[3] = &unk_1E68DB510;
  id v4 = v3;
  id v7 = v4;
  [(MAElementCollection *)self _enumerateUsingBlock:v6];

  return v4;
}

uint64_t __26__MAElementCollection_set__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)sortedArrayUsingDescriptors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MAElementCollection *)self array];
  v6 = [v5 sortedArrayUsingDescriptors:v4];

  return v6;
}

- (id)array
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__MAElementCollection_array__block_invoke;
  v6[3] = &unk_1E68DB510;
  id v4 = v3;
  id v7 = v4;
  [(MAElementCollection *)self _enumerateUsingBlock:v6];

  return v4;
}

uint64_t __28__MAElementCollection_array__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)filteredCollectionUsingBlock:(id)a3
{
  id v4 = a3;
  elementIdentifiers = self->_elementIdentifiers;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __52__MAElementCollection_filteredCollectionUsingBlock___block_invoke;
  v15 = &unk_1E68DB4E8;
  v16 = self;
  id v6 = v4;
  id v17 = v6;
  id v7 = [(KGElementIdentifierSet *)elementIdentifiers identifierSetByFilteringUsingBlock:&v12];
  if (v7 == self->_elementIdentifiers)
  {
    v9 = self;
  }
  else
  {
    id v8 = objc_alloc((Class)objc_opt_class());
    v9 = (MAElementCollection *)objc_msgSend(v8, "initWithGraphReference:elementIdentifiers:", self->_graphReference, v7, v12, v13, v14, v15, v16);
  }
  id v10 = v9;

  return v10;
}

uint64_t __52__MAElementCollection_filteredCollectionUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1D25FA040]();
  uint64_t v5 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:*(void *)(*(void *)(a1 + 32) + 8) elementIdentifiers:v5];
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v7;
}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  KGAbstractMethodException(self, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)enumerateIdentifiersAsCollectionsWithBlock:(id)a3
{
  id v4 = a3;
  elementIdentifiers = self->_elementIdentifiers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MAElementCollection_enumerateIdentifiersAsCollectionsWithBlock___block_invoke;
  v7[3] = &unk_1E68DB4C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(KGElementIdentifierSet *)elementIdentifiers enumerateIdentifiersWithBlock:v7];
}

void __66__MAElementCollection_enumerateIdentifiersAsCollectionsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1D25FA040]();
  uint64_t v5 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:*(void *)(*(void *)(a1 + 32) + 8) elementIdentifiers:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_enumerateUsingBlock:(id)a3
{
  id v5 = a3;
  KGAbstractMethodException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (NSSet)labels
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)count
{
  return [(KGElementIdentifierSet *)self->_elementIdentifiers count];
}

- (BOOL)isEmpty
{
  return [(KGElementIdentifierSet *)self->_elementIdentifiers isEmpty];
}

- (MAGraphProxy)graph
{
  return [(MAGraphReference *)self->_graphReference graph];
}

- (MAElementCollection)initWithSet:(id)a3 graph:(id)a4
{
  id v6 = a3;
  id v7 = [a4 graphReference];
  id v8 = KGElementIdentifierSetWithSet(v6);

  id v9 = [(MAElementCollection *)self initWithGraphReference:v7 elementIdentifiers:v8];
  return v9;
}

- (MAElementCollection)initWithArray:(id)a3 graph:(id)a4
{
  id v6 = a3;
  id v7 = [a4 graphReference];
  id v8 = KGElementIdentifierSetWithArray(v6);

  id v9 = [(MAElementCollection *)self initWithGraphReference:v7 elementIdentifiers:v8];
  return v9;
}

- (MAElementCollection)initWithGraph:(id)a3
{
  id v4 = [a3 graphReference];
  id v5 = objc_alloc_init(KGElementIdentifierSet);
  id v6 = [(MAElementCollection *)self initWithGraphReference:v4 elementIdentifiers:v5];

  return v6;
}

- (MAElementCollection)initWithGraph:(id)a3 elementIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = [a3 graphReference];
  id v8 = [(MAElementCollection *)self initWithGraphReference:v7 elementIdentifiers:v6];

  return v8;
}

- (MAElementCollection)initWithGraphReference:(id)a3 elementIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MAElementCollection;
  id v9 = [(MAElementCollection *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graphReference, a3);
    if (v8) {
      v11 = (KGElementIdentifierSet *)v8;
    }
    else {
      v11 = objc_alloc_init(KGElementIdentifierSet);
    }
    elementIdentifiers = v10->_elementIdentifiers;
    v10->_elementIdentifiers = v11;
  }
  return v10;
}

@end