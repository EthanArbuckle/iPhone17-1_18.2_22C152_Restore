@interface MAEdge
- (BOOL)conformsToEdgeSchema:(id)a3;
- (BOOL)hasEqualPropertiesToEdge:(id)a3;
- (BOOL)hasProperties;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEdge:(id)a3;
- (BOOL)isLoop;
- (BOOL)isSameEdgeAsEdge:(id)a3;
- (BOOL)isUnique;
- (MAEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7;
- (MAEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (MAEdge)initWithSourceNode:(id)a3 targetNode:(id)a4;
- (MAGraphProxy)graph;
- (MAGraphReference)graphReference;
- (MANode)sourceNode;
- (MANode)targetNode;
- (NSDictionary)properties;
- (NSSet)labels;
- (NSString)description;
- (id)commonNode:(id)a3;
- (id)oppositeNode:(id)a3;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)propertyForKey:(id)a3 kindOfClass:(Class)a4;
- (id)propertyKeys;
- (id)shortDescription;
- (id)visualString;
- (id)visualStringWithName:(id)a3;
- (id)visualStringWithName:(id)a3 andPropertyKeys:(id)a4;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)propertiesCount;
- (void)enumeratePropertiesUsingBlock:(id)a3;
- (void)resolveIdentifier:(unint64_t)a3;
- (void)setGraphReference:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
@end

@implementation MAEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
}

- (MANode)targetNode
{
  return self->_targetNode;
}

- (MANode)sourceNode
{
  return self->_sourceNode;
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

- (id)visualStringWithName:(id)a3 andPropertyKeys:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F28E78];
  id v8 = a4;
  v9 = [v7 string];
  [v9 appendString:@"["];
  if (v6) {
    [v9 appendString:v6];
  }
  v10 = [(MAEdge *)self label];

  if (v10)
  {
    v11 = [(MAEdge *)self label];
    [v9 appendFormat:@":%@", v11];
  }
  else
  {
    [v9 appendFormat:@":"];
  }
  if ([(MAEdge *)self domain] && [(MAEdge *)self domain] != 1) {
    objc_msgSend(v9, "appendFormat:", @":%lu", -[MAEdge domain](self, "domain"));
  }
  v12 = [(MAEdge *)self propertyDictionary];
  v13 = PropertiesVisualStringForKeys(v8, v12);

  if ((unint64_t)[v13 length] >= 3) {
    [v9 appendFormat:@" %@", v13];
  }
  [v9 appendString:@"]"];

  return v9;
}

- (id)visualStringWithName:(id)a3
{
  return [(MAEdge *)self visualStringWithName:a3 andPropertyKeys:0];
}

- (id)visualString
{
  return [(MAEdge *)self visualStringWithName:0];
}

- (BOOL)isLoop
{
  v2 = self;
  v3 = [(MAEdge *)self sourceNode];
  v4 = [(MAEdge *)v2 targetNode];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (id)commonNode:(id)a3
{
  id v4 = a3;
  v5 = [(MAEdge *)self sourceNode];
  id v6 = [(MAEdge *)self targetNode];
  v7 = [v4 sourceNode];
  id v8 = [v4 targetNode];

  char v9 = [v5 isEqual:v7];
  v10 = v5;
  if ((v9 & 1) != 0
    || (char v11 = [v5 isEqual:v8], v10 = v5, (v11 & 1) != 0)
    || (char v12 = [v6 isEqual:v7], v10 = v6, (v12 & 1) != 0)
    || (int v13 = [v6 isEqual:v8], v10 = v6, v13))
  {
    id v14 = v10;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)oppositeNode:(id)a3
{
  id v4 = a3;
  v5 = [(MAEdge *)self sourceNode];
  id v6 = [(MAEdge *)self targetNode];
  char v7 = [v4 isSameNodeAsNode:v5];
  id v8 = v6;
  if ((v7 & 1) != 0 || (v9 = [v4 isSameNodeAsNode:v6], id v8 = v5, v9)) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)propertyDictionary
{
  KGMethodNotImplentedException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyKeys
{
  KGMethodNotImplentedException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)propertiesCount
{
  KGMethodNotImplentedException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)hasProperties
{
  KGMethodNotImplentedException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MAEdge *)self propertyDictionary];
  [v5 enumerateKeysAndObjectsUsingBlock:v4];
}

- (id)propertyForKey:(id)a3 kindOfClass:(Class)a4
{
  id v4 = [(MAEdge *)self propertyForKey:a3];
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
  id v6 = [(MAEdge *)v5 propertyDictionary];
  char v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    id v8 = 0;
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
    if (v6 <= [(MAEdge *)self propertiesCount])
    {
      uint64_t v10 = 0;
      char v11 = &v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 1;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __24__MAEdge_hasProperties___block_invoke;
      v9[3] = &unk_1E68DC178;
      v9[4] = self;
      v9[5] = &v10;
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

void __24__MAEdge_hasProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  BOOL v7 = *(void **)(a1 + 32);
  id v8 = a3;
  int v9 = [v7 propertyForKey:a2];
  LOBYTE(v7) = [v9 isEqual:v8];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v7;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)isUnique
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v3 = [(MAGraphReference *)self->_graphReference concreteGraph];
  if (v3)
  {
    id v4 = [(MAEdge *)self sourceNode];
    id v5 = [(MAEdge *)self label];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __18__MAEdge_isUnique__block_invoke;
    v8[3] = &unk_1E68DC150;
    v8[4] = self;
    v8[5] = &v9;
    [v4 enumerateEdgesWithLabel:v5 domain:0 usingBlock:v8];
  }
  char v6 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __18__MAEdge_isUnique__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (([v5 isSameEdgeAsEdge:*(void *)(a1 + 32)] & 1) == 0
    && [v5 isEqualToEdge:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)isEqualToEdge:(id)a3
{
  id v4 = a3;
  if (v4
    && (int v5 = -[MAEdge domain](self, "domain"), v5 == [v4 domain])
    && (-[MAEdge weight](self, "weight"), float v7 = v6, [v4 weight], v7 == v8))
  {
    uint64_t v11 = [(MAEdge *)self label];
    char v12 = [v4 label];
    if ((v11 == v12 || [v11 isEqualToString:v12])
      && [(MAEdge *)self hasEqualPropertiesToEdge:v4])
    {
      char v13 = [(MAEdge *)self sourceNode];
      id v14 = [(MAEdge *)self targetNode];
      v15 = [v4 sourceNode];
      v16 = [v4 targetNode];
      BOOL v9 = (v13 == v15 || [v13 isEqualToNode:v15])
        && (v14 == v16 || ([v14 isEqualToNode:v16] & 1) != 0);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)hasEqualPropertiesToEdge:(id)a3
{
  id v4 = a3;
  int v5 = [(MAEdge *)self propertyDictionary];
  float v6 = [v4 propertyDictionary];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (BOOL)isSameEdgeAsEdge:(id)a3
{
  id v4 = (MAEdge *)a3;
  int v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    float v6 = [(MAEdge *)v4 graphReference];
    float v7 = [(MAEdge *)self graphReference];
    if (v6 == v7)
    {
      uint64_t v9 = [(MAEdge *)v5 identifier];
      BOOL v8 = v9 == [(MAEdge *)self identifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
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
  id v4 = (MAEdge *)a3;
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
      uint64_t v10 = [(MAEdge *)self graph];
      uint64_t v11 = [(MAEdge *)v8 graph];

      if (v10 != v11)
      {
LABEL_9:
        BOOL v6 = [(MAEdge *)self isEqualToEdge:v8];
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
  unint64_t v3 = [(MAEdge *)self propertyDictionary];
  [(MAEdge *)self weight];
  uint64_t v5 = +[MAKGWeightConversion kgPropertiesForMAProperties:weight:](v4, (uint64_t)MAKGWeightConversion, v3);

  return (NSDictionary *)v5;
}

- (NSSet)labels
{
  unint64_t v3 = [(MAEdge *)self graphReference];
  float v4 = [v3 concreteGraph];
  uint64_t v5 = [(MAEdge *)self label];
  BOOL v6 = objc_msgSend(v4, "labelsForLabel:domain:", v5, -[MAEdge domain](self, "domain"));

  return (NSSet *)v6;
}

- (MAEdge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  unsigned __int16 v22 = 1;
  id v21 = 0;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  MALabelAndDomainFromKGLabels(a4, &v21, &v22);
  id v15 = v21;
  int v20 = 0;
  uint64_t v19 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:v14 maProperties:&v19 maWeight:&v20];

  LODWORD(v16) = v20;
  v17 = [(MAEdge *)self initWithLabel:v15 sourceNode:v13 targetNode:v12 domain:v22 weight:v19 properties:v16];

  if (v17) {
    [(MAEdge *)v17 setIdentifier:a3];
  }

  return v17;
}

- (id)shortDescription
{
  unint64_t v3 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)MAEdge;
  float v4 = [(MAEdge *)&v17 description];
  unint64_t identifier = self->_identifier;
  [(MAEdge *)self weight];
  double v7 = v6;
  BOOL v8 = [(MAEdge *)self label];
  uint64_t v9 = [v3 stringWithFormat:@"[%@] id:[%lu] weight:[%f] label:[%@]", v4, identifier, *(void *)&v7, v8];

  uint64_t v10 = NSString;
  uint64_t v11 = [(MAEdge *)self sourceNode];
  id v12 = [v11 shortDescription];
  id v13 = [(MAEdge *)self targetNode];
  id v14 = [v13 shortDescription];
  id v15 = [v10 stringWithFormat:@"%@\n\t\tsourceNode:%@\n\t\ttargetNode:%@", v9, v12, v14];

  return v15;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)MAEdge;
  float v4 = [(MAEdge *)&v16 description];
  unint64_t identifier = self->_identifier;
  [(MAEdge *)self weight];
  double v7 = v6;
  BOOL v8 = [(MAEdge *)self label];
  uint64_t v9 = [v3 stringWithFormat:@"[%@] id:[%lu] weight:[%f] label:[%@]", v4, identifier, *(void *)&v7, v8];

  uint64_t v10 = NSString;
  uint64_t v11 = [(MAEdge *)self visualString];
  id v12 = [(MAEdge *)self sourceNode];
  id v13 = [(MAEdge *)self targetNode];
  id v14 = [v10 stringWithFormat:@"%@ %@\n\t\tsourceNode:%@\n\t\ttargetNode:%@", v9, v11, v12, v13];

  return (NSString *)v14;
}

- (void)setGraphReference:(id)a3
{
  uint64_t v5 = (MAGraphReference *)a3;
  p_graphReference = &self->_graphReference;
  if (self->_graphReference != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)p_graphReference, a3);
    if (v9)
    {
      double v7 = [(MAEdge *)self sourceNode];
      [v7 setGraphReference:v9];

      BOOL v8 = [(MAEdge *)self targetNode];
      [v8 setGraphReference:v9];
    }
  }
  MEMORY[0x1F4181820](p_graphReference);
}

- (MAGraphProxy)graph
{
  return [(MAGraphReference *)self->_graphReference graph];
}

- (MAEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  KGMethodNotImplentedException(self, a2);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v17);
}

- (MAEdge)initWithSourceNode:(id)a3 targetNode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MAEdge;
  uint64_t v9 = [(MAEdge *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceNode, a3);
    objc_storeStrong((id *)&v10->_targetNode, a4);
  }

  return v10;
}

- (BOOL)conformsToEdgeSchema:(id)a3
{
  id v4 = a3;
  char v5 = elementMatchesDefinition(v4, self);
  float v6 = [v4 sourceNode];
  id v7 = [(MAEdge *)self sourceNode];
  char v8 = v5 & elementMatchesDefinition(v6, v7);

  uint64_t v9 = [v4 targetNode];

  uint64_t v10 = [(MAEdge *)self targetNode];
  LOBYTE(v4) = v8 & elementMatchesDefinition(v9, v10);

  return (char)v4;
}

@end