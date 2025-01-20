@interface GEORegionalResourceTile
+ (BOOL)isValid:(id)a3;
+ (Class)attributionType;
+ (Class)childrenType;
+ (Class)iconChecksumType;
+ (Class)iconType;
- (BOOL)containsTileKey:(uint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORegionalResourceTile)init;
- (GEORegionalResourceTile)initWithData:(id)a3;
- (GEORegionalResourceTile)initWithDictionary:(id)a3;
- (GEORegionalResourceTile)initWithJSON:(id)a3;
- (NSMutableArray)attributions;
- (NSMutableArray)childrens;
- (NSMutableArray)iconChecksums;
- (NSMutableArray)icons;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributionAtIndex:(unint64_t)a3;
- (id)childrenAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)iconAtIndex:(unint64_t)a3;
- (id)iconChecksumAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)attributionsCount;
- (unint64_t)childrensCount;
- (unint64_t)hash;
- (unint64_t)iconChecksumsCount;
- (unint64_t)iconsCount;
- (unsigned)x;
- (unsigned)y;
- (unsigned)z;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsChildren:(uint64_t)a1;
- (void)_addNoFlagsIcon:(uint64_t)a1;
- (void)_addNoFlagsIconChecksum:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAttributions;
- (void)_readChildrens;
- (void)_readIconChecksums;
- (void)_readIcons;
- (void)addAttribution:(id)a3;
- (void)addChildren:(id)a3;
- (void)addIcon:(id)a3;
- (void)addIconChecksum:(id)a3;
- (void)clearAttributions;
- (void)clearChildrens;
- (void)clearIconChecksums;
- (void)clearIcons;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributions:(id)a3;
- (void)setChildrens:(id)a3;
- (void)setIconChecksums:(id)a3;
- (void)setIcons:(id)a3;
- (void)setX:(unsigned int)a3;
- (void)setY:(unsigned int)a3;
- (void)setZ:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORegionalResourceTile

- (GEORegionalResourceTile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResourceTile;
  v2 = [(GEORegionalResourceTile *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORegionalResourceTile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResourceTile;
  v3 = [(GEORegionalResourceTile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)x
{
  return self->_x;
}

- (void)setX:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_x = a3;
}

- (unsigned)y
{
  return self->_y;
}

- (void)setY:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_y = a3;
}

- (unsigned)z
{
  return self->_z;
}

- (void)setZ:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_z = a3;
}

- (void)_readChildrens
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildrens_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)childrens
{
  -[GEORegionalResourceTile _readChildrens]((uint64_t)self);
  childrens = self->_childrens;

  return childrens;
}

- (void)setChildrens:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  childrens = self->_childrens;
  self->_childrens = v4;
}

- (void)clearChildrens
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  childrens = self->_childrens;

  [(NSMutableArray *)childrens removeAllObjects];
}

- (void)addChildren:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTile _readChildrens]((uint64_t)self);
  -[GEORegionalResourceTile _addNoFlagsChildren:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsChildren:(uint64_t)a1
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

- (unint64_t)childrensCount
{
  -[GEORegionalResourceTile _readChildrens]((uint64_t)self);
  childrens = self->_childrens;

  return [(NSMutableArray *)childrens count];
}

- (id)childrenAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTile _readChildrens]((uint64_t)self);
  childrens = self->_childrens;

  return (id)[(NSMutableArray *)childrens objectAtIndex:a3];
}

+ (Class)childrenType
{
  return (Class)objc_opt_class();
}

- (void)_readIcons
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcons_tags_1292);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)icons
{
  -[GEORegionalResourceTile _readIcons]((uint64_t)self);
  icons = self->_icons;

  return icons;
}

- (void)setIcons:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  icons = self->_icons;
  self->_icons = v4;
}

- (void)clearIcons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  icons = self->_icons;

  [(NSMutableArray *)icons removeAllObjects];
}

- (void)addIcon:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTile _readIcons]((uint64_t)self);
  -[GEORegionalResourceTile _addNoFlagsIcon:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconsCount
{
  -[GEORegionalResourceTile _readIcons]((uint64_t)self);
  icons = self->_icons;

  return [(NSMutableArray *)icons count];
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTile _readIcons]((uint64_t)self);
  icons = self->_icons;

  return (id)[(NSMutableArray *)icons objectAtIndex:a3];
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags_1293);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)attributions
{
  -[GEORegionalResourceTile _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return attributions;
}

- (void)setAttributions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  attributions = self->_attributions;
  self->_attributions = v4;
}

- (void)clearAttributions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  attributions = self->_attributions;

  [(NSMutableArray *)attributions removeAllObjects];
}

- (void)addAttribution:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTile _readAttributions]((uint64_t)self);
  -[GEORegionalResourceTile _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
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

- (unint64_t)attributionsCount
{
  -[GEORegionalResourceTile _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return [(NSMutableArray *)attributions count];
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTile _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return (id)[(NSMutableArray *)attributions objectAtIndex:a3];
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconChecksums_tags_1294);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEORegionalResourceTile _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;
}

- (void)clearIconChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  iconChecksums = self->_iconChecksums;

  [(NSMutableArray *)iconChecksums removeAllObjects];
}

- (void)addIconChecksum:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTile _readIconChecksums]((uint64_t)self);
  -[GEORegionalResourceTile _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconChecksumsCount
{
  -[GEORegionalResourceTile _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return [(NSMutableArray *)iconChecksums count];
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTile _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return (id)[(NSMutableArray *)iconChecksums objectAtIndex:a3];
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORegionalResourceTile;
  id v4 = [(GEORegionalResourceTile *)&v8 description];
  id v5 = [(GEORegionalResourceTile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResourceTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    [v4 setObject:v5 forKey:@"x"];

    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    [v4 setObject:v6 forKey:@"y"];

    id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    [v4 setObject:v7 forKey:@"z"];

    if ([*(id *)(a1 + 32) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v40 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"children"];
    }
    if (*(void *)(a1 + 48))
    {
      v16 = [(id)a1 icons];
      [v4 setObject:v16 forKey:@"icon"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = *(id *)(a1 + 24);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v20);
      }

      [v4 setObject:v17 forKey:@"attribution"];
    }
    if (*(void *)(a1 + 40))
    {
      v25 = [(id)a1 iconChecksums];
      [v4 setObject:v25 forKey:@"iconChecksum"];
    }
    v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __53__GEORegionalResourceTile__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        v28 = v31;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
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
  return -[GEORegionalResourceTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEORegionalResourceTile__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORegionalResourceTile)initWithDictionary:(id)a3
{
  return (GEORegionalResourceTile *)-[GEORegionalResourceTile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setX:", objc_msgSend(v6, "unsignedIntValue"));
      }

      id v7 = [v5 objectForKeyedSubscript:@"y"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setY:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"z"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZ:", objc_msgSend(v8, "unsignedIntValue"));
      }

      id v9 = [v5 objectForKeyedSubscript:@"children"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v65 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v59 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [GEORegionalResourceTile alloc];
                if (a3) {
                  uint64_t v17 = [(GEORegionalResourceTile *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEORegionalResourceTile *)v16 initWithDictionary:v15];
                }
                id v18 = (void *)v17;
                [a1 addChildren:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v65 count:16];
          }
          while (v12);
        }
      }
      uint64_t v19 = [v5 objectForKeyedSubscript:@"icon"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v55 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v26 = (void *)[v25 copy];
                [a1 addIcon:v26];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v22);
        }
      }
      v27 = [v5 objectForKeyedSubscript:@"attribution"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v51;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v51 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v50 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v34 = [GEOAttribution alloc];
                if (a3) {
                  uint64_t v35 = [(GEOAttribution *)v34 initWithJSON:v33];
                }
                else {
                  uint64_t v35 = [(GEOAttribution *)v34 initWithDictionary:v33];
                }
                long long v36 = (void *)v35;
                [a1 addAttribution:v35];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v63 count:16];
          }
          while (v30);
        }
      }
      long long v37 = [v5 objectForKeyedSubscript:@"iconChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v46 objects:v62 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v47;
          do
          {
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(void *)v47 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v46 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v44 = (void *)[v43 copy];
                [a1 addIconChecksum:v44];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v46 objects:v62 count:16];
          }
          while (v40);
        }
      }
    }
  }

  return a1;
}

- (GEORegionalResourceTile)initWithJSON:(id)a3
{
  return (GEORegionalResourceTile *)-[GEORegionalResourceTile _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1307;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1308;
    }
    GEORegionalResourceTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORegionalResourceTileCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORegionalResourceTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORegionalResourceTileReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORegionalResourceTileIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v22 = self->_reader;
    objc_sync_enter(v22);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v23 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v23];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORegionalResourceTile *)self readAll:0];
    PBDataWriterWriteUint32Field();
    PBDataWriterWriteUint32Field();
    PBDataWriterWriteUint32Field();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    objc_super v6 = self->_childrens;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v7);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = self->_icons;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v14 = self->_attributions;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v15);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = self->_iconChecksums;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v19);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v20 = (id *)a3;
  [(GEORegionalResourceTile *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 14) = self->_readerMarkPos;
  *((_DWORD *)v20 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v20 + 17) = self->_x;
  *((_DWORD *)v20 + 18) = self->_y;
  *((_DWORD *)v20 + 19) = self->_z;
  if ([(GEORegionalResourceTile *)self childrensCount])
  {
    [v20 clearChildrens];
    unint64_t v4 = [(GEORegionalResourceTile *)self childrensCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORegionalResourceTile *)self childrenAtIndex:i];
        [v20 addChildren:v7];
      }
    }
  }
  if ([(GEORegionalResourceTile *)self iconsCount])
  {
    [v20 clearIcons];
    unint64_t v8 = [(GEORegionalResourceTile *)self iconsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORegionalResourceTile *)self iconAtIndex:j];
        [v20 addIcon:v11];
      }
    }
  }
  if ([(GEORegionalResourceTile *)self attributionsCount])
  {
    [v20 clearAttributions];
    unint64_t v12 = [(GEORegionalResourceTile *)self attributionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEORegionalResourceTile *)self attributionAtIndex:k];
        [v20 addAttribution:v15];
      }
    }
  }
  if ([(GEORegionalResourceTile *)self iconChecksumsCount])
  {
    [v20 clearIconChecksums];
    unint64_t v16 = [(GEORegionalResourceTile *)self iconChecksumsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEORegionalResourceTile *)self iconChecksumAtIndex:m];
        [v20 addIconChecksum:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORegionalResourceTileReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORegionalResourceTile *)self readAll:0];
  *(_DWORD *)(v5 + 68) = self->_x;
  *(_DWORD *)(v5 + 72) = self->_y;
  *(_DWORD *)(v5 + 76) = self->_z;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v8 = self->_childrens;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addChildren:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v9);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v13 = self->_icons;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addIcon:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = self->_attributions;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAttribution:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v23 = self->_iconChecksums;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * m), "copyWithZone:", a3, (void)v29);
        [(id)v5 addIconChecksum:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v24);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORegionalResourceTile *)self readAll:1],
        [v4 readAll:1],
        self->_x == *((_DWORD *)v4 + 17))
    && self->_y == *((_DWORD *)v4 + 18)
    && self->_z == *((_DWORD *)v4 + 19)
    && ((childrens = self->_childrens, !((unint64_t)childrens | v4[4]))
     || -[NSMutableArray isEqual:](childrens, "isEqual:"))
    && ((icons = self->_icons, !((unint64_t)icons | v4[6]))
     || -[NSMutableArray isEqual:](icons, "isEqual:"))
    && ((attributions = self->_attributions, !((unint64_t)attributions | v4[3]))
     || -[NSMutableArray isEqual:](attributions, "isEqual:")))
  {
    iconChecksums = self->_iconChecksums;
    if ((unint64_t)iconChecksums | v4[5]) {
      char v9 = -[NSMutableArray isEqual:](iconChecksums, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEORegionalResourceTile *)self readAll:1];
  uint64_t v3 = (2654435761 * self->_y) ^ (2654435761 * self->_x);
  uint64_t v4 = 2654435761 * self->_z;
  uint64_t v5 = v3 ^ v4 ^ [(NSMutableArray *)self->_childrens hash];
  uint64_t v6 = [(NSMutableArray *)self->_icons hash];
  uint64_t v7 = v6 ^ [(NSMutableArray *)self->_attributions hash];
  return v5 ^ v7 ^ [(NSMutableArray *)self->_iconChecksums hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  self->_x = *((_DWORD *)v4 + 17);
  self->_y = *((_DWORD *)v4 + 18);
  self->_z = *((_DWORD *)v4 + 19);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORegionalResourceTile *)self addChildren:*(void *)(*((void *)&v37 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = *((id *)v4 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEORegionalResourceTile *)self addIcon:*(void *)(*((void *)&v33 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = *((id *)v4 + 3);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEORegionalResourceTile *)self addAttribution:*(void *)(*((void *)&v29 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *((id *)v4 + 5);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[GEORegionalResourceTile addIconChecksum:](self, "addIconChecksum:", *(void *)(*((void *)&v25 + 1) + 8 * v24++), (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORegionalResourceTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1312);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORegionalResourceTile *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_childrens;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_attributions;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_childrens, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)containsTileKey:(uint64_t)a3
{
  if (!a3) {
    return 0;
  }
  GEOTileKeyAssertIsStandard(a3);
  if ([a1 z] <= (*(_DWORD *)(a3 + 6) & 0x3Fu)
    && (int v5 = [a1 z],
        int v6 = *(unsigned __int8 *)(a3 + 15),
        int v7 = *(unsigned __int16 *)(a3 + 13),
        uint64_t v8 = *(unsigned int *)(a3 + 9),
        unint64_t v9 = *(void *)(a3 + 1),
        double v10 = ldexp(1.0, v5 - ((v9 >> 40) & 0x3F)),
        [a1 x] == (v10
                                                            * (double)(((v9 >> 46) | (v8 << 18)) & 0x3FFFFFF))))
  {
    return [a1 y] == (v10
                                                               * (double)(((v8 | ((unint64_t)(v7 | (v6 << 16)) << 32)) >> 8) & 0x3FFFFFF));
  }
  else
  {
    return 0;
  }
}

@end