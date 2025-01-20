@interface MANodeCollection
+ (id)nodesMatchingFilter:(id)a3 inGraph:(id)a4;
+ (id)nodesOfEdges:(id)a3;
+ (id)nodesRelatedToNodes:(id)a3 withRelation:(id)a4;
+ (id)sourceNodesOfEdges:(id)a3;
+ (id)targetNodesOfEdges:(id)a3;
+ (unint64_t)numberOfNodesRelatedToNodes:(id)a3 withRelation:(id)a4;
- (BOOL)containsNode:(id)a3;
- (MANodeCollection)initWithNode:(id)a3;
- (id)debugDescription;
- (id)firstNode;
- (id)labels;
- (id)nodesMatchingFilter:(id)a3;
- (id)randomNode;
- (void)_enumerateUsingBlock:(id)a3;
- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateNodesAsCollectionsSortedByDoublePropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateNodesAsCollectionsSortedByIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateNodesAsCollectionsSortedByStringPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateNodesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesUsingBlock:(id)a3;
- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4;
@end

@implementation MANodeCollection

- (id)nodesMatchingFilter:(id)a3
{
  id v4 = a3;
  v5 = [(MAElementCollection *)self graphReference];
  v6 = [v5 concreteGraph];
  v7 = [(MAElementCollection *)self elementIdentifiers];
  v8 = [v6 nodeIdentifiersMatchingFilter:v4 intersectingIdentifiers:v7];

  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:v5 elementIdentifiers:v8];
  return v9;
}

- (id)labels
{
  v3 = [(MAElementCollection *)self graphReference];
  id v4 = [v3 concreteGraph];
  v5 = [(MAElementCollection *)self elementIdentifiers];
  id v8 = 0;
  [v4 labelsAndDomainsOfNodesForIdentifiers:v5 labels:&v8 domains:0];
  id v6 = v8;

  return v6;
}

- (BOOL)containsNode:(id)a3
{
  id v4 = a3;
  v5 = [(MAElementCollection *)self elementIdentifiers];
  uint64_t v6 = [v4 identifier];

  LOBYTE(v4) = [v5 containsIdentifier:v6];
  return (char)v4;
}

- (id)randomNode
{
  v3 = [(MAElementCollection *)self elementIdentifiers];
  uint64_t v4 = [v3 randomElement];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = [(MAElementCollection *)self graphReference];
    v7 = [v6 concreteGraph];
    v5 = [v7 nodeForIdentifier:v4];
  }
  return v5;
}

- (id)firstNode
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__806;
  v14 = __Block_byref_object_dispose__807;
  id v15 = 0;
  v3 = [(MAElementCollection *)self elementIdentifiers];
  uint64_t v4 = [v3 prefix:1];

  v5 = [(MAElementCollection *)self graphReference];
  uint64_t v6 = [v5 concreteGraph];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__MANodeCollection_firstNode__block_invoke;
  v9[3] = &unk_1E68DBB40;
  v9[4] = &v10;
  [v6 enumerateNodesWithIdentifiers:v4 usingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __29__MANodeCollection_firstNode__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementCollection *)self graphReference];
  v11 = [v10 concreteGraph];
  uint64_t v12 = [(MAElementCollection *)self elementIdentifiers];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__MANodeCollection_enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E68DB4C0;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 enumerateNodeIdentifiers:v12 sortedByUnsignedIntegerPropertyForName:v9 ascending:v5 usingBlock:v14];
}

void __107__MANodeCollection_enumerateNodesAsCollectionsSortedByUnsignedIntegerPropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [*(id *)(a1 + 32) graphReference];
  BOOL v5 = (void *)[v3 initWithGraphReference:v4 elementIdentifiers:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateNodesAsCollectionsSortedByDoublePropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementCollection *)self graphReference];
  v11 = [v10 concreteGraph];
  uint64_t v12 = [(MAElementCollection *)self elementIdentifiers];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__MANodeCollection_enumerateNodesAsCollectionsSortedByDoublePropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E68DB4C0;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 enumerateNodeIdentifiers:v12 sortedByDoublePropertyForName:v9 ascending:v5 usingBlock:v14];
}

void __98__MANodeCollection_enumerateNodesAsCollectionsSortedByDoublePropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [*(id *)(a1 + 32) graphReference];
  BOOL v5 = (void *)[v3 initWithGraphReference:v4 elementIdentifiers:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateNodesAsCollectionsSortedByIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementCollection *)self graphReference];
  v11 = [v10 concreteGraph];
  uint64_t v12 = [(MAElementCollection *)self elementIdentifiers];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__MANodeCollection_enumerateNodesAsCollectionsSortedByIntegerPropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E68DB4C0;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 enumerateNodeIdentifiers:v12 sortedByIntegerPropertyForName:v9 ascending:v5 usingBlock:v14];
}

void __99__MANodeCollection_enumerateNodesAsCollectionsSortedByIntegerPropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [*(id *)(a1 + 32) graphReference];
  BOOL v5 = (void *)[v3 initWithGraphReference:v4 elementIdentifiers:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateNodesAsCollectionsSortedByStringPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementCollection *)self graphReference];
  v11 = [v10 concreteGraph];
  uint64_t v12 = [(MAElementCollection *)self elementIdentifiers];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__MANodeCollection_enumerateNodesAsCollectionsSortedByStringPropertyForName_ascending_usingBlock___block_invoke;
  v14[3] = &unk_1E68DB4C0;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 enumerateNodeIdentifiers:v12 sortedByStringPropertyForName:v9 ascending:v5 usingBlock:v14];
}

void __98__MANodeCollection_enumerateNodesAsCollectionsSortedByStringPropertyForName_ascending_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a2];
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [*(id *)(a1 + 32) graphReference];
  BOOL v5 = (void *)[v3 initWithGraphReference:v4 elementIdentifiers:v6];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateUnsignedLongLongPropertyValuesForKey:v7 ofNodesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateUnsignedIntegerPropertyValuesForKey:v7 ofNodesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateDoublePropertyValuesForKey:v7 ofNodesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateStringPropertyValuesForKey:v7 ofNodesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateIntegerPropertyValuesForKey:v7 ofNodesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateNodesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateNodesWithIdentifiers:v9 sortedByFloatPropertyForName:v7 usingBlock:v6];
}

- (void)enumerateNodesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateNodesWithIdentifiers:v9 sortedByIntegerPropertyForName:v7 usingBlock:v6];
}

- (void)enumerateNodesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateNodesWithIdentifiers:v9 sortedByStringPropertyForName:v7 usingBlock:v6];
}

- (void)enumerateNodesUsingBlock:(id)a3
{
  id v4 = a3;
  id v7 = [(MAElementCollection *)self graphReference];
  BOOL v5 = [v7 concreteGraph];
  id v6 = [(MAElementCollection *)self elementIdentifiers];
  [v5 enumerateNodesWithIdentifiers:v6 usingBlock:v4];
}

- (void)_enumerateUsingBlock:(id)a3
{
  id v4 = a3;
  id v7 = [(MAElementCollection *)self graphReference];
  BOOL v5 = [v7 concreteGraph];
  id v6 = [(MAElementCollection *)self elementIdentifiers];
  [v5 enumerateNodesWithIdentifiers:v6 usingBlock:v4];
}

- (MANodeCollection)initWithNode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 graphReference];
  id v6 = [KGElementIdentifierSet alloc];
  uint64_t v7 = [v4 identifier];

  id v8 = [(KGElementIdentifierSet *)v6 initWithElementIdentifier:v7];
  id v9 = [(MAElementCollection *)self initWithGraphReference:v5 elementIdentifiers:v8];

  return v9;
}

- (id)debugDescription
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MANodeCollection;
  id v4 = [(MANodeCollection *)&v8 description];
  BOOL v5 = [(MAElementCollection *)self array];
  id v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

+ (unint64_t)numberOfNodesRelatedToNodes:(id)a3 withRelation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 graphReference];
  objc_super v8 = [v7 concreteGraph];
  id v9 = [v6 elementIdentifiers];

  id v10 = [v8 nodeIdentifiersRelatedToSourceNodeIdentifiers:v9 relation:v5];

  unint64_t v11 = [v10 count];
  return v11;
}

+ (id)targetNodesOfEdges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 graphReference];
  id v6 = [v5 concreteGraph];
  uint64_t v7 = [v4 elementIdentifiers];

  objc_super v8 = [v6 nodeIdentifiersOfEdgeIdentifiers:v7 ofType:1];

  id v9 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v5 elementIdentifiers:v8];
  return v9;
}

+ (id)sourceNodesOfEdges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 graphReference];
  id v6 = [v5 concreteGraph];
  uint64_t v7 = [v4 elementIdentifiers];

  objc_super v8 = [v6 nodeIdentifiersOfEdgeIdentifiers:v7 ofType:2];

  id v9 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v5 elementIdentifiers:v8];
  return v9;
}

+ (id)nodesOfEdges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 graphReference];
  id v6 = [v5 concreteGraph];
  uint64_t v7 = [v4 elementIdentifiers];

  objc_super v8 = [v6 nodeIdentifiersOfEdgeIdentifiers:v7 ofType:3];

  id v9 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v5 elementIdentifiers:v8];
  return v9;
}

+ (id)nodesRelatedToNodes:(id)a3 withRelation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 graphReference];
  id v9 = [v8 concreteGraph];
  id v10 = [v7 elementIdentifiers];

  unint64_t v11 = [v9 nodeIdentifiersRelatedToSourceNodeIdentifiers:v10 relation:v6];

  uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v8 elementIdentifiers:v11];
  return v12;
}

+ (id)nodesMatchingFilter:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  id v7 = [a4 graphReference];
  objc_super v8 = [v7 concreteGraph];
  id v9 = [v8 nodeIdentifiersMatchingFilter:v6];

  id v10 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v7 elementIdentifiers:v9];
  return v10;
}

@end