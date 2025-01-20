@interface SKTileGroup
+ (BOOL)supportsSecureCoding;
+ (SKTileGroup)emptyTileGroup;
+ (SKTileGroup)tileGroupWithRules:(NSArray *)rules;
+ (SKTileGroup)tileGroupWithTileDefinition:(SKTileDefinition *)tileDefinition;
- (BOOL)isEqualToNode:(id)a3;
- (NSArray)rules;
- (NSString)name;
- (SKTileGroup)initWithCoder:(id)a3;
- (SKTileGroup)initWithRules:(NSArray *)rules;
- (SKTileGroup)initWithTileDefinition:(SKTileDefinition *)tileDefinition;
- (SKTileSet)parentSet;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)findTileDefinitionIDsForAdjacencyData:(unint64_t)a3 tileSetType:(unint64_t)a4;
- (unint64_t)findTileDefinitionIndexForAdjacencyData:(unint64_t)a3 tileSetType:(unint64_t)a4;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(NSString *)name;
- (void)setParentSet:(id)a3;
- (void)setRuleParentPointers;
- (void)setRules:(NSArray *)rules;
- (void)setType:(unint64_t)a3;
@end

@implementation SKTileGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)rules
{
  return (NSArray *)self->_rules;
}

- (void)setRules:(NSArray *)rules
{
  v4 = [MEMORY[0x263EFF980] arrayWithArray:rules];
  v5 = self->_rules;
  self->_rules = v4;

  [(SKTileGroup *)self setRuleParentPointers];
}

- (void)setRuleParentPointers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_rules;
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
          objc_msgSend(v8, "setParentGroup:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (SKTileGroup)initWithCoder:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKTileGroup;
  uint64_t v5 = [(SKTileGroup *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_rules"];
    rules = v5->_rules;
    v5->_rules = (NSMutableArray *)v9;

    long long v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    [(SKTileGroup *)v5 setName:v11];

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    [(SKTileGroup *)v5 setRuleParentPointers];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rules = self->_rules;
  id v6 = a3;
  [v6 encodeObject:rules forKey:@"_rules"];
  uint64_t v5 = [(SKTileGroup *)self name];
  [v6 encodeObject:v5 forKey:@"_name"];

  [v6 encodeInteger:self->_type forKey:@"_type"];
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKTileGroup *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    uint64_t v7 = [(SKTileGroup *)self name];
    if (v7)
    {
    }
    else
    {
      uint64_t v9 = [v6 name];

      if (!v9)
      {
LABEL_7:
        if (![(NSMutableArray *)self->_rules count])
        {
LABEL_12:
          unint64_t type = self->_type;
          BOOL v8 = type == [v6 type];
LABEL_14:

          goto LABEL_15;
        }
        unint64_t v13 = 0;
        while ([v6[1] count] > v13)
        {
          uint64_t v14 = [(NSMutableArray *)self->_rules objectAtIndexedSubscript:v13];
          v15 = [v6[1] objectAtIndexedSubscript:v13];
          char v16 = [v14 isEqualToNode:v15];

          if ((v16 & 1) == 0) {
            break;
          }
          if ([(NSMutableArray *)self->_rules count] <= ++v13) {
            goto LABEL_12;
          }
        }
LABEL_13:
        BOOL v8 = 0;
        goto LABEL_14;
      }
    }
    long long v10 = [(SKTileGroup *)self name];
    long long v11 = [v6 name];
    int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  BOOL v8 = 1;
LABEL_15:

  return v8;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKTileGroup *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(SKTileGroup *)self rules];
    [v4 setRules:v5];

    id v6 = [(SKTileGroup *)self name];
    [v4 setName:v6];

    objc_msgSend(v4, "setType:", -[SKTileGroup type](self, "type"));
  }
  return v4;
}

- (SKTileGroup)initWithTileDefinition:(SKTileDefinition *)tileDefinition
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = tileDefinition;
  v11.receiver = self;
  v11.super_class = (Class)SKTileGroup;
  uint64_t v5 = [(SKTileGroup *)&v11 init];
  if (v5)
  {
    v12[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v7 = +[SKTileGroupRule tileGroupRuleWithAdjacency:255 tileDefinitions:v6];

    uint64_t v8 = [MEMORY[0x263EFF980] arrayWithObject:v7];
    rules = v5->_rules;
    v5->_rules = (NSMutableArray *)v8;

    [(SKTileGroup *)v5 setName:0];
    [(SKTileGroup *)v5 setType:0];
    [(SKTileGroup *)v5 setRuleParentPointers];
  }
  return v5;
}

- (SKTileGroup)initWithRules:(NSArray *)rules
{
  id v4 = rules;
  v8.receiver = self;
  v8.super_class = (Class)SKTileGroup;
  uint64_t v5 = [(SKTileGroup *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(SKTileGroup *)v5 setRules:v4];
    [(SKTileGroup *)v6 setName:0];
    [(SKTileGroup *)v6 setType:0];
  }

  return v6;
}

+ (SKTileGroup)tileGroupWithTileDefinition:(SKTileDefinition *)tileDefinition
{
  uint64_t v3 = tileDefinition;
  id v4 = [[SKTileGroup alloc] initWithTileDefinition:v3];

  return v4;
}

+ (SKTileGroup)tileGroupWithRules:(NSArray *)rules
{
  uint64_t v3 = rules;
  id v4 = [[SKTileGroup alloc] initWithRules:v3];

  return v4;
}

+ (SKTileGroup)emptyTileGroup
{
  return +[SKTileGroup tileGroupWithRules:MEMORY[0x263EFFA68]];
}

- (unint64_t)findTileDefinitionIndexForAdjacencyData:(unint64_t)a3 tileSetType:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_rules count])
  {
    if (a4 > 1)
    {
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      long long v25 = 0uLL;
      long long v26 = 0uLL;
      uint64_t v7 = self->_rules;
      uint64_t v18 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
LABEL_23:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
          if (objc_msgSend(v12, "adjacency", (void)v25) == a3) {
            goto LABEL_31;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
            unint64_t v17 = -1;
            if (v19) {
              goto LABEL_23;
            }
            goto LABEL_32;
          }
        }
      }
    }
    else
    {
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      uint64_t v7 = self->_rules;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
LABEL_5:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
          if ((([v12 adjacency] ^ a3) & 0x55) == 0)
          {
            char v13 = [v12 adjacency];
            if ((a3 & 2) != 0 || (v13 & 2) == 0)
            {
              char v14 = [v12 adjacency];
              if ((a3 & 8) != 0 || (v14 & 8) == 0)
              {
                char v15 = [v12 adjacency];
                if ((a3 & 0x20) != 0 || (v15 & 0x20) == 0)
                {
                  char v16 = [v12 adjacency];
                  if ((a3 & 0x80) != 0 || (v16 & 0x80) == 0) {
                    break;
                  }
                }
              }
            }
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v9) {
              goto LABEL_5;
            }
            goto LABEL_30;
          }
        }
LABEL_31:
        v22 = [v12 tileDefinitionIDs];
        v23 = [v22 firstObject];
        unint64_t v17 = [v23 integerValue];

        goto LABEL_32;
      }
    }
LABEL_30:
    unint64_t v17 = -1;
LABEL_32:

    return v17;
  }
  return -1;
}

- (id)findTileDefinitionIDsForAdjacencyData:(unint64_t)a3 tileSetType:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (![(NSMutableArray *)self->_rules count])
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_33;
  }
  if (a4 > 1)
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    uint64_t v7 = self->_rules;
    uint64_t v18 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      uint64_t v11 = (void *)MEMORY[0x263EFFA68];
LABEL_23:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v7);
        }
        char v13 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
        if (objc_msgSend(v13, "adjacency", (void)v23) == a3) {
          goto LABEL_30;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v19) {
            goto LABEL_23;
          }
          goto LABEL_32;
        }
      }
    }
LABEL_31:
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_32;
  }
  long long v29 = 0uLL;
  long long v30 = 0uLL;
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  uint64_t v7 = self->_rules;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (!v8) {
    goto LABEL_31;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v28;
  uint64_t v11 = (void *)MEMORY[0x263EFFA68];
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v28 != v10) {
      objc_enumerationMutation(v7);
    }
    char v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
    if ((([v13 adjacency] ^ a3) & 0x55) == 0)
    {
      char v14 = [v13 adjacency];
      if ((a3 & 2) != 0 || (v14 & 2) == 0)
      {
        char v15 = [v13 adjacency];
        if ((a3 & 8) != 0 || (v15 & 8) == 0)
        {
          char v16 = [v13 adjacency];
          if ((a3 & 0x20) != 0 || (v16 & 0x20) == 0)
          {
            char v17 = [v13 adjacency];
            if ((a3 & 0x80) != 0 || (v17 & 0x80) == 0) {
              break;
            }
          }
        }
      }
    }
    if (v9 == ++v12)
    {
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_32;
    }
  }
LABEL_30:
  uint64_t v11 = [v13 tileDefinitionIDs];
LABEL_32:

LABEL_33:

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (SKTileSet)parentSet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSet);

  return (SKTileSet *)WeakRetained;
}

- (void)setParentSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSet);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_rules, 0);
}

@end