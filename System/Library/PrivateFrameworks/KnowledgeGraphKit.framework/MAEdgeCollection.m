@interface MAEdgeCollection
+ (id)edgesFromNodes:(id)a3 matchingFilter:(id)a4;
+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4 matchingFilter:(id)a5;
+ (id)edgesMatchingFilter:(id)a3 inGraph:(id)a4;
+ (id)edgesOfType:(unint64_t)a3 betweenNodes:(id)a4 andNodes:(id)a5 matchingFilter:(id)a6;
+ (id)edgesOfType:(unint64_t)a3 onNodes:(id)a4 matchingFilter:(id)a5;
+ (id)edgesToNodes:(id)a3 matchingFilter:(id)a4;
- (BOOL)containsEdge:(id)a3;
- (MAEdgeCollection)initWithEdge:(id)a3;
- (id)edgesMatchingFilter:(id)a3;
- (id)firstEdge;
- (id)labels;
- (id)randomEdge;
- (void)_enumerateUsingBlock:(id)a3;
- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateEdgesUsingBlock:(id)a3;
- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4;
- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4;
@end

@implementation MAEdgeCollection

+ (id)edgesMatchingFilter:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  v7 = [a4 graphReference];
  v8 = [v7 concreteGraph];
  v9 = [v8 edgeIdentifiersMatchingFilter:v6];

  v10 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v7 elementIdentifiers:v9];
  return v10;
}

+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4 matchingFilter:(id)a5
{
  return (id)[a1 edgesOfType:2 betweenNodes:a3 andNodes:a4 matchingFilter:a5];
}

+ (id)edgesOfType:(unint64_t)a3 betweenNodes:(id)a4 andNodes:(id)a5 matchingFilter:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [v12 graphReference];
  v14 = [v13 concreteGraph];
  v15 = [v12 elementIdentifiers];

  v16 = [v11 elementIdentifiers];

  v17 = [v14 edgeIdentifiersOfType:a3 betweenNodesForIdentifiers:v15 andNodesForIdentifiers:v16 matchingFilter:v10];

  v18 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v13 elementIdentifiers:v17];
  return v18;
}

+ (id)edgesToNodes:(id)a3 matchingFilter:(id)a4
{
  return (id)[a1 edgesOfType:1 onNodes:a3 matchingFilter:a4];
}

+ (id)edgesFromNodes:(id)a3 matchingFilter:(id)a4
{
  return (id)[a1 edgesOfType:2 onNodes:a3 matchingFilter:a4];
}

+ (id)edgesOfType:(unint64_t)a3 onNodes:(id)a4 matchingFilter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 graphReference];
  id v11 = [v10 concreteGraph];
  id v12 = [v9 elementIdentifiers];

  v13 = [v11 edgeIdentifiersOfType:a3 onNodesForIdentifiers:v12 matchingFilter:v8];

  v14 = (void *)[objc_alloc((Class)a1) initWithGraphReference:v10 elementIdentifiers:v13];
  return v14;
}

- (id)edgesMatchingFilter:(id)a3
{
  id v4 = a3;
  v5 = [(MAElementCollection *)self graphReference];
  id v6 = [v5 concreteGraph];
  v7 = [(MAElementCollection *)self elementIdentifiers];
  id v8 = [v6 edgeIdentifiersMatchingFilter:v4 intersectingIdentifiers:v7];

  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGraphReference:v5 elementIdentifiers:v8];
  return v9;
}

- (id)labels
{
  v3 = [(MAElementCollection *)self graphReference];
  id v4 = [v3 concreteGraph];
  v5 = [(MAElementCollection *)self elementIdentifiers];
  id v8 = 0;
  [v4 labelsAndDomainsOfEdgesForIdentifiers:v5 labels:&v8 domains:0];
  id v6 = v8;

  return v6;
}

- (BOOL)containsEdge:(id)a3
{
  id v4 = a3;
  v5 = [(MAElementCollection *)self elementIdentifiers];
  uint64_t v6 = [v4 identifier];

  LOBYTE(v4) = [v5 containsIdentifier:v6];
  return (char)v4;
}

- (id)randomEdge
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
    v5 = [v7 edgeForIdentifier:v4];
  }
  return v5;
}

- (id)firstEdge
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__862;
  v14 = __Block_byref_object_dispose__863;
  id v15 = 0;
  v3 = [(MAElementCollection *)self elementIdentifiers];
  uint64_t v4 = [v3 prefix:1];

  v5 = [(MAElementCollection *)self graphReference];
  uint64_t v6 = [v5 concreteGraph];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__MAEdgeCollection_firstEdge__block_invoke;
  v9[3] = &unk_1E68DC9D0;
  v9[4] = &v10;
  [v6 enumerateEdgesWithIdentifiers:v4 usingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __29__MAEdgeCollection_firstEdge__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)enumerateUnsignedLongLongPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateUnsignedLongLongPropertyValuesForKey:v7 ofEdgesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateUnsignedIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateUnsignedIntegerPropertyValuesForKey:v7 ofEdgesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateDoublePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateDoublePropertyValuesForKey:v7 ofEdgesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateStringPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateStringPropertyValuesForKey:v7 ofEdgesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateIntegerPropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(MAElementCollection *)self graphReference];
  id v8 = [v10 concreteGraph];
  id v9 = [(MAElementCollection *)self elementIdentifiers];
  [v8 enumerateIntegerPropertyValuesForKey:v7 ofEdgesWithIdentifiers:v9 usingBlock:v6];
}

- (void)enumerateEdgesUsingBlock:(id)a3
{
  id v4 = a3;
  id v7 = [(MAElementCollection *)self graphReference];
  v5 = [v7 concreteGraph];
  id v6 = [(MAElementCollection *)self elementIdentifiers];
  [v5 enumerateEdgesWithIdentifiers:v6 usingBlock:v4];
}

- (MAEdgeCollection)initWithEdge:(id)a3
{
  id v4 = a3;
  v5 = [v4 graphReference];
  id v6 = [KGElementIdentifierSet alloc];
  uint64_t v7 = [v4 identifier];

  id v8 = [(KGElementIdentifierSet *)v6 initWithElementIdentifier:v7];
  id v9 = [(MAElementCollection *)self initWithGraphReference:v5 elementIdentifiers:v8];

  return v9;
}

- (void)_enumerateUsingBlock:(id)a3
{
  id v4 = a3;
  id v7 = [(MAElementCollection *)self graphReference];
  v5 = [v7 concreteGraph];
  id v6 = [(MAElementCollection *)self elementIdentifiers];
  [v5 enumerateEdgesWithIdentifiers:v6 usingBlock:v4];
}

@end