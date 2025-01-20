@interface GEONonTiledAssets
+ (BOOL)isValid:(id)a3;
+ (Class)materialMapType;
+ (Class)materialType;
+ (Class)modelType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONonTiledAssets)init;
- (GEONonTiledAssets)initWithData:(id)a3;
- (GEONonTiledAssets)initWithDictionary:(id)a3;
- (GEONonTiledAssets)initWithJSON:(id)a3;
- (NSMutableArray)materialMaps;
- (NSMutableArray)materials;
- (NSMutableArray)models;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)materialAtIndex:(unint64_t)a3;
- (id)materialMapAtIndex:(unint64_t)a3;
- (id)modelAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)materialMapsCount;
- (unint64_t)materialsCount;
- (unint64_t)modelsCount;
- (void)_addNoFlagsMaterial:(uint64_t)a1;
- (void)_addNoFlagsMaterialMap:(uint64_t)a1;
- (void)_addNoFlagsModel:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readMaterialMaps;
- (void)_readMaterials;
- (void)_readModels;
- (void)addMaterial:(id)a3;
- (void)addMaterialMap:(id)a3;
- (void)addModel:(id)a3;
- (void)clearMaterialMaps;
- (void)clearMaterials;
- (void)clearModels;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMaterialMaps:(id)a3;
- (void)setMaterials:(id)a3;
- (void)setModels:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONonTiledAssets

- (GEONonTiledAssets)initWithJSON:(id)a3
{
  return (GEONonTiledAssets *)-[GEONonTiledAssets _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"model"];
      objc_opt_class();
      id v37 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v47 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEONonTiledModel alloc];
                if (a3) {
                  uint64_t v14 = [(GEONonTiledModel *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEONonTiledModel *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addModel:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v9);
        }

        id v5 = v37;
      }

      v16 = [v5 objectForKeyedSubscript:@"material"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEONonTiledMaterial alloc];
                if (a3) {
                  uint64_t v24 = [(GEONonTiledMaterial *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEONonTiledMaterial *)v23 initWithDictionary:v22];
                }
                v25 = (void *)v24;
                [a1 addMaterial:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v19);
        }

        id v5 = v37;
      }

      v26 = [v5 objectForKeyedSubscript:@"materialMap"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v39;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = [GEONonTiledMaterialMap alloc];
                if (a3) {
                  uint64_t v34 = [(GEONonTiledMaterialMap *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEONonTiledMaterialMap *)v33 initWithDictionary:v32];
                }
                v35 = (void *)v34;
                [a1 addMaterialMap:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v29);
        }

        id v5 = v37;
      }
    }
  }

  return a1;
}

- (void)addMaterialMap:(id)a3
{
  id v4 = a3;
  -[GEONonTiledAssets _readMaterialMaps]((uint64_t)self);
  -[GEONonTiledAssets _addNoFlagsMaterialMap:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (id)materialMapAtIndex:(unint64_t)a3
{
  -[GEONonTiledAssets _readMaterialMaps]((uint64_t)self);
  materialMaps = self->_materialMaps;

  return (id)[(NSMutableArray *)materialMaps objectAtIndex:a3];
}

- (unint64_t)materialMapsCount
{
  -[GEONonTiledAssets _readMaterialMaps]((uint64_t)self);
  materialMaps = self->_materialMaps;

  return [(NSMutableArray *)materialMaps count];
}

- (void)_readMaterialMaps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONonTiledAssetsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMaterialMaps_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsMaterialMap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEONonTiledAssets)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONonTiledAssets;
  v2 = [(GEONonTiledAssets *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)addModel:(id)a3
{
  id v4 = a3;
  -[GEONonTiledAssets _readModels]((uint64_t)self);
  -[GEONonTiledAssets _addNoFlagsModel:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (id)modelAtIndex:(unint64_t)a3
{
  -[GEONonTiledAssets _readModels]((uint64_t)self);
  models = self->_models;

  return (id)[(NSMutableArray *)models objectAtIndex:a3];
}

- (unint64_t)modelsCount
{
  -[GEONonTiledAssets _readModels]((uint64_t)self);
  models = self->_models;

  return [(NSMutableArray *)models count];
}

- (void)_readModels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONonTiledAssetsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModels_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsModel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_materials, 0);
  objc_storeStrong((id *)&self->_materialMaps, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)materialsCount
{
  -[GEONonTiledAssets _readMaterials]((uint64_t)self);
  materials = self->_materials;

  return [(NSMutableArray *)materials count];
}

- (void)_readMaterials
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONonTiledAssetsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMaterials_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEONonTiledAssets)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONonTiledAssets;
  id v3 = [(GEONonTiledAssets *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (NSMutableArray)models
{
  -[GEONonTiledAssets _readModels]((uint64_t)self);
  models = self->_models;

  return models;
}

- (void)setModels:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  models = self->_models;
  self->_models = v4;
}

- (void)clearModels
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  models = self->_models;

  [(NSMutableArray *)models removeAllObjects];
}

+ (Class)modelType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)materials
{
  -[GEONonTiledAssets _readMaterials]((uint64_t)self);
  materials = self->_materials;

  return materials;
}

- (void)setMaterials:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  materials = self->_materials;
  self->_materials = v4;
}

- (void)clearMaterials
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  materials = self->_materials;

  [(NSMutableArray *)materials removeAllObjects];
}

- (void)addMaterial:(id)a3
{
  id v4 = a3;
  -[GEONonTiledAssets _readMaterials]((uint64_t)self);
  -[GEONonTiledAssets _addNoFlagsMaterial:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsMaterial:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)materialAtIndex:(unint64_t)a3
{
  -[GEONonTiledAssets _readMaterials]((uint64_t)self);
  materials = self->_materials;

  return (id)[(NSMutableArray *)materials objectAtIndex:a3];
}

+ (Class)materialType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)materialMaps
{
  -[GEONonTiledAssets _readMaterialMaps]((uint64_t)self);
  materialMaps = self->_materialMaps;

  return materialMaps;
}

- (void)setMaterialMaps:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  materialMaps = self->_materialMaps;
  self->_materialMaps = v4;
}

- (void)clearMaterialMaps
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  materialMaps = self->_materialMaps;

  [(NSMutableArray *)materialMaps removeAllObjects];
}

+ (Class)materialMapType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONonTiledAssets;
  id v4 = [(GEONonTiledAssets *)&v8 description];
  id v5 = [(GEONonTiledAssets *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONonTiledAssets _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[4] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v6 = a1[4];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v39 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            uint64_t v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"model"];
    }
    if ([a1[3] count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v14 = a1[3];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            uint64_t v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"material"];
    }
    if ([a1[2] count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v22 = a1[2];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v31;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = *(void **)(*((void *)&v30 + 1) + 8 * k);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            uint64_t v28 = objc_msgSend(v27, "dictionaryRepresentation", (void)v30);
            }
            objc_msgSend(v21, "addObject:", v28, (void)v30);
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v42 count:16];
        }
        while (v24);
      }

      [v4 setObject:v21 forKey:@"materialMap"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONonTiledAssets _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEONonTiledAssets)initWithDictionary:(id)a3
{
  return (GEONonTiledAssets *)-[GEONonTiledAssets _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_37;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_37;
    }
    GEONonTiledAssetsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEONonTiledAssetsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledAssetsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledAssetsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEONonTiledAssets *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->_models;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_materials;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = self->_materialMaps;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEONonTiledAssets *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 10) = self->_readerMarkPos;
  *((_DWORD *)v16 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEONonTiledAssets *)self modelsCount])
  {
    [v16 clearModels];
    unint64_t v4 = [(GEONonTiledAssets *)self modelsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEONonTiledAssets *)self modelAtIndex:i];
        [v16 addModel:v7];
      }
    }
  }
  if ([(GEONonTiledAssets *)self materialsCount])
  {
    [v16 clearMaterials];
    unint64_t v8 = [(GEONonTiledAssets *)self materialsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEONonTiledAssets *)self materialAtIndex:j];
        [v16 addMaterial:v11];
      }
    }
  }
  if ([(GEONonTiledAssets *)self materialMapsCount])
  {
    [v16 clearMaterialMaps];
    unint64_t v12 = [(GEONonTiledAssets *)self materialMapsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEONonTiledAssets *)self materialMapAtIndex:k];
        [v16 addMaterialMap:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEONonTiledAssetsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONonTiledAssets *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_models;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [v5 addModel:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_materials;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * j) copyWithZone:a3];
        [v5 addMaterial:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_materialMaps;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (void)v24);
        [v5 addMaterialMap:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEONonTiledAssets *)self readAll:1],
         [v4 readAll:1],
         models = self->_models,
         !((unint64_t)models | v4[4]))
     || -[NSMutableArray isEqual:](models, "isEqual:"))
    && ((materials = self->_materials, !((unint64_t)materials | v4[3]))
     || -[NSMutableArray isEqual:](materials, "isEqual:")))
  {
    materialMaps = self->_materialMaps;
    if ((unint64_t)materialMaps | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](materialMaps, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEONonTiledAssets *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_models hash];
  uint64_t v4 = [(NSMutableArray *)self->_materials hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_materialMaps hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEONonTiledAssets *)self addModel:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEONonTiledAssets *)self addMaterial:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[2];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEONonTiledAssets addMaterialMap:](self, "addMaterialMap:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

@end