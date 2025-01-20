@interface GEOPDPlaceSummaryLayoutMetadata
+ (BOOL)isValid:(id)a3;
+ (Class)dyanmicContextServerOverrideType;
+ (Class)layoutTemplatePairType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasUseCaseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutMetadata)init;
- (GEOPDPlaceSummaryLayoutMetadata)initWithData:(id)a3;
- (GEOPDPlaceSummaryLayoutMetadata)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutMetadata)initWithJSON:(id)a3;
- (NSMutableArray)dyanmicContextServerOverrides;
- (NSMutableArray)layoutTemplatePairs;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dyanmicContextServerOverrideAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)layoutTemplatePairAtIndex:(unint64_t)a3;
- (id)useCaseTypeAsString:(int)a3;
- (int)StringAsUseCaseType:(id)a3;
- (int)useCaseType;
- (unint64_t)dyanmicContextServerOverridesCount;
- (unint64_t)hash;
- (unint64_t)layoutTemplatePairsCount;
- (void)_addNoFlagsDyanmicContextServerOverride:(uint64_t)a1;
- (void)_addNoFlagsLayoutTemplatePair:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDyanmicContextServerOverrides;
- (void)_readLayoutTemplatePairs;
- (void)addDyanmicContextServerOverride:(id)a3;
- (void)addLayoutTemplatePair:(id)a3;
- (void)clearDyanmicContextServerOverrides;
- (void)clearLayoutTemplatePairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDyanmicContextServerOverrides:(id)a3;
- (void)setHasUseCaseType:(BOOL)a3;
- (void)setLayoutTemplatePairs:(id)a3;
- (void)setUseCaseType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutMetadata

- (GEOPDPlaceSummaryLayoutMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutMetadata;
  v2 = [(GEOPDPlaceSummaryLayoutMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutMetadata;
  v3 = [(GEOPDPlaceSummaryLayoutMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)useCaseType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_useCaseType;
  }
  else {
    return 0;
  }
}

- (void)setUseCaseType:(int)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_useCaseType = a3;
}

- (void)setHasUseCaseType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasUseCaseType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)useCaseTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E6220[a3];
  }

  return v3;
}

- (int)StringAsUseCaseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE_SUMMARY_USE_CASE_TYPE_UNKNONWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_USE_CASE_TYPE_AUTOCOMPLETE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_USE_CASE_TYPE_SEARCH"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLayoutTemplatePairs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayoutTemplatePairs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)layoutTemplatePairs
{
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  layoutTemplatePairs = self->_layoutTemplatePairs;

  return layoutTemplatePairs;
}

- (void)setLayoutTemplatePairs:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  layoutTemplatePairs = self->_layoutTemplatePairs;
  self->_layoutTemplatePairs = v4;
}

- (void)clearLayoutTemplatePairs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  layoutTemplatePairs = self->_layoutTemplatePairs;

  [(NSMutableArray *)layoutTemplatePairs removeAllObjects];
}

- (void)addLayoutTemplatePair:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutMetadata _addNoFlagsLayoutTemplatePair:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsLayoutTemplatePair:(uint64_t)a1
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

- (unint64_t)layoutTemplatePairsCount
{
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  layoutTemplatePairs = self->_layoutTemplatePairs;

  return [(NSMutableArray *)layoutTemplatePairs count];
}

- (id)layoutTemplatePairAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  layoutTemplatePairs = self->_layoutTemplatePairs;

  return (id)[(NSMutableArray *)layoutTemplatePairs objectAtIndex:a3];
}

+ (Class)layoutTemplatePairType
{
  return (Class)objc_opt_class();
}

- (void)_readDyanmicContextServerOverrides
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDyanmicContextServerOverrides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)dyanmicContextServerOverrides
{
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;

  return dyanmicContextServerOverrides;
}

- (void)setDyanmicContextServerOverrides:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;
  self->_dyanmicContextServerOverrides = v4;
}

- (void)clearDyanmicContextServerOverrides
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;

  [(NSMutableArray *)dyanmicContextServerOverrides removeAllObjects];
}

- (void)addDyanmicContextServerOverride:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutMetadata _addNoFlagsDyanmicContextServerOverride:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsDyanmicContextServerOverride:(uint64_t)a1
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

- (unint64_t)dyanmicContextServerOverridesCount
{
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;

  return [(NSMutableArray *)dyanmicContextServerOverrides count];
}

- (id)dyanmicContextServerOverrideAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;

  return (id)[(NSMutableArray *)dyanmicContextServerOverrides objectAtIndex:a3];
}

+ (Class)dyanmicContextServerOverrideType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutMetadata;
  id v4 = [(GEOPDPlaceSummaryLayoutMetadata *)&v8 description];
  id v5 = [(GEOPDPlaceSummaryLayoutMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = *(int *)(a1 + 44);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E6220[v5];
      }
      if (a2) {
        id v7 = @"useCaseType";
      }
      else {
        id v7 = @"use_case_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if ([*(id *)(a1 + 24) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = *(id *)(a1 + 24);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"layoutTemplatePair";
      }
      else {
        v16 = @"layout_template_pair";
      }
      [v4 setObject:v8 forKey:v16];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = *(id *)(a1 + 16);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"dyanmicContextServerOverride";
      }
      else {
        v25 = @"dyanmic_context_server_override";
      }
      [v4 setObject:v17 forKey:v25];
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
  return -[GEOPDPlaceSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutMetadata)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutMetadata *)-[GEOPDPlaceSummaryLayoutMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_53;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_53;
  }
  if (a3) {
    objc_super v6 = @"useCaseType";
  }
  else {
    objc_super v6 = @"use_case_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"PLACE_SUMMARY_USE_CASE_TYPE_UNKNONWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"PLACE_SUMMARY_USE_CASE_TYPE_AUTOCOMPLETE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"PLACE_SUMMARY_USE_CASE_TYPE_SEARCH"])
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_17:
    [a1 setUseCaseType:v9];
  }

  if (a3) {
    uint64_t v10 = @"layoutTemplatePair";
  }
  else {
    uint64_t v10 = @"layout_template_pair";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  id v33 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = [GEOPDPlaceSummaryResultLayoutTemplatePair alloc];
            if (a3) {
              uint64_t v19 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)v18 initWithDictionary:v17];
            }
            uint64_t v20 = (void *)v19;
            [a1 addLayoutTemplatePair:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v14);
    }

    id v5 = v33;
  }

  if (a3) {
    uint64_t v21 = @"dyanmicContextServerOverride";
  }
  else {
    uint64_t v21 = @"dyanmic_context_server_override";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v29 = [GEOPDPlaceSummaryDynamicContextServerOverride alloc];
            if (a3) {
              uint64_t v30 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)v29 initWithJSON:v28];
            }
            else {
              uint64_t v30 = [(GEOPDPlaceSummaryDynamicContextServerOverride *)v29 initWithDictionary:v28];
            }
            long long v31 = (void *)v30;
            [a1 addDyanmicContextServerOverride:v30];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v25);
    }

    id v5 = v33;
  }

LABEL_53:
  return a1;
}

- (GEOPDPlaceSummaryLayoutMetadata)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutMetadata *)-[GEOPDPlaceSummaryLayoutMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_225;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_226;
    }
    GEOPDPlaceSummaryLayoutMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryLayoutMetadataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceSummaryLayoutMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDPlaceSummaryLayoutMetadata *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_layoutTemplatePairs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_dyanmicContextServerOverrides;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_dyanmicContextServerOverrides;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_layoutTemplatePairs;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOPDPlaceSummaryLayoutMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 11) = self->_useCaseType;
    *((unsigned char *)v12 + 48) |= 1u;
  }
  if ([(GEOPDPlaceSummaryLayoutMetadata *)self layoutTemplatePairsCount])
  {
    [v12 clearLayoutTemplatePairs];
    unint64_t v4 = [(GEOPDPlaceSummaryLayoutMetadata *)self layoutTemplatePairsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryLayoutMetadata *)self layoutTemplatePairAtIndex:i];
        [v12 addLayoutTemplatePair:v7];
      }
    }
  }
  if ([(GEOPDPlaceSummaryLayoutMetadata *)self dyanmicContextServerOverridesCount])
  {
    [v12 clearDyanmicContextServerOverrides];
    unint64_t v8 = [(GEOPDPlaceSummaryLayoutMetadata *)self dyanmicContextServerOverridesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDPlaceSummaryLayoutMetadata *)self dyanmicContextServerOverrideAtIndex:j];
        [v12 addDyanmicContextServerOverride:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDPlaceSummaryLayoutMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryLayoutMetadata *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_useCaseType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v9 = self->_layoutTemplatePairs;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLayoutTemplatePair:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = self->_dyanmicContextServerOverrides;
  uint64_t v14 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v8);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [(id)v5 addDyanmicContextServerOverride:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPDPlaceSummaryLayoutMetadata *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_useCaseType != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  layoutTemplatePairs = self->_layoutTemplatePairs;
  if ((unint64_t)layoutTemplatePairs | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](layoutTemplatePairs, "isEqual:"))
  {
    goto LABEL_11;
  }
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;
  if ((unint64_t)dyanmicContextServerOverrides | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](dyanmicContextServerOverrides, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutMetadata *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_useCaseType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_layoutTemplatePairs hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_dyanmicContextServerOverrides hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 48))
  {
    self->_useCaseType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDPlaceSummaryLayoutMetadata *)self addLayoutTemplatePair:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOPDPlaceSummaryLayoutMetadata addDyanmicContextServerOverride:](self, "addDyanmicContextServerOverride:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutTemplatePairs, 0);
  objc_storeStrong((id *)&self->_dyanmicContextServerOverrides, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end