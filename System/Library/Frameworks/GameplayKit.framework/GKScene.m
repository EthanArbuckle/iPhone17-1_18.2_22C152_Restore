@interface GKScene
+ (BOOL)supportsSecureCoding;
+ (GKScene)sceneWithFileNamed:(NSString *)filename;
+ (id)_sceneWithFileNamed:(id)a3 rootNode:(id)a4;
- (GKScene)init;
- (GKScene)initWithCoder:(id)a3;
- (NSArray)entities;
- (NSDictionary)graphs;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rootNode;
- (void)addEntity:(GKEntity *)entity;
- (void)addGraph:(GKGraph *)graph name:(NSString *)name;
- (void)encodeWithCoder:(id)a3;
- (void)removeEntity:(GKEntity *)entity;
- (void)removeGraph:(NSString *)name;
- (void)setRootNode:(id)rootNode;
@end

@implementation GKScene

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_sceneWithFileNamed:(id)a3 rootNode:(id)a4
{
  v83[16] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F086E0] mainBundle];
  v8 = [v7 pathForResource:v5 ofType:@"gks"];
  if (!v8)
  {
    v8 = [v7 pathForResource:v5 ofType:0];
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v83[0] = objc_opt_class();
  v83[1] = objc_opt_class();
  v83[2] = objc_opt_class();
  v83[3] = objc_opt_class();
  v83[4] = objc_opt_class();
  v83[5] = objc_opt_class();
  v83[6] = objc_opt_class();
  v83[7] = objc_opt_class();
  v83[8] = objc_opt_class();
  v83[9] = objc_opt_class();
  v83[10] = objc_opt_class();
  v83[11] = objc_opt_class();
  v83[12] = objc_opt_class();
  v83[13] = objc_opt_class();
  v83[14] = objc_opt_class();
  v83[15] = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:16];
  [v9 addObjectsFromArray:v10];

  if (v8)
  {
    v53 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8 options:1 error:0];
    v11 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v53 error:0];
    uint64_t v12 = objc_opt_new();
    [v11 setDelegate:v12];
    v56 = v7;
    id v57 = v5;
    id v54 = v9;
    v55 = v8;
    v59 = v11;
    v51 = (void *)v12;
    if (v6)
    {
      uint64_t v13 = *MEMORY[0x263F081D0];
      id v78 = 0;
      v14 = [v11 decodeTopLevelObjectOfClasses:v9 forKey:v13 error:&v78];
      id v15 = v78;
      v16 = v15;
      if (v15) {
        NSLog(&cfstr_UnableToDecode.isa, v15);
      }
    }
    else
    {
      v14 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"_gkScene"];
      uint64_t v33 = [v11 decodeObjectOfClasses:v9 forKey:*MEMORY[0x263F081D0]];
      if (!v33)
      {
        if (!NSClassFromString(&cfstr_Skscene.isa)) {
          NSLog(&cfstr_CannotLoadScen.isa, v5);
        }
        v58 = 0;
        goto LABEL_32;
      }
      id v6 = (id)v33;
    }
    RepairGKSceneNodeReferencesRelativeToScene(v14, v6);
    [v14 setRootNode:v6];
    v58 = v6;
LABEL_32:
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v34 = [v14 entities];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v75 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          v40 = [v39 components];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v70 objects:v81 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v71;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v71 != v43) {
                  objc_enumerationMutation(v40);
                }
                [v39 addComponent:*(void *)(*((void *)&v70 + 1) + 8 * j)];
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v70 objects:v81 count:16];
            }
            while (v42);
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v74 objects:v82 count:16];
      }
      while (v36);
    }

    v45 = v59;
    [v59 finishDecoding];
    v46 = v51;
LABEL_48:

    id v5 = v57;
    id v6 = v58;
    v8 = v55;
    v7 = v56;
    id v9 = v54;
LABEL_49:
    id v47 = v14;
    goto LABEL_50;
  }
  v17 = [v7 pathForResource:v5 ofType:@"sks"];
  if (!v17)
  {
    v17 = [v7 pathForResource:v5 ofType:0];
    if (!v17)
    {
      v14 = 0;
      goto LABEL_49;
    }
  }
  v60 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v17 options:1 error:0];
  v18 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v60 error:0];
  v19 = objc_opt_new();
  [v18 setDelegate:v19];
  v14 = [v18 decodeObjectOfClasses:v9 forKey:@"_gkScene"];
  if (NSClassFromString(&cfstr_Skscene.isa))
  {
    v50 = v19;
    uint64_t v20 = *MEMORY[0x263F081D0];
    id v69 = 0;
    v58 = [v18 decodeTopLevelObjectOfClasses:v9 forKey:v20 error:&v69];
    id v21 = v69;

    if (v21) {
      NSLog(&cfstr_UnableToDecode.isa, v21);
    }
    v49 = v21;
    v52 = v18;
    v53 = v17;
    id v54 = v9;
    v55 = 0;
    v56 = v7;
    id v57 = v5;
    if (objc_opt_isKindOfClass()) {
      RepairGKSceneNodeReferencesRelativeToScene(v14, v58);
    }
    [v14 setRootNode:v58];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v22 = [v14 entities];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v80 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v66 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v65 + 1) + 8 * k);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          v28 = [v27 components];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v79 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v62;
            do
            {
              for (uint64_t m = 0; m != v30; ++m)
              {
                if (*(void *)v62 != v31) {
                  objc_enumerationMutation(v28);
                }
                [v27 addComponent:*(void *)(*((void *)&v61 + 1) + 8 * m)];
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v79 count:16];
            }
            while (v30);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v65 objects:v80 count:16];
      }
      while (v24);
    }

    v46 = v52;
    [v52 finishDecoding];

    v45 = v60;
    goto LABEL_48;
  }
  NSLog(&cfstr_CannotLoadScen.isa, v5);
  id v47 = v14;

LABEL_50:

  return v47;
}

+ (GKScene)sceneWithFileNamed:(NSString *)filename
{
  return (GKScene *)[a1 _sceneWithFileNamed:filename rootNode:0];
}

- (GKScene)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKScene;
  v2 = [(GKScene *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    entities = v2->_entities;
    v2->_entities = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    graphs = v2->_graphs;
    v2->_graphs = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (GKScene)initWithCoder:(id)a3
{
  v15[16] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKScene;
  uint64_t v5 = [(GKScene *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    v15[7] = objc_opt_class();
    v15[8] = objc_opt_class();
    v15[9] = objc_opt_class();
    v15[10] = objc_opt_class();
    v15[11] = objc_opt_class();
    v15[12] = objc_opt_class();
    v15[13] = objc_opt_class();
    v15[14] = objc_opt_class();
    v15[15] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:16];
    [v6 addObjectsFromArray:v7];

    objc_super v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_entities"];
    entities = v5->_entities;
    v5->_entities = (NSMutableArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v6 forKey:@"_graphs"];
    graphs = v5->_graphs;
    v5->_graphs = (NSMutableDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  entities = self->_entities;
  id v5 = a3;
  [v5 encodeObject:entities forKey:@"_entities"];
  [v5 encodeObject:self->_graphs forKey:@"_graphs"];
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x237DF7AF0](self, a2);

  return [(GKScene *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  id v5 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = self->_entities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copy];
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  objc_storeStrong(v4 + 1, v5);
  uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [(NSMutableDictionary *)self->_graphs allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        v19 = [(NSMutableDictionary *)self->_graphs objectForKeyedSubscript:v18];
        [v12 setObject:v19 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  id v20 = v4[2];
  v4[2] = v12;

  return v4;
}

- (void)addEntity:(GKEntity *)entity
{
  if (entity) {
    -[NSMutableArray addObject:](self->_entities, "addObject:");
  }
}

- (void)removeEntity:(GKEntity *)entity
{
  if (entity) {
    -[NSMutableArray removeObject:](self->_entities, "removeObject:");
  }
}

- (void)addGraph:(GKGraph *)graph name:(NSString *)name
{
  if (graph) {
    [(NSMutableDictionary *)self->_graphs setObject:graph forKeyedSubscript:name];
  }
}

- (void)removeGraph:(NSString *)name
{
  if (name) {
    -[NSMutableDictionary removeObjectForKey:](self->_graphs, "removeObjectForKey:");
  }
}

- (NSArray)entities
{
  return &self->_entities->super;
}

- (NSDictionary)graphs
{
  return &self->_graphs->super;
}

- (id)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)rootNode
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_graphs, 0);

  objc_storeStrong((id *)&self->_entities, 0);
}

@end