@interface SKTileSet
+ (BOOL)supportsSecureCoding;
+ (SKTileSet)tileSetFromURL:(NSURL *)url;
+ (SKTileSet)tileSetNamed:(NSString *)name;
+ (SKTileSet)tileSetWithTileGroups:(NSArray *)tileGroups;
+ (SKTileSet)tileSetWithTileGroups:(NSArray *)tileGroups tileSetType:(SKTileSetType)tileSetType;
+ (id)findTileSetInBundleNamed:(id)a3;
+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4;
+ (void)clearTileSetTableCache;
- (BOOL)isEqualToNode:(id)a3;
- (CGSize)defaultTileSize;
- (NSArray)stamps;
- (NSArray)tileDefinitions;
- (NSArray)tileGroups;
- (NSString)name;
- (SKTileGroup)defaultTileGroup;
- (SKTileSet)init;
- (SKTileSet)initWithCoder:(id)a3;
- (SKTileSet)initWithTileGroups:(NSArray *)tileGroups;
- (SKTileSet)initWithTileGroups:(NSArray *)tileGroups tileSetType:(SKTileSetType)tileSetType;
- (SKTileSetType)type;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)findTileDefinitionForGroup:(id)a3 withGroupAdjacency:(unint64_t *)a4;
- (id)findTileDefinitionsForGroup:(id)a3 withGroupAdjacency:(unint64_t *)a4;
- (id)getCenterTileDefinitionForGroup:(id)a3 withRequiredOutputGroupAdjacency:(unint64_t *)a4;
- (void)calcDefaultTileSize;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)lookForMissingDefinitionsInGroups;
- (void)observeAllTileDefinitions;
- (void)observeTileDefinition:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeTileDefinitionObservers:(id)a3;
- (void)setDefaultTileGroup:(SKTileGroup *)defaultTileGroup;
- (void)setDefaultTileSize:(CGSize)defaultTileSize;
- (void)setGroupParentPointers;
- (void)setName:(NSString *)name;
- (void)setStamps:(id)a3;
- (void)setTileGroups:(NSArray *)tileGroups;
- (void)setType:(SKTileSetType)type;
- (void)unobserveAllTileDefinitions;
- (void)updateTileDefinitionIDsInGroupRules;
@end

@implementation SKTileSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)tileDefinitions
{
  return (NSArray *)self->_definitions;
}

- (NSArray)tileGroups
{
  return (NSArray *)self->_groups;
}

- (void)setTileGroups:(NSArray *)tileGroups
{
  v4 = tileGroups;
  [(SKTileSet *)self unobserveAllTileDefinitions];
  [(NSMutableArray *)self->_definitions removeAllObjects];
  v5 = [MEMORY[0x263EFF980] arrayWithArray:v4];

  groups = self->_groups;
  self->_groups = v5;

  [(SKTileSet *)self lookForMissingDefinitionsInGroups];
  [(SKTileSet *)self updateTileDefinitionIDsInGroupRules];

  [(SKTileSet *)self setGroupParentPointers];
}

- (void)setGroupParentPointers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_groups;
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
          objc_msgSend(v8, "setParentSet:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (SKTileSetType)type
{
  return self->_type;
}

- (void)setType:(SKTileSetType)type
{
  self->_type = type;
}

- (SKTileGroup)defaultTileGroup
{
  return self->_defaultTileGroup;
}

- (void)setDefaultTileGroup:(SKTileGroup *)defaultTileGroup
{
  uint64_t v6 = defaultTileGroup;
  if (-[NSMutableArray containsObject:](self->_groups, "containsObject:")) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = self->_defaultTileGroup;
  self->_defaultTileGroup = v4;
}

- (CGSize)defaultTileSize
{
  double width = self->_defaultTileSize.width;
  double height = self->_defaultTileSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultTileSize:(CGSize)defaultTileSize
{
  self->_defaultTileSize = defaultTileSize;
}

- (NSArray)stamps
{
  return self->_stamps;
}

- (void)setStamps:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithArray:a3];
  stamps = self->_stamps;
  self->_stamps = v4;
}

- (SKTileSet)initWithCoder:(id)a3
{
  v30[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SKTileSet;
  uint64_t v5 = [(SKTileSet *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    definitions = v5->_definitions;
    v5->_definitions = (NSMutableArray *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    long long v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    long long v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_groups"];
    groups = v5->_groups;
    v5->_groups = (NSMutableArray *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    [(SKTileSet *)v5 setName:v13];

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultTileGroup"];
    defaultTileGroup = v5->_defaultTileGroup;
    v5->_defaultTileGroup = (SKTileGroup *)v14;

    if (v5->_defaultTileGroup)
    {
      if ((-[NSMutableArray containsObject:](v5->_groups, "containsObject:") & 1) == 0)
      {
        v16 = v5->_defaultTileGroup;
        v5->_defaultTileGroup = 0;
      }
    }
    else
    {
      unint64_t v17 = [v4 decodeIntegerForKey:@"_defaultTileGroupIndex"];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL && v17 < [(NSMutableArray *)v5->_groups count])
      {
        uint64_t v18 = [(NSMutableArray *)v5->_groups objectAtIndexedSubscript:v17];
        v19 = v5->_defaultTileGroup;
        v5->_defaultTileGroup = (SKTileGroup *)v18;
      }
    }
    v20 = (void *)MEMORY[0x263EFFA08];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"_stamps"];
    stamps = v5->_stamps;
    v5->_stamps = (NSArray *)v23;

    [v4 decodeFloatForKey:@"_defaultTileSize.width"];
    v5->_defaultTileSize.double width = v25;
    [v4 decodeFloatForKey:@"_defaultTileSize.height"];
    v5->_defaultTileSize.double height = v26;
    [(SKTileSet *)v5 lookForMissingDefinitionsInGroups];
    [(SKTileSet *)v5 updateTileDefinitionIDsInGroupRules];
    [(SKTileSet *)v5 setGroupParentPointers];
    [(SKTileSet *)v5 commonInit];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  groups = self->_groups;
  id v8 = a3;
  [v8 encodeObject:groups forKey:@"_groups"];
  uint64_t v5 = [(SKTileSet *)self name];
  [v8 encodeObject:v5 forKey:@"_name"];

  [v8 encodeInteger:self->_type forKey:@"_type"];
  [v8 encodeObject:self->_defaultTileGroup forKey:@"_defaultTileGroup"];
  [v8 encodeObject:self->_stamps forKey:@"_stamps"];
  CGFloat width = self->_defaultTileSize.width;
  *(float *)&CGFloat width = width;
  [v8 encodeFloat:@"_defaultTileSize.width" forKey:width];
  CGFloat height = self->_defaultTileSize.height;
  *(float *)&CGFloat height = height;
  [v8 encodeFloat:@"_defaultTileSize.height" forKey:height];
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKTileSet *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (self->_type != v6->_type) {
      goto LABEL_23;
    }
    uint64_t v7 = [(SKTileSet *)self name];
    if (v7)
    {
    }
    else
    {
      long long v9 = [(SKTileSet *)v6 name];

      if (!v9) {
        goto LABEL_8;
      }
    }
    long long v10 = [(SKTileSet *)self name];
    uint64_t v11 = [(SKTileSet *)v6 name];
    int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_23;
    }
LABEL_8:
    if ([(NSMutableArray *)self->_groups count])
    {
      unint64_t v13 = 0;
      while ([(NSMutableArray *)v6->_groups count] > v13)
      {
        uint64_t v14 = [(NSMutableArray *)self->_groups objectAtIndexedSubscript:v13];
        v15 = [(NSMutableArray *)v6->_groups objectAtIndexedSubscript:v13];
        char v16 = [v14 isEqualToNode:v15];

        if ((v16 & 1) == 0) {
          break;
        }
        if ([(NSMutableArray *)self->_groups count] <= ++v13) {
          goto LABEL_13;
        }
      }
      goto LABEL_23;
    }
LABEL_13:
    defaultTileGroup = self->_defaultTileGroup;
    if (!defaultTileGroup)
    {
      uint64_t v18 = [(SKTileSet *)v6 defaultTileGroup];

      if (!v18)
      {
LABEL_17:
        if (![(NSArray *)self->_stamps count])
        {
          BOOL v8 = 1;
          goto LABEL_24;
        }
        unint64_t v21 = 0;
        while ([(NSArray *)v6->_stamps count] > v21)
        {
          v22 = [(NSArray *)self->_stamps objectAtIndexedSubscript:v21];
          uint64_t v23 = [(NSArray *)v6->_stamps objectAtIndexedSubscript:v21];
          char v24 = [v22 isEqualToNode:v23];

          if ((v24 & 1) == 0) {
            break;
          }
          ++v21;
          BOOL v8 = 1;
          if ([(NSArray *)self->_stamps count] <= v21) {
            goto LABEL_24;
          }
        }
LABEL_23:
        BOOL v8 = 0;
LABEL_24:

        goto LABEL_25;
      }
      defaultTileGroup = self->_defaultTileGroup;
    }
    v19 = [(SKTileSet *)v6 defaultTileGroup];
    BOOL v20 = [(SKTileGroup *)defaultTileGroup isEqualToNode:v19];

    if (!v20) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  BOOL v8 = 1;
LABEL_25:

  return v8;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKTileSet *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (SKTileSet)init
{
  v10.receiver = self;
  v10.super_class = (Class)SKTileSet;
  v2 = [(SKTileSet *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = MEMORY[0x263EFFA68];

    *((void *)v2 + 4) = 0;
    BOOL v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = 0;

    *(_OWORD *)(v2 + 40) = *MEMORY[0x263F001B0];
    [v2 commonInit];
  }
  return (SKTileSet *)v2;
}

- (void)observeAllTileDefinitions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_definitions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SKTileSet observeTileDefinition:](self, "observeTileDefinition:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)unobserveAllTileDefinitions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_definitions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SKTileSet removeTileDefinitionObservers:](self, "removeTileDefinitionObservers:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  [(SKTileSet *)self unobserveAllTileDefinitions];
  v3.receiver = self;
  v3.super_class = (Class)SKTileSet;
  [(SKTileSet *)&v3 dealloc];
}

- (void)observeTileDefinition:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self forKeyPath:@"images" options:0 context:0];
  [v4 addObserver:self forKeyPath:@"size" options:0 context:0];
  [v4 addObserver:self forKeyPath:@"timePerFrame" options:0 context:0];
}

- (void)removeTileDefinitionObservers:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"images"];
  [v4 removeObserver:self forKeyPath:@"size"];
  [v4 removeObserver:self forKeyPath:@"timePerFrame"];
}

- (void)commonInit
{
  if (commonInit__tableInit != -1) {
    dispatch_once(&commonInit__tableInit, &__block_literal_global_12);
  }
}

void __23__SKTileSet_commonInit__block_invoke()
{
  v0 = [SKThreadSafeMapTable alloc];
  id v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v1 = [(SKThreadSafeMapTable *)v0 initWithNSMapTable:v3];
  v2 = (void *)_tileSetTable;
  _tileSetTable = v1;
}

- (void)calcDefaultTileSize
{
  id v3 = [(SKTileSet *)self tileGroups];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(SKTileSet *)self tileGroups];
    id v17 = [v5 firstObject];

    uint64_t v6 = [v17 rules];
    uint64_t v7 = [v6 count];

    long long v8 = v17;
    if (v7)
    {
      long long v9 = [v17 rules];
      long long v10 = [v9 firstObject];

      long long v11 = [v10 tileDefinitions];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        uint64_t v13 = [v10 tileDefinitions];
        uint64_t v14 = [v13 firstObject];

        [v14 size];
        self->_defaultTileSize.CGFloat width = v15;
        self->_defaultTileSize.CGFloat height = v16;
      }
      long long v8 = v17;
    }
  }
}

- (SKTileSet)initWithTileGroups:(NSArray *)tileGroups
{
  uint64_t v4 = tileGroups;
  v11.receiver = self;
  v11.super_class = (Class)SKTileSet;
  uint64_t v5 = [(SKTileSet *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    [v5 setTileGroups:v4];
    [v5 setName:0];
    *((void *)v5 + 4) = 0;
    long long v8 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = 0;

    *(_OWORD *)(v5 + 40) = *MEMORY[0x263F001B0];
    long long v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = MEMORY[0x263EFFA68];

    [v5 lookForMissingDefinitionsInGroups];
    [v5 updateTileDefinitionIDsInGroupRules];
    [v5 commonInit];
    [v5 calcDefaultTileSize];
  }

  return (SKTileSet *)v5;
}

- (SKTileSet)initWithTileGroups:(NSArray *)tileGroups tileSetType:(SKTileSetType)tileSetType
{
  uint64_t v6 = tileGroups;
  v13.receiver = self;
  v13.super_class = (Class)SKTileSet;
  uint64_t v7 = [(SKTileSet *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    long long v9 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v8;

    [v7 setTileGroups:v6];
    [v7 setName:0];
    *((void *)v7 + 4) = tileSetType;
    long long v10 = (void *)*((void *)v7 + 7);
    *((void *)v7 + 7) = 0;

    *(_OWORD *)(v7 + 40) = *MEMORY[0x263F001B0];
    objc_super v11 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = MEMORY[0x263EFFA68];

    [v7 lookForMissingDefinitionsInGroups];
    [v7 updateTileDefinitionIDsInGroupRules];
    [v7 commonInit];
    [v7 calcDefaultTileSize];
  }

  return (SKTileSet *)v7;
}

+ (SKTileSet)tileSetWithTileGroups:(NSArray *)tileGroups
{
  id v3 = tileGroups;
  uint64_t v4 = [[SKTileSet alloc] initWithTileGroups:v3];

  return v4;
}

+ (SKTileSet)tileSetWithTileGroups:(NSArray *)tileGroups tileSetType:(SKTileSetType)tileSetType
{
  uint64_t v5 = tileGroups;
  uint64_t v6 = [[SKTileSet alloc] initWithTileGroups:v5 tileSetType:tileSetType];

  return v6;
}

+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  long long v9 = [v8 enumeratorAtPath:v6];

  uint64_t v10 = [v9 nextObject];
  if (v10)
  {
    objc_super v11 = (void *)v10;
    do
    {
      uint64_t v12 = [v11 pathExtension];
      uint64_t v13 = [v12 caseInsensitiveCompare:v5];

      if (!v13)
      {
        uint64_t v14 = [v6 stringByAppendingPathComponent:v11];
        [v7 addObject:v14];
      }
      uint64_t v15 = [v9 nextObject];

      objc_super v11 = (void *)v15;
    }
    while (v15);
  }

  return v7;
}

+ (id)findTileSetInBundleNamed:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v71 = a3;
  uint64_t v4 = SKGetResourceBundle();
  id v5 = [v4 bundlePath];
  id v6 = [a1 recursivePathsForResourcesOfType:@"sks" inDirectory:v5];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_50;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v81;
  uint64_t v62 = *MEMORY[0x263F081D0];
  id v67 = v7;
  uint64_t v68 = *(void *)v81;
  do
  {
    uint64_t v12 = 0;
    uint64_t v63 = v9;
    do
    {
      if (*(void *)v81 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v80 + 1) + 8 * v12);
      objc_msgSend(NSDictionary, "dictionaryWithContentsOfFile:", v13, v61);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 objectForKeyedSubscript:@"$objects"];
      CGFloat v16 = v15;
      if (!v15 || (unint64_t)[v15 count] < 2) {
        goto LABEL_27;
      }
      v69 = v14;
      id v17 = [v14 objectForKeyedSubscript:@"$top"];
      uint64_t v18 = [v17 objectForKeyedSubscript:@"document.type"];
      v19 = (void *)v18;
      if (!v18
        || (unint64_t v20 = *(unsigned int *)(v18 + 16), [v16 count] <= v20)
        || ([v16 objectAtIndexedSubscript:v20],
            (unint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        uint64_t v11 = v68;
        id v14 = v69;
LABEL_27:

        goto LABEL_28;
      }
      v22 = v21;
      uint64_t v23 = [v21 compare:@"com.apple.spritekit.tileset"];

      id v14 = v69;
      uint64_t v11 = v68;
      if (!v23)
      {
        char v24 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v13];
        id v25 = objc_alloc(MEMORY[0x263F08928]);
        id v79 = 0;
        float v26 = (void *)[v25 initForReadingFromData:v24 error:&v79];
        id v61 = v79;
        [v26 setRequiresSecureCoding:0];
        id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        v86[0] = objc_opt_class();
        v86[1] = objc_opt_class();
        objc_super v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
        [v27 addObjectsFromArray:v28];

        v29 = [v26 allowedClasses];
        [v27 unionSet:v29];

        id v78 = v61;
        id v65 = v27;
        v66 = (unsigned int *)v26;
        v30 = [v26 decodeTopLevelObjectOfClasses:v27 forKey:v62 error:&v78];
        id v31 = v78;

        v64 = v30;
        if (v30)
        {
          id v61 = v24;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v32 = v30;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v74 objects:v85 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v75;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v75 != v35) {
                  objc_enumerationMutation(v32);
                }
                v37 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                v38 = (void *)_tileSetTable;
                v39 = objc_msgSend(v37, "name", v61);
                [v38 setObject:v37 forKey:v39];

                if (!v10)
                {
                  v40 = [v37 name];
                  int v41 = [v40 isEqualToString:v71];

                  if (v41) {
                    id v10 = v37;
                  }
                  else {
                    id v10 = 0;
                  }
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v74 objects:v85 count:16];
            }
            while (v34);
            id v7 = v67;
            uint64_t v11 = v68;
            uint64_t v9 = v63;
          }
          id v14 = v69;
          goto LABEL_36;
        }
        id v14 = v69;
        goto LABEL_42;
      }
LABEL_28:
      v42 = [v14 objectForKeyedSubscript:@"$objects"];
      id v31 = v42;
      if (!v42 || (unint64_t)[v42 count] < 2) {
        goto LABEL_45;
      }
      char v24 = [v31 objectAtIndexedSubscript:1];
      v43 = [v24 objectForKeyedSubscript:@"$class"];
      if (v43)
      {
        id v70 = v14;
        unint64_t v44 = v43[4];
        v45 = v43;
        if ([v31 count] > v44)
        {
          v46 = [v31 objectAtIndexedSubscript:v44];
          v47 = [v46 objectForKeyedSubscript:@"$classname"];
          int v48 = [v47 isEqualToString:@"SKTileSet"];

          if (!v48)
          {
            uint64_t v9 = v63;
            uint64_t v11 = v68;
            id v14 = v70;
            id v7 = v67;
            goto LABEL_46;
          }
          char v24 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v13];
          id v49 = objc_alloc(MEMORY[0x263F08928]);
          id v73 = 0;
          v50 = (void *)[v49 initForReadingFromData:v24 error:&v73];
          id v51 = v73;
          [v50 setRequiresSecureCoding:0];
          id v52 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          v84[0] = objc_opt_class();
          v84[1] = objc_opt_class();
          v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
          [v52 addObjectsFromArray:v53];

          v54 = [v50 allowedClasses];
          [v52 unionSet:v54];

          id v72 = v51;
          id v65 = v52;
          v66 = (unsigned int *)v50;
          v55 = [v50 decodeTopLevelObjectOfClasses:v52 forKey:v62 error:&v72];
          id v31 = v72;

          id v14 = v70;
          v64 = v55;
          if (v55)
          {
            v56 = (void *)_tileSetTable;
            v57 = [v55 name];
            [v56 setObject:v55 forKey:v57];

            v58 = [v55 name];
            LODWORD(v57) = [v58 isEqualToString:v71];

            id v7 = v67;
            if (v57)
            {
              id v61 = v24;
              id v32 = v10;
              id v10 = v55;
              uint64_t v9 = v63;
              uint64_t v11 = v68;
LABEL_36:
              v59 = v65;

              char v24 = v61;
LABEL_43:

              v43 = v66;
              goto LABEL_44;
            }
            uint64_t v9 = v63;
            uint64_t v11 = v68;
          }
          else
          {
            uint64_t v9 = v63;
            id v7 = v67;
            uint64_t v11 = v68;
          }
LABEL_42:
          v59 = v65;
          goto LABEL_43;
        }
        id v14 = v70;
        v43 = v45;
        id v7 = v67;
      }
LABEL_44:

LABEL_45:
LABEL_46:

      ++v12;
    }
    while (v12 != v9);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v80 objects:v87 count:16];
  }
  while (v9);
LABEL_50:

  return v10;
}

+ (SKTileSet)tileSetNamed:(NSString *)name
{
  uint64_t v4 = name;
  if (!_tileSetTable
    || ([(id)_tileSetTable objectForKey:v4], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [a1 findTileSetInBundleNamed:v4];
  }

  return (SKTileSet *)v5;
}

+ (SKTileSet)tileSetFromURL:(NSURL *)url
{
  v17[11] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v4 = [(NSURL *)url path];
  id v5 = [v3 dataWithContentsOfFile:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v17[8] = objc_opt_class();
  v17[9] = objc_opt_class();
  v17[10] = objc_opt_class();
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
  [v6 addObjectsFromArray:v7];

  id v16 = 0;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v5 error:&v16];
  id v9 = v16;
  [v8 setRequiresSecureCoding:0];
  uint64_t v10 = *MEMORY[0x263F081D0];
  id v15 = v9;
  uint64_t v11 = [v8 decodeTopLevelObjectOfClasses:v6 forKey:v10 error:&v15];
  id v12 = v15;

  objc_opt_class();
  id v13 = 0;
  if (objc_opt_isKindOfClass()) {
    id v13 = v11;
  }

  return (SKTileSet *)v13;
}

+ (void)clearTileSetTableCache
{
  if (_tileSetTable) {
    [(id)_tileSetTable removeAllObjects];
  }
}

- (void)lookForMissingDefinitionsInGroups
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_groups;
  uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v29 + 1) + 8 * v3);
        if (v4)
        {
          uint64_t v20 = v3;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v5 = [v4 rules];
          uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v26;
            do
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v26 != v8) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
                if (v10)
                {
                  long long v23 = 0u;
                  long long v24 = 0u;
                  long long v21 = 0u;
                  long long v22 = 0u;
                  uint64_t v11 = [v10 tileDefinitions];
                  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v33 count:16];
                  if (v12)
                  {
                    uint64_t v13 = v12;
                    uint64_t v14 = *(void *)v22;
                    do
                    {
                      uint64_t v15 = 0;
                      do
                      {
                        if (*(void *)v22 != v14) {
                          objc_enumerationMutation(v11);
                        }
                        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
                        if (v16
                          && ([(NSMutableArray *)self->_definitions containsObject:*(void *)(*((void *)&v21 + 1) + 8 * v15)] & 1) == 0)
                        {
                          [(NSMutableArray *)self->_definitions addObject:v16];
                          [(SKTileSet *)self observeTileDefinition:v16];
                        }
                        ++v15;
                      }
                      while (v13 != v15);
                      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v33 count:16];
                    }
                    while (v13);
                  }
                }
                ++v9;
              }
              while (v9 != v7);
              uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v7);
          }

          uint64_t v3 = v20;
        }
        ++v3;
      }
      while (v3 != v19);
      uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v19);
  }
}

- (void)updateTileDefinitionIDsInGroupRules
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = self->_groups;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v9 = objc_msgSend(v8, "rules", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * v13++) calcTileDefinitionIDsWithTileSet:self];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
}

- (id)findTileDefinitionForGroup:(id)a3 withGroupAdjacency:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = 0;
  if (v6 && a4)
  {
    if (!self->_definitions) {
      goto LABEL_15;
    }
    groups = self->_groups;
    if (!groups || ![(NSMutableArray *)groups containsObject:v6]) {
      goto LABEL_15;
    }
    unsigned __int16 v9 = [(NSMutableArray *)self->_groups indexOfObject:v6];
    unsigned __int8 v10 = 0;
    uint64_t v11 = 8;
    if (self->_type - 2 < 2) {
      uint64_t v11 = 6;
    }
    uint64_t v12 = &kAdjacencyMask;
    if (self->_type - 2 < 2) {
      uint64_t v12 = &kHexPointyAdjacencyMask;
    }
    do
    {
      uint64_t v13 = *a4++;
      if (v13 == v9) {
        v10 |= *v12;
      }
      ++v12;
      --v11;
    }
    while (v11);
    unint64_t v14 = (unsigned __int16)objc_msgSend(v6, "findTileDefinitionIndexForAdjacencyData:tileSetType:", v10, -[SKTileSet type](self, "type"));
    if (v14 < [(NSMutableArray *)self->_definitions count])
    {
      uint64_t v7 = [(NSMutableArray *)self->_definitions objectAtIndexedSubscript:v14];
    }
    else
    {
LABEL_15:
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)findTileDefinitionsForGroup:(id)a3 withGroupAdjacency:(unint64_t *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  if (v6)
  {
    if (a4)
    {
      if (self->_definitions)
      {
        groups = self->_groups;
        if (groups)
        {
          if ([(NSMutableArray *)groups containsObject:v6])
          {
            unsigned __int16 v9 = [(NSMutableArray *)self->_groups indexOfObject:v6];
            unsigned __int8 v10 = 0;
            uint64_t v11 = 8;
            if (self->_type - 2 < 2) {
              uint64_t v11 = 6;
            }
            uint64_t v12 = &kAdjacencyMask;
            if (self->_type - 2 < 2) {
              uint64_t v12 = &kHexPointyAdjacencyMask;
            }
            do
            {
              uint64_t v13 = *a4++;
              if (v13 == v9) {
                v10 |= *v12;
              }
              ++v12;
              --v11;
            }
            while (v11);
            unint64_t v14 = objc_msgSend(v6, "findTileDefinitionIDsForAdjacencyData:tileSetType:", v10, -[SKTileSet type](self, "type"));
            uint64_t v7 = [MEMORY[0x263EFF980] array];
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v25;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v25 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                  if (v20)
                  {
                    unint64_t v21 = objc_msgSend(v20, "unsignedIntegerValue", (void)v24);
                    if (v21 <= [(NSMutableArray *)self->_definitions count])
                    {
                      long long v22 = [(NSMutableArray *)self->_definitions objectAtIndexedSubscript:v21];
                      [v7 addObject:v22];
                    }
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
              }
              while (v17);
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)getCenterTileDefinitionForGroup:(id)a3 withRequiredOutputGroupAdjacency:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v8 = [v6 rules];
  if (!v8) {
    goto LABEL_14;
  }
  unsigned __int16 v9 = (void *)v8;
  unsigned __int8 v10 = [v7 rules];
  uint64_t v11 = [v10 count];
  if (!a4 || !v11 || !self->_definitions || (groups = self->_groups) == 0)
  {

LABEL_16:
    long long v25 = 0;
    goto LABEL_17;
  }
  int v13 = [(NSMutableArray *)groups containsObject:v7];

  if (!v13)
  {
LABEL_14:
    long long v25 = 0;
    goto LABEL_18;
  }
  unsigned __int16 v14 = [(NSMutableArray *)self->_groups indexOfObject:v7];
  id v15 = [v7 rules];
  unsigned __int16 v9 = [v15 firstObject];

  uint64_t v16 = 0;
  int64x2_t v17 = vdupq_n_s64(v14);
  do
  {
    *(int64x2_t *)&a4[v16] = v17;
    v16 += 2;
  }
  while (v16 != 8);
  uint64_t v18 = [v9 tileDefinitionIDs];
  if (!v18) {
    goto LABEL_16;
  }
  long long v19 = (void *)v18;
  long long v20 = [v9 tileDefinitionIDs];
  uint64_t v21 = [v20 count];

  if (!v21) {
    goto LABEL_16;
  }
  long long v22 = [v9 tileDefinitionIDs];
  long long v23 = [v22 firstObject];
  unint64_t v24 = [v23 integerValue];

  if (v24 >= [(NSMutableArray *)self->_definitions count]) {
    goto LABEL_16;
  }
  long long v25 = [(NSMutableArray *)self->_definitions objectAtIndexedSubscript:v24];
LABEL_17:

LABEL_18:

  return v25;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultTileGroup, 0);
  objc_storeStrong((id *)&self->_stamps, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_definitions, 0);
}

@end