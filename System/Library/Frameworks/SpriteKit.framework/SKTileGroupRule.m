@interface SKTileGroupRule
+ (BOOL)supportsSecureCoding;
+ (SKTileGroupRule)tileGroupRuleWithAdjacency:(SKTileAdjacencyMask)adjacency tileDefinitions:(NSArray *)tileDefinitions;
- (BOOL)isEqualToNode:(id)a3;
- (NSArray)tileDefinitionIDs;
- (NSArray)tileDefinitions;
- (NSString)name;
- (SKTileAdjacencyMask)adjacency;
- (SKTileGroup)parentGroup;
- (SKTileGroupRule)initWithAdjacency:(SKTileAdjacencyMask)adjacency tileDefinitions:(NSArray *)tileDefinitions;
- (SKTileGroupRule)initWithCoder:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)calcTileDefinitionIDsWithTileSet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjacency:(SKTileAdjacencyMask)adjacency;
- (void)setName:(NSString *)name;
- (void)setParentGroup:(id)a3;
- (void)setTileDefinitionIDs:(id)a3;
- (void)setTileDefinitionParentPointers;
- (void)setTileDefinitions:(NSArray *)tileDefinitions;
- (void)setTileDefinitionsFromIDsWithTileSet:(id)a3;
@end

@implementation SKTileGroupRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKTileAdjacencyMask)adjacency
{
  return self->_adjacency;
}

- (void)setAdjacency:(SKTileAdjacencyMask)adjacency
{
  self->_adjacency = adjacency;
}

- (NSArray)tileDefinitions
{
  return (NSArray *)self->_tileDefinitions;
}

- (void)setTileDefinitions:(NSArray *)tileDefinitions
{
  v4 = [MEMORY[0x263EFF980] arrayWithArray:tileDefinitions];
  v5 = self->_tileDefinitions;
  self->_tileDefinitions = v4;

  [(SKTileGroupRule *)self setTileDefinitionParentPointers];
}

- (NSArray)tileDefinitionIDs
{
  return (NSArray *)self->_tileDefinitionIDs;
}

- (void)setTileDefinitionIDs:(id)a3
{
  v4 = [MEMORY[0x263EFF980] arrayWithArray:a3];
  tileDefinitionIDs = self->_tileDefinitionIDs;
  self->_tileDefinitionIDs = v4;
}

- (void)setTileDefinitionParentPointers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_tileDefinitions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (v8) {
          objc_msgSend(v8, "setParentRule:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (SKTileGroupRule)initWithCoder:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKTileGroupRule;
  uint64_t v5 = [(SKTileGroupRule *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_tileDefinitions"];
    tileDefinitions = v5->_tileDefinitions;
    v5->_tileDefinitions = (NSMutableArray *)v9;

    v5->_adjacency = [v4 decodeInt32ForKey:@"_adjacency"];
    long long v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    [(SKTileGroupRule *)v5 setName:v11];

    [(SKTileGroupRule *)v5 setTileDefinitionParentPointers];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tileDefinitions = self->_tileDefinitions;
  id v5 = a3;
  [v5 encodeObject:tileDefinitions forKey:@"_tileDefinitions"];
  [v5 encodeInt32:self->_adjacency forKey:@"_adjacency"];
  id v6 = [(SKTileGroupRule *)self name];
  [v5 encodeObject:v6 forKey:@"_name"];
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKTileGroupRule *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if ([(NSMutableArray *)self->_tileDefinitions count])
    {
      unint64_t v7 = 0;
      while ([(NSMutableArray *)v6->_tileDefinitions count] > v7)
      {
        v8 = [(NSMutableArray *)self->_tileDefinitions objectAtIndexedSubscript:v7];
        uint64_t v9 = [(NSMutableArray *)v6->_tileDefinitions objectAtIndexedSubscript:v7];
        char v10 = [v8 isEqualToNode:v9];

        if ((v10 & 1) == 0) {
          break;
        }
        if ([(NSMutableArray *)self->_tileDefinitions count] <= ++v7) {
          goto LABEL_7;
        }
      }
      goto LABEL_13;
    }
LABEL_7:
    long long v11 = [(SKTileGroupRule *)self name];
    if (v11)
    {
    }
    else
    {
      objc_super v13 = [(SKTileGroupRule *)v6 name];

      if (!v13) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = [(SKTileGroupRule *)self name];
    v15 = [(SKTileGroupRule *)v6 name];
    int v16 = [v14 isEqualToString:v15];

    if (!v16)
    {
LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = self->_adjacency == v6->_adjacency;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKTileGroupRule *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setAdjacency:", -[SKTileGroupRule adjacency](self, "adjacency"));
    id v5 = [(SKTileGroupRule *)self tileDefinitions];
    [v4 setTileDefinitions:v5];

    id v6 = [(SKTileGroupRule *)self tileDefinitionIDs];
    [v4 setTileDefinitionIDs:v6];
  }
  return v4;
}

- (SKTileGroupRule)initWithAdjacency:(SKTileAdjacencyMask)adjacency tileDefinitions:(NSArray *)tileDefinitions
{
  unsigned __int8 v4 = adjacency;
  id v6 = tileDefinitions;
  v11.receiver = self;
  v11.super_class = (Class)SKTileGroupRule;
  unint64_t v7 = [(SKTileGroupRule *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_adjacency = v4;
    [(SKTileGroupRule *)v7 setTileDefinitions:v6];
    tileDefinitionIDs = v8->_tileDefinitionIDs;
    v8->_tileDefinitionIDs = 0;
  }
  return v8;
}

+ (SKTileGroupRule)tileGroupRuleWithAdjacency:(SKTileAdjacencyMask)adjacency tileDefinitions:(NSArray *)tileDefinitions
{
  id v5 = tileDefinitions;
  id v6 = [[SKTileGroupRule alloc] initWithAdjacency:adjacency tileDefinitions:v5];

  return v6;
}

- (void)calcTileDefinitionIDsWithTileSet:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    tileDefinitionIDs = self->_tileDefinitionIDs;
    self->_tileDefinitionIDs = v5;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v7 = self->_tileDefinitions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          if (v12)
          {
            objc_super v13 = self->_tileDefinitionIDs;
            uint64_t v14 = NSNumber;
            v15 = objc_msgSend(v4, "tileDefinitions", (void)v17);
            int v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", v12));
            [(NSMutableArray *)v13 addObject:v16];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
}

- (void)setTileDefinitionsFromIDsWithTileSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    tileDefinitions = self->_tileDefinitions;
    self->_tileDefinitions = v5;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v7 = self->_tileDefinitionIDs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
          if (v12)
          {
            unint64_t v13 = objc_msgSend(v12, "unsignedIntegerValue", (void)v19);
            uint64_t v14 = [v4 tileDefinitions];
            unint64_t v15 = [v14 count];

            if (v15 > v13)
            {
              int v16 = self->_tileDefinitions;
              long long v17 = [v4 tileDefinitions];
              long long v18 = [v17 objectAtIndexedSubscript:v13];
              [(NSMutableArray *)v16 addObject:v18];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [(SKTileGroupRule *)self setTileDefinitionParentPointers];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (SKTileGroup)parentGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentGroup);

  return (SKTileGroup *)WeakRetained;
}

- (void)setParentGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentGroup);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_tileDefinitionIDs, 0);

  objc_storeStrong((id *)&self->_tileDefinitions, 0);
}

@end