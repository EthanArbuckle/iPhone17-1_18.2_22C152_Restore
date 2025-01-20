@interface GEOBusinessOptions
+ (BOOL)isValid:(id)a3;
+ (Class)attributeKeyType;
+ (Class)photoOptionsType;
- (BOOL)hasIncludeBusinessHours;
- (BOOL)hasIncludeCenter;
- (BOOL)hasMaxBusinessResults;
- (BOOL)includeBusinessHours;
- (BOOL)includeCenter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOBusinessOptions)init;
- (GEOBusinessOptions)initWithData:(id)a3;
- (GEOBusinessOptions)initWithDictionary:(id)a3;
- (GEOBusinessOptions)initWithJSON:(id)a3;
- (NSMutableArray)attributeKeys;
- (NSMutableArray)photoOptions;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributeKeyAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoOptionsAtIndex:(unint64_t)a3;
- (int)maxBusinessResults;
- (unint64_t)attributeKeysCount;
- (unint64_t)hash;
- (unint64_t)photoOptionsCount;
- (void)_addNoFlagsAttributeKey:(uint64_t)a1;
- (void)_addNoFlagsPhotoOptions:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAttributeKeys;
- (void)_readPhotoOptions;
- (void)addAttributeKey:(id)a3;
- (void)addPhotoOptions:(id)a3;
- (void)clearAttributeKeys;
- (void)clearPhotoOptions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributeKeys:(id)a3;
- (void)setHasIncludeBusinessHours:(BOOL)a3;
- (void)setHasIncludeCenter:(BOOL)a3;
- (void)setHasMaxBusinessResults:(BOOL)a3;
- (void)setIncludeBusinessHours:(BOOL)a3;
- (void)setIncludeCenter:(BOOL)a3;
- (void)setMaxBusinessResults:(int)a3;
- (void)setPhotoOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBusinessOptions

- (GEOBusinessOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBusinessOptions;
  v2 = [(GEOBusinessOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusinessOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBusinessOptions;
  v3 = [(GEOBusinessOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhotoOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)photoOptions
{
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  photoOptions = self->_photoOptions;

  return photoOptions;
}

- (void)setPhotoOptions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  photoOptions = self->_photoOptions;
  self->_photoOptions = v4;
}

- (void)clearPhotoOptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  photoOptions = self->_photoOptions;

  [(NSMutableArray *)photoOptions removeAllObjects];
}

- (void)addPhotoOptions:(id)a3
{
  id v4 = a3;
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  -[GEOBusinessOptions _addNoFlagsPhotoOptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsPhotoOptions:(uint64_t)a1
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

- (unint64_t)photoOptionsCount
{
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  photoOptions = self->_photoOptions;

  return [(NSMutableArray *)photoOptions count];
}

- (id)photoOptionsAtIndex:(unint64_t)a3
{
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  photoOptions = self->_photoOptions;

  return (id)[(NSMutableArray *)photoOptions objectAtIndex:a3];
}

+ (Class)photoOptionsType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributeKeys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)attributeKeys
{
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  attributeKeys = self->_attributeKeys;

  return attributeKeys;
}

- (void)setAttributeKeys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  attributeKeys = self->_attributeKeys;
  self->_attributeKeys = v4;
}

- (void)clearAttributeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  attributeKeys = self->_attributeKeys;

  [(NSMutableArray *)attributeKeys removeAllObjects];
}

- (void)addAttributeKey:(id)a3
{
  id v4 = a3;
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  -[GEOBusinessOptions _addNoFlagsAttributeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsAttributeKey:(uint64_t)a1
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

- (unint64_t)attributeKeysCount
{
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  attributeKeys = self->_attributeKeys;

  return [(NSMutableArray *)attributeKeys count];
}

- (id)attributeKeyAtIndex:(unint64_t)a3
{
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  attributeKeys = self->_attributeKeys;

  return (id)[(NSMutableArray *)attributeKeys objectAtIndex:a3];
}

+ (Class)attributeKeyType
{
  return (Class)objc_opt_class();
}

- (BOOL)includeBusinessHours
{
  return self->_includeBusinessHours;
}

- (void)setIncludeBusinessHours:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_includeBusinessHours = a3;
}

- (void)setHasIncludeBusinessHours:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncludeBusinessHours
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)maxBusinessResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_maxBusinessResults;
  }
  else {
    return 1;
  }
}

- (void)setMaxBusinessResults:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_maxBusinessResults = a3;
}

- (void)setHasMaxBusinessResults:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasMaxBusinessResults
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)includeCenter
{
  return self->_includeCenter;
}

- (void)setIncludeCenter:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_includeCenter = a3;
}

- (void)setHasIncludeCenter:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIncludeCenter
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBusinessOptions;
  id v4 = [(GEOBusinessOptions *)&v8 description];
  id v5 = [(GEOBusinessOptions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBusinessOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_24;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }

    [v4 setObject:v5 forKey:@"photoOptions"];
  }
  if (*(void *)(a1 + 24))
  {
    v13 = [(id)a1 attributeKeys];
    [v4 setObject:v13 forKey:@"attributeKey"];
  }
  char v14 = *(unsigned char *)(a1 + 60);
  if ((v14 & 2) != 0)
  {
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    [v4 setObject:v23 forKey:@"includeBusinessHours"];

    char v14 = *(unsigned char *)(a1 + 60);
    if ((v14 & 1) == 0)
    {
LABEL_18:
      if ((v14 & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)(a1 + 60) & 1) == 0)
  {
    goto LABEL_18;
  }
  v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  [v4 setObject:v24 forKey:@"maxBusinessResults"];

  if ((*(unsigned char *)(a1 + 60) & 4) != 0)
  {
LABEL_19:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
    [v4 setObject:v15 forKey:@"includeCenter"];
  }
LABEL_20:
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    v17 = [v16 dictionaryRepresentation];
    v18 = v17;
    if (a2)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __48__GEOBusinessOptions__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v20 = v19;
      id v26 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v25];
      id v21 = v20;

      v18 = v21;
    }
    [v4 setObject:v18 forKey:@"Unknown Fields"];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBusinessOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOBusinessOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOBusinessOptions)initWithDictionary:(id)a3
{
  return (GEOBusinessOptions *)-[GEOBusinessOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"photoOptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v5;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOPhotoOptions alloc];
                if (a3) {
                  uint64_t v14 = [(GEOPhotoOptions *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOPhotoOptions *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addPhotoOptions:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }
          while (v9);
        }

        id v5 = v28;
      }

      v16 = [v5 objectForKeyedSubscript:@"attributeKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = (void *)[v22 copy];
                [a1 addAttributeKey:v23];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v19);
        }
      }
      v24 = [v5 objectForKeyedSubscript:@"includeBusinessHours"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeBusinessHours:", objc_msgSend(v24, "BOOLValue"));
      }

      v25 = [v5 objectForKeyedSubscript:@"maxBusinessResults"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxBusinessResults:", objc_msgSend(v25, "intValue"));
      }

      id v26 = [v5 objectForKeyedSubscript:@"includeCenter"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncludeCenter:", objc_msgSend(v26, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOBusinessOptions)initWithJSON:(id)a3
{
  return (GEOBusinessOptions *)-[GEOBusinessOptions _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_438;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_439;
    }
    GEOBusinessOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOBusinessOptionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBusinessOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusinessOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x70) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBusinessOptions *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_photoOptions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = self->_attributeKeys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (void)copyTo:(id)a3
{
  v13 = (id *)a3;
  [(GEOBusinessOptions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 10) = self->_readerMarkPos;
  *((_DWORD *)v13 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOBusinessOptions *)self photoOptionsCount])
  {
    [v13 clearPhotoOptions];
    unint64_t v4 = [(GEOBusinessOptions *)self photoOptionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOBusinessOptions *)self photoOptionsAtIndex:i];
        [v13 addPhotoOptions:v7];
      }
    }
  }
  if ([(GEOBusinessOptions *)self attributeKeysCount])
  {
    [v13 clearAttributeKeys];
    unint64_t v8 = [(GEOBusinessOptions *)self attributeKeysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOBusinessOptions *)self attributeKeyAtIndex:j];
        [v13 addAttributeKey:v11];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v13 + 56) = self->_includeBusinessHours;
    *((unsigned char *)v13 + 60) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_11:
      if ((flags & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v13 + 13) = self->_maxBusinessResults;
  *((unsigned char *)v13 + 60) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_12:
    *((unsigned char *)v13 + 57) = self->_includeCenter;
    *((unsigned char *)v13 + 60) |= 4u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBusinessOptions *)self readAll:0];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v9 = self->_photoOptions;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addPhotoOptions:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = self->_attributeKeys;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
          [(id)v5 addAttributeKey:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(unsigned char *)(v5 + 56) = self->_includeBusinessHours;
      *(unsigned char *)(v5 + 60) |= 2u;
      char flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_21:
        if ((flags & 4) == 0)
        {
LABEL_23:
          long long v20 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v20;
          goto LABEL_24;
        }
LABEL_22:
        *(unsigned char *)(v5 + 57) = self->_includeCenter;
        *(unsigned char *)(v5 + 60) |= 4u;
        goto LABEL_23;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      goto LABEL_21;
    }
    *(_DWORD *)(v5 + 52) = self->_maxBusinessResults;
    *(unsigned char *)(v5 + 60) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOBusinessOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOBusinessOptions *)self readAll:1];
  [v4 readAll:1];
  photoOptions = self->_photoOptions;
  if ((unint64_t)photoOptions | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](photoOptions, "isEqual:")) {
      goto LABEL_21;
    }
  }
  attributeKeys = self->_attributeKeys;
  if ((unint64_t)attributeKeys | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](attributeKeys, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_21;
    }
    if (self->_includeBusinessHours)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_maxBusinessResults != *((_DWORD *)v4 + 13)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_21;
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) != 0)
    {
      if (self->_includeCenter)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_21;
        }
      }
      else if (*((unsigned char *)v4 + 57))
      {
        goto LABEL_21;
      }
      BOOL v7 = 1;
      goto LABEL_22;
    }
LABEL_21:
    BOOL v7 = 0;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  [(GEOBusinessOptions *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_photoOptions hash];
  uint64_t v4 = [(NSMutableArray *)self->_attributeKeys hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_includeBusinessHours;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_maxBusinessResults;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_includeCenter;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOBusinessOptions *)self addPhotoOptions:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOBusinessOptions addAttributeKey:](self, "addAttributeKey:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char v15 = *((unsigned char *)v4 + 60);
  if ((v15 & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0) {
      goto LABEL_17;
    }
LABEL_21:
    self->_maxBusinessResults = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  self->_includeBusinessHours = *((unsigned char *)v4 + 56);
  *(unsigned char *)&self->_flags |= 2u;
  char v15 = *((unsigned char *)v4 + 60);
  if (v15) {
    goto LABEL_21;
  }
LABEL_17:
  if ((v15 & 4) != 0)
  {
LABEL_18:
    self->_includeCenter = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_19:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOBusinessOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_443);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOBusinessOptions *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_photoOptions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoOptions, 0);
  objc_storeStrong((id *)&self->_attributeKeys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end