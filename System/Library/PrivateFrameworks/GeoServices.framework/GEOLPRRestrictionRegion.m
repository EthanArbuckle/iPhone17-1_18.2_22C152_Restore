@interface GEOLPRRestrictionRegion
+ (BOOL)isValid:(id)a3;
+ (Class)convertRuleType;
+ (Class)definedPlateTypesType;
- (BOOL)hasMapRegion;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRRestrictionRegion)init;
- (GEOLPRRestrictionRegion)initWithData:(id)a3;
- (GEOLPRRestrictionRegion)initWithDictionary:(id)a3;
- (GEOLPRRestrictionRegion)initWithJSON:(id)a3;
- (GEOMapRegionE7)mapRegion;
- (NSMutableArray)convertRules;
- (NSMutableArray)definedPlateTypes;
- (NSString)identifier;
- (NSString)name;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)convertRuleAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)definedPlateTypesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)convertRulesCount;
- (unint64_t)definedPlateTypesCount;
- (unint64_t)hash;
- (void)_addNoFlagsConvertRule:(uint64_t)a1;
- (void)_addNoFlagsDefinedPlateTypes:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readConvertRules;
- (void)_readDefinedPlateTypes;
- (void)_readMapRegion;
- (void)_readName;
- (void)addConvertRule:(id)a3;
- (void)addDefinedPlateTypes:(id)a3;
- (void)clearConvertRules;
- (void)clearDefinedPlateTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setConvertRules:(id)a3;
- (void)setDefinedPlateTypes:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRRestrictionRegion

- (GEOLPRRestrictionRegion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRestrictionRegion;
  v2 = [(GEOLPRRestrictionRegion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRestrictionRegion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRestrictionRegion;
  v3 = [(GEOLPRRestrictionRegion *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)identifier
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRRestrictionRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readIdentifier_tags_630);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOLPRRestrictionRegion _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_631);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegionE7)mapRegion
{
  -[GEOLPRRestrictionRegion _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readDefinedPlateTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDefinedPlateTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)definedPlateTypes
{
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  definedPlateTypes = self->_definedPlateTypes;

  return definedPlateTypes;
}

- (void)setDefinedPlateTypes:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  definedPlateTypes = self->_definedPlateTypes;
  self->_definedPlateTypes = v4;
}

- (void)clearDefinedPlateTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  definedPlateTypes = self->_definedPlateTypes;

  [(NSMutableArray *)definedPlateTypes removeAllObjects];
}

- (void)addDefinedPlateTypes:(id)a3
{
  id v4 = a3;
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  -[GEOLPRRestrictionRegion _addNoFlagsDefinedPlateTypes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsDefinedPlateTypes:(uint64_t)a1
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

- (unint64_t)definedPlateTypesCount
{
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  definedPlateTypes = self->_definedPlateTypes;

  return [(NSMutableArray *)definedPlateTypes count];
}

- (id)definedPlateTypesAtIndex:(unint64_t)a3
{
  -[GEOLPRRestrictionRegion _readDefinedPlateTypes]((uint64_t)self);
  definedPlateTypes = self->_definedPlateTypes;

  return (id)[(NSMutableArray *)definedPlateTypes objectAtIndex:a3];
}

+ (Class)definedPlateTypesType
{
  return (Class)objc_opt_class();
}

- (void)_readConvertRules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRestrictionRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readConvertRules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)convertRules
{
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  convertRules = self->_convertRules;

  return convertRules;
}

- (void)setConvertRules:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  convertRules = self->_convertRules;
  self->_convertRules = v4;
}

- (void)clearConvertRules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  convertRules = self->_convertRules;

  [(NSMutableArray *)convertRules removeAllObjects];
}

- (void)addConvertRule:(id)a3
{
  id v4 = a3;
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  -[GEOLPRRestrictionRegion _addNoFlagsConvertRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsConvertRule:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)convertRulesCount
{
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  convertRules = self->_convertRules;

  return [(NSMutableArray *)convertRules count];
}

- (id)convertRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRRestrictionRegion _readConvertRules]((uint64_t)self);
  convertRules = self->_convertRules;

  return (id)[(NSMutableArray *)convertRules objectAtIndex:a3];
}

+ (Class)convertRuleType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRRestrictionRegion;
  id v4 = [(GEOLPRRestrictionRegion *)&v8 description];
  id v5 = [(GEOLPRRestrictionRegion *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRestrictionRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    objc_super v6 = [a1 name];
    if (v6) {
      [v4 setObject:v6 forKey:@"name"];
    }

    id v7 = [a1 mapRegion];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"mapRegion";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"map_region";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([a1[3] count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = a1[3];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"definedPlateTypes";
      }
      else {
        v19 = @"defined_plate_types";
      }
      [v4 setObject:v11 forKey:v19];
    }
    if ([a1[2] count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v21 = a1[2];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = objc_msgSend(v26, "dictionaryRepresentation", (void)v30);
            }
            objc_msgSend(v20, "addObject:", v27, (void)v30);
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"convertRule";
      }
      else {
        v28 = @"convert_rule";
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v28, (void)v30);
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
  return -[GEOLPRRestrictionRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRRestrictionRegion)initWithDictionary:(id)a3
{
  return (GEOLPRRestrictionRegion *)-[GEOLPRRestrictionRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setIdentifier:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setName:v9];
      }
      if (a3) {
        v10 = @"mapRegion";
      }
      else {
        v10 = @"map_region";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [GEOMapRegionE7 alloc];
        if (a3) {
          uint64_t v13 = [(GEOMapRegionE7 *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOMapRegionE7 *)v12 initWithDictionary:v11];
        }
        uint64_t v14 = (void *)v13;
        [a1 setMapRegion:v13];
      }
      if (a3) {
        uint64_t v15 = @"definedPlateTypes";
      }
      else {
        uint64_t v15 = @"defined_plate_types";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      id v38 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v23 = [GEOLPRDefinedPlateType alloc];
                if (a3) {
                  uint64_t v24 = [(GEOLPRDefinedPlateType *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEOLPRDefinedPlateType *)v23 initWithDictionary:v22];
                }
                v25 = (void *)v24;
                [a1 addDefinedPlateTypes:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v19);
        }

        id v5 = v38;
      }

      if (a3) {
        v26 = @"convertRule";
      }
      else {
        v26 = @"convert_rule";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v34 = [GEOLPRLPRConvertRule alloc];
                if (a3) {
                  uint64_t v35 = [(GEOLPRLPRConvertRule *)v34 initWithJSON:v33];
                }
                else {
                  uint64_t v35 = [(GEOLPRLPRConvertRule *)v34 initWithDictionary:v33];
                }
                long long v36 = (void *)v35;
                [a1 addConvertRule:v35];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v30);
        }

        id v5 = v38;
      }
    }
  }

  return a1;
}

- (GEOLPRRestrictionRegion)initWithJSON:(id)a3
{
  return (GEOLPRRestrictionRegion *)-[GEOLPRRestrictionRegion _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_649;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_650;
    }
    GEOLPRRestrictionRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRRestrictionRegionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRestrictionRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRestrictionRegionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRRestrictionRegionIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRRestrictionRegion *)self readAll:0];
    PBDataWriterWriteStringField();
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_definedPlateTypes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_convertRules;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOLPRRestrictionRegion *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 14) = self->_readerMarkPos;
  *((_DWORD *)v12 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v12 setIdentifier:self->_identifier];
  if (self->_name) {
    objc_msgSend(v12, "setName:");
  }
  if (self->_mapRegion) {
    objc_msgSend(v12, "setMapRegion:");
  }
  if ([(GEOLPRRestrictionRegion *)self definedPlateTypesCount])
  {
    [v12 clearDefinedPlateTypes];
    unint64_t v4 = [(GEOLPRRestrictionRegion *)self definedPlateTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRRestrictionRegion *)self definedPlateTypesAtIndex:i];
        [v12 addDefinedPlateTypes:v7];
      }
    }
  }
  if ([(GEOLPRRestrictionRegion *)self convertRulesCount])
  {
    [v12 clearConvertRules];
    unint64_t v8 = [(GEOLPRRestrictionRegion *)self convertRulesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRRestrictionRegion *)self convertRuleAtIndex:j];
        [v12 addConvertRule:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRRestrictionRegionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRRestrictionRegion *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(GEOMapRegionE7 *)self->_mapRegion copyWithZone:a3];
  uint64_t v13 = (void *)v5[5];
  v5[5] = v12;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = self->_definedPlateTypes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        [v5 addDefinedPlateTypes:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v19 = self->_convertRules;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        [v5 addConvertRule:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRRestrictionRegion *)self readAll:1],
         [v4 readAll:1],
         identifier = self->_identifier,
         !((unint64_t)identifier | v4[4]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[6])) || -[NSString isEqual:](name, "isEqual:"))
    && ((mapRegion = self->_mapRegion, !((unint64_t)mapRegion | v4[5]))
     || -[GEOMapRegionE7 isEqual:](mapRegion, "isEqual:"))
    && ((definedPlateTypes = self->_definedPlateTypes, !((unint64_t)definedPlateTypes | v4[3]))
     || -[NSMutableArray isEqual:](definedPlateTypes, "isEqual:")))
  {
    convertRules = self->_convertRules;
    if ((unint64_t)convertRules | v4[2]) {
      char v10 = -[NSMutableArray isEqual:](convertRules, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOLPRRestrictionRegion *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t v5 = [(GEOMapRegionE7 *)self->_mapRegion hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_definedPlateTypes hash];
  return v6 ^ [(NSMutableArray *)self->_convertRules hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEOLPRRestrictionRegion setIdentifier:](self, "setIdentifier:");
  }
  if (v4[6]) {
    -[GEOLPRRestrictionRegion setName:](self, "setName:");
  }
  mapRegion = self->_mapRegion;
  id v6 = v4[5];
  if (mapRegion)
  {
    if (v6) {
      -[GEOMapRegionE7 mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOLPRRestrictionRegion setMapRegion:](self, "setMapRegion:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4[3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOLPRRestrictionRegion *)self addDefinedPlateTypes:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4[2];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEOLPRRestrictionRegion addConvertRule:](self, "addConvertRule:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_definedPlateTypes, 0);
  objc_storeStrong((id *)&self->_convertRules, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end