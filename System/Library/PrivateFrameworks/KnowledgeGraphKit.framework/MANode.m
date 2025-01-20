@interface MANode
- (BOOL)conformsToNodeSchema:(id)a3;
- (BOOL)hasEdge:(id)a3 isIn:(BOOL *)a4;
- (BOOL)hasEdgeFromNode:(id)a3;
- (BOOL)hasEdgeTowardNode:(id)a3;
- (BOOL)hasEdgeWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (BOOL)hasEdgeWithNode:(id)a3;
- (BOOL)hasEqualPropertiesToNode:(id)a3;
- (BOOL)hasProperties;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)isOrphan;
- (BOOL)isSameNodeAsNode:(id)a3;
- (BOOL)isUnique;
- (BOOL)matchesNode:(id)a3 includingProperties:(BOOL)a4;
- (MAGraphProxy)graph;
- (MAGraphReference)graphReference;
- (MANode)init;
- (MANode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5;
- (MANode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (MANodeImplementationProtocol)implementation;
- (NSDictionary)properties;
- (NSSet)labels;
- (NSString)description;
- (id)allEdges;
- (id)anyEdgeFromNode:(id)a3;
- (id)anyEdgeOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5;
- (id)anyEdgeOfType:(unint64_t)a3 withNode:(id)a4;
- (id)anyEdgeTowardNode:(id)a3;
- (id)anyEdgeWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)anyEdgeWithNode:(id)a3;
- (id)anyNeighborNodeThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5;
- (id)anyNeighborNodeThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)associatedNodesForRemoval;
- (id)changingPropertiesWithProperties:(id)a3;
- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)edgesFromNode:(id)a3;
- (id)edgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5;
- (id)edgesOfType:(unint64_t)a3 withNode:(id)a4;
- (id)edgesTowardNode:(id)a3;
- (id)edgesWithNode:(id)a3;
- (id)neighborNodes;
- (id)neighborNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5;
- (id)neighborNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)neighborNodesThroughInEdges;
- (id)neighborNodesThroughOutEdges;
- (id)neighborNodesWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)propertyForKey:(id)a3 kindOfClass:(Class)a4;
- (id)propertyKeys;
- (id)shortDescription;
- (id)shortestPathToNode:(id)a3 directed:(BOOL)a4;
- (id)siblingNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (id)visualString;
- (id)visualStringWithName:(id)a3;
- (id)visualStringWithName:(id)a3 andPropertyKeys:(id)a4;
- (unint64_t)countOfEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (unint64_t)edgesCount;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)inEdgesCount;
- (unint64_t)outEdgesCount;
- (unint64_t)propertiesCount;
- (void)enumerateEdgesInDomains:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5 usingBlock:(id)a6;
- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5;
- (void)enumerateEdgesUsingBlock:(id)a3;
- (void)enumerateEdgesWithDomains:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateInEdgesUsingBlock:(id)a3;
- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 inDomain:(unsigned __int16)a5 usingBlock:(id)a6;
- (void)enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:(id)a3;
- (void)enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:(id)a3;
- (void)enumerateNeighborEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 inDomain:(unsigned __int16)a5 usingBlock:(id)a6;
- (void)enumerateNeighborNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateNeighborNodesThroughInEdgesUsingBlock:(id)a3;
- (void)enumerateNeighborNodesThroughOutEdgesUsingBlock:(id)a3;
- (void)enumerateNeighborNodesUsingBlock:(id)a3;
- (void)enumerateNeighborNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateOutEdgesUsingBlock:(id)a3;
- (void)enumeratePropertiesUsingBlock:(id)a3;
- (void)enumerateSiblingNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4;
- (void)enumerateSiblingNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)resolveIdentifier:(unint64_t)a3;
- (void)setGraphReference:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setImplementation:(id)a3;
@end

@implementation MANode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
}

- (void)setImplementation:(id)a3
{
}

- (MANodeImplementationProtocol)implementation
{
  return self->_implementation;
}

- (MAGraphReference)graphReference
{
  return self->_graphReference;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)associatedNodesForRemoval
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)visualStringWithName:(id)a3 andPropertyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D25FA040]();
  v9 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v9, "appendString:", @"(");
  if (v6) {
    [v9 appendString:v6];
  }
  v10 = [(MANode *)self label];

  if (v10)
  {
    v11 = [(MANode *)self label];
    [v9 appendFormat:@":%@", v11];
  }
  else
  {
    [v9 appendFormat:@":"];
  }
  if ([(MANode *)self domain] && [(MANode *)self domain] != 1) {
    objc_msgSend(v9, "appendFormat:", @":%lu", -[MANode domain](self, "domain"));
  }
  v12 = [(MANode *)self propertyDictionary];
  v13 = PropertiesVisualStringForKeys(v7, v12);

  if ((unint64_t)[v13 length] >= 3) {
    [v9 appendFormat:@" %@", v13];
  }
  [v9 appendString:@""]);

  return v9;
}

- (id)visualStringWithName:(id)a3
{
  return [(MANode *)self visualStringWithName:a3 andPropertyKeys:0];
}

- (id)visualString
{
  return [(MANode *)self visualStringWithName:0];
}

- (id)shortestPathToNode:(id)a3 directed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MANode *)self graph];
  v8 = [v7 shortestPathFromNode:self toNode:v6 directed:v4];

  return v8;
}

- (void)enumerateSiblingNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v8 domain:v6];
  implementation = self->_implementation;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke;
  v14[3] = &unk_1E68DBBE0;
  v14[4] = self;
  id v15 = v8;
  __int16 v17 = v6;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(MANodeImplementationProtocol *)implementation enumerateNeighborEdgesAndNodesThroughEdgesOfType:3 matchingFilter:v10 usingBlock:v14];
}

void __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (([v8 isSameNodeAsNode:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v9 = *(unsigned __int16 *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke_2;
    v11[3] = &unk_1E68DBB90;
    uint64_t v10 = *(void *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    id v12 = v8;
    id v13 = v7;
    uint64_t v15 = a4;
    [v12 enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:v10 domain:v9 usingBlock:v11];
  }
}

void __71__MANode_enumerateSiblingNodesThroughEdgesWithLabel_domain_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (([v7 isSameNodeAsNode:*(void *)(a1 + 32)] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    **(unsigned char **)(a1 + 64) = *a4;
  }
}

- (void)enumerateSiblingNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke;
  v10[3] = &unk_1E68DBBB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:v9 usingBlock:v10];
}

void __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (([v8 isSameNodeAsNode:*(void *)(a1 + 32)] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke_2;
    v10[3] = &unk_1E68DBB90;
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    id v11 = v8;
    id v12 = v7;
    uint64_t v14 = a4;
    [v11 enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:v9 usingBlock:v10];
  }
}

void __66__MANode_enumerateSiblingNodesThroughEdgesWithDomains_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (([v7 isSameNodeAsNode:*(void *)(a1 + 32)] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    **(unsigned char **)(a1 + 64) = *a4;
  }
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__MANode_enumerateNeighborEdgesAndNodesThroughEdgesWithDomains_usingBlock___block_invoke;
  v8[3] = &unk_1E68DBAF0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(MANode *)self enumerateEdgesInDomains:a3 usingBlock:v8];
}

void __75__MANode_enumerateNeighborEdgesAndNodesThroughEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 oppositeNode:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateNeighborNodesThroughEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MANode_enumerateNeighborNodesThroughEdgesWithDomains_usingBlock___block_invoke;
  v8[3] = &unk_1E68DBAF0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(MANode *)self enumerateEdgesInDomains:a3 usingBlock:v8];
}

void __67__MANode_enumerateNeighborNodesThroughEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 oppositeNode:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)siblingNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MANode_siblingNodesThroughEdgesWithLabel_domain___block_invoke;
  v11[3] = &unk_1E68DBB68;
  id v9 = v8;
  id v12 = v9;
  [(MANode *)self enumerateSiblingNodesThroughEdgesWithLabel:v7 domain:v4 usingBlock:v11];

  return v9;
}

uint64_t __51__MANode_siblingNodesThroughEdgesWithLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)anyNeighborNodeThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MANode *)self anyNeighborNodeThroughEdgesOfType:3 withLabel:a3 domain:a4];
}

- (id)neighborNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MANode *)self neighborNodesThroughEdgesOfType:3 withLabel:a3 domain:a4];
}

- (id)neighborNodesThroughInEdges
{
  return [(MANode *)self neighborNodesThroughEdgesOfType:1 withLabel:0 domain:0];
}

- (id)neighborNodesThroughOutEdges
{
  return [(MANode *)self neighborNodesThroughEdgesOfType:2 withLabel:0 domain:0];
}

- (id)neighborNodes
{
  return [(MANode *)self neighborNodesWithLabel:0 domain:0];
}

- (id)anyNeighborNodeThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__2781;
  v18 = __Block_byref_object_dispose__2782;
  id v19 = 0;
  id v9 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v8 domain:v5];
  implementation = self->_implementation;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__MANode_anyNeighborNodeThroughEdgesOfType_withLabel_domain___block_invoke;
  v13[3] = &unk_1E68DBB40;
  v13[4] = &v14;
  [(MANodeImplementationProtocol *)implementation enumerateNeighborNodesThroughEdgesOfType:a3 matchingFilter:v9 usingBlock:v13];
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __61__MANode_anyNeighborNodeThroughEdgesOfType_withLabel_domain___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)neighborNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  id v11 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v9 domain:v5];

  implementation = self->_implementation;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__MANode_neighborNodesThroughEdgesOfType_withLabel_domain___block_invoke;
  v15[3] = &unk_1E68DC550;
  id v13 = v10;
  id v16 = v13;
  [(MANodeImplementationProtocol *)implementation enumerateNeighborNodesThroughEdgesOfType:a3 matchingFilter:v11 usingBlock:v15];

  return v13;
}

uint64_t __59__MANode_neighborNodesThroughEdgesOfType_withLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)neighborNodesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(MAElementFilter *)[MANodeFilter alloc] initWithLabel:v7 domain:v4];

  implementation = self->_implementation;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__MANode_neighborNodesWithLabel_domain___block_invoke;
  v13[3] = &unk_1E68DC550;
  id v11 = v8;
  id v14 = v11;
  [(MANodeImplementationProtocol *)implementation enumerateNeighborNodesMatchingFilter:v9 usingBlock:v13];

  return v11;
}

uint64_t __40__MANode_neighborNodesWithLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)hasEdge:(id)a3 isIn:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v7 = [v6 sourceNode];
  id v8 = [v6 targetNode];
  id v9 = [MAEdgeFilter alloc];
  id v10 = [v6 label];
  id v11 = -[MAElementFilter initWithLabel:domain:](v9, "initWithLabel:domain:", v10, [v6 domain]);

  id v12 = [v6 propertyDictionary];
  implementation = self->_implementation;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __23__MANode_hasEdge_isIn___block_invoke;
  v18[3] = &unk_1E68DBB18;
  id v14 = v7;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  id v16 = v12;
  v23 = &v25;
  v24 = a4;
  id v21 = v16;
  v22 = self;
  [(MANodeImplementationProtocol *)implementation enumerateEdgesOfType:3 matchingFilter:v11 usingBlock:v18];
  LOBYTE(a4) = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return (char)a4;
}

void __23__MANode_hasEdge_isIn___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  uint64_t v5 = [v11 sourceNode];
  if ([v5 isSameNodeAsNode:*(void *)(a1 + 32)])
  {
    id v6 = [v11 targetNode];
    int v7 = [v6 isSameNodeAsNode:*(void *)(a1 + 40)];

    id v8 = v11;
    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v5 = [v11 propertyDictionary];
    id v9 = *(void **)(a1 + 48);
    if (v9 == v5 || [v9 isEqualToDictionary:v5])
    {
      uint64_t v10 = *(void *)(a1 + 72);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      if (v10) {
        **(unsigned char **)(a1 + 72) = [*(id *)(a1 + 56) isEqualToNode:*(void *)(a1 + 40)];
      }
      *a3 = 1;
    }
  }

  id v8 = v11;
LABEL_9:
}

- (void)enumerateNeighborNodesThroughInEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateNeighborNodesThroughEdgesOfType:1 matchingFilter:v5 usingBlock:v4];
}

- (void)enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateNeighborEdgesAndNodesThroughEdgesOfType:1 matchingFilter:v5 usingBlock:v4];
}

- (void)enumerateNeighborNodesThroughOutEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateNeighborNodesThroughEdgesOfType:2 matchingFilter:v5 usingBlock:v4];
}

- (void)enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateNeighborEdgesAndNodesThroughEdgesOfType:2 matchingFilter:v5 usingBlock:v4];
}

- (void)enumerateEdgesInDomains:(id)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13++), "unsignedIntegerValue"));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__MANode_enumerateEdgesInDomains_usingBlock___block_invoke;
  v16[3] = &unk_1E68DBAF0;
  id v17 = v8;
  id v18 = v7;
  id v14 = v7;
  id v15 = v8;
  [(MANode *)self enumerateEdgesOfType:3 withLabel:0 domain:0 usingBlock:v16];
}

void __45__MANode_enumerateEdgesInDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "domain"))) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v9 domain:v5];

  [(MANodeImplementationProtocol *)self->_implementation enumerateNeighborEdgesAndNodesThroughEdgesOfType:3 matchingFilter:v10 usingBlock:v8];
}

- (void)enumerateNeighborNodesThroughEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v9 domain:v5];

  [(MANodeImplementationProtocol *)self->_implementation enumerateNeighborNodesThroughEdgesOfType:3 matchingFilter:v10 usingBlock:v8];
}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 inDomain:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v11 domain:v6];

  [(MANodeImplementationProtocol *)self->_implementation enumerateNeighborNodesThroughEdgesOfType:a3 matchingFilter:v12 usingBlock:v10];
}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 withLabel:(id)a4 inDomain:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v11 domain:v6];

  [(MANodeImplementationProtocol *)self->_implementation enumerateNeighborEdgesAndNodesThroughEdgesOfType:a3 matchingFilter:v12 usingBlock:v10];
}

- (void)enumerateNeighborNodesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateNeighborNodesMatchingFilter:v5 usingBlock:v4];
}

- (void)enumerateNeighborEdgesAndNodesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateNeighborEdgesAndNodesMatchingFilter:v5 usingBlock:v4];
}

- (void)enumerateNeighborNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MAElementFilter *)[MANodeFilter alloc] initWithLabel:v9 domain:v5];

  [(MANodeImplementationProtocol *)self->_implementation enumerateNeighborNodesMatchingFilter:v10 usingBlock:v8];
}

- (void)enumerateEdgesWithDomains:(id)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13++), "unsignedIntegerValue"));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__MANode_enumerateEdgesWithDomains_usingBlock___block_invoke;
  v16[3] = &unk_1E68DBAF0;
  id v17 = v8;
  id v18 = v7;
  id v14 = v7;
  id v15 = v8;
  [(MANode *)self enumerateEdgesOfType:3 withLabel:0 domain:0 usingBlock:v16];
}

void __47__MANode_enumerateEdgesWithDomains_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "domain"))) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v9 domain:v5];

  [(MANodeImplementationProtocol *)self->_implementation enumerateEdgesOfType:3 matchingFilter:v10 usingBlock:v8];
}

- (void)enumerateOutEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateEdgesOfType:2 matchingFilter:v5 usingBlock:v4];
}

- (void)enumerateInEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateEdgesOfType:1 matchingFilter:v5 usingBlock:v4];
}

- (void)enumerateEdgesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  implementation = self->_implementation;
  id v6 = a4;
  id v7 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateEdgesOfType:a3 matchingFilter:v7 usingBlock:v6];
}

- (void)enumerateEdgesUsingBlock:(id)a3
{
  implementation = self->_implementation;
  id v4 = a3;
  id v5 = +[MAElementFilter any];
  [(MANodeImplementationProtocol *)implementation enumerateEdgesOfType:3 matchingFilter:v5 usingBlock:v4];
}

- (BOOL)hasEdgeWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v6 domain:v4];

  LOBYTE(self) = [(MANodeImplementationProtocol *)self->_implementation hasEdgeOfType:3 matchingFilter:v7];
  return (char)self;
}

- (id)anyEdgeWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MANode *)self anyEdgeOfType:3 withLabel:a3 domain:a4];
}

- (unint64_t)countOfEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v6 domain:v4];

  unint64_t v8 = [(MANodeImplementationProtocol *)self->_implementation countOfEdgesOfType:3 matchingFilter:v7];
  return v8;
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4
{
  return [(MANode *)self edgesOfType:3 withLabel:a3 domain:a4];
}

- (id)allEdges
{
  return [(MANode *)self edgesOfType:3 withLabel:0 domain:0];
}

- (id)anyEdgeOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2781;
  id v16 = __Block_byref_object_dispose__2782;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__MANode_anyEdgeOfType_withLabel_domain___block_invoke;
  v11[3] = &unk_1E68DC9D0;
  void v11[4] = &v12;
  [(MANode *)self enumerateEdgesOfType:a3 withLabel:v8 domain:v5 usingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __41__MANode_anyEdgeOfType_withLabel_domain___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)edgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__MANode_edgesOfType_withLabel_domain___block_invoke;
  v13[3] = &unk_1E68DCA20;
  id v11 = v10;
  id v14 = v11;
  [(MANode *)self enumerateEdgesOfType:a3 withLabel:v9 domain:v5 usingBlock:v13];

  return v11;
}

uint64_t __39__MANode_edgesOfType_withLabel_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withLabel:(id)a4 domain:(unsigned __int16)a5 usingBlock:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(MAElementFilter *)[MAEdgeFilter alloc] initWithLabel:v11 domain:v6];

  [(MANodeImplementationProtocol *)self->_implementation enumerateEdgesOfType:a3 matchingFilter:v12 usingBlock:v10];
}

- (id)anyEdgeWithNode:(id)a3
{
  return [(MANode *)self anyEdgeOfType:3 withNode:a3];
}

- (id)anyEdgeFromNode:(id)a3
{
  return [(MANode *)self anyEdgeOfType:1 withNode:a3];
}

- (id)anyEdgeTowardNode:(id)a3
{
  return [(MANode *)self anyEdgeOfType:2 withNode:a3];
}

- (id)edgesWithNode:(id)a3
{
  return [(MANode *)self edgesOfType:3 withNode:a3];
}

- (id)edgesFromNode:(id)a3
{
  return [(MANode *)self edgesOfType:1 withNode:a3];
}

- (id)edgesTowardNode:(id)a3
{
  return [(MANode *)self edgesOfType:2 withNode:a3];
}

- (id)anyEdgeOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2781;
  id v14 = __Block_byref_object_dispose__2782;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__MANode_anyEdgeOfType_withNode___block_invoke;
  v9[3] = &unk_1E68DC9D0;
  v9[4] = &v10;
  [(MANode *)self enumerateEdgesOfType:a3 withNode:v6 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __33__MANode_anyEdgeOfType_withNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)edgesOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__MANode_edgesOfType_withNode___block_invoke;
  v11[3] = &unk_1E68DCA20;
  id v9 = v8;
  id v12 = v9;
  [(MANode *)self enumerateEdgesOfType:a3 withNode:v7 usingBlock:v11];

  return v9;
}

uint64_t __31__MANode_edgesOfType_withNode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5
{
}

- (BOOL)hasEdgeWithNode:(id)a3
{
  return [(MANodeImplementationProtocol *)self->_implementation hasEdgeOfType:3 withNode:a3];
}

- (BOOL)hasEdgeFromNode:(id)a3
{
  return [(MANodeImplementationProtocol *)self->_implementation hasEdgeOfType:1 withNode:a3];
}

- (BOOL)hasEdgeTowardNode:(id)a3
{
  return [(MANodeImplementationProtocol *)self->_implementation hasEdgeOfType:2 withNode:a3];
}

- (unint64_t)outEdgesCount
{
  implementation = self->_implementation;
  id v3 = +[MAElementFilter any];
  unint64_t v4 = [(MANodeImplementationProtocol *)implementation countOfEdgesOfType:2 matchingFilter:v3];

  return v4;
}

- (unint64_t)inEdgesCount
{
  implementation = self->_implementation;
  id v3 = +[MAElementFilter any];
  unint64_t v4 = [(MANodeImplementationProtocol *)implementation countOfEdgesOfType:1 matchingFilter:v3];

  return v4;
}

- (unint64_t)edgesCount
{
  implementation = self->_implementation;
  id v3 = +[MAElementFilter any];
  unint64_t v4 = [(MANodeImplementationProtocol *)implementation countOfEdgesOfType:3 matchingFilter:v3];

  return v4;
}

- (BOOL)isUnique
{
  id v3 = [(MAGraphReference *)self->_graphReference concreteGraph];
  if (v3)
  {
    unint64_t v4 = [(MANode *)self label];
    uint64_t v5 = [(MANode *)self domain];
    id v6 = [(MANode *)self propertyDictionary];
    id v7 = [v3 nodesForLabel:v4 domain:v5 properties:v6];
    BOOL v8 = [v7 count] == 1;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)isOrphan
{
  return [(MANode *)self edgesCount] == 0;
}

- (id)changingPropertiesWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MANode *)self properties];
  char v6 = [v5 isEqual:v4];
  id v7 = (id)MEMORY[0x1E4F1CC08];
  if ((v6 & 1) == 0)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__2781;
    id v17 = __Block_byref_object_dispose__2782;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__MANode_changingPropertiesWithProperties___block_invoke;
    v10[3] = &unk_1E68DBAC8;
    id v11 = v5;
    id v12 = &v13;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    BOOL v8 = (void *)v14[5];
    if (!v8) {
      BOOL v8 = v7;
    }
    id v7 = v8;

    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

void __43__MANode_changingPropertiesWithProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  char v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  id v7 = v6;
  if (v6 && ([v6 isEqual:v5] & 1) == 0)
  {
    BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v8 setObject:v5 forKeyedSubscript:v12];
  }
}

- (id)propertyDictionary
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyKeys
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)propertiesCount
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)hasProperties
{
  KGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MANode *)self propertyDictionary];
  [v5 enumerateKeysAndObjectsUsingBlock:v4];
}

- (id)propertyForKey:(id)a3 kindOfClass:(Class)a4
{
  id v4 = [(MANode *)self propertyForKey:a3];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(MANode *)v5 propertyDictionary];
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    unint64_t v6 = [v5 count];
    if (v6 <= [(MANode *)self propertiesCount])
    {
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 1;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __24__MANode_hasProperties___block_invoke;
      v9[3] = &unk_1E68DC178;
      v9[4] = self;
      void v9[5] = &v10;
      [v5 enumerateKeysAndObjectsUsingBlock:v9];
      BOOL v7 = *((unsigned char *)v11 + 24) != 0;
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void __24__MANode_hasProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  BOOL v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 propertyForKey:a2];
  LOBYTE(v7) = [v9 isEqual:v8];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v7;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)matchesNode:(id)a3 includingProperties:(BOOL)a4
{
  id v7 = a3;
  id v8 = [v7 label];
  int v9 = [v7 domain];
  char v10 = [v8 isEqualToString:@"*"];
  if ((v10 & 1) == 0)
  {
    id v4 = [(MANode *)self label];
    if (![v4 isEqualToString:v8])
    {
      BOOL v11 = 0;
      goto LABEL_14;
    }
  }
  if (v9)
  {
    BOOL v11 = [(MANode *)self domain] == v9;
    if (!v11 || !a4)
    {
LABEL_10:
      if (v10) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_9:
    uint64_t v12 = [v7 propertyDictionary];
    BOOL v11 = [(MANode *)self hasProperties:v12];

    goto LABEL_10;
  }
  if (a4) {
    goto LABEL_9;
  }
  BOOL v11 = 1;
  if ((v10 & 1) == 0) {
LABEL_14:
  }

LABEL_15:
  return v11;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (MANode *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v10 = 1;
    goto LABEL_12;
  }
  int v6 = [(MANode *)self domain];
  if (v6 == [(MANode *)v5 domain]
    && ([(MANode *)self weight], float v8 = v7, [(MANode *)v5 weight], v8 == v9))
  {
    BOOL v11 = [(MANode *)self label];
    uint64_t v12 = [(MANode *)v5 label];
    BOOL v10 = (v11 == v12 || [v11 isEqualToString:v12])
       && [(MANode *)self hasEqualPropertiesToNode:v5];
  }
  else
  {
LABEL_5:
    BOOL v10 = 0;
  }
LABEL_12:

  return v10;
}

- (BOOL)isSameNodeAsNode:(id)a3
{
  id v4 = (MANode *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    int v6 = [(MANode *)v4 graphReference];
    float v7 = [(MANode *)self graphReference];
    if (v6 == v7)
    {
      uint64_t v9 = [(MANode *)v5 identifier];
      BOOL v8 = v9 == [(MANode *)self identifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)hasEqualPropertiesToNode:(id)a3
{
  id v4 = a3;
  id v5 = [(MANode *)self propertyDictionary];
  int v6 = [v4 propertyDictionary];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MAGraphReference *)self->_graphReference hash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_identifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MANode *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_13;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    float v7 = v4;
    BOOL v8 = v7;
    unint64_t identifier = self->_identifier;
    if (identifier == 0x7FFFFFFFFFFFFFFFLL && v7->_identifier == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
    if (self->_graphReference != v7->_graphReference)
    {
      BOOL v10 = [(MANode *)self graph];
      BOOL v11 = [(MANode *)v8 graph];

      if (v10 != v11)
      {
LABEL_9:
        BOOL v6 = [(MANode *)self isEqualToNode:v8];
LABEL_12:

        goto LABEL_13;
      }
      unint64_t identifier = self->_identifier;
    }
    BOOL v6 = identifier == v8->_identifier;
    goto LABEL_12;
  }
  BOOL v6 = 0;
LABEL_13:

  return v6;
}

- (void)resolveIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (NSDictionary)properties
{
  unint64_t v3 = [(MANode *)self propertyDictionary];
  [(MANode *)self weight];
  uint64_t v5 = +[MAKGWeightConversion kgPropertiesForMAProperties:weight:](v4, (uint64_t)MAKGWeightConversion, v3);

  return (NSDictionary *)v5;
}

- (NSSet)labels
{
  unint64_t v3 = [(MANode *)self graphReference];
  float v4 = [v3 concreteGraph];
  uint64_t v5 = [(MANode *)self label];
  BOOL v6 = objc_msgSend(v4, "labelsForLabel:domain:", v5, -[MANode domain](self, "domain"));

  return (NSSet *)v6;
}

- (MANode)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  unsigned __int16 v17 = 1;
  id v16 = 0;
  id v8 = a5;
  MALabelAndDomainFromKGLabels(a4, &v16, &v17);
  id v9 = v16;
  int v15 = 0;
  uint64_t v14 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:v8 maProperties:&v14 maWeight:&v15];

  LODWORD(v10) = v15;
  BOOL v11 = [(MANode *)self initWithLabel:v9 domain:v17 weight:v14 properties:v10];
  uint64_t v12 = v11;
  if (v11) {
    [(MANode *)v11 setIdentifier:a3];
  }

  return v12;
}

- (id)shortDescription
{
  unint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)MANode;
  float v4 = [(MANode *)&v12 description];
  unint64_t identifier = self->_identifier;
  [(MANode *)self weight];
  double v7 = v6;
  id v8 = [(MANode *)self label];
  id v9 = [v3 stringWithFormat:@"[%@] id:[%lu] weight:[%f] label:[%@]", v4, identifier, *(void *)&v7, v8];

  double v10 = [NSString stringWithFormat:@"%@ edgesCount:[%ld] inEdgesCount:[%ld] outEdgesCount:[%ld]", v9, -[MANode edgesCount](self, "edgesCount"), -[MANode inEdgesCount](self, "inEdgesCount"), -[MANode outEdgesCount](self, "outEdgesCount")];

  return v10;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  float v4 = [(MANode *)self shortDescription];
  uint64_t v5 = [(MANode *)self visualString];
  float v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (MAGraphProxy)graph
{
  return [(MAGraphReference *)self->_graphReference graph];
}

- (void)setGraphReference:(id)a3
{
  uint64_t v5 = (MAGraphReference *)a3;
  if (self->_graphReference != v5)
  {
    id v9 = v5;
    float v6 = [(MAGraphReference *)v5 concreteGraph];
    double v7 = (MANodeImplementationProtocol *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "nodeClass")), "initWithNode:", self);
    implementation = self->_implementation;
    self->_implementation = v7;

    objc_storeStrong((id *)&self->_graphReference, a3);
    uint64_t v5 = v9;
  }
}

- (MANode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  KGMethodNotImplentedException(self, a2);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v11);
}

- (MANode)init
{
  v3.receiver = self;
  v3.super_class = (Class)MANode;
  return [(MANode *)&v3 init];
}

- (BOOL)conformsToNodeSchema:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MANode_Schema__conformsToNodeSchema___block_invoke;
  v7[3] = &unk_1E68DC150;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(MANode *)self enumerateEdgesUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __39__MANode_Schema__conformsToNodeSchema___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  float v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__MANode_Schema__conformsToNodeSchema___block_invoke_2;
  v8[3] = &unk_1E68DC150;
  id v7 = v5;
  id v9 = v7;
  uint64_t v10 = &v11;
  [v6 enumerateEdgesUsingBlock:v8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *((unsigned char *)v12 + 24);
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;

  _Block_object_dispose(&v11, 8);
}

void __39__MANode_Schema__conformsToNodeSchema___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (elementMatchesDefinition(v5, *(void **)(a1 + 32)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) conformsToEdgeSchema:v5];
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

@end